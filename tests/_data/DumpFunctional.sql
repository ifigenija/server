--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-10 14:16:42 CEST

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
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 9718165)
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
-- TOC entry 228 (class 1259 OID 9718663)
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
-- TOC entry 227 (class 1259 OID 9718646)
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
-- TOC entry 221 (class 1259 OID 9718559)
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
-- TOC entry 197 (class 1259 OID 9718344)
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
-- TOC entry 200 (class 1259 OID 9718378)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9718776)
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
-- TOC entry 192 (class 1259 OID 9718287)
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
-- TOC entry 229 (class 1259 OID 9718676)
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
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stzaposumet integer DEFAULT 0 NOT NULL,
    stzaposdrug integer DEFAULT 0 NOT NULL,
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
-- TOC entry 216 (class 1259 OID 9718504)
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
-- TOC entry 195 (class 1259 OID 9718324)
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
-- TOC entry 199 (class 1259 OID 9718372)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9718304)
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
-- TOC entry 205 (class 1259 OID 9718421)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9718446)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9718261)
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
-- TOC entry 184 (class 1259 OID 9718174)
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
-- TOC entry 185 (class 1259 OID 9718185)
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
-- TOC entry 180 (class 1259 OID 9718139)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9718158)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9718453)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9718484)
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
-- TOC entry 224 (class 1259 OID 9718597)
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
    opis text
);


--
-- TOC entry 187 (class 1259 OID 9718218)
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
-- TOC entry 189 (class 1259 OID 9718253)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9718427)
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
-- TOC entry 188 (class 1259 OID 9718238)
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
-- TOC entry 194 (class 1259 OID 9718316)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9718439)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9718746)
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
-- TOC entry 232 (class 1259 OID 9718757)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9718727)
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
-- TOC entry 212 (class 1259 OID 9718468)
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
-- TOC entry 204 (class 1259 OID 9718412)
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
-- TOC entry 203 (class 1259 OID 9718402)
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
-- TOC entry 223 (class 1259 OID 9718586)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9718536)
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
-- TOC entry 177 (class 1259 OID 9718110)
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
-- TOC entry 176 (class 1259 OID 9718108)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 9718478)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9718148)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9718132)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9718492)
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
-- TOC entry 207 (class 1259 OID 9718433)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9718383)
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
-- TOC entry 237 (class 1259 OID 9718796)
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
-- TOC entry 236 (class 1259 OID 9718788)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9718783)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9718546)
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
-- TOC entry 186 (class 1259 OID 9718210)
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
-- TOC entry 202 (class 1259 OID 9718389)
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
-- TOC entry 222 (class 1259 OID 9718575)
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
-- TOC entry 233 (class 1259 OID 9718765)
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
-- TOC entry 191 (class 1259 OID 9718273)
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
-- TOC entry 178 (class 1259 OID 9718119)
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
-- TOC entry 226 (class 1259 OID 9718623)
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
-- TOC entry 196 (class 1259 OID 9718335)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9718460)
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
-- TOC entry 218 (class 1259 OID 9718529)
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
-- TOC entry 198 (class 1259 OID 9718367)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9718613)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9718519)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9718113)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9718165)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9718663)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559f-b7a9-d600-a08abba92bac	000d0000-559f-b7a9-c85f-9b54974fbb72	\N	00090000-559f-b7a9-d266-498d9595dcdd	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559f-b7a9-dcfd-663f8abd3fea	000d0000-559f-b7a9-2cb9-62525f6ac30b	\N	00090000-559f-b7a9-c70e-c7bb0a7ddc64	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559f-b7a9-393f-376008346e00	000d0000-559f-b7a9-5c45-f267f6a0f06a	\N	00090000-559f-b7a9-42b7-cb11e2a6814b	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559f-b7a9-b6e7-f796dcc0299a	000d0000-559f-b7a9-5415-df259ecc4450	\N	00090000-559f-b7a9-5908-f76feebdff1c	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559f-b7a9-429a-00136d743570	000d0000-559f-b7a9-075a-8061370962d3	\N	00090000-559f-b7a9-0c1e-0ff387c87270	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559f-b7a9-bb45-fa6c63bb3ee5	000d0000-559f-b7a9-24b3-db422066783b	\N	00090000-559f-b7a9-68ec-9e7acd79872f	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559f-b7a9-d1c2-6845ee95938f	000d0000-559f-b7a9-1276-5947902dff85	\N	00090000-559f-b7a9-4616-8909f0ca9e93	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559f-b7a9-23d4-3d2150ea331f	000d0000-559f-b7a9-728d-8ea0e4e44275	\N	00090000-559f-b7a9-b3f5-9c33a3437e0b	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9718646)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9718559)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559f-b7a9-2d3b-c42db9e2d69a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559f-b7a9-642e-062ec1a3df96	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559f-b7a9-a6db-8a3dce2e09a2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9718344)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559f-b7a9-e6d7-041097d4329a	\N	\N	00200000-559f-b7a9-b3be-3dbea4d85d19	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559f-b7a9-994a-ee7021eecec4	\N	\N	00200000-559f-b7a9-45a8-8f1d083eb284	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559f-b7a9-6f54-52b979997f06	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559f-b7a9-6449-147cae682d8f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559f-b7a9-fac0-8c26b9cd97bd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9718378)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9718776)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9718287)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559f-b7a7-fa04-3ad76502839d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559f-b7a7-0010-f7b745bc4d87	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559f-b7a7-976e-72f14c736d5a	AL	ALB	008	Albania 	Albanija	\N
00040000-559f-b7a7-95ae-0549082fb137	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559f-b7a7-58ca-79dbc98191c2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559f-b7a7-4bdf-ac551009ee6d	AD	AND	020	Andorra 	Andora	\N
00040000-559f-b7a7-7894-bc13d9fd3735	AO	AGO	024	Angola 	Angola	\N
00040000-559f-b7a7-c591-b04da11712ae	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559f-b7a7-1aa8-59ca6627f5d6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559f-b7a7-350f-2a2cafdf4a0e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-b7a7-897e-fec83076388c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559f-b7a7-3314-9a8a132a80d9	AM	ARM	051	Armenia 	Armenija	\N
00040000-559f-b7a7-a9a3-8a19483c0da6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559f-b7a7-4e89-a0da31c9863c	AU	AUS	036	Australia 	Avstralija	\N
00040000-559f-b7a7-7376-4cb27c405ca7	AT	AUT	040	Austria 	Avstrija	\N
00040000-559f-b7a7-a798-1ea0b4fa6542	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559f-b7a7-cc1b-91d7d860e8c0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559f-b7a7-f8c1-a17c6c52542e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559f-b7a7-4c3b-00ebf5a0de88	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559f-b7a7-c462-dfcbe9b90e05	BB	BRB	052	Barbados 	Barbados	\N
00040000-559f-b7a7-f554-8b655b0e44a6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559f-b7a7-2e17-2ec6b848336a	BE	BEL	056	Belgium 	Belgija	\N
00040000-559f-b7a7-4f76-a842f56fc883	BZ	BLZ	084	Belize 	Belize	\N
00040000-559f-b7a7-4b9a-60fc07c69a5c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559f-b7a7-22dc-ca1b30cbde6b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559f-b7a7-b335-75b01ed7023d	BT	BTN	064	Bhutan 	Butan	\N
00040000-559f-b7a7-781a-8f4e994871fc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559f-b7a7-e5c9-1b5e021e4f2b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559f-b7a7-74f4-81124de6c151	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559f-b7a7-7013-f96d1bdfd4a2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559f-b7a7-f3b4-250e33e9e03c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559f-b7a7-e56f-98f0631a582c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559f-b7a7-81cf-91c45e3d4443	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559f-b7a7-0ec2-ab5681c2fafe	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559f-b7a7-8782-cf520cd1c9ef	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559f-b7a7-de79-091ff458b617	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559f-b7a7-af87-0cc8f1c8d453	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559f-b7a7-3dad-48cd6657b3a1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559f-b7a7-1213-fa4c76e040db	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559f-b7a7-8db9-09dd375a48a4	CA	CAN	124	Canada 	Kanada	\N
00040000-559f-b7a7-8d27-1fbabacec64b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559f-b7a7-6aa8-d1c499c9cbed	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559f-b7a7-fa1b-925bd230006d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559f-b7a7-b50e-d3d0732ca23c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559f-b7a7-def9-6e9c0e7f2904	CL	CHL	152	Chile 	Čile	\N
00040000-559f-b7a7-b0b8-0dd277ee001e	CN	CHN	156	China 	Kitajska	\N
00040000-559f-b7a7-faf4-af8cdce39ab8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559f-b7a7-943d-992257b879cf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559f-b7a7-5941-6c3b0b594cd2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559f-b7a7-5648-7b7c30402010	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559f-b7a7-cda7-263cf7ea390e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559f-b7a7-8e1f-61a46e32b2a5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559f-b7a7-bd4a-f8885ee5699f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559f-b7a7-8186-a3608ad28f73	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559f-b7a7-297a-1e3ead494b3c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559f-b7a7-8a39-b4b3123ee4f9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559f-b7a7-8327-f698c86275f3	CU	CUB	192	Cuba 	Kuba	\N
00040000-559f-b7a7-1912-05f4d5768008	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559f-b7a7-3ece-96bcca2c80bc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559f-b7a7-fab1-b5ea564d911b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559f-b7a7-3270-d8533734e1c7	DK	DNK	208	Denmark 	Danska	\N
00040000-559f-b7a7-db45-7ea5219e0957	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559f-b7a7-5267-e3d7a469fb82	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-b7a7-c1e9-26c030580c2c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559f-b7a7-8b28-112fe529098c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559f-b7a7-8014-6b43603171ad	EG	EGY	818	Egypt 	Egipt	\N
00040000-559f-b7a7-4276-740e3f1afd2e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559f-b7a7-585a-41b7c32c3ed6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559f-b7a7-51bb-54e06035817b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559f-b7a7-9932-c50544b8e191	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559f-b7a7-c049-80c66af0638a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559f-b7a7-c618-e300466b70fe	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559f-b7a7-0f4a-273c680d9300	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559f-b7a7-8823-c429018aefd1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559f-b7a7-114a-0704e36585ff	FI	FIN	246	Finland 	Finska	\N
00040000-559f-b7a7-9492-32392ff7d3a1	FR	FRA	250	France 	Francija	\N
00040000-559f-b7a7-9ceb-8d98d7430a13	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559f-b7a7-828c-88281cafa829	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559f-b7a7-9d0a-5340b6298e80	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559f-b7a7-9264-b2e8b91c97f7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559f-b7a7-ecce-06e2c5fc74d6	GA	GAB	266	Gabon 	Gabon	\N
00040000-559f-b7a7-bdb8-8bb53114d110	GM	GMB	270	Gambia 	Gambija	\N
00040000-559f-b7a7-2a85-5d78ffcf5b44	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559f-b7a7-d0ee-d55864827fe4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559f-b7a7-d2fa-065d35e13045	GH	GHA	288	Ghana 	Gana	\N
00040000-559f-b7a7-6ead-6a7f33bb88e9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559f-b7a7-0036-83a5afc7e14a	GR	GRC	300	Greece 	Grčija	\N
00040000-559f-b7a7-ec5c-7765b599212f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559f-b7a7-7163-bee91d7b4053	GD	GRD	308	Grenada 	Grenada	\N
00040000-559f-b7a7-db67-1d3f8a00b823	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559f-b7a7-8d4f-32092652df69	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559f-b7a7-5467-38da63cb9943	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559f-b7a7-baf2-193e024a863d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559f-b7a7-78df-a344dce13656	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559f-b7a7-83b6-91f24190b0e8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559f-b7a7-29c0-32fb5e035856	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559f-b7a7-d921-efd277659119	HT	HTI	332	Haiti 	Haiti	\N
00040000-559f-b7a7-0cfd-0ec1f6d4db5c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559f-b7a7-3ff1-7e05e265a4b1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559f-b7a7-e6e9-b2117ceb7f7f	HN	HND	340	Honduras 	Honduras	\N
00040000-559f-b7a7-9ac0-32e4a0ae04e4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559f-b7a7-6f82-f2b0cb1aa0bf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559f-b7a7-1c23-04ec8fbe7061	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559f-b7a7-85c6-3196e0310298	IN	IND	356	India 	Indija	\N
00040000-559f-b7a7-423e-d480548d5c76	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559f-b7a7-472a-692dfd01757b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559f-b7a7-e3e4-43b292f27e80	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559f-b7a7-770b-44bb35f8f2d5	IE	IRL	372	Ireland 	Irska	\N
00040000-559f-b7a7-39ff-309a62e52cd6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559f-b7a7-7b93-f26e5c208a98	IL	ISR	376	Israel 	Izrael	\N
00040000-559f-b7a7-1bfb-c6e33e38ba15	IT	ITA	380	Italy 	Italija	\N
00040000-559f-b7a7-1317-36a74e775cd0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559f-b7a7-d89f-ece9b22f1a21	JP	JPN	392	Japan 	Japonska	\N
00040000-559f-b7a7-f5bf-9699476980e7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559f-b7a7-5e6e-a7223567e9dd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559f-b7a7-df32-4acfdb25eec4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559f-b7a7-70b2-50ac04cce46e	KE	KEN	404	Kenya 	Kenija	\N
00040000-559f-b7a7-78a7-943c1759606f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559f-b7a7-ffce-ec687d8e3024	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559f-b7a7-f840-d955e7e55b14	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559f-b7a7-3c76-082301a238e8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559f-b7a7-e595-f16b92ff5943	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559f-b7a7-78f9-26ba74776a58	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559f-b7a7-0cd4-3f733ce93528	LV	LVA	428	Latvia 	Latvija	\N
00040000-559f-b7a7-357b-144af5016201	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559f-b7a7-239b-e211dfdecf5e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559f-b7a7-0c21-782a8cd6e604	LR	LBR	430	Liberia 	Liberija	\N
00040000-559f-b7a7-fb34-e60ebc431413	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559f-b7a7-ebd7-293ce78084ee	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559f-b7a7-c6b3-984226e3961b	LT	LTU	440	Lithuania 	Litva	\N
00040000-559f-b7a7-4bfe-ff7aa59a8e1d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559f-b7a7-049f-14f3a29397f8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559f-b7a7-e345-52cca5b101a9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559f-b7a7-86ea-e2294de76826	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559f-b7a7-cf86-5c892bac4abf	MW	MWI	454	Malawi 	Malavi	\N
00040000-559f-b7a7-5559-faf6af4ddd2b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559f-b7a7-f8a6-3669c65c4304	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559f-b7a7-bdbc-4afe50b66e21	ML	MLI	466	Mali 	Mali	\N
00040000-559f-b7a7-ac84-c38e5e145ddd	MT	MLT	470	Malta 	Malta	\N
00040000-559f-b7a7-ddd5-d99c699a5a34	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559f-b7a7-3306-b1515fccbe8c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559f-b7a7-0ff9-7761539512e5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559f-b7a7-1f52-ebbe32f3b393	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559f-b7a7-855b-86ef2a73fdbd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559f-b7a7-e3ca-95bf647d1956	MX	MEX	484	Mexico 	Mehika	\N
00040000-559f-b7a7-3825-e71496850514	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559f-b7a7-a217-f3ef6fdd2581	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559f-b7a7-21f5-e1ad0ef7dd5f	MC	MCO	492	Monaco 	Monako	\N
00040000-559f-b7a7-5960-40f59f1d658d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559f-b7a7-821f-5d0741bbc28f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559f-b7a7-06e3-8fdb8ce0c5e8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559f-b7a7-d1ca-826efe41b620	MA	MAR	504	Morocco 	Maroko	\N
00040000-559f-b7a7-4376-49b7a1dc4656	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559f-b7a7-a425-288538e65933	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559f-b7a7-85de-23d407f0f5ff	NA	NAM	516	Namibia 	Namibija	\N
00040000-559f-b7a7-52f1-2a82e0799c4a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559f-b7a7-705a-89f0921766cd	NP	NPL	524	Nepal 	Nepal	\N
00040000-559f-b7a7-5956-99fe869fd103	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559f-b7a7-7ab5-036a9161651c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559f-b7a7-3644-d6b013eee017	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559f-b7a7-2808-0cb70d2cc4fe	NE	NER	562	Niger 	Niger 	\N
00040000-559f-b7a7-c6da-362246dc575b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559f-b7a7-b390-ceeaabfb5eae	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559f-b7a7-a1d4-ead350dc3bac	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559f-b7a7-7f15-49bfa37210aa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559f-b7a7-33ed-95673a281e02	NO	NOR	578	Norway 	Norveška	\N
00040000-559f-b7a7-2e79-f158cd20ec9b	OM	OMN	512	Oman 	Oman	\N
00040000-559f-b7a7-a943-398d06a1d620	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559f-b7a7-e31d-58444f74b673	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559f-b7a7-81b2-51c1eecd250f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559f-b7a7-0b47-9e0360a16737	PA	PAN	591	Panama 	Panama	\N
00040000-559f-b7a7-a762-994054e2d050	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559f-b7a7-e830-33913342d83c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559f-b7a7-09e1-4b3bb2aade0a	PE	PER	604	Peru 	Peru	\N
00040000-559f-b7a7-9450-074e0e10673a	PH	PHL	608	Philippines 	Filipini	\N
00040000-559f-b7a7-ab54-38069bfe3e34	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559f-b7a7-2547-29dbee5d66fb	PL	POL	616	Poland 	Poljska	\N
00040000-559f-b7a7-0ed5-39b266c6a1f5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559f-b7a7-ea16-c130cdbc1383	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559f-b7a7-bce0-d74d02432174	QA	QAT	634	Qatar 	Katar	\N
00040000-559f-b7a7-c326-b98b9fe2ff09	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559f-b7a7-9d2a-9a78f176564a	RO	ROU	642	Romania 	Romunija	\N
00040000-559f-b7a7-3425-a8f5cd90e1cd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559f-b7a7-f257-788b85d7cb63	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559f-b7a7-f182-349751fac3b1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559f-b7a7-93f6-b4b0f9bd20e7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559f-b7a7-edc8-be3749c5ef81	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559f-b7a7-08b1-89096f841ff4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559f-b7a7-c0f4-929a35c9247b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559f-b7a7-84d6-1ac02ba456fe	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559f-b7a7-67ad-1736de72efb3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559f-b7a7-d25c-51aa65583152	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559f-b7a7-c1ec-d43dfe1cd400	SM	SMR	674	San Marino 	San Marino	\N
00040000-559f-b7a7-f14b-f56b6d96aa36	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559f-b7a7-8bde-e936fbb5685f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559f-b7a7-7546-84e0a545c56e	SN	SEN	686	Senegal 	Senegal	\N
00040000-559f-b7a7-969f-78293accde85	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559f-b7a7-72e9-49559b1e5cb8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559f-b7a7-0aa3-bbb8b9612a68	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559f-b7a7-f166-19047ca1eae5	SG	SGP	702	Singapore 	Singapur	\N
00040000-559f-b7a7-e6fb-593e06648ac9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559f-b7a7-34ec-5d22676a0ea5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559f-b7a7-5b75-3939afbe8555	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559f-b7a7-492a-5d8ea76e65d5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559f-b7a7-9b85-6c182abee7ac	SO	SOM	706	Somalia 	Somalija	\N
00040000-559f-b7a7-a717-5b20de895b43	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559f-b7a7-9f6a-f438b03c876a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559f-b7a7-5754-0f0520f3b6c5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559f-b7a7-9209-bba748a29e2b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559f-b7a7-6928-f211d45eeaaf	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559f-b7a7-78b3-edaaa4d5bf7f	SD	SDN	729	Sudan 	Sudan	\N
00040000-559f-b7a7-410b-f6a78b05a714	SR	SUR	740	Suriname 	Surinam	\N
00040000-559f-b7a7-63c5-457450a06cac	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559f-b7a7-8640-a63c45e341e3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559f-b7a7-9a8c-c1391d9359a5	SE	SWE	752	Sweden 	Švedska	\N
00040000-559f-b7a7-219e-787691ffbf7a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559f-b7a7-aa0d-927ac8e43db5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559f-b7a7-2426-0e52b1d6d706	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559f-b7a7-0a75-be81696d5f2e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559f-b7a7-7ac5-b9161a206d62	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559f-b7a7-e9c2-b47dcc957735	TH	THA	764	Thailand 	Tajska	\N
00040000-559f-b7a7-fe81-e1db988b8216	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559f-b7a7-4145-01466a5e523b	TG	TGO	768	Togo 	Togo	\N
00040000-559f-b7a7-4550-e33003a0c894	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559f-b7a7-e02e-db01d0faa2ca	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559f-b7a7-32bd-0f32128e8ef0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559f-b7a7-4c98-28f390bcc53c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559f-b7a7-e8d4-e5a78a7e4d25	TR	TUR	792	Turkey 	Turčija	\N
00040000-559f-b7a7-2a42-c3703d05601e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559f-b7a8-70cb-2c2ba5a169b6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-b7a8-49df-9d4b78aad8ab	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559f-b7a8-510d-788b6889fd07	UG	UGA	800	Uganda 	Uganda	\N
00040000-559f-b7a8-fe81-781a3f618d2f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559f-b7a8-cd77-aaa839d39264	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559f-b7a8-1120-3105f572b430	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559f-b7a8-8a89-e30f4b67fc37	US	USA	840	United States 	Združene države Amerike	\N
00040000-559f-b7a8-806d-1d824f444de6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559f-b7a8-9cac-b9b2e6f58830	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559f-b7a8-fc42-daf80bb18575	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559f-b7a8-0b54-26e310bfbef7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559f-b7a8-75cb-d96ba8f138ad	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559f-b7a8-242f-a30a15d0a37b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559f-b7a8-2cd9-b671bc14fc27	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-b7a8-802b-ff0368e645cb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559f-b7a8-0006-a34c2f7ac9c3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559f-b7a8-de4f-e0cd48ac4549	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559f-b7a8-892c-d2c05e864556	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559f-b7a8-13a5-dd18272f46e6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559f-b7a8-bb98-257615ab92e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9718676)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559f-b7a9-260b-58b96c41a53c	000e0000-559f-b7a9-1902-7e580972b915	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559f-b7a8-7fa3-2778a14d89ae	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559f-b7a9-bdcd-4c1afa4ff9bc	000e0000-559f-b7a9-6559-8772749ee4d7	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559f-b7a8-a35f-4d9869d35a4c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9718504)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559f-b7a9-1276-5947902dff85	000e0000-559f-b7a9-6559-8772749ee4d7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559f-b7a8-d118-01d17038b964
000d0000-559f-b7a9-c85f-9b54974fbb72	000e0000-559f-b7a9-6559-8772749ee4d7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-b7a8-d118-01d17038b964
000d0000-559f-b7a9-2cb9-62525f6ac30b	000e0000-559f-b7a9-6559-8772749ee4d7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559f-b7a8-2a68-2345d779f277
000d0000-559f-b7a9-5c45-f267f6a0f06a	000e0000-559f-b7a9-6559-8772749ee4d7	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559f-b7a8-c7dc-e5ff9eae210f
000d0000-559f-b7a9-5415-df259ecc4450	000e0000-559f-b7a9-6559-8772749ee4d7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559f-b7a8-c7dc-e5ff9eae210f
000d0000-559f-b7a9-075a-8061370962d3	000e0000-559f-b7a9-6559-8772749ee4d7	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559f-b7a8-c7dc-e5ff9eae210f
000d0000-559f-b7a9-24b3-db422066783b	000e0000-559f-b7a9-6559-8772749ee4d7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-b7a8-d118-01d17038b964
000d0000-559f-b7a9-728d-8ea0e4e44275	000e0000-559f-b7a9-6559-8772749ee4d7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559f-b7a8-8fd9-c34f7736f2ca
\.


