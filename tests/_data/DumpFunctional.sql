--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-09 16:27:23 CEST

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
-- TOC entry 183 (class 1259 OID 9590518)
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
-- TOC entry 228 (class 1259 OID 9591016)
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
-- TOC entry 227 (class 1259 OID 9590999)
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
-- TOC entry 221 (class 1259 OID 9590912)
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
-- TOC entry 197 (class 1259 OID 9590697)
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
-- TOC entry 200 (class 1259 OID 9590731)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9591129)
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
-- TOC entry 192 (class 1259 OID 9590640)
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
-- TOC entry 229 (class 1259 OID 9591029)
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
-- TOC entry 216 (class 1259 OID 9590857)
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
-- TOC entry 195 (class 1259 OID 9590677)
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
-- TOC entry 199 (class 1259 OID 9590725)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9590657)
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
-- TOC entry 205 (class 1259 OID 9590774)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9590799)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9590614)
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
-- TOC entry 184 (class 1259 OID 9590527)
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
-- TOC entry 185 (class 1259 OID 9590538)
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
-- TOC entry 180 (class 1259 OID 9590492)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9590511)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9590806)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9590837)
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
-- TOC entry 224 (class 1259 OID 9590950)
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
-- TOC entry 187 (class 1259 OID 9590571)
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
-- TOC entry 189 (class 1259 OID 9590606)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9590780)
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
-- TOC entry 188 (class 1259 OID 9590591)
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
-- TOC entry 194 (class 1259 OID 9590669)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9590792)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9591099)
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
-- TOC entry 232 (class 1259 OID 9591110)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9591080)
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
-- TOC entry 212 (class 1259 OID 9590821)
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
-- TOC entry 204 (class 1259 OID 9590765)
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
-- TOC entry 203 (class 1259 OID 9590755)
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
-- TOC entry 223 (class 1259 OID 9590939)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9590889)
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
-- TOC entry 177 (class 1259 OID 9590463)
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
-- TOC entry 176 (class 1259 OID 9590461)
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
-- TOC entry 213 (class 1259 OID 9590831)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9590501)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9590485)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9590845)
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
-- TOC entry 207 (class 1259 OID 9590786)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9590736)
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
-- TOC entry 237 (class 1259 OID 9591149)
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
-- TOC entry 236 (class 1259 OID 9591141)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9591136)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9590899)
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
-- TOC entry 186 (class 1259 OID 9590563)
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
-- TOC entry 202 (class 1259 OID 9590742)
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
-- TOC entry 222 (class 1259 OID 9590928)
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
-- TOC entry 233 (class 1259 OID 9591118)
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
-- TOC entry 191 (class 1259 OID 9590626)
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
-- TOC entry 178 (class 1259 OID 9590472)
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
-- TOC entry 226 (class 1259 OID 9590976)
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
-- TOC entry 196 (class 1259 OID 9590688)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9590813)
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
-- TOC entry 218 (class 1259 OID 9590882)
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
-- TOC entry 198 (class 1259 OID 9590720)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9590966)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9590872)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9590466)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9590518)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9591016)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559e-84cb-b72b-4c20d4141e0d	000d0000-559e-84cb-b7e7-248319c93e02	\N	00090000-559e-84ca-b455-ec8286b8c40e	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559e-84cb-46a9-252c2813a777	000d0000-559e-84cb-6975-d2f3aec29152	\N	00090000-559e-84ca-3152-f7c65e9f1ca8	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559e-84cb-8c7c-00579853ca9a	000d0000-559e-84cb-65fd-6cf8b4316714	\N	00090000-559e-84ca-df31-064bbe042a28	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559e-84cb-bb50-aa3dd3fb0fae	000d0000-559e-84cb-5dea-50f51fc80c06	\N	00090000-559e-84ca-385b-089c41765e5c	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559e-84cb-13a6-9c93e203bb6d	000d0000-559e-84cb-7eed-a3230a81838b	\N	00090000-559e-84ca-0292-6f68b5980523	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559e-84cb-4b79-00c4e2ed2107	000d0000-559e-84cb-2fc3-384efeb277b7	\N	00090000-559e-84ca-d8d0-663684feff65	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559e-84cb-d2fc-f3c7e5ce1fe5	000d0000-559e-84cb-9275-0db3cdbdcde1	\N	00090000-559e-84ca-b2ff-6cf4dc28d06f	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559e-84cb-3fe7-00ba4802c6aa	000d0000-559e-84cb-a024-af1feb1df478	\N	00090000-559e-84ca-c1be-7284f1eaca84	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9590999)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9590912)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559e-84ca-6619-c46dd44266b8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559e-84ca-2909-8b2472b005b2	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559e-84ca-b725-beb4b7ee875a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9590697)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559e-84cb-4686-d453e5b10479	\N	\N	00200000-559e-84cb-b1da-517072bbec41	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559e-84cb-f3dd-5746fd45a8b2	\N	\N	00200000-559e-84cb-5280-00636dd8e39c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559e-84cb-6b44-3f8404760179	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559e-84cb-9cc2-fbbbe1fcd818	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559e-84cb-7bc1-ad88dbb8ad54	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9590731)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9591129)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9590640)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559e-84c9-ffb8-c86ccb9c09bc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559e-84c9-bcfd-78b16ddc383e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559e-84c9-d88c-c9beaf5ccb01	AL	ALB	008	Albania 	Albanija	\N
00040000-559e-84c9-cc9a-60f8ce71a966	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559e-84c9-3947-17bbab1e890a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559e-84c9-205e-9f67169028b7	AD	AND	020	Andorra 	Andora	\N
00040000-559e-84c9-f858-8950000b583c	AO	AGO	024	Angola 	Angola	\N
00040000-559e-84c9-85c5-b8f8bbd0bb8f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559e-84c9-96cb-09e15c4772d2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559e-84c9-f54d-54a29789c60f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559e-84c9-47c9-1e231312118a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559e-84c9-353c-b356de0b9254	AM	ARM	051	Armenia 	Armenija	\N
00040000-559e-84c9-b902-3140d5910d8b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559e-84c9-f4bb-88c7f6ccca41	AU	AUS	036	Australia 	Avstralija	\N
00040000-559e-84c9-96bb-7f057d594f6d	AT	AUT	040	Austria 	Avstrija	\N
00040000-559e-84c9-18e5-4a85dcdd7af1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559e-84c9-2bb4-3bee9ac12ed3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559e-84c9-2730-5a2398252d6a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559e-84c9-60b0-ec6ca61ffa32	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559e-84c9-cce1-98d9080f6e16	BB	BRB	052	Barbados 	Barbados	\N
00040000-559e-84c9-2b95-767759e2ebfc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559e-84c9-94a8-ba97f80ce9d7	BE	BEL	056	Belgium 	Belgija	\N
00040000-559e-84c9-9b32-0c8b2c31a0f7	BZ	BLZ	084	Belize 	Belize	\N
00040000-559e-84c9-4724-d757106bbbce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559e-84c9-f4de-d7d8826a98c9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559e-84c9-869d-fba5ec566afc	BT	BTN	064	Bhutan 	Butan	\N
00040000-559e-84c9-412d-d15d5c237ede	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559e-84c9-9a9b-423bb15e607a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559e-84c9-bae0-59534817bca9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559e-84c9-ae09-bac005f19f14	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559e-84c9-8371-f206c2c48cfd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559e-84c9-cd50-b454c98e7e12	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559e-84c9-eebb-4f78644ec15f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559e-84c9-213e-a19845c18725	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559e-84c9-7976-410790dfad3f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559e-84c9-2d10-8fe0525b300d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559e-84c9-2d53-51bba91b08d1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559e-84c9-ea8e-51f135060eb5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559e-84c9-0601-ca03cdad5d84	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559e-84c9-94d2-2067b6878461	CA	CAN	124	Canada 	Kanada	\N
00040000-559e-84c9-93c8-33771df83b40	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559e-84c9-7d75-28c358133fd7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559e-84c9-ae26-754f54761e83	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559e-84c9-f23e-310cb6bb69ff	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559e-84c9-cf44-183f939999d9	CL	CHL	152	Chile 	Čile	\N
00040000-559e-84c9-7934-c6cf3d7270eb	CN	CHN	156	China 	Kitajska	\N
00040000-559e-84c9-f364-63de249d48d4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559e-84c9-3ef0-2a45acf2a164	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559e-84c9-2ea4-e04a96c0dddf	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559e-84c9-5628-c8862849e16f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559e-84c9-df6a-981cc97cf9ee	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559e-84c9-7e28-3c6ec1b53c65	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559e-84c9-2949-6b55fae8f2a2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559e-84c9-088f-86e5bc7d21f9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559e-84c9-eb91-f026e45a0fa3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559e-84c9-3cb0-41bbc0df1e8f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559e-84c9-d1d2-1c63b1f5659d	CU	CUB	192	Cuba 	Kuba	\N
00040000-559e-84c9-71d2-d9051fdc7464	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559e-84c9-0d5b-70c2c01621f5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559e-84c9-ccd7-5e3412a4359d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559e-84c9-6174-99062dd69d48	DK	DNK	208	Denmark 	Danska	\N
00040000-559e-84c9-4ba0-b3112fee52af	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559e-84c9-74ff-d1de52a5a477	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559e-84c9-7f10-7f213f3dbfd8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559e-84c9-a21a-eb38b91a10ce	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559e-84c9-1335-e5c26467b091	EG	EGY	818	Egypt 	Egipt	\N
00040000-559e-84c9-70f1-5980ff124a89	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559e-84c9-ebae-b5dfb0b88569	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559e-84c9-18fb-cf5edf428d5d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559e-84c9-6034-c896d9553965	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559e-84c9-c951-b1a668b6a503	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559e-84c9-5e3f-1843c4b61af2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559e-84c9-c4be-d269fee4079c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559e-84c9-12cc-190d9b80283c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559e-84c9-402a-23861cc224fa	FI	FIN	246	Finland 	Finska	\N
00040000-559e-84c9-f51e-cd734f1c65a6	FR	FRA	250	France 	Francija	\N
00040000-559e-84c9-3e61-1e40aa8cbb17	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559e-84c9-1796-913acc4db023	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559e-84c9-b141-3242d5e7d68e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559e-84c9-052b-ae618f2b2fa5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559e-84c9-ded6-7ff917b4f872	GA	GAB	266	Gabon 	Gabon	\N
00040000-559e-84c9-7ea8-4df52d026c8f	GM	GMB	270	Gambia 	Gambija	\N
00040000-559e-84c9-5973-77bd7745fd26	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559e-84c9-6acb-adc188a9d1e6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559e-84c9-3f9d-aaa4743d4cef	GH	GHA	288	Ghana 	Gana	\N
00040000-559e-84c9-45f2-b08939bada67	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559e-84c9-394e-2ead8f3885cb	GR	GRC	300	Greece 	Grčija	\N
00040000-559e-84c9-d4b4-fb8ff6c0b730	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559e-84c9-c193-1a86a409d745	GD	GRD	308	Grenada 	Grenada	\N
00040000-559e-84c9-4bb2-278f2436b3ac	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559e-84c9-4785-a500ff9d19b9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559e-84c9-c3a2-be2c8c049515	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559e-84c9-a60b-2e2a63de7f1d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559e-84c9-ee07-57a7b91e10ff	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559e-84c9-b2a1-fcacf87062fd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559e-84c9-6bf7-c1d54ce6faf1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559e-84c9-8c2c-62d15195c1c5	HT	HTI	332	Haiti 	Haiti	\N
00040000-559e-84c9-d983-3716b757e1d2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559e-84c9-c172-58e60f4c1a21	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559e-84c9-39df-df982a8b1898	HN	HND	340	Honduras 	Honduras	\N
00040000-559e-84c9-dfeb-31834d7f8829	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559e-84c9-87b1-30c0aa2d08f0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559e-84c9-f76a-f0ba9c6a8701	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559e-84c9-6e58-0f2461027dc8	IN	IND	356	India 	Indija	\N
00040000-559e-84c9-1a7d-c8dc4e728b7c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559e-84c9-0aab-73cf689c497f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559e-84c9-59a4-affeaeda063c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559e-84c9-14cf-996389ad1e9e	IE	IRL	372	Ireland 	Irska	\N
00040000-559e-84c9-3ee8-24f78e763c76	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559e-84c9-e28c-4c283a931e17	IL	ISR	376	Israel 	Izrael	\N
00040000-559e-84c9-3c47-fdc93d13ca37	IT	ITA	380	Italy 	Italija	\N
00040000-559e-84c9-820d-dcd973d164fe	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559e-84c9-7310-b286ee579787	JP	JPN	392	Japan 	Japonska	\N
00040000-559e-84c9-a26d-691087dbb2d9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559e-84c9-56a0-c8059428352f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559e-84c9-696b-f53e2ac12d69	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559e-84c9-46ee-ea64425524b5	KE	KEN	404	Kenya 	Kenija	\N
00040000-559e-84c9-2bad-9459b24e31bc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559e-84c9-f698-b7b060171813	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559e-84c9-b723-70114bb49da9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559e-84c9-0ee0-0f35cf565ae4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559e-84c9-0fdf-82ba094418d0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559e-84c9-dad1-85eca607b173	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559e-84c9-11c5-d31d3228c834	LV	LVA	428	Latvia 	Latvija	\N
00040000-559e-84c9-43fe-f6b5ff899699	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559e-84c9-ac0d-c6d187945b60	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559e-84c9-483a-c27aebdc06ec	LR	LBR	430	Liberia 	Liberija	\N
00040000-559e-84c9-5f43-fe78adcc5b52	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559e-84c9-076f-d9625e68489b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559e-84c9-7d58-2319a010b02f	LT	LTU	440	Lithuania 	Litva	\N
00040000-559e-84c9-2a1d-98364163cc0f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559e-84c9-6e59-f67f5254eaca	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559e-84c9-f742-737ec7808b55	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559e-84c9-1915-c5b919fc9ab3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559e-84c9-ae57-d50ec76ded04	MW	MWI	454	Malawi 	Malavi	\N
00040000-559e-84c9-0823-19df00ccd54a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559e-84c9-a303-47be41f5a60e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559e-84c9-2172-ee9508b9e2b0	ML	MLI	466	Mali 	Mali	\N
00040000-559e-84c9-bb68-261675ba11da	MT	MLT	470	Malta 	Malta	\N
00040000-559e-84c9-3add-2dffb62fd608	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559e-84c9-ed11-6e927d808cdd	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559e-84c9-b80c-2bfbd9e98a3b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559e-84c9-c544-2cd90a0a0fe1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559e-84c9-b6ce-2d07dee2bb7d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559e-84c9-ff80-5c86618bb0e3	MX	MEX	484	Mexico 	Mehika	\N
00040000-559e-84c9-6d85-d0e73cb9aaaa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559e-84c9-c8fc-d8afbc51ab86	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559e-84c9-7a93-81248e007fad	MC	MCO	492	Monaco 	Monako	\N
00040000-559e-84c9-a1a3-e1d2d03040f1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559e-84c9-5f48-cc594522c57c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559e-84c9-fcd9-9b4687f690b0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559e-84c9-3ede-50bdea497f9e	MA	MAR	504	Morocco 	Maroko	\N
00040000-559e-84c9-b179-003b4f5359d2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559e-84c9-44c7-dcab9eda9aa1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559e-84c9-573a-e48212a83caa	NA	NAM	516	Namibia 	Namibija	\N
00040000-559e-84c9-a02f-edc0e875f1c4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559e-84c9-cd2a-9641deb69f8a	NP	NPL	524	Nepal 	Nepal	\N
00040000-559e-84c9-d595-fd6a3d05839a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559e-84c9-e1d8-ded6f0afea33	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559e-84c9-6313-cfe23e043f78	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559e-84c9-020d-76aa48c4a7ec	NE	NER	562	Niger 	Niger 	\N
00040000-559e-84c9-c223-aa9c52ffae1c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559e-84c9-25a7-6ee252717e87	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559e-84c9-c6be-22d1dfedc2f7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559e-84c9-bbeb-4542ab98b7ea	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559e-84c9-38f4-dd8476779ddc	NO	NOR	578	Norway 	Norveška	\N
00040000-559e-84c9-df45-6ae26517e6b3	OM	OMN	512	Oman 	Oman	\N
00040000-559e-84c9-712e-f7722b0e99e6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559e-84c9-bd56-a26926b45d26	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559e-84c9-7bd3-eadf0d340457	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559e-84c9-4f5e-3810253ccaa6	PA	PAN	591	Panama 	Panama	\N
00040000-559e-84c9-36d3-1213f407286a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559e-84c9-2eac-3783ec74736a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559e-84c9-eb14-40911d7daaa4	PE	PER	604	Peru 	Peru	\N
00040000-559e-84c9-4b52-d0f44075ce88	PH	PHL	608	Philippines 	Filipini	\N
00040000-559e-84c9-a1c7-48c4f35d499b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559e-84c9-e18c-b72555a29117	PL	POL	616	Poland 	Poljska	\N
00040000-559e-84c9-4aa6-943b0647f1c1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559e-84c9-4f25-4d20eeaa6927	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559e-84c9-c7ab-ebe3fed29245	QA	QAT	634	Qatar 	Katar	\N
00040000-559e-84c9-5a43-cebb421a7bec	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559e-84c9-c164-6034afdb721e	RO	ROU	642	Romania 	Romunija	\N
00040000-559e-84c9-25e0-53ba890778c8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559e-84c9-fbd8-672098487464	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559e-84c9-f976-ae885203ab06	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559e-84c9-f21a-a11e53250ada	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559e-84c9-b58a-80df3eaa362c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559e-84c9-aeb5-e5daf538d1c2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559e-84c9-66c5-4aec6e8bf154	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559e-84c9-bf52-ed824512629e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559e-84c9-46c9-6ca04622bf25	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559e-84c9-7a15-0eb69f19873d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559e-84c9-710d-486839d7524a	SM	SMR	674	San Marino 	San Marino	\N
00040000-559e-84c9-9b1d-e97972642a58	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559e-84c9-7448-071ea3c9b5d3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559e-84c9-9810-73baa80c9d79	SN	SEN	686	Senegal 	Senegal	\N
00040000-559e-84c9-3e73-3cfe8894a1bc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559e-84c9-7552-a5234497aa69	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559e-84c9-f9b7-2daf3251dd41	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559e-84c9-0ec9-e3e03b8abb6d	SG	SGP	702	Singapore 	Singapur	\N
00040000-559e-84c9-7bc8-53daf443366e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559e-84c9-2cf0-65094e01ef05	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559e-84c9-be75-8accd5575265	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559e-84c9-4305-f1e1087fbe11	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559e-84c9-6cb1-6fa658e064b0	SO	SOM	706	Somalia 	Somalija	\N
00040000-559e-84c9-3803-fe5bb82eb672	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559e-84c9-c6e6-acf9ef348ed1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559e-84c9-8f75-1168efd97fe2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559e-84c9-1ce2-8585dde79935	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559e-84c9-b090-ef84a9d4d0a9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559e-84c9-d5f1-4200b4e8c877	SD	SDN	729	Sudan 	Sudan	\N
00040000-559e-84c9-984c-ba156ca63975	SR	SUR	740	Suriname 	Surinam	\N
00040000-559e-84c9-e0e8-39c3608c7f8a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559e-84c9-b9f1-a6eb0fbe6a34	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559e-84c9-2bd0-6b00a0017d61	SE	SWE	752	Sweden 	Švedska	\N
00040000-559e-84c9-d2ad-4cbeab1a54d2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559e-84c9-ff23-6647dfd2e364	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559e-84c9-c293-98e760fcebef	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559e-84c9-e873-c689eccc81ac	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559e-84c9-e174-3f91214630a0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559e-84c9-04ca-f47d0b4262a4	TH	THA	764	Thailand 	Tajska	\N
00040000-559e-84c9-0e62-ba060e975d48	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559e-84c9-b61d-6cfc284d4922	TG	TGO	768	Togo 	Togo	\N
00040000-559e-84c9-c398-cd72a7bac14d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559e-84c9-f494-5cc955ef3f4f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559e-84c9-5001-7d130d5d682d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559e-84c9-52a3-113af3b93416	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559e-84c9-25c5-3354a09abe83	TR	TUR	792	Turkey 	Turčija	\N
00040000-559e-84c9-af33-f43621df1ffe	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559e-84c9-348b-c092a57c0612	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559e-84c9-f35a-6d2c7366a68a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559e-84c9-4b6c-cc5c8dd72b22	UG	UGA	800	Uganda 	Uganda	\N
00040000-559e-84c9-2932-7035f3240ac4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559e-84c9-8669-eaf92a1a1438	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559e-84c9-cb73-bf7afb366abc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559e-84c9-be48-187178a08b2e	US	USA	840	United States 	Združene države Amerike	\N
00040000-559e-84c9-5f33-3e14c8e84c73	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559e-84c9-b205-d935eb6fbc3c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559e-84c9-deb3-4a7239c23021	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559e-84c9-63b3-ba170286b5b6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559e-84c9-7558-01d09432e491	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559e-84c9-03c9-ac3ab8ed4b7a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559e-84c9-bf50-8254235e4c13	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559e-84c9-e98b-2f06a3f74deb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559e-84c9-58ed-87550a7f59c0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559e-84c9-d980-dc618c9461eb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559e-84c9-28ee-673e51338d08	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559e-84c9-1976-5a736435a99c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559e-84c9-31f1-717cad263e7b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9591029)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559e-84cb-8dd4-db38de903d0f	000e0000-559e-84cb-6b9d-7c5a514ac247	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559e-84c9-3e3d-d5caaa5f4be5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559e-84cb-30a1-e0744682f1d1	000e0000-559e-84cb-6284-e4f252bdcb37	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559e-84c9-35b3-7a27b8a5ea06	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9590857)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559e-84cb-9275-0db3cdbdcde1	000e0000-559e-84cb-6284-e4f252bdcb37	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559e-84c9-03f3-99b11329aea9
000d0000-559e-84cb-b7e7-248319c93e02	000e0000-559e-84cb-6284-e4f252bdcb37	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559e-84c9-03f3-99b11329aea9
000d0000-559e-84cb-6975-d2f3aec29152	000e0000-559e-84cb-6284-e4f252bdcb37	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559e-84c9-9ca0-0eeea67c1d54
000d0000-559e-84cb-65fd-6cf8b4316714	000e0000-559e-84cb-6284-e4f252bdcb37	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559e-84c9-3fea-badf70a6d50a
000d0000-559e-84cb-5dea-50f51fc80c06	000e0000-559e-84cb-6284-e4f252bdcb37	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559e-84c9-3fea-badf70a6d50a
000d0000-559e-84cb-7eed-a3230a81838b	000e0000-559e-84cb-6284-e4f252bdcb37	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559e-84c9-3fea-badf70a6d50a
000d0000-559e-84cb-2fc3-384efeb277b7	000e0000-559e-84cb-6284-e4f252bdcb37	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559e-84c9-03f3-99b11329aea9
000d0000-559e-84cb-a024-af1feb1df478	000e0000-559e-84cb-6284-e4f252bdcb37	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559e-84c9-4b5f-3b33e03f4c61
\.


