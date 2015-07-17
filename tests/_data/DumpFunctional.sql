--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-17 14:39:24 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 239 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10573935)
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
-- TOC entry 228 (class 1259 OID 10574434)
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
-- TOC entry 227 (class 1259 OID 10574417)
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
-- TOC entry 221 (class 1259 OID 10574329)
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
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 10574114)
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
-- TOC entry 200 (class 1259 OID 10574148)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10574552)
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
-- TOC entry 192 (class 1259 OID 10574057)
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
-- TOC entry 229 (class 1259 OID 10574447)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    nasdelez numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostmat numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednostgostovsz numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskepravice numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
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
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stokroglihmiz integer,
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
-- TOC entry 216 (class 1259 OID 10574274)
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
-- TOC entry 195 (class 1259 OID 10574094)
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
-- TOC entry 199 (class 1259 OID 10574142)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10574074)
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
-- TOC entry 205 (class 1259 OID 10574191)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10574216)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10574031)
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
-- TOC entry 184 (class 1259 OID 10573944)
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
-- TOC entry 185 (class 1259 OID 10573955)
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
-- TOC entry 180 (class 1259 OID 10573909)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10573928)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10574223)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10574254)
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
-- TOC entry 224 (class 1259 OID 10574368)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    zacetek date,
    konec date,
    placilonavajo boolean,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    planiranostevilovaj integer,
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 187 (class 1259 OID 10573988)
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
-- TOC entry 189 (class 1259 OID 10574023)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10574197)
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
-- TOC entry 188 (class 1259 OID 10574008)
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
-- TOC entry 194 (class 1259 OID 10574086)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10574209)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10574512)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 232 (class 1259 OID 10574523)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10574493)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    zakljuceno boolean NOT NULL,
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
    sthonorarnihigrsamoz integer,
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
-- TOC entry 233 (class 1259 OID 10574531)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 212 (class 1259 OID 10574238)
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
-- TOC entry 204 (class 1259 OID 10574182)
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
-- TOC entry 203 (class 1259 OID 10574172)
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
-- TOC entry 223 (class 1259 OID 10574357)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10574306)
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
-- TOC entry 177 (class 1259 OID 10573880)
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
-- TOC entry 176 (class 1259 OID 10573878)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10574248)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10573918)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10573902)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10574262)
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
-- TOC entry 207 (class 1259 OID 10574203)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10574153)
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
-- TOC entry 238 (class 1259 OID 10574572)
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
-- TOC entry 237 (class 1259 OID 10574564)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10574559)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10574316)
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
-- TOC entry 186 (class 1259 OID 10573980)
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
-- TOC entry 202 (class 1259 OID 10574159)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 10574346)
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
-- TOC entry 234 (class 1259 OID 10574541)
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
-- TOC entry 191 (class 1259 OID 10574043)
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
-- TOC entry 178 (class 1259 OID 10573889)
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
-- TOC entry 226 (class 1259 OID 10574394)
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
-- TOC entry 196 (class 1259 OID 10574105)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10574230)
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
-- TOC entry 218 (class 1259 OID 10574299)
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
-- TOC entry 198 (class 1259 OID 10574137)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10574384)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10574289)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2213 (class 2604 OID 10573883)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2865 (class 0 OID 10573935)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 10574434)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a8-f77b-d9bb-9e30064fec8f	000d0000-55a8-f77b-74b0-d40c651606e7	\N	00090000-55a8-f77b-a4bd-50ce762b7ce9	000b0000-55a8-f77b-6a3c-2c21f5d2efd4	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a8-f77b-8e61-95b3ca2debe0	000d0000-55a8-f77b-2497-12bda591dd1a	00100000-55a8-f77b-582e-e0a0f75d0373	00090000-55a8-f77b-c6d5-a7010a26b657	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a8-f77b-5967-f3d703b5520e	000d0000-55a8-f77b-31ee-1f57950cc315	00100000-55a8-f77b-f902-dc464a7b492c	00090000-55a8-f77b-5a9c-701e96f912e5	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a8-f77b-d907-00aab6ea74f1	000d0000-55a8-f77b-68b1-79ef144eee3c	\N	00090000-55a8-f77b-0469-8b96cb7f4e55	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a8-f77b-660c-ebc71e08df73	000d0000-55a8-f77b-6c80-7b9c2a1426ca	\N	00090000-55a8-f77b-ade9-1a0cb7b510bf	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a8-f77b-0b1c-f806ea04c53c	000d0000-55a8-f77b-4aa4-7eb20ff6784c	\N	00090000-55a8-f77b-76a3-d5f868ffae43	000b0000-55a8-f77b-5248-ea9230601a22	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a8-f77b-0df1-28e0c191fe10	000d0000-55a8-f77b-3000-a94d38ede9b8	00100000-55a8-f77b-b269-09f14a1638ff	00090000-55a8-f77b-e19a-f6614514d803	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a8-f77b-47a0-75d02530426b	000d0000-55a8-f77b-3ff5-935f2e770ca4	\N	00090000-55a8-f77b-db3c-2627893a04c0	000b0000-55a8-f77b-0fd4-4947d0f72831	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2909 (class 0 OID 10574417)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 10574329)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a8-f77a-f369-a7bd28d00812	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a8-f77a-64e1-3cdc588539c4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a8-f77a-dfd1-4dd6faf00522	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2879 (class 0 OID 10574114)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a8-f77b-b935-f9b1050af956	\N	\N	00200000-55a8-f77b-9921-214ca422bf0c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a8-f77b-6d6a-9f45466b0ad7	\N	\N	00200000-55a8-f77b-89f5-4b695778edb5	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a8-f77b-429e-cb5605a785cd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a8-f77b-33c4-4af9dee88002	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a8-f77b-2132-23bb4f963f1f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2882 (class 0 OID 10574148)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 10574552)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 10574057)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a8-f779-647b-0a3ef30437b2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a8-f779-7919-2edca03de709	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a8-f779-23df-8b3ecf6de884	AL	ALB	008	Albania 	Albanija	\N
00040000-55a8-f779-eed8-c909b39953b8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a8-f779-2087-e85bdfd89ccb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a8-f779-fe38-7643f54e2d8b	AD	AND	020	Andorra 	Andora	\N
00040000-55a8-f779-1a24-65ab444dc8bb	AO	AGO	024	Angola 	Angola	\N
00040000-55a8-f779-0897-5874a6b9969d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a8-f779-4eba-74351d53640b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a8-f779-f0c7-d085c1765142	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-f779-49bd-f2b74d9311c7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a8-f779-024d-45abb7a45ce5	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a8-f779-1b5d-9372b0e763a4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a8-f779-c0ee-a0bd823ccffa	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a8-f779-e78e-c019e8fe6a7c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a8-f779-37d0-b9d53fb8b8ac	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a8-f779-bc70-1e7b30ef67a3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a8-f779-74be-616436123bbb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a8-f779-6464-4f7c1fbb6167	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a8-f779-91eb-9c01ff008185	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a8-f779-e2d2-c178760c606b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a8-f779-83c4-9eb81d54c7b5	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a8-f779-b8e8-f261ad4653ec	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a8-f779-5f6d-0e948052eaed	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a8-f779-5376-c5d56d668e6b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a8-f779-ac97-08fd89ea7bb6	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a8-f779-b678-3b8c7a8bb0b5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a8-f779-6736-d2f8e3420b82	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a8-f779-44b0-a2e4d6c26aa2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a8-f779-474e-35913787c74d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a8-f779-00bc-185b4b152c88	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a8-f779-68a5-56e5d4b49763	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a8-f779-912d-2df3fee999b8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a8-f779-f733-57612b80c36a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a8-f779-8215-f5cc3d6c617f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a8-f779-e646-885c751a3e22	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a8-f779-af5a-710205ba56cb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a8-f779-be33-e52fcfb63b07	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a8-f779-b9b5-7b814a8f08f4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a8-f779-a6b6-eb85e2d8b80b	CA	CAN	124	Canada 	Kanada	\N
00040000-55a8-f779-879a-0f64b0c50517	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a8-f779-cb6f-4d0afaa93489	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a8-f779-58c2-88e2b8b4d10a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a8-f779-1477-3c12019323a5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a8-f779-02d0-b54d5bbe39c2	CL	CHL	152	Chile 	Čile	\N
00040000-55a8-f779-99fb-6b852182b13d	CN	CHN	156	China 	Kitajska	\N
00040000-55a8-f779-2cf9-770045372a6a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a8-f779-a89b-5ec7aa2b3eae	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a8-f779-b5d7-e222c699edfa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a8-f779-788b-1acd11a6579c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a8-f779-acfe-78cafe004f82	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a8-f779-ba79-7b3737b0fb7e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a8-f779-c0b1-811f2acdecd2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a8-f779-1e51-abc3cf43c318	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a8-f779-31fa-35d870025303	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a8-f779-1093-5528992284d3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a8-f779-d8e4-39d105d39418	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a8-f779-4a98-6f38a252f8cd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a8-f779-bdbf-48c2970da4c2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a8-f779-7721-360bc4d19768	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a8-f779-fdf2-d5faa6e80902	DK	DNK	208	Denmark 	Danska	\N
00040000-55a8-f779-f9c6-14e5086d99a0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a8-f779-bf24-c66e2b1a5042	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-f779-93db-07c09d00a0fe	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a8-f779-3f97-7815718d6819	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a8-f779-39cb-7d527f512ee4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a8-f779-b96f-ea80014c5955	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a8-f779-9888-5aa89b8a97ef	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a8-f779-258c-274858ad315d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a8-f779-8f94-768ad752469f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a8-f779-12e5-b6e0b1b5f0cb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a8-f779-82dd-54565ddcfdd5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a8-f779-067b-9b6513a17f95	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a8-f779-9937-7c7bf2405c48	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a8-f779-ac43-e5564979a441	FI	FIN	246	Finland 	Finska	\N
00040000-55a8-f779-8ac9-d4b4d2af6faa	FR	FRA	250	France 	Francija	\N
00040000-55a8-f779-8ced-25176d545210	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a8-f779-afb8-c34afb98cd05	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a8-f779-d455-099af78fe4ba	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a8-f779-1231-8dc58c5d3fdb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a8-f779-edf4-6f60d31ea2e0	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a8-f779-e7f7-330e738cb944	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a8-f779-e7a7-268ca5260de0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a8-f779-624b-1a9f1ba48386	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a8-f779-f6c4-14297ad6a6f6	GH	GHA	288	Ghana 	Gana	\N
00040000-55a8-f779-b0ed-90071452fab2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a8-f779-b11b-fe7fd5202e17	GR	GRC	300	Greece 	Grčija	\N
00040000-55a8-f779-0d0a-5e1a7bb502fc	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a8-f779-a551-3afba2ace499	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a8-f779-a71d-346ff80adf5e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a8-f779-4789-020b81415b9f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a8-f779-913e-0f5e16c39d3b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a8-f779-1e99-e7d3110bc6ee	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a8-f779-2ef8-e129c8167961	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a8-f779-d14f-6acc98687b07	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a8-f779-853b-7dfa809a51fb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a8-f779-89fc-376a0c94e281	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a8-f779-8b14-87570a1f0b60	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a8-f779-7847-9e3f7b937c4f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a8-f779-b483-5cd8508fd53b	HN	HND	340	Honduras 	Honduras	\N
00040000-55a8-f779-6a26-3010eb9e1f2e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a8-f779-e4a9-66a12d81bc1a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a8-f779-340b-7d2b49035fa3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a8-f779-16c8-e63249dcb230	IN	IND	356	India 	Indija	\N
00040000-55a8-f779-c56b-a8336649850b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a8-f779-cfe2-c39ca9e622b3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a8-f779-6c8e-81e60c466106	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a8-f779-4db4-2ff4cabcd7e8	IE	IRL	372	Ireland 	Irska	\N
00040000-55a8-f779-79a6-e0e7a0eedd1a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a8-f779-d360-75c9ce2a6489	IL	ISR	376	Israel 	Izrael	\N
00040000-55a8-f779-b21d-f1a3dcb40a31	IT	ITA	380	Italy 	Italija	\N
00040000-55a8-f779-0422-fa6041fad69a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a8-f779-6e69-f701513a2c0a	JP	JPN	392	Japan 	Japonska	\N
00040000-55a8-f779-3297-5e7ac152efda	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a8-f779-9895-3898092e10dd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a8-f779-f32c-cb7cccf5db47	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a8-f779-3f1c-e078a3cfbdc0	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a8-f779-3327-369ddbdcee96	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a8-f779-bf6c-ae6a44e82e9d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a8-f779-880e-b3438d1ce2c9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a8-f779-7d2b-38abd2dafe76	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a8-f779-973b-33a7051126a4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a8-f779-ab4d-320cddf37ebd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a8-f779-bb72-8cca2eb32fa3	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a8-f779-e2ce-883eb6bea1b6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a8-f779-20fd-9c89da33d5b9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a8-f779-8c9a-4bda55221b08	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a8-f779-f877-895c69a3604e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a8-f779-7102-36bed9de7e35	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a8-f779-622c-77d08a9727cd	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a8-f779-7218-74d378e15461	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a8-f779-7be0-d13c2cdf95bb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a8-f779-3cb8-03327548e2bc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a8-f779-0b8c-50318c17004c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a8-f779-8a0b-6225cf014683	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a8-f779-ca5b-c4fdc86c0c6f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a8-f779-3cba-058da573ebbf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a8-f779-6371-9d0649f787a5	ML	MLI	466	Mali 	Mali	\N
00040000-55a8-f779-31b3-24e7df399aaf	MT	MLT	470	Malta 	Malta	\N
00040000-55a8-f779-ba60-e5176531297d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a8-f779-a816-1076a7d1494e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a8-f779-ac79-41f841c7c51e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a8-f779-885d-7f92db03b7f1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a8-f779-28ef-050d6e312e41	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a8-f779-a84c-c84cca512ba7	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a8-f779-4235-080d34f4fcae	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a8-f779-fdd1-223a92a8b5f9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a8-f779-eab2-779dc0730139	MC	MCO	492	Monaco 	Monako	\N
00040000-55a8-f779-ee3c-e8d8f61d7438	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a8-f779-0646-a5fa3257610e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a8-f779-84a2-72f3367462c9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a8-f779-5f70-6d58ed2f6f54	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a8-f779-f16f-b37e71ffa111	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a8-f779-3412-0350b8496715	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a8-f779-485b-8306b2082ee4	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a8-f779-b7e3-585950dff5c5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a8-f779-7039-d806076cf5ad	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a8-f779-4e97-b687be9c22de	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a8-f779-6701-76e2f217c3c1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a8-f779-90d4-6507dbfbb97c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a8-f779-756f-8043e5864b06	NE	NER	562	Niger 	Niger 	\N
00040000-55a8-f779-6b1c-c5e4f7c47b31	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a8-f779-ded6-a8cd93df67b1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a8-f779-ba43-75e5a2c9d94a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a8-f779-629f-a335e1d705b2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a8-f779-fce2-7379c1e909a3	NO	NOR	578	Norway 	Norveška	\N
00040000-55a8-f779-2cae-c64ca439e774	OM	OMN	512	Oman 	Oman	\N
00040000-55a8-f779-91b1-11cbf8e227cf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a8-f779-a113-c5d0e2a28fba	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a8-f779-73d7-38b3eff9d2da	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a8-f779-3cb9-27d8f158f001	PA	PAN	591	Panama 	Panama	\N
00040000-55a8-f779-c3ee-4e56711dd381	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a8-f779-b61b-1b657d4d0ce3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a8-f779-9f49-0ec7f7569e40	PE	PER	604	Peru 	Peru	\N
00040000-55a8-f779-ee5d-9b50089fc32a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a8-f779-1b46-7d3b984f71bd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a8-f779-4be6-b2bec48425c1	PL	POL	616	Poland 	Poljska	\N
00040000-55a8-f779-2db9-16ee70efef94	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a8-f779-0fbb-e6963d46a174	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a8-f779-cacb-d0b7f58c464c	QA	QAT	634	Qatar 	Katar	\N
00040000-55a8-f779-822f-0d7cb9102d1c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a8-f779-08a8-0f94069c0178	RO	ROU	642	Romania 	Romunija	\N
00040000-55a8-f779-2793-99bb1b380931	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a8-f779-a9c0-557198df1853	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a8-f779-121f-285f147e1074	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a8-f779-db3f-f975ce7a386f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a8-f779-2c5b-d3b107ea8cb7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a8-f779-3a98-2c59a6df852a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a8-f779-f3f5-c20f69fe17fe	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a8-f779-22b5-efe0d9f56118	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a8-f779-3ccd-c66050351610	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a8-f779-b5f6-b96923d9123a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a8-f779-aa54-63593884009f	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a8-f779-1c9e-01cf72b1ab75	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a8-f779-ed61-30e543ec7139	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a8-f779-d646-3cd7b926bc1f	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a8-f779-70a8-8f030414352d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a8-f779-7357-f91caf4018e4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a8-f779-e00d-f1c38e392ede	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a8-f779-4dcd-c16a5d4d4e7b	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a8-f779-25b7-ba79de646429	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a8-f779-5bda-0eb1a6b1e17c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a8-f779-97ba-8ae24f78684c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a8-f779-610e-9884c34d18f9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a8-f779-5212-eea697543bfa	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a8-f779-9c50-54331d641616	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a8-f779-d460-2e6030dde3cd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a8-f779-6cd8-eb5ba75302df	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a8-f779-2d64-ac6e7fe40b57	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a8-f779-e3c8-af97ed5e9224	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a8-f779-ab92-f828feadb244	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a8-f779-5736-6c87bb9caa7b	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a8-f779-c948-9f4613c9b3b2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a8-f779-1923-a25774ef3ee6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a8-f779-ec0a-60f461586c3b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a8-f779-b0d2-320ce46aa78d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a8-f779-126e-d4599f603108	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a8-f779-a40d-4563a8d8f64a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a8-f779-15b0-c19dfd7165d9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a8-f779-0228-dd9c87fc843f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a8-f779-86cd-37dca64ebfe4	TH	THA	764	Thailand 	Tajska	\N
00040000-55a8-f779-7039-cd55508c5a78	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a8-f779-54f5-2dfba49133cf	TG	TGO	768	Togo 	Togo	\N
00040000-55a8-f779-50a8-7cca0c1724e9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a8-f779-53d2-b1a5627afea9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a8-f779-4748-7afdd0bacb42	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a8-f779-f17f-21be05deb00c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a8-f779-808b-875fbe4e950d	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a8-f779-24a6-2b584e79b76f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a8-f779-a322-cddf854409c9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-f779-633e-d418225ec556	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a8-f779-b5f8-6c8d9c39dd16	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a8-f779-d3ad-1457a5fce4ae	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a8-f779-e012-30b243ceaf89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a8-f779-9a41-436b03bc3b42	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a8-f779-fa53-3d8bb27740de	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a8-f779-1597-9c987a8b9e97	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a8-f779-2d27-fc53def9065b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a8-f779-7987-e1760662acb7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a8-f779-4650-9a44facdc65a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a8-f779-8d44-260b770eb0b2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a8-f779-70ce-8c5914b74c21	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a8-f779-1db2-f4ca7a57510d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-f779-ea51-fccdc638eb90	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a8-f779-8502-cee097e89744	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a8-f779-b4a1-f46cac50818e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a8-f779-4600-623aac3a3713	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a8-f779-b394-ba8f5f27ba69	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a8-f779-f37d-7944c95f8fbd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2911 (class 0 OID 10574447)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a8-f77b-5b3f-d6a330416019	000e0000-55a8-f77b-5f66-f9d81dfb502f	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a8-f77a-d3bd-c78f3213ea95	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a8-f77b-ce6b-a806b4d5cf3c	000e0000-55a8-f77b-478a-76ee09a8726a	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a8-f77a-b325-058b1510e198	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-f77b-67d9-9e7698aa7471	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-f77b-786b-49a0c4c05437	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 10574274)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a8-f77b-3000-a94d38ede9b8	000e0000-55a8-f77b-478a-76ee09a8726a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a8-f77a-03f3-c3d28eb8ab69
000d0000-55a8-f77b-74b0-d40c651606e7	000e0000-55a8-f77b-478a-76ee09a8726a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-f77a-03f3-c3d28eb8ab69
000d0000-55a8-f77b-2497-12bda591dd1a	000e0000-55a8-f77b-478a-76ee09a8726a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a8-f77a-1b8f-5c2f72a53444
000d0000-55a8-f77b-31ee-1f57950cc315	000e0000-55a8-f77b-478a-76ee09a8726a	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a8-f77a-73e1-487461592325
000d0000-55a8-f77b-68b1-79ef144eee3c	000e0000-55a8-f77b-478a-76ee09a8726a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a8-f77a-73e1-487461592325
000d0000-55a8-f77b-6c80-7b9c2a1426ca	000e0000-55a8-f77b-478a-76ee09a8726a	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a8-f77a-73e1-487461592325
000d0000-55a8-f77b-4aa4-7eb20ff6784c	000e0000-55a8-f77b-478a-76ee09a8726a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-f77a-03f3-c3d28eb8ab69
000d0000-55a8-f77b-3ff5-935f2e770ca4	000e0000-55a8-f77b-478a-76ee09a8726a	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a8-f77a-4777-5ce56afadb41
\.