--
-- TOC entry 2870 (class 0 OID 9718324)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9718372)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9718304)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559f-b7a9-f64d-ca56a18db3af	00080000-559f-b7a9-9684-7ee1e3575808	00090000-559f-b7a9-d266-498d9595dcdd	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9718421)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9718446)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9718261)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559f-b7a8-dec2-d13cd0fc1f13	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559f-b7a8-84b5-ace775b5785d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559f-b7a8-45ae-6a0a9e1a21b1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559f-b7a8-537d-21807da0d63d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559f-b7a8-3c2b-a50c5cc44a87	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559f-b7a8-92a3-2273e92c5ecf	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559f-b7a8-1d0b-183f4dc5cb4e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559f-b7a8-1d5a-0d87e22c213e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-b7a8-eb61-6136c4153246	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-b7a8-3494-8ef343a82415	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559f-b7a8-049a-3cbe4cdf0fdc	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559f-b7a8-2401-e4396404d2fc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559f-b7a8-0761-46a2f320a865	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559f-b7a9-484a-a398e3df00fa	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559f-b7a9-442e-80887dc013cd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559f-b7a9-aa2e-1452434dc310	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559f-b7a9-5868-0c7c0c8b3657	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559f-b7a9-0e74-a33ed4467a6c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559f-b7a9-3c0f-c07475839f29	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9718174)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559f-b7a9-cf34-3bb10030bd7a	00000000-559f-b7a9-442e-80887dc013cd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559f-b7a9-df10-2aa884f26847	00000000-559f-b7a9-442e-80887dc013cd	00010000-559f-b7a8-886a-22c516cbbec8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559f-b7a9-4394-865b9e2fd459	00000000-559f-b7a9-aa2e-1452434dc310	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9718185)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559f-b7a9-6df1-9038dcc80a00	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559f-b7a9-5908-f76feebdff1c	00010000-559f-b7a9-8adc-4b77e911e5e0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559f-b7a9-42b7-cb11e2a6814b	00010000-559f-b7a9-b678-1c3848b85924	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559f-b7a9-f39e-7335b29826e5	00010000-559f-b7a9-58bf-b490b1a772b0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559f-b7a9-b90f-78000a0a7688	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559f-b7a9-68ec-9e7acd79872f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559f-b7a9-8dd9-174576dd5e50	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559f-b7a9-4616-8909f0ca9e93	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559f-b7a9-d266-498d9595dcdd	00010000-559f-b7a9-3972-b16442e51416	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559f-b7a9-c70e-c7bb0a7ddc64	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559f-b7a9-c65a-e4183ff243c0	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559f-b7a9-0c1e-0ff387c87270	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559f-b7a9-b3f5-9c33a3437e0b	00010000-559f-b7a9-5538-7efd9a516aa7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9718139)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559f-b7a8-1985-528dd02285b2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559f-b7a8-aa6d-a9cb16bedb70	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559f-b7a8-8faa-de0e1e485291	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559f-b7a8-b41a-e6e164584eed	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559f-b7a8-e75b-a473a39a8c19	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559f-b7a8-e03b-45f970c8f04e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559f-b7a8-21c1-f8243f838cca	Abonma-read	Abonma - branje	f
00030000-559f-b7a8-fb4a-3a32efbd4196	Abonma-write	Abonma - spreminjanje	f
00030000-559f-b7a8-c825-9b4e2a279ccb	Alternacija-read	Alternacija - branje	f
00030000-559f-b7a8-bc0a-2ad41bad3d91	Alternacija-write	Alternacija - spreminjanje	f
00030000-559f-b7a8-df32-5ab73c8071eb	Arhivalija-read	Arhivalija - branje	f
00030000-559f-b7a8-3586-946607f9d24d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559f-b7a8-3ebe-d697786f5fa0	Besedilo-read	Besedilo - branje	f
00030000-559f-b7a8-3c08-cc79ec082620	Besedilo-write	Besedilo - spreminjanje	f
00030000-559f-b7a8-d13b-b53a4d4f2363	DogodekIzven-read	DogodekIzven - branje	f
00030000-559f-b7a8-dfdb-157608a174c1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559f-b7a8-e4ba-3f80034673c4	Dogodek-read	Dogodek - branje	f
00030000-559f-b7a8-ef11-e800611f2b6d	Dogodek-write	Dogodek - spreminjanje	f
00030000-559f-b7a8-204c-b5ba3a5696d3	DrugiVir-read	DrugiVir - branje	f
00030000-559f-b7a8-4ee9-1bb74cd5851c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559f-b7a8-7923-5b047b201a72	Drzava-read	Drzava - branje	f
00030000-559f-b7a8-554d-622fa6a82ff9	Drzava-write	Drzava - spreminjanje	f
00030000-559f-b7a8-00ee-25f9bba3b344	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559f-b7a8-2003-ee7f7cea0afc	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559f-b7a8-32b2-c74bf89a7adc	Funkcija-read	Funkcija - branje	f
00030000-559f-b7a8-ea80-25ad4c214684	Funkcija-write	Funkcija - spreminjanje	f
00030000-559f-b7a8-122d-a3c083c18d92	Gostovanje-read	Gostovanje - branje	f
00030000-559f-b7a8-d496-05245fb900f4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559f-b7a8-10c6-0bc66af82985	Gostujoca-read	Gostujoca - branje	f
00030000-559f-b7a8-9af5-676cd872a896	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559f-b7a8-0256-8bce8839b73e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559f-b7a8-e036-a50092eb44a5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559f-b7a8-99c2-574df70258fa	Kupec-read	Kupec - branje	f
00030000-559f-b7a8-d38f-25dc9feac7bb	Kupec-write	Kupec - spreminjanje	f
00030000-559f-b7a8-9d5e-8773f81d1cae	NacinPlacina-read	NacinPlacina - branje	f
00030000-559f-b7a8-4e74-fb3f99756ca5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559f-b7a8-0b57-ff31936ee7be	Option-read	Option - branje	f
00030000-559f-b7a8-a37c-bfe0971fb928	Option-write	Option - spreminjanje	f
00030000-559f-b7a8-a6f2-332ae7d11e24	OptionValue-read	OptionValue - branje	f
00030000-559f-b7a8-64e4-eb1a31227752	OptionValue-write	OptionValue - spreminjanje	f
00030000-559f-b7a8-c24d-1d5cd59ff9d1	Oseba-read	Oseba - branje	f
00030000-559f-b7a8-9610-c2647a28894e	Oseba-write	Oseba - spreminjanje	f
00030000-559f-b7a8-bd32-b9301e3ded91	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559f-b7a8-0210-e0e7152faebe	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559f-b7a8-e0e8-3401c226a4a3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559f-b7a8-fc03-755d71b1fbce	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559f-b7a8-2eaa-0c43346b1106	Pogodba-read	Pogodba - branje	f
00030000-559f-b7a8-f27f-2310a895377e	Pogodba-write	Pogodba - spreminjanje	f
00030000-559f-b7a8-cad7-ad3fc3a9605b	Popa-read	Popa - branje	f
00030000-559f-b7a8-a5a0-555f82757471	Popa-write	Popa - spreminjanje	f
00030000-559f-b7a8-128b-009c08438bca	Posta-read	Posta - branje	f
00030000-559f-b7a8-2ee4-a97db42b5c47	Posta-write	Posta - spreminjanje	f
00030000-559f-b7a8-418e-3324d36e3299	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559f-b7a8-6b3c-b71fc33b8af8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559f-b7a8-8a44-b246eec96d1c	PostniNaslov-read	PostniNaslov - branje	f
00030000-559f-b7a8-aec6-d8645b806299	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559f-b7a8-ee33-32f9515c63dd	Predstava-read	Predstava - branje	f
00030000-559f-b7a8-de91-cdd40a057d13	Predstava-write	Predstava - spreminjanje	f
00030000-559f-b7a8-272f-bfdf6b8e33de	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559f-b7a8-6bda-5637ba5e54c1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559f-b7a8-1793-9e04d7665133	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559f-b7a8-439c-6bae9771908f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559f-b7a8-798a-23cd2b754d0f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559f-b7a8-d1aa-35f091afb5c2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559f-b7a8-07f1-1f22ee21d5f6	ProgramDela-read	ProgramDela - branje	f
00030000-559f-b7a8-ba7e-aa1a46a4dfc8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559f-b7a8-72a7-2ddc200206f7	ProgramFestival-read	ProgramFestival - branje	f
00030000-559f-b7a8-7d53-33bbab4ee5c2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559f-b7a8-4892-442ff4eb5714	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559f-b7a8-73cf-2a0c9198b361	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559f-b7a8-6629-e88a8c8d363a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559f-b7a8-9b9e-23315bd932cb	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559f-b7a8-19fd-cf535785bb9e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559f-b7a8-64a3-04e014498a24	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559f-b7a8-a3b6-377287382901	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559f-b7a8-4790-75c438390f4e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559f-b7a8-00c8-e33ad7d8851f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559f-b7a8-7caa-e216394ac678	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559f-b7a8-2411-a92f44b9ee48	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559f-b7a8-8e50-2cb13ddc6ee7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559f-b7a8-004c-789de135d1d4	ProgramRazno-read	ProgramRazno - branje	f
00030000-559f-b7a8-c307-c8177b99ac5f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559f-b7a8-c0e9-ae37f19ce944	Prostor-read	Prostor - branje	f
00030000-559f-b7a8-34f7-7de176e4e71e	Prostor-write	Prostor - spreminjanje	f
00030000-559f-b7a8-5cd7-b9d953b7d5ee	Racun-read	Racun - branje	f
00030000-559f-b7a8-cf2d-3e2570100a91	Racun-write	Racun - spreminjanje	f
00030000-559f-b7a8-4456-a37841375b56	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559f-b7a8-0fc6-1451d7ad0c1c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559f-b7a8-dbbe-ef9b29cd8619	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559f-b7a8-bb4b-8eaa5a9dee33	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559f-b7a8-6b1c-47a83eab6b3e	Rekvizit-read	Rekvizit - branje	f
00030000-559f-b7a8-e03e-eee8aac8d9e7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559f-b7a8-bd7e-651cae7a712a	Revizija-read	Revizija - branje	f
00030000-559f-b7a8-ad97-43a0f7395e00	Revizija-write	Revizija - spreminjanje	f
00030000-559f-b7a8-d075-493128fe2fa7	Rezervacija-read	Rezervacija - branje	f
00030000-559f-b7a8-ba4d-f1986e505bba	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559f-b7a8-55b6-d81ddb6744ce	SedezniRed-read	SedezniRed - branje	f
00030000-559f-b7a8-5055-2f0e434481f2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559f-b7a8-f88d-31bead68fc5a	Sedez-read	Sedez - branje	f
00030000-559f-b7a8-d069-890913ede34e	Sedez-write	Sedez - spreminjanje	f
00030000-559f-b7a8-758d-cfaa32ca6834	Sezona-read	Sezona - branje	f
00030000-559f-b7a8-5268-4ae540db1856	Sezona-write	Sezona - spreminjanje	f
00030000-559f-b7a8-e897-8048ff0af3a5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559f-b7a8-efec-b1739b47ecb1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559f-b7a8-f96e-45cbd4dd5d29	Stevilcenje-read	Stevilcenje - branje	f
00030000-559f-b7a8-1285-3902a806832f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559f-b7a8-2b5c-976c2f346146	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559f-b7a8-644f-74eea8abb2ff	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559f-b7a8-1764-8f74d0b6e987	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559f-b7a8-3142-d3bfc840e768	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559f-b7a8-7a2d-e253909b80df	Telefonska-read	Telefonska - branje	f
00030000-559f-b7a8-da09-129de5696ac9	Telefonska-write	Telefonska - spreminjanje	f
00030000-559f-b7a8-e177-d7f96ef19324	TerminStoritve-read	TerminStoritve - branje	f
00030000-559f-b7a8-8f4e-c01eaf2beec1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559f-b7a8-de26-53e708536bd1	TipFunkcije-read	TipFunkcije - branje	f
00030000-559f-b7a8-d3dc-c717d270e505	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559f-b7a8-bd28-5ca8bb32dd3b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559f-b7a8-8a91-8f8cc1d9af96	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559f-b7a8-4792-b5f31fc2fc1b	Trr-read	Trr - branje	f
00030000-559f-b7a8-7025-14d9b9b3d359	Trr-write	Trr - spreminjanje	f
00030000-559f-b7a8-4295-6de6c835000a	Uprizoritev-read	Uprizoritev - branje	f
00030000-559f-b7a8-ab15-f82424a3f480	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559f-b7a8-f9ce-d35eff1e0937	Vaja-read	Vaja - branje	f
00030000-559f-b7a8-d7e0-71100a3d1ded	Vaja-write	Vaja - spreminjanje	f
00030000-559f-b7a8-8c78-b3adf28d2170	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559f-b7a8-62a7-edaeaa76c8d7	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559f-b7a8-74af-d6b072d94b51	Zaposlitev-read	Zaposlitev - branje	f
00030000-559f-b7a8-c2a1-bf351f273a5c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559f-b7a8-a300-1a461f185f52	Zasedenost-read	Zasedenost - branje	f
00030000-559f-b7a8-7ddd-151c1fac0757	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559f-b7a8-3e18-180e3b96dd42	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559f-b7a8-0f9b-221d954c9092	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559f-b7a8-534b-4dd377feb9d4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559f-b7a8-ffc5-2aba4fca3e97	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9718158)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559f-b7a8-2cac-631524678ec1	00030000-559f-b7a8-aa6d-a9cb16bedb70
00020000-559f-b7a8-9f21-b640a5cca37b	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-fb4a-3a32efbd4196
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-c825-9b4e2a279ccb
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-bc0a-2ad41bad3d91
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-b41a-e6e164584eed
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-ef11-e800611f2b6d
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-554d-622fa6a82ff9
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-32b2-c74bf89a7adc
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-ea80-25ad4c214684
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-d496-05245fb900f4
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-9af5-676cd872a896
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-0256-8bce8839b73e
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-e036-a50092eb44a5
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-c24d-1d5cd59ff9d1
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-9610-c2647a28894e
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-a5a0-555f82757471
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-2ee4-a97db42b5c47
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-8a44-b246eec96d1c
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-aec6-d8645b806299
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-de91-cdd40a057d13
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-798a-23cd2b754d0f
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-d1aa-35f091afb5c2
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-34f7-7de176e4e71e
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-bb4b-8eaa5a9dee33
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-e03e-eee8aac8d9e7
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-5268-4ae540db1856
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-de26-53e708536bd1
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-4295-6de6c835000a
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-ab15-f82424a3f480
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-f9ce-d35eff1e0937
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-d7e0-71100a3d1ded
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-a300-1a461f185f52
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-7ddd-151c1fac0757
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a8-a132-846d2c4dca92	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-0256-8bce8839b73e
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-e036-a50092eb44a5
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-c24d-1d5cd59ff9d1
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-9610-c2647a28894e
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-8a44-b246eec96d1c
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-aec6-d8645b806299
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-7a2d-e253909b80df
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-da09-129de5696ac9
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-4792-b5f31fc2fc1b
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-7025-14d9b9b3d359
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-74af-d6b072d94b51
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-c2a1-bf351f273a5c
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a8-ba47-f76dd0437c16	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-c825-9b4e2a279ccb
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-3586-946607f9d24d
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-3ebe-d697786f5fa0
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-d13b-b53a4d4f2363
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-32b2-c74bf89a7adc
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-0256-8bce8839b73e
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-c24d-1d5cd59ff9d1
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-798a-23cd2b754d0f
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-de26-53e708536bd1
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-f9ce-d35eff1e0937
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-a300-1a461f185f52
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a8-903c-90a9a8cefca0	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-fb4a-3a32efbd4196
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-bc0a-2ad41bad3d91
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-de26-53e708536bd1
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a8-3435-5e6aeb4f9636	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-e177-d7f96ef19324
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-8faa-de0e1e485291
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-de26-53e708536bd1
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a8-0040-03875b4ba930	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-1985-528dd02285b2
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-aa6d-a9cb16bedb70
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8faa-de0e1e485291
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-b41a-e6e164584eed
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e75b-a473a39a8c19
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e03b-45f970c8f04e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-21c1-f8243f838cca
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-fb4a-3a32efbd4196
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-c825-9b4e2a279ccb
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-bc0a-2ad41bad3d91
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-df32-5ab73c8071eb
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-3586-946607f9d24d
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-3ebe-d697786f5fa0
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-3c08-cc79ec082620
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d13b-b53a4d4f2363
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-dfdb-157608a174c1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e4ba-3f80034673c4
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ef11-e800611f2b6d
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7923-5b047b201a72
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-554d-622fa6a82ff9
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-00ee-25f9bba3b344
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-2003-ee7f7cea0afc
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-32b2-c74bf89a7adc
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ea80-25ad4c214684
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-122d-a3c083c18d92
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d496-05245fb900f4
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-10c6-0bc66af82985
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-9af5-676cd872a896
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-0256-8bce8839b73e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e036-a50092eb44a5
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-99c2-574df70258fa
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d38f-25dc9feac7bb
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-9d5e-8773f81d1cae
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4e74-fb3f99756ca5
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-0b57-ff31936ee7be
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-a37c-bfe0971fb928
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-a6f2-332ae7d11e24
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-64e4-eb1a31227752
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-c24d-1d5cd59ff9d1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-9610-c2647a28894e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-bd32-b9301e3ded91
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-0210-e0e7152faebe
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e0e8-3401c226a4a3
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-fc03-755d71b1fbce
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-2eaa-0c43346b1106
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-f27f-2310a895377e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-cad7-ad3fc3a9605b
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-a5a0-555f82757471
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-128b-009c08438bca
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-2ee4-a97db42b5c47
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-418e-3324d36e3299
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-6b3c-b71fc33b8af8
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8a44-b246eec96d1c
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-aec6-d8645b806299
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ee33-32f9515c63dd
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-de91-cdd40a057d13
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-272f-bfdf6b8e33de
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-6bda-5637ba5e54c1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-1793-9e04d7665133
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-439c-6bae9771908f
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-798a-23cd2b754d0f
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d1aa-35f091afb5c2
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-07f1-1f22ee21d5f6
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ba7e-aa1a46a4dfc8
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-72a7-2ddc200206f7
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7d53-33bbab4ee5c2
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4892-442ff4eb5714
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-73cf-2a0c9198b361
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-6629-e88a8c8d363a
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-9b9e-23315bd932cb
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-19fd-cf535785bb9e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-64a3-04e014498a24
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-a3b6-377287382901
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4790-75c438390f4e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-00c8-e33ad7d8851f
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7caa-e216394ac678
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-2411-a92f44b9ee48
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8e50-2cb13ddc6ee7
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-004c-789de135d1d4
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-c307-c8177b99ac5f
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-c0e9-ae37f19ce944
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-34f7-7de176e4e71e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-5cd7-b9d953b7d5ee
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-cf2d-3e2570100a91
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4456-a37841375b56
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-0fc6-1451d7ad0c1c
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-dbbe-ef9b29cd8619
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-bb4b-8eaa5a9dee33
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-6b1c-47a83eab6b3e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e03e-eee8aac8d9e7
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-bd7e-651cae7a712a
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ad97-43a0f7395e00
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d075-493128fe2fa7
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ba4d-f1986e505bba
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-55b6-d81ddb6744ce
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-5055-2f0e434481f2
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-f88d-31bead68fc5a
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d069-890913ede34e
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-758d-cfaa32ca6834
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-5268-4ae540db1856
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e897-8048ff0af3a5
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-efec-b1739b47ecb1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-f96e-45cbd4dd5d29
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-1285-3902a806832f
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-2b5c-976c2f346146
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-644f-74eea8abb2ff
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-1764-8f74d0b6e987
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-3142-d3bfc840e768
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7a2d-e253909b80df
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-da09-129de5696ac9
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-e177-d7f96ef19324
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8f4e-c01eaf2beec1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-de26-53e708536bd1
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d3dc-c717d270e505
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-bd28-5ca8bb32dd3b
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8a91-8f8cc1d9af96
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4792-b5f31fc2fc1b
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7025-14d9b9b3d359
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-4295-6de6c835000a
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ab15-f82424a3f480
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-f9ce-d35eff1e0937
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-d7e0-71100a3d1ded
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-8c78-b3adf28d2170
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-62a7-edaeaa76c8d7
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-74af-d6b072d94b51
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-c2a1-bf351f273a5c
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-a300-1a461f185f52
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-7ddd-151c1fac0757
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-3e18-180e3b96dd42
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-0f9b-221d954c9092
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-534b-4dd377feb9d4
00020000-559f-b7a9-5b8d-21dc7ed906d0	00030000-559f-b7a8-ffc5-2aba4fca3e97
\.