--
-- TOC entry 2870 (class 0 OID 9590677)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9590725)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9590657)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559e-84cb-47aa-c3f6bc1606d0	00080000-559e-84ca-aae3-1c11c7f900cd	00090000-559e-84ca-b455-ec8286b8c40e	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9590774)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9590799)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9590614)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559e-84c9-ff9b-602245b53282	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559e-84c9-cdb4-3e6bfcf015a2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559e-84c9-0980-902ed18a8508	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559e-84c9-2350-9e2a8da7d8f8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559e-84c9-1948-4614c3f1b0b4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559e-84c9-f427-d9cc2cfd723c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559e-84c9-6f1b-f2d981cdfe6a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559e-84c9-00d1-e2f40fbeed97	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559e-84c9-e2ba-f12b220bdebc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559e-84c9-5d3e-a25a256fabf8	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559e-84c9-ae2e-2c7277285a2f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559e-84c9-9bfa-eb175bde52a1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559e-84c9-582f-c70170968c75	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559e-84ca-3767-d09681fad751	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559e-84ca-4965-71b29fcd475b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559e-84ca-7bd6-f833b803ee96	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559e-84ca-da3d-fb172f1f4bbc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559e-84ca-2ff7-7f7449f7c16c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559e-84ca-5a4a-ca75d0784ea3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9590527)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559e-84ca-dcc8-4211e01067fb	00000000-559e-84ca-4965-71b29fcd475b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559e-84ca-b8c2-e513710deaa5	00000000-559e-84ca-4965-71b29fcd475b	00010000-559e-84c9-d9d3-d1c794c14702	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559e-84ca-2f69-83e5e75be906	00000000-559e-84ca-7bd6-f833b803ee96	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9590538)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559e-84ca-8dae-c6e83463de31	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559e-84ca-385b-089c41765e5c	00010000-559e-84ca-c332-61c692cac3af	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559e-84ca-df31-064bbe042a28	00010000-559e-84ca-2523-f72f70fc465f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559e-84ca-e89d-0312b1166227	00010000-559e-84ca-1d6a-8116eac257c2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559e-84ca-c81b-b0191ab160bb	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559e-84ca-d8d0-663684feff65	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559e-84ca-4376-082ba74c6511	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559e-84ca-b2ff-6cf4dc28d06f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559e-84ca-b455-ec8286b8c40e	00010000-559e-84ca-91d3-d41a4a17fe35	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559e-84ca-3152-f7c65e9f1ca8	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559e-84ca-72bd-af452523c301	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559e-84ca-0292-6f68b5980523	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559e-84ca-c1be-7284f1eaca84	00010000-559e-84ca-74fa-72598a9323e9	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9590492)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559e-84c9-3654-5903a460f2d1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559e-84c9-d462-370a57d04b3c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559e-84c9-9764-0edfd7ff37b8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559e-84c9-fe13-66b68286a398	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559e-84c9-3fe3-ef9e11b8d621	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559e-84c9-e760-72a43fb4c34d	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559e-84c9-65bd-983425ca2a67	Abonma-read	Abonma - branje	f
00030000-559e-84c9-064c-08d2b8d10cdf	Abonma-write	Abonma - spreminjanje	f
00030000-559e-84c9-f857-6d514b012ac7	Alternacija-read	Alternacija - branje	f
00030000-559e-84c9-81e9-613d59214147	Alternacija-write	Alternacija - spreminjanje	f
00030000-559e-84c9-f2e1-c5d0c095da5c	Arhivalija-read	Arhivalija - branje	f
00030000-559e-84c9-4a26-20a9c1c6626d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559e-84c9-0745-c84cf18457e5	Besedilo-read	Besedilo - branje	f
00030000-559e-84c9-b5f4-bf90f57b6b0c	Besedilo-write	Besedilo - spreminjanje	f
00030000-559e-84c9-764b-c9d7fe8c18ca	DogodekIzven-read	DogodekIzven - branje	f
00030000-559e-84c9-c4a8-b837399e32da	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559e-84c9-6294-ef30c87e9456	Dogodek-read	Dogodek - branje	f
00030000-559e-84c9-50db-862c1b161ba5	Dogodek-write	Dogodek - spreminjanje	f
00030000-559e-84c9-89d4-c9d74ba8fbd7	DrugiVir-read	DrugiVir - branje	f
00030000-559e-84c9-e3c1-f18005b27c4f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559e-84c9-cd0d-a4d38128cae4	Drzava-read	Drzava - branje	f
00030000-559e-84c9-ff8b-3faf6747b6d1	Drzava-write	Drzava - spreminjanje	f
00030000-559e-84c9-4b7c-146a4d6d653f	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559e-84c9-576e-95df2a05a135	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559e-84c9-4ef3-a3ce681743e6	Funkcija-read	Funkcija - branje	f
00030000-559e-84c9-f356-d633350f3cbb	Funkcija-write	Funkcija - spreminjanje	f
00030000-559e-84c9-b2a6-320f609f0b78	Gostovanje-read	Gostovanje - branje	f
00030000-559e-84c9-dbb1-e68c26476309	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559e-84c9-bd0b-304f1998c818	Gostujoca-read	Gostujoca - branje	f
00030000-559e-84c9-a4fe-4770db00382c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559e-84c9-208f-e0d9983c2bf3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559e-84c9-d3bc-599aa467c763	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559e-84c9-452b-78cf298a89e6	Kupec-read	Kupec - branje	f
00030000-559e-84c9-2220-c233046ccb9e	Kupec-write	Kupec - spreminjanje	f
00030000-559e-84c9-5b86-afee15ff50b5	NacinPlacina-read	NacinPlacina - branje	f
00030000-559e-84c9-3887-e21f508e1e7d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559e-84c9-ebe2-c33ddf0ec4d6	Option-read	Option - branje	f
00030000-559e-84c9-4b10-f18957f124ec	Option-write	Option - spreminjanje	f
00030000-559e-84c9-5548-d025fc1c259a	OptionValue-read	OptionValue - branje	f
00030000-559e-84c9-5fb4-2e05861993aa	OptionValue-write	OptionValue - spreminjanje	f
00030000-559e-84c9-56ff-a715a63f268f	Oseba-read	Oseba - branje	f
00030000-559e-84c9-ec24-1163fa185b99	Oseba-write	Oseba - spreminjanje	f
00030000-559e-84c9-ba2a-bb90d4740880	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559e-84c9-9880-dcbd0e298394	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559e-84c9-b333-5c43704b7233	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559e-84c9-1d91-ca08122a7c0e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559e-84c9-59a6-de6d20ac043e	Pogodba-read	Pogodba - branje	f
00030000-559e-84c9-6f31-8edc8f67eeef	Pogodba-write	Pogodba - spreminjanje	f
00030000-559e-84c9-a94a-a2c2dc96692f	Popa-read	Popa - branje	f
00030000-559e-84c9-4b59-9f450b9e21c6	Popa-write	Popa - spreminjanje	f
00030000-559e-84c9-8b97-e118a0690c6e	Posta-read	Posta - branje	f
00030000-559e-84c9-3d11-7e505b89c553	Posta-write	Posta - spreminjanje	f
00030000-559e-84c9-936e-54c11ed41984	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559e-84c9-dbfc-d21c73caaed2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559e-84c9-59ac-87eb5158e757	PostniNaslov-read	PostniNaslov - branje	f
00030000-559e-84c9-c5a9-3f4674a43eb4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559e-84c9-d8db-eac1478bcef1	Predstava-read	Predstava - branje	f
00030000-559e-84c9-22f8-9914cb6d5964	Predstava-write	Predstava - spreminjanje	f
00030000-559e-84c9-bf9d-b4f4ccab119e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559e-84c9-a35e-b1cbee757431	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559e-84c9-793c-904180062096	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559e-84c9-d973-a8d75ec4ca19	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559e-84c9-640a-0bd90332fd6a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559e-84c9-7655-d3b3f2ed10b6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559e-84c9-568e-691ba27ae80c	ProgramDela-read	ProgramDela - branje	f
00030000-559e-84c9-4906-738b7c33257e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559e-84c9-85ba-5640db6b48c0	ProgramFestival-read	ProgramFestival - branje	f
00030000-559e-84c9-e2a8-8dbf33fe45a5	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559e-84c9-5f56-3e8a0ba0053e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559e-84c9-b9c9-e4d4f7f1eaad	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559e-84c9-2b72-216a4d9395a8	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559e-84c9-a9b8-59cf0237f54a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559e-84c9-446f-abcc24fced1f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559e-84c9-0774-6cfe9f7aea32	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559e-84c9-e18c-ea3a2e1a0ecb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559e-84c9-ba1f-a0cfde10d24c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559e-84c9-e504-568681aec2c2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559e-84c9-80f7-b79f92030910	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559e-84c9-fb35-1f00dc083afb	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559e-84c9-11af-1ebd2436d1c2	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559e-84c9-6a5a-daf5f2a0e0dc	ProgramRazno-read	ProgramRazno - branje	f
00030000-559e-84c9-e90d-b05f1f42267c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559e-84c9-3b42-83e62c6451fc	Prostor-read	Prostor - branje	f
00030000-559e-84c9-3a60-eb6485512c0e	Prostor-write	Prostor - spreminjanje	f
00030000-559e-84c9-61bc-bb800ebb823d	Racun-read	Racun - branje	f
00030000-559e-84c9-a188-9c6b93bd98c4	Racun-write	Racun - spreminjanje	f
00030000-559e-84c9-6971-8d1998565b1f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559e-84c9-dfe7-8c686941b847	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559e-84c9-f0a8-90b580f397b2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559e-84c9-9dd3-cd908d77ee9b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559e-84c9-c599-cd9c64f1a45a	Rekvizit-read	Rekvizit - branje	f
00030000-559e-84c9-b11a-f89cea6cf124	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559e-84c9-1ac0-43fafe310321	Revizija-read	Revizija - branje	f
00030000-559e-84c9-d6dd-1a9bacb0870d	Revizija-write	Revizija - spreminjanje	f
00030000-559e-84c9-f312-5f3e5b573906	Rezervacija-read	Rezervacija - branje	f
00030000-559e-84c9-46d0-58f6485c17da	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559e-84c9-6b93-c011f51bc13f	SedezniRed-read	SedezniRed - branje	f
00030000-559e-84c9-71cb-3f99aa0d8dbd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559e-84c9-0d9c-c741ffa18266	Sedez-read	Sedez - branje	f
00030000-559e-84c9-b90d-88f16df70427	Sedez-write	Sedez - spreminjanje	f
00030000-559e-84c9-7546-89afec1ef301	Sezona-read	Sezona - branje	f
00030000-559e-84c9-bba8-4545e8392ae7	Sezona-write	Sezona - spreminjanje	f
00030000-559e-84c9-512e-8c30fbf77842	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559e-84c9-9237-68aec4e74c41	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559e-84c9-74a1-6b75112ec48b	Stevilcenje-read	Stevilcenje - branje	f
00030000-559e-84c9-caeb-2da4f983945d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559e-84c9-a2c6-6fcfeffcbe4e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559e-84c9-ac60-4bd895a03c47	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559e-84c9-6e35-8ebc106704a3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559e-84c9-1512-6dab31067e1a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559e-84c9-2fca-79844d54f246	Telefonska-read	Telefonska - branje	f
00030000-559e-84c9-b92a-a13635ebca59	Telefonska-write	Telefonska - spreminjanje	f
00030000-559e-84c9-356d-6e66b5da4e63	TerminStoritve-read	TerminStoritve - branje	f
00030000-559e-84c9-8d24-c49d0d93738e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559e-84c9-9c79-a2a4e157859c	TipFunkcije-read	TipFunkcije - branje	f
00030000-559e-84c9-c54e-7678f06d1db3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559e-84c9-6af4-7d12e639a2ea	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559e-84c9-ba2f-b05732e983c5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559e-84c9-0014-febde0ccb5ec	Trr-read	Trr - branje	f
00030000-559e-84c9-9299-a01548563403	Trr-write	Trr - spreminjanje	f
00030000-559e-84c9-ea98-46af5443becb	Uprizoritev-read	Uprizoritev - branje	f
00030000-559e-84c9-53a6-dc6f1d35b8be	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559e-84c9-cdcf-16c6e1fd9f0c	Vaja-read	Vaja - branje	f
00030000-559e-84c9-589f-7fb18c5c854f	Vaja-write	Vaja - spreminjanje	f
00030000-559e-84c9-28b5-81601db50cb9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559e-84c9-bc77-b7d68c40f89f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559e-84c9-e55a-d5d6e5c14c85	Zaposlitev-read	Zaposlitev - branje	f
00030000-559e-84c9-fe16-4be567e5a41e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559e-84c9-3404-99b82da3600b	Zasedenost-read	Zasedenost - branje	f
00030000-559e-84c9-06b9-43907003ed43	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559e-84c9-70b5-1a6fafa95b51	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559e-84c9-7b98-339a6135d1e0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559e-84c9-e2b3-6fed6c19ecc8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559e-84c9-4abc-1c13d33f79ad	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9590511)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559e-84c9-ae31-17f6431b1c88	00030000-559e-84c9-d462-370a57d04b3c
00020000-559e-84c9-1018-5173ce7c278c	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-064c-08d2b8d10cdf
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-f857-6d514b012ac7
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-81e9-613d59214147
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-fe13-66b68286a398
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-50db-862c1b161ba5
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-ff8b-3faf6747b6d1
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-4ef3-a3ce681743e6
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-f356-d633350f3cbb
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-dbb1-e68c26476309
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-a4fe-4770db00382c
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-208f-e0d9983c2bf3
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-d3bc-599aa467c763
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-56ff-a715a63f268f
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-ec24-1163fa185b99
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-4b59-9f450b9e21c6
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-3d11-7e505b89c553
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-59ac-87eb5158e757
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-c5a9-3f4674a43eb4
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-22f8-9914cb6d5964
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-640a-0bd90332fd6a
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-7655-d3b3f2ed10b6
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-3a60-eb6485512c0e
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-9dd3-cd908d77ee9b
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-b11a-f89cea6cf124
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-bba8-4545e8392ae7
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-9c79-a2a4e157859c
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-ea98-46af5443becb
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-53a6-dc6f1d35b8be
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-cdcf-16c6e1fd9f0c
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-589f-7fb18c5c854f
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-3404-99b82da3600b
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-06b9-43907003ed43
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84c9-32aa-ffe7dbb98418	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-208f-e0d9983c2bf3
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-d3bc-599aa467c763
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-56ff-a715a63f268f
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-ec24-1163fa185b99
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-59ac-87eb5158e757
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-c5a9-3f4674a43eb4
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-2fca-79844d54f246
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-b92a-a13635ebca59
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-0014-febde0ccb5ec
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-9299-a01548563403
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-e55a-d5d6e5c14c85
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-fe16-4be567e5a41e
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84c9-c6b5-fd2900fb2131	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-f857-6d514b012ac7
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-4a26-20a9c1c6626d
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-0745-c84cf18457e5
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-764b-c9d7fe8c18ca
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-4ef3-a3ce681743e6
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-208f-e0d9983c2bf3
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-56ff-a715a63f268f
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-640a-0bd90332fd6a
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-9c79-a2a4e157859c
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-cdcf-16c6e1fd9f0c
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-3404-99b82da3600b
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84c9-a319-a40e48d7d7bb	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-064c-08d2b8d10cdf
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-81e9-613d59214147
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-9c79-a2a4e157859c
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84c9-a74a-4b075ce9fa05	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-356d-6e66b5da4e63
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-9764-0edfd7ff37b8
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-9c79-a2a4e157859c
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84c9-f89a-017557a47ca1	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3654-5903a460f2d1
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-d462-370a57d04b3c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9764-0edfd7ff37b8
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-fe13-66b68286a398
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3fe3-ef9e11b8d621
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e760-72a43fb4c34d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-65bd-983425ca2a67
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-064c-08d2b8d10cdf
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-f857-6d514b012ac7
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-81e9-613d59214147
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-f2e1-c5d0c095da5c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4a26-20a9c1c6626d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-0745-c84cf18457e5
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b5f4-bf90f57b6b0c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-764b-c9d7fe8c18ca
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-c4a8-b837399e32da
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6294-ef30c87e9456
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-50db-862c1b161ba5
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-cd0d-a4d38128cae4
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ff8b-3faf6747b6d1
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4b7c-146a4d6d653f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-576e-95df2a05a135
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4ef3-a3ce681743e6
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-f356-d633350f3cbb
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b2a6-320f609f0b78
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-dbb1-e68c26476309
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-bd0b-304f1998c818
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a4fe-4770db00382c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-208f-e0d9983c2bf3
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-d3bc-599aa467c763
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-452b-78cf298a89e6
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-2220-c233046ccb9e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-5b86-afee15ff50b5
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3887-e21f508e1e7d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ebe2-c33ddf0ec4d6
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4b10-f18957f124ec
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-5548-d025fc1c259a
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-5fb4-2e05861993aa
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-56ff-a715a63f268f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ec24-1163fa185b99
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ba2a-bb90d4740880
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9880-dcbd0e298394
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b333-5c43704b7233
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-1d91-ca08122a7c0e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-59a6-de6d20ac043e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6f31-8edc8f67eeef
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a94a-a2c2dc96692f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4b59-9f450b9e21c6
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-8b97-e118a0690c6e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3d11-7e505b89c553
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-936e-54c11ed41984
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-dbfc-d21c73caaed2
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-59ac-87eb5158e757
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-c5a9-3f4674a43eb4
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-d8db-eac1478bcef1
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-22f8-9914cb6d5964
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-bf9d-b4f4ccab119e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a35e-b1cbee757431
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-793c-904180062096
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-d973-a8d75ec4ca19
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-640a-0bd90332fd6a
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-7655-d3b3f2ed10b6
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-568e-691ba27ae80c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4906-738b7c33257e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-85ba-5640db6b48c0
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e2a8-8dbf33fe45a5
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-5f56-3e8a0ba0053e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b9c9-e4d4f7f1eaad
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-2b72-216a4d9395a8
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a9b8-59cf0237f54a
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-446f-abcc24fced1f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-0774-6cfe9f7aea32
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e18c-ea3a2e1a0ecb
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ba1f-a0cfde10d24c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e504-568681aec2c2
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-80f7-b79f92030910
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-fb35-1f00dc083afb
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-11af-1ebd2436d1c2
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6a5a-daf5f2a0e0dc
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e90d-b05f1f42267c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3b42-83e62c6451fc
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3a60-eb6485512c0e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-61bc-bb800ebb823d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a188-9c6b93bd98c4
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6971-8d1998565b1f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-dfe7-8c686941b847
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-f0a8-90b580f397b2
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9dd3-cd908d77ee9b
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-c599-cd9c64f1a45a
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b11a-f89cea6cf124
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-1ac0-43fafe310321
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-d6dd-1a9bacb0870d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-f312-5f3e5b573906
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-46d0-58f6485c17da
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6b93-c011f51bc13f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-71cb-3f99aa0d8dbd
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-0d9c-c741ffa18266
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b90d-88f16df70427
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-7546-89afec1ef301
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-bba8-4545e8392ae7
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-512e-8c30fbf77842
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9237-68aec4e74c41
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-74a1-6b75112ec48b
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-caeb-2da4f983945d
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-a2c6-6fcfeffcbe4e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ac60-4bd895a03c47
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6e35-8ebc106704a3
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-1512-6dab31067e1a
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-2fca-79844d54f246
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-b92a-a13635ebca59
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-356d-6e66b5da4e63
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-8d24-c49d0d93738e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9c79-a2a4e157859c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-c54e-7678f06d1db3
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-6af4-7d12e639a2ea
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ba2f-b05732e983c5
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-0014-febde0ccb5ec
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-9299-a01548563403
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-ea98-46af5443becb
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-53a6-dc6f1d35b8be
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-cdcf-16c6e1fd9f0c
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-589f-7fb18c5c854f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-28b5-81601db50cb9
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-bc77-b7d68c40f89f
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e55a-d5d6e5c14c85
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-fe16-4be567e5a41e
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-3404-99b82da3600b
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-06b9-43907003ed43
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-70b5-1a6fafa95b51
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-7b98-339a6135d1e0
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-e2b3-6fed6c19ecc8
00020000-559e-84ca-83d9-1168c655374e	00030000-559e-84c9-4abc-1c13d33f79ad
\.