--
-- TOC entry 2877 (class 0 OID 10574094)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10574142)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10574074)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a8-f77b-c560-ba3f82205939	00080000-55a8-f77a-59dd-4e27b06df209	00090000-55a8-f77b-dca7-58ba63653f51	AK		
\.


--
-- TOC entry 2852 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 10574191)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 10574216)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 10574031)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a8-f779-629e-d48dc197011e	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a8-f779-0512-5f88dad6ca7f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a8-f779-e427-c56f7b10d05b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a8-f779-3fdb-616ef2d031c2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a8-f779-fbe7-617ef6ca84f0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a8-f779-ea5e-515fd7310df2	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a8-f779-5d76-286a3bf998c1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a8-f779-9305-268dcfa511f7	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-f779-9e2e-16d9022afb23	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-f779-694e-070efe620ef4	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a8-f779-6ba9-9dc927c2c177	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a8-f779-23d1-444832a08ef6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a8-f779-d593-6fa408671eda	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55a8-f77b-2e8e-3d9e7f997723	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a8-f77b-dcb1-cee7e14fc0dc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a8-f77b-7d91-f7e3ef32a077	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a8-f77b-ea9a-bba0834eb242	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a8-f77b-824b-caa519f0a06c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a8-f77b-034b-bc25dbb8c99a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2866 (class 0 OID 10573944)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a8-f77b-3712-b1ebaff65610	00000000-55a8-f77b-dcb1-cee7e14fc0dc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a8-f77b-fb1c-dd309226a354	00000000-55a8-f77b-dcb1-cee7e14fc0dc	00010000-55a8-f779-18e7-bf676e294f38	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a8-f77b-547c-608d1651c3df	00000000-55a8-f77b-7d91-f7e3ef32a077	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2867 (class 0 OID 10573955)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a8-f77b-a4bd-50ce762b7ce9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a8-f77b-0469-8b96cb7f4e55	00010000-55a8-f77b-8395-ea901e15fb9d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a8-f77b-5a9c-701e96f912e5	00010000-55a8-f77b-5a14-28d59b0b8901	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a8-f77b-7ce3-5d26125ba846	00010000-55a8-f77b-c967-815ce98ffad7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a8-f77b-ca2e-971f3f9d1215	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a8-f77b-76a3-d5f868ffae43	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a8-f77b-d4ba-722770a31dff	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a8-f77b-e19a-f6614514d803	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a8-f77b-dca7-58ba63653f51	00010000-55a8-f77b-3b1e-106504f42951	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a8-f77b-c6d5-a7010a26b657	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a8-f77b-8dae-d597b1191b66	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a8-f77b-ade9-1a0cb7b510bf	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a8-f77b-db3c-2627893a04c0	00010000-55a8-f77b-8c9e-7b39d6b4fc9c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2854 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10573909)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a8-f779-c505-430daeade8ef	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a8-f779-5041-fb06d71fc946	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a8-f779-f30c-3019114d1981	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a8-f779-9270-7c85af3360b4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a8-f779-18ec-24116189285e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a8-f779-eb57-c0e01480140e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a8-f779-10c0-5db05f331121	Abonma-read	Abonma - branje	f
00030000-55a8-f779-1285-c7f1aba32b36	Abonma-write	Abonma - spreminjanje	f
00030000-55a8-f779-346e-0d015c09468b	Alternacija-read	Alternacija - branje	f
00030000-55a8-f779-0cb1-7e5779d32c6a	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a8-f779-56b8-d12d2f64cf76	Arhivalija-read	Arhivalija - branje	f
00030000-55a8-f779-6550-223b84561357	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a8-f779-0fee-01ce23d1c88d	Besedilo-read	Besedilo - branje	f
00030000-55a8-f779-4212-33b52af34390	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a8-f779-105b-1c54d4eb6795	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a8-f779-f06a-a4e487919be8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a8-f779-0212-4858e391a987	Dogodek-read	Dogodek - branje	f
00030000-55a8-f779-7c75-2668dc3ee5f2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a8-f779-d630-5ef9191fce9f	DrugiVir-read	DrugiVir - branje	f
00030000-55a8-f779-9b75-d838eff12c5a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a8-f779-1fed-605e813406b4	Drzava-read	Drzava - branje	f
00030000-55a8-f779-491f-ea9293e26c88	Drzava-write	Drzava - spreminjanje	f
00030000-55a8-f779-fb94-a992c7223406	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a8-f779-32a3-af63781508dd	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a8-f779-5f58-78ec25657a3e	Funkcija-read	Funkcija - branje	f
00030000-55a8-f779-8d62-a68ba7fb507f	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a8-f779-dc49-15b999c417ea	Gostovanje-read	Gostovanje - branje	f
00030000-55a8-f779-46f3-cb387a1edba6	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a8-f779-d3fc-af423513322d	Gostujoca-read	Gostujoca - branje	f
00030000-55a8-f779-05ee-82c5c6afd195	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a8-f779-70b7-9d92b45e8529	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a8-f779-5397-a655d2b5ed82	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a8-f779-183a-174467a456af	Kupec-read	Kupec - branje	f
00030000-55a8-f779-dbf3-03e2ea256fe1	Kupec-write	Kupec - spreminjanje	f
00030000-55a8-f779-850b-4fda41bd34e0	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a8-f779-6187-5d3bbaef20c7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a8-f779-0bc5-2dffc791f418	Option-read	Option - branje	f
00030000-55a8-f779-902f-e317a7a95715	Option-write	Option - spreminjanje	f
00030000-55a8-f779-dad5-fae028b8d518	OptionValue-read	OptionValue - branje	f
00030000-55a8-f779-4802-01013b997e86	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a8-f779-e46f-720a9c5d0fde	Oseba-read	Oseba - branje	f
00030000-55a8-f779-2443-3327e5d323c0	Oseba-write	Oseba - spreminjanje	f
00030000-55a8-f779-af96-d78b503369e1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a8-f779-e6fb-fd2d97574882	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a8-f779-b9dc-d5e6dd8ee3d2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a8-f779-4bb6-86e158ef747f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a8-f779-536e-8fbe2b806c3b	Pogodba-read	Pogodba - branje	f
00030000-55a8-f779-e5d4-3bd3a7507bd3	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a8-f779-dfa7-3dcd22c1173b	Popa-read	Popa - branje	f
00030000-55a8-f779-f429-47bb13e47e9c	Popa-write	Popa - spreminjanje	f
00030000-55a8-f779-7448-f6b058f43ce7	Posta-read	Posta - branje	f
00030000-55a8-f779-a76b-5cf4a86bbadc	Posta-write	Posta - spreminjanje	f
00030000-55a8-f779-30c0-97a6a4d91542	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a8-f779-673a-02a2db410ce9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a8-f779-31e9-783db04f9e3b	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a8-f779-12fd-9d811106546f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a8-f779-f4b8-12cf059ade51	Predstava-read	Predstava - branje	f
00030000-55a8-f779-0b72-89a2b29dd5bd	Predstava-write	Predstava - spreminjanje	f
00030000-55a8-f779-cddd-f46d24f74609	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a8-f779-31dc-8bf3a50fc88d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a8-f779-9467-2d1e1ad6f015	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a8-f779-993d-0be34239f1b6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a8-f779-74ef-38240ccfa6ca	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a8-f779-edef-980067a79e6e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a8-f779-95e1-fbaeebb59529	ProgramDela-read	ProgramDela - branje	f
00030000-55a8-f779-fa4b-311a25972857	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a8-f779-8f97-9e4088dc726e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a8-f779-f917-4b222ea761af	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a8-f779-a518-9179cbca3a53	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a8-f779-ad24-c02f5527b7d0	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a8-f779-1780-64f0595ff3ef	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a8-f779-c1fd-00342aedd1ad	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a8-f779-afc9-4499e3b8c787	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a8-f779-969d-6b394fde5b1f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a8-f779-2eeb-1fb35975bc60	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a8-f779-08b2-e09837dea4e4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a8-f779-8879-36e8acddb291	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a8-f779-69e4-a5e8c50d3c18	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a8-f779-0452-156cdaf2a297	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a8-f779-7a7b-e292a1e08bc5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a8-f779-1b2d-94db3c6e0de7	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a8-f779-3136-d1fa5a558f31	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a8-f779-88cd-abb06cb2a713	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55a8-f779-4aed-16e00eff96a6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55a8-f779-a96e-e39729ace83a	Prostor-read	Prostor - branje	f
00030000-55a8-f779-5270-04799d627838	Prostor-write	Prostor - spreminjanje	f
00030000-55a8-f779-4fbf-b2180cae12c2	Racun-read	Racun - branje	f
00030000-55a8-f779-0d56-9aff1d6b0596	Racun-write	Racun - spreminjanje	f
00030000-55a8-f779-422f-4fe8a34a16bd	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a8-f779-7913-aa36d9022a52	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a8-f779-7ef1-9fc9941b51e6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a8-f779-c6b7-9471d0c61f7a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a8-f779-0f3f-b423c64868ff	Rekvizit-read	Rekvizit - branje	f
00030000-55a8-f779-6a9a-bd031075afd5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a8-f779-9d54-8f8e88e07624	Revizija-read	Revizija - branje	f
00030000-55a8-f779-091e-dc2cf62b1a67	Revizija-write	Revizija - spreminjanje	f
00030000-55a8-f779-bdac-20afa3648407	Rezervacija-read	Rezervacija - branje	f
00030000-55a8-f779-6f72-367da36ffb4c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a8-f779-42de-3db53625a962	SedezniRed-read	SedezniRed - branje	f
00030000-55a8-f779-dd4c-f737ccc443c2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a8-f779-eb20-7b1a304d5d6b	Sedez-read	Sedez - branje	f
00030000-55a8-f779-7809-906998591c4f	Sedez-write	Sedez - spreminjanje	f
00030000-55a8-f779-24f4-ff318d2f0d0e	Sezona-read	Sezona - branje	f
00030000-55a8-f779-3ac7-57c8e49c1752	Sezona-write	Sezona - spreminjanje	f
00030000-55a8-f779-bb9e-6d710983abf7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a8-f779-5715-17f9952cf947	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a8-f779-ce84-174dccfe7e4a	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a8-f779-35ad-331d3623616c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a8-f779-b32e-113f8051932a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a8-f779-6ab1-92bca433410e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a8-f779-082a-1aa2c43d5c3a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a8-f779-7adc-52e22d15fb29	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a8-f779-4ce2-9c8fba596831	Telefonska-read	Telefonska - branje	f
00030000-55a8-f779-25fb-df7b215da3d8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a8-f779-ae5a-444a76cf7a6b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a8-f779-624d-c10e454b4cfe	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a8-f779-3997-f0bc4245a950	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a8-f779-fd83-d8adfba907be	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a8-f779-cd7e-f30bc342af27	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a8-f779-cb5e-6db967c26f0f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a8-f779-6c6b-3a25ec205634	Trr-read	Trr - branje	f
00030000-55a8-f779-4d40-ad8cc7b427aa	Trr-write	Trr - spreminjanje	f
00030000-55a8-f779-f3f7-9eb3a39f7669	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a8-f779-0379-431047af9304	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a8-f779-d929-76a2df1b898a	Vaja-read	Vaja - branje	f
00030000-55a8-f779-3d7d-59e3ef430f58	Vaja-write	Vaja - spreminjanje	f
00030000-55a8-f779-92d3-944fc0ec4181	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a8-f779-a0d4-1b3be74a7632	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a8-f779-f518-3328ffa5e35b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a8-f779-6278-890385fd7a52	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a8-f779-5039-5b24e4b760f7	Zasedenost-read	Zasedenost - branje	f
00030000-55a8-f779-564b-45c48dc7e6fc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a8-f779-3d3b-4c3aec96088f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a8-f779-1ee5-a673ef269d85	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a8-f779-ee0a-cc9e856dae5e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a8-f779-906b-7bf190ea7c6d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2864 (class 0 OID 10573928)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a8-f779-4929-2f7c2718d4e5	00030000-55a8-f779-5041-fb06d71fc946
00020000-55a8-f779-b877-96d05ebd5fc1	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-1285-c7f1aba32b36
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-346e-0d015c09468b
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0cb1-7e5779d32c6a
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-9270-7c85af3360b4
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-7c75-2668dc3ee5f2
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-491f-ea9293e26c88
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-5f58-78ec25657a3e
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-8d62-a68ba7fb507f
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-46f3-cb387a1edba6
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-05ee-82c5c6afd195
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-70b7-9d92b45e8529
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-5397-a655d2b5ed82
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-e46f-720a9c5d0fde
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-2443-3327e5d323c0
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-f429-47bb13e47e9c
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-a76b-5cf4a86bbadc
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-31e9-783db04f9e3b
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-12fd-9d811106546f
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0b72-89a2b29dd5bd
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-74ef-38240ccfa6ca
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-edef-980067a79e6e
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-5270-04799d627838
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-c6b7-9471d0c61f7a
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-6a9a-bd031075afd5
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-3ac7-57c8e49c1752
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-3997-f0bc4245a950
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-f3f7-9eb3a39f7669
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-0379-431047af9304
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-d929-76a2df1b898a
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-3d7d-59e3ef430f58
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-5039-5b24e4b760f7
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-564b-45c48dc7e6fc
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f779-600b-6803ee47d72d	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-70b7-9d92b45e8529
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-5397-a655d2b5ed82
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-e46f-720a9c5d0fde
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-2443-3327e5d323c0
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-31e9-783db04f9e3b
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-12fd-9d811106546f
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-4ce2-9c8fba596831
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-25fb-df7b215da3d8
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-6c6b-3a25ec205634
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-4d40-ad8cc7b427aa
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-f518-3328ffa5e35b
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-6278-890385fd7a52
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f779-df9e-83c90ad2f97d	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-346e-0d015c09468b
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-6550-223b84561357
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-0fee-01ce23d1c88d
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-105b-1c54d4eb6795
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-5f58-78ec25657a3e
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-70b7-9d92b45e8529
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-e46f-720a9c5d0fde
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-74ef-38240ccfa6ca
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-3997-f0bc4245a950
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-d929-76a2df1b898a
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-5039-5b24e4b760f7
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f779-6737-cccc9d40a315	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-1285-c7f1aba32b36
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-0cb1-7e5779d32c6a
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-3997-f0bc4245a950
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f779-7a4a-b4aab34eb159	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-ae5a-444a76cf7a6b
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-f30c-3019114d1981
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-3997-f0bc4245a950
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f779-a3c6-6fb4ccd7b134	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-c505-430daeade8ef
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5041-fb06d71fc946
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f30c-3019114d1981
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-9270-7c85af3360b4
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-18ec-24116189285e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-eb57-c0e01480140e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-10c0-5db05f331121
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-1285-c7f1aba32b36
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-346e-0d015c09468b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0cb1-7e5779d32c6a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-56b8-d12d2f64cf76
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6550-223b84561357
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0fee-01ce23d1c88d
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4212-33b52af34390
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-105b-1c54d4eb6795
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f06a-a4e487919be8
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0212-4858e391a987
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7c75-2668dc3ee5f2
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-1fed-605e813406b4
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-491f-ea9293e26c88
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-d630-5ef9191fce9f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-9b75-d838eff12c5a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-fb94-a992c7223406
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-32a3-af63781508dd
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5f58-78ec25657a3e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-8d62-a68ba7fb507f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-dc49-15b999c417ea
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-46f3-cb387a1edba6
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-d3fc-af423513322d
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-05ee-82c5c6afd195
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-70b7-9d92b45e8529
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5397-a655d2b5ed82
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-183a-174467a456af
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-dbf3-03e2ea256fe1
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-850b-4fda41bd34e0
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6187-5d3bbaef20c7
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0bc5-2dffc791f418
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-902f-e317a7a95715
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-dad5-fae028b8d518
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4802-01013b997e86
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-e46f-720a9c5d0fde
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-2443-3327e5d323c0
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-af96-d78b503369e1
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-e6fb-fd2d97574882
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-b9dc-d5e6dd8ee3d2
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4bb6-86e158ef747f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-536e-8fbe2b806c3b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-e5d4-3bd3a7507bd3
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-dfa7-3dcd22c1173b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f429-47bb13e47e9c
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7448-f6b058f43ce7
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-a76b-5cf4a86bbadc
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-30c0-97a6a4d91542
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-673a-02a2db410ce9
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-31e9-783db04f9e3b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-12fd-9d811106546f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f4b8-12cf059ade51
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0b72-89a2b29dd5bd
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-cddd-f46d24f74609
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-31dc-8bf3a50fc88d
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-9467-2d1e1ad6f015
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-993d-0be34239f1b6
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-74ef-38240ccfa6ca
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-edef-980067a79e6e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-95e1-fbaeebb59529
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-fa4b-311a25972857
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-8f97-9e4088dc726e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f917-4b222ea761af
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-a518-9179cbca3a53
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-ad24-c02f5527b7d0
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-1780-64f0595ff3ef
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-c1fd-00342aedd1ad
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-afc9-4499e3b8c787
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-969d-6b394fde5b1f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-2eeb-1fb35975bc60
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-08b2-e09837dea4e4
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-8879-36e8acddb291
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-69e4-a5e8c50d3c18
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0452-156cdaf2a297
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7a7b-e292a1e08bc5
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-1b2d-94db3c6e0de7
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-3136-d1fa5a558f31
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-88cd-abb06cb2a713
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4aed-16e00eff96a6
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-a96e-e39729ace83a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5270-04799d627838
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4fbf-b2180cae12c2
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0d56-9aff1d6b0596
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-422f-4fe8a34a16bd
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7913-aa36d9022a52
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7ef1-9fc9941b51e6
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-c6b7-9471d0c61f7a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0f3f-b423c64868ff
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6a9a-bd031075afd5
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-9d54-8f8e88e07624
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-091e-dc2cf62b1a67
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-bdac-20afa3648407
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6f72-367da36ffb4c
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-42de-3db53625a962
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-dd4c-f737ccc443c2
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-eb20-7b1a304d5d6b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7809-906998591c4f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-24f4-ff318d2f0d0e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-3ac7-57c8e49c1752
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-bb9e-6d710983abf7
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5715-17f9952cf947
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-ce84-174dccfe7e4a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-35ad-331d3623616c
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-b32e-113f8051932a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6ab1-92bca433410e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-082a-1aa2c43d5c3a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-7adc-52e22d15fb29
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4ce2-9c8fba596831
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-25fb-df7b215da3d8
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-ae5a-444a76cf7a6b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-624d-c10e454b4cfe
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-3997-f0bc4245a950
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-fd83-d8adfba907be
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-cd7e-f30bc342af27
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-cb5e-6db967c26f0f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6c6b-3a25ec205634
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-4d40-ad8cc7b427aa
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f3f7-9eb3a39f7669
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-0379-431047af9304
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-d929-76a2df1b898a
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-3d7d-59e3ef430f58
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-92d3-944fc0ec4181
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-a0d4-1b3be74a7632
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-f518-3328ffa5e35b
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-6278-890385fd7a52
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-5039-5b24e4b760f7
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-564b-45c48dc7e6fc
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-3d3b-4c3aec96088f
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-1ee5-a673ef269d85
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-ee0a-cc9e856dae5e
00020000-55a8-f77b-c132-28833f2d461c	00030000-55a8-f779-906b-7bf190ea7c6d
\.


