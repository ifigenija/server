--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-10 15:59:00 CEST

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
-- TOC entry 183 (class 1259 OID 9726531)
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
-- TOC entry 228 (class 1259 OID 9727029)
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
-- TOC entry 227 (class 1259 OID 9727012)
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
-- TOC entry 221 (class 1259 OID 9726925)
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
-- TOC entry 197 (class 1259 OID 9726710)
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
-- TOC entry 200 (class 1259 OID 9726744)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9727142)
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
-- TOC entry 192 (class 1259 OID 9726653)
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
-- TOC entry 229 (class 1259 OID 9727042)
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
-- TOC entry 216 (class 1259 OID 9726870)
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
-- TOC entry 195 (class 1259 OID 9726690)
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
-- TOC entry 199 (class 1259 OID 9726738)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9726670)
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
-- TOC entry 205 (class 1259 OID 9726787)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9726812)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9726627)
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
-- TOC entry 184 (class 1259 OID 9726540)
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
-- TOC entry 185 (class 1259 OID 9726551)
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
-- TOC entry 180 (class 1259 OID 9726505)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9726524)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9726819)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9726850)
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
-- TOC entry 224 (class 1259 OID 9726963)
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
-- TOC entry 187 (class 1259 OID 9726584)
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
-- TOC entry 189 (class 1259 OID 9726619)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9726793)
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
-- TOC entry 188 (class 1259 OID 9726604)
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
-- TOC entry 194 (class 1259 OID 9726682)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9726805)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9727112)
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
-- TOC entry 232 (class 1259 OID 9727123)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9727093)
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
-- TOC entry 212 (class 1259 OID 9726834)
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
-- TOC entry 204 (class 1259 OID 9726778)
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
-- TOC entry 203 (class 1259 OID 9726768)
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
-- TOC entry 223 (class 1259 OID 9726952)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9726902)
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
-- TOC entry 177 (class 1259 OID 9726476)
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
-- TOC entry 176 (class 1259 OID 9726474)
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
-- TOC entry 213 (class 1259 OID 9726844)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9726514)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9726498)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9726858)
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
-- TOC entry 207 (class 1259 OID 9726799)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9726749)
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
-- TOC entry 237 (class 1259 OID 9727162)
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
-- TOC entry 236 (class 1259 OID 9727154)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9727149)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9726912)
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
-- TOC entry 186 (class 1259 OID 9726576)
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
-- TOC entry 202 (class 1259 OID 9726755)
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
-- TOC entry 222 (class 1259 OID 9726941)
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
-- TOC entry 233 (class 1259 OID 9727131)
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
-- TOC entry 191 (class 1259 OID 9726639)
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
-- TOC entry 178 (class 1259 OID 9726485)
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
-- TOC entry 226 (class 1259 OID 9726989)
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
-- TOC entry 196 (class 1259 OID 9726701)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9726826)
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
-- TOC entry 218 (class 1259 OID 9726895)
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
-- TOC entry 198 (class 1259 OID 9726733)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9726979)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9726885)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9726479)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9726531)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9727029)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559f-cfa3-cc71-b7501a85f97f	000d0000-559f-cfa3-48be-05831bdb69dc	\N	00090000-559f-cfa3-91e4-aa91879a0039	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559f-cfa3-2462-08c09ce6e0ca	000d0000-559f-cfa3-f9a6-5498d76b36b9	\N	00090000-559f-cfa3-0074-f49b0f565c49	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559f-cfa3-c439-551a6046cc26	000d0000-559f-cfa3-abb4-5ae58508be18	\N	00090000-559f-cfa3-7640-db413fffc940	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559f-cfa3-66f4-5167eaa93e92	000d0000-559f-cfa3-9497-fb201b140d5a	\N	00090000-559f-cfa3-9f2d-305bc277b1f6	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559f-cfa3-b346-c7a942e64d9a	000d0000-559f-cfa3-77f9-18c56bc8518d	\N	00090000-559f-cfa3-1595-01febca37cf4	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559f-cfa3-5c01-91b4c3f517af	000d0000-559f-cfa3-8e50-c75668912a0b	\N	00090000-559f-cfa3-12eb-f2b8a4bad8cf	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559f-cfa3-32c0-9036190d1538	000d0000-559f-cfa3-ca23-2b258e807a5a	\N	00090000-559f-cfa3-3c11-f0106c702d17	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559f-cfa3-43c3-5033b2769f6b	000d0000-559f-cfa3-feb1-4aeb1459a39c	\N	00090000-559f-cfa3-6a00-fd27ea85f680	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9727012)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9726925)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559f-cfa3-2686-79b58470afaa	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559f-cfa3-bf0b-6d27daf13f37	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559f-cfa3-1f43-ab835291fbfa	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9726710)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559f-cfa3-76c8-97f09fd436d2	\N	\N	00200000-559f-cfa3-7244-a7adef78b035	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559f-cfa3-b77f-112eadbd5334	\N	\N	00200000-559f-cfa3-c5df-5e4cbaecdec0	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559f-cfa3-7681-71136adbf338	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559f-cfa3-bac7-e90f88771701	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559f-cfa3-82a9-4dbcfe5394e8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9726744)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9727142)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9726653)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559f-cfa1-d4f7-056c911a26db	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559f-cfa1-2be8-79243ce02d18	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559f-cfa1-72f7-5a1ab37eeb35	AL	ALB	008	Albania 	Albanija	\N
00040000-559f-cfa1-e2e6-6a870a847e68	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559f-cfa1-e9f3-6cc6e57031eb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559f-cfa1-be27-795ee191fe28	AD	AND	020	Andorra 	Andora	\N
00040000-559f-cfa1-775f-75945285b566	AO	AGO	024	Angola 	Angola	\N
00040000-559f-cfa1-e408-472efa9558f4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559f-cfa2-88ca-ef8c885e5d71	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559f-cfa2-dd19-a567b28b7512	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-cfa2-51fe-7bd27f72a15d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559f-cfa2-028b-9c7d47387849	AM	ARM	051	Armenia 	Armenija	\N
00040000-559f-cfa2-c076-572c8c99b10d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559f-cfa2-eccf-996c51236908	AU	AUS	036	Australia 	Avstralija	\N
00040000-559f-cfa2-c3dd-75fa4915c48f	AT	AUT	040	Austria 	Avstrija	\N
00040000-559f-cfa2-8ae4-12f80c15b297	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559f-cfa2-0c44-512cc940e7a0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559f-cfa2-bb58-aeeef6ebd4b7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559f-cfa2-1318-02f76cfecf20	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559f-cfa2-98fb-d1d8030fa3ff	BB	BRB	052	Barbados 	Barbados	\N
00040000-559f-cfa2-78d3-b0befcfb8862	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559f-cfa2-3963-5a03bf9b0f57	BE	BEL	056	Belgium 	Belgija	\N
00040000-559f-cfa2-8a0a-e50eeda0b077	BZ	BLZ	084	Belize 	Belize	\N
00040000-559f-cfa2-4d98-2d023bd706c2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559f-cfa2-b389-5bfac9330604	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559f-cfa2-5b5c-c28ce2711c43	BT	BTN	064	Bhutan 	Butan	\N
00040000-559f-cfa2-8bff-83f6c2ba465e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559f-cfa2-e023-11b27d7efe16	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559f-cfa2-69aa-46ec43169d7c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559f-cfa2-c805-29ed660707ac	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559f-cfa2-5332-7fcfba42e108	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559f-cfa2-c96b-eb14c12154a2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559f-cfa2-4016-0ee52ca3e3a9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559f-cfa2-8afa-34f234486452	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559f-cfa2-984f-ad0d81a44f1c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559f-cfa2-572e-411493dea1af	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559f-cfa2-b64c-054c8a74ab25	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559f-cfa2-aa15-57b97bf84078	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559f-cfa2-08de-a217a7142e64	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559f-cfa2-48aa-d0e20ac06289	CA	CAN	124	Canada 	Kanada	\N
00040000-559f-cfa2-dde3-f475b2fb9062	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559f-cfa2-25cc-b656a0267d6b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559f-cfa2-8b5b-c74fba797795	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559f-cfa2-e658-43e2f33c6ccf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559f-cfa2-63d5-52efae499dfd	CL	CHL	152	Chile 	Čile	\N
00040000-559f-cfa2-ee4a-8f71dcd1d81b	CN	CHN	156	China 	Kitajska	\N
00040000-559f-cfa2-37cf-6131ac04d1a7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559f-cfa2-04c5-7db64d1e9690	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559f-cfa2-1bc6-08a98ab524c5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559f-cfa2-73b4-c4eaf1ade2e2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559f-cfa2-f132-1aa728c7bbb1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559f-cfa2-e14e-8a5aacfdc9f4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559f-cfa2-51d2-60e4bdadac84	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559f-cfa2-ddb5-4c74469b9aed	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559f-cfa2-ffc2-ab21f04609d8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559f-cfa2-e1c5-0be26f42dc48	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559f-cfa2-db7c-2d023ed76701	CU	CUB	192	Cuba 	Kuba	\N
00040000-559f-cfa2-4ce5-20d4eed4fec6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559f-cfa2-d4c2-6c3419414bab	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559f-cfa2-3b03-e26df58d138f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559f-cfa2-2510-5b3158d7146e	DK	DNK	208	Denmark 	Danska	\N
00040000-559f-cfa2-2608-1b85dca80a38	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559f-cfa2-44b4-84379abe2dc3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-cfa2-4518-da369aadb91f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559f-cfa2-8648-23983b26ac6c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559f-cfa2-846f-0f93c1cd6527	EG	EGY	818	Egypt 	Egipt	\N
00040000-559f-cfa2-2557-9b17b9ac9c2f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559f-cfa2-afa9-984b0bee38a9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559f-cfa2-deb7-bb90db6659d9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559f-cfa2-4f4e-8cf6b8bda2a5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559f-cfa2-c7c0-2a3554589228	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559f-cfa2-a71e-72e5611d36ff	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559f-cfa2-9671-6afa62e2dee6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559f-cfa2-046d-c96284bcf613	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559f-cfa2-f13d-0c3eee2c2677	FI	FIN	246	Finland 	Finska	\N
00040000-559f-cfa2-1559-c582acce9fb3	FR	FRA	250	France 	Francija	\N
00040000-559f-cfa2-af5e-754821cde2ce	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559f-cfa2-c8bc-39015359696a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559f-cfa2-8540-2e7f753dbc8a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559f-cfa2-7c5c-721ef1c975da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559f-cfa2-8e5d-001da5914f52	GA	GAB	266	Gabon 	Gabon	\N
00040000-559f-cfa2-f34f-70268ce42654	GM	GMB	270	Gambia 	Gambija	\N
00040000-559f-cfa2-7d8f-c58e2715401b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559f-cfa2-7ad0-24f961bbeda5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559f-cfa2-dddd-41c5e1e098e2	GH	GHA	288	Ghana 	Gana	\N
00040000-559f-cfa2-622d-e0dc75f5c92f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559f-cfa2-d611-f1cfe7826475	GR	GRC	300	Greece 	Grčija	\N
00040000-559f-cfa2-c5f4-ff34244dc1b5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559f-cfa2-d024-b16f0893d6ef	GD	GRD	308	Grenada 	Grenada	\N
00040000-559f-cfa2-42c1-0bfcc37f3233	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559f-cfa2-3a59-fe3633f458c9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559f-cfa2-0097-7c5665caa71a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559f-cfa2-76a6-73933b87930a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559f-cfa2-684a-c3074df10d8b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559f-cfa2-a6e7-926305f87bed	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559f-cfa2-7eb4-0131e78bd2b1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559f-cfa2-eea7-a076d009db11	HT	HTI	332	Haiti 	Haiti	\N
00040000-559f-cfa2-394b-bfc7bea82a39	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559f-cfa2-1fd1-3dc4b94af0e2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559f-cfa2-b269-a15cca771f0a	HN	HND	340	Honduras 	Honduras	\N
00040000-559f-cfa2-da45-5a98c887bc3f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559f-cfa2-cf7e-d57a6bc57676	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559f-cfa2-a448-3fb5653be8ef	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559f-cfa2-61ea-4aa5dc6719f3	IN	IND	356	India 	Indija	\N
00040000-559f-cfa2-cf22-6f65409f0b10	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559f-cfa2-07cd-d1f64ed4e980	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559f-cfa2-d5d5-1aa94eb4457e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559f-cfa2-9752-27e0ac5cc29a	IE	IRL	372	Ireland 	Irska	\N
00040000-559f-cfa2-59f3-37cfd6a43315	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559f-cfa2-4af3-7d91d03ab965	IL	ISR	376	Israel 	Izrael	\N
00040000-559f-cfa2-9d53-987143dc1ca2	IT	ITA	380	Italy 	Italija	\N
00040000-559f-cfa2-63a7-51d147fdd060	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559f-cfa2-1b63-8c032200fba0	JP	JPN	392	Japan 	Japonska	\N
00040000-559f-cfa2-cd6f-52526dcf16e3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559f-cfa2-7af3-78a4c3cb672f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559f-cfa2-e20d-57375bc05f60	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559f-cfa2-61ec-a7e92777f630	KE	KEN	404	Kenya 	Kenija	\N
00040000-559f-cfa2-ce0b-b4c71a07adee	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559f-cfa2-4f8d-80b719d065b7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559f-cfa2-0d85-826d0ad991f7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559f-cfa2-22e3-1a2956a18ebb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559f-cfa2-87b8-ef35a9fabc36	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559f-cfa2-0ffd-1b5c5f2ac4a7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559f-cfa2-4826-5b3c003f231f	LV	LVA	428	Latvia 	Latvija	\N
00040000-559f-cfa2-4d8c-fccdc2958a39	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559f-cfa2-e967-beb7155ee898	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559f-cfa2-ccee-79f4b17754b8	LR	LBR	430	Liberia 	Liberija	\N
00040000-559f-cfa2-ac71-af7f1cbefa7b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559f-cfa2-5ebe-d7e75261abb3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559f-cfa2-bc22-8198a985ae0a	LT	LTU	440	Lithuania 	Litva	\N
00040000-559f-cfa2-ad6d-309b106a0c0a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559f-cfa2-6d27-129d2ed759a7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559f-cfa2-81fc-8b852a33bdaa	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559f-cfa2-ac20-dd7272c1d423	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559f-cfa2-6088-aa0bada26b48	MW	MWI	454	Malawi 	Malavi	\N
00040000-559f-cfa2-99cb-35ac1cf775da	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559f-cfa2-185b-5cbdda795507	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559f-cfa2-5231-211d32583fa8	ML	MLI	466	Mali 	Mali	\N
00040000-559f-cfa2-ccd4-5e740f58f566	MT	MLT	470	Malta 	Malta	\N
00040000-559f-cfa2-1514-14de785ee162	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559f-cfa2-b95d-6de438ebbacb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559f-cfa2-33d9-5d93de807bf7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559f-cfa2-47ef-75b4bce9e7d4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559f-cfa2-4f58-8e6b77f9f9e2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559f-cfa2-d0ed-219e7289fe00	MX	MEX	484	Mexico 	Mehika	\N
00040000-559f-cfa2-6f19-5669de9c19e1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559f-cfa2-0466-53eac7927b5f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559f-cfa2-79fd-70ff7d695384	MC	MCO	492	Monaco 	Monako	\N
00040000-559f-cfa2-5c9f-47282da76dbe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559f-cfa2-1601-07d822aa5b71	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559f-cfa2-cf6a-6dbaf7182d28	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559f-cfa2-72d6-9a56dd6f205b	MA	MAR	504	Morocco 	Maroko	\N
00040000-559f-cfa2-f039-cc447b01e758	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559f-cfa2-0c57-50579dcf66c7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559f-cfa2-29a7-4c36395310c2	NA	NAM	516	Namibia 	Namibija	\N
00040000-559f-cfa2-c5f9-3ea28c100744	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559f-cfa2-1a7c-fe5fbef10a2c	NP	NPL	524	Nepal 	Nepal	\N
00040000-559f-cfa2-30a1-73591e7afa0e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559f-cfa2-dde0-aafe12581799	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559f-cfa2-f453-6d9a5e05cda0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559f-cfa2-3e1c-4895050add41	NE	NER	562	Niger 	Niger 	\N
00040000-559f-cfa2-0fa6-77ab1b9646d0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559f-cfa2-b101-ddd559b56908	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559f-cfa2-4ffc-09633ee19ad2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559f-cfa2-e8be-473d04d6285d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559f-cfa2-56c4-de0277c23047	NO	NOR	578	Norway 	Norveška	\N
00040000-559f-cfa2-8f3d-57dc1ee79f94	OM	OMN	512	Oman 	Oman	\N
00040000-559f-cfa2-0142-e2f834846b1d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559f-cfa2-0140-bed955a6ab8e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559f-cfa2-89ce-f75293671a74	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559f-cfa2-1d79-3b3c3db42cca	PA	PAN	591	Panama 	Panama	\N
00040000-559f-cfa2-c20a-39a1f7b462f1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559f-cfa2-446d-eae1fba2c5a0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559f-cfa2-677b-30791f2dd879	PE	PER	604	Peru 	Peru	\N
00040000-559f-cfa2-4c65-662dcdb39535	PH	PHL	608	Philippines 	Filipini	\N
00040000-559f-cfa2-e71d-4fb329abbe9a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559f-cfa2-c7f5-a3a9a8bcb8dd	PL	POL	616	Poland 	Poljska	\N
00040000-559f-cfa2-f4ce-c4098c5f60d1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559f-cfa2-37aa-be40f664c13f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559f-cfa2-0618-49c208ec8742	QA	QAT	634	Qatar 	Katar	\N
00040000-559f-cfa2-a9a1-760712876347	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559f-cfa2-7efe-c098dc8e1d04	RO	ROU	642	Romania 	Romunija	\N
00040000-559f-cfa2-5134-8c9a8417df58	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559f-cfa2-66a3-daa42d18e63b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559f-cfa2-4aff-83fd7b564890	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559f-cfa2-7735-b11aad0b9f9e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559f-cfa2-49f0-3c4047abcac8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559f-cfa2-f2d1-7d93f4bd71a3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559f-cfa2-c724-54815ace3268	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559f-cfa2-d5bd-81a36936d778	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559f-cfa2-2204-a7a5d64bb95e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559f-cfa2-a496-7a4a2745bb4a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559f-cfa2-c567-2536da3bd9a1	SM	SMR	674	San Marino 	San Marino	\N
00040000-559f-cfa2-5e5d-e83f4b017502	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559f-cfa2-3cab-87dd53a516ef	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559f-cfa2-f4d3-99ca30d5f227	SN	SEN	686	Senegal 	Senegal	\N
00040000-559f-cfa2-6235-2b3a32a796d1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559f-cfa2-5965-c4da50f98dc7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559f-cfa2-f269-968309903af7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559f-cfa2-7c6a-a0f497d747eb	SG	SGP	702	Singapore 	Singapur	\N
00040000-559f-cfa2-b803-58795a92fffc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559f-cfa2-e8da-e626dcd6bfed	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559f-cfa2-b8be-05a7ba81212b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559f-cfa2-ced2-9ebae40caeb8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559f-cfa2-2f58-4fce5d82ad7c	SO	SOM	706	Somalia 	Somalija	\N
00040000-559f-cfa2-d6f8-e94aeb54f652	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559f-cfa2-0b5a-356e9c715e31	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559f-cfa2-ab74-d8c07829e316	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559f-cfa2-ac66-232461946c98	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559f-cfa2-d794-925ddf458443	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559f-cfa2-8934-d31b7dcc646e	SD	SDN	729	Sudan 	Sudan	\N
00040000-559f-cfa2-da29-f68243f31aab	SR	SUR	740	Suriname 	Surinam	\N
00040000-559f-cfa2-beab-1fb726e41fb3	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559f-cfa2-b3a8-9da31582679e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559f-cfa2-3d47-acb6a4a9ebf6	SE	SWE	752	Sweden 	Švedska	\N
00040000-559f-cfa2-524c-c0a1de8f54d5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559f-cfa2-0c8d-9df8f940c11a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559f-cfa2-84e7-075663caa6b9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559f-cfa2-afe0-397abbb7c86f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559f-cfa2-e7d5-8c3ce478d34c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559f-cfa2-b6c4-783115c30b3c	TH	THA	764	Thailand 	Tajska	\N
00040000-559f-cfa2-69ab-e9fc83bce475	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559f-cfa2-fd8f-bdf39cf3b0de	TG	TGO	768	Togo 	Togo	\N
00040000-559f-cfa2-4a1f-d9f698ddb743	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559f-cfa2-f321-7f8899fc2a56	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559f-cfa2-9080-ad58e8a6f723	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559f-cfa2-cdc2-d6296dc1e87c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559f-cfa2-a71c-99afc046ff72	TR	TUR	792	Turkey 	Turčija	\N
00040000-559f-cfa2-ce4e-f1ba84dc9d57	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559f-cfa2-dae3-9544557f02d7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-cfa2-cc1d-fefbf68b31c4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559f-cfa2-5291-d8cae23290e1	UG	UGA	800	Uganda 	Uganda	\N
00040000-559f-cfa2-9231-5505c24d31c9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559f-cfa2-1cb6-d82143ae18f7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559f-cfa2-84cc-bc5cf4eabe38	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559f-cfa2-3919-bb0417cddda1	US	USA	840	United States 	Združene države Amerike	\N
00040000-559f-cfa2-b415-534f46b8995a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559f-cfa2-2a52-ca852ee4f39d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559f-cfa2-b277-5b09f5238cae	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559f-cfa2-1712-ea320491871f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559f-cfa2-bdcf-d075b059b5e9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559f-cfa2-052b-c7c5f9a1c92f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559f-cfa2-ac18-eaa26a8d790f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-cfa2-015a-57d4290fbd19	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559f-cfa2-a586-561aa7338ebc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559f-cfa2-d36d-16cf4153e276	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559f-cfa2-de3c-3e0614247d35	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559f-cfa2-10ca-18de18e4457c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559f-cfa2-6c0b-bfd90c2cbb67	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9727042)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559f-cfa3-5eef-67a5a28e735b	000e0000-559f-cfa3-de0a-d62e18a125c9	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559f-cfa2-5080-3773c5416835	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559f-cfa3-4a76-5026dcdc56e5	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559f-cfa2-a3b1-17b0358d9930	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9726870)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559f-cfa3-ca23-2b258e807a5a	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559f-cfa2-8140-84a02f396fda
000d0000-559f-cfa3-48be-05831bdb69dc	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-cfa2-8140-84a02f396fda
000d0000-559f-cfa3-f9a6-5498d76b36b9	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559f-cfa2-5e72-a513fd021da0
000d0000-559f-cfa3-abb4-5ae58508be18	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559f-cfa2-3204-01bbe3bc1d5c
000d0000-559f-cfa3-9497-fb201b140d5a	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559f-cfa2-3204-01bbe3bc1d5c
000d0000-559f-cfa3-77f9-18c56bc8518d	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559f-cfa2-3204-01bbe3bc1d5c
000d0000-559f-cfa3-8e50-c75668912a0b	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-cfa2-8140-84a02f396fda
000d0000-559f-cfa3-feb1-4aeb1459a39c	000e0000-559f-cfa3-2b4c-18ee70d31f14	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559f-cfa2-ef17-053c777bdec3
\.