--
-- TOC entry 2885 (class 0 OID 9590806)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9590837)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9590950)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559e-84cb-155d-347d1b9282a5	00090000-559e-84ca-8dae-c6e83463de31	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559e-84cb-1368-c904fb815899	00090000-559e-84ca-d8d0-663684feff65	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559e-84cb-9bb1-7ff00b537738	00090000-559e-84ca-c1be-7284f1eaca84	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9590571)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559e-84ca-aae3-1c11c7f900cd	00040000-559e-84c9-be75-8accd5575265	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-8dba-78291ae71df2	00040000-559e-84c9-be75-8accd5575265	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559e-84ca-be05-bebc4d27a710	00040000-559e-84c9-be75-8accd5575265	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-11df-ad60559cb6c1	00040000-559e-84c9-be75-8accd5575265	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-79a1-dd73d65f8445	00040000-559e-84c9-be75-8accd5575265	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-9ed6-3df48b610226	00040000-559e-84c9-47c9-1e231312118a	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-6776-597009abedfb	00040000-559e-84c9-3cb0-41bbc0df1e8f	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-5389-ae35aaf7c74d	00040000-559e-84c9-96bb-7f057d594f6d	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559e-84ca-6418-5157a51b9591	00040000-559e-84c9-be75-8accd5575265	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9590606)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559e-84c9-7f1f-69eb5f5fbf10	8341	Adlešiči
00050000-559e-84c9-9f41-5b107f82ddaf	5270	Ajdovščina
00050000-559e-84c9-9856-a9ac921228db	6280	Ankaran/Ancarano
00050000-559e-84c9-848d-4a03cf8eb889	9253	Apače
00050000-559e-84c9-99ba-0ee25f395442	8253	Artiče
00050000-559e-84c9-f01c-4eff96976d74	4275	Begunje na Gorenjskem
00050000-559e-84c9-2e73-dee280fc793f	1382	Begunje pri Cerknici
00050000-559e-84c9-14c9-4e320cff98b5	9231	Beltinci
00050000-559e-84c9-04ac-f25c24218890	2234	Benedikt
00050000-559e-84c9-d5f4-92e0507deb61	2345	Bistrica ob Dravi
00050000-559e-84c9-7af4-70d9d488a2ff	3256	Bistrica ob Sotli
00050000-559e-84c9-0af7-e645aacce7c6	8259	Bizeljsko
00050000-559e-84c9-1a72-869aa6a32935	1223	Blagovica
00050000-559e-84c9-f8f0-a7d7e490ecfb	8283	Blanca
00050000-559e-84c9-6426-df487bc2ee11	4260	Bled
00050000-559e-84c9-48a7-2368fe4a49eb	4273	Blejska Dobrava
00050000-559e-84c9-82f6-388be820d92a	9265	Bodonci
00050000-559e-84c9-2311-94fd124f16e7	9222	Bogojina
00050000-559e-84c9-a6f0-3b30aa716958	4263	Bohinjska Bela
00050000-559e-84c9-fa0b-381b4e59be0e	4264	Bohinjska Bistrica
00050000-559e-84c9-609b-1cb5a0efc12f	4265	Bohinjsko jezero
00050000-559e-84c9-3ecf-cff01a3b680f	1353	Borovnica
00050000-559e-84c9-2add-2e295a0a15da	8294	Boštanj
00050000-559e-84c9-68ce-a56a1aff2e0c	5230	Bovec
00050000-559e-84c9-f88f-2b4e20b8c7d8	5295	Branik
00050000-559e-84c9-6b29-235ac5aeec1c	3314	Braslovče
00050000-559e-84c9-3bcd-5a6bfff82e80	5223	Breginj
00050000-559e-84c9-30ed-916cfdf75833	8280	Brestanica
00050000-559e-84c9-450c-bc9ee9b6a8dd	2354	Bresternica
00050000-559e-84c9-a2a5-e2e441cb3f91	4243	Brezje
00050000-559e-84c9-3bef-8babb81420bb	1351	Brezovica pri Ljubljani
00050000-559e-84c9-03f3-5e55ea3951ed	8250	Brežice
00050000-559e-84c9-64ca-8f177ab238b1	4210	Brnik - Aerodrom
00050000-559e-84c9-d150-05577daedc08	8321	Brusnice
00050000-559e-84c9-1674-6cf5125fce26	3255	Buče
00050000-559e-84c9-25d5-1c0dc63bb0b0	8276	Bučka 
00050000-559e-84c9-8781-c7b4f4db16b6	9261	Cankova
00050000-559e-84c9-be0d-388618dc5db4	3000	Celje 
00050000-559e-84c9-72f5-7e7625f851f0	3001	Celje - poštni predali
00050000-559e-84c9-4e0d-d2d94d5c0fc1	4207	Cerklje na Gorenjskem
00050000-559e-84c9-57c4-ba180fe37f92	8263	Cerklje ob Krki
00050000-559e-84c9-4d4a-db9c37f885dd	1380	Cerknica
00050000-559e-84c9-bec5-90478df1cbb4	5282	Cerkno
00050000-559e-84c9-6816-6dce621b6eb2	2236	Cerkvenjak
00050000-559e-84c9-3855-90722b29fb47	2215	Ceršak
00050000-559e-84c9-4c1d-43c8eb2fcd2b	2326	Cirkovce
00050000-559e-84c9-9bca-94733200551a	2282	Cirkulane
00050000-559e-84c9-79c0-e9490401b4bd	5273	Col
00050000-559e-84c9-2450-af88704685e7	8251	Čatež ob Savi
00050000-559e-84c9-4f61-d8ab2316f4cb	1413	Čemšenik
00050000-559e-84c9-4d69-387b4bf45975	5253	Čepovan
00050000-559e-84c9-674c-11eefc46c2e6	9232	Črenšovci
00050000-559e-84c9-f9ab-759c87cf7785	2393	Črna na Koroškem
00050000-559e-84c9-0338-2b572865f2e3	6275	Črni Kal
00050000-559e-84c9-cd80-40e69c52b12c	5274	Črni Vrh nad Idrijo
00050000-559e-84c9-1b4f-adc41732e9cc	5262	Črniče
00050000-559e-84c9-3269-4c90a497278a	8340	Črnomelj
00050000-559e-84c9-33ae-b13607cfcba2	6271	Dekani
00050000-559e-84c9-e58a-71c45addb001	5210	Deskle
00050000-559e-84c9-898a-1951f4a977c5	2253	Destrnik
00050000-559e-84c9-6fdb-05a76ecac801	6215	Divača
00050000-559e-84c9-e170-c6622526f8b7	1233	Dob
00050000-559e-84c9-861c-d84c456e4726	3224	Dobje pri Planini
00050000-559e-84c9-9aa7-b95cb985c68d	8257	Dobova
00050000-559e-84c9-37bb-cf68f6de4506	1423	Dobovec
00050000-559e-84c9-158c-00d75390add3	5263	Dobravlje
00050000-559e-84c9-1bd7-9d2a28beb54f	3204	Dobrna
00050000-559e-84c9-0b73-6c4bb3a810ea	8211	Dobrnič
00050000-559e-84c9-c96b-c9a07a1f2294	1356	Dobrova
00050000-559e-84c9-2e03-a829747d6ddf	9223	Dobrovnik/Dobronak 
00050000-559e-84c9-a2c7-486198d1abd7	5212	Dobrovo v Brdih
00050000-559e-84c9-3b06-9981d3f3a6d7	1431	Dol pri Hrastniku
00050000-559e-84c9-2cd1-fdf636267b5b	1262	Dol pri Ljubljani
00050000-559e-84c9-ce2e-0748430a6417	1273	Dole pri Litiji
00050000-559e-84c9-dc14-4cb0992b8bba	1331	Dolenja vas
00050000-559e-84c9-83fe-53cae3fea28d	8350	Dolenjske Toplice
00050000-559e-84c9-80b4-472aee6ab263	1230	Domžale
00050000-559e-84c9-2616-090e162b1b97	2252	Dornava
00050000-559e-84c9-85bb-8a704500856e	5294	Dornberk
00050000-559e-84c9-acdf-3649027fcb91	1319	Draga
00050000-559e-84c9-9015-d40c9b8a9f70	8343	Dragatuš
00050000-559e-84c9-e7d7-d2a548a76b6a	3222	Dramlje
00050000-559e-84c9-65ab-b647cc7b0b45	2370	Dravograd
00050000-559e-84c9-11bb-09133a502920	4203	Duplje
00050000-559e-84c9-a260-5e15b01f980a	6221	Dutovlje
00050000-559e-84c9-64ac-f81308ae9466	8361	Dvor
00050000-559e-84c9-374b-52789ea41176	2343	Fala
00050000-559e-84c9-8d62-e032b1adac12	9208	Fokovci
00050000-559e-84c9-ad1e-9e1e437285b8	2313	Fram
00050000-559e-84c9-7b46-350473da9bd0	3213	Frankolovo
00050000-559e-84c9-5c4b-f094ea147479	1274	Gabrovka
00050000-559e-84c9-5711-8e23987cfda3	8254	Globoko
00050000-559e-84c9-2653-2f7149d5ad5c	5275	Godovič
00050000-559e-84c9-02aa-e94baa6d8f32	4204	Golnik
00050000-559e-84c9-e246-21ec388337a8	3303	Gomilsko
00050000-559e-84c9-b65a-485db56f80e9	4224	Gorenja vas
00050000-559e-84c9-72c3-e77a7737c170	3263	Gorica pri Slivnici
00050000-559e-84c9-8b77-90df742336cb	2272	Gorišnica
00050000-559e-84c9-880c-6b19bd6d83e2	9250	Gornja Radgona
00050000-559e-84c9-70b8-18caf51a020a	3342	Gornji Grad
00050000-559e-84c9-dd20-039f8d86f09d	4282	Gozd Martuljek
00050000-559e-84c9-3519-4daa20f290e4	6272	Gračišče
00050000-559e-84c9-2df4-c4f2ef976c8b	9264	Grad
00050000-559e-84c9-679e-cdd94e479485	8332	Gradac
00050000-559e-84c9-dab6-6f066c771b47	1384	Grahovo
00050000-559e-84c9-9600-99ba969f564c	5242	Grahovo ob Bači
00050000-559e-84c9-8623-a268317d4da0	5251	Grgar
00050000-559e-84c9-dd77-46d2c1b977a9	3302	Griže
00050000-559e-84c9-9b15-db0d13aa8888	3231	Grobelno
00050000-559e-84c9-b728-f8a11b81ee9e	1290	Grosuplje
00050000-559e-84c9-b47a-19e54b2ba719	2288	Hajdina
00050000-559e-84c9-f5da-0737e1068d10	8362	Hinje
00050000-559e-84c9-d754-311a75f5f0e9	2311	Hoče
00050000-559e-84c9-9f0f-caf3345c4ff2	9205	Hodoš/Hodos
00050000-559e-84c9-c675-10a59538b810	1354	Horjul
00050000-559e-84c9-6d5f-62f762cd3970	1372	Hotedršica
00050000-559e-84c9-2165-b1d99885524d	1430	Hrastnik
00050000-559e-84c9-716a-876b2c65f816	6225	Hruševje
00050000-559e-84c9-07ea-67b92f930373	4276	Hrušica
00050000-559e-84c9-cbd5-7059b56593d3	5280	Idrija
00050000-559e-84c9-84c2-f2e51e05e6fb	1292	Ig
00050000-559e-84c9-c78a-6dc0d3eabae7	6250	Ilirska Bistrica
00050000-559e-84c9-2011-77f57228e780	6251	Ilirska Bistrica-Trnovo
00050000-559e-84c9-ed54-a59a1d84d200	1295	Ivančna Gorica
00050000-559e-84c9-9d2a-f1c73931a75b	2259	Ivanjkovci
00050000-559e-84c9-7b8c-703aeafbc4ee	1411	Izlake
00050000-559e-84c9-cef3-25800964e22c	6310	Izola/Isola
00050000-559e-84c9-8c90-eb16ba907aee	2222	Jakobski Dol
00050000-559e-84c9-e2eb-97046c55e952	2221	Jarenina
00050000-559e-84c9-1aac-8eb2551fba50	6254	Jelšane
00050000-559e-84c9-7734-9b50503e59a6	4270	Jesenice
00050000-559e-84c9-78e3-d434d91126fb	8261	Jesenice na Dolenjskem
00050000-559e-84c9-a617-a29cde9afbaf	3273	Jurklošter
00050000-559e-84c9-9bc3-890712e1acbc	2223	Jurovski Dol
00050000-559e-84c9-8233-b2267c5b8799	2256	Juršinci
00050000-559e-84c9-afad-006c41e61750	5214	Kal nad Kanalom
00050000-559e-84c9-a0b2-64e8522e91b0	3233	Kalobje
00050000-559e-84c9-7f42-47f742f401a4	4246	Kamna Gorica
00050000-559e-84c9-0a5e-873cbc0da384	2351	Kamnica
00050000-559e-84c9-ac4f-3c0ab814a8a9	1241	Kamnik
00050000-559e-84c9-31ff-1bc13932b671	5213	Kanal
00050000-559e-84c9-da37-dab16aeb148b	8258	Kapele
00050000-559e-84c9-d612-2c47424ef160	2362	Kapla
00050000-559e-84c9-5bc2-9277d165268f	2325	Kidričevo
00050000-559e-84c9-930c-75888bd7852c	1412	Kisovec
00050000-559e-84c9-1e5c-d27bad360015	6253	Knežak
00050000-559e-84c9-4c0a-03aa800c67d9	5222	Kobarid
00050000-559e-84c9-8910-e11e97e57295	9227	Kobilje
00050000-559e-84c9-75af-967d2177ee0f	1330	Kočevje
00050000-559e-84c9-68a8-4a00f3e68d6e	1338	Kočevska Reka
00050000-559e-84c9-2b49-bc516ab5be16	2276	Kog
00050000-559e-84c9-728c-b0c3efc6238d	5211	Kojsko
00050000-559e-84c9-d726-c4247d7670c9	6223	Komen
00050000-559e-84c9-5658-185598ec9e9c	1218	Komenda
00050000-559e-84c9-befa-07feb398635f	6000	Koper/Capodistria 
00050000-559e-84c9-5f42-db6c90fac664	6001	Koper/Capodistria - poštni predali
00050000-559e-84c9-4f92-d7f16ca68c98	8282	Koprivnica
00050000-559e-84c9-77d2-abc797987c1c	5296	Kostanjevica na Krasu
00050000-559e-84c9-803d-429241f3f1f8	8311	Kostanjevica na Krki
00050000-559e-84c9-538a-03372b9ca754	1336	Kostel
00050000-559e-84c9-ea85-dab5427f7d26	6256	Košana
00050000-559e-84c9-7474-2a487f53a6a3	2394	Kotlje
00050000-559e-84c9-bc92-fd89b4b8302f	6240	Kozina
00050000-559e-84c9-1011-9183ce97b245	3260	Kozje
00050000-559e-84c9-01cf-5201d957e8ce	4000	Kranj 
00050000-559e-84c9-f190-ad8656987c21	4001	Kranj - poštni predali
00050000-559e-84c9-9d04-04232441fa44	4280	Kranjska Gora
00050000-559e-84c9-cf7d-647a3bb2f3c6	1281	Kresnice
00050000-559e-84c9-3a8a-a54b386ff66c	4294	Križe
00050000-559e-84c9-24ca-49d62194f6f3	9206	Križevci
00050000-559e-84c9-f6d2-14e715c2a65a	9242	Križevci pri Ljutomeru
00050000-559e-84c9-59d4-2f68c44929d3	1301	Krka
00050000-559e-84c9-d388-fb0d2e745498	8296	Krmelj
00050000-559e-84c9-bbb7-a5b04c1c33ff	4245	Kropa
00050000-559e-84c9-fea4-b69229169514	8262	Krška vas
00050000-559e-84c9-bece-c311dfccd966	8270	Krško
00050000-559e-84c9-ffb1-092ce05a65e5	9263	Kuzma
00050000-559e-84c9-dad6-5336282ba10b	2318	Laporje
00050000-559e-84c9-2fb9-0a13e29c1ee9	3270	Laško
00050000-559e-84c9-0203-e45207351cd1	1219	Laze v Tuhinju
00050000-559e-84c9-4ea0-a9db2933db3c	2230	Lenart v Slovenskih goricah
00050000-559e-84c9-9a41-41ffd914ccb5	9220	Lendava/Lendva
00050000-559e-84c9-fcd5-9ea651279435	4248	Lesce
00050000-559e-84c9-2173-4353c35d04c1	3261	Lesično
00050000-559e-84c9-ce17-4c44d452c86c	8273	Leskovec pri Krškem
00050000-559e-84c9-9186-a98052440397	2372	Libeliče
00050000-559e-84c9-8a6e-5e1860ae5e77	2341	Limbuš
00050000-559e-84c9-d0ad-d392300d5439	1270	Litija
00050000-559e-84c9-01fa-a2427f7fb3da	3202	Ljubečna
00050000-559e-84c9-3d6e-c38fdc7a77a6	1000	Ljubljana 
00050000-559e-84c9-12f5-1508523498b0	1001	Ljubljana - poštni predali
00050000-559e-84c9-3a95-b4b736b87366	1231	Ljubljana - Črnuče
00050000-559e-84c9-d353-0e4744ad5962	1261	Ljubljana - Dobrunje
00050000-559e-84c9-1927-4bfd0ae4d867	1260	Ljubljana - Polje
00050000-559e-84c9-64c7-5f27808a24a0	1210	Ljubljana - Šentvid
00050000-559e-84c9-d810-515ea6521071	1211	Ljubljana - Šmartno
00050000-559e-84c9-41a5-2ace9983b66e	3333	Ljubno ob Savinji
00050000-559e-84c9-eefc-8d0475951fb6	9240	Ljutomer
00050000-559e-84c9-6487-46c576ae3401	3215	Loče
00050000-559e-84c9-61f6-75d46dd24330	5231	Log pod Mangartom
00050000-559e-84c9-56cc-0335864c3330	1358	Log pri Brezovici
00050000-559e-84c9-54e2-9dc83c08f7b0	1370	Logatec
00050000-559e-84c9-f822-7cd08037f248	1371	Logatec
00050000-559e-84c9-f31a-e57a8371c44c	1434	Loka pri Zidanem Mostu
00050000-559e-84c9-99c7-fae3d2c2a4c4	3223	Loka pri Žusmu
00050000-559e-84c9-ceb4-aee8af8852ed	6219	Lokev
00050000-559e-84c9-a9da-10829a76f2fa	1318	Loški Potok
00050000-559e-84c9-8db5-10576c3f79be	2324	Lovrenc na Dravskem polju
00050000-559e-84c9-443f-9239a055473b	2344	Lovrenc na Pohorju
00050000-559e-84c9-7ee4-8e87a02c97e8	3334	Luče
00050000-559e-84c9-c0fd-4111d77a6ca6	1225	Lukovica
00050000-559e-84c9-afd1-726daebd8e01	9202	Mačkovci
00050000-559e-84c9-ec61-602b4ab44647	2322	Majšperk
00050000-559e-84c9-faf0-9672ba13071c	2321	Makole
00050000-559e-84c9-d80d-6c303ca9d81b	9243	Mala Nedelja
00050000-559e-84c9-abae-2565bd60df89	2229	Malečnik
00050000-559e-84c9-a588-7cb428ddbb9a	6273	Marezige
00050000-559e-84c9-29b0-37093cfa3a97	2000	Maribor 
00050000-559e-84c9-5fa0-80c36181798b	2001	Maribor - poštni predali
00050000-559e-84c9-e5a3-1e04b7c0c7af	2206	Marjeta na Dravskem polju
00050000-559e-84c9-e5f9-9dcddc6ad0b1	2281	Markovci
00050000-559e-84c9-0f79-6cda791d187a	9221	Martjanci
00050000-559e-84c9-2c9f-8798a0370912	6242	Materija
00050000-559e-84c9-0c12-b0f69bf6958e	4211	Mavčiče
00050000-559e-84c9-257d-efa271068ea1	1215	Medvode
00050000-559e-84c9-9fb5-7f60f0998060	1234	Mengeš
00050000-559e-84c9-5bb2-c6942a0029cb	8330	Metlika
00050000-559e-84c9-c27a-dbeab1811553	2392	Mežica
00050000-559e-84c9-2cb8-a16347181e95	2204	Miklavž na Dravskem polju
00050000-559e-84c9-1dda-f2c49d01b092	2275	Miklavž pri Ormožu
00050000-559e-84c9-92bd-fd50e3466491	5291	Miren
00050000-559e-84c9-b039-ab571637851a	8233	Mirna
00050000-559e-84c9-1b77-45ec3a92eca9	8216	Mirna Peč
00050000-559e-84c9-5c05-c093f7d03c91	2382	Mislinja
00050000-559e-84c9-985f-289ef23e11e5	4281	Mojstrana
00050000-559e-84c9-62ce-2fbd41ac9aed	8230	Mokronog
00050000-559e-84c9-5f62-ff72ecacafbf	1251	Moravče
00050000-559e-84c9-b902-f9482ebfdfe8	9226	Moravske Toplice
00050000-559e-84c9-6ddd-7d86085f1010	5216	Most na Soči
00050000-559e-84c9-ffd3-844c21f1dad3	1221	Motnik
00050000-559e-84c9-555b-00caf8793f1f	3330	Mozirje
00050000-559e-84c9-1b86-183b5b08bc50	9000	Murska Sobota 
00050000-559e-84c9-2c95-fd5f090ee529	9001	Murska Sobota - poštni predali
00050000-559e-84c9-e1f1-0b67273ab5e3	2366	Muta
00050000-559e-84c9-ac7f-2e7635058140	4202	Naklo
00050000-559e-84c9-8da9-d44e3eae0acf	3331	Nazarje
00050000-559e-84c9-5f80-5ee1e21dfb22	1357	Notranje Gorice
00050000-559e-84c9-86db-dedfa7494168	3203	Nova Cerkev
00050000-559e-84c9-542f-b6aba75e5d78	5000	Nova Gorica 
00050000-559e-84c9-904a-63595b3d2c78	5001	Nova Gorica - poštni predali
00050000-559e-84c9-fe46-890a7d701c36	1385	Nova vas
00050000-559e-84c9-c02d-2006f5ad9ace	8000	Novo mesto
00050000-559e-84c9-2c5e-18b24cbacd63	8001	Novo mesto - poštni predali
00050000-559e-84c9-4e6e-7d44d87f6413	6243	Obrov
00050000-559e-84c9-c7df-c487282e5e1b	9233	Odranci
00050000-559e-84c9-7521-55b338cb04f8	2317	Oplotnica
00050000-559e-84c9-1b8b-f47d25f33f9c	2312	Orehova vas
00050000-559e-84c9-9622-fc5f8e6bee6d	2270	Ormož
00050000-559e-84c9-0f71-5420b304f0ea	1316	Ortnek
00050000-559e-84c9-2923-9fec0ddb7630	1337	Osilnica
00050000-559e-84c9-3d29-ebd1f37964fa	8222	Otočec
00050000-559e-84c9-bb3e-fd35abee50d2	2361	Ožbalt
00050000-559e-84c9-4457-2e0c03bf81c7	2231	Pernica
00050000-559e-84c9-f6b3-e2ced46fd058	2211	Pesnica pri Mariboru
00050000-559e-84c9-c936-213c1b2af90b	9203	Petrovci
00050000-559e-84c9-2ab7-712ba0facc4a	3301	Petrovče
00050000-559e-84c9-03b8-1b7b1960cd51	6330	Piran/Pirano
00050000-559e-84c9-4479-975901859bf4	8255	Pišece
00050000-559e-84c9-ddf2-f3fb55b8268a	6257	Pivka
00050000-559e-84c9-e0cc-04af82b716e0	6232	Planina
00050000-559e-84c9-2839-b537266de527	3225	Planina pri Sevnici
00050000-559e-84c9-3221-b3c8741b2785	6276	Pobegi
00050000-559e-84c9-d462-ed3099b72c7a	8312	Podbočje
00050000-559e-84c9-edd6-3f531a99108c	5243	Podbrdo
00050000-559e-84c9-86bf-c6a733f7b212	3254	Podčetrtek
00050000-559e-84c9-e9da-61f319fe798f	2273	Podgorci
00050000-559e-84c9-4dd1-10e35736c070	6216	Podgorje
00050000-559e-84c9-1101-4db339acbd7e	2381	Podgorje pri Slovenj Gradcu
00050000-559e-84c9-63eb-fc8e83c0f34d	6244	Podgrad
00050000-559e-84c9-580f-a9f185a08917	1414	Podkum
00050000-559e-84c9-c4f4-8f8d0a61073c	2286	Podlehnik
00050000-559e-84c9-0796-e41d64609a1a	5272	Podnanos
00050000-559e-84c9-a462-0517ee10d7cf	4244	Podnart
00050000-559e-84c9-60e3-fa73f06a47e4	3241	Podplat
00050000-559e-84c9-e4d6-dc0e20d446ad	3257	Podsreda
00050000-559e-84c9-05b6-c22ffa8bac5f	2363	Podvelka
00050000-559e-84c9-9c69-706df429fee8	2208	Pohorje
00050000-559e-84c9-908b-64413e7a1e8a	2257	Polenšak
00050000-559e-84c9-464a-4ac6173e851c	1355	Polhov Gradec
00050000-559e-84c9-c61c-cdb1702d2e31	4223	Poljane nad Škofjo Loko
00050000-559e-84c9-8d47-1f932d3cf69b	2319	Poljčane
00050000-559e-84c9-5125-f2b9a1708f2c	1272	Polšnik
00050000-559e-84c9-421b-41bf30e4e9b5	3313	Polzela
00050000-559e-84c9-0d64-5330efb5f396	3232	Ponikva
00050000-559e-84c9-5954-840481471d2f	6320	Portorož/Portorose
00050000-559e-84c9-2b5e-aa437de5dde6	6230	Postojna
00050000-559e-84c9-760e-ed1c49439920	2331	Pragersko
00050000-559e-84c9-b96f-11cd8f769e26	3312	Prebold
00050000-559e-84c9-300b-8e3f47bc4f3e	4205	Preddvor
00050000-559e-84c9-e769-91e4a2db7d05	6255	Prem
00050000-559e-84c9-ccec-6c78c8f3d884	1352	Preserje
00050000-559e-84c9-e307-3f48895a9bf2	6258	Prestranek
00050000-559e-84c9-4a9a-55d75611c508	2391	Prevalje
00050000-559e-84c9-8209-30302cd58ffb	3262	Prevorje
00050000-559e-84c9-b268-8298355ddb50	1276	Primskovo 
00050000-559e-84c9-44b4-ab488e42b647	3253	Pristava pri Mestinju
00050000-559e-84c9-f9d4-e7e74a37b23e	9207	Prosenjakovci/Partosfalva
00050000-559e-84c9-e953-df63adf9f46c	5297	Prvačina
00050000-559e-84c9-bc89-0a2b469c1468	2250	Ptuj
00050000-559e-84c9-5e13-34722c9cc166	2323	Ptujska Gora
00050000-559e-84c9-f130-d89d2d9294ba	9201	Puconci
00050000-559e-84c9-77ea-2084f1f79d22	2327	Rače
00050000-559e-84c9-7899-3eef7214ee43	1433	Radeče
00050000-559e-84c9-7eeb-423e458f4787	9252	Radenci
00050000-559e-84c9-4ef9-c1eb436f3b4b	2360	Radlje ob Dravi
00050000-559e-84c9-24f1-b36cf9cbf0c6	1235	Radomlje
00050000-559e-84c9-8a63-256fe48c4fc8	4240	Radovljica
00050000-559e-84c9-2da9-7698b000e158	8274	Raka
00050000-559e-84c9-4e56-5a28ed1bdfa4	1381	Rakek
00050000-559e-84c9-3cad-b3a239d7bce3	4283	Rateče - Planica
00050000-559e-84c9-4d4d-0f6196801f8a	2390	Ravne na Koroškem
00050000-559e-84c9-c89a-63f044ed58f9	9246	Razkrižje
00050000-559e-84c9-12de-9b7f29e9538f	3332	Rečica ob Savinji
00050000-559e-84c9-cd65-8ce915fb6acf	5292	Renče
00050000-559e-84c9-41a7-b721b1f7ddae	1310	Ribnica
00050000-559e-84c9-3157-a9781cf6c8ba	2364	Ribnica na Pohorju
00050000-559e-84c9-869b-1b4edfbee164	3272	Rimske Toplice
00050000-559e-84c9-b298-5e8b91b7dcc7	1314	Rob
00050000-559e-84c9-189a-baf882ad406a	5215	Ročinj
00050000-559e-84c9-49a1-66d9cd6f8717	3250	Rogaška Slatina
00050000-559e-84c9-bba0-18e111bc5f69	9262	Rogašovci
00050000-559e-84c9-e444-43df8c56154b	3252	Rogatec
00050000-559e-84c9-ba67-4039305fe131	1373	Rovte
00050000-559e-84c9-4836-0ca1620c3bb8	2342	Ruše
00050000-559e-84c9-d11d-b213b05f55b0	1282	Sava
00050000-559e-84c9-889f-0710e4d14a79	6333	Sečovlje/Sicciole
00050000-559e-84c9-6aff-15a4d6d01c1e	4227	Selca
00050000-559e-84c9-2896-eac1eadafd63	2352	Selnica ob Dravi
00050000-559e-84c9-6eaf-7bdd6b260863	8333	Semič
00050000-559e-84c9-7eb2-548c910a80c9	8281	Senovo
00050000-559e-84c9-cb77-bb77a50f51ef	6224	Senožeče
00050000-559e-84c9-112d-2bb987bc1f3b	8290	Sevnica
00050000-559e-84c9-f247-080f25650a15	6210	Sežana
00050000-559e-84c9-9701-7b00820b7127	2214	Sladki Vrh
00050000-559e-84c9-1da6-0d15551752a0	5283	Slap ob Idrijci
00050000-559e-84c9-d727-1c49b9147cc0	2380	Slovenj Gradec
00050000-559e-84c9-8978-63b487810670	2310	Slovenska Bistrica
00050000-559e-84c9-c650-de482b5b7a97	3210	Slovenske Konjice
00050000-559e-84c9-58d7-118e545de677	1216	Smlednik
00050000-559e-84c9-e64b-18aa2623e2ff	5232	Soča
00050000-559e-84c9-6a9f-24e3eaaa03f2	1317	Sodražica
00050000-559e-84c9-883a-a9a28fb8ddff	3335	Solčava
00050000-559e-84c9-cb9b-13e9f7e4c666	5250	Solkan
00050000-559e-84c9-8cb0-db998688b7c6	4229	Sorica
00050000-559e-84c9-5a1d-c0aab34d4436	4225	Sovodenj
00050000-559e-84c9-8026-6f4c18208918	5281	Spodnja Idrija
00050000-559e-84c9-9660-7395c25c3616	2241	Spodnji Duplek
00050000-559e-84c9-f32a-d48f96aa4bb0	9245	Spodnji Ivanjci
00050000-559e-84c9-7c08-f3ae8f5a1b22	2277	Središče ob Dravi
00050000-559e-84c9-82bd-24e0091bca71	4267	Srednja vas v Bohinju
00050000-559e-84c9-0d9e-a1175dc08b3c	8256	Sromlje 
00050000-559e-84c9-c05a-58034991cfa8	5224	Srpenica
00050000-559e-84c9-e432-772934707f85	1242	Stahovica
00050000-559e-84c9-4a22-3ab195212e78	1332	Stara Cerkev
00050000-559e-84c9-e6c0-61da0e3132df	8342	Stari trg ob Kolpi
00050000-559e-84c9-a9ec-493c491ebcbe	1386	Stari trg pri Ložu
00050000-559e-84c9-fefe-8bb9f0196950	2205	Starše
00050000-559e-84c9-9c7b-f1c992a7e2e5	2289	Stoperce
00050000-559e-84c9-25cf-a8eec1904f12	8322	Stopiče
00050000-559e-84c9-5738-74d938f36685	3206	Stranice
00050000-559e-84c9-b864-70769649370c	8351	Straža
00050000-559e-84c9-4bfc-b702f7d6108d	1313	Struge
00050000-559e-84c9-d19d-3cb7b603bf2d	8293	Studenec
00050000-559e-84c9-9b2f-f389257efade	8331	Suhor
00050000-559e-84c9-6d2a-b19e9f7034f8	2233	Sv. Ana v Slovenskih goricah
00050000-559e-84c9-5080-7f24dd911a49	2235	Sv. Trojica v Slovenskih goricah
00050000-559e-84c9-75a2-bd5b9d4256c1	2353	Sveti Duh na Ostrem Vrhu
00050000-559e-84c9-8950-7fd9ad5f1faf	9244	Sveti Jurij ob Ščavnici
00050000-559e-84c9-5005-b4e18b5a65ff	3264	Sveti Štefan
00050000-559e-84c9-944b-9fc422b046e8	2258	Sveti Tomaž
00050000-559e-84c9-e46c-ddec67a3edde	9204	Šalovci
00050000-559e-84c9-0ac4-fac5fbcc2276	5261	Šempas
00050000-559e-84c9-511f-c21e34d1a93e	5290	Šempeter pri Gorici
00050000-559e-84c9-80d8-d5b0827964e3	3311	Šempeter v Savinjski dolini
00050000-559e-84c9-7f4e-d09985c6dcf6	4208	Šenčur
00050000-559e-84c9-93fc-eecdbc9709d9	2212	Šentilj v Slovenskih goricah
00050000-559e-84c9-e9fd-a3c16bf152c1	8297	Šentjanž
00050000-559e-84c9-059e-875957b69344	2373	Šentjanž pri Dravogradu
00050000-559e-84c9-85cb-3913ca4bf27e	8310	Šentjernej
00050000-559e-84c9-71a1-fa0b0e793aba	3230	Šentjur
00050000-559e-84c9-9b00-eb6acaa3267e	3271	Šentrupert
00050000-559e-84c9-025d-80c58042a013	8232	Šentrupert
00050000-559e-84c9-d951-41e4f601ed9d	1296	Šentvid pri Stični
00050000-559e-84c9-8b51-ba06f8566a13	8275	Škocjan
00050000-559e-84c9-7ec7-6b4a8f2c2713	6281	Škofije
00050000-559e-84c9-62b7-5f64de4ee01e	4220	Škofja Loka
00050000-559e-84c9-7ee0-54eb36df8ce7	3211	Škofja vas
00050000-559e-84c9-5d90-ddf3358dc2fa	1291	Škofljica
00050000-559e-84c9-ff8c-f621f1146e63	6274	Šmarje
00050000-559e-84c9-b324-263a7916118d	1293	Šmarje - Sap
00050000-559e-84c9-d815-a7b184f4afef	3240	Šmarje pri Jelšah
00050000-559e-84c9-41dc-69e8c0a78912	8220	Šmarješke Toplice
00050000-559e-84c9-4bdc-174ad432685a	2315	Šmartno na Pohorju
00050000-559e-84c9-4f77-e7365d1c405f	3341	Šmartno ob Dreti
00050000-559e-84c9-499d-785386448224	3327	Šmartno ob Paki
00050000-559e-84c9-6568-8fa9b34a44aa	1275	Šmartno pri Litiji
00050000-559e-84c9-fd60-f239fd9810b4	2383	Šmartno pri Slovenj Gradcu
00050000-559e-84c9-5eee-a5d4ba6006de	3201	Šmartno v Rožni dolini
00050000-559e-84c9-d8ac-590c06a2fd6f	3325	Šoštanj
00050000-559e-84c9-db98-c70116423e00	6222	Štanjel
00050000-559e-84c9-858a-69e75f586342	3220	Štore
00050000-559e-84c9-f0f3-c53054c6ac90	3304	Tabor
00050000-559e-84c9-298a-68e5b5b36060	3221	Teharje
00050000-559e-84c9-3a93-d944a464af34	9251	Tišina
00050000-559e-84c9-0f27-3125abc665f0	5220	Tolmin
00050000-559e-84c9-9089-ee92e40c18fb	3326	Topolšica
00050000-559e-84c9-21ac-fc1da068161f	2371	Trbonje
00050000-559e-84c9-87ad-614c54471e7e	1420	Trbovlje
00050000-559e-84c9-993f-3a99b615d438	8231	Trebelno 
00050000-559e-84c9-6512-e75e6ef3b876	8210	Trebnje
00050000-559e-84c9-6707-3c296a237a75	5252	Trnovo pri Gorici
00050000-559e-84c9-2423-58804db25d27	2254	Trnovska vas
00050000-559e-84c9-ae2d-609ef9c51d07	1222	Trojane
00050000-559e-84c9-7038-56c37f2a4aa3	1236	Trzin
00050000-559e-84c9-bd67-3148c95647e6	4290	Tržič
00050000-559e-84c9-65a4-086cd12d1882	8295	Tržišče
00050000-559e-84c9-ab4f-983d768c4ad3	1311	Turjak
00050000-559e-84c9-c861-ad69a4dfe3d3	9224	Turnišče
00050000-559e-84c9-a973-e94b570afb1a	8323	Uršna sela
00050000-559e-84c9-43e7-a61dffa158a6	1252	Vače
00050000-559e-84c9-10b9-83b3c77e297d	3320	Velenje 
00050000-559e-84c9-a5ff-ea6524e6ebdf	3322	Velenje - poštni predali
00050000-559e-84c9-6e53-7b5cf41e8b6f	8212	Velika Loka
00050000-559e-84c9-d85e-a306f283b64b	2274	Velika Nedelja
00050000-559e-84c9-4d62-8c55077894c0	9225	Velika Polana
00050000-559e-84c9-f401-beda57dab7bb	1315	Velike Lašče
00050000-559e-84c9-dd50-a631d24beafc	8213	Veliki Gaber
00050000-559e-84c9-da19-0828db5ac4d6	9241	Veržej
00050000-559e-84c9-da82-d0a5c9219e68	1312	Videm - Dobrepolje
00050000-559e-84c9-8a84-41f1e42493bb	2284	Videm pri Ptuju
00050000-559e-84c9-d3d4-5078f25cc053	8344	Vinica
00050000-559e-84c9-5aa0-bbf146145bdb	5271	Vipava
00050000-559e-84c9-4ab6-72ef2877c59f	4212	Visoko
00050000-559e-84c9-d861-6b510af214a6	1294	Višnja Gora
00050000-559e-84c9-51ff-0f91dc50f92d	3205	Vitanje
00050000-559e-84c9-a024-b8646961ef3a	2255	Vitomarci
00050000-559e-84c9-58bc-daabc35f835a	1217	Vodice
00050000-559e-84c9-250a-318715839f3d	3212	Vojnik\t
00050000-559e-84c9-81bb-2134a617f9c5	5293	Volčja Draga
00050000-559e-84c9-b5fd-0e9c8af02ada	2232	Voličina
00050000-559e-84c9-2a9e-4f2686140246	3305	Vransko
00050000-559e-84c9-8d6b-e9188e1a0fbc	6217	Vremski Britof
00050000-559e-84c9-1cb0-cbd2da76e95d	1360	Vrhnika
00050000-559e-84c9-0909-9e3d7a5e0074	2365	Vuhred
00050000-559e-84c9-a562-a03cad9d2e9c	2367	Vuzenica
00050000-559e-84c9-ef6c-373f2481540a	8292	Zabukovje 
00050000-559e-84c9-6fb4-8affbbff2652	1410	Zagorje ob Savi
00050000-559e-84c9-121f-7383f3574977	1303	Zagradec
00050000-559e-84c9-ae6b-8fc45765f5af	2283	Zavrč
00050000-559e-84c9-ad14-9d3c419bac6a	8272	Zdole 
00050000-559e-84c9-4f82-250a6813b59f	4201	Zgornja Besnica
00050000-559e-84c9-3292-f0ca36d5cf64	2242	Zgornja Korena
00050000-559e-84c9-764a-b40cd5d564cf	2201	Zgornja Kungota
00050000-559e-84c9-359a-aadfc503f408	2316	Zgornja Ložnica
00050000-559e-84c9-c069-bcd9b7adcdc1	2314	Zgornja Polskava
00050000-559e-84c9-062a-c0a4a73e508e	2213	Zgornja Velka
00050000-559e-84c9-be86-6774789b4b95	4247	Zgornje Gorje
00050000-559e-84c9-1fbf-034b7fb68566	4206	Zgornje Jezersko
00050000-559e-84c9-8fcb-b92f3d4ea482	2285	Zgornji Leskovec
00050000-559e-84c9-9ba8-2f4bd488c2bd	1432	Zidani Most
00050000-559e-84c9-c4b6-d56202c79283	3214	Zreče
00050000-559e-84c9-6bc6-26b88162904c	4209	Žabnica
00050000-559e-84c9-f56b-53ccb9fc257c	3310	Žalec
00050000-559e-84c9-588c-7d658d2fb30f	4228	Železniki
00050000-559e-84c9-e045-0ae91a2cf01c	2287	Žetale
00050000-559e-84c9-074c-8bb58be7334a	4226	Žiri
00050000-559e-84c9-0fa8-1e149ff3f674	4274	Žirovnica
00050000-559e-84c9-a10c-f45e5eba239c	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9590780)
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
-- TOC entry 2863 (class 0 OID 9590591)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9590669)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9590792)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9591099)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9591110)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559e-84ca-139d-6099f6aef713	00080000-559e-84ca-6418-5157a51b9591	0900	AK
00190000-559e-84cb-2206-17a175f6571a	00080000-559e-84ca-be05-bebc4d27a710	0987	A
00190000-559e-84cb-d882-2df508bede05	00080000-559e-84ca-8dba-78291ae71df2	0989	A
00190000-559e-84cb-1271-9cca8c3a135c	00080000-559e-84ca-11df-ad60559cb6c1	0986	A
00190000-559e-84cb-6bb8-7b09af96539c	00080000-559e-84ca-9ed6-3df48b610226	0984	A
00190000-559e-84cb-6d73-5b468a9217f0	00080000-559e-84ca-6776-597009abedfb	0983	A
00190000-559e-84cb-6e17-9f3739a3a401	00080000-559e-84ca-5389-ae35aaf7c74d	0982	A
\.