--
-- TOC entry 2892 (class 0 OID 10574223)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 10574254)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10574368)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55a8-f77b-6a3c-2c21f5d2efd4	00090000-55a8-f77b-a4bd-50ce762b7ce9	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55a8-f77b-5248-ea9230601a22	00090000-55a8-f77b-76a3-d5f868ffae43	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55a8-f77b-0fd4-4947d0f72831	00090000-55a8-f77b-db3c-2627893a04c0	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2869 (class 0 OID 10573988)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a8-f77a-59dd-4e27b06df209	00040000-55a8-f779-97ba-8ae24f78684c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-851d-36a008be926a	00040000-55a8-f779-97ba-8ae24f78684c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a8-f77a-7cfd-45b31a689e20	00040000-55a8-f779-97ba-8ae24f78684c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-f6cd-001f338fd379	00040000-55a8-f779-97ba-8ae24f78684c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-75a4-b6a46746e480	00040000-55a8-f779-97ba-8ae24f78684c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-886d-f47b4f2c5879	00040000-55a8-f779-49bd-f2b74d9311c7	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-d97c-730ac32621e5	00040000-55a8-f779-1093-5528992284d3	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77a-e911-dca5b2ab974b	00040000-55a8-f779-e78e-c019e8fe6a7c	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-f77b-1a14-6f9072c9a266	00040000-55a8-f779-97ba-8ae24f78684c	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2871 (class 0 OID 10574023)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a8-f779-5e91-11ba6e97b30b	8341	Adlešiči
00050000-55a8-f779-aec3-920e116f1fb0	5270	Ajdovščina
00050000-55a8-f779-2dc1-bc88951ec7ca	6280	Ankaran/Ancarano
00050000-55a8-f779-9f2b-9cacfeab9d3c	9253	Apače
00050000-55a8-f779-b767-8faca91e5bc8	8253	Artiče
00050000-55a8-f779-2e20-8f870eb7b590	4275	Begunje na Gorenjskem
00050000-55a8-f779-7307-5f346c4362c1	1382	Begunje pri Cerknici
00050000-55a8-f779-e00c-25a398a824ec	9231	Beltinci
00050000-55a8-f779-0fdb-e69b847478bd	2234	Benedikt
00050000-55a8-f779-0464-e14ca8f5649f	2345	Bistrica ob Dravi
00050000-55a8-f779-f24d-bd93804a291e	3256	Bistrica ob Sotli
00050000-55a8-f779-677a-f48a47df77b8	8259	Bizeljsko
00050000-55a8-f779-fec8-5d1a7f8ac5d4	1223	Blagovica
00050000-55a8-f779-a5cf-288eb4f13c6a	8283	Blanca
00050000-55a8-f779-7082-9e712be18fef	4260	Bled
00050000-55a8-f779-1378-9dfdb4c2bf52	4273	Blejska Dobrava
00050000-55a8-f779-12fd-96e2834ec35c	9265	Bodonci
00050000-55a8-f779-dbd3-731d5ba18686	9222	Bogojina
00050000-55a8-f779-38e2-4826ddbcb2c0	4263	Bohinjska Bela
00050000-55a8-f779-980c-51df8b89f89d	4264	Bohinjska Bistrica
00050000-55a8-f779-e56c-a5b25c572188	4265	Bohinjsko jezero
00050000-55a8-f779-6232-22d5448d6bf8	1353	Borovnica
00050000-55a8-f779-e8eb-088eff43f13d	8294	Boštanj
00050000-55a8-f779-29d2-881a2636534a	5230	Bovec
00050000-55a8-f779-af37-7094d22d46d6	5295	Branik
00050000-55a8-f779-8122-9da830c32c0d	3314	Braslovče
00050000-55a8-f779-65ef-6d25e3ca68d0	5223	Breginj
00050000-55a8-f779-15e7-904a7ee68b9e	8280	Brestanica
00050000-55a8-f77a-7bb1-cee5f370ba6f	2354	Bresternica
00050000-55a8-f77a-5129-a2376982d33c	4243	Brezje
00050000-55a8-f77a-7a1c-b1e9a2a6741e	1351	Brezovica pri Ljubljani
00050000-55a8-f77a-e669-64706323fb2a	8250	Brežice
00050000-55a8-f77a-c5f8-ca20c6bb2d67	4210	Brnik - Aerodrom
00050000-55a8-f77a-dd05-c1b57bf747d5	8321	Brusnice
00050000-55a8-f77a-1b13-e549e27f9617	3255	Buče
00050000-55a8-f77a-f978-e95965130512	8276	Bučka 
00050000-55a8-f77a-e6e2-3057da4b860c	9261	Cankova
00050000-55a8-f77a-e729-3e90632e16b5	3000	Celje 
00050000-55a8-f77a-5702-31b06c3a8fa8	3001	Celje - poštni predali
00050000-55a8-f77a-6b8a-cb370c22f425	4207	Cerklje na Gorenjskem
00050000-55a8-f77a-a11b-a911588762d4	8263	Cerklje ob Krki
00050000-55a8-f77a-5e3c-7df47eae9754	1380	Cerknica
00050000-55a8-f77a-4190-9e0d6f4c29dd	5282	Cerkno
00050000-55a8-f77a-16f4-000558b58db5	2236	Cerkvenjak
00050000-55a8-f77a-1a85-28e5a2c78032	2215	Ceršak
00050000-55a8-f77a-46d5-459f7d04c501	2326	Cirkovce
00050000-55a8-f77a-9913-28e94f9f1dae	2282	Cirkulane
00050000-55a8-f77a-da54-3984b51530a4	5273	Col
00050000-55a8-f77a-d841-059dd572adda	8251	Čatež ob Savi
00050000-55a8-f77a-6e1e-78c9334709e5	1413	Čemšenik
00050000-55a8-f77a-f23c-6d296d97ee30	5253	Čepovan
00050000-55a8-f77a-e65b-934f2d411496	9232	Črenšovci
00050000-55a8-f77a-ef2b-25893736981b	2393	Črna na Koroškem
00050000-55a8-f77a-cbf5-90b5bbf02e2b	6275	Črni Kal
00050000-55a8-f77a-359d-affad068cd76	5274	Črni Vrh nad Idrijo
00050000-55a8-f77a-96fa-46a0d4b657c5	5262	Črniče
00050000-55a8-f77a-8d74-0e93cbfd71e2	8340	Črnomelj
00050000-55a8-f77a-2598-3bdb88cd302b	6271	Dekani
00050000-55a8-f77a-ae67-115a8d5ec1f3	5210	Deskle
00050000-55a8-f77a-4c2b-93bbc9e47cce	2253	Destrnik
00050000-55a8-f77a-ed85-3dbf5d8a8cbb	6215	Divača
00050000-55a8-f77a-c6dd-30a74cb7ba56	1233	Dob
00050000-55a8-f77a-0942-394d675a98a6	3224	Dobje pri Planini
00050000-55a8-f77a-924e-65087604b53d	8257	Dobova
00050000-55a8-f77a-82a1-8bac362ad947	1423	Dobovec
00050000-55a8-f77a-d76e-304fcaf2f084	5263	Dobravlje
00050000-55a8-f77a-a392-c005476139c7	3204	Dobrna
00050000-55a8-f77a-d2e8-bea878256842	8211	Dobrnič
00050000-55a8-f77a-75ae-001b25b2287e	1356	Dobrova
00050000-55a8-f77a-55ff-257d056633b2	9223	Dobrovnik/Dobronak 
00050000-55a8-f77a-f982-8e65e14e41bb	5212	Dobrovo v Brdih
00050000-55a8-f77a-f6c9-21b3557e39cd	1431	Dol pri Hrastniku
00050000-55a8-f77a-9576-9dea6ae547df	1262	Dol pri Ljubljani
00050000-55a8-f77a-a311-1fdd505f71b3	1273	Dole pri Litiji
00050000-55a8-f77a-9871-1471772b41bd	1331	Dolenja vas
00050000-55a8-f77a-6957-47228233ec19	8350	Dolenjske Toplice
00050000-55a8-f77a-ed55-bb1036a5bf4c	1230	Domžale
00050000-55a8-f77a-d9dc-7689453d4b4e	2252	Dornava
00050000-55a8-f77a-28fe-dd1d87035348	5294	Dornberk
00050000-55a8-f77a-7559-43da9fd43f58	1319	Draga
00050000-55a8-f77a-a79a-a6f2e9a5ae87	8343	Dragatuš
00050000-55a8-f77a-f2b2-678f0f04bd14	3222	Dramlje
00050000-55a8-f77a-fe1b-373996326845	2370	Dravograd
00050000-55a8-f77a-974c-de817b4f0471	4203	Duplje
00050000-55a8-f77a-b1de-813e00dba3e5	6221	Dutovlje
00050000-55a8-f77a-b49f-0f43e7bef583	8361	Dvor
00050000-55a8-f77a-5abc-521b8e03ea93	2343	Fala
00050000-55a8-f77a-8ca5-f8ae1a20cb4e	9208	Fokovci
00050000-55a8-f77a-3edf-8e0356f8aed1	2313	Fram
00050000-55a8-f77a-f83a-8699bc365133	3213	Frankolovo
00050000-55a8-f77a-e8fe-2bf69a66f471	1274	Gabrovka
00050000-55a8-f77a-2457-af46dd296082	8254	Globoko
00050000-55a8-f77a-7493-4b3740b2213b	5275	Godovič
00050000-55a8-f77a-b351-56bcfe2ef919	4204	Golnik
00050000-55a8-f77a-ec97-ddfdea88ebc1	3303	Gomilsko
00050000-55a8-f77a-1d41-5d1edfede0d2	4224	Gorenja vas
00050000-55a8-f77a-d209-fa9cce77d9c2	3263	Gorica pri Slivnici
00050000-55a8-f77a-4dd9-14e530a5b3d1	2272	Gorišnica
00050000-55a8-f77a-3ba5-65aeb7662676	9250	Gornja Radgona
00050000-55a8-f77a-039c-d4156b58d285	3342	Gornji Grad
00050000-55a8-f77a-51c1-589999399259	4282	Gozd Martuljek
00050000-55a8-f77a-2511-50ea08ef4ba9	6272	Gračišče
00050000-55a8-f77a-94c4-c2c3e5743195	9264	Grad
00050000-55a8-f77a-10cd-cfdd4dd78ed0	8332	Gradac
00050000-55a8-f77a-3c76-4fc879aa4a2f	1384	Grahovo
00050000-55a8-f77a-e3ca-132d388b577c	5242	Grahovo ob Bači
00050000-55a8-f77a-98aa-0dfbcf3e21a4	5251	Grgar
00050000-55a8-f77a-59d8-848b693425cf	3302	Griže
00050000-55a8-f77a-16b5-61d48f4d7c7d	3231	Grobelno
00050000-55a8-f77a-d96d-a3ec19f5b866	1290	Grosuplje
00050000-55a8-f77a-e8fe-8b5c5f5b17c4	2288	Hajdina
00050000-55a8-f77a-8074-611516a41821	8362	Hinje
00050000-55a8-f77a-8415-46e0f48b0dd9	2311	Hoče
00050000-55a8-f77a-8282-b75975257145	9205	Hodoš/Hodos
00050000-55a8-f77a-e7d6-1d8b2920cff9	1354	Horjul
00050000-55a8-f77a-b50a-a7d797be0640	1372	Hotedršica
00050000-55a8-f77a-f529-415276414d90	1430	Hrastnik
00050000-55a8-f77a-2f13-147859869d7d	6225	Hruševje
00050000-55a8-f77a-121d-7d93f09b1fc3	4276	Hrušica
00050000-55a8-f77a-287b-c8352fc3e42f	5280	Idrija
00050000-55a8-f77a-d2a4-9153bd55abf2	1292	Ig
00050000-55a8-f77a-cb3e-8c856bf8c7df	6250	Ilirska Bistrica
00050000-55a8-f77a-541c-932d3029c23e	6251	Ilirska Bistrica-Trnovo
00050000-55a8-f77a-65f9-eebc18278ffe	1295	Ivančna Gorica
00050000-55a8-f77a-bc92-3a9aa652c0bb	2259	Ivanjkovci
00050000-55a8-f77a-4c32-44e00a21a7b2	1411	Izlake
00050000-55a8-f77a-3630-756cac17ded4	6310	Izola/Isola
00050000-55a8-f77a-350b-2db6b54a1b04	2222	Jakobski Dol
00050000-55a8-f77a-83d5-679921a5c96a	2221	Jarenina
00050000-55a8-f77a-1b37-d5997113d08b	6254	Jelšane
00050000-55a8-f77a-f797-54593bc2cb10	4270	Jesenice
00050000-55a8-f77a-ad40-b518f7aab032	8261	Jesenice na Dolenjskem
00050000-55a8-f77a-21e0-1667c160e053	3273	Jurklošter
00050000-55a8-f77a-d932-3d7fa6f09462	2223	Jurovski Dol
00050000-55a8-f77a-0dbb-a9fd4ce3715f	2256	Juršinci
00050000-55a8-f77a-a2d9-f4953df9b4c7	5214	Kal nad Kanalom
00050000-55a8-f77a-85b2-11851d9223a4	3233	Kalobje
00050000-55a8-f77a-e43c-0d24405fbffd	4246	Kamna Gorica
00050000-55a8-f77a-ab86-27f1244ad512	2351	Kamnica
00050000-55a8-f77a-b2d7-8a2061f26a50	1241	Kamnik
00050000-55a8-f77a-b489-fe3b27f89de6	5213	Kanal
00050000-55a8-f77a-c03b-dba846e77ce3	8258	Kapele
00050000-55a8-f77a-dff8-40772ef22b78	2362	Kapla
00050000-55a8-f77a-9468-2bdeb150618a	2325	Kidričevo
00050000-55a8-f77a-38be-369ce9197167	1412	Kisovec
00050000-55a8-f77a-8ceb-15b6b18a1819	6253	Knežak
00050000-55a8-f77a-cce9-3a71a1fe9455	5222	Kobarid
00050000-55a8-f77a-debd-a9855d8a6b4a	9227	Kobilje
00050000-55a8-f77a-8c5d-e4f151ebf416	1330	Kočevje
00050000-55a8-f77a-3e9c-1ddca27f23e6	1338	Kočevska Reka
00050000-55a8-f77a-811c-63df48ae009b	2276	Kog
00050000-55a8-f77a-35cc-c25047af2caa	5211	Kojsko
00050000-55a8-f77a-e0b8-aebe6e2a5d8b	6223	Komen
00050000-55a8-f77a-0d4e-fa3e3fd14e8f	1218	Komenda
00050000-55a8-f77a-71be-e96eec97ce61	6000	Koper/Capodistria 
00050000-55a8-f77a-f72e-7f12a7d84dfa	6001	Koper/Capodistria - poštni predali
00050000-55a8-f77a-470c-d3b31563d007	8282	Koprivnica
00050000-55a8-f77a-f859-870e0d630b03	5296	Kostanjevica na Krasu
00050000-55a8-f77a-4a30-bc27afcdd371	8311	Kostanjevica na Krki
00050000-55a8-f77a-27c5-539a5fe68f0a	1336	Kostel
00050000-55a8-f77a-6cf5-e900406411ed	6256	Košana
00050000-55a8-f77a-1efc-a777be89a237	2394	Kotlje
00050000-55a8-f77a-a74b-a548c71908d5	6240	Kozina
00050000-55a8-f77a-c7e7-7d82ac4d8c8c	3260	Kozje
00050000-55a8-f77a-cec1-2cf3fb0839ca	4000	Kranj 
00050000-55a8-f77a-be1d-7fcf971c45a6	4001	Kranj - poštni predali
00050000-55a8-f77a-580b-2f4bf35b6d34	4280	Kranjska Gora
00050000-55a8-f77a-9b73-7cebfe4d17e8	1281	Kresnice
00050000-55a8-f77a-80d7-969deb141eee	4294	Križe
00050000-55a8-f77a-807e-72dc8a93e1c7	9206	Križevci
00050000-55a8-f77a-6a39-e4287b2c9894	9242	Križevci pri Ljutomeru
00050000-55a8-f77a-3ef7-69eab9090547	1301	Krka
00050000-55a8-f77a-0529-3c23ee8fb28b	8296	Krmelj
00050000-55a8-f77a-945a-af187248b0de	4245	Kropa
00050000-55a8-f77a-50f7-2695db9ce490	8262	Krška vas
00050000-55a8-f77a-ca0a-3ff2c88a0767	8270	Krško
00050000-55a8-f77a-49d0-bdd17ffe3907	9263	Kuzma
00050000-55a8-f77a-2bec-037d15e8c55a	2318	Laporje
00050000-55a8-f77a-31a5-25dc7d725cd7	3270	Laško
00050000-55a8-f77a-b0d4-552845f0fe62	1219	Laze v Tuhinju
00050000-55a8-f77a-9b86-a506c7a03880	2230	Lenart v Slovenskih goricah
00050000-55a8-f77a-9179-603eaac1dc44	9220	Lendava/Lendva
00050000-55a8-f77a-7f9c-f602c96ce002	4248	Lesce
00050000-55a8-f77a-64a1-b0aee7dcde41	3261	Lesično
00050000-55a8-f77a-de88-529e05a0d59b	8273	Leskovec pri Krškem
00050000-55a8-f77a-a720-9b5aa5d8a471	2372	Libeliče
00050000-55a8-f77a-984f-a686f8f08cf7	2341	Limbuš
00050000-55a8-f77a-d6aa-c87fb6ca5ad6	1270	Litija
00050000-55a8-f77a-264d-6a3809d6179a	3202	Ljubečna
00050000-55a8-f77a-c70a-736c095aefc2	1000	Ljubljana 
00050000-55a8-f77a-4233-c013c74e6ad9	1001	Ljubljana - poštni predali
00050000-55a8-f77a-8544-f04aa0f32a8f	1231	Ljubljana - Črnuče
00050000-55a8-f77a-a9d0-49959d9887a8	1261	Ljubljana - Dobrunje
00050000-55a8-f77a-17f4-1bc074279cc7	1260	Ljubljana - Polje
00050000-55a8-f77a-f904-01a303e270f3	1210	Ljubljana - Šentvid
00050000-55a8-f77a-9dad-de7266b0dc28	1211	Ljubljana - Šmartno
00050000-55a8-f77a-39aa-91a7fb1c0dad	3333	Ljubno ob Savinji
00050000-55a8-f77a-580f-d2643676b8aa	9240	Ljutomer
00050000-55a8-f77a-9104-c2d6c91605a9	3215	Loče
00050000-55a8-f77a-012c-4acb8db4dc5e	5231	Log pod Mangartom
00050000-55a8-f77a-4a3b-900ef422ab00	1358	Log pri Brezovici
00050000-55a8-f77a-469b-cb32f15f9c1c	1370	Logatec
00050000-55a8-f77a-a632-32d7b5375133	1371	Logatec
00050000-55a8-f77a-a69c-03484c81c3e8	1434	Loka pri Zidanem Mostu
00050000-55a8-f77a-8b90-07b025250395	3223	Loka pri Žusmu
00050000-55a8-f77a-d944-bbff4d17c3b9	6219	Lokev
00050000-55a8-f77a-e990-9c203da5586a	1318	Loški Potok
00050000-55a8-f77a-2478-7e38f69af646	2324	Lovrenc na Dravskem polju
00050000-55a8-f77a-888c-15190a6e6934	2344	Lovrenc na Pohorju
00050000-55a8-f77a-3b94-b710be7663b2	3334	Luče
00050000-55a8-f77a-afef-be0b51d87abc	1225	Lukovica
00050000-55a8-f77a-aa6c-18e7c98fadc7	9202	Mačkovci
00050000-55a8-f77a-ca5d-bbb4ee865867	2322	Majšperk
00050000-55a8-f77a-ab53-977c7f628ae5	2321	Makole
00050000-55a8-f77a-6a7a-5bf487cb589c	9243	Mala Nedelja
00050000-55a8-f77a-d64c-303ddef65fec	2229	Malečnik
00050000-55a8-f77a-548b-22f48a6f56df	6273	Marezige
00050000-55a8-f77a-e8c2-e139ba3a5f0b	2000	Maribor 
00050000-55a8-f77a-9ca0-410ffdef1bda	2001	Maribor - poštni predali
00050000-55a8-f77a-57c4-db5d74a7b42e	2206	Marjeta na Dravskem polju
00050000-55a8-f77a-1df4-f69431133af5	2281	Markovci
00050000-55a8-f77a-289e-9dc83d6929de	9221	Martjanci
00050000-55a8-f77a-18a7-76b9d499dd93	6242	Materija
00050000-55a8-f77a-48c8-6fc568a448f7	4211	Mavčiče
00050000-55a8-f77a-1b06-062555731b93	1215	Medvode
00050000-55a8-f77a-81a7-9f6a41c2b226	1234	Mengeš
00050000-55a8-f77a-5df5-2b425e5abef7	8330	Metlika
00050000-55a8-f77a-abcc-e6bf6b8177ee	2392	Mežica
00050000-55a8-f77a-2b1c-90bcadc9e143	2204	Miklavž na Dravskem polju
00050000-55a8-f77a-8dab-6a017e1890b6	2275	Miklavž pri Ormožu
00050000-55a8-f77a-6040-cce7c37e2281	5291	Miren
00050000-55a8-f77a-5af3-4fd86c01032d	8233	Mirna
00050000-55a8-f77a-8af1-3c8b3231bc5e	8216	Mirna Peč
00050000-55a8-f77a-b275-3ebf1a92936e	2382	Mislinja
00050000-55a8-f77a-8651-ec602afa4655	4281	Mojstrana
00050000-55a8-f77a-d78f-0e864fd30f61	8230	Mokronog
00050000-55a8-f77a-28ca-b6e099c3438b	1251	Moravče
00050000-55a8-f77a-f5da-6eca4955c1fd	9226	Moravske Toplice
00050000-55a8-f77a-7863-5fee6fffa301	5216	Most na Soči
00050000-55a8-f77a-7aa1-831590b35682	1221	Motnik
00050000-55a8-f77a-bde4-1387bc4ff79b	3330	Mozirje
00050000-55a8-f77a-f145-4bd068d823b1	9000	Murska Sobota 
00050000-55a8-f77a-f760-76f449d83981	9001	Murska Sobota - poštni predali
00050000-55a8-f77a-5514-116e8e895626	2366	Muta
00050000-55a8-f77a-7dc3-249a1e341043	4202	Naklo
00050000-55a8-f77a-0385-41a5d93b9069	3331	Nazarje
00050000-55a8-f77a-699f-912c185978d3	1357	Notranje Gorice
00050000-55a8-f77a-88b8-d74167dc94f4	3203	Nova Cerkev
00050000-55a8-f77a-970a-da67b9f31fb1	5000	Nova Gorica 
00050000-55a8-f77a-2bc6-d31bf6b80110	5001	Nova Gorica - poštni predali
00050000-55a8-f77a-d6d1-b4942aae6e1e	1385	Nova vas
00050000-55a8-f77a-8ae4-f6eceffa3d1a	8000	Novo mesto
00050000-55a8-f77a-a4dd-f9619f35ada6	8001	Novo mesto - poštni predali
00050000-55a8-f77a-284e-56a2e0dce33f	6243	Obrov
00050000-55a8-f77a-7d09-0710ff19373e	9233	Odranci
00050000-55a8-f77a-3412-7474b052b62b	2317	Oplotnica
00050000-55a8-f77a-95a6-58a388b02c14	2312	Orehova vas
00050000-55a8-f77a-06fe-469798b3e2bb	2270	Ormož
00050000-55a8-f77a-cc7c-8e25278ac975	1316	Ortnek
00050000-55a8-f77a-d03c-3138b4a9a782	1337	Osilnica
00050000-55a8-f77a-7822-70112981d35a	8222	Otočec
00050000-55a8-f77a-bb73-cae30361c631	2361	Ožbalt
00050000-55a8-f77a-1ada-8e61b31b91ad	2231	Pernica
00050000-55a8-f77a-c83a-3ba2911e61d8	2211	Pesnica pri Mariboru
00050000-55a8-f77a-8cde-464e080a733e	9203	Petrovci
00050000-55a8-f77a-72d4-644d18d810ee	3301	Petrovče
00050000-55a8-f77a-0b35-e222f2a6c668	6330	Piran/Pirano
00050000-55a8-f77a-a66e-3801bd3deb3d	8255	Pišece
00050000-55a8-f77a-d78b-fb136d058ef1	6257	Pivka
00050000-55a8-f77a-e302-48d30cb87fba	6232	Planina
00050000-55a8-f77a-0813-65be268bbdca	3225	Planina pri Sevnici
00050000-55a8-f77a-285f-a40a5a6aeeb1	6276	Pobegi
00050000-55a8-f77a-c16e-a716bdda24e6	8312	Podbočje
00050000-55a8-f77a-a63b-2427561a20b1	5243	Podbrdo
00050000-55a8-f77a-0013-48a5434c7e85	3254	Podčetrtek
00050000-55a8-f77a-2f89-77948878c1f8	2273	Podgorci
00050000-55a8-f77a-48ae-b7a5757e65f0	6216	Podgorje
00050000-55a8-f77a-7066-f3b60c80cc34	2381	Podgorje pri Slovenj Gradcu
00050000-55a8-f77a-bdcf-7e610d8d0b0a	6244	Podgrad
00050000-55a8-f77a-6404-cca3676d800a	1414	Podkum
00050000-55a8-f77a-9b7d-da63ddafc84c	2286	Podlehnik
00050000-55a8-f77a-f033-fca5d03283b5	5272	Podnanos
00050000-55a8-f77a-b497-ef9a67dc92b4	4244	Podnart
00050000-55a8-f77a-45cc-6fa1e3bba9bd	3241	Podplat
00050000-55a8-f77a-7bd0-b7812a738787	3257	Podsreda
00050000-55a8-f77a-2bd1-872359aaac84	2363	Podvelka
00050000-55a8-f77a-bb6c-9ec7d73f9b89	2208	Pohorje
00050000-55a8-f77a-dfbb-d5a954f820e3	2257	Polenšak
00050000-55a8-f77a-64de-13d0f7220af8	1355	Polhov Gradec
00050000-55a8-f77a-0e24-e18d8b690854	4223	Poljane nad Škofjo Loko
00050000-55a8-f77a-c229-1977e5b2b372	2319	Poljčane
00050000-55a8-f77a-9284-ccfec733b7cb	1272	Polšnik
00050000-55a8-f77a-20bd-b426f3941b7c	3313	Polzela
00050000-55a8-f77a-6332-858b7588f744	3232	Ponikva
00050000-55a8-f77a-1996-9ff582a2cb9a	6320	Portorož/Portorose
00050000-55a8-f77a-5d97-866588cf577e	6230	Postojna
00050000-55a8-f77a-19c2-7aa5de98649f	2331	Pragersko
00050000-55a8-f77a-3d90-fa0efe1aaedf	3312	Prebold
00050000-55a8-f77a-b749-ad5e8f0bffbe	4205	Preddvor
00050000-55a8-f77a-565c-137b3a607e53	6255	Prem
00050000-55a8-f77a-29dd-368ae9ac8ab1	1352	Preserje
00050000-55a8-f77a-4fa5-51887861cf46	6258	Prestranek
00050000-55a8-f77a-8c86-f28f8f0d4869	2391	Prevalje
00050000-55a8-f77a-17b9-561b9c5badab	3262	Prevorje
00050000-55a8-f77a-1223-9f562bf8a5b8	1276	Primskovo 
00050000-55a8-f77a-e22d-c1101af62f83	3253	Pristava pri Mestinju
00050000-55a8-f77a-262e-3a1348c6f33c	9207	Prosenjakovci/Partosfalva
00050000-55a8-f77a-650e-372abe10964b	5297	Prvačina
00050000-55a8-f77a-5232-bdc3a04cd813	2250	Ptuj
00050000-55a8-f77a-b3a3-d411546edb7f	2323	Ptujska Gora
00050000-55a8-f77a-3375-8f0b0ac1efa2	9201	Puconci
00050000-55a8-f77a-d7dc-598089b5d7fa	2327	Rače
00050000-55a8-f77a-d652-31da9da11d69	1433	Radeče
00050000-55a8-f77a-410a-cd3311d28034	9252	Radenci
00050000-55a8-f77a-70ca-a0f847b1ceb6	2360	Radlje ob Dravi
00050000-55a8-f77a-a851-ccb1ba17f012	1235	Radomlje
00050000-55a8-f77a-7b1d-d5ffab747d96	4240	Radovljica
00050000-55a8-f77a-18c8-d92e249695f1	8274	Raka
00050000-55a8-f77a-f4f9-887743277d20	1381	Rakek
00050000-55a8-f77a-099f-99dc9c5e4c13	4283	Rateče - Planica
00050000-55a8-f77a-2be3-0e1e980dd51c	2390	Ravne na Koroškem
00050000-55a8-f77a-34a4-061977c31d35	9246	Razkrižje
00050000-55a8-f77a-9057-4f2021fbe858	3332	Rečica ob Savinji
00050000-55a8-f77a-a628-d104defd7a41	5292	Renče
00050000-55a8-f77a-47c3-3c1850661cde	1310	Ribnica
00050000-55a8-f77a-3343-b3cb8d243081	2364	Ribnica na Pohorju
00050000-55a8-f77a-3d1f-a0f5f6af941b	3272	Rimske Toplice
00050000-55a8-f77a-785f-8f954c1b89fa	1314	Rob
00050000-55a8-f77a-1dff-3086e62b53e0	5215	Ročinj
00050000-55a8-f77a-22c0-06748b601f8b	3250	Rogaška Slatina
00050000-55a8-f77a-4253-6eb5cea92824	9262	Rogašovci
00050000-55a8-f77a-6b32-42e0f7eba13a	3252	Rogatec
00050000-55a8-f77a-f6f1-64f21d8ad23c	1373	Rovte
00050000-55a8-f77a-4228-a9c001502d0c	2342	Ruše
00050000-55a8-f77a-11c9-6ccbc43fe6b4	1282	Sava
00050000-55a8-f77a-1001-59b59996b480	6333	Sečovlje/Sicciole
00050000-55a8-f77a-9571-e701b41c05dc	4227	Selca
00050000-55a8-f77a-6db7-d8ec36e81ccd	2352	Selnica ob Dravi
00050000-55a8-f77a-d4ca-9a20bef45faf	8333	Semič
00050000-55a8-f77a-2a8d-aff2bb297d46	8281	Senovo
00050000-55a8-f77a-bb03-de4bbf07c4ce	6224	Senožeče
00050000-55a8-f77a-bc36-eab8b31e4e72	8290	Sevnica
00050000-55a8-f77a-7427-2394dd1fc36b	6210	Sežana
00050000-55a8-f77a-43bf-dbf361a66d8a	2214	Sladki Vrh
00050000-55a8-f77a-e944-a05ba91e26ef	5283	Slap ob Idrijci
00050000-55a8-f77a-dbd5-d4aa042caff4	2380	Slovenj Gradec
00050000-55a8-f77a-9dd2-1efb2db09797	2310	Slovenska Bistrica
00050000-55a8-f77a-41b5-172752c75388	3210	Slovenske Konjice
00050000-55a8-f77a-c0c6-773bd357fd78	1216	Smlednik
00050000-55a8-f77a-1caf-16bb2550fca5	5232	Soča
00050000-55a8-f77a-9af7-0c119dd363b5	1317	Sodražica
00050000-55a8-f77a-18ff-7a5a46ec83a5	3335	Solčava
00050000-55a8-f77a-3cba-fc8d21bc2b78	5250	Solkan
00050000-55a8-f77a-bd96-79763d43a8b3	4229	Sorica
00050000-55a8-f77a-f4e6-d722e0af6932	4225	Sovodenj
00050000-55a8-f77a-7e17-87d92a76678f	5281	Spodnja Idrija
00050000-55a8-f77a-6e66-0987473536e0	2241	Spodnji Duplek
00050000-55a8-f77a-4918-0f7d407a462c	9245	Spodnji Ivanjci
00050000-55a8-f77a-d10f-599fed37529d	2277	Središče ob Dravi
00050000-55a8-f77a-efef-b9406e52248a	4267	Srednja vas v Bohinju
00050000-55a8-f77a-73ad-d3f4380c0195	8256	Sromlje 
00050000-55a8-f77a-d810-24dfdf490b9b	5224	Srpenica
00050000-55a8-f77a-77fc-ce4cbcd17330	1242	Stahovica
00050000-55a8-f77a-2c74-5655f607ab5f	1332	Stara Cerkev
00050000-55a8-f77a-9c76-4483831c6cf1	8342	Stari trg ob Kolpi
00050000-55a8-f77a-6b87-8eca652ad74d	1386	Stari trg pri Ložu
00050000-55a8-f77a-5601-319354f43fb6	2205	Starše
00050000-55a8-f77a-a174-9f47ee8289e4	2289	Stoperce
00050000-55a8-f77a-b369-285aa8b1c78b	8322	Stopiče
00050000-55a8-f77a-3e8c-d2f1fba3e652	3206	Stranice
00050000-55a8-f77a-9bb2-88f2d1fa3138	8351	Straža
00050000-55a8-f77a-fcff-df7bfdec6c33	1313	Struge
00050000-55a8-f77a-85ed-c628d826b125	8293	Studenec
00050000-55a8-f77a-baf0-447b9f26760a	8331	Suhor
00050000-55a8-f77a-1ad4-df6e4a12ad34	2233	Sv. Ana v Slovenskih goricah
00050000-55a8-f77a-55d5-5cfa70aa8a22	2235	Sv. Trojica v Slovenskih goricah
00050000-55a8-f77a-dddd-281e73eef7c3	2353	Sveti Duh na Ostrem Vrhu
00050000-55a8-f77a-c92d-05097c66bef5	9244	Sveti Jurij ob Ščavnici
00050000-55a8-f77a-cca4-202f11da388f	3264	Sveti Štefan
00050000-55a8-f77a-21de-fe47607ee0ed	2258	Sveti Tomaž
00050000-55a8-f77a-f1f8-5135f70448fe	9204	Šalovci
00050000-55a8-f77a-7ddf-d8c341fd9cdf	5261	Šempas
00050000-55a8-f77a-5e12-5af48eac9311	5290	Šempeter pri Gorici
00050000-55a8-f77a-e40d-c510e917acc0	3311	Šempeter v Savinjski dolini
00050000-55a8-f77a-315a-a8836e83dcf0	4208	Šenčur
00050000-55a8-f77a-7cea-001cc6c8e4b7	2212	Šentilj v Slovenskih goricah
00050000-55a8-f77a-82f1-b1a2714e7e7b	8297	Šentjanž
00050000-55a8-f77a-bfa5-bcfe08191e1b	2373	Šentjanž pri Dravogradu
00050000-55a8-f77a-88a8-69f2d3f028b6	8310	Šentjernej
00050000-55a8-f77a-3afe-1de0b93a70e4	3230	Šentjur
00050000-55a8-f77a-ea22-382a00104a82	3271	Šentrupert
00050000-55a8-f77a-8454-9372e8d1a567	8232	Šentrupert
00050000-55a8-f77a-4dd4-f265e9cf85c9	1296	Šentvid pri Stični
00050000-55a8-f77a-0c12-c6360a6adbde	8275	Škocjan
00050000-55a8-f77a-294f-10a137bb8b43	6281	Škofije
00050000-55a8-f77a-f32d-1679930de8d7	4220	Škofja Loka
00050000-55a8-f77a-eaae-7742a53548a8	3211	Škofja vas
00050000-55a8-f77a-89fe-c4baa28cbaba	1291	Škofljica
00050000-55a8-f77a-4cda-65dc39fb7010	6274	Šmarje
00050000-55a8-f77a-a410-fa6b9e7f3c45	1293	Šmarje - Sap
00050000-55a8-f77a-87b5-be1f9738ce56	3240	Šmarje pri Jelšah
00050000-55a8-f77a-9bb8-9af4d99cedf5	8220	Šmarješke Toplice
00050000-55a8-f77a-b4a2-b98c59380e0b	2315	Šmartno na Pohorju
00050000-55a8-f77a-de6d-db0b11962999	3341	Šmartno ob Dreti
00050000-55a8-f77a-da88-95891215b488	3327	Šmartno ob Paki
00050000-55a8-f77a-ef5d-40bce895ae1b	1275	Šmartno pri Litiji
00050000-55a8-f77a-544c-f7f18c4abcb2	2383	Šmartno pri Slovenj Gradcu
00050000-55a8-f77a-8044-c59e297a7598	3201	Šmartno v Rožni dolini
00050000-55a8-f77a-9b72-040d82637d10	3325	Šoštanj
00050000-55a8-f77a-0768-65c37321fb14	6222	Štanjel
00050000-55a8-f77a-56f6-83c386461c27	3220	Štore
00050000-55a8-f77a-a353-740578d489b5	3304	Tabor
00050000-55a8-f77a-df27-7b95d4c55679	3221	Teharje
00050000-55a8-f77a-ae89-57ce7a5cb3ad	9251	Tišina
00050000-55a8-f77a-92ec-a759ed45bd1d	5220	Tolmin
00050000-55a8-f77a-7254-bcc6d0842cf6	3326	Topolšica
00050000-55a8-f77a-aaff-5f0bc265439a	2371	Trbonje
00050000-55a8-f77a-3278-a2d444cdf066	1420	Trbovlje
00050000-55a8-f77a-6003-47e3448b6718	8231	Trebelno 
00050000-55a8-f77a-e1d2-a0cb5322a77e	8210	Trebnje
00050000-55a8-f77a-8112-f600c6659d27	5252	Trnovo pri Gorici
00050000-55a8-f77a-46af-59ea258b89eb	2254	Trnovska vas
00050000-55a8-f77a-4103-d8f090c7e70c	1222	Trojane
00050000-55a8-f77a-032e-130aca0d8b83	1236	Trzin
00050000-55a8-f77a-4146-01f7f6f9bcf4	4290	Tržič
00050000-55a8-f77a-7d8c-62626fd76c44	8295	Tržišče
00050000-55a8-f77a-aafb-fa246b417a0a	1311	Turjak
00050000-55a8-f77a-59c0-c4b87dec107e	9224	Turnišče
00050000-55a8-f77a-9895-364f66d93f7a	8323	Uršna sela
00050000-55a8-f77a-3efa-0d28ce7b362b	1252	Vače
00050000-55a8-f77a-3f21-ab150204461e	3320	Velenje 
00050000-55a8-f77a-af1f-cf7b3375b0c2	3322	Velenje - poštni predali
00050000-55a8-f77a-065f-05c4e741f0ca	8212	Velika Loka
00050000-55a8-f77a-52de-7995bd64700d	2274	Velika Nedelja
00050000-55a8-f77a-69be-7453fd86c341	9225	Velika Polana
00050000-55a8-f77a-2d72-60e1b36e4e31	1315	Velike Lašče
00050000-55a8-f77a-999d-0d73770831a4	8213	Veliki Gaber
00050000-55a8-f77a-3b73-27638842d595	9241	Veržej
00050000-55a8-f77a-4177-6dd545797191	1312	Videm - Dobrepolje
00050000-55a8-f77a-0d1a-b9dfb70123ce	2284	Videm pri Ptuju
00050000-55a8-f77a-3eea-26bbf8df6a9a	8344	Vinica
00050000-55a8-f77a-2ae4-04a6217aff51	5271	Vipava
00050000-55a8-f77a-01bb-29d97d6101a4	4212	Visoko
00050000-55a8-f77a-1ef4-7b7b589332a4	1294	Višnja Gora
00050000-55a8-f77a-c23e-5fd5b58561fa	3205	Vitanje
00050000-55a8-f77a-b55e-4fcdc2d1aa99	2255	Vitomarci
00050000-55a8-f77a-e777-22cc9fc3e546	1217	Vodice
00050000-55a8-f77a-c021-49162918947c	3212	Vojnik\t
00050000-55a8-f77a-7ca3-a526c98a6465	5293	Volčja Draga
00050000-55a8-f77a-b283-0c20800899e4	2232	Voličina
00050000-55a8-f77a-2e97-63f9f1d24820	3305	Vransko
00050000-55a8-f77a-1094-edd6333733e1	6217	Vremski Britof
00050000-55a8-f77a-ffaf-0c4917522544	1360	Vrhnika
00050000-55a8-f77a-1e49-deb1135beea0	2365	Vuhred
00050000-55a8-f77a-a729-4927f32ad963	2367	Vuzenica
00050000-55a8-f77a-4b13-7173b6f2114e	8292	Zabukovje 
00050000-55a8-f77a-cca6-ab09fb0c75e2	1410	Zagorje ob Savi
00050000-55a8-f77a-4150-0c025138feb8	1303	Zagradec
00050000-55a8-f77a-07d0-8ad1c6caad27	2283	Zavrč
00050000-55a8-f77a-b6e8-9ca0899d0dc0	8272	Zdole 
00050000-55a8-f77a-c2ee-c50b6bba256b	4201	Zgornja Besnica
00050000-55a8-f77a-a791-aea032c3d1a3	2242	Zgornja Korena
00050000-55a8-f77a-f618-35ee652ca49a	2201	Zgornja Kungota
00050000-55a8-f77a-0634-cd911826c196	2316	Zgornja Ložnica
00050000-55a8-f77a-4fab-ea4d2308afed	2314	Zgornja Polskava
00050000-55a8-f77a-bcae-3bbc4315f006	2213	Zgornja Velka
00050000-55a8-f77a-95e1-1d57d3b5c79f	4247	Zgornje Gorje
00050000-55a8-f77a-974e-9e9d0c3a266a	4206	Zgornje Jezersko
00050000-55a8-f77a-4d51-ff9e405159c5	2285	Zgornji Leskovec
00050000-55a8-f77a-ffd3-fa5160576141	1432	Zidani Most
00050000-55a8-f77a-bb1c-2e1614d1df99	3214	Zreče
00050000-55a8-f77a-75d5-e4486d8136b8	4209	Žabnica
00050000-55a8-f77a-5eb1-76517e408e52	3310	Žalec
00050000-55a8-f77a-9b2f-1d8f6779d99a	4228	Železniki
00050000-55a8-f77a-a9c2-488c9bdab814	2287	Žetale
00050000-55a8-f77a-aa13-c362f0978703	4226	Žiri
00050000-55a8-f77a-c33a-cdbc2ec88089	4274	Žirovnica
00050000-55a8-f77a-8608-9f5c3f9dfe40	8360	Žužemberk
\.