--
-- TOC entry 2870 (class 0 OID 9726690)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9726738)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9726670)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559f-cfa3-aede-2ef796e451f0	00080000-559f-cfa3-0f0c-177ff59975e7	00090000-559f-cfa3-91e4-aa91879a0039	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9726787)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9726812)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9726627)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559f-cfa2-5124-a863ce293594	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559f-cfa2-f75f-14b568d98ba3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559f-cfa2-d391-2e1b826540bc	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559f-cfa2-fb02-a6de399c7859	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559f-cfa2-103f-a02ae4da221b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559f-cfa2-281e-f5575e71381f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559f-cfa2-4946-570551343550	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559f-cfa2-5799-d8a8b975305e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-cfa2-493e-8ee456d0fdd9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-cfa2-5ff3-59173a812a18	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559f-cfa2-ed8f-c1344ab3ad06	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559f-cfa2-cc26-493072f6761d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559f-cfa2-4136-f8cdfe4c0603	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559f-cfa3-b4a0-0ef79d7c90c5	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559f-cfa3-ecf8-3c8a4f1bd15f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559f-cfa3-2250-85d24bee2fa9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559f-cfa3-e34b-ba8b7c3756c2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559f-cfa3-de83-d60bba14c04e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559f-cfa3-5308-b628c41dd7f8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9726540)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559f-cfa3-91db-32b4eb6247ca	00000000-559f-cfa3-ecf8-3c8a4f1bd15f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559f-cfa3-1889-73066ab85c64	00000000-559f-cfa3-ecf8-3c8a4f1bd15f	00010000-559f-cfa2-10dd-1def035fbe5d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559f-cfa3-d469-cfcf61fcedaa	00000000-559f-cfa3-2250-85d24bee2fa9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9726551)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559f-cfa3-a72b-59a32c309625	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559f-cfa3-9f2d-305bc277b1f6	00010000-559f-cfa3-b622-b8812ddb224c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559f-cfa3-7640-db413fffc940	00010000-559f-cfa3-d719-3332568c5296	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559f-cfa3-54a4-37b8e3fdd88a	00010000-559f-cfa3-0fe9-c296e02b3db3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559f-cfa3-56b1-c9fe031ebfd5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559f-cfa3-12eb-f2b8a4bad8cf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559f-cfa3-aaa9-3c36eb2d4efc	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559f-cfa3-3c11-f0106c702d17	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559f-cfa3-91e4-aa91879a0039	00010000-559f-cfa3-7895-3f36c29ab595	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559f-cfa3-0074-f49b0f565c49	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559f-cfa3-d6ca-f30544bcd196	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559f-cfa3-1595-01febca37cf4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559f-cfa3-6a00-fd27ea85f680	00010000-559f-cfa3-46ca-b45dce95f9c5	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9726505)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559f-cfa2-b534-eff20fabc6af	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559f-cfa2-a096-fd58d6a7e2fb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559f-cfa2-dcf2-df426f488ff4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559f-cfa2-fd97-187a7c9f856b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559f-cfa2-67e0-7fe0ee3be75b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559f-cfa2-ca1d-7ee2417ad515	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559f-cfa2-6c40-249e4d53fdf0	Abonma-read	Abonma - branje	f
00030000-559f-cfa2-eaab-25bf78c65d80	Abonma-write	Abonma - spreminjanje	f
00030000-559f-cfa2-bdb2-e9e6d7ac7909	Alternacija-read	Alternacija - branje	f
00030000-559f-cfa2-d458-7978e7d4d705	Alternacija-write	Alternacija - spreminjanje	f
00030000-559f-cfa2-0018-e4cfb36d4cce	Arhivalija-read	Arhivalija - branje	f
00030000-559f-cfa2-1593-beb8369236fe	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559f-cfa2-6bec-2c024b31973c	Besedilo-read	Besedilo - branje	f
00030000-559f-cfa2-7252-01e70bec023f	Besedilo-write	Besedilo - spreminjanje	f
00030000-559f-cfa2-da20-692146a93c4f	DogodekIzven-read	DogodekIzven - branje	f
00030000-559f-cfa2-151b-0d3065ba1839	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559f-cfa2-565e-a9015ca11800	Dogodek-read	Dogodek - branje	f
00030000-559f-cfa2-c44e-15e1f6c3392a	Dogodek-write	Dogodek - spreminjanje	f
00030000-559f-cfa2-bb39-3bb7442eceac	DrugiVir-read	DrugiVir - branje	f
00030000-559f-cfa2-5e76-80993369e9b0	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559f-cfa2-3cf0-b46602a4ecbb	Drzava-read	Drzava - branje	f
00030000-559f-cfa2-0f57-60ea02c42f52	Drzava-write	Drzava - spreminjanje	f
00030000-559f-cfa2-4ab6-b2046a00d764	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559f-cfa2-1210-c4d757ce17b2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559f-cfa2-df13-dd419c4a9ec9	Funkcija-read	Funkcija - branje	f
00030000-559f-cfa2-9716-1a24a8e12d80	Funkcija-write	Funkcija - spreminjanje	f
00030000-559f-cfa2-f6ee-b4473d555653	Gostovanje-read	Gostovanje - branje	f
00030000-559f-cfa2-546e-0d0d11b091d8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559f-cfa2-d1d7-32a4d464d786	Gostujoca-read	Gostujoca - branje	f
00030000-559f-cfa2-cb7c-b6377ba54af4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559f-cfa2-a9d4-0b536f5a7227	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559f-cfa2-a975-a2321985e463	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559f-cfa2-a252-a5779a700256	Kupec-read	Kupec - branje	f
00030000-559f-cfa2-ec60-d24f191ba74e	Kupec-write	Kupec - spreminjanje	f
00030000-559f-cfa2-ced6-2edcdeb84bba	NacinPlacina-read	NacinPlacina - branje	f
00030000-559f-cfa2-54e6-3d2e00c32a3a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559f-cfa2-511b-7b5ea74c4803	Option-read	Option - branje	f
00030000-559f-cfa2-e6c2-feb89d670536	Option-write	Option - spreminjanje	f
00030000-559f-cfa2-1602-edf4db36ebe7	OptionValue-read	OptionValue - branje	f
00030000-559f-cfa2-3d91-22acc1fbe7a3	OptionValue-write	OptionValue - spreminjanje	f
00030000-559f-cfa2-0f1d-9844f672346e	Oseba-read	Oseba - branje	f
00030000-559f-cfa2-370f-3488a372b4d2	Oseba-write	Oseba - spreminjanje	f
00030000-559f-cfa2-1118-1b25cea11c4d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559f-cfa2-9360-82ba89335981	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559f-cfa2-0d7c-89418e0a2de2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559f-cfa2-bc91-33ce89b9d4d0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559f-cfa2-2070-22662ee2a166	Pogodba-read	Pogodba - branje	f
00030000-559f-cfa2-4b47-f23ded2e0f44	Pogodba-write	Pogodba - spreminjanje	f
00030000-559f-cfa2-5834-41d6b4dc08c9	Popa-read	Popa - branje	f
00030000-559f-cfa2-4c19-ed17e5a0712e	Popa-write	Popa - spreminjanje	f
00030000-559f-cfa2-a93e-0812fb231bc9	Posta-read	Posta - branje	f
00030000-559f-cfa2-a8d9-296a771c17f3	Posta-write	Posta - spreminjanje	f
00030000-559f-cfa2-d942-9667b3030c25	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559f-cfa2-3763-b64ad9c1f450	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559f-cfa2-d7f9-2efe8c0f64bd	PostniNaslov-read	PostniNaslov - branje	f
00030000-559f-cfa2-a156-0e30c1faf396	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559f-cfa2-614e-3bfe1c518aa0	Predstava-read	Predstava - branje	f
00030000-559f-cfa2-80a9-967bc7ff2d04	Predstava-write	Predstava - spreminjanje	f
00030000-559f-cfa2-2f24-657cc079919b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559f-cfa2-0566-9f24c137e1b0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559f-cfa2-ca1f-d050d4924e08	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559f-cfa2-3343-85dbb31757cf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559f-cfa2-d377-b5b09f9d2955	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559f-cfa2-b56f-49cee4abe066	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559f-cfa2-df7b-16908d326423	ProgramDela-read	ProgramDela - branje	f
00030000-559f-cfa2-8296-90dc843419ad	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559f-cfa2-5990-124f2eca027d	ProgramFestival-read	ProgramFestival - branje	f
00030000-559f-cfa2-83e5-c0fd1e68cd4b	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559f-cfa2-ed8f-4d2dbe4bd42f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559f-cfa2-0170-32742e701a82	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559f-cfa2-1610-603d3e3f4d64	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559f-cfa2-3dbc-8b1c6c177ada	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559f-cfa2-1fb8-8b38ea83d865	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559f-cfa2-f0ef-0eab94fbd829	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559f-cfa2-1a41-fa6a7ab15f2c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559f-cfa2-2710-aca586e2aeda	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559f-cfa2-12f8-12c5782a269e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559f-cfa2-79df-5347b6c161d4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559f-cfa2-9245-d0abb905e6ea	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559f-cfa2-1bdc-72b8b35a0d8a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559f-cfa2-8d94-f71140dce9f6	ProgramRazno-read	ProgramRazno - branje	f
00030000-559f-cfa2-e62a-c3507df71ca6	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559f-cfa2-6831-4e57110263db	Prostor-read	Prostor - branje	f
00030000-559f-cfa2-a73d-b11f92c1fe7e	Prostor-write	Prostor - spreminjanje	f
00030000-559f-cfa2-72c8-0cd4faf4df69	Racun-read	Racun - branje	f
00030000-559f-cfa2-8436-8deef7baaf27	Racun-write	Racun - spreminjanje	f
00030000-559f-cfa2-e22d-c92d414c63ac	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559f-cfa2-e28d-f054376568bb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559f-cfa2-9bc0-0f5fe0e3d75f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559f-cfa2-ab18-c1a10ee92c3b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559f-cfa2-9c56-e4d5f7e7783c	Rekvizit-read	Rekvizit - branje	f
00030000-559f-cfa2-5a24-656a573a9f9d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559f-cfa2-5216-e14864dc4bb4	Revizija-read	Revizija - branje	f
00030000-559f-cfa2-9e7c-da6f34d9829b	Revizija-write	Revizija - spreminjanje	f
00030000-559f-cfa2-80b9-4be5b147cdb9	Rezervacija-read	Rezervacija - branje	f
00030000-559f-cfa2-53b8-47984d20c628	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559f-cfa2-0894-e633edaec821	SedezniRed-read	SedezniRed - branje	f
00030000-559f-cfa2-dffa-89d6fb371a4d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559f-cfa2-2323-72f73c245a98	Sedez-read	Sedez - branje	f
00030000-559f-cfa2-a180-31d37da61756	Sedez-write	Sedez - spreminjanje	f
00030000-559f-cfa2-4dc8-4ae44c08761f	Sezona-read	Sezona - branje	f
00030000-559f-cfa2-b4af-f6b20911e57b	Sezona-write	Sezona - spreminjanje	f
00030000-559f-cfa2-23fe-53e44d0684c5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559f-cfa2-eae1-0da7cbd890b9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559f-cfa2-7e9d-7c7af23b7f63	Stevilcenje-read	Stevilcenje - branje	f
00030000-559f-cfa2-3f5d-553a8670e7e2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559f-cfa2-7d9d-3cf11de084d5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559f-cfa2-f489-81f9e629b659	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559f-cfa2-561b-63c685bb436b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559f-cfa2-e7e8-5143cd71686c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559f-cfa2-47d0-ef6c972053bd	Telefonska-read	Telefonska - branje	f
00030000-559f-cfa2-c04b-9f843de2b2cf	Telefonska-write	Telefonska - spreminjanje	f
00030000-559f-cfa2-7503-ce93785935e6	TerminStoritve-read	TerminStoritve - branje	f
00030000-559f-cfa2-f52c-795189bd82cf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559f-cfa2-546e-8e7e9f8d1b67	TipFunkcije-read	TipFunkcije - branje	f
00030000-559f-cfa2-09ac-34c678746ca9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559f-cfa2-a170-fa5ee9ef049c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559f-cfa2-2884-cd374eedcfef	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559f-cfa2-c774-44b4b02f0a36	Trr-read	Trr - branje	f
00030000-559f-cfa2-7fd2-106a9e2942e9	Trr-write	Trr - spreminjanje	f
00030000-559f-cfa2-ea48-9ecb86fb710b	Uprizoritev-read	Uprizoritev - branje	f
00030000-559f-cfa2-5394-8f2e00fe0ad9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559f-cfa2-5b80-75592839c2c2	Vaja-read	Vaja - branje	f
00030000-559f-cfa2-20b8-d72fe7ab760f	Vaja-write	Vaja - spreminjanje	f
00030000-559f-cfa2-86ee-d7b72fe0d147	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559f-cfa2-e691-f4cd7caa0e87	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559f-cfa2-9267-6ad588c3c57e	Zaposlitev-read	Zaposlitev - branje	f
00030000-559f-cfa2-7325-34ee5239a756	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559f-cfa2-3bf1-b9fbe8914a38	Zasedenost-read	Zasedenost - branje	f
00030000-559f-cfa2-3c1a-3dbc72e17670	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559f-cfa2-719c-014c1502315d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559f-cfa2-97aa-b6bb14699469	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559f-cfa2-109f-64a948d42897	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559f-cfa2-4c56-395f61d962d8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9726524)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559f-cfa2-0f86-a39cd64ae613	00030000-559f-cfa2-a096-fd58d6a7e2fb
00020000-559f-cfa2-f5d9-d7a5e406e64f	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-eaab-25bf78c65d80
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-bdb2-e9e6d7ac7909
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-d458-7978e7d4d705
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-fd97-187a7c9f856b
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-c44e-15e1f6c3392a
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-0f57-60ea02c42f52
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-df13-dd419c4a9ec9
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-9716-1a24a8e12d80
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-546e-0d0d11b091d8
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-cb7c-b6377ba54af4
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a9d4-0b536f5a7227
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a975-a2321985e463
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-0f1d-9844f672346e
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-370f-3488a372b4d2
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-4c19-ed17e5a0712e
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a8d9-296a771c17f3
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-d7f9-2efe8c0f64bd
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a156-0e30c1faf396
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-80a9-967bc7ff2d04
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-d377-b5b09f9d2955
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-b56f-49cee4abe066
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-a73d-b11f92c1fe7e
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-ab18-c1a10ee92c3b
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-5a24-656a573a9f9d
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-b4af-f6b20911e57b
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-546e-8e7e9f8d1b67
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-ea48-9ecb86fb710b
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-5394-8f2e00fe0ad9
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-5b80-75592839c2c2
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-20b8-d72fe7ab760f
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-3bf1-b9fbe8914a38
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-3c1a-3dbc72e17670
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa2-22a4-3ae98af328d8	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-a9d4-0b536f5a7227
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-a975-a2321985e463
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-0f1d-9844f672346e
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-370f-3488a372b4d2
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-d7f9-2efe8c0f64bd
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-a156-0e30c1faf396
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-47d0-ef6c972053bd
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-c04b-9f843de2b2cf
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-c774-44b4b02f0a36
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-7fd2-106a9e2942e9
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-9267-6ad588c3c57e
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-7325-34ee5239a756
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa2-a815-d971fa9b1906	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-bdb2-e9e6d7ac7909
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-1593-beb8369236fe
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-6bec-2c024b31973c
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-da20-692146a93c4f
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-df13-dd419c4a9ec9
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-a9d4-0b536f5a7227
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-0f1d-9844f672346e
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-d377-b5b09f9d2955
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-546e-8e7e9f8d1b67
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-5b80-75592839c2c2
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-3bf1-b9fbe8914a38
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa2-8673-24075c20a5ef	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-eaab-25bf78c65d80
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-d458-7978e7d4d705
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-546e-8e7e9f8d1b67
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa2-aab2-9b5259e0d3c8	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-7503-ce93785935e6
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-dcf2-df426f488ff4
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-546e-8e7e9f8d1b67
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa2-77b2-326e66f7b366	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-b534-eff20fabc6af
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a096-fd58d6a7e2fb
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-dcf2-df426f488ff4
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-fd97-187a7c9f856b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-67e0-7fe0ee3be75b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ca1d-7ee2417ad515
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-6c40-249e4d53fdf0
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-eaab-25bf78c65d80
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-bdb2-e9e6d7ac7909
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-d458-7978e7d4d705
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0018-e4cfb36d4cce
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1593-beb8369236fe
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-6bec-2c024b31973c
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7252-01e70bec023f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-da20-692146a93c4f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-151b-0d3065ba1839
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-565e-a9015ca11800
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-c44e-15e1f6c3392a
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3cf0-b46602a4ecbb
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0f57-60ea02c42f52
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-4ab6-b2046a00d764
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1210-c4d757ce17b2
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-df13-dd419c4a9ec9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9716-1a24a8e12d80
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-f6ee-b4473d555653
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-546e-0d0d11b091d8
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-d1d7-32a4d464d786
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-cb7c-b6377ba54af4
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a9d4-0b536f5a7227
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a975-a2321985e463
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a252-a5779a700256
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ec60-d24f191ba74e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ced6-2edcdeb84bba
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-54e6-3d2e00c32a3a
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-511b-7b5ea74c4803
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e6c2-feb89d670536
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1602-edf4db36ebe7
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3d91-22acc1fbe7a3
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0f1d-9844f672346e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-370f-3488a372b4d2
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1118-1b25cea11c4d
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9360-82ba89335981
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0d7c-89418e0a2de2
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-bc91-33ce89b9d4d0
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-2070-22662ee2a166
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-4b47-f23ded2e0f44
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5834-41d6b4dc08c9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-4c19-ed17e5a0712e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a93e-0812fb231bc9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a8d9-296a771c17f3
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-d942-9667b3030c25
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3763-b64ad9c1f450
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-d7f9-2efe8c0f64bd
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a156-0e30c1faf396
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-614e-3bfe1c518aa0
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-80a9-967bc7ff2d04
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-2f24-657cc079919b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0566-9f24c137e1b0
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ca1f-d050d4924e08
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3343-85dbb31757cf
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-d377-b5b09f9d2955
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-b56f-49cee4abe066
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-df7b-16908d326423
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-8296-90dc843419ad
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5990-124f2eca027d
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-83e5-c0fd1e68cd4b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ed8f-4d2dbe4bd42f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0170-32742e701a82
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1610-603d3e3f4d64
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3dbc-8b1c6c177ada
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1fb8-8b38ea83d865
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-f0ef-0eab94fbd829
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1a41-fa6a7ab15f2c
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-2710-aca586e2aeda
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-12f8-12c5782a269e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-79df-5347b6c161d4
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9245-d0abb905e6ea
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-1bdc-72b8b35a0d8a
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-8d94-f71140dce9f6
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e62a-c3507df71ca6
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-6831-4e57110263db
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a73d-b11f92c1fe7e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-72c8-0cd4faf4df69
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-8436-8deef7baaf27
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e22d-c92d414c63ac
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e28d-f054376568bb
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9bc0-0f5fe0e3d75f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ab18-c1a10ee92c3b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9c56-e4d5f7e7783c
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5a24-656a573a9f9d
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5216-e14864dc4bb4
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9e7c-da6f34d9829b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-80b9-4be5b147cdb9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-53b8-47984d20c628
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-0894-e633edaec821
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-dffa-89d6fb371a4d
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-2323-72f73c245a98
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a180-31d37da61756
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-4dc8-4ae44c08761f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-b4af-f6b20911e57b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-23fe-53e44d0684c5
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-eae1-0da7cbd890b9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7e9d-7c7af23b7f63
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3f5d-553a8670e7e2
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7d9d-3cf11de084d5
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-f489-81f9e629b659
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-561b-63c685bb436b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e7e8-5143cd71686c
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-47d0-ef6c972053bd
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-c04b-9f843de2b2cf
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7503-ce93785935e6
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-f52c-795189bd82cf
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-546e-8e7e9f8d1b67
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-09ac-34c678746ca9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-a170-fa5ee9ef049c
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-2884-cd374eedcfef
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-c774-44b4b02f0a36
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7fd2-106a9e2942e9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-ea48-9ecb86fb710b
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5394-8f2e00fe0ad9
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-5b80-75592839c2c2
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-20b8-d72fe7ab760f
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-86ee-d7b72fe0d147
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-e691-f4cd7caa0e87
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-9267-6ad588c3c57e
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-7325-34ee5239a756
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3bf1-b9fbe8914a38
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-3c1a-3dbc72e17670
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-719c-014c1502315d
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-97aa-b6bb14699469
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-109f-64a948d42897
00020000-559f-cfa3-d063-3f95ac8ad98b	00030000-559f-cfa2-4c56-395f61d962d8
\.