--
-- TOC entry 2905 (class 0 OID 9591080)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559e-84cb-daa2-d6b96898906e	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2887 (class 0 OID 9590821)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559e-84ca-433c-c23ef9e36695	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559e-84ca-f5c4-db02e0658dfa	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559e-84ca-c496-4cd7ea801378	0003	Kazinska	t	84	Kazinska dvorana
00220000-559e-84ca-330a-938e8ae5ca3c	0004	Mali oder	t	24	Mali oder 
00220000-559e-84ca-bc02-47e2be64532d	0005	Komorni oder	t	15	Komorni oder
00220000-559e-84ca-fc5a-3b3f2f297995	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559e-84ca-5620-f2e305e74835	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9590765)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9590755)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9590939)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9590889)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9590463)
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
-- TOC entry 2888 (class 0 OID 9590831)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9590501)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559e-84c9-ae31-17f6431b1c88	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559e-84c9-1018-5173ce7c278c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559e-84c9-5c27-2b365362d747	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559e-84c9-c3dd-8185f825f20e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559e-84c9-32aa-ffe7dbb98418	planer	Planer dogodkov v koledarju	t
00020000-559e-84c9-c6b5-fd2900fb2131	kadrovska	Kadrovska služba	t
00020000-559e-84c9-a319-a40e48d7d7bb	arhivar	Ažuriranje arhivalij	t
00020000-559e-84c9-a74a-4b075ce9fa05	igralec	Igralec	t
00020000-559e-84c9-f89a-017557a47ca1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559e-84ca-83d9-1168c655374e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9590485)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559e-84c9-d9d3-d1c794c14702	00020000-559e-84c9-5c27-2b365362d747
00010000-559e-84c9-cc29-0840302531b5	00020000-559e-84c9-5c27-2b365362d747
00010000-559e-84ca-8edf-df9dc103976c	00020000-559e-84ca-83d9-1168c655374e
\.