--
-- TOC entry 2888 (class 0 OID 10574197)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 10574008)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 10574086)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10574209)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10574512)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 10574523)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a8-f77b-570f-7b757807ce41	00080000-55a8-f77b-1a14-6f9072c9a266	0900	AK
00190000-55a8-f77b-2f18-55fd61b685a3	00080000-55a8-f77a-7cfd-45b31a689e20	0987	AK
00190000-55a8-f77b-3724-e4d8f244ed94	00080000-55a8-f77a-851d-36a008be926a	0989	AK
00190000-55a8-f77b-155f-7d2fe1aa67f7	00080000-55a8-f77a-f6cd-001f338fd379	0986	AK
00190000-55a8-f77b-e7df-a7b92bdaa4bb	00080000-55a8-f77a-886d-f47b4f2c5879	0984	AK
00190000-55a8-f77b-e89f-6056516c33ef	00080000-55a8-f77a-d97c-730ac32621e5	0983	AK
00190000-55a8-f77b-48c5-de85ea95a7b0	00080000-55a8-f77a-e911-dca5b2ab974b	0982	AK
\.


--
-- TOC entry 2912 (class 0 OID 10574493)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a8-f77b-e401-422128d68075	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2857 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 10574531)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10574238)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a8-f77a-512f-ee0a67d971e6	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a8-f77a-9d9d-457c8080da5a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a8-f77a-8a6f-721b6dae64e8	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a8-f77a-fc90-d44eba12814e	0004	Mali oder	t	24	Mali oder 
00220000-55a8-f77a-2a01-24f726c27fd8	0005	Komorni oder	t	15	Komorni oder
00220000-55a8-f77a-9e31-e37020280fdc	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a8-f77a-198e-c31aa66c9719	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2886 (class 0 OID 10574182)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 10574172)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10574357)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10574306)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 10573880)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2895 (class 0 OID 10574248)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 10573918)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a8-f779-4929-2f7c2718d4e5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a8-f779-b877-96d05ebd5fc1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a8-f779-6cf5-d82ad9ed72d9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a8-f779-4280-ce0257fc7b49	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a8-f779-600b-6803ee47d72d	planer	Planer dogodkov v koledarju	t
00020000-55a8-f779-df9e-83c90ad2f97d	kadrovska	Kadrovska služba	t
00020000-55a8-f779-6737-cccc9d40a315	arhivar	Ažuriranje arhivalij	t
00020000-55a8-f779-7a4a-b4aab34eb159	igralec	Igralec	t
00020000-55a8-f779-a3c6-6fb4ccd7b134	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a8-f77b-c132-28833f2d461c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2861 (class 0 OID 10573902)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a8-f779-18e7-bf676e294f38	00020000-55a8-f779-6cf5-d82ad9ed72d9
00010000-55a8-f779-f8ae-6eac9c4a268b	00020000-55a8-f779-6cf5-d82ad9ed72d9
00010000-55a8-f77b-c463-4a9167a147b8	00020000-55a8-f77b-c132-28833f2d461c
\.