--
-- TOC entry 2885 (class 0 OID 9726819)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9726850)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9726963)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559f-cfa3-47d4-1f1bc6e3dfc1	00090000-559f-cfa3-a72b-59a32c309625	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559f-cfa3-16f8-f7a9c0d8e18a	00090000-559f-cfa3-12eb-f2b8a4bad8cf	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559f-cfa3-c162-bb4454a02943	00090000-559f-cfa3-6a00-fd27ea85f680	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9726584)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559f-cfa3-0f0c-177ff59975e7	00040000-559f-cfa2-b8be-05a7ba81212b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-ad2f-62ea118bcb3f	00040000-559f-cfa2-b8be-05a7ba81212b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559f-cfa3-f78b-69945aa629a9	00040000-559f-cfa2-b8be-05a7ba81212b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-f1dc-cbb291b520c4	00040000-559f-cfa2-b8be-05a7ba81212b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-5e55-3540179ebdf4	00040000-559f-cfa2-b8be-05a7ba81212b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-f0b2-2e66f0642b2e	00040000-559f-cfa2-51fe-7bd27f72a15d	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-023b-5c74523f2ffa	00040000-559f-cfa2-e1c5-0be26f42dc48	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-a62d-c3678e0fbad8	00040000-559f-cfa2-c3dd-75fa4915c48f	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-cfa3-531f-4e168dbb74b2	00040000-559f-cfa2-b8be-05a7ba81212b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9726619)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559f-cfa2-2ec3-d6598c011b6a	8341	Adlešiči
00050000-559f-cfa2-de63-db712e8ebb0f	5270	Ajdovščina
00050000-559f-cfa2-58f3-21da395fda3c	6280	Ankaran/Ancarano
00050000-559f-cfa2-4b43-52dd9b9eeea3	9253	Apače
00050000-559f-cfa2-ffc4-07cbfc76f2a7	8253	Artiče
00050000-559f-cfa2-9175-f7fffbc30530	4275	Begunje na Gorenjskem
00050000-559f-cfa2-3649-3cd4c35ae2f9	1382	Begunje pri Cerknici
00050000-559f-cfa2-afa0-4beb8a4f3471	9231	Beltinci
00050000-559f-cfa2-f723-59eb28bcea5a	2234	Benedikt
00050000-559f-cfa2-e9c5-2e9d6f057bd4	2345	Bistrica ob Dravi
00050000-559f-cfa2-c337-a92e2f852552	3256	Bistrica ob Sotli
00050000-559f-cfa2-dd17-c339fa70680d	8259	Bizeljsko
00050000-559f-cfa2-4768-98d1f0c2af54	1223	Blagovica
00050000-559f-cfa2-5aa0-f2627fa67d65	8283	Blanca
00050000-559f-cfa2-b678-eac4c8857b0c	4260	Bled
00050000-559f-cfa2-2256-61bbe34943d3	4273	Blejska Dobrava
00050000-559f-cfa2-4c59-f46462c31c45	9265	Bodonci
00050000-559f-cfa2-1972-f2e57d9f26c7	9222	Bogojina
00050000-559f-cfa2-64e8-005722be4b82	4263	Bohinjska Bela
00050000-559f-cfa2-7cd5-ddb6f37c0873	4264	Bohinjska Bistrica
00050000-559f-cfa2-4195-d097580d9994	4265	Bohinjsko jezero
00050000-559f-cfa2-3612-bb9cb6a5b08d	1353	Borovnica
00050000-559f-cfa2-7acb-a70d6fb3c35b	8294	Boštanj
00050000-559f-cfa2-60da-7d8ae995bb8e	5230	Bovec
00050000-559f-cfa2-4bee-ac18e6364939	5295	Branik
00050000-559f-cfa2-6862-44093fe91c41	3314	Braslovče
00050000-559f-cfa2-bbb4-c8c8aafbda5f	5223	Breginj
00050000-559f-cfa2-dddd-3faaa5807a41	8280	Brestanica
00050000-559f-cfa2-06b3-30d23e8be340	2354	Bresternica
00050000-559f-cfa2-435a-5e1122d2262b	4243	Brezje
00050000-559f-cfa2-0c2c-761983a9c857	1351	Brezovica pri Ljubljani
00050000-559f-cfa2-a839-2be0315a84e8	8250	Brežice
00050000-559f-cfa2-7dec-41631779ca70	4210	Brnik - Aerodrom
00050000-559f-cfa2-02be-6f3cf79d77d3	8321	Brusnice
00050000-559f-cfa2-6aad-3c1b8e0ea497	3255	Buče
00050000-559f-cfa2-59b5-65f382a4fd28	8276	Bučka 
00050000-559f-cfa2-b1a3-e5b03419ae4f	9261	Cankova
00050000-559f-cfa2-f457-6da0911d9579	3000	Celje 
00050000-559f-cfa2-4ca5-a0e91458f85f	3001	Celje - poštni predali
00050000-559f-cfa2-6ef5-ddc650c65147	4207	Cerklje na Gorenjskem
00050000-559f-cfa2-7818-a4d591112bbb	8263	Cerklje ob Krki
00050000-559f-cfa2-ab75-35c88c18dccc	1380	Cerknica
00050000-559f-cfa2-eb5b-30d64958e751	5282	Cerkno
00050000-559f-cfa2-5e4d-df6a4b523a60	2236	Cerkvenjak
00050000-559f-cfa2-10b6-77e6f966f12a	2215	Ceršak
00050000-559f-cfa2-525e-4eab8a5d53c2	2326	Cirkovce
00050000-559f-cfa2-2e06-a030f0dd0445	2282	Cirkulane
00050000-559f-cfa2-64c5-26b754b457be	5273	Col
00050000-559f-cfa2-dc12-8989d6fded00	8251	Čatež ob Savi
00050000-559f-cfa2-8f0d-e59010d8f8a0	1413	Čemšenik
00050000-559f-cfa2-f122-4b0bc4cddb9a	5253	Čepovan
00050000-559f-cfa2-7d1b-ef1209956331	9232	Črenšovci
00050000-559f-cfa2-b0c0-b046fdba2b10	2393	Črna na Koroškem
00050000-559f-cfa2-e71c-4513f08e7b72	6275	Črni Kal
00050000-559f-cfa2-de7c-23774e2ef5b0	5274	Črni Vrh nad Idrijo
00050000-559f-cfa2-69e3-8a7d704b465b	5262	Črniče
00050000-559f-cfa2-ecb9-4cdad54d35b9	8340	Črnomelj
00050000-559f-cfa2-18fc-b89acc72510a	6271	Dekani
00050000-559f-cfa2-9e1c-c6af06b94648	5210	Deskle
00050000-559f-cfa2-00ef-5ce34d1f0717	2253	Destrnik
00050000-559f-cfa2-f385-eee6e91bb38f	6215	Divača
00050000-559f-cfa2-bae2-30db2cc6bc0d	1233	Dob
00050000-559f-cfa2-7ecf-39ffe1852876	3224	Dobje pri Planini
00050000-559f-cfa2-5720-edea9247f3b1	8257	Dobova
00050000-559f-cfa2-9ac0-03cbc03a5954	1423	Dobovec
00050000-559f-cfa2-ab12-443758aee64c	5263	Dobravlje
00050000-559f-cfa2-f623-a77482d7c451	3204	Dobrna
00050000-559f-cfa2-9072-4013a970b1a9	8211	Dobrnič
00050000-559f-cfa2-1d2f-e1eaff297a56	1356	Dobrova
00050000-559f-cfa2-add9-8befe70837c0	9223	Dobrovnik/Dobronak 
00050000-559f-cfa2-fcfa-eff9f5104f98	5212	Dobrovo v Brdih
00050000-559f-cfa2-7ffc-f516d4f0ddc5	1431	Dol pri Hrastniku
00050000-559f-cfa2-4894-cf11c9a5f0f9	1262	Dol pri Ljubljani
00050000-559f-cfa2-7f4a-ef9561317b9d	1273	Dole pri Litiji
00050000-559f-cfa2-bdf2-7e37222329ee	1331	Dolenja vas
00050000-559f-cfa2-5302-d8483d0483e6	8350	Dolenjske Toplice
00050000-559f-cfa2-82e0-947bfaaa6b30	1230	Domžale
00050000-559f-cfa2-2429-acb99dd520ab	2252	Dornava
00050000-559f-cfa2-0121-6eddcec1e35f	5294	Dornberk
00050000-559f-cfa2-9445-06c06032c929	1319	Draga
00050000-559f-cfa2-e78c-e35ba82ad319	8343	Dragatuš
00050000-559f-cfa2-bd1a-41854a4a7329	3222	Dramlje
00050000-559f-cfa2-c96d-d872eac91dc1	2370	Dravograd
00050000-559f-cfa2-ed99-59221785c9b8	4203	Duplje
00050000-559f-cfa2-8109-abf1c259d982	6221	Dutovlje
00050000-559f-cfa2-ad71-1e384c96826c	8361	Dvor
00050000-559f-cfa2-bd19-961fb2a579c1	2343	Fala
00050000-559f-cfa2-8f90-1b5d9bf23469	9208	Fokovci
00050000-559f-cfa2-4da7-4eccc1cd8e32	2313	Fram
00050000-559f-cfa2-e99a-3ac55a105067	3213	Frankolovo
00050000-559f-cfa2-1c48-8bef745f1a05	1274	Gabrovka
00050000-559f-cfa2-b408-b768a5438cbb	8254	Globoko
00050000-559f-cfa2-3650-71ec2f626427	5275	Godovič
00050000-559f-cfa2-1f11-89d814259697	4204	Golnik
00050000-559f-cfa2-1a29-23e84d8bcd29	3303	Gomilsko
00050000-559f-cfa2-a5ac-92063d7565fe	4224	Gorenja vas
00050000-559f-cfa2-0896-8b2f4766ffe0	3263	Gorica pri Slivnici
00050000-559f-cfa2-b0d3-e1cd00b665f3	2272	Gorišnica
00050000-559f-cfa2-037a-6ac022ad6e81	9250	Gornja Radgona
00050000-559f-cfa2-1716-f6a61d18660e	3342	Gornji Grad
00050000-559f-cfa2-58f4-9a4470db5664	4282	Gozd Martuljek
00050000-559f-cfa2-b54d-7338001caea7	6272	Gračišče
00050000-559f-cfa2-de74-3f0793eb3569	9264	Grad
00050000-559f-cfa2-d1a7-6e704bd84ef4	8332	Gradac
00050000-559f-cfa2-b202-6d97f8f5e5c3	1384	Grahovo
00050000-559f-cfa2-1c61-06e5351cac9e	5242	Grahovo ob Bači
00050000-559f-cfa2-f168-f0d02eb685a4	5251	Grgar
00050000-559f-cfa2-dd9c-432eb3dc80ba	3302	Griže
00050000-559f-cfa2-c430-b64dd07ccb4b	3231	Grobelno
00050000-559f-cfa2-0b4f-a25c9bb5888f	1290	Grosuplje
00050000-559f-cfa2-a8b1-5ee3125881e5	2288	Hajdina
00050000-559f-cfa2-65a3-f1de41ec9cf9	8362	Hinje
00050000-559f-cfa2-d3a9-3e90a8567a3f	2311	Hoče
00050000-559f-cfa2-21e8-8de6527aa6dd	9205	Hodoš/Hodos
00050000-559f-cfa2-c7b4-d112a076bb96	1354	Horjul
00050000-559f-cfa2-0501-80e6f2cbcb90	1372	Hotedršica
00050000-559f-cfa2-4340-730d5f1b331c	1430	Hrastnik
00050000-559f-cfa2-2570-a6573109f320	6225	Hruševje
00050000-559f-cfa2-093a-0d8718be5f55	4276	Hrušica
00050000-559f-cfa2-26c3-028faab44bf8	5280	Idrija
00050000-559f-cfa2-2499-f6f45da9d8e4	1292	Ig
00050000-559f-cfa2-1f59-0a211a14dced	6250	Ilirska Bistrica
00050000-559f-cfa2-c0b9-1e29e001cce4	6251	Ilirska Bistrica-Trnovo
00050000-559f-cfa2-6440-f5a04f90bb47	1295	Ivančna Gorica
00050000-559f-cfa2-7cfa-caeb57bcf3a6	2259	Ivanjkovci
00050000-559f-cfa2-1b71-861d7a08c672	1411	Izlake
00050000-559f-cfa2-6a3a-5c88f4460f03	6310	Izola/Isola
00050000-559f-cfa2-f17d-f1ec3038d96c	2222	Jakobski Dol
00050000-559f-cfa2-38c1-38b1f12eaf55	2221	Jarenina
00050000-559f-cfa2-66a0-fa18ba152e04	6254	Jelšane
00050000-559f-cfa2-e034-78b43541862d	4270	Jesenice
00050000-559f-cfa2-bda2-0ea4bbedc5d5	8261	Jesenice na Dolenjskem
00050000-559f-cfa2-4dc5-795045ccc454	3273	Jurklošter
00050000-559f-cfa2-abea-0e99e7d18c03	2223	Jurovski Dol
00050000-559f-cfa2-4478-f7c1ec48cf08	2256	Juršinci
00050000-559f-cfa2-e432-83d3cfe6f32b	5214	Kal nad Kanalom
00050000-559f-cfa2-c888-149a60355ee0	3233	Kalobje
00050000-559f-cfa2-3adb-aa5e14b8ad38	4246	Kamna Gorica
00050000-559f-cfa2-2c4f-e20d690b373a	2351	Kamnica
00050000-559f-cfa2-c445-dc1d5bcb2529	1241	Kamnik
00050000-559f-cfa2-4325-b327f0391e6b	5213	Kanal
00050000-559f-cfa2-2f52-6becd2ae4571	8258	Kapele
00050000-559f-cfa2-932a-177c3e3b618b	2362	Kapla
00050000-559f-cfa2-a502-e91904f3f91d	2325	Kidričevo
00050000-559f-cfa2-772a-cab137b14457	1412	Kisovec
00050000-559f-cfa2-616d-a4dd359d900f	6253	Knežak
00050000-559f-cfa2-70a8-1d5e9dd9e6d6	5222	Kobarid
00050000-559f-cfa2-3121-fb3f529e05ac	9227	Kobilje
00050000-559f-cfa2-8ef1-26eacd66b59d	1330	Kočevje
00050000-559f-cfa2-e7fa-b846f4c019e6	1338	Kočevska Reka
00050000-559f-cfa2-1c42-fb1b6a46db59	2276	Kog
00050000-559f-cfa2-dc28-ec718d669486	5211	Kojsko
00050000-559f-cfa2-5e4e-4b116634b91b	6223	Komen
00050000-559f-cfa2-78f2-8feaeac6506a	1218	Komenda
00050000-559f-cfa2-2070-81aa1a2119a9	6000	Koper/Capodistria 
00050000-559f-cfa2-6c53-edb7876f1d62	6001	Koper/Capodistria - poštni predali
00050000-559f-cfa2-913e-ba06c481fb2b	8282	Koprivnica
00050000-559f-cfa2-6824-6c6318fce53d	5296	Kostanjevica na Krasu
00050000-559f-cfa2-8dd2-125521b1f95a	8311	Kostanjevica na Krki
00050000-559f-cfa2-7c9c-49f85eb747ac	1336	Kostel
00050000-559f-cfa2-4f4c-d880fbee6545	6256	Košana
00050000-559f-cfa2-8ddc-3dc2af077f7f	2394	Kotlje
00050000-559f-cfa2-b57f-e4a3c5920975	6240	Kozina
00050000-559f-cfa2-0103-847b987f5d91	3260	Kozje
00050000-559f-cfa2-6fab-cd98a8fe6b66	4000	Kranj 
00050000-559f-cfa2-ab4b-23ad62fe4b84	4001	Kranj - poštni predali
00050000-559f-cfa2-3a70-67cc597024d1	4280	Kranjska Gora
00050000-559f-cfa2-2b59-67c3b0841fdf	1281	Kresnice
00050000-559f-cfa2-e90f-a2e117ba6830	4294	Križe
00050000-559f-cfa2-f9e6-3d8946e2f73c	9206	Križevci
00050000-559f-cfa2-4264-141239d91f5a	9242	Križevci pri Ljutomeru
00050000-559f-cfa2-62db-67b88a0f2beb	1301	Krka
00050000-559f-cfa2-eae5-e9f65d12fc68	8296	Krmelj
00050000-559f-cfa2-04fc-47a84dedd74c	4245	Kropa
00050000-559f-cfa2-48b4-b4d7192a92eb	8262	Krška vas
00050000-559f-cfa2-813c-3a1b27956d2d	8270	Krško
00050000-559f-cfa2-857b-340f2ab4b69a	9263	Kuzma
00050000-559f-cfa2-83ca-7d26eac7e3af	2318	Laporje
00050000-559f-cfa2-953f-72c39589dbc1	3270	Laško
00050000-559f-cfa2-6e34-559a59eb40ab	1219	Laze v Tuhinju
00050000-559f-cfa2-01ae-c1b563d91138	2230	Lenart v Slovenskih goricah
00050000-559f-cfa2-e10f-29b8d07fa353	9220	Lendava/Lendva
00050000-559f-cfa2-8254-4ed90f1e6ff2	4248	Lesce
00050000-559f-cfa2-83b8-7363aac262e3	3261	Lesično
00050000-559f-cfa2-7326-75d6ca82300b	8273	Leskovec pri Krškem
00050000-559f-cfa2-f6fa-170316747b0f	2372	Libeliče
00050000-559f-cfa2-9196-28e85875c81f	2341	Limbuš
00050000-559f-cfa2-bb65-60993bfae052	1270	Litija
00050000-559f-cfa2-0006-6ac80f11ce37	3202	Ljubečna
00050000-559f-cfa2-8430-b575c7a591af	1000	Ljubljana 
00050000-559f-cfa2-9bbc-695d13b185f9	1001	Ljubljana - poštni predali
00050000-559f-cfa2-4e92-f3a538db4456	1231	Ljubljana - Črnuče
00050000-559f-cfa2-9694-287745d71a6e	1261	Ljubljana - Dobrunje
00050000-559f-cfa2-5b25-29b6c8d434d3	1260	Ljubljana - Polje
00050000-559f-cfa2-438a-120b8ec4e134	1210	Ljubljana - Šentvid
00050000-559f-cfa2-fb9c-dce3f7d65e39	1211	Ljubljana - Šmartno
00050000-559f-cfa2-8698-f3b0bb1e6257	3333	Ljubno ob Savinji
00050000-559f-cfa2-3ab6-f2ea57890a3c	9240	Ljutomer
00050000-559f-cfa2-563a-d188d0b5b172	3215	Loče
00050000-559f-cfa2-d261-1abe5aae6f76	5231	Log pod Mangartom
00050000-559f-cfa2-2278-6d1c660cc887	1358	Log pri Brezovici
00050000-559f-cfa2-13b5-7cbcf3dc05d8	1370	Logatec
00050000-559f-cfa2-8e89-87c53cfbef51	1371	Logatec
00050000-559f-cfa2-798b-0ee13dde1941	1434	Loka pri Zidanem Mostu
00050000-559f-cfa2-30e8-ca63569ef211	3223	Loka pri Žusmu
00050000-559f-cfa2-b154-9c96f90cdd38	6219	Lokev
00050000-559f-cfa2-0add-baf9cc25073d	1318	Loški Potok
00050000-559f-cfa2-db92-99d9b5bd107f	2324	Lovrenc na Dravskem polju
00050000-559f-cfa2-a617-3fd7259a07e3	2344	Lovrenc na Pohorju
00050000-559f-cfa2-ec98-48b3da2a76cd	3334	Luče
00050000-559f-cfa2-47e4-2966bceb6f1e	1225	Lukovica
00050000-559f-cfa2-94bb-e5a9b1eba5a7	9202	Mačkovci
00050000-559f-cfa2-400a-9cced8c8622c	2322	Majšperk
00050000-559f-cfa2-9932-28c8f93b733e	2321	Makole
00050000-559f-cfa2-e92f-43e81de72614	9243	Mala Nedelja
00050000-559f-cfa2-c14e-8a8fbfba464a	2229	Malečnik
00050000-559f-cfa2-2d97-1315df8aa1c5	6273	Marezige
00050000-559f-cfa2-1ea2-dc0c90675221	2000	Maribor 
00050000-559f-cfa2-122e-d73eeb83dc7f	2001	Maribor - poštni predali
00050000-559f-cfa2-6239-24e9b569973a	2206	Marjeta na Dravskem polju
00050000-559f-cfa2-5118-d66d2022d879	2281	Markovci
00050000-559f-cfa2-2d2e-6fc3f6881f1c	9221	Martjanci
00050000-559f-cfa2-7899-cb2db29e1f7f	6242	Materija
00050000-559f-cfa2-d51b-c637620f4ef6	4211	Mavčiče
00050000-559f-cfa2-d8f7-a3098ce14aa0	1215	Medvode
00050000-559f-cfa2-bf83-9272c9f91d50	1234	Mengeš
00050000-559f-cfa2-a531-93e842f6e1fe	8330	Metlika
00050000-559f-cfa2-0e8e-b0733b6c5747	2392	Mežica
00050000-559f-cfa2-96e4-5efd34fd36ff	2204	Miklavž na Dravskem polju
00050000-559f-cfa2-2873-7c88c1826243	2275	Miklavž pri Ormožu
00050000-559f-cfa2-e4b0-1c3b43865fc1	5291	Miren
00050000-559f-cfa2-1dad-5a4dc97889ad	8233	Mirna
00050000-559f-cfa2-93b0-15b33043eaa4	8216	Mirna Peč
00050000-559f-cfa2-b25b-ddd259a920c1	2382	Mislinja
00050000-559f-cfa2-a03a-4d9ed4704a61	4281	Mojstrana
00050000-559f-cfa2-bb07-1b25d8d93432	8230	Mokronog
00050000-559f-cfa2-09de-cc9801741c42	1251	Moravče
00050000-559f-cfa2-17e7-8b32e1b4a8cf	9226	Moravske Toplice
00050000-559f-cfa2-4d50-ff50e91cc619	5216	Most na Soči
00050000-559f-cfa2-de32-4386567ff9a5	1221	Motnik
00050000-559f-cfa2-f3e2-2cf060871b8c	3330	Mozirje
00050000-559f-cfa2-672c-4973d13736ea	9000	Murska Sobota 
00050000-559f-cfa2-fee5-2487b09fd812	9001	Murska Sobota - poštni predali
00050000-559f-cfa2-310f-cd72b3b06e6c	2366	Muta
00050000-559f-cfa2-0908-405f82b96830	4202	Naklo
00050000-559f-cfa2-cc2e-2d8bcbaea315	3331	Nazarje
00050000-559f-cfa2-45f1-6d8ee153395d	1357	Notranje Gorice
00050000-559f-cfa2-466d-a6976e61f368	3203	Nova Cerkev
00050000-559f-cfa2-689b-b17292f649e6	5000	Nova Gorica 
00050000-559f-cfa2-3c6d-d7a6221c51e9	5001	Nova Gorica - poštni predali
00050000-559f-cfa2-130c-b8616708c164	1385	Nova vas
00050000-559f-cfa2-8563-020860619237	8000	Novo mesto
00050000-559f-cfa2-fedf-54f6eca2fbcd	8001	Novo mesto - poštni predali
00050000-559f-cfa2-bf33-6d1668f5958d	6243	Obrov
00050000-559f-cfa2-70b3-de94b1d2c444	9233	Odranci
00050000-559f-cfa2-316a-3f5d22341a22	2317	Oplotnica
00050000-559f-cfa2-dadb-6add53b49c1b	2312	Orehova vas
00050000-559f-cfa2-e439-b328877c7b43	2270	Ormož
00050000-559f-cfa2-389c-25c3945887df	1316	Ortnek
00050000-559f-cfa2-afcd-461dc4b1bd0d	1337	Osilnica
00050000-559f-cfa2-a6cb-e5bb69e380ea	8222	Otočec
00050000-559f-cfa2-8006-8e8f64811eaa	2361	Ožbalt
00050000-559f-cfa2-3310-0946348651d1	2231	Pernica
00050000-559f-cfa2-8346-1b7a73f43bc1	2211	Pesnica pri Mariboru
00050000-559f-cfa2-bfa6-add217d46567	9203	Petrovci
00050000-559f-cfa2-0d91-94ffb76aa60f	3301	Petrovče
00050000-559f-cfa2-54c5-c6d30c4f642b	6330	Piran/Pirano
00050000-559f-cfa2-c339-bad986f582af	8255	Pišece
00050000-559f-cfa2-2e23-ac21383e58a5	6257	Pivka
00050000-559f-cfa2-ab8e-e5a1d18e4609	6232	Planina
00050000-559f-cfa2-3370-e8acee3476b0	3225	Planina pri Sevnici
00050000-559f-cfa2-2f1d-71344970db86	6276	Pobegi
00050000-559f-cfa2-96a5-144e2f018dff	8312	Podbočje
00050000-559f-cfa2-fd1b-df12eaf6767a	5243	Podbrdo
00050000-559f-cfa2-d396-827bf7a0121e	3254	Podčetrtek
00050000-559f-cfa2-e29a-26e57f260ea5	2273	Podgorci
00050000-559f-cfa2-22c0-bfdc09a2b0b1	6216	Podgorje
00050000-559f-cfa2-9cce-0793c2ff31e5	2381	Podgorje pri Slovenj Gradcu
00050000-559f-cfa2-68c8-48e7d58fd214	6244	Podgrad
00050000-559f-cfa2-a996-584c11288d03	1414	Podkum
00050000-559f-cfa2-1998-77d911f1cd8c	2286	Podlehnik
00050000-559f-cfa2-54ab-d39f57a67e4d	5272	Podnanos
00050000-559f-cfa2-91a7-fa90938c1cf1	4244	Podnart
00050000-559f-cfa2-a159-ce3a911e0a80	3241	Podplat
00050000-559f-cfa2-6cff-32593256dd5e	3257	Podsreda
00050000-559f-cfa2-ffc3-ceca34f95112	2363	Podvelka
00050000-559f-cfa2-0649-19762e2e871a	2208	Pohorje
00050000-559f-cfa2-db75-4a0cb6042a7f	2257	Polenšak
00050000-559f-cfa2-569b-61738cd34383	1355	Polhov Gradec
00050000-559f-cfa2-5a52-2bf1d02d1a38	4223	Poljane nad Škofjo Loko
00050000-559f-cfa2-710b-e824a182a5ca	2319	Poljčane
00050000-559f-cfa2-8aab-65bee839f1dc	1272	Polšnik
00050000-559f-cfa2-1db4-91c3fba12bc0	3313	Polzela
00050000-559f-cfa2-bf5e-da35a48fde39	3232	Ponikva
00050000-559f-cfa2-ef84-fb73bcc19c31	6320	Portorož/Portorose
00050000-559f-cfa2-1192-5c0261066e0f	6230	Postojna
00050000-559f-cfa2-f499-7dc88634a5ec	2331	Pragersko
00050000-559f-cfa2-e2dc-035b1b8b230a	3312	Prebold
00050000-559f-cfa2-ee76-099508851a4e	4205	Preddvor
00050000-559f-cfa2-3772-a85106ae4099	6255	Prem
00050000-559f-cfa2-9d00-52c4e59d304d	1352	Preserje
00050000-559f-cfa2-49f5-78abb39f1327	6258	Prestranek
00050000-559f-cfa2-5b6f-44bc6ea66b58	2391	Prevalje
00050000-559f-cfa2-6531-2652b7191eef	3262	Prevorje
00050000-559f-cfa2-74f3-77833d302769	1276	Primskovo 
00050000-559f-cfa2-7b3d-a04f93b675e8	3253	Pristava pri Mestinju
00050000-559f-cfa2-7a12-c385eacc3e3f	9207	Prosenjakovci/Partosfalva
00050000-559f-cfa2-13ef-bd7cb6cc70c8	5297	Prvačina
00050000-559f-cfa2-2df3-5c37e416ef60	2250	Ptuj
00050000-559f-cfa2-2078-407e59c2649e	2323	Ptujska Gora
00050000-559f-cfa2-8c87-346e6a920396	9201	Puconci
00050000-559f-cfa2-05b1-d0add02eab35	2327	Rače
00050000-559f-cfa2-baa8-73dca2862ed0	1433	Radeče
00050000-559f-cfa2-8c95-b2938cca9ec7	9252	Radenci
00050000-559f-cfa2-35b5-4ca9725423cf	2360	Radlje ob Dravi
00050000-559f-cfa2-6277-4953c50930ac	1235	Radomlje
00050000-559f-cfa2-7bc4-9750caadc2e1	4240	Radovljica
00050000-559f-cfa2-76fa-031d15f8f363	8274	Raka
00050000-559f-cfa2-1630-9c9535c97500	1381	Rakek
00050000-559f-cfa2-a9c4-be421ace2e77	4283	Rateče - Planica
00050000-559f-cfa2-62a0-af3920d81a40	2390	Ravne na Koroškem
00050000-559f-cfa2-ce19-ab588e0cf983	9246	Razkrižje
00050000-559f-cfa2-902b-537adb51ad5c	3332	Rečica ob Savinji
00050000-559f-cfa2-0a77-dd248c3b153f	5292	Renče
00050000-559f-cfa2-fb92-f617c0dfee09	1310	Ribnica
00050000-559f-cfa2-27f8-a7959d856ad1	2364	Ribnica na Pohorju
00050000-559f-cfa2-9ee2-a25c3c2cf342	3272	Rimske Toplice
00050000-559f-cfa2-b171-39af019220bb	1314	Rob
00050000-559f-cfa2-6004-133ea5adc240	5215	Ročinj
00050000-559f-cfa2-2311-c7338caf1354	3250	Rogaška Slatina
00050000-559f-cfa2-2721-032215c1d19b	9262	Rogašovci
00050000-559f-cfa2-1e64-7e3d954de88d	3252	Rogatec
00050000-559f-cfa2-a840-31a71f7674b0	1373	Rovte
00050000-559f-cfa2-b59f-74436f99771c	2342	Ruše
00050000-559f-cfa2-7a23-7022702b866e	1282	Sava
00050000-559f-cfa2-0299-592cd9b6c814	6333	Sečovlje/Sicciole
00050000-559f-cfa2-2665-dfbbd3060d00	4227	Selca
00050000-559f-cfa2-3d6f-6d3e3033d2c6	2352	Selnica ob Dravi
00050000-559f-cfa2-c188-d63591fb7a1d	8333	Semič
00050000-559f-cfa2-2d4d-d53e89a64bc9	8281	Senovo
00050000-559f-cfa2-e9f0-be1ba17a31be	6224	Senožeče
00050000-559f-cfa2-d02a-290315a60dc4	8290	Sevnica
00050000-559f-cfa2-ca6d-841f1da344a5	6210	Sežana
00050000-559f-cfa2-fa42-a9963267de73	2214	Sladki Vrh
00050000-559f-cfa2-5835-b6f3669f7e92	5283	Slap ob Idrijci
00050000-559f-cfa2-4b67-889b21e31ad2	2380	Slovenj Gradec
00050000-559f-cfa2-cf5a-2722e6f2745e	2310	Slovenska Bistrica
00050000-559f-cfa2-ac46-dc47fbd57d03	3210	Slovenske Konjice
00050000-559f-cfa2-42a8-43ef6304afbb	1216	Smlednik
00050000-559f-cfa2-83e8-8b4fbc7d8aa3	5232	Soča
00050000-559f-cfa2-792a-f0ed9c0a2e33	1317	Sodražica
00050000-559f-cfa2-b119-6b0d4fe93511	3335	Solčava
00050000-559f-cfa2-b916-6a9eda6b5f29	5250	Solkan
00050000-559f-cfa2-782d-513cdd0d3be1	4229	Sorica
00050000-559f-cfa2-2262-37c56d1dd44a	4225	Sovodenj
00050000-559f-cfa2-4ea0-db8b9759ef84	5281	Spodnja Idrija
00050000-559f-cfa2-cb93-71b573c9d2cd	2241	Spodnji Duplek
00050000-559f-cfa2-55d9-3e4b65e0bdf6	9245	Spodnji Ivanjci
00050000-559f-cfa2-09bb-602355c287ec	2277	Središče ob Dravi
00050000-559f-cfa2-6827-cb4e9671e391	4267	Srednja vas v Bohinju
00050000-559f-cfa2-70be-ee257eb14a51	8256	Sromlje 
00050000-559f-cfa2-65d5-1baedacfb2dc	5224	Srpenica
00050000-559f-cfa2-cc09-ea60bd74e433	1242	Stahovica
00050000-559f-cfa2-79a0-2415ac6b91e2	1332	Stara Cerkev
00050000-559f-cfa2-b5be-2c893ec9a72b	8342	Stari trg ob Kolpi
00050000-559f-cfa2-d49b-7ebd6db5630f	1386	Stari trg pri Ložu
00050000-559f-cfa2-a099-6a706acf34ea	2205	Starše
00050000-559f-cfa2-d156-e9b8ad154f7f	2289	Stoperce
00050000-559f-cfa2-d947-a88c56e213db	8322	Stopiče
00050000-559f-cfa2-c1f0-4358e6cbf762	3206	Stranice
00050000-559f-cfa2-8034-da1a980a5044	8351	Straža
00050000-559f-cfa2-3c82-02b42bc4a9aa	1313	Struge
00050000-559f-cfa2-9b93-91811b15d99a	8293	Studenec
00050000-559f-cfa2-452f-930ecd2fb3c2	8331	Suhor
00050000-559f-cfa2-ddfe-e5fe99dd82c9	2233	Sv. Ana v Slovenskih goricah
00050000-559f-cfa2-aa5b-5dfef3f8b6d5	2235	Sv. Trojica v Slovenskih goricah
00050000-559f-cfa2-79be-f5d893351f5f	2353	Sveti Duh na Ostrem Vrhu
00050000-559f-cfa2-bd2a-906d2f54a594	9244	Sveti Jurij ob Ščavnici
00050000-559f-cfa2-cf2f-6a54346a2715	3264	Sveti Štefan
00050000-559f-cfa2-30f7-384e5d5c78b7	2258	Sveti Tomaž
00050000-559f-cfa2-c7c7-511cb8972585	9204	Šalovci
00050000-559f-cfa2-ec90-31ba510e804e	5261	Šempas
00050000-559f-cfa2-2758-3ccbbbf25bc0	5290	Šempeter pri Gorici
00050000-559f-cfa2-9e98-a0c2fec8eec0	3311	Šempeter v Savinjski dolini
00050000-559f-cfa2-6a57-cc9f67790996	4208	Šenčur
00050000-559f-cfa2-8d8a-5ad69cab65fb	2212	Šentilj v Slovenskih goricah
00050000-559f-cfa2-6625-3e0212227c13	8297	Šentjanž
00050000-559f-cfa2-e271-f6598965003c	2373	Šentjanž pri Dravogradu
00050000-559f-cfa2-5d0e-5b7b8d592172	8310	Šentjernej
00050000-559f-cfa2-ff42-f9549ad25e66	3230	Šentjur
00050000-559f-cfa2-2ce5-bc1186708734	3271	Šentrupert
00050000-559f-cfa2-5b5a-58bc3d1486ae	8232	Šentrupert
00050000-559f-cfa2-c450-929bfac35a20	1296	Šentvid pri Stični
00050000-559f-cfa2-6872-d3e958d673d5	8275	Škocjan
00050000-559f-cfa2-9120-2f094190713e	6281	Škofije
00050000-559f-cfa2-22ed-7c67b3238412	4220	Škofja Loka
00050000-559f-cfa2-981f-3bb71487f6a2	3211	Škofja vas
00050000-559f-cfa2-ea40-b63cc88893d4	1291	Škofljica
00050000-559f-cfa2-46a8-65326b259aea	6274	Šmarje
00050000-559f-cfa2-79c5-52c915ee4b95	1293	Šmarje - Sap
00050000-559f-cfa2-7826-46f343951f39	3240	Šmarje pri Jelšah
00050000-559f-cfa2-6e9a-d42dcbe9771f	8220	Šmarješke Toplice
00050000-559f-cfa2-923e-8c9f84b86b00	2315	Šmartno na Pohorju
00050000-559f-cfa2-e6f1-581208ab72e1	3341	Šmartno ob Dreti
00050000-559f-cfa2-7096-1a4d4d49c6d0	3327	Šmartno ob Paki
00050000-559f-cfa2-c54d-8cedb5052a87	1275	Šmartno pri Litiji
00050000-559f-cfa2-84b6-29c10ea6c2a2	2383	Šmartno pri Slovenj Gradcu
00050000-559f-cfa2-e8ed-43311fc59fbb	3201	Šmartno v Rožni dolini
00050000-559f-cfa2-5b8e-6b8c76662729	3325	Šoštanj
00050000-559f-cfa2-a5ae-d36d8d2c1f9f	6222	Štanjel
00050000-559f-cfa2-987b-d57e14159ef0	3220	Štore
00050000-559f-cfa2-a77e-823f0425c2c4	3304	Tabor
00050000-559f-cfa2-5f54-194f13ef9ee4	3221	Teharje
00050000-559f-cfa2-7027-7142531df738	9251	Tišina
00050000-559f-cfa2-d795-1ca6a60f2323	5220	Tolmin
00050000-559f-cfa2-f9ef-e8196c759ffd	3326	Topolšica
00050000-559f-cfa2-dd59-24186c24661b	2371	Trbonje
00050000-559f-cfa2-d50e-3850d8bc8e22	1420	Trbovlje
00050000-559f-cfa2-e4b2-b5ad246a8c5a	8231	Trebelno 
00050000-559f-cfa2-db1a-0c3f95c89650	8210	Trebnje
00050000-559f-cfa2-62b7-3fbbdc1183df	5252	Trnovo pri Gorici
00050000-559f-cfa2-d361-95271aab9285	2254	Trnovska vas
00050000-559f-cfa2-c35e-d5155874ead0	1222	Trojane
00050000-559f-cfa2-8e8e-f8ec2a629bc4	1236	Trzin
00050000-559f-cfa2-9a8b-acd90f9ab1e7	4290	Tržič
00050000-559f-cfa2-1bf7-279fef2ed3b5	8295	Tržišče
00050000-559f-cfa2-b1d7-c827f0a4394c	1311	Turjak
00050000-559f-cfa2-a788-7da7b35d9bfa	9224	Turnišče
00050000-559f-cfa2-413a-b4f205046158	8323	Uršna sela
00050000-559f-cfa2-1471-7c83bea1e80c	1252	Vače
00050000-559f-cfa2-b29a-4b5f156f0926	3320	Velenje 
00050000-559f-cfa2-a0c0-9adc750bed47	3322	Velenje - poštni predali
00050000-559f-cfa2-3462-730f2d4a7ca8	8212	Velika Loka
00050000-559f-cfa2-d4b2-d5c66141295d	2274	Velika Nedelja
00050000-559f-cfa2-e93e-3b0a20d7486b	9225	Velika Polana
00050000-559f-cfa2-2be9-ccb3c2b3511c	1315	Velike Lašče
00050000-559f-cfa2-2a9c-f4562cdd51ba	8213	Veliki Gaber
00050000-559f-cfa2-3492-1b04e9255750	9241	Veržej
00050000-559f-cfa2-8784-e6f2c40db83c	1312	Videm - Dobrepolje
00050000-559f-cfa2-650f-29957bf1f5c6	2284	Videm pri Ptuju
00050000-559f-cfa2-c60e-1ac1f0603720	8344	Vinica
00050000-559f-cfa2-0ed2-68bdcc4eadd2	5271	Vipava
00050000-559f-cfa2-5dc7-51ac52ce7390	4212	Visoko
00050000-559f-cfa2-2bf3-f1d3c6e3e841	1294	Višnja Gora
00050000-559f-cfa2-3bf1-7d23edd932e8	3205	Vitanje
00050000-559f-cfa2-38a2-fd4e2c09f8a4	2255	Vitomarci
00050000-559f-cfa2-e8a0-469f88bfd146	1217	Vodice
00050000-559f-cfa2-d9f6-50e885f4a0c9	3212	Vojnik\t
00050000-559f-cfa2-fa26-3fb438b46785	5293	Volčja Draga
00050000-559f-cfa2-2f5b-77b9ad42bd88	2232	Voličina
00050000-559f-cfa2-331a-46c368a8ab1c	3305	Vransko
00050000-559f-cfa2-34fc-c15d4cbc29b4	6217	Vremski Britof
00050000-559f-cfa2-8d12-6cd9e70ba9f7	1360	Vrhnika
00050000-559f-cfa2-1793-e7d57fb20721	2365	Vuhred
00050000-559f-cfa2-79d9-b7afef0e299c	2367	Vuzenica
00050000-559f-cfa2-032c-f705b9b5d8ae	8292	Zabukovje 
00050000-559f-cfa2-b74c-d3688afef398	1410	Zagorje ob Savi
00050000-559f-cfa2-9619-089fa5fabf86	1303	Zagradec
00050000-559f-cfa2-f840-6dcc9f797c07	2283	Zavrč
00050000-559f-cfa2-ba3c-7fb38adc8095	8272	Zdole 
00050000-559f-cfa2-1980-7c90b080e78c	4201	Zgornja Besnica
00050000-559f-cfa2-b03b-3775006b471e	2242	Zgornja Korena
00050000-559f-cfa2-1b4f-670821ab61e0	2201	Zgornja Kungota
00050000-559f-cfa2-acbe-1b2265fb4a58	2316	Zgornja Ložnica
00050000-559f-cfa2-8285-b9a6444044d7	2314	Zgornja Polskava
00050000-559f-cfa2-4647-69ce36d47b1e	2213	Zgornja Velka
00050000-559f-cfa2-321c-e90b1a56870e	4247	Zgornje Gorje
00050000-559f-cfa2-a013-a82fdcfcb296	4206	Zgornje Jezersko
00050000-559f-cfa2-e4ab-f4b9aaf374a2	2285	Zgornji Leskovec
00050000-559f-cfa2-fd8b-858a95c19c4c	1432	Zidani Most
00050000-559f-cfa2-d05a-447fb1881a80	3214	Zreče
00050000-559f-cfa2-e60c-d0270d99f2cf	4209	Žabnica
00050000-559f-cfa2-10d6-8c86e8e4f4e7	3310	Žalec
00050000-559f-cfa2-ce32-ed50a723444c	4228	Železniki
00050000-559f-cfa2-1a50-264b6338eba3	2287	Žetale
00050000-559f-cfa2-dae1-307f4a9b8c84	4226	Žiri
00050000-559f-cfa2-590c-b289c3e5f3a4	4274	Žirovnica
00050000-559f-cfa2-78d5-b546cd1bf349	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9726793)
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
-- TOC entry 2863 (class 0 OID 9726604)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9726682)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9726805)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9727112)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9727123)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559f-cfa3-78bf-7e9b0dd17ab9	00080000-559f-cfa3-531f-4e168dbb74b2	0900	AK
00190000-559f-cfa3-8586-ddb53aaa2c25	00080000-559f-cfa3-f78b-69945aa629a9	0987	AK
00190000-559f-cfa3-53ef-5745a217ed44	00080000-559f-cfa3-ad2f-62ea118bcb3f	0989	AK
00190000-559f-cfa3-b6fe-057d5af502cc	00080000-559f-cfa3-f1dc-cbb291b520c4	0986	AK
00190000-559f-cfa3-fab1-7346b60a596d	00080000-559f-cfa3-f0b2-2e66f0642b2e	0984	AK
00190000-559f-cfa3-9979-137402638388	00080000-559f-cfa3-023b-5c74523f2ffa	0983	AK
00190000-559f-cfa3-59a4-870d124d39cd	00080000-559f-cfa3-a62d-c3678e0fbad8	0982	AK
\.