--
-- TOC entry 2890 (class 0 OID 9590845)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9590786)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9590736)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9591149)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559e-84c9-2072-2c960c6aec0a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559e-84c9-7dab-4076dee658cb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559e-84c9-a60f-4f0a8d4ce605	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559e-84c9-a278-50f9cf658278	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559e-84c9-96b9-901908238d5e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9591141)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559e-84c9-6fd3-d86fb2188182	00230000-559e-84c9-a278-50f9cf658278	popa
00240000-559e-84c9-9f8d-bf34ad22c418	00230000-559e-84c9-a278-50f9cf658278	oseba
00240000-559e-84c9-cac7-da252ef5d5df	00230000-559e-84c9-7dab-4076dee658cb	prostor
00240000-559e-84c9-8a45-a4fb3e96efb9	00230000-559e-84c9-a278-50f9cf658278	besedilo
00240000-559e-84c9-a718-f70b7eb2edc6	00230000-559e-84c9-a278-50f9cf658278	uprizoritev
00240000-559e-84c9-f515-eb94a6264a8f	00230000-559e-84c9-a278-50f9cf658278	funkcija
00240000-559e-84c9-b175-b60f959bea79	00230000-559e-84c9-a278-50f9cf658278	tipfunkcije
00240000-559e-84c9-8186-16808b11b611	00230000-559e-84c9-a278-50f9cf658278	alternacija
00240000-559e-84c9-14ab-9b2fe817ce21	00230000-559e-84c9-2072-2c960c6aec0a	pogodba
00240000-559e-84c9-1e26-4352b6effe40	00230000-559e-84c9-a278-50f9cf658278	zaposlitev
00240000-559e-84c9-5c63-7af692b68659	00230000-559e-84c9-2072-2c960c6aec0a	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9591136)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9590899)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559e-84cb-b24f-5d96b2d295c2	000e0000-559e-84cb-6284-e4f252bdcb37	00080000-559e-84ca-aae3-1c11c7f900cd	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559e-84cb-14b9-d09f512c1034	000e0000-559e-84cb-6284-e4f252bdcb37	00080000-559e-84ca-aae3-1c11c7f900cd	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559e-84cb-bb76-12b39e0cb3f7	000e0000-559e-84cb-6284-e4f252bdcb37	00080000-559e-84ca-79a1-dd73d65f8445	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9590563)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9590742)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559e-84cb-a6c5-50b1ec4c8604	00180000-559e-84cb-4686-d453e5b10479	000c0000-559e-84cb-b72b-4c20d4141e0d	00090000-559e-84ca-b455-ec8286b8c40e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559e-84cb-cd6d-41180520a456	00180000-559e-84cb-4686-d453e5b10479	000c0000-559e-84cb-46a9-252c2813a777	00090000-559e-84ca-3152-f7c65e9f1ca8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559e-84cb-e525-79faacbe5fa2	00180000-559e-84cb-4686-d453e5b10479	000c0000-559e-84cb-8c7c-00579853ca9a	00090000-559e-84ca-df31-064bbe042a28	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559e-84cb-dac2-8c7710f013be	00180000-559e-84cb-4686-d453e5b10479	000c0000-559e-84cb-bb50-aa3dd3fb0fae	00090000-559e-84ca-385b-089c41765e5c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559e-84cb-995f-6372b38d767e	00180000-559e-84cb-4686-d453e5b10479	000c0000-559e-84cb-13a6-9c93e203bb6d	00090000-559e-84ca-0292-6f68b5980523	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559e-84cb-078a-79959134fb32	00180000-559e-84cb-6b44-3f8404760179	\N	00090000-559e-84ca-0292-6f68b5980523	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9590928)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559e-84c9-03f3-99b11329aea9	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559e-84c9-645a-8076ef5996f4	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559e-84c9-eec2-38a048728509	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559e-84c9-9ca0-0eeea67c1d54	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559e-84c9-a9e5-40d4f57fff61	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559e-84c9-51b3-ca4eff866e9c	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559e-84c9-795c-c19f4a8793cb	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559e-84c9-2a3f-43bd32e21679	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559e-84c9-ae25-b9fc76d59e59	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559e-84c9-905e-712c5c17c197	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559e-84c9-9f3d-f5f74f98abd9	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559e-84c9-4b5f-3b33e03f4c61	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559e-84c9-be65-09890966af58	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559e-84c9-cc02-664b3817e2dd	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559e-84c9-d88f-f1d6f7d564a7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559e-84c9-3fea-badf70a6d50a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9591118)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559e-84c9-3e3d-d5caaa5f4be5	01	Velika predstava	f	1.00	1.00
002b0000-559e-84c9-35b3-7a27b8a5ea06	02	Mala predstava	f	0.50	0.50
002b0000-559e-84c9-e231-82e9b4516913	03	Mala koprodukcija	t	0.40	1.00
002b0000-559e-84c9-1797-b263b905e88e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559e-84c9-91f8-ddfdf7ded92f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9590626)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9590472)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559e-84c9-cc29-0840302531b5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROugEMvej0KMDv/Cph2wvieqQFzsmorie	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559e-84ca-2523-f72f70fc465f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559e-84ca-c332-61c692cac3af	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559e-84ca-91d3-d41a4a17fe35	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559e-84ca-74fa-72598a9323e9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559e-84ca-1d6a-8116eac257c2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559e-84ca-9d12-ab7918f35eab	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559e-84ca-76fa-e37b3437f27d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559e-84ca-c378-b0fea68e0c8e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559e-84ca-8f71-7276c4ee44fd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559e-84ca-8edf-df9dc103976c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559e-84c9-d9d3-d1c794c14702	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9590976)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559e-84cb-6b9d-7c5a514ac247	00160000-559e-84ca-6619-c46dd44266b8	00150000-559e-84c9-27ad-4992c0512b85	00140000-559e-84c9-5bd6-42891fd656a5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559e-84ca-bc02-47e2be64532d
000e0000-559e-84cb-6284-e4f252bdcb37	00160000-559e-84ca-b725-beb4b7ee875a	00150000-559e-84c9-81b1-7c52031aabfe	00140000-559e-84c9-d52b-60038518b970	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559e-84ca-fc5a-3b3f2f297995
000e0000-559e-84cb-3aa8-06e5ba2ba8de	\N	00150000-559e-84c9-81b1-7c52031aabfe	00140000-559e-84c9-d52b-60038518b970	00190000-559e-84cb-2206-17a175f6571a	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559e-84ca-bc02-47e2be64532d
000e0000-559e-84cb-c957-9c0927d2ec7b	\N	00150000-559e-84c9-81b1-7c52031aabfe	00140000-559e-84c9-d52b-60038518b970	00190000-559e-84cb-2206-17a175f6571a	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559e-84ca-bc02-47e2be64532d
000e0000-559e-84cb-49dd-9ec107d39cec	\N	00150000-559e-84c9-81b1-7c52031aabfe	00140000-559e-84c9-d52b-60038518b970	00190000-559e-84cb-2206-17a175f6571a	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559e-84ca-433c-c23ef9e36695
\.