--
-- TOC entry 2885 (class 0 OID 9718453)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9718484)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9718597)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559f-b7a9-ad19-3c50652fca53	00090000-559f-b7a9-6df1-9038dcc80a00	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559f-b7a9-d19b-21a45376d133	00090000-559f-b7a9-68ec-9e7acd79872f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559f-b7a9-5850-ef4c0c175ef1	00090000-559f-b7a9-b3f5-9c33a3437e0b	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9718218)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559f-b7a9-9684-7ee1e3575808	00040000-559f-b7a7-5b75-3939afbe8555	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-71ea-9363c9f73aee	00040000-559f-b7a7-5b75-3939afbe8555	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559f-b7a9-563a-4681513ba35d	00040000-559f-b7a7-5b75-3939afbe8555	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-2753-167adcfc868f	00040000-559f-b7a7-5b75-3939afbe8555	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-c51b-9345525a9b9a	00040000-559f-b7a7-5b75-3939afbe8555	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-f9a5-423a5cd1b7d1	00040000-559f-b7a7-897e-fec83076388c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-6d42-597194198e0a	00040000-559f-b7a7-8a39-b4b3123ee4f9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-0446-5b8b79aec98b	00040000-559f-b7a7-7376-4cb27c405ca7	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-b7a9-28ad-fba4a11baf39	00040000-559f-b7a7-5b75-3939afbe8555	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9718253)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559f-b7a8-0983-24a30be0c864	8341	Adlešiči
00050000-559f-b7a8-4dbf-af87b5eff34f	5270	Ajdovščina
00050000-559f-b7a8-d9a5-65f6a4e0928f	6280	Ankaran/Ancarano
00050000-559f-b7a8-05fe-658631813948	9253	Apače
00050000-559f-b7a8-b751-cd29535f1afc	8253	Artiče
00050000-559f-b7a8-0944-bbf55adcee6c	4275	Begunje na Gorenjskem
00050000-559f-b7a8-4eaa-74e4a67a513f	1382	Begunje pri Cerknici
00050000-559f-b7a8-dda4-b7fbe7819047	9231	Beltinci
00050000-559f-b7a8-13ad-18c5d5a5e06e	2234	Benedikt
00050000-559f-b7a8-94c7-7d88d40bbd98	2345	Bistrica ob Dravi
00050000-559f-b7a8-ae0e-80d6b7681ae4	3256	Bistrica ob Sotli
00050000-559f-b7a8-09f4-6a5cfb4ad1a9	8259	Bizeljsko
00050000-559f-b7a8-56eb-9fbc998bbbee	1223	Blagovica
00050000-559f-b7a8-8e48-291cb24559bd	8283	Blanca
00050000-559f-b7a8-a7ae-94a96cb84123	4260	Bled
00050000-559f-b7a8-046f-c3ca853b812e	4273	Blejska Dobrava
00050000-559f-b7a8-ff03-47d76d700801	9265	Bodonci
00050000-559f-b7a8-1bae-6c70d15425f5	9222	Bogojina
00050000-559f-b7a8-1b8d-4b7322c2ce23	4263	Bohinjska Bela
00050000-559f-b7a8-4649-bc21b68a8776	4264	Bohinjska Bistrica
00050000-559f-b7a8-d828-86e8ba4b83c3	4265	Bohinjsko jezero
00050000-559f-b7a8-8af7-2cd09c85dfcb	1353	Borovnica
00050000-559f-b7a8-3f0a-27a2a96781d4	8294	Boštanj
00050000-559f-b7a8-b463-3e7e1357c727	5230	Bovec
00050000-559f-b7a8-b9d0-f5e1f1d77ff8	5295	Branik
00050000-559f-b7a8-d71b-adde223cd0c2	3314	Braslovče
00050000-559f-b7a8-f7c5-2ad309b475ea	5223	Breginj
00050000-559f-b7a8-a8a1-190d8febfd5c	8280	Brestanica
00050000-559f-b7a8-8e6e-d59ac250b3f2	2354	Bresternica
00050000-559f-b7a8-d2aa-9b89a6fea080	4243	Brezje
00050000-559f-b7a8-a5de-72210891ae2c	1351	Brezovica pri Ljubljani
00050000-559f-b7a8-51ba-586072758b97	8250	Brežice
00050000-559f-b7a8-2fdc-bb420738547d	4210	Brnik - Aerodrom
00050000-559f-b7a8-be32-4ac108839488	8321	Brusnice
00050000-559f-b7a8-314a-b45b61800af1	3255	Buče
00050000-559f-b7a8-0b86-c0f28b6e856a	8276	Bučka 
00050000-559f-b7a8-5c73-f4ba1161ccc2	9261	Cankova
00050000-559f-b7a8-de36-41b9e7e2536c	3000	Celje 
00050000-559f-b7a8-2386-d2f2559261cc	3001	Celje - poštni predali
00050000-559f-b7a8-bde0-f07039cd46b9	4207	Cerklje na Gorenjskem
00050000-559f-b7a8-7510-726f97edf4d7	8263	Cerklje ob Krki
00050000-559f-b7a8-6824-cfa859144a00	1380	Cerknica
00050000-559f-b7a8-6f64-57a3e75589c8	5282	Cerkno
00050000-559f-b7a8-94f8-b4c906710556	2236	Cerkvenjak
00050000-559f-b7a8-4b85-ad1b6114206a	2215	Ceršak
00050000-559f-b7a8-cb1c-ceb88f18c5f8	2326	Cirkovce
00050000-559f-b7a8-9f38-40dc0dcbb0f2	2282	Cirkulane
00050000-559f-b7a8-5b31-ba3edc26796c	5273	Col
00050000-559f-b7a8-3ace-eed1b9eec19a	8251	Čatež ob Savi
00050000-559f-b7a8-967a-db6c68927274	1413	Čemšenik
00050000-559f-b7a8-f900-23afcf3262a0	5253	Čepovan
00050000-559f-b7a8-41ab-b1e9d65de324	9232	Črenšovci
00050000-559f-b7a8-3338-f358c985917e	2393	Črna na Koroškem
00050000-559f-b7a8-4447-adc707d966b5	6275	Črni Kal
00050000-559f-b7a8-2a65-7917f10fb901	5274	Črni Vrh nad Idrijo
00050000-559f-b7a8-bb61-531fe06c7ec1	5262	Črniče
00050000-559f-b7a8-9d42-32afa0f5d141	8340	Črnomelj
00050000-559f-b7a8-25ad-3df75e1c1492	6271	Dekani
00050000-559f-b7a8-094a-1b04a5ff6a31	5210	Deskle
00050000-559f-b7a8-995b-762571e167c1	2253	Destrnik
00050000-559f-b7a8-7f26-4d557c9281b5	6215	Divača
00050000-559f-b7a8-a6d3-e75d1b3b866c	1233	Dob
00050000-559f-b7a8-b0cb-eaf3703ab10e	3224	Dobje pri Planini
00050000-559f-b7a8-8f05-e3c11cca8cb3	8257	Dobova
00050000-559f-b7a8-473a-fd512901bb0e	1423	Dobovec
00050000-559f-b7a8-c8cf-d83cc13fa640	5263	Dobravlje
00050000-559f-b7a8-e909-95b4e6c25ea5	3204	Dobrna
00050000-559f-b7a8-ccee-64d5bd5ab3e7	8211	Dobrnič
00050000-559f-b7a8-8d7c-f7b43c78bc4d	1356	Dobrova
00050000-559f-b7a8-d8d8-c75d214c98d7	9223	Dobrovnik/Dobronak 
00050000-559f-b7a8-19c7-356cecfb6ab6	5212	Dobrovo v Brdih
00050000-559f-b7a8-8411-b4d0302e72ef	1431	Dol pri Hrastniku
00050000-559f-b7a8-7f7b-b1649293b791	1262	Dol pri Ljubljani
00050000-559f-b7a8-8236-e29cb0be7e4e	1273	Dole pri Litiji
00050000-559f-b7a8-908f-8572976c8ecd	1331	Dolenja vas
00050000-559f-b7a8-288a-fcb13a1d10b2	8350	Dolenjske Toplice
00050000-559f-b7a8-c464-168d329e7e9e	1230	Domžale
00050000-559f-b7a8-0ce1-9b389e8c4c66	2252	Dornava
00050000-559f-b7a8-4571-1fff2f52b6d0	5294	Dornberk
00050000-559f-b7a8-90c8-ccdc61fbde8a	1319	Draga
00050000-559f-b7a8-54c9-da5b75b11db9	8343	Dragatuš
00050000-559f-b7a8-ba43-c3de39122c17	3222	Dramlje
00050000-559f-b7a8-5d72-9bc4321cd702	2370	Dravograd
00050000-559f-b7a8-d639-c3cdafa1d0b4	4203	Duplje
00050000-559f-b7a8-7f13-75f33bb26cdb	6221	Dutovlje
00050000-559f-b7a8-a4d3-e5e4de7588a0	8361	Dvor
00050000-559f-b7a8-97d0-8b420aef093e	2343	Fala
00050000-559f-b7a8-20ab-8ab624f79476	9208	Fokovci
00050000-559f-b7a8-beab-af3c5bb3545e	2313	Fram
00050000-559f-b7a8-035a-41416c083af6	3213	Frankolovo
00050000-559f-b7a8-abed-5180b68372f5	1274	Gabrovka
00050000-559f-b7a8-c8bf-bb5f913af3d2	8254	Globoko
00050000-559f-b7a8-90f0-e8db3d1a9877	5275	Godovič
00050000-559f-b7a8-7bd2-2d306f2e99f4	4204	Golnik
00050000-559f-b7a8-45cb-f5e006e2ce70	3303	Gomilsko
00050000-559f-b7a8-438d-a41a0980730d	4224	Gorenja vas
00050000-559f-b7a8-67a3-f744a1fdf49d	3263	Gorica pri Slivnici
00050000-559f-b7a8-f6eb-92321c219fc8	2272	Gorišnica
00050000-559f-b7a8-55c9-7824ec0616d3	9250	Gornja Radgona
00050000-559f-b7a8-d676-9ff938fda1f0	3342	Gornji Grad
00050000-559f-b7a8-1622-deb6c59d6b5e	4282	Gozd Martuljek
00050000-559f-b7a8-ab54-cc72300fc928	6272	Gračišče
00050000-559f-b7a8-21dd-fab682ac11c3	9264	Grad
00050000-559f-b7a8-e884-f7e806e6a72b	8332	Gradac
00050000-559f-b7a8-c643-35c3eff76481	1384	Grahovo
00050000-559f-b7a8-0e21-bfeaacce17f8	5242	Grahovo ob Bači
00050000-559f-b7a8-ac30-1591253f48c8	5251	Grgar
00050000-559f-b7a8-2764-dc423b36c947	3302	Griže
00050000-559f-b7a8-d6d2-0408e5fa7a77	3231	Grobelno
00050000-559f-b7a8-3a9a-edc33e3b70ea	1290	Grosuplje
00050000-559f-b7a8-7dd7-50d7f3b09d67	2288	Hajdina
00050000-559f-b7a8-23de-f485a5c83751	8362	Hinje
00050000-559f-b7a8-ac8a-bdd9e546ec03	2311	Hoče
00050000-559f-b7a8-6bdb-2b6f99bae7d1	9205	Hodoš/Hodos
00050000-559f-b7a8-ac60-8b3edd81c488	1354	Horjul
00050000-559f-b7a8-08e7-83b9884dd1ec	1372	Hotedršica
00050000-559f-b7a8-ea3f-501ab95230ec	1430	Hrastnik
00050000-559f-b7a8-942b-ce7f129d3c5e	6225	Hruševje
00050000-559f-b7a8-ccc6-c3e4023b1540	4276	Hrušica
00050000-559f-b7a8-b043-c377ac51dbc0	5280	Idrija
00050000-559f-b7a8-b532-da5a162bd9cd	1292	Ig
00050000-559f-b7a8-ef13-531e8317b736	6250	Ilirska Bistrica
00050000-559f-b7a8-8b04-1ed55a5d1ab0	6251	Ilirska Bistrica-Trnovo
00050000-559f-b7a8-3018-814d8088aad2	1295	Ivančna Gorica
00050000-559f-b7a8-bb7d-738dcf0dde03	2259	Ivanjkovci
00050000-559f-b7a8-bc49-fb0a91f40880	1411	Izlake
00050000-559f-b7a8-355d-0b0ddfceca78	6310	Izola/Isola
00050000-559f-b7a8-5dad-ce116163a2f2	2222	Jakobski Dol
00050000-559f-b7a8-8d10-b91b5079ff7c	2221	Jarenina
00050000-559f-b7a8-b944-c3f17a96e1f8	6254	Jelšane
00050000-559f-b7a8-bc7c-b51bfa0105bc	4270	Jesenice
00050000-559f-b7a8-e259-7acd1448341d	8261	Jesenice na Dolenjskem
00050000-559f-b7a8-ec97-2e05e2f57d6c	3273	Jurklošter
00050000-559f-b7a8-bd86-15c1cffb8498	2223	Jurovski Dol
00050000-559f-b7a8-9bb6-2d26fbd613cf	2256	Juršinci
00050000-559f-b7a8-5a34-6b832335d172	5214	Kal nad Kanalom
00050000-559f-b7a8-197e-148d5f82975b	3233	Kalobje
00050000-559f-b7a8-2876-d2af9e5831b7	4246	Kamna Gorica
00050000-559f-b7a8-1e7e-6f77e6beb6b0	2351	Kamnica
00050000-559f-b7a8-5c92-4ba7060ec2f4	1241	Kamnik
00050000-559f-b7a8-881c-bce9f63b44db	5213	Kanal
00050000-559f-b7a8-ee2c-dd51b3fe6627	8258	Kapele
00050000-559f-b7a8-59fb-fc834a0580f6	2362	Kapla
00050000-559f-b7a8-b454-4ab8b9aa66f5	2325	Kidričevo
00050000-559f-b7a8-95a1-0cbf6b9c7eae	1412	Kisovec
00050000-559f-b7a8-ccbb-d136fea7cbf3	6253	Knežak
00050000-559f-b7a8-64d0-b46b14d030ab	5222	Kobarid
00050000-559f-b7a8-9482-86b772431f55	9227	Kobilje
00050000-559f-b7a8-f39c-7f3c419317a5	1330	Kočevje
00050000-559f-b7a8-bf58-31279a10d3a0	1338	Kočevska Reka
00050000-559f-b7a8-c580-473ef54eaa8c	2276	Kog
00050000-559f-b7a8-f605-ba50d1a3b69f	5211	Kojsko
00050000-559f-b7a8-de3a-2448d8997e9f	6223	Komen
00050000-559f-b7a8-da04-a17f2e876bff	1218	Komenda
00050000-559f-b7a8-3e76-9d2d7d7962ae	6000	Koper/Capodistria 
00050000-559f-b7a8-7991-f9648ee6ec96	6001	Koper/Capodistria - poštni predali
00050000-559f-b7a8-63f9-e47840810e21	8282	Koprivnica
00050000-559f-b7a8-191a-3174bd17f799	5296	Kostanjevica na Krasu
00050000-559f-b7a8-8e16-981438e39d93	8311	Kostanjevica na Krki
00050000-559f-b7a8-c0f6-2a7f569bb626	1336	Kostel
00050000-559f-b7a8-b16a-e052b8e8d23c	6256	Košana
00050000-559f-b7a8-a282-8d894e8b7cb2	2394	Kotlje
00050000-559f-b7a8-c606-eec454abd1c5	6240	Kozina
00050000-559f-b7a8-7a35-86a99715a703	3260	Kozje
00050000-559f-b7a8-bbce-e6b30290db52	4000	Kranj 
00050000-559f-b7a8-a076-8b3c616fea0c	4001	Kranj - poštni predali
00050000-559f-b7a8-f97b-34771237d210	4280	Kranjska Gora
00050000-559f-b7a8-68ba-508550fef212	1281	Kresnice
00050000-559f-b7a8-f6a4-c547cd21751d	4294	Križe
00050000-559f-b7a8-7b1d-8cf06180b1b0	9206	Križevci
00050000-559f-b7a8-74f3-c0d9501bc09d	9242	Križevci pri Ljutomeru
00050000-559f-b7a8-ffe2-0d753d148483	1301	Krka
00050000-559f-b7a8-9ef6-10ac43268995	8296	Krmelj
00050000-559f-b7a8-6cf1-e0efa5e2a6aa	4245	Kropa
00050000-559f-b7a8-1ec5-6dcd6d82f5a4	8262	Krška vas
00050000-559f-b7a8-b234-cc828b91b194	8270	Krško
00050000-559f-b7a8-381e-1f0ade523d80	9263	Kuzma
00050000-559f-b7a8-a7c3-e70959de8588	2318	Laporje
00050000-559f-b7a8-bff7-40293346b96d	3270	Laško
00050000-559f-b7a8-26f4-cc3e1217b2cf	1219	Laze v Tuhinju
00050000-559f-b7a8-73cc-df662aae0f41	2230	Lenart v Slovenskih goricah
00050000-559f-b7a8-22e0-2422a3089dc8	9220	Lendava/Lendva
00050000-559f-b7a8-8a4a-46a636c1d6c8	4248	Lesce
00050000-559f-b7a8-7023-ce2c7f860e1a	3261	Lesično
00050000-559f-b7a8-e441-25bc3a3c8894	8273	Leskovec pri Krškem
00050000-559f-b7a8-ba55-0e7b1bf7cd70	2372	Libeliče
00050000-559f-b7a8-fa13-ea4c68a998bb	2341	Limbuš
00050000-559f-b7a8-c7ff-4ceb82e24d8b	1270	Litija
00050000-559f-b7a8-60de-219e9357d8a1	3202	Ljubečna
00050000-559f-b7a8-1fd3-499984c38d4f	1000	Ljubljana 
00050000-559f-b7a8-d808-1a8dbbd02842	1001	Ljubljana - poštni predali
00050000-559f-b7a8-85b3-d9fee24a28a8	1231	Ljubljana - Črnuče
00050000-559f-b7a8-6e68-092707f9dd63	1261	Ljubljana - Dobrunje
00050000-559f-b7a8-8284-77c38db912c9	1260	Ljubljana - Polje
00050000-559f-b7a8-bb80-92f76f638d89	1210	Ljubljana - Šentvid
00050000-559f-b7a8-e92d-228e4d0b5bb2	1211	Ljubljana - Šmartno
00050000-559f-b7a8-803d-54b2ef4edf8e	3333	Ljubno ob Savinji
00050000-559f-b7a8-959d-a5a270127a92	9240	Ljutomer
00050000-559f-b7a8-1d94-741c3e5686f4	3215	Loče
00050000-559f-b7a8-fc8f-7d3d2c7cbea1	5231	Log pod Mangartom
00050000-559f-b7a8-5bb4-448800d5f884	1358	Log pri Brezovici
00050000-559f-b7a8-ab93-15495d8c39e8	1370	Logatec
00050000-559f-b7a8-cb5c-53eff5c89364	1371	Logatec
00050000-559f-b7a8-1b2f-3132a92baebe	1434	Loka pri Zidanem Mostu
00050000-559f-b7a8-b5cc-bfe845d4ea46	3223	Loka pri Žusmu
00050000-559f-b7a8-3fb8-69afa4dfcb61	6219	Lokev
00050000-559f-b7a8-d8d9-167676982e47	1318	Loški Potok
00050000-559f-b7a8-81b1-0cb240094866	2324	Lovrenc na Dravskem polju
00050000-559f-b7a8-b53e-1671ba0cfda6	2344	Lovrenc na Pohorju
00050000-559f-b7a8-c8ad-6f05b9c41a05	3334	Luče
00050000-559f-b7a8-4a24-c189e34d2fe6	1225	Lukovica
00050000-559f-b7a8-b27b-2abd090ea0e9	9202	Mačkovci
00050000-559f-b7a8-2488-fdbb1fbe51ee	2322	Majšperk
00050000-559f-b7a8-d294-a65bf4a0a4c6	2321	Makole
00050000-559f-b7a8-0e8e-778ec9be9a4a	9243	Mala Nedelja
00050000-559f-b7a8-6cbd-d11a2767f7f1	2229	Malečnik
00050000-559f-b7a8-fd66-e106ee60ea2a	6273	Marezige
00050000-559f-b7a8-bb1a-898ed701df97	2000	Maribor 
00050000-559f-b7a8-db8f-7249e00c308f	2001	Maribor - poštni predali
00050000-559f-b7a8-3b02-0c62594d199b	2206	Marjeta na Dravskem polju
00050000-559f-b7a8-73aa-e6f7bacfc504	2281	Markovci
00050000-559f-b7a8-78a3-7cfc17305852	9221	Martjanci
00050000-559f-b7a8-ac95-178537122ede	6242	Materija
00050000-559f-b7a8-789c-e1b0ffadc361	4211	Mavčiče
00050000-559f-b7a8-5aa8-f912d98f5de5	1215	Medvode
00050000-559f-b7a8-8bb0-1ad29a87dc7f	1234	Mengeš
00050000-559f-b7a8-d0eb-42c820f24658	8330	Metlika
00050000-559f-b7a8-9707-b43d362e0c0c	2392	Mežica
00050000-559f-b7a8-c237-67333f24ca3a	2204	Miklavž na Dravskem polju
00050000-559f-b7a8-5e74-80c14930768e	2275	Miklavž pri Ormožu
00050000-559f-b7a8-f688-5466003a2636	5291	Miren
00050000-559f-b7a8-d50f-1fd5bb37a773	8233	Mirna
00050000-559f-b7a8-2376-b3d3c0ef4627	8216	Mirna Peč
00050000-559f-b7a8-f847-8f341c6d8d01	2382	Mislinja
00050000-559f-b7a8-7c6d-9962c3420734	4281	Mojstrana
00050000-559f-b7a8-9e1f-eef168c49610	8230	Mokronog
00050000-559f-b7a8-4c8d-5d6ec76794bb	1251	Moravče
00050000-559f-b7a8-b772-3c22eff5d572	9226	Moravske Toplice
00050000-559f-b7a8-49c4-f1712bee9e17	5216	Most na Soči
00050000-559f-b7a8-d109-3ec4531ac5eb	1221	Motnik
00050000-559f-b7a8-6f2f-a91d5ba579da	3330	Mozirje
00050000-559f-b7a8-ae3c-a5178244c13c	9000	Murska Sobota 
00050000-559f-b7a8-900b-38bd44838940	9001	Murska Sobota - poštni predali
00050000-559f-b7a8-3a71-d6a614983735	2366	Muta
00050000-559f-b7a8-ee5d-5dd941469665	4202	Naklo
00050000-559f-b7a8-1da8-431171dcaf58	3331	Nazarje
00050000-559f-b7a8-fab6-3a79a305ba37	1357	Notranje Gorice
00050000-559f-b7a8-2472-157ec89299ef	3203	Nova Cerkev
00050000-559f-b7a8-a596-ca23ae862ed6	5000	Nova Gorica 
00050000-559f-b7a8-78fd-698984adf915	5001	Nova Gorica - poštni predali
00050000-559f-b7a8-615d-3a48f9d5f5b1	1385	Nova vas
00050000-559f-b7a8-cc1b-8aeb9a8af845	8000	Novo mesto
00050000-559f-b7a8-c8be-bf34d4460dcf	8001	Novo mesto - poštni predali
00050000-559f-b7a8-ac95-7a306dc562f0	6243	Obrov
00050000-559f-b7a8-7fba-fbde22713c37	9233	Odranci
00050000-559f-b7a8-0771-4d543967696c	2317	Oplotnica
00050000-559f-b7a8-8f38-1c53defba512	2312	Orehova vas
00050000-559f-b7a8-f86d-4818b3df87a9	2270	Ormož
00050000-559f-b7a8-cc9a-296e26e2974e	1316	Ortnek
00050000-559f-b7a8-1850-03a0b3a77bde	1337	Osilnica
00050000-559f-b7a8-3c76-ec0c2d4f2406	8222	Otočec
00050000-559f-b7a8-dc48-e5f074591952	2361	Ožbalt
00050000-559f-b7a8-3174-119ef53b1283	2231	Pernica
00050000-559f-b7a8-d0ab-98490d0fa7c6	2211	Pesnica pri Mariboru
00050000-559f-b7a8-9586-a695ced6e3c6	9203	Petrovci
00050000-559f-b7a8-dec3-fad66794a0ad	3301	Petrovče
00050000-559f-b7a8-20b9-0f1276ffa09a	6330	Piran/Pirano
00050000-559f-b7a8-f66b-02169bd728aa	8255	Pišece
00050000-559f-b7a8-7084-5d0bd4a3513d	6257	Pivka
00050000-559f-b7a8-84d9-ed082a37ff2a	6232	Planina
00050000-559f-b7a8-6652-ca2a991bc9cf	3225	Planina pri Sevnici
00050000-559f-b7a8-6957-51439a138551	6276	Pobegi
00050000-559f-b7a8-2177-d3d81a7b8ff7	8312	Podbočje
00050000-559f-b7a8-dd33-f5ed920405e1	5243	Podbrdo
00050000-559f-b7a8-153d-80729a8a4525	3254	Podčetrtek
00050000-559f-b7a8-f66b-267e2803afe9	2273	Podgorci
00050000-559f-b7a8-ce40-6325a02366dd	6216	Podgorje
00050000-559f-b7a8-7d41-33ab2b2a2360	2381	Podgorje pri Slovenj Gradcu
00050000-559f-b7a8-a52c-8ae0bcb45a41	6244	Podgrad
00050000-559f-b7a8-7c09-dde84eed1d61	1414	Podkum
00050000-559f-b7a8-5e5e-aeed73438c2d	2286	Podlehnik
00050000-559f-b7a8-fb82-7560c86be5ee	5272	Podnanos
00050000-559f-b7a8-7119-d0b5ccafc2c6	4244	Podnart
00050000-559f-b7a8-2dde-5b01540b3374	3241	Podplat
00050000-559f-b7a8-3dbb-98cb08eaae40	3257	Podsreda
00050000-559f-b7a8-3952-3fff240a3f56	2363	Podvelka
00050000-559f-b7a8-dca5-daaf77de55bc	2208	Pohorje
00050000-559f-b7a8-0749-64708fb90601	2257	Polenšak
00050000-559f-b7a8-8cb5-2dde577cd5ea	1355	Polhov Gradec
00050000-559f-b7a8-2802-418721fae35b	4223	Poljane nad Škofjo Loko
00050000-559f-b7a8-48d2-c3bbb8dbdb51	2319	Poljčane
00050000-559f-b7a8-b075-867cf5b3000f	1272	Polšnik
00050000-559f-b7a8-3ece-85fc3649d795	3313	Polzela
00050000-559f-b7a8-a9ae-3336c9527475	3232	Ponikva
00050000-559f-b7a8-34c1-6a97b7777303	6320	Portorož/Portorose
00050000-559f-b7a8-c2b6-f35f1b075a39	6230	Postojna
00050000-559f-b7a8-550f-e9e1191f65e8	2331	Pragersko
00050000-559f-b7a8-95f8-c5fe00ee54d0	3312	Prebold
00050000-559f-b7a8-b8c7-508370484839	4205	Preddvor
00050000-559f-b7a8-0933-2bb56a143810	6255	Prem
00050000-559f-b7a8-5169-419152fdec3e	1352	Preserje
00050000-559f-b7a8-e7a3-752671542f9c	6258	Prestranek
00050000-559f-b7a8-ae5f-65975e6c15d3	2391	Prevalje
00050000-559f-b7a8-0c7e-92fec0126c74	3262	Prevorje
00050000-559f-b7a8-cf88-3e0e44992085	1276	Primskovo 
00050000-559f-b7a8-6afe-f8804a8a48c7	3253	Pristava pri Mestinju
00050000-559f-b7a8-e2e8-7a9af334bee6	9207	Prosenjakovci/Partosfalva
00050000-559f-b7a8-e602-60143087b3db	5297	Prvačina
00050000-559f-b7a8-7014-418e1e87de08	2250	Ptuj
00050000-559f-b7a8-6736-df52d4824f98	2323	Ptujska Gora
00050000-559f-b7a8-856e-4277c71bc3e3	9201	Puconci
00050000-559f-b7a8-1afc-79e25d74f7a8	2327	Rače
00050000-559f-b7a8-1167-1aaecea6c3fc	1433	Radeče
00050000-559f-b7a8-dac8-6d3dca1b1053	9252	Radenci
00050000-559f-b7a8-0b9c-21f0b049203d	2360	Radlje ob Dravi
00050000-559f-b7a8-6bbf-822a14b1ed33	1235	Radomlje
00050000-559f-b7a8-812d-8e1384b219b1	4240	Radovljica
00050000-559f-b7a8-dd84-d2b4eb352f52	8274	Raka
00050000-559f-b7a8-fdd3-49410f943cd1	1381	Rakek
00050000-559f-b7a8-5483-6c05eed67dc8	4283	Rateče - Planica
00050000-559f-b7a8-24bc-98bb8c267dc2	2390	Ravne na Koroškem
00050000-559f-b7a8-cb36-c48246a5a845	9246	Razkrižje
00050000-559f-b7a8-9f50-f2f069ae2744	3332	Rečica ob Savinji
00050000-559f-b7a8-4f52-4baca11991a1	5292	Renče
00050000-559f-b7a8-55e0-68b583bb5ae7	1310	Ribnica
00050000-559f-b7a8-4a9c-8dd836b222a0	2364	Ribnica na Pohorju
00050000-559f-b7a8-557a-2b176bc62e2b	3272	Rimske Toplice
00050000-559f-b7a8-abd3-06a56cd581a8	1314	Rob
00050000-559f-b7a8-ac80-727a17ee4cd9	5215	Ročinj
00050000-559f-b7a8-88de-e1abc659ddde	3250	Rogaška Slatina
00050000-559f-b7a8-f46c-ea2bbb383e14	9262	Rogašovci
00050000-559f-b7a8-bdef-308f1778981e	3252	Rogatec
00050000-559f-b7a8-335b-0e55df83cdb0	1373	Rovte
00050000-559f-b7a8-9676-cb38211e8976	2342	Ruše
00050000-559f-b7a8-832f-6f713f71c09e	1282	Sava
00050000-559f-b7a8-3d8b-38dccfac180e	6333	Sečovlje/Sicciole
00050000-559f-b7a8-9064-cf889bf78813	4227	Selca
00050000-559f-b7a8-f740-4996d3220730	2352	Selnica ob Dravi
00050000-559f-b7a8-b9e9-69d596ddae1f	8333	Semič
00050000-559f-b7a8-0a43-3134d9349e3f	8281	Senovo
00050000-559f-b7a8-1195-772bc783ae6a	6224	Senožeče
00050000-559f-b7a8-0219-88d5e3ea0589	8290	Sevnica
00050000-559f-b7a8-053e-267fa8d9cbd2	6210	Sežana
00050000-559f-b7a8-d115-3fd43c4fa2f1	2214	Sladki Vrh
00050000-559f-b7a8-6dc7-a80f8f22b64b	5283	Slap ob Idrijci
00050000-559f-b7a8-5899-a63d74cca128	2380	Slovenj Gradec
00050000-559f-b7a8-45bb-7c16a1171444	2310	Slovenska Bistrica
00050000-559f-b7a8-c591-6caff2daa9be	3210	Slovenske Konjice
00050000-559f-b7a8-250e-30fcacf22f51	1216	Smlednik
00050000-559f-b7a8-ddf7-07ff438c9c8c	5232	Soča
00050000-559f-b7a8-2b7f-2a76f95f368c	1317	Sodražica
00050000-559f-b7a8-2e27-5333022862e0	3335	Solčava
00050000-559f-b7a8-96b7-db8711b46137	5250	Solkan
00050000-559f-b7a8-0d26-27afcf5b37a0	4229	Sorica
00050000-559f-b7a8-98f9-8effe3ca6286	4225	Sovodenj
00050000-559f-b7a8-19dc-3c4cb724ad4a	5281	Spodnja Idrija
00050000-559f-b7a8-fac3-ec73aafce181	2241	Spodnji Duplek
00050000-559f-b7a8-a73e-f3daf26ac0c4	9245	Spodnji Ivanjci
00050000-559f-b7a8-b936-1a295c4e6fba	2277	Središče ob Dravi
00050000-559f-b7a8-aacf-24b1ae27dda2	4267	Srednja vas v Bohinju
00050000-559f-b7a8-3eaa-99385a601313	8256	Sromlje 
00050000-559f-b7a8-5da3-ad7ec383a646	5224	Srpenica
00050000-559f-b7a8-a0f2-167a94e7b788	1242	Stahovica
00050000-559f-b7a8-2b1e-1a811af7aab4	1332	Stara Cerkev
00050000-559f-b7a8-8bba-f8afbcb61e5b	8342	Stari trg ob Kolpi
00050000-559f-b7a8-4176-3b3d82d3e317	1386	Stari trg pri Ložu
00050000-559f-b7a8-d031-8b3bba69cc52	2205	Starše
00050000-559f-b7a8-17ec-b169b4655356	2289	Stoperce
00050000-559f-b7a8-758a-08d144439d25	8322	Stopiče
00050000-559f-b7a8-237c-30b3d34b38be	3206	Stranice
00050000-559f-b7a8-ca65-acf1dc092d62	8351	Straža
00050000-559f-b7a8-d5c9-e57bb6961a6d	1313	Struge
00050000-559f-b7a8-549c-ee14cbcd3bee	8293	Studenec
00050000-559f-b7a8-4bf7-4c97e09681ae	8331	Suhor
00050000-559f-b7a8-9048-d650b1d22607	2233	Sv. Ana v Slovenskih goricah
00050000-559f-b7a8-78ac-2c5cf8aede33	2235	Sv. Trojica v Slovenskih goricah
00050000-559f-b7a8-41e5-8c4693253963	2353	Sveti Duh na Ostrem Vrhu
00050000-559f-b7a8-1371-60d6b3f3ef87	9244	Sveti Jurij ob Ščavnici
00050000-559f-b7a8-89e4-b36bfb8d8535	3264	Sveti Štefan
00050000-559f-b7a8-342b-8d08909c490a	2258	Sveti Tomaž
00050000-559f-b7a8-934d-17464b947197	9204	Šalovci
00050000-559f-b7a8-b843-088942e34303	5261	Šempas
00050000-559f-b7a8-caa4-fbbfb31061a3	5290	Šempeter pri Gorici
00050000-559f-b7a8-4a86-62e9b9bcae7c	3311	Šempeter v Savinjski dolini
00050000-559f-b7a8-96c5-4ff7ce5a5e41	4208	Šenčur
00050000-559f-b7a8-6ae7-20a51733bbcf	2212	Šentilj v Slovenskih goricah
00050000-559f-b7a8-b385-434404785476	8297	Šentjanž
00050000-559f-b7a8-b2df-4b1bafc185d3	2373	Šentjanž pri Dravogradu
00050000-559f-b7a8-3f95-ed4a7d1f3846	8310	Šentjernej
00050000-559f-b7a8-7739-8ba11f2fa06a	3230	Šentjur
00050000-559f-b7a8-b075-b165b21bd223	3271	Šentrupert
00050000-559f-b7a8-6d12-81ae9c3fe1ba	8232	Šentrupert
00050000-559f-b7a8-198b-16b2bb5ebf81	1296	Šentvid pri Stični
00050000-559f-b7a8-912d-756f058165b5	8275	Škocjan
00050000-559f-b7a8-f697-8cecfa4e8d56	6281	Škofije
00050000-559f-b7a8-58f2-27ea04e6e3a2	4220	Škofja Loka
00050000-559f-b7a8-fe92-2d2ab41e185b	3211	Škofja vas
00050000-559f-b7a8-5fd0-4bcca622ee80	1291	Škofljica
00050000-559f-b7a8-1bc1-51d7c6b7540c	6274	Šmarje
00050000-559f-b7a8-c07c-0481ec9131c5	1293	Šmarje - Sap
00050000-559f-b7a8-33f0-aace54ef2d8d	3240	Šmarje pri Jelšah
00050000-559f-b7a8-be80-6bcc6193aa7b	8220	Šmarješke Toplice
00050000-559f-b7a8-8ad5-25f6ccc95d09	2315	Šmartno na Pohorju
00050000-559f-b7a8-7719-e3a079716ebe	3341	Šmartno ob Dreti
00050000-559f-b7a8-ce66-206d55ade30f	3327	Šmartno ob Paki
00050000-559f-b7a8-016d-ebf1ca4e593c	1275	Šmartno pri Litiji
00050000-559f-b7a8-e381-e71d3e0bec3e	2383	Šmartno pri Slovenj Gradcu
00050000-559f-b7a8-5383-cbf559232d40	3201	Šmartno v Rožni dolini
00050000-559f-b7a8-05c0-56385003fa20	3325	Šoštanj
00050000-559f-b7a8-d530-ee3a68939bd7	6222	Štanjel
00050000-559f-b7a8-17be-e0aceaa6dac0	3220	Štore
00050000-559f-b7a8-335e-9adf4d8918fb	3304	Tabor
00050000-559f-b7a8-ad50-0de046530978	3221	Teharje
00050000-559f-b7a8-64f7-772e64179f56	9251	Tišina
00050000-559f-b7a8-4f61-20653ba4e6b9	5220	Tolmin
00050000-559f-b7a8-d458-831af1a75d54	3326	Topolšica
00050000-559f-b7a8-4cd1-b2a0c749c42b	2371	Trbonje
00050000-559f-b7a8-e99e-295768bab194	1420	Trbovlje
00050000-559f-b7a8-be12-41a46b223c6f	8231	Trebelno 
00050000-559f-b7a8-4027-5cab840cb701	8210	Trebnje
00050000-559f-b7a8-744d-a4624b25e7e3	5252	Trnovo pri Gorici
00050000-559f-b7a8-e430-3240a54a80aa	2254	Trnovska vas
00050000-559f-b7a8-cffb-2f40cf7b48cd	1222	Trojane
00050000-559f-b7a8-b21f-1615bf06f8f5	1236	Trzin
00050000-559f-b7a8-f325-aac72e655021	4290	Tržič
00050000-559f-b7a8-65af-baa751da4138	8295	Tržišče
00050000-559f-b7a8-d572-361a8299de3a	1311	Turjak
00050000-559f-b7a8-087a-2946c73c4fa1	9224	Turnišče
00050000-559f-b7a8-91f0-7d39856831c3	8323	Uršna sela
00050000-559f-b7a8-167a-949cf4468c1d	1252	Vače
00050000-559f-b7a8-b94a-112b812ebeea	3320	Velenje 
00050000-559f-b7a8-2802-fe9036580ceb	3322	Velenje - poštni predali
00050000-559f-b7a8-c780-eb183091f672	8212	Velika Loka
00050000-559f-b7a8-7bb9-d321e6ba3d3c	2274	Velika Nedelja
00050000-559f-b7a8-d9ab-b846fb8a0c5d	9225	Velika Polana
00050000-559f-b7a8-1db1-460ad557ac35	1315	Velike Lašče
00050000-559f-b7a8-a1fe-ae7d12b87245	8213	Veliki Gaber
00050000-559f-b7a8-0e8d-e81664be812c	9241	Veržej
00050000-559f-b7a8-c3f9-b55c7db941e4	1312	Videm - Dobrepolje
00050000-559f-b7a8-100b-a846e0d1a9e8	2284	Videm pri Ptuju
00050000-559f-b7a8-1b22-0d5f4862ce14	8344	Vinica
00050000-559f-b7a8-329b-b2d70224510c	5271	Vipava
00050000-559f-b7a8-363a-50a85e6017dd	4212	Visoko
00050000-559f-b7a8-1478-d01fdec79183	1294	Višnja Gora
00050000-559f-b7a8-a7d1-ef047fb21916	3205	Vitanje
00050000-559f-b7a8-7511-154d243e8419	2255	Vitomarci
00050000-559f-b7a8-b2cc-18dd6be4803c	1217	Vodice
00050000-559f-b7a8-48f0-c8765e7df424	3212	Vojnik\t
00050000-559f-b7a8-3487-501e47863b5a	5293	Volčja Draga
00050000-559f-b7a8-4158-9c11dbb28489	2232	Voličina
00050000-559f-b7a8-a773-fcc10fb42689	3305	Vransko
00050000-559f-b7a8-a5ea-4f2b4eedf53e	6217	Vremski Britof
00050000-559f-b7a8-a02c-53aa69bb6f8d	1360	Vrhnika
00050000-559f-b7a8-fc0c-be80d1d25217	2365	Vuhred
00050000-559f-b7a8-f2c6-6dee9b14e66f	2367	Vuzenica
00050000-559f-b7a8-c33a-7596f437c9a9	8292	Zabukovje 
00050000-559f-b7a8-e55c-7fe71decdd12	1410	Zagorje ob Savi
00050000-559f-b7a8-2b51-0a63b1646382	1303	Zagradec
00050000-559f-b7a8-38cc-3ee3d851f65e	2283	Zavrč
00050000-559f-b7a8-d8a0-13abaf7319e3	8272	Zdole 
00050000-559f-b7a8-4cc7-fc17030da32d	4201	Zgornja Besnica
00050000-559f-b7a8-55d2-9cd6c0e178cf	2242	Zgornja Korena
00050000-559f-b7a8-6572-86b5ca25adf1	2201	Zgornja Kungota
00050000-559f-b7a8-7db3-db9743eb8900	2316	Zgornja Ložnica
00050000-559f-b7a8-6b77-449e4b025e54	2314	Zgornja Polskava
00050000-559f-b7a8-a8a9-00d7a0c99cc7	2213	Zgornja Velka
00050000-559f-b7a8-bf56-844f97a0277c	4247	Zgornje Gorje
00050000-559f-b7a8-642b-eac28be83292	4206	Zgornje Jezersko
00050000-559f-b7a8-b708-21877185aada	2285	Zgornji Leskovec
00050000-559f-b7a8-c5f7-7544b67d7f7e	1432	Zidani Most
00050000-559f-b7a8-0d2b-a06910de5c36	3214	Zreče
00050000-559f-b7a8-f06d-a49c680f6d5b	4209	Žabnica
00050000-559f-b7a8-0c55-312c3918e0d1	3310	Žalec
00050000-559f-b7a8-5863-da79192436f7	4228	Železniki
00050000-559f-b7a8-4eea-807e146e84ac	2287	Žetale
00050000-559f-b7a8-5df0-82597bf65025	4226	Žiri
00050000-559f-b7a8-fdd1-81c05c2f7d26	4274	Žirovnica
00050000-559f-b7a8-d03e-65f079c686a8	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9718427)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 9718238)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9718316)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9718439)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9718746)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9718757)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559f-b7a9-972d-9f88b7cf4cf9	00080000-559f-b7a9-28ad-fba4a11baf39	0900	AK
00190000-559f-b7a9-a655-7044ea2d6ec6	00080000-559f-b7a9-563a-4681513ba35d	0987	AK
00190000-559f-b7a9-ad4f-3a819199fc97	00080000-559f-b7a9-71ea-9363c9f73aee	0989	AK
00190000-559f-b7a9-6694-dd294b70a75d	00080000-559f-b7a9-2753-167adcfc868f	0986	AK
00190000-559f-b7a9-8714-b3de6bdc9ca8	00080000-559f-b7a9-f9a5-423a5cd1b7d1	0984	AK
00190000-559f-b7a9-ba29-3962a2de817a	00080000-559f-b7a9-6d42-597194198e0a	0983	AK
00190000-559f-b7a9-0bbd-c41f3d918a26	00080000-559f-b7a9-0446-5b8b79aec98b	0982	AK
\.