--
-- TOC entry 2905 (class 0 OID 9727093)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559f-cfa3-0cfa-a57c70b05c47	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2887 (class 0 OID 9726834)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559f-cfa3-9e5f-e2f539a89272	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559f-cfa3-bc62-0586ee605ce9	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559f-cfa3-7e41-3f4861754296	0003	Kazinska	t	84	Kazinska dvorana
00220000-559f-cfa3-aaad-df1ea91773eb	0004	Mali oder	t	24	Mali oder 
00220000-559f-cfa3-81b7-9baa0b1f4d41	0005	Komorni oder	t	15	Komorni oder
00220000-559f-cfa3-7ce2-4be163d68886	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559f-cfa3-621a-96be440dca64	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9726778)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9726768)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9726952)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9726902)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9726476)
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
-- TOC entry 2888 (class 0 OID 9726844)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9726514)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559f-cfa2-0f86-a39cd64ae613	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559f-cfa2-f5d9-d7a5e406e64f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559f-cfa2-e98d-87381cf9977f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559f-cfa2-1cc9-a6a481807926	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559f-cfa2-22a4-3ae98af328d8	planer	Planer dogodkov v koledarju	t
00020000-559f-cfa2-a815-d971fa9b1906	kadrovska	Kadrovska služba	t
00020000-559f-cfa2-8673-24075c20a5ef	arhivar	Ažuriranje arhivalij	t
00020000-559f-cfa2-aab2-9b5259e0d3c8	igralec	Igralec	t
00020000-559f-cfa2-77b2-326e66f7b366	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559f-cfa3-d063-3f95ac8ad98b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9726498)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559f-cfa2-10dd-1def035fbe5d	00020000-559f-cfa2-e98d-87381cf9977f
00010000-559f-cfa2-eca8-27edbba6d5cf	00020000-559f-cfa2-e98d-87381cf9977f
00010000-559f-cfa3-fd11-636011a529c6	00020000-559f-cfa3-d063-3f95ac8ad98b
\.