--
-- TOC entry 2897 (class 0 OID 10574262)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 10574203)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10574153)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 10574572)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a8-f77a-acdb-1ee076118065	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a8-f77a-0713-5a7a85c4a13d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a8-f77a-5d5d-2df70fa69add	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a8-f77a-e715-3ad10e2efdc8	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a8-f77a-5c22-6a76d10517e6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2919 (class 0 OID 10574564)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a8-f77a-89fb-fbccd8b63cae	00230000-55a8-f77a-e715-3ad10e2efdc8	popa
00240000-55a8-f77a-6aff-94a9e36b88aa	00230000-55a8-f77a-e715-3ad10e2efdc8	oseba
00240000-55a8-f77a-276c-063875e7c01d	00230000-55a8-f77a-0713-5a7a85c4a13d	prostor
00240000-55a8-f77a-ce04-fc82e83002e9	00230000-55a8-f77a-e715-3ad10e2efdc8	besedilo
00240000-55a8-f77a-79ab-c66080c187ec	00230000-55a8-f77a-e715-3ad10e2efdc8	uprizoritev
00240000-55a8-f77a-ec67-115b08bd74e1	00230000-55a8-f77a-e715-3ad10e2efdc8	funkcija
00240000-55a8-f77a-f544-0075e31a5d04	00230000-55a8-f77a-e715-3ad10e2efdc8	tipfunkcije
00240000-55a8-f77a-28ef-b620df562950	00230000-55a8-f77a-e715-3ad10e2efdc8	alternacija
00240000-55a8-f77a-eda6-70d46bc41fe2	00230000-55a8-f77a-acdb-1ee076118065	pogodba
00240000-55a8-f77a-659c-57034ee4824b	00230000-55a8-f77a-e715-3ad10e2efdc8	zaposlitev
00240000-55a8-f77a-40ad-8c7bee905364	00230000-55a8-f77a-acdb-1ee076118065	programdela
\.