--
-- TOC entry 2905 (class 0 OID 9718727)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559f-b7a9-26b0-439a0fc6334e	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2850 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 9718468)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559f-b7a9-da82-40e2d5101f6d	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559f-b7a9-c2a2-1890b12dd823	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559f-b7a9-4a6e-5fffe1fc77ec	0003	Kazinska	t	84	Kazinska dvorana
00220000-559f-b7a9-0825-ac11bd3e2c9f	0004	Mali oder	t	24	Mali oder 
00220000-559f-b7a9-c2c3-b5ea2aeeb0b7	0005	Komorni oder	t	15	Komorni oder
00220000-559f-b7a9-d552-17e31f77e390	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559f-b7a9-5788-8fb3579ba400	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9718412)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9718402)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9718586)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9718536)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9718110)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2888 (class 0 OID 9718478)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9718148)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559f-b7a8-2cac-631524678ec1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559f-b7a8-9f21-b640a5cca37b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559f-b7a8-6610-5fc6c8b71cbd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559f-b7a8-0850-88916bcbb0b0	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559f-b7a8-a132-846d2c4dca92	planer	Planer dogodkov v koledarju	t
00020000-559f-b7a8-ba47-f76dd0437c16	kadrovska	Kadrovska služba	t
00020000-559f-b7a8-903c-90a9a8cefca0	arhivar	Ažuriranje arhivalij	t
00020000-559f-b7a8-3435-5e6aeb4f9636	igralec	Igralec	t
00020000-559f-b7a8-0040-03875b4ba930	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559f-b7a9-5b8d-21dc7ed906d0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9718132)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559f-b7a8-886a-22c516cbbec8	00020000-559f-b7a8-6610-5fc6c8b71cbd
00010000-559f-b7a8-c674-465d3ba9895a	00020000-559f-b7a8-6610-5fc6c8b71cbd
00010000-559f-b7a9-b613-d673c42ef8c7	00020000-559f-b7a9-5b8d-21dc7ed906d0
\.