--
-- TOC entry 2890 (class 0 OID 9726858)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9726799)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9726749)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9727162)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559f-cfa2-1e84-7110110f8058	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559f-cfa2-1b4b-05ef0a5b70bb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559f-cfa2-3292-0a4b1d19c9aa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559f-cfa2-2eda-9f077c27ad6f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559f-cfa2-0799-b4796644a64d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9727154)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559f-cfa2-a1ad-929fbb1b684c	00230000-559f-cfa2-2eda-9f077c27ad6f	popa
00240000-559f-cfa2-e27d-601bcfedcd06	00230000-559f-cfa2-2eda-9f077c27ad6f	oseba
00240000-559f-cfa2-d517-07d260e200f5	00230000-559f-cfa2-1b4b-05ef0a5b70bb	prostor
00240000-559f-cfa2-c1e5-8e7f332097f2	00230000-559f-cfa2-2eda-9f077c27ad6f	besedilo
00240000-559f-cfa2-2932-6dcafe5e5a19	00230000-559f-cfa2-2eda-9f077c27ad6f	uprizoritev
00240000-559f-cfa2-ab24-463037289252	00230000-559f-cfa2-2eda-9f077c27ad6f	funkcija
00240000-559f-cfa2-2938-d9bce7e6a950	00230000-559f-cfa2-2eda-9f077c27ad6f	tipfunkcije
00240000-559f-cfa2-7615-eab8e3251122	00230000-559f-cfa2-2eda-9f077c27ad6f	alternacija
00240000-559f-cfa2-a26a-0234e277b6c0	00230000-559f-cfa2-1e84-7110110f8058	pogodba
00240000-559f-cfa2-e942-d51e75ae8a3b	00230000-559f-cfa2-2eda-9f077c27ad6f	zaposlitev
00240000-559f-cfa2-2fb0-27b6d488627e	00230000-559f-cfa2-1e84-7110110f8058	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9727149)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9726912)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559f-cfa3-1b30-c4fcc09b53f9	000e0000-559f-cfa3-2b4c-18ee70d31f14	00080000-559f-cfa3-0f0c-177ff59975e7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559f-cfa3-6a6c-9d10b6add78e	000e0000-559f-cfa3-2b4c-18ee70d31f14	00080000-559f-cfa3-0f0c-177ff59975e7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559f-cfa3-be60-3b89e1ab2bdb	000e0000-559f-cfa3-2b4c-18ee70d31f14	00080000-559f-cfa3-5e55-3540179ebdf4	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9726576)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9726755)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559f-cfa3-1a66-9ad7bda00999	00180000-559f-cfa3-76c8-97f09fd436d2	000c0000-559f-cfa3-cc71-b7501a85f97f	00090000-559f-cfa3-91e4-aa91879a0039	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-cfa3-4fb3-0eafc35214da	00180000-559f-cfa3-76c8-97f09fd436d2	000c0000-559f-cfa3-2462-08c09ce6e0ca	00090000-559f-cfa3-0074-f49b0f565c49	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-cfa3-1078-48421d71949a	00180000-559f-cfa3-76c8-97f09fd436d2	000c0000-559f-cfa3-c439-551a6046cc26	00090000-559f-cfa3-7640-db413fffc940	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-cfa3-5004-a01b40048f0c	00180000-559f-cfa3-76c8-97f09fd436d2	000c0000-559f-cfa3-66f4-5167eaa93e92	00090000-559f-cfa3-9f2d-305bc277b1f6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-cfa3-9d9e-4a882e84bf59	00180000-559f-cfa3-76c8-97f09fd436d2	000c0000-559f-cfa3-b346-c7a942e64d9a	00090000-559f-cfa3-1595-01febca37cf4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-559f-cfa3-1623-25102b2b5682	00180000-559f-cfa3-7681-71136adbf338	\N	00090000-559f-cfa3-1595-01febca37cf4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2897 (class 0 OID 9726941)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559f-cfa2-8140-84a02f396fda	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559f-cfa2-c281-978f6f886404	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559f-cfa2-d013-2bcd16f08ecb	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559f-cfa2-5e72-a513fd021da0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559f-cfa2-363b-ca044f68ab80	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559f-cfa2-b2bb-e037a0e4d41e	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559f-cfa2-5e32-34775a668ac4	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559f-cfa2-dfeb-b08b7c6efc50	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559f-cfa2-961f-c5d71ffeccfc	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559f-cfa2-7adc-6c915e6b14af	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559f-cfa2-5145-f3f587e8c088	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559f-cfa2-ef17-053c777bdec3	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559f-cfa2-369f-fd718aa7856f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559f-cfa2-edf6-0868ca475597	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559f-cfa2-8fac-8c32a6d1eb00	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559f-cfa2-3204-01bbe3bc1d5c	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9727131)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559f-cfa2-5080-3773c5416835	01	Velika predstava	f	1.00	1.00
002b0000-559f-cfa2-a3b1-17b0358d9930	02	Mala predstava	f	0.50	0.50
002b0000-559f-cfa2-4a9a-12cbb2d4dfdc	03	Mala koprodukcija	t	0.40	1.00
002b0000-559f-cfa2-1804-65844dddcce1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559f-cfa2-4c4f-18de687686d6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9726639)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9726485)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559f-cfa2-eca8-27edbba6d5cf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4rS4nZUr7p9qGqRBYLhTDu1k.N7q1Zu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-d719-3332568c5296	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-b622-b8812ddb224c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-7895-3f36c29ab595	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-46ca-b45dce95f9c5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-0fe9-c296e02b3db3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-7fcc-3ee2a856d5ef	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-57c3-30f0eb765841	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-8fb4-6cc44ffe950a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-1f50-344470e54691	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559f-cfa3-fd11-636011a529c6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559f-cfa2-10dd-1def035fbe5d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9726989)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559f-cfa3-de0a-d62e18a125c9	00160000-559f-cfa3-2686-79b58470afaa	00150000-559f-cfa2-f6d0-959fc6c19bab	00140000-559f-cfa1-8660-0ceb1b156529	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559f-cfa3-81b7-9baa0b1f4d41
000e0000-559f-cfa3-2b4c-18ee70d31f14	00160000-559f-cfa3-1f43-ab835291fbfa	00150000-559f-cfa2-cece-c961e7fd6f6f	00140000-559f-cfa1-978e-75ca1503d85c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559f-cfa3-7ce2-4be163d68886
000e0000-559f-cfa3-92f7-3eb86d51515c	\N	00150000-559f-cfa2-cece-c961e7fd6f6f	00140000-559f-cfa1-978e-75ca1503d85c	00190000-559f-cfa3-8586-ddb53aaa2c25	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559f-cfa3-81b7-9baa0b1f4d41
000e0000-559f-cfa3-7768-5cd3fa4b83cc	\N	00150000-559f-cfa2-cece-c961e7fd6f6f	00140000-559f-cfa1-978e-75ca1503d85c	00190000-559f-cfa3-8586-ddb53aaa2c25	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559f-cfa3-81b7-9baa0b1f4d41
000e0000-559f-cfa3-f9f3-5a6256d30514	\N	00150000-559f-cfa2-cece-c961e7fd6f6f	00140000-559f-cfa1-978e-75ca1503d85c	00190000-559f-cfa3-8586-ddb53aaa2c25	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559f-cfa3-9e5f-e2f539a89272
\.