--
-- TOC entry 2918 (class 0 OID 10574559)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10574316)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a8-f77b-e457-4297933fac90	000e0000-55a8-f77b-478a-76ee09a8726a	00080000-55a8-f77a-59dd-4e27b06df209	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a8-f77b-7b62-727d27dfca15	000e0000-55a8-f77b-478a-76ee09a8726a	00080000-55a8-f77a-59dd-4e27b06df209	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a8-f77b-ec13-0782e9ddaa30	000e0000-55a8-f77b-478a-76ee09a8726a	00080000-55a8-f77a-75a4-b6a46746e480	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55a8-f77b-f0bd-a02617b5a009	000e0000-55a8-f77b-478a-76ee09a8726a	00080000-55a8-f77a-75a4-b6a46746e480	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2868 (class 0 OID 10573980)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10574159)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a8-f77b-05d1-33d37d9daee5	00180000-55a8-f77b-b935-f9b1050af956	000c0000-55a8-f77b-d9bb-9e30064fec8f	00090000-55a8-f77b-dca7-58ba63653f51	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-f77b-0a0f-9eb703536127	00180000-55a8-f77b-b935-f9b1050af956	000c0000-55a8-f77b-8e61-95b3ca2debe0	00090000-55a8-f77b-c6d5-a7010a26b657	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-f77b-f74d-b930d5713212	00180000-55a8-f77b-b935-f9b1050af956	000c0000-55a8-f77b-5967-f3d703b5520e	00090000-55a8-f77b-5a9c-701e96f912e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-f77b-512f-d9d741e06983	00180000-55a8-f77b-b935-f9b1050af956	000c0000-55a8-f77b-d907-00aab6ea74f1	00090000-55a8-f77b-0469-8b96cb7f4e55	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-f77b-62be-c29771952c2f	00180000-55a8-f77b-b935-f9b1050af956	000c0000-55a8-f77b-660c-ebc71e08df73	00090000-55a8-f77b-ade9-1a0cb7b510bf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-f77b-6e78-eea2539a955d	00180000-55a8-f77b-429e-cb5605a785cd	\N	00090000-55a8-f77b-ade9-1a0cb7b510bf	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2904 (class 0 OID 10574346)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a8-f77a-03f3-c3d28eb8ab69	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a8-f77a-55c7-9347d11f1a41	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a8-f77a-d5e7-f0571c8fcc90	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a8-f77a-1b8f-5c2f72a53444	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a8-f77a-ee40-7497e3c616d0	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a8-f77a-2ec8-8bc12c69abe0	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a8-f77a-4a2c-634efaebad3d	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a8-f77a-5bc1-f0984abb5594	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a8-f77a-23cf-94e982a1878d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a8-f77a-6267-3730d08f2094	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a8-f77a-8131-94f90aaab149	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a8-f77a-4777-5ce56afadb41	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a8-f77a-29f9-260dfb35dbaf	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a8-f77a-0dae-5765ed6abe28	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a8-f77a-ebc7-149852e0075d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a8-f77a-73e1-487461592325	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2916 (class 0 OID 10574541)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a8-f77a-6264-f822dacd0cbb	01	Velika predstava	f	1.00	1.00
002b0000-55a8-f77a-60a0-e0a3b0acfffa	02	Mala predstava	f	0.50	0.50
002b0000-55a8-f77a-c1f4-e777caefe11b	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a8-f77a-d3bd-c78f3213ea95	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a8-f77a-b325-058b1510e198	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2873 (class 0 OID 10574043)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 10573889)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a8-f779-f8ae-6eac9c4a268b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODL51ZBlaxNWnW9YPvKHf/tRLwGZQtDC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-5a14-28d59b0b8901	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-8395-ea901e15fb9d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-3b1e-106504f42951	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-8c9e-7b39d6b4fc9c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-c967-815ce98ffad7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-a2f9-df26f61a4ef4	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-7c29-5df05bba6d33	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-2849-c64cef166a55	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-f6a8-eaead81c41ca	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a8-f77b-c463-4a9167a147b8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a8-f779-18e7-bf676e294f38	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 10574394)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a8-f77b-5f66-f9d81dfb502f	00160000-55a8-f77a-f369-a7bd28d00812	00150000-55a8-f77a-28da-305b04b8a4a7	00140000-55a8-f779-e17c-b7c0d459ae33	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a8-f77a-2a01-24f726c27fd8
000e0000-55a8-f77b-478a-76ee09a8726a	00160000-55a8-f77a-dfd1-4dd6faf00522	00150000-55a8-f77a-ab24-bf1f5423cf96	00140000-55a8-f779-de5e-c8d7eef46340	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a8-f77a-9e31-e37020280fdc
000e0000-55a8-f77b-86e6-f58e6ac6c0ed	\N	00150000-55a8-f77a-ab24-bf1f5423cf96	00140000-55a8-f779-de5e-c8d7eef46340	00190000-55a8-f77b-2f18-55fd61b685a3	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a8-f77a-2a01-24f726c27fd8
000e0000-55a8-f77b-cbf8-83ae5805aa66	\N	00150000-55a8-f77a-ab24-bf1f5423cf96	00140000-55a8-f779-de5e-c8d7eef46340	00190000-55a8-f77b-2f18-55fd61b685a3	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a8-f77a-2a01-24f726c27fd8
000e0000-55a8-f77b-7da5-b000cd614eca	\N	00150000-55a8-f77a-ab24-bf1f5423cf96	00140000-55a8-f779-de5e-c8d7eef46340	00190000-55a8-f77b-2f18-55fd61b685a3	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a8-f77a-512f-ee0a67d971e6
\.