--
-- TOC entry 2890 (class 0 OID 9718492)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9718433)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9718383)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9718796)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559f-b7a8-458c-8427cf3e8b19	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559f-b7a8-cdaf-8bf8b38f89f4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559f-b7a8-af8a-04799652ad19	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559f-b7a8-4eee-7c515844b9da	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559f-b7a8-9950-a98b56ecafaf	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9718788)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559f-b7a8-9199-ef1bfea2c5ad	00230000-559f-b7a8-4eee-7c515844b9da	popa
00240000-559f-b7a8-dc0c-8a675dc38d59	00230000-559f-b7a8-4eee-7c515844b9da	oseba
00240000-559f-b7a8-11c1-f74fbaceb63c	00230000-559f-b7a8-cdaf-8bf8b38f89f4	prostor
00240000-559f-b7a8-a97b-6ad6c39e1260	00230000-559f-b7a8-4eee-7c515844b9da	besedilo
00240000-559f-b7a8-35b4-f41252b0e1de	00230000-559f-b7a8-4eee-7c515844b9da	uprizoritev
00240000-559f-b7a8-8d42-d1d847e2c6f0	00230000-559f-b7a8-4eee-7c515844b9da	funkcija
00240000-559f-b7a8-7985-4c95c7d94ee8	00230000-559f-b7a8-4eee-7c515844b9da	tipfunkcije
00240000-559f-b7a8-c53f-98d97c76d092	00230000-559f-b7a8-4eee-7c515844b9da	alternacija
00240000-559f-b7a8-0b4c-a1cc7544070b	00230000-559f-b7a8-458c-8427cf3e8b19	pogodba
00240000-559f-b7a8-bbfb-fbcc17d73344	00230000-559f-b7a8-4eee-7c515844b9da	zaposlitev
00240000-559f-b7a8-c8bf-ae2eaa73a08e	00230000-559f-b7a8-458c-8427cf3e8b19	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9718783)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9718546)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559f-b7a9-53f3-e0cde98d0e64	000e0000-559f-b7a9-6559-8772749ee4d7	00080000-559f-b7a9-9684-7ee1e3575808	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559f-b7a9-43f5-2a910295adba	000e0000-559f-b7a9-6559-8772749ee4d7	00080000-559f-b7a9-9684-7ee1e3575808	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559f-b7a9-fc92-e4af410608aa	000e0000-559f-b7a9-6559-8772749ee4d7	00080000-559f-b7a9-c51b-9345525a9b9a	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9718210)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9718389)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559f-b7a9-b71e-f23943949d29	00180000-559f-b7a9-e6d7-041097d4329a	000c0000-559f-b7a9-d600-a08abba92bac	00090000-559f-b7a9-d266-498d9595dcdd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-b7a9-a389-cc6cb9d25146	00180000-559f-b7a9-e6d7-041097d4329a	000c0000-559f-b7a9-dcfd-663f8abd3fea	00090000-559f-b7a9-c70e-c7bb0a7ddc64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-b7a9-32e7-7972845bdca2	00180000-559f-b7a9-e6d7-041097d4329a	000c0000-559f-b7a9-393f-376008346e00	00090000-559f-b7a9-42b7-cb11e2a6814b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-b7a9-cee7-7eff03635ebb	00180000-559f-b7a9-e6d7-041097d4329a	000c0000-559f-b7a9-b6e7-f796dcc0299a	00090000-559f-b7a9-5908-f76feebdff1c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-b7a9-a910-21078bee1459	00180000-559f-b7a9-e6d7-041097d4329a	000c0000-559f-b7a9-429a-00136d743570	00090000-559f-b7a9-0c1e-0ff387c87270	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-b7a9-a494-6a83e7803321	00180000-559f-b7a9-6f54-52b979997f06	\N	00090000-559f-b7a9-0c1e-0ff387c87270	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2897 (class 0 OID 9718575)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559f-b7a8-d118-01d17038b964	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559f-b7a8-b1b0-b4906ca88580	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559f-b7a8-223f-a01f4e3711d8	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559f-b7a8-2a68-2345d779f277	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559f-b7a8-b30b-dda9548511a5	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559f-b7a8-9397-a6830ef84692	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559f-b7a8-8950-4e6cabdaf275	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559f-b7a8-0b2d-cf4451b9a456	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559f-b7a8-32e7-571ac01fe1d4	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559f-b7a8-583c-b2cb028d1b69	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559f-b7a8-f2f8-c1d62d50ba55	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559f-b7a8-8fd9-c34f7736f2ca	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559f-b7a8-4b24-b8787fe9f25b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559f-b7a8-8171-2d8834001d1d	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559f-b7a8-0bb3-c3b2796c9d2c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559f-b7a8-c7dc-e5ff9eae210f	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9718765)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559f-b7a8-7fa3-2778a14d89ae	01	Velika predstava	f	1.00	1.00
002b0000-559f-b7a8-a35f-4d9869d35a4c	02	Mala predstava	f	0.50	0.50
002b0000-559f-b7a8-c429-8466acfe1a5c	03	Mala koprodukcija	t	0.40	1.00
002b0000-559f-b7a8-1ab2-5994d230c232	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559f-b7a8-582c-921e8dcbc40f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9718273)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9718119)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559f-b7a8-c674-465d3ba9895a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhnH.3WF/zOJaMIlidRsUUNcgpn9kboK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-b678-1c3848b85924	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-8adc-4b77e911e5e0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-3972-b16442e51416	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-5538-7efd9a516aa7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-58bf-b490b1a772b0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-35a9-c20ba1611164	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-f9a9-d18f5b05cef1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-6f90-3ef7b44b5847	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-8cf8-91700545aec4	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559f-b7a9-b613-d673c42ef8c7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559f-b7a8-886a-22c516cbbec8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9718623)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559f-b7a9-1902-7e580972b915	00160000-559f-b7a9-2d3b-c42db9e2d69a	00150000-559f-b7a8-371e-15ab610685fc	00140000-559f-b7a7-c1d9-f539f1bfd273	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559f-b7a9-c2c3-b5ea2aeeb0b7
000e0000-559f-b7a9-6559-8772749ee4d7	00160000-559f-b7a9-a6db-8a3dce2e09a2	00150000-559f-b7a8-fb76-369e8ed03f9f	00140000-559f-b7a7-f7cf-c66cceee8ef2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559f-b7a9-d552-17e31f77e390
000e0000-559f-b7a9-efb5-ef2bd138469a	\N	00150000-559f-b7a8-fb76-369e8ed03f9f	00140000-559f-b7a7-f7cf-c66cceee8ef2	00190000-559f-b7a9-a655-7044ea2d6ec6	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559f-b7a9-c2c3-b5ea2aeeb0b7
000e0000-559f-b7a9-9cd7-76842fda4935	\N	00150000-559f-b7a8-fb76-369e8ed03f9f	00140000-559f-b7a7-f7cf-c66cceee8ef2	00190000-559f-b7a9-a655-7044ea2d6ec6	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559f-b7a9-c2c3-b5ea2aeeb0b7
000e0000-559f-b7a9-ffd9-0b6839319e46	\N	00150000-559f-b7a8-fb76-369e8ed03f9f	00140000-559f-b7a7-f7cf-c66cceee8ef2	00190000-559f-b7a9-a655-7044ea2d6ec6	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559f-b7a9-da82-40e2d5101f6d
\.