--
-- TOC entry 2871 (class 0 OID 9590688)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559e-84cb-b1da-517072bbec41	000e0000-559e-84cb-6284-e4f252bdcb37	1	
00200000-559e-84cb-5280-00636dd8e39c	000e0000-559e-84cb-6284-e4f252bdcb37	2	
\.


--
-- TOC entry 2886 (class 0 OID 9590813)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9590882)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9590720)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9590966)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559e-84c9-5bd6-42891fd656a5	01	Drama	drama (SURS 01)
00140000-559e-84c9-474a-fcea2d8b155c	02	Opera	opera (SURS 02)
00140000-559e-84c9-7081-e8fd1e0df649	03	Balet	balet (SURS 03)
00140000-559e-84c9-bb2d-4e8378eeed51	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559e-84c9-57fd-5ad76924c427	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559e-84c9-d52b-60038518b970	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559e-84c9-1de7-9e33a2232eda	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9590872)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559e-84c9-a2a8-b367d588cec5	01	Opera	opera
00150000-559e-84c9-9aa5-a1ba73c93309	02	Opereta	opereta
00150000-559e-84c9-60d0-5929cbe1c875	03	Balet	balet
00150000-559e-84c9-aa35-20f6befee2f7	04	Plesne prireditve	plesne prireditve
00150000-559e-84c9-6863-2c8123383beb	05	Lutkovno gledališče	lutkovno gledališče
00150000-559e-84c9-39e3-5b89e4630137	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559e-84c9-5169-153e247c3e42	07	Biografska drama	biografska drama
00150000-559e-84c9-27ad-4992c0512b85	08	Komedija	komedija
00150000-559e-84c9-f016-c075b1564e38	09	Črna komedija	črna komedija
00150000-559e-84c9-ef9c-08568c982dc5	10	E-igra	E-igra
00150000-559e-84c9-81b1-7c52031aabfe	11	Kriminalka	kriminalka
00150000-559e-84c9-19de-c6ee369d1b76	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9590526)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9591023)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9591013)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9590927)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9590710)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9590735)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9591134)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9590652)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9591075)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9590868)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9590686)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9590729)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9590666)
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
-- TOC entry 2537 (class 2606 OID 9590778)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9590805)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9590624)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9590535)
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
-- TOC entry 2452 (class 2606 OID 9590559)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9590515)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9590500)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9590811)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9590844)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9590961)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9590588)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9590612)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9590784)
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
-- TOC entry 2467 (class 2606 OID 9590602)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9590673)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9590796)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9591107)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9591115)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9591097)
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
-- TOC entry 2557 (class 2606 OID 9590828)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9590769)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9590760)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9590949)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9590896)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9590471)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9590835)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9590489)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9590509)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9590853)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9590791)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9590741)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9591158)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9591146)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9591140)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9590909)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9590568)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9590751)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9590938)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9591128)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9590637)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9590484)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9590992)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9590695)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9590819)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9590887)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9590724)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9590974)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9590880)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9590717)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9590910)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9590911)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9590590)
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
-- TOC entry 2550 (class 1259 OID 9590812)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9590798)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9590797)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9590696)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9590869)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9590871)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9590870)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9590668)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9590667)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9590963)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9590964)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9590965)
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
-- TOC entry 2604 (class 1259 OID 9590997)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9590994)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9590998)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9590996)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9590995)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9590639)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9590638)
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
-- TOC entry 2450 (class 1259 OID 9590562)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9590836)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9590730)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9590516)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9590517)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9590856)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9590855)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9590854)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9590674)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9590676)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9590675)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9591148)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9590764)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9590762)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9590761)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9590763)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9590490)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9590491)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9590820)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9590785)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9590897)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9590898)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9591079)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9591076)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9591077)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9591078)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9590604)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9590603)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9590605)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9591108)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9591109)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9591027)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9591025)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9591026)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9590888)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9590773)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9590772)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9590770)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9590771)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9591015)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9591014)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9591098)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9590687)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9591135)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9590537)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9590536)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9590569)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9590570)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9590754)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9590753)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9590752)
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
-- TOC entry 2502 (class 1259 OID 9590719)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9590715)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9590712)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9590713)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9590711)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9590716)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9590714)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9590589)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9590653)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9590655)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9590654)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9590656)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9590779)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9590962)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9590993)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9590560)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9590561)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9590881)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9591159)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9590625)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9591147)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9590830)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9590829)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9591024)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9591028)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9590613)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9590975)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9591116)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9591117)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9590510)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9590718)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9591295)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9591280)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9591285)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9591305)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9591275)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9591300)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9591290)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9591450)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9591455)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9591210)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9591390)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9591385)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9591380)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9591270)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9591420)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9591430)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9591425)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9591245)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9591240)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9591370)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9591460)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9591465)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9591470)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9591490)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9591475)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9591495)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9591485)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9591480)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9591235)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9591230)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9591195)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9591190)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9591400)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9591310)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9591170)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9591175)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9591415)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9591410)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9591405)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9591250)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9591260)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9591255)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9591575)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9591345)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9591335)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9591330)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9591340)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9591160)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9591165)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9591395)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9591375)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9591440)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9591445)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9591545)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9591530)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9591535)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9591540)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9591220)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9591215)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9591225)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9591555)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9591560)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9591520)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9591525)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9591510)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9591515)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9591435)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9591365)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9591360)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9591350)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9591355)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9591505)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9591500)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9591550)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9591265)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9591565)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9591570)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9591185)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9591180)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9591200)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9591205)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9591325)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9591320)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9591315)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-09 16:27:24 CEST

--
-- PostgreSQL database dump complete
--