--
-- TOC entry 2878 (class 0 OID 10574105)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a8-f77b-9921-214ca422bf0c	000e0000-55a8-f77b-478a-76ee09a8726a	1	
00200000-55a8-f77b-89f5-4b695778edb5	000e0000-55a8-f77b-478a-76ee09a8726a	2	
\.


--
-- TOC entry 2893 (class 0 OID 10574230)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10574299)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a8-f77b-582e-e0a0f75d0373	00090000-55a8-f77b-c6d5-a7010a26b657	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-f77b-f902-dc464a7b492c	00090000-55a8-f77b-5a9c-701e96f912e5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-f77b-b269-09f14a1638ff	00090000-55a8-f77b-e19a-f6614514d803	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2880 (class 0 OID 10574137)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 10574384)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a8-f779-e17c-b7c0d459ae33	01	Drama	drama (SURS 01)
00140000-55a8-f779-6f5a-eccf3f02c624	02	Opera	opera (SURS 02)
00140000-55a8-f779-fd56-fe952b52ca42	03	Balet	balet (SURS 03)
00140000-55a8-f779-c176-875bb00f6ffc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a8-f779-0279-b536bcc39477	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a8-f779-de5e-c8d7eef46340	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a8-f779-9fbe-71b6b30bc6e2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2899 (class 0 OID 10574289)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a8-f77a-2547-a85b6e3ad3da	01	Opera	opera
00150000-55a8-f77a-7f82-2b8caf8da1c2	02	Opereta	opereta
00150000-55a8-f77a-1f04-c28647ed6523	03	Balet	balet
00150000-55a8-f77a-bf50-7d357acd9955	04	Plesne prireditve	plesne prireditve
00150000-55a8-f77a-70d3-19ebdf32f435	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a8-f77a-dd2a-fd8a4a48b959	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a8-f77a-edcb-1324088ce231	07	Biografska drama	biografska drama
00150000-55a8-f77a-28da-305b04b8a4a7	08	Komedija	komedija
00150000-55a8-f77a-b149-a8cfbd6263dc	09	Črna komedija	črna komedija
00150000-55a8-f77a-82b7-bccebbfa5dd3	10	E-igra	E-igra
00150000-55a8-f77a-ab24-bf1f5423cf96	11	Kriminalka	kriminalka
00150000-55a8-f77a-4813-34faa821bfad	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 10573943)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 10574441)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 10574431)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10574345)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 10574127)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10574152)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 10574557)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 10574069)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 10574487)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 10574285)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 10574103)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 10574146)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 10574083)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 10574195)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 10574222)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 10574041)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 10573952)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 10573976)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 10573932)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 10573917)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 10574228)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 10574261)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 10574379)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 10574005)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 10574029)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10574201)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 10574019)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10574090)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10574213)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 10574520)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 10574528)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 10574510)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 10574539)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 10574245)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10574186)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 10574177)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 10574367)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 10574313)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10573888)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10574252)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 10573906)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 10573926)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10574270)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 10574208)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 10574158)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 10574581)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 10574569)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 10574563)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10574326)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 10573985)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 10574168)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10574356)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 10574551)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10574054)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 10573901)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10574410)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10574112)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10574236)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 10574304)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10574141)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 10574392)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 10574297)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 10574134)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 10574327)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2587 (class 1259 OID 10574328)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2460 (class 1259 OID 10574007)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2407 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2409 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2551 (class 1259 OID 10574229)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2545 (class 1259 OID 10574215)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 10574214)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 10574113)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10574286)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 10574288)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2575 (class 1259 OID 10574287)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 10574085)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 10574084)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 10574540)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2596 (class 1259 OID 10574381)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2597 (class 1259 OID 10574382)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 10574383)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2421 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2422 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2605 (class 1259 OID 10574415)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2606 (class 1259 OID 10574412)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2607 (class 1259 OID 10574416)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2608 (class 1259 OID 10574414)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2609 (class 1259 OID 10574413)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 10574056)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 10574055)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 10573979)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 10574253)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 10574147)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 10573933)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 10573934)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2566 (class 1259 OID 10574273)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2567 (class 1259 OID 10574272)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2568 (class 1259 OID 10574271)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 10574091)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 10574093)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 10574092)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2652 (class 1259 OID 10574571)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 10574181)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 10574179)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 10574178)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 10574180)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 10573907)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 10573908)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 10574237)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2540 (class 1259 OID 10574202)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2582 (class 1259 OID 10574314)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2583 (class 1259 OID 10574315)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10574492)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2627 (class 1259 OID 10574491)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2628 (class 1259 OID 10574488)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 10574489)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2630 (class 1259 OID 10574490)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 10574021)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 10574020)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 10574022)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2425 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2634 (class 1259 OID 10574521)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2635 (class 1259 OID 10574522)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2619 (class 1259 OID 10574445)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 10574443)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 10574444)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2579 (class 1259 OID 10574305)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 10574190)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 10574189)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 10574187)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 10574188)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2403 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 10574433)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 10574432)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2631 (class 1259 OID 10574511)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 10574104)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2649 (class 1259 OID 10574558)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2447 (class 1259 OID 10573954)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 10573953)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 10573986)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 10573987)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 10574171)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 10574170)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 10574169)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2416 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2418 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2503 (class 1259 OID 10574136)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 10574132)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 10574129)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 10574130)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 10574128)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 10574133)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 10574131)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 10574006)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10574070)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 10574072)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 10574071)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 10574073)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 10574196)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 10574380)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 10574411)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10573977)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 10573978)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 10574298)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2658 (class 1259 OID 10574582)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 10574042)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2655 (class 1259 OID 10574570)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2559 (class 1259 OID 10574247)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2560 (class 1259 OID 10574246)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10574442)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 10574446)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 10574030)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 10574393)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10574529)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 10574530)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 10573927)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 10574135)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2684 (class 2606 OID 10574718)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2687 (class 2606 OID 10574703)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2686 (class 2606 OID 10574708)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2682 (class 2606 OID 10574728)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2688 (class 2606 OID 10574698)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2683 (class 2606 OID 10574723)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2685 (class 2606 OID 10574713)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2718 (class 2606 OID 10574873)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2717 (class 2606 OID 10574878)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2669 (class 2606 OID 10574633)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 10574813)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2703 (class 2606 OID 10574808)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2704 (class 2606 OID 10574803)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2681 (class 2606 OID 10574693)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 10574843)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 10574853)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2712 (class 2606 OID 10574848)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2675 (class 2606 OID 10574668)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 10574663)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 10574793)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 10574998)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2721 (class 2606 OID 10574883)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 10574888)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 10574893)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2723 (class 2606 OID 10574913)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2726 (class 2606 OID 10574898)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 10574918)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 10574908)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2725 (class 2606 OID 10574903)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2673 (class 2606 OID 10574658)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 10574653)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 10574618)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2666 (class 2606 OID 10574613)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 10574823)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2689 (class 2606 OID 10574733)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 10574593)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2661 (class 2606 OID 10574598)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2708 (class 2606 OID 10574838)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2709 (class 2606 OID 10574833)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2710 (class 2606 OID 10574828)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2679 (class 2606 OID 10574673)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 10574683)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2678 (class 2606 OID 10574678)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2744 (class 2606 OID 10575008)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2693 (class 2606 OID 10574768)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2695 (class 2606 OID 10574758)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2696 (class 2606 OID 10574753)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2694 (class 2606 OID 10574763)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2660 (class 2606 OID 10574583)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 10574588)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2706 (class 2606 OID 10574818)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2702 (class 2606 OID 10574798)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2716 (class 2606 OID 10574863)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2715 (class 2606 OID 10574868)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2733 (class 2606 OID 10574973)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 10574968)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2737 (class 2606 OID 10574953)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 10574958)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2735 (class 2606 OID 10574963)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2671 (class 2606 OID 10574643)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 10574638)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2670 (class 2606 OID 10574648)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 10574983)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2739 (class 2606 OID 10574988)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2730 (class 2606 OID 10574943)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2729 (class 2606 OID 10574948)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2732 (class 2606 OID 10574933)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2731 (class 2606 OID 10574938)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2714 (class 2606 OID 10574858)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 10574788)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2698 (class 2606 OID 10574783)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2700 (class 2606 OID 10574773)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2699 (class 2606 OID 10574778)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 10574928)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 10574923)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 10574978)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2680 (class 2606 OID 10574688)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 10574993)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2743 (class 2606 OID 10575003)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2663 (class 2606 OID 10574608)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2664 (class 2606 OID 10574603)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2668 (class 2606 OID 10574623)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 10574628)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 10574748)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 10574743)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2692 (class 2606 OID 10574738)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-17 14:39:24 CEST

--
-- PostgreSQL database dump complete
--