--
-- TOC entry 2871 (class 0 OID 9726701)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559f-cfa3-7244-a7adef78b035	000e0000-559f-cfa3-2b4c-18ee70d31f14	1	
00200000-559f-cfa3-c5df-5e4cbaecdec0	000e0000-559f-cfa3-2b4c-18ee70d31f14	2	
\.


--
-- TOC entry 2886 (class 0 OID 9726826)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9726895)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9726733)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9726979)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559f-cfa1-8660-0ceb1b156529	01	Drama	drama (SURS 01)
00140000-559f-cfa1-1b11-c3814e119bca	02	Opera	opera (SURS 02)
00140000-559f-cfa1-a121-6a6d170623d7	03	Balet	balet (SURS 03)
00140000-559f-cfa1-823c-8e2b5fa6f325	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559f-cfa1-c54a-9b51e15ce156	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559f-cfa1-978e-75ca1503d85c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559f-cfa1-d22b-78bf48df16a9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9726885)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559f-cfa2-1b33-3f00118ea10f	01	Opera	opera
00150000-559f-cfa2-333b-762a481364a7	02	Opereta	opereta
00150000-559f-cfa2-f261-73aa1943b46f	03	Balet	balet
00150000-559f-cfa2-b5f0-4730a54e54de	04	Plesne prireditve	plesne prireditve
00150000-559f-cfa2-c982-fe2f6449028c	05	Lutkovno gledališče	lutkovno gledališče
00150000-559f-cfa2-958e-afbbd8f89a05	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559f-cfa2-4c2e-52df890c2ebe	07	Biografska drama	biografska drama
00150000-559f-cfa2-f6d0-959fc6c19bab	08	Komedija	komedija
00150000-559f-cfa2-22e8-24b53a56d75d	09	Črna komedija	črna komedija
00150000-559f-cfa2-2ba4-8aa19b4b3839	10	E-igra	E-igra
00150000-559f-cfa2-cece-c961e7fd6f6f	11	Kriminalka	kriminalka
00150000-559f-cfa2-0cb2-5a3bf9bbb02d	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9726539)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9727036)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9727026)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9726940)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9726723)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9726748)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9727147)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9726665)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9727088)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9726881)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9726699)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9726742)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9726679)
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
-- TOC entry 2537 (class 2606 OID 9726791)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9726818)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9726637)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9726548)
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
-- TOC entry 2452 (class 2606 OID 9726572)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9726528)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9726513)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9726824)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9726857)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9726974)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9726601)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9726625)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9726797)
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
-- TOC entry 2467 (class 2606 OID 9726615)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9726686)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9726809)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9727120)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9727128)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9727110)
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
-- TOC entry 2557 (class 2606 OID 9726841)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9726782)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9726773)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9726962)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9726909)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9726484)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9726848)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9726502)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9726522)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9726866)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9726804)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9726754)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9727171)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9727159)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9727153)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9726922)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9726581)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9726764)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9726951)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9727141)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9726650)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9726497)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9727005)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9726708)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9726832)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9726900)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9726737)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9726987)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9726893)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9726730)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9726923)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9726924)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9726603)
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
-- TOC entry 2550 (class 1259 OID 9726825)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9726811)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9726810)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9726709)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9726882)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9726884)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9726883)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9726681)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9726680)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9726976)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9726977)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9726978)
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
-- TOC entry 2604 (class 1259 OID 9727010)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9727007)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9727011)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9727009)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9727008)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9726652)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9726651)
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
-- TOC entry 2450 (class 1259 OID 9726575)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9726849)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9726743)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9726529)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9726530)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9726869)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9726868)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9726867)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9726687)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9726689)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9726688)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9727161)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9726777)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9726775)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9726774)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9726776)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9726503)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9726504)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9726833)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9726798)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9726910)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9726911)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9727092)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9727089)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9727090)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9727091)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9726617)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9726616)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9726618)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9727121)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9727122)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9727040)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9727038)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9727039)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9726901)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9726786)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9726785)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9726783)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9726784)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9727028)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9727027)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9727111)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9726700)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9727148)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9726550)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9726549)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9726582)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9726583)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9726767)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9726766)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9726765)
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
-- TOC entry 2502 (class 1259 OID 9726732)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9726728)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9726725)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9726726)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9726724)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9726729)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9726727)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9726602)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9726666)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9726668)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9726667)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9726669)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9726792)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9726975)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9727006)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9726573)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9726574)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9726894)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9727172)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9726638)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9727160)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9726843)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9726842)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9727037)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9727041)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9726626)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9726988)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9727129)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9727130)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9726523)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9726731)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9727308)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9727293)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9727298)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9727318)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9727288)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9727313)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9727303)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9727463)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9727468)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9727223)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9727403)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9727398)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9727393)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9727283)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9727433)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9727443)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9727438)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9727258)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9727253)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9727383)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9727473)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9727478)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9727483)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9727503)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9727488)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9727508)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9727498)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9727493)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9727248)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9727243)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9727208)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9727203)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9727413)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9727323)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9727183)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9727188)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9727428)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9727423)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9727418)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9727263)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9727273)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9727268)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9727588)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9727358)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9727348)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9727343)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9727353)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9727173)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9727178)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9727408)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9727388)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9727453)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9727458)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9727558)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9727543)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9727548)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9727553)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9727233)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9727228)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9727238)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9727568)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9727573)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9727533)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9727538)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9727523)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9727528)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9727448)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9727378)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9727373)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9727363)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9727368)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9727518)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9727513)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9727563)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9727278)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9727578)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9727583)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9727198)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9727193)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9727213)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9727218)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9727338)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9727333)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9727328)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-10 15:59:00 CEST

--
-- PostgreSQL database dump complete
--