--
-- TOC entry 2871 (class 0 OID 9718335)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559f-b7a9-b3be-3dbea4d85d19	000e0000-559f-b7a9-6559-8772749ee4d7	1	
00200000-559f-b7a9-45a8-8f1d083eb284	000e0000-559f-b7a9-6559-8772749ee4d7	2	
\.


--
-- TOC entry 2886 (class 0 OID 9718460)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9718529)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9718367)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9718613)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559f-b7a7-c1d9-f539f1bfd273	01	Drama	drama (SURS 01)
00140000-559f-b7a7-66c7-9db09a8f129b	02	Opera	opera (SURS 02)
00140000-559f-b7a7-ad70-46f406901710	03	Balet	balet (SURS 03)
00140000-559f-b7a7-ec96-2a985dcfe019	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559f-b7a7-0a87-c5876d8c2f8e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559f-b7a7-f7cf-c66cceee8ef2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559f-b7a7-75e5-5afe752e1746	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9718519)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559f-b7a8-b388-cfeb6da5602b	01	Opera	opera
00150000-559f-b7a8-1f87-1207cfbef7bd	02	Opereta	opereta
00150000-559f-b7a8-de0e-f5c51b4b397c	03	Balet	balet
00150000-559f-b7a8-37b3-72b6352a7dd1	04	Plesne prireditve	plesne prireditve
00150000-559f-b7a8-02ba-25eab056351c	05	Lutkovno gledališče	lutkovno gledališče
00150000-559f-b7a8-e506-9ea377ce3635	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559f-b7a8-19f5-3d23f526f98d	07	Biografska drama	biografska drama
00150000-559f-b7a8-371e-15ab610685fc	08	Komedija	komedija
00150000-559f-b7a8-3769-e17e0d17ca49	09	Črna komedija	črna komedija
00150000-559f-b7a8-f98a-7be6e1d79ccd	10	E-igra	E-igra
00150000-559f-b7a8-fb76-369e8ed03f9f	11	Kriminalka	kriminalka
00150000-559f-b7a8-813f-c6e073e5f022	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9718173)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9718670)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9718660)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9718574)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9718357)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9718382)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9718781)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9718299)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9718722)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9718515)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9718333)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9718376)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9718313)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 9718425)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9718452)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9718271)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9718182)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2452 (class 2606 OID 9718206)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9718162)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9718147)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9718458)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9718491)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9718608)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9718235)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9718259)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9718431)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 9718249)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9718320)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9718443)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9718754)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9718762)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9718744)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 9718475)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9718416)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9718407)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9718596)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9718543)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9718118)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9718482)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9718136)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9718156)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9718500)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9718438)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9718388)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9718805)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9718793)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9718787)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9718556)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9718215)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9718398)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9718585)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9718775)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9718284)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9718131)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9718639)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9718342)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9718466)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9718534)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9718371)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9718621)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9718527)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9718364)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9718557)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9718558)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9718237)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2407 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2408 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2550 (class 1259 OID 9718459)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9718445)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9718444)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9718343)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9718516)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9718518)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9718517)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9718315)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9718314)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9718610)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9718611)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9718612)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2420 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2421 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2604 (class 1259 OID 9718644)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9718641)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9718645)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9718643)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9718642)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9718286)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9718285)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2411 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2450 (class 1259 OID 9718209)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9718483)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9718377)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9718163)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9718164)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9718503)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9718502)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9718501)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9718321)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9718323)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9718322)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9718795)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9718411)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9718409)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9718408)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9718410)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9718137)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9718138)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9718467)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9718432)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9718544)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9718545)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9718726)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9718723)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9718724)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9718725)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9718251)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9718250)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9718252)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9718755)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9718756)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9718674)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9718672)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9718673)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9718535)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9718420)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9718419)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9718417)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9718418)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9718662)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9718661)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9718745)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9718334)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9718782)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9718184)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9718183)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9718216)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9718217)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9718401)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9718400)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9718399)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2416 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2417 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 9718366)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9718362)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9718359)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9718360)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9718358)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9718363)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9718361)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9718236)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9718300)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9718302)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9718301)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9718303)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9718426)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9718609)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9718640)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9718207)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9718208)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9718528)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9718806)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9718272)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9718794)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9718477)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9718476)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9718671)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9718675)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9718260)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9718622)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9718763)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9718764)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9718157)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9718365)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9718942)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9718927)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9718932)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9718952)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9718922)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9718947)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9718937)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9719097)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9719102)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9718857)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9719037)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9719032)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9719027)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9718917)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9719067)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9719077)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9719072)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9718892)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9718887)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9719017)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9719107)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9719112)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9719117)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9719137)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9719122)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9719142)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9719132)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9719127)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9718882)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9718877)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9718842)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9718837)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9719047)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9718957)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9718817)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9718822)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9719062)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9719057)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9719052)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9718897)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9718907)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9718902)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9719222)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9718992)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9718982)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9718977)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9718987)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9718807)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9718812)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9719042)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9719022)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9719087)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9719092)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9719192)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9719177)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9719182)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9719187)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9718867)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9718862)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9718872)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9719202)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9719207)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9719167)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9719172)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9719157)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9719162)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9719082)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9719012)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9719007)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9718997)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9719002)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9719152)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9719147)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9719197)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9718912)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9719212)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9719217)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9718832)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9718827)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9718847)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9718852)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9718972)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9718967)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9718962)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-10 14:16:42 CEST

--
-- PostgreSQL database dump complete
--

