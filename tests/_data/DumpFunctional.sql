--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-17 13:29:12 CEST

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
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10560925)
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
-- TOC entry 228 (class 1259 OID 10561424)
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
-- TOC entry 227 (class 1259 OID 10561407)
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
-- TOC entry 221 (class 1259 OID 10561319)
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
-- TOC entry 197 (class 1259 OID 10561104)
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
-- TOC entry 200 (class 1259 OID 10561138)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10561541)
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
-- TOC entry 192 (class 1259 OID 10561047)
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
-- TOC entry 229 (class 1259 OID 10561437)
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
-- TOC entry 216 (class 1259 OID 10561264)
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
-- TOC entry 195 (class 1259 OID 10561084)
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
-- TOC entry 199 (class 1259 OID 10561132)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10561064)
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
-- TOC entry 205 (class 1259 OID 10561181)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10561206)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10561021)
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
-- TOC entry 184 (class 1259 OID 10560934)
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
-- TOC entry 185 (class 1259 OID 10560945)
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
-- TOC entry 180 (class 1259 OID 10560899)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10560918)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10561213)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10561244)
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
-- TOC entry 224 (class 1259 OID 10561358)
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
-- TOC entry 187 (class 1259 OID 10560978)
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
-- TOC entry 189 (class 1259 OID 10561013)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10561187)
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
-- TOC entry 188 (class 1259 OID 10560998)
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
-- TOC entry 194 (class 1259 OID 10561076)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10561199)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10561501)
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
-- TOC entry 232 (class 1259 OID 10561512)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10561482)
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
-- TOC entry 233 (class 1259 OID 10561520)
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
-- TOC entry 212 (class 1259 OID 10561228)
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
-- TOC entry 204 (class 1259 OID 10561172)
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
-- TOC entry 203 (class 1259 OID 10561162)
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
-- TOC entry 223 (class 1259 OID 10561347)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10561296)
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
-- TOC entry 177 (class 1259 OID 10560870)
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
-- TOC entry 176 (class 1259 OID 10560868)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10561238)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10560908)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10560892)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10561252)
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
-- TOC entry 207 (class 1259 OID 10561193)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10561143)
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
-- TOC entry 238 (class 1259 OID 10561561)
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
-- TOC entry 237 (class 1259 OID 10561553)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10561548)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10561306)
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
-- TOC entry 186 (class 1259 OID 10560970)
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
-- TOC entry 202 (class 1259 OID 10561149)
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
-- TOC entry 222 (class 1259 OID 10561336)
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
-- TOC entry 234 (class 1259 OID 10561530)
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
-- TOC entry 191 (class 1259 OID 10561033)
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
-- TOC entry 178 (class 1259 OID 10560879)
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
-- TOC entry 226 (class 1259 OID 10561384)
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
-- TOC entry 196 (class 1259 OID 10561095)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10561220)
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
-- TOC entry 218 (class 1259 OID 10561289)
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
-- TOC entry 198 (class 1259 OID 10561127)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10561374)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10561279)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2213 (class 2604 OID 10560873)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2864 (class 0 OID 10560925)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 10561424)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a8-e708-aeb3-6a73be06ebc0	000d0000-55a8-e708-d54b-6478fc06365a	\N	00090000-55a8-e707-c315-d7be271e730c	000b0000-55a8-e707-a838-a216b1cfd479	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a8-e708-89da-1f313414f711	000d0000-55a8-e708-2193-e0d933da41fd	00100000-55a8-e707-93a5-763bf66be252	00090000-55a8-e707-71aa-9c5a9384b1ac	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a8-e708-0bd9-b637613e4f8c	000d0000-55a8-e708-b9c4-9f80de7a9188	00100000-55a8-e707-19f6-2163126ed8eb	00090000-55a8-e707-ad7f-954901447dd9	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a8-e708-09e4-446b271dabe1	000d0000-55a8-e708-77a6-d463861ff7bc	\N	00090000-55a8-e707-d56e-4088596c60da	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a8-e708-dd40-b81b4e166915	000d0000-55a8-e708-ccdd-be67a0db7efa	\N	00090000-55a8-e707-9fd7-1e9e3b7554e4	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a8-e708-d996-5fb7c39f536e	000d0000-55a8-e708-50d2-ae9469ff53fe	\N	00090000-55a8-e707-6f19-bae033a89ece	000b0000-55a8-e707-ca66-ee401ed2ddec	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a8-e708-b523-eed2020abc3d	000d0000-55a8-e708-9ca7-dc4bde5d6eae	00100000-55a8-e708-9359-18d9c2b0553e	00090000-55a8-e707-6e04-cb6d064b4959	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a8-e708-3d40-cbbb269612fe	000d0000-55a8-e708-ad11-41822d1f5606	\N	00090000-55a8-e707-41c7-4200c5b44284	000b0000-55a8-e707-cd86-9407542c5ac6	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2908 (class 0 OID 10561407)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10561319)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a8-e707-3969-dda4f8dc22ee	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a8-e707-48d0-f481759250ee	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a8-e707-1ec5-b2296df9ce98	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2878 (class 0 OID 10561104)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a8-e708-f6d7-338106c443a4	\N	\N	00200000-55a8-e708-2d90-a9ae5ad86ea2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a8-e708-bda6-3224c06be1ad	\N	\N	00200000-55a8-e708-bf71-cc2c7188f77f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a8-e708-7866-034e04fe67bd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a8-e708-09b4-c3c4a5457ca8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a8-e708-bdeb-baa9be63fe4a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2881 (class 0 OID 10561138)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 10561541)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 10561047)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a8-e706-96ec-436bc8de7bc2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a8-e706-189c-1c8c9a18e5c4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a8-e706-9f2b-ea13b7d13b56	AL	ALB	008	Albania 	Albanija	\N
00040000-55a8-e706-98ae-7e1cf3cbb47e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a8-e706-67e1-6884fd21d318	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a8-e706-6a29-45c18edb28e3	AD	AND	020	Andorra 	Andora	\N
00040000-55a8-e706-2666-4655aeeb8ffd	AO	AGO	024	Angola 	Angola	\N
00040000-55a8-e706-3177-403a5b3e3048	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a8-e706-5f6e-98fc9931f7d1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a8-e706-9f62-155326689fe9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-e706-3e8a-71578971ecd5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a8-e706-4f1a-a857195b531d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a8-e706-234c-09b5536ebe68	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a8-e706-38d9-392b7b2d3fe2	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a8-e706-f6a8-a0772a1dc37f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a8-e706-c7b7-bc4f87b70b64	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a8-e706-b51b-aaf8beac3f27	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a8-e706-1c2a-135d18997721	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a8-e706-4cef-8d80d1479bde	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a8-e706-b66f-7d2f95191ae4	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a8-e706-d634-73b7441118b0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a8-e706-8bcb-d1ac752835a4	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a8-e706-3805-67d0759f48e0	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a8-e706-6aeb-bf3c712847bb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a8-e706-97c5-2fc3080668cf	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a8-e706-89ae-f93a8854f3fd	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a8-e706-6db0-d812f3204330	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a8-e706-250c-c71f3ebd74eb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a8-e706-7425-69bbbe0e4927	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a8-e706-4146-7ffca72c20af	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a8-e706-dd1d-8ed6606ec1ab	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a8-e706-b503-e9949a7abad3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a8-e706-65c5-8401f844a85e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a8-e706-813f-1fdc52d883f3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a8-e706-71cf-9d9fc2d87d41	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a8-e706-6ed3-1eb5a3dabac7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a8-e706-bcfe-677bb8e2ba41	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a8-e706-ea0e-3bfeb3d8bc14	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a8-e706-131b-f8a9735486f9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a8-e706-5c5f-9f21c9cdbbd3	CA	CAN	124	Canada 	Kanada	\N
00040000-55a8-e706-47ec-f26ecfdff9af	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a8-e706-73bf-70807ddffa4e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a8-e706-0532-f63ad03e4a0b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a8-e706-f67e-635bd1c83230	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a8-e706-c7de-22e2585d64c1	CL	CHL	152	Chile 	Čile	\N
00040000-55a8-e706-c5bc-ca8d918f77cf	CN	CHN	156	China 	Kitajska	\N
00040000-55a8-e706-ed9c-c3d582a74eb2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a8-e706-5800-36719560b31a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a8-e706-7f67-3b631e6b7666	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a8-e706-24fd-e60351c4184e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a8-e706-5367-5085ccdf02c3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a8-e706-3108-496f745b1303	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a8-e706-0283-c08d2a6e2ae8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a8-e706-936d-da957e5a4959	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a8-e706-8fdd-3647b787b6b1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a8-e706-2092-b6db3d6e59fa	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a8-e706-e703-4bcf01610058	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a8-e706-79bb-bb793681d7de	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a8-e706-ea89-9a7e1b60a127	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a8-e706-75d0-ec13ed837183	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a8-e706-6b6a-9e7dc395fc01	DK	DNK	208	Denmark 	Danska	\N
00040000-55a8-e706-4e79-54ba33194f3f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a8-e706-0be7-494ea4951a93	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-e706-6eed-b325b0d1a0e3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a8-e706-4990-e746db296eb2	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a8-e706-5ed9-8d97138c7d9b	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a8-e706-eb9b-4fb0921f634a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a8-e706-ba43-ce13c52a696e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a8-e706-b8cc-67ee950fc93f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a8-e706-40fe-85b5a299e8ec	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a8-e706-6d2d-55acccef4180	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a8-e706-26c0-15be7f93bb66	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a8-e706-56cc-224ea2fa7aa1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a8-e706-d32a-cc23322aa95a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a8-e706-92e3-bc4b38444e79	FI	FIN	246	Finland 	Finska	\N
00040000-55a8-e706-22ee-abccf819efa1	FR	FRA	250	France 	Francija	\N
00040000-55a8-e706-007a-029f3a98aefa	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a8-e706-3068-ec5892c47e71	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a8-e706-2f13-fe6fac191a2e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a8-e706-21b7-2189a083fd72	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a8-e706-fa35-4ee6949d1890	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a8-e706-9f5a-1cf1ed74724c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a8-e706-5502-a8a15f48c19e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a8-e706-fcce-ff3b3193c799	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a8-e706-171c-1d6305c9af0e	GH	GHA	288	Ghana 	Gana	\N
00040000-55a8-e706-445c-4ffc1518c114	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a8-e706-34be-8fd001de34c7	GR	GRC	300	Greece 	Grčija	\N
00040000-55a8-e706-cdf5-8a9c5199d26c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a8-e706-3228-592ba4b8a195	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a8-e706-39db-1c3644aff6cf	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a8-e706-52f6-15c202840881	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a8-e706-6901-a3590b7d3df4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a8-e706-3e72-d3e02c24a50f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a8-e706-7626-2183c3b61af3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a8-e706-cf4b-be2eb45e7172	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a8-e706-4bea-8d359648f78e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a8-e706-4afd-2d151b122348	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a8-e706-945e-0e892a5960d4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a8-e706-9fee-c7aff0640fca	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a8-e706-321b-30d636e9ae2d	HN	HND	340	Honduras 	Honduras	\N
00040000-55a8-e706-0c61-95d3e6902685	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a8-e706-e1dc-b9ac47ab32bd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a8-e706-b114-2a0d04b8b698	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a8-e706-fa09-0f3f5f323a88	IN	IND	356	India 	Indija	\N
00040000-55a8-e706-0bf3-09ecaac9996a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a8-e706-6699-f6ce398650d0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a8-e706-b5f3-2bbd5de28cf3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a8-e706-85d6-fc9a66f1c8a8	IE	IRL	372	Ireland 	Irska	\N
00040000-55a8-e706-8c5d-e8c54e13af44	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a8-e706-e965-a6b3e11ae12d	IL	ISR	376	Israel 	Izrael	\N
00040000-55a8-e706-aa9a-7a6a6a46763f	IT	ITA	380	Italy 	Italija	\N
00040000-55a8-e706-0cc1-821c580db682	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a8-e706-fcd7-530948e19e55	JP	JPN	392	Japan 	Japonska	\N
00040000-55a8-e706-0481-e789dbe74f75	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a8-e706-1c65-3211f8cb77f7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a8-e706-f040-589dc7633346	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a8-e706-4a21-ecc0823a911f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a8-e706-2fd1-ac8543cb23a6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a8-e706-f6bf-3a2a6e739eba	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a8-e706-4230-771c64cd07dc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a8-e706-54e5-fedb564714ff	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a8-e706-4259-bca152e77929	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a8-e706-33a8-cf219b7eeee9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a8-e706-dba7-8718d54f6433	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a8-e706-8dc5-71f9828625a8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a8-e706-4f8b-a05c55f24e44	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a8-e706-ea16-bb56e121cb95	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a8-e706-5171-7c40edd1b337	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a8-e706-cc89-b5888546e388	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a8-e706-cae0-5fee10dea24b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a8-e706-1a02-7968927a2cbf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a8-e706-c825-becc2b226906	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a8-e706-7a88-2ad3bbeec078	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a8-e706-cbb2-81138e9ff912	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a8-e706-1d45-72463c5e6a76	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a8-e706-d35a-3b8eda93881a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a8-e706-aeb3-f44759543ce0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a8-e706-47ad-c35ab0d11828	ML	MLI	466	Mali 	Mali	\N
00040000-55a8-e706-cc5a-6c859e2889a1	MT	MLT	470	Malta 	Malta	\N
00040000-55a8-e706-f646-d2ea04bed732	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a8-e706-2492-dfd09c9d88e0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a8-e706-d49a-ac364cd4701a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a8-e706-780b-aea7bb23bb81	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a8-e706-60aa-d244b6052695	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a8-e706-8937-1377a5a6de0c	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a8-e706-992e-1820106e4258	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a8-e706-d7a1-4a57e539e390	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a8-e706-88e8-4e80bf544e67	MC	MCO	492	Monaco 	Monako	\N
00040000-55a8-e706-0b5c-513edf4a4c54	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a8-e706-fa37-6e44698c7230	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a8-e706-64e4-b1f6dea796b7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a8-e706-3afb-2187a5569033	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a8-e706-6fa8-2c178f5351a3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a8-e706-ddff-7b7e4a925b9c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a8-e706-75d0-ff26c734c0c9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a8-e706-0ec5-34e9e54ca40b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a8-e706-e756-6adc8e47f451	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a8-e706-3ab0-2f48b65a5f2e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a8-e706-cac2-df2d18aa5a19	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a8-e706-40aa-841cd93d6b71	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a8-e706-b66d-94db6e5f2049	NE	NER	562	Niger 	Niger 	\N
00040000-55a8-e706-4efe-4505a5e63282	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a8-e706-4f06-6dcbb36bc918	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a8-e706-780e-c2ca1ba257ac	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a8-e706-a6da-bad84c48e3b1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a8-e706-7628-238a6b225adc	NO	NOR	578	Norway 	Norveška	\N
00040000-55a8-e706-4f36-115424e49640	OM	OMN	512	Oman 	Oman	\N
00040000-55a8-e706-fc5f-3ed39a125113	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a8-e706-5224-b3ca2293b0d0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a8-e706-ee59-5f2a107f5fbe	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a8-e706-0b1b-fb749c97bc90	PA	PAN	591	Panama 	Panama	\N
00040000-55a8-e706-be13-556492aaae35	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a8-e706-ee80-0fa1a089fc25	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a8-e706-60cc-712135b36f4f	PE	PER	604	Peru 	Peru	\N
00040000-55a8-e706-29ab-967226398be2	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a8-e706-79db-983389a60828	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a8-e706-a72b-4070dfc2f7a6	PL	POL	616	Poland 	Poljska	\N
00040000-55a8-e706-00ba-168a283c5c1c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a8-e706-479b-a92ff6f75785	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a8-e706-4f01-0ef785fd4446	QA	QAT	634	Qatar 	Katar	\N
00040000-55a8-e706-6d26-1509f6d35aa6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a8-e706-0419-274bc740a644	RO	ROU	642	Romania 	Romunija	\N
00040000-55a8-e706-8a5a-26225e283e3f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a8-e706-44d0-ca873d9d23c6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a8-e706-980f-3191314aeb10	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a8-e706-7328-6526a8fcfa72	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a8-e706-55e0-c3951dc9ac12	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a8-e706-6a50-2292bdde6294	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a8-e706-ac06-8471279b39a1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a8-e706-5269-bcf9239b470a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a8-e706-c534-c23f99a20c8a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a8-e706-77d0-22ed6fc20734	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a8-e706-2d2c-5d66179c4a7a	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a8-e706-8b53-4625938f5cbf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a8-e706-e847-8fce33145417	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a8-e706-6799-a6baf5ca9261	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a8-e706-63ae-a9121605d834	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a8-e706-9d78-9b65124f0409	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a8-e706-9c82-a0cdf636579b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a8-e706-7eeb-049cd838bda4	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a8-e706-dec2-7bca2f7b0820	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a8-e706-6be5-765acdcb594f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a8-e706-020d-3092364bd934	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a8-e706-6655-50efeef24b75	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a8-e706-43d7-ae7b71de2e22	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a8-e706-d3b8-aa0c5293d6d7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a8-e706-5746-c99b1c447b8c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a8-e706-0e30-934395fbeded	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a8-e706-6647-c720049b9aee	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a8-e706-4ceb-d600de4fb40c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a8-e706-5975-baecfc1a416f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a8-e706-2589-cc477605df8f	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a8-e706-a529-366b170aae8a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a8-e706-0550-6c19059d45e9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a8-e706-fd34-630fbf32f9eb	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a8-e706-258a-a1f7eeb9a083	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a8-e706-29c0-b23dfd008202	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a8-e706-7efc-fb26c73ff42a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a8-e706-c71a-c507251378ac	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a8-e706-6c53-5add174c1d97	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a8-e706-11de-ca274f2bf4e0	TH	THA	764	Thailand 	Tajska	\N
00040000-55a8-e706-738a-c859a85731a4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a8-e706-2b03-0dee9c91e381	TG	TGO	768	Togo 	Togo	\N
00040000-55a8-e706-0224-51be15c26a1c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a8-e706-667c-3678200fbfbe	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a8-e706-d009-6ca5963c881c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a8-e706-e7fd-ced98a33f070	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a8-e706-685b-419c87a14e6f	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a8-e706-9c3b-ebe068261970	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a8-e706-6d26-afb8338d306f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-e706-e229-d76fe2b5fd48	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a8-e706-2d34-c5fc17dba72e	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a8-e706-8c38-9070dc93da0b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a8-e706-280e-d458ad368640	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a8-e706-d6fe-70b4f0040967	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a8-e706-1590-a9baa946d1e8	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a8-e706-b081-6156973681a7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a8-e706-c6f9-74375caac0a1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a8-e706-3231-f20894213295	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a8-e706-cc30-1fd32afd5a54	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a8-e706-48bb-4fe9097dc698	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a8-e706-824b-5492ec628361	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a8-e706-9feb-6e434be9023a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-e706-9ee5-d2f3e6b6c61f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a8-e706-e379-e1d6d137efd5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a8-e706-c6e2-03c694bc138c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a8-e706-b285-4a73b7a6aa82	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a8-e706-b61e-07ae4f545ea1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a8-e706-8ba0-c72c41206e47	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2910 (class 0 OID 10561437)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a8-e708-a4b9-6dc78c6f084c	000e0000-55a8-e708-04ca-506a69637f72	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.20	0	2	2	2	2	2	\N	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a8-e707-6703-7ec2f92c4efb	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a8-e708-2826-3a75934e6b8b	000e0000-55a8-e708-793c-d89091d7ad8c	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.20	0	3	3	3	3	3	\N	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a8-e707-feee-97651a2ff62f	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-e708-db73-26c5c50ae042	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-e708-7ed1-049f49c928cc	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2897 (class 0 OID 10561264)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a8-e708-9ca7-dc4bde5d6eae	000e0000-55a8-e708-793c-d89091d7ad8c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a8-e707-369e-7a5412a2fad0
000d0000-55a8-e708-d54b-6478fc06365a	000e0000-55a8-e708-793c-d89091d7ad8c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-e707-369e-7a5412a2fad0
000d0000-55a8-e708-2193-e0d933da41fd	000e0000-55a8-e708-793c-d89091d7ad8c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a8-e707-f4a3-2bd460497a02
000d0000-55a8-e708-b9c4-9f80de7a9188	000e0000-55a8-e708-793c-d89091d7ad8c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a8-e707-fd7c-5eb04e4e2ffe
000d0000-55a8-e708-77a6-d463861ff7bc	000e0000-55a8-e708-793c-d89091d7ad8c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a8-e707-fd7c-5eb04e4e2ffe
000d0000-55a8-e708-ccdd-be67a0db7efa	000e0000-55a8-e708-793c-d89091d7ad8c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a8-e707-fd7c-5eb04e4e2ffe
000d0000-55a8-e708-50d2-ae9469ff53fe	000e0000-55a8-e708-793c-d89091d7ad8c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-e707-369e-7a5412a2fad0
000d0000-55a8-e708-ad11-41822d1f5606	000e0000-55a8-e708-793c-d89091d7ad8c	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a8-e707-c998-24272d40fe1c
\.


--
-- TOC entry 2876 (class 0 OID 10561084)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 10561132)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 10561064)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a8-e707-f89e-79b0256c548d	00080000-55a8-e707-0421-a0ced5e164c4	00090000-55a8-e707-6d34-c05253a5617f	AK		
\.


--
-- TOC entry 2851 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 10561181)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10561206)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 10561021)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a8-e706-d6b6-971e2dc54f55	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a8-e706-eee7-233bc31bb280	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a8-e706-1929-5988706774ce	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a8-e706-eed6-f93dde6ec1fd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a8-e706-8e2b-640f72b4a376	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a8-e706-c6b8-642552aaaaff	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a8-e706-fafe-c59d064b1cd7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a8-e706-b67d-40c3f0bd44fa	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-e706-1846-85fa231759e0	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-e706-c2dc-bda1abd8cf05	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a8-e706-de34-245a5c8b6ec8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a8-e706-2448-39f18bbbd01a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a8-e706-d9e1-026708cafe39	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55a8-e707-7c53-8294b8ae0f30	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a8-e707-cd9d-80ff2f040a77	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a8-e707-e74d-c3003925a245	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a8-e707-ed05-337ed6da4a73	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a8-e707-0ce3-a248665b5992	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a8-e707-824b-5c5b75d9c5ba	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2865 (class 0 OID 10560934)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a8-e707-20e3-abe5288e6b52	00000000-55a8-e707-cd9d-80ff2f040a77	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a8-e707-db4e-4b524b4abe10	00000000-55a8-e707-cd9d-80ff2f040a77	00010000-55a8-e706-3bb3-44deb6dc9b0b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a8-e707-847d-e07e806c0844	00000000-55a8-e707-e74d-c3003925a245	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2866 (class 0 OID 10560945)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a8-e707-c315-d7be271e730c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a8-e707-d56e-4088596c60da	00010000-55a8-e707-1e17-b4f45916cc5c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a8-e707-ad7f-954901447dd9	00010000-55a8-e707-2bf2-cc3424e066f7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a8-e707-a21c-0a56e5f84133	00010000-55a8-e707-b42b-bdadb16c3d7d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a8-e707-cbe9-4c3cec225f65	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a8-e707-6f19-bae033a89ece	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a8-e707-de54-5d7732506d5b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a8-e707-6e04-cb6d064b4959	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a8-e707-6d34-c05253a5617f	00010000-55a8-e707-3e90-f652fb21aa43	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a8-e707-71aa-9c5a9384b1ac	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a8-e707-9460-3427abde12d3	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a8-e707-9fd7-1e9e3b7554e4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a8-e707-41c7-4200c5b44284	00010000-55a8-e707-99e0-604d22823b5d	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2853 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 10560899)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a8-e706-d61b-6ab09d7f1a99	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a8-e706-9071-0dfe8cdf86e9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a8-e706-cbd1-ced0316ff3bb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a8-e706-aa72-53d870788925	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a8-e706-e778-f6ac67e778d5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a8-e706-c56e-2004f3af1893	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a8-e706-5c01-f99dc15aac40	Abonma-read	Abonma - branje	f
00030000-55a8-e706-84d5-ed9f711dd9da	Abonma-write	Abonma - spreminjanje	f
00030000-55a8-e706-fe2b-78c691e11a1b	Alternacija-read	Alternacija - branje	f
00030000-55a8-e706-0b42-06b13d141d1a	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a8-e706-e0ed-dbd01b08600d	Arhivalija-read	Arhivalija - branje	f
00030000-55a8-e706-c948-b24fa5303ba6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a8-e706-ab67-a220ff7ae52e	Besedilo-read	Besedilo - branje	f
00030000-55a8-e706-74b8-82bf7c799b14	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a8-e706-ea33-60c7d9ff0f10	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a8-e706-cb97-e4fd2780491c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a8-e706-a4e4-31c340bb4eb5	Dogodek-read	Dogodek - branje	f
00030000-55a8-e706-9258-340d681c5db2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a8-e706-08cc-9c3d0c7b987a	DrugiVir-read	DrugiVir - branje	f
00030000-55a8-e706-c2a6-b857d503f5f1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a8-e706-f1e1-19603c45db66	Drzava-read	Drzava - branje	f
00030000-55a8-e706-7b36-f2b7f5efae4e	Drzava-write	Drzava - spreminjanje	f
00030000-55a8-e706-40c9-ef92ac1158ad	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a8-e706-785c-d7f9b3c83086	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a8-e706-a306-68a58d58852a	Funkcija-read	Funkcija - branje	f
00030000-55a8-e706-6fb6-2b9bff4ac2b6	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a8-e706-0fd8-3740dc3edbc4	Gostovanje-read	Gostovanje - branje	f
00030000-55a8-e706-b193-67ed25b439f1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a8-e706-4d50-1d9b0aecb8d7	Gostujoca-read	Gostujoca - branje	f
00030000-55a8-e706-8171-66be4086511c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a8-e706-c1ad-ab6698d0b976	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a8-e706-ccb6-4bab77d103da	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a8-e706-1d63-8cc7e342ca8c	Kupec-read	Kupec - branje	f
00030000-55a8-e706-43f9-e53939cbd313	Kupec-write	Kupec - spreminjanje	f
00030000-55a8-e706-0cba-a89265336627	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a8-e706-8c8f-1ede07976252	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a8-e706-ad60-1b1be0fb527b	Option-read	Option - branje	f
00030000-55a8-e706-0ada-ca21aa046457	Option-write	Option - spreminjanje	f
00030000-55a8-e706-a4fa-184463f5e143	OptionValue-read	OptionValue - branje	f
00030000-55a8-e706-292f-5e0e5dbde1c7	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a8-e706-74f0-d8ff406d8334	Oseba-read	Oseba - branje	f
00030000-55a8-e706-516a-4d57dd2944f8	Oseba-write	Oseba - spreminjanje	f
00030000-55a8-e706-ad0b-3629a566d481	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a8-e706-5202-2374526d768e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a8-e706-a296-f667f9b5029f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a8-e706-6934-5093806a7415	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a8-e706-1cc1-e04f222329cb	Pogodba-read	Pogodba - branje	f
00030000-55a8-e706-b12f-eb7a7ed6d592	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a8-e706-fb95-f2cb35a4a630	Popa-read	Popa - branje	f
00030000-55a8-e706-3ee0-facdbd340835	Popa-write	Popa - spreminjanje	f
00030000-55a8-e706-6c61-5c6f899388c2	Posta-read	Posta - branje	f
00030000-55a8-e706-3b76-d5ed784449f3	Posta-write	Posta - spreminjanje	f
00030000-55a8-e706-0a2a-eafe393aa66c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a8-e706-f619-d66aeac043e2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a8-e706-5f9b-141b7a07dfee	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a8-e706-b97e-a4e497cd7974	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a8-e706-9574-1bde7aea9c2f	Predstava-read	Predstava - branje	f
00030000-55a8-e706-43b6-57978498c44c	Predstava-write	Predstava - spreminjanje	f
00030000-55a8-e706-2a9a-18f63f02d06f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a8-e706-7311-2748585923f1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a8-e706-b04c-58aefa8d706e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a8-e706-98ad-32056b77ee7d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a8-e706-5231-ab3eb612edf0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a8-e706-233c-4329688acb25	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a8-e706-d74f-312ae41f5cbc	ProgramDela-read	ProgramDela - branje	f
00030000-55a8-e706-75fb-da5040f89520	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a8-e706-85a1-502517d228f7	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a8-e706-9b29-6bbb8547cb37	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a8-e706-b48a-e0597606e306	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a8-e706-b93b-eac696c6c828	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a8-e706-331a-e3c44b7c4569	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a8-e706-eccc-654d1af724ec	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a8-e706-b768-7279c75e1cc9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a8-e706-98c1-3703c4d3b848	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a8-e706-6013-6765e19189e3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a8-e706-078b-905694f5f7ab	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a8-e706-be87-1e704d60f86b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a8-e706-7de2-696c063e6906	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a8-e706-d710-848638e504b3	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a8-e706-694d-f12ba89872d7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a8-e706-d181-da00f373071f	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a8-e706-2d24-cf9650593cbb	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a8-e706-e272-f6850d601be2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55a8-e706-afcf-8153ae760dfb	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55a8-e706-3a6b-89256e547f7b	Prostor-read	Prostor - branje	f
00030000-55a8-e706-a12f-1dffc82692dc	Prostor-write	Prostor - spreminjanje	f
00030000-55a8-e706-b337-9efbc49e3dfb	Racun-read	Racun - branje	f
00030000-55a8-e706-e54d-20f3c606cf31	Racun-write	Racun - spreminjanje	f
00030000-55a8-e706-65a5-a4f9abbfb577	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a8-e706-c6bb-081ee57d5458	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a8-e706-bd9b-fa27d91392d5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a8-e706-cb4b-62bbe6046efc	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a8-e706-6dcc-5832b04c8aeb	Rekvizit-read	Rekvizit - branje	f
00030000-55a8-e706-944b-f3aa3db46c6f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a8-e706-ba11-b47a28cd2185	Revizija-read	Revizija - branje	f
00030000-55a8-e706-55ef-5027a429f199	Revizija-write	Revizija - spreminjanje	f
00030000-55a8-e706-1be3-1fb7d2152011	Rezervacija-read	Rezervacija - branje	f
00030000-55a8-e706-0ff0-64ee95aee4d3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a8-e706-5570-7271f936f029	SedezniRed-read	SedezniRed - branje	f
00030000-55a8-e706-903e-5af97bf48a04	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a8-e706-ab11-05bcd02a0af3	Sedez-read	Sedez - branje	f
00030000-55a8-e706-685e-185c7a8019a7	Sedez-write	Sedez - spreminjanje	f
00030000-55a8-e706-f476-a8cf4417a807	Sezona-read	Sezona - branje	f
00030000-55a8-e706-a12a-08b20ec4f6fa	Sezona-write	Sezona - spreminjanje	f
00030000-55a8-e706-4e4d-129d65ca30a1	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a8-e706-a5cd-08cc7c864a3e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a8-e706-17db-9e8c53d61934	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a8-e706-b968-fe7de33826bb	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a8-e706-705f-74a9f426a1b5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a8-e706-f573-228f2bd1cf03	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a8-e706-098d-3b2bb5962459	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a8-e706-3971-d780b3c3931c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a8-e706-2104-8551298c19bc	Telefonska-read	Telefonska - branje	f
00030000-55a8-e706-560b-ee88a20f6486	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a8-e706-3216-b0e3d3b81e53	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a8-e706-2594-b3da3a7e8588	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a8-e706-e1d0-2aae3bb0fc9b	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a8-e706-a993-6c54cbd092bc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a8-e706-45d0-500beacf0abf	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a8-e706-26ea-2bf81f7dd6df	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a8-e706-9fb5-313eaf1b7181	Trr-read	Trr - branje	f
00030000-55a8-e706-241f-9c8ab58fcc3e	Trr-write	Trr - spreminjanje	f
00030000-55a8-e706-25f1-d4d92447873e	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a8-e706-6fdb-40d59d1646aa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a8-e706-4e32-47eada220cf1	Vaja-read	Vaja - branje	f
00030000-55a8-e706-acd0-4def67ed76d4	Vaja-write	Vaja - spreminjanje	f
00030000-55a8-e706-545e-a82d3692164b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a8-e706-3af5-67db10050f13	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a8-e706-3cdf-d278fdefb779	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a8-e706-8d97-053f57318856	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a8-e706-a8e8-f1dba9b2d593	Zasedenost-read	Zasedenost - branje	f
00030000-55a8-e706-5645-b7c8e966c304	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a8-e706-86f8-b651371081e5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a8-e706-9428-986088a15e4d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a8-e706-07e4-91cc56056871	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a8-e706-aaee-2cbd75024562	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2863 (class 0 OID 10560918)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a8-e706-0359-53e09e1a554d	00030000-55a8-e706-9071-0dfe8cdf86e9
00020000-55a8-e706-7ce7-489168641461	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-84d5-ed9f711dd9da
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-fe2b-78c691e11a1b
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-0b42-06b13d141d1a
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-aa72-53d870788925
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-9258-340d681c5db2
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-7b36-f2b7f5efae4e
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a306-68a58d58852a
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-6fb6-2b9bff4ac2b6
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-b193-67ed25b439f1
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-8171-66be4086511c
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-c1ad-ab6698d0b976
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-ccb6-4bab77d103da
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-74f0-d8ff406d8334
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-516a-4d57dd2944f8
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-3ee0-facdbd340835
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-3b76-d5ed784449f3
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-5f9b-141b7a07dfee
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-b97e-a4e497cd7974
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-43b6-57978498c44c
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-5231-ab3eb612edf0
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-233c-4329688acb25
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a12f-1dffc82692dc
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-cb4b-62bbe6046efc
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-944b-f3aa3db46c6f
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a12a-08b20ec4f6fa
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-e1d0-2aae3bb0fc9b
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-25f1-d4d92447873e
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-6fdb-40d59d1646aa
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-4e32-47eada220cf1
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-acd0-4def67ed76d4
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-a8e8-f1dba9b2d593
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-5645-b7c8e966c304
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e706-7a81-84d7e9df27b4	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-c1ad-ab6698d0b976
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-ccb6-4bab77d103da
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-74f0-d8ff406d8334
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-516a-4d57dd2944f8
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-5f9b-141b7a07dfee
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-b97e-a4e497cd7974
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-2104-8551298c19bc
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-560b-ee88a20f6486
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-9fb5-313eaf1b7181
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-241f-9c8ab58fcc3e
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-3cdf-d278fdefb779
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-8d97-053f57318856
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e706-7db8-38aba2d92f7c	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-fe2b-78c691e11a1b
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-c948-b24fa5303ba6
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-ab67-a220ff7ae52e
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-ea33-60c7d9ff0f10
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-a306-68a58d58852a
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-c1ad-ab6698d0b976
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-74f0-d8ff406d8334
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-5231-ab3eb612edf0
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-e1d0-2aae3bb0fc9b
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-4e32-47eada220cf1
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-a8e8-f1dba9b2d593
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e706-e53d-cc14c7fe5499	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-84d5-ed9f711dd9da
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-0b42-06b13d141d1a
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-e1d0-2aae3bb0fc9b
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e706-ef8f-162d5e3d1767	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-3216-b0e3d3b81e53
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-cbd1-ced0316ff3bb
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-e1d0-2aae3bb0fc9b
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e706-f3ad-49b738276ff5	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-d61b-6ab09d7f1a99
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9071-0dfe8cdf86e9
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-cbd1-ced0316ff3bb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-aa72-53d870788925
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-e778-f6ac67e778d5
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-c56e-2004f3af1893
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5c01-f99dc15aac40
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-84d5-ed9f711dd9da
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-fe2b-78c691e11a1b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0b42-06b13d141d1a
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-e0ed-dbd01b08600d
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-c948-b24fa5303ba6
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ab67-a220ff7ae52e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-74b8-82bf7c799b14
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ea33-60c7d9ff0f10
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-cb97-e4fd2780491c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a4e4-31c340bb4eb5
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9258-340d681c5db2
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-f1e1-19603c45db66
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-7b36-f2b7f5efae4e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-08cc-9c3d0c7b987a
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-c2a6-b857d503f5f1
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-40c9-ef92ac1158ad
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-785c-d7f9b3c83086
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a306-68a58d58852a
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6fb6-2b9bff4ac2b6
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0fd8-3740dc3edbc4
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b193-67ed25b439f1
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-4d50-1d9b0aecb8d7
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-8171-66be4086511c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-c1ad-ab6698d0b976
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ccb6-4bab77d103da
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-1d63-8cc7e342ca8c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-43f9-e53939cbd313
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0cba-a89265336627
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-8c8f-1ede07976252
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ad60-1b1be0fb527b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0ada-ca21aa046457
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a4fa-184463f5e143
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-292f-5e0e5dbde1c7
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-74f0-d8ff406d8334
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-516a-4d57dd2944f8
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ad0b-3629a566d481
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5202-2374526d768e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a296-f667f9b5029f
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6934-5093806a7415
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-1cc1-e04f222329cb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b12f-eb7a7ed6d592
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-fb95-f2cb35a4a630
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3ee0-facdbd340835
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6c61-5c6f899388c2
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3b76-d5ed784449f3
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0a2a-eafe393aa66c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-f619-d66aeac043e2
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5f9b-141b7a07dfee
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b97e-a4e497cd7974
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9574-1bde7aea9c2f
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-43b6-57978498c44c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-2a9a-18f63f02d06f
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-7311-2748585923f1
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b04c-58aefa8d706e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-98ad-32056b77ee7d
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5231-ab3eb612edf0
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-233c-4329688acb25
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-d74f-312ae41f5cbc
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-75fb-da5040f89520
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-85a1-502517d228f7
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9b29-6bbb8547cb37
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b48a-e0597606e306
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b93b-eac696c6c828
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-331a-e3c44b7c4569
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-eccc-654d1af724ec
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b768-7279c75e1cc9
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-98c1-3703c4d3b848
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6013-6765e19189e3
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-078b-905694f5f7ab
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-be87-1e704d60f86b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-7de2-696c063e6906
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-d710-848638e504b3
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-694d-f12ba89872d7
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-d181-da00f373071f
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-2d24-cf9650593cbb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-e272-f6850d601be2
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-afcf-8153ae760dfb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3a6b-89256e547f7b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a12f-1dffc82692dc
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b337-9efbc49e3dfb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-e54d-20f3c606cf31
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-65a5-a4f9abbfb577
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-c6bb-081ee57d5458
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-bd9b-fa27d91392d5
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-cb4b-62bbe6046efc
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6dcc-5832b04c8aeb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-944b-f3aa3db46c6f
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ba11-b47a28cd2185
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-55ef-5027a429f199
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-1be3-1fb7d2152011
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-0ff0-64ee95aee4d3
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5570-7271f936f029
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-903e-5af97bf48a04
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-ab11-05bcd02a0af3
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-685e-185c7a8019a7
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-f476-a8cf4417a807
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a12a-08b20ec4f6fa
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-4e4d-129d65ca30a1
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a5cd-08cc7c864a3e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-17db-9e8c53d61934
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-b968-fe7de33826bb
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-705f-74a9f426a1b5
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-f573-228f2bd1cf03
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-098d-3b2bb5962459
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3971-d780b3c3931c
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-2104-8551298c19bc
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-560b-ee88a20f6486
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3216-b0e3d3b81e53
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-2594-b3da3a7e8588
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-e1d0-2aae3bb0fc9b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a993-6c54cbd092bc
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-45d0-500beacf0abf
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-26ea-2bf81f7dd6df
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9fb5-313eaf1b7181
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-241f-9c8ab58fcc3e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-25f1-d4d92447873e
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-6fdb-40d59d1646aa
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-4e32-47eada220cf1
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-acd0-4def67ed76d4
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-545e-a82d3692164b
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3af5-67db10050f13
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-3cdf-d278fdefb779
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-8d97-053f57318856
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-a8e8-f1dba9b2d593
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-5645-b7c8e966c304
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-86f8-b651371081e5
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-9428-986088a15e4d
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-07e4-91cc56056871
00020000-55a8-e707-b5e6-6f8c55b33cc5	00030000-55a8-e706-aaee-2cbd75024562
\.


--
-- TOC entry 2891 (class 0 OID 10561213)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 10561244)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10561358)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55a8-e707-a838-a216b1cfd479	00090000-55a8-e707-c315-d7be271e730c	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55a8-e707-ca66-ee401ed2ddec	00090000-55a8-e707-6f19-bae033a89ece	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55a8-e707-cd86-9407542c5ac6	00090000-55a8-e707-41c7-4200c5b44284	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2868 (class 0 OID 10560978)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a8-e707-0421-a0ced5e164c4	00040000-55a8-e706-020d-3092364bd934	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-5e7e-b2d7f4ee8ba4	00040000-55a8-e706-020d-3092364bd934	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a8-e707-ac5c-0a30ef3da5ed	00040000-55a8-e706-020d-3092364bd934	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-e516-2efd3df6c6fc	00040000-55a8-e706-020d-3092364bd934	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-5f28-0868242cb9ac	00040000-55a8-e706-020d-3092364bd934	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-83a4-0fd09d156716	00040000-55a8-e706-3e8a-71578971ecd5	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-4e0f-9a966987d2a7	00040000-55a8-e706-2092-b6db3d6e59fa	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-3014-d9db28635d92	00040000-55a8-e706-f6a8-a0772a1dc37f	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-e707-cff3-038dafc471b8	00040000-55a8-e706-020d-3092364bd934	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2870 (class 0 OID 10561013)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a8-e706-fe6e-83d29be72199	8341	Adlešiči
00050000-55a8-e706-8ca4-6e9ffcf7ba3b	5270	Ajdovščina
00050000-55a8-e706-2eed-f1ebcff98df4	6280	Ankaran/Ancarano
00050000-55a8-e706-fab4-93718abbad15	9253	Apače
00050000-55a8-e706-5cf4-d8baf94fa52f	8253	Artiče
00050000-55a8-e706-753c-9a26fb24b857	4275	Begunje na Gorenjskem
00050000-55a8-e706-1a43-b6a9483c9b28	1382	Begunje pri Cerknici
00050000-55a8-e706-7362-860fda264245	9231	Beltinci
00050000-55a8-e706-eec0-e4ffcbb755f8	2234	Benedikt
00050000-55a8-e706-a1f6-9d586dceb558	2345	Bistrica ob Dravi
00050000-55a8-e706-8982-050c1566d707	3256	Bistrica ob Sotli
00050000-55a8-e706-444e-6ec0b7d11ce7	8259	Bizeljsko
00050000-55a8-e706-7704-91bc471ea04d	1223	Blagovica
00050000-55a8-e706-a978-8ad7ee25edc8	8283	Blanca
00050000-55a8-e706-0bce-ae5bfdcb7cab	4260	Bled
00050000-55a8-e706-6188-30a3d90ed515	4273	Blejska Dobrava
00050000-55a8-e706-8f3e-a5d33c15c5cd	9265	Bodonci
00050000-55a8-e706-b375-ced4fd51f59d	9222	Bogojina
00050000-55a8-e706-af0e-7bd8a3438799	4263	Bohinjska Bela
00050000-55a8-e706-5fa3-b799b29a7f60	4264	Bohinjska Bistrica
00050000-55a8-e706-b700-6e5dbea94757	4265	Bohinjsko jezero
00050000-55a8-e706-1454-1dde9ebb9f37	1353	Borovnica
00050000-55a8-e706-d951-21a4e7489cf7	8294	Boštanj
00050000-55a8-e706-0408-9385238e7dd1	5230	Bovec
00050000-55a8-e706-d0a9-d0fbe1f1c38a	5295	Branik
00050000-55a8-e706-406d-5fca434261cc	3314	Braslovče
00050000-55a8-e706-ca00-d85162994611	5223	Breginj
00050000-55a8-e706-03db-eeab950f59c4	8280	Brestanica
00050000-55a8-e706-d9fd-ca05a602d040	2354	Bresternica
00050000-55a8-e706-7461-a639a39b5c4e	4243	Brezje
00050000-55a8-e706-86da-2ff1a2f1bf66	1351	Brezovica pri Ljubljani
00050000-55a8-e706-d45a-b0aa7fe13577	8250	Brežice
00050000-55a8-e706-f61e-ea533aa6a9ae	4210	Brnik - Aerodrom
00050000-55a8-e706-c9e2-e87dbd81aff6	8321	Brusnice
00050000-55a8-e706-46ea-47ff7232eb94	3255	Buče
00050000-55a8-e706-d987-b2bf1eeeca80	8276	Bučka 
00050000-55a8-e706-b873-30c35491ccb0	9261	Cankova
00050000-55a8-e706-4a32-6eb26afb73e9	3000	Celje 
00050000-55a8-e706-6df0-aeaafd944e30	3001	Celje - poštni predali
00050000-55a8-e706-402b-069582da4943	4207	Cerklje na Gorenjskem
00050000-55a8-e706-6e68-7581777421b2	8263	Cerklje ob Krki
00050000-55a8-e706-32e2-0204c51f6757	1380	Cerknica
00050000-55a8-e706-448a-86de8e439822	5282	Cerkno
00050000-55a8-e706-5fa8-cd53d65bf286	2236	Cerkvenjak
00050000-55a8-e706-3a40-3bbd0429c0b3	2215	Ceršak
00050000-55a8-e706-32f4-a6120635e856	2326	Cirkovce
00050000-55a8-e706-fea3-f695c04e8856	2282	Cirkulane
00050000-55a8-e706-a4c2-a1371fd829cc	5273	Col
00050000-55a8-e706-14e7-b095fb726648	8251	Čatež ob Savi
00050000-55a8-e706-9673-f332f1593ad4	1413	Čemšenik
00050000-55a8-e706-419c-ceed01d7117d	5253	Čepovan
00050000-55a8-e706-0cc6-b9fc0fde2c13	9232	Črenšovci
00050000-55a8-e706-478b-c8f5b0243394	2393	Črna na Koroškem
00050000-55a8-e706-48a5-e2f0ee84bfb3	6275	Črni Kal
00050000-55a8-e706-a786-ac7cc3a90dc9	5274	Črni Vrh nad Idrijo
00050000-55a8-e706-89cd-925e8f751e16	5262	Črniče
00050000-55a8-e706-d457-eb0235a1865d	8340	Črnomelj
00050000-55a8-e706-f024-2c588d59f2ee	6271	Dekani
00050000-55a8-e706-3ebd-0153803d20a5	5210	Deskle
00050000-55a8-e706-9eee-73b035eb78f1	2253	Destrnik
00050000-55a8-e706-3c14-beb7401019f2	6215	Divača
00050000-55a8-e706-a658-99ee5f4fd4a3	1233	Dob
00050000-55a8-e706-258a-f1e2234b1a5e	3224	Dobje pri Planini
00050000-55a8-e706-4736-8891784179a0	8257	Dobova
00050000-55a8-e706-26aa-10ed72465332	1423	Dobovec
00050000-55a8-e706-41bd-94541e04e9a5	5263	Dobravlje
00050000-55a8-e706-b8a4-d1ea4a857361	3204	Dobrna
00050000-55a8-e706-a898-913538dd9ec3	8211	Dobrnič
00050000-55a8-e706-c109-d3c83f0c2daa	1356	Dobrova
00050000-55a8-e706-157d-13864df5da34	9223	Dobrovnik/Dobronak 
00050000-55a8-e706-bb7b-5e335cfb6c27	5212	Dobrovo v Brdih
00050000-55a8-e706-d098-47c686a9c667	1431	Dol pri Hrastniku
00050000-55a8-e706-55b9-ba99a914f739	1262	Dol pri Ljubljani
00050000-55a8-e706-52af-f5e396950929	1273	Dole pri Litiji
00050000-55a8-e706-6ed2-786557802884	1331	Dolenja vas
00050000-55a8-e706-188e-86544c36048a	8350	Dolenjske Toplice
00050000-55a8-e706-0132-6e300278e59c	1230	Domžale
00050000-55a8-e706-f829-dc9ef4164990	2252	Dornava
00050000-55a8-e706-7f8d-fef3aaa4f881	5294	Dornberk
00050000-55a8-e706-fd77-7fbb55dc4113	1319	Draga
00050000-55a8-e706-5ffb-5124106cc586	8343	Dragatuš
00050000-55a8-e706-9f64-fc9b764b1fa2	3222	Dramlje
00050000-55a8-e706-7471-76520f4d2719	2370	Dravograd
00050000-55a8-e706-58ff-14661f80f281	4203	Duplje
00050000-55a8-e706-3443-a36bf6617bcc	6221	Dutovlje
00050000-55a8-e706-3ee6-33dced2c967b	8361	Dvor
00050000-55a8-e706-6446-1986a85c704c	2343	Fala
00050000-55a8-e706-eff0-8c76fce1f099	9208	Fokovci
00050000-55a8-e706-b2fb-29c7f1582a5e	2313	Fram
00050000-55a8-e706-0d19-9b8c3898b9ec	3213	Frankolovo
00050000-55a8-e706-9171-fbcd883aad74	1274	Gabrovka
00050000-55a8-e706-689a-72313ba5414d	8254	Globoko
00050000-55a8-e706-7ca8-f40e46c2468d	5275	Godovič
00050000-55a8-e706-b09f-9cc12127968d	4204	Golnik
00050000-55a8-e706-80bc-735957f6e8a8	3303	Gomilsko
00050000-55a8-e706-a35e-ffb7c653fad8	4224	Gorenja vas
00050000-55a8-e706-227d-1d8d4a791004	3263	Gorica pri Slivnici
00050000-55a8-e706-a889-cd905926547b	2272	Gorišnica
00050000-55a8-e706-4d10-07645dcc5957	9250	Gornja Radgona
00050000-55a8-e706-6b88-e8cfb85b1b53	3342	Gornji Grad
00050000-55a8-e706-2d0c-d863be813182	4282	Gozd Martuljek
00050000-55a8-e706-b24a-bcbda5645aab	6272	Gračišče
00050000-55a8-e706-9012-6336155d2d37	9264	Grad
00050000-55a8-e706-abad-7c7b17f135bc	8332	Gradac
00050000-55a8-e706-4fca-c3510e600577	1384	Grahovo
00050000-55a8-e706-ab50-b458f99ac2c9	5242	Grahovo ob Bači
00050000-55a8-e706-9be0-7916f222bd9a	5251	Grgar
00050000-55a8-e706-42f0-fc260f0c375e	3302	Griže
00050000-55a8-e706-d901-815ef7b7ffc5	3231	Grobelno
00050000-55a8-e706-b21e-5282c1ff27b7	1290	Grosuplje
00050000-55a8-e706-7ffd-ba7b45d0b511	2288	Hajdina
00050000-55a8-e706-8e85-21921e1c08d5	8362	Hinje
00050000-55a8-e706-6ed1-a448047d223c	2311	Hoče
00050000-55a8-e706-44ae-ea53ca73b13f	9205	Hodoš/Hodos
00050000-55a8-e706-2f57-177f61465b21	1354	Horjul
00050000-55a8-e706-1a37-b17249ca327b	1372	Hotedršica
00050000-55a8-e706-76a1-142f867477e1	1430	Hrastnik
00050000-55a8-e706-fa81-cc8385727218	6225	Hruševje
00050000-55a8-e706-f528-6c4b28112429	4276	Hrušica
00050000-55a8-e706-e108-bcbbf6080038	5280	Idrija
00050000-55a8-e706-ef3c-3eda0f7e4f1c	1292	Ig
00050000-55a8-e706-e1aa-e190d28d177a	6250	Ilirska Bistrica
00050000-55a8-e706-ad9d-ec0dfce87b95	6251	Ilirska Bistrica-Trnovo
00050000-55a8-e706-b8eb-e5cfedb53687	1295	Ivančna Gorica
00050000-55a8-e706-7e09-e1b8f6776988	2259	Ivanjkovci
00050000-55a8-e706-ec0a-5282c04fc039	1411	Izlake
00050000-55a8-e706-4056-3178c7ff86f6	6310	Izola/Isola
00050000-55a8-e706-3746-ecde7d80c8ee	2222	Jakobski Dol
00050000-55a8-e706-2eeb-c17617dd220d	2221	Jarenina
00050000-55a8-e706-e9a7-1b90c5d21ea1	6254	Jelšane
00050000-55a8-e706-ffda-412703b59ca6	4270	Jesenice
00050000-55a8-e706-0770-753c87074b04	8261	Jesenice na Dolenjskem
00050000-55a8-e706-72bc-dd5e1d3878ae	3273	Jurklošter
00050000-55a8-e706-408d-456cc531a408	2223	Jurovski Dol
00050000-55a8-e706-a2f0-52415b6c385d	2256	Juršinci
00050000-55a8-e706-0267-feffbd2c9d3b	5214	Kal nad Kanalom
00050000-55a8-e706-20fe-3a5bb5c5d4f8	3233	Kalobje
00050000-55a8-e706-cce2-a3a5d3044fbd	4246	Kamna Gorica
00050000-55a8-e706-9f39-72c6cbc44e90	2351	Kamnica
00050000-55a8-e706-1cda-b0ae80915a4d	1241	Kamnik
00050000-55a8-e706-3ecf-bd8d35e45f99	5213	Kanal
00050000-55a8-e706-0e55-9f97fad893de	8258	Kapele
00050000-55a8-e706-8a46-06e36bd3c432	2362	Kapla
00050000-55a8-e706-0923-26f2ae6a0f7d	2325	Kidričevo
00050000-55a8-e706-0c97-78e1bd0573f9	1412	Kisovec
00050000-55a8-e706-3d21-1f48c2f7fb75	6253	Knežak
00050000-55a8-e706-ff76-f7da07045ccc	5222	Kobarid
00050000-55a8-e706-9758-b65fa10c8259	9227	Kobilje
00050000-55a8-e706-9904-8e93ac3bd256	1330	Kočevje
00050000-55a8-e706-8d9c-081aedad52e0	1338	Kočevska Reka
00050000-55a8-e706-543e-3603dc5a032a	2276	Kog
00050000-55a8-e706-7d3c-61f8aefefbf7	5211	Kojsko
00050000-55a8-e706-84ac-5a9549b8227d	6223	Komen
00050000-55a8-e706-fee1-73d1b908b725	1218	Komenda
00050000-55a8-e706-16cb-07cde9493afe	6000	Koper/Capodistria 
00050000-55a8-e706-64ae-f2dc6434a169	6001	Koper/Capodistria - poštni predali
00050000-55a8-e706-7621-b36018e7f11d	8282	Koprivnica
00050000-55a8-e706-4c76-f707605c5035	5296	Kostanjevica na Krasu
00050000-55a8-e706-6813-c462ceab78d3	8311	Kostanjevica na Krki
00050000-55a8-e706-a626-30449766e4eb	1336	Kostel
00050000-55a8-e706-9eb6-1cf06c91996f	6256	Košana
00050000-55a8-e706-72b5-db42784289e0	2394	Kotlje
00050000-55a8-e706-40a3-a49086d6f0c1	6240	Kozina
00050000-55a8-e706-346f-3bc8ea5234c6	3260	Kozje
00050000-55a8-e706-983f-e5c67bf5f18a	4000	Kranj 
00050000-55a8-e706-1ee1-226c4fe8a8eb	4001	Kranj - poštni predali
00050000-55a8-e706-ebb0-d4f16ea611af	4280	Kranjska Gora
00050000-55a8-e706-a34f-30697ac9433e	1281	Kresnice
00050000-55a8-e706-b8ba-ad65bb042df5	4294	Križe
00050000-55a8-e706-3b2c-92cb5fab8d89	9206	Križevci
00050000-55a8-e706-7f71-7237f0457296	9242	Križevci pri Ljutomeru
00050000-55a8-e706-5b9a-5fc09925c82c	1301	Krka
00050000-55a8-e706-7c3f-7a776289e7c9	8296	Krmelj
00050000-55a8-e706-527a-7479a52004dd	4245	Kropa
00050000-55a8-e706-0e7f-d32dd5cd1797	8262	Krška vas
00050000-55a8-e706-1b31-b3b5d11ad230	8270	Krško
00050000-55a8-e706-fdf4-12e82fbcb4d2	9263	Kuzma
00050000-55a8-e706-abbc-fda1f12156b9	2318	Laporje
00050000-55a8-e706-be3f-38ee03a89d52	3270	Laško
00050000-55a8-e706-2406-0687c6d3a187	1219	Laze v Tuhinju
00050000-55a8-e706-dc29-93df91852261	2230	Lenart v Slovenskih goricah
00050000-55a8-e706-a1a6-094a489c325d	9220	Lendava/Lendva
00050000-55a8-e706-1faf-64013c0d524a	4248	Lesce
00050000-55a8-e706-60d3-e2cb724cfc5a	3261	Lesično
00050000-55a8-e706-4ce5-6a03b170498b	8273	Leskovec pri Krškem
00050000-55a8-e706-6fa7-dd9406952ca4	2372	Libeliče
00050000-55a8-e706-747a-9991c819dcd1	2341	Limbuš
00050000-55a8-e706-6825-e387055b1dc3	1270	Litija
00050000-55a8-e706-22f5-38a52eca3ccb	3202	Ljubečna
00050000-55a8-e706-83d1-3eac3149dcfa	1000	Ljubljana 
00050000-55a8-e706-cc76-63adcff7772d	1001	Ljubljana - poštni predali
00050000-55a8-e706-aaa5-1968f6600e54	1231	Ljubljana - Črnuče
00050000-55a8-e706-9d87-c49a3ef2612d	1261	Ljubljana - Dobrunje
00050000-55a8-e706-88cf-b0d711dfffc9	1260	Ljubljana - Polje
00050000-55a8-e706-55f6-6cb7baafef0b	1210	Ljubljana - Šentvid
00050000-55a8-e706-0588-eb72076eba3c	1211	Ljubljana - Šmartno
00050000-55a8-e706-b009-6ce9bfcb5d3f	3333	Ljubno ob Savinji
00050000-55a8-e706-50f4-153c3cdf81f1	9240	Ljutomer
00050000-55a8-e706-5866-de96ec99d28b	3215	Loče
00050000-55a8-e706-c876-819f7412e18f	5231	Log pod Mangartom
00050000-55a8-e706-d539-cc4b79e90094	1358	Log pri Brezovici
00050000-55a8-e706-13c4-f9cc20882538	1370	Logatec
00050000-55a8-e706-9987-744663f03aab	1371	Logatec
00050000-55a8-e706-de4b-e4d629887af4	1434	Loka pri Zidanem Mostu
00050000-55a8-e706-2fa3-5eec52bc8fa1	3223	Loka pri Žusmu
00050000-55a8-e706-7d1c-8c1a42d41e7d	6219	Lokev
00050000-55a8-e706-dbc8-7047ad70fcbf	1318	Loški Potok
00050000-55a8-e706-41a4-df6b78086e66	2324	Lovrenc na Dravskem polju
00050000-55a8-e706-ccdc-db231da627e2	2344	Lovrenc na Pohorju
00050000-55a8-e706-fce4-fc9950a23036	3334	Luče
00050000-55a8-e706-6a4c-a5e068b654f6	1225	Lukovica
00050000-55a8-e706-077d-29ff83dd2ef0	9202	Mačkovci
00050000-55a8-e706-ba53-08e4b860374b	2322	Majšperk
00050000-55a8-e706-bd68-eb65c3bbfdbe	2321	Makole
00050000-55a8-e706-2c37-4bec2b8b000e	9243	Mala Nedelja
00050000-55a8-e706-3a09-839ceb88c91e	2229	Malečnik
00050000-55a8-e706-ba7e-0cd0a8d22a7a	6273	Marezige
00050000-55a8-e706-9494-d8cdebe9107c	2000	Maribor 
00050000-55a8-e706-6c88-68f11970ceda	2001	Maribor - poštni predali
00050000-55a8-e706-1b32-e66b1f50c5f0	2206	Marjeta na Dravskem polju
00050000-55a8-e706-1d4c-5d0bc7a8ba1b	2281	Markovci
00050000-55a8-e706-4ce3-d3736a9c5e3d	9221	Martjanci
00050000-55a8-e706-ffef-28e3fcfbedee	6242	Materija
00050000-55a8-e706-3923-3d304eec2f07	4211	Mavčiče
00050000-55a8-e706-d7df-2de6451eb8b8	1215	Medvode
00050000-55a8-e706-4936-0f6167fc163d	1234	Mengeš
00050000-55a8-e706-27ac-ea8ee68c7cbd	8330	Metlika
00050000-55a8-e706-f68c-b9f26d237cc6	2392	Mežica
00050000-55a8-e706-0b5b-72cb349533ac	2204	Miklavž na Dravskem polju
00050000-55a8-e706-c45f-5a1f0e76d8b0	2275	Miklavž pri Ormožu
00050000-55a8-e706-9766-c70b35ca70e8	5291	Miren
00050000-55a8-e706-0fb4-216a430dda81	8233	Mirna
00050000-55a8-e706-9846-b06073547e7d	8216	Mirna Peč
00050000-55a8-e706-4a7d-dcd4009cb59c	2382	Mislinja
00050000-55a8-e706-f282-1f9a45d291ba	4281	Mojstrana
00050000-55a8-e706-adcd-f37530730be8	8230	Mokronog
00050000-55a8-e706-9d70-7a2600ca4640	1251	Moravče
00050000-55a8-e706-d102-195e452e975f	9226	Moravske Toplice
00050000-55a8-e706-8652-932a8223c391	5216	Most na Soči
00050000-55a8-e706-de1d-a1b3fd1c5769	1221	Motnik
00050000-55a8-e706-fd1f-fc7e89165526	3330	Mozirje
00050000-55a8-e706-cadf-4f6d5898f42f	9000	Murska Sobota 
00050000-55a8-e706-02f3-a4acb5d630f4	9001	Murska Sobota - poštni predali
00050000-55a8-e706-ab99-69776d64a95c	2366	Muta
00050000-55a8-e706-05ac-d27e31dc985e	4202	Naklo
00050000-55a8-e706-0e4d-a40675a24ae4	3331	Nazarje
00050000-55a8-e706-85b5-b3ca6dd1b60d	1357	Notranje Gorice
00050000-55a8-e706-1744-bdae02b30443	3203	Nova Cerkev
00050000-55a8-e706-17dd-f2f1cc3dad63	5000	Nova Gorica 
00050000-55a8-e706-f15a-77786a40e773	5001	Nova Gorica - poštni predali
00050000-55a8-e706-1dad-8e9f99ed3583	1385	Nova vas
00050000-55a8-e706-3515-dd74892d820f	8000	Novo mesto
00050000-55a8-e706-c53d-3a97a2528fb4	8001	Novo mesto - poštni predali
00050000-55a8-e706-0fb3-efab258f370b	6243	Obrov
00050000-55a8-e706-922d-c553d6dd7683	9233	Odranci
00050000-55a8-e706-7243-99bcb4986289	2317	Oplotnica
00050000-55a8-e706-8114-5b7d77e53611	2312	Orehova vas
00050000-55a8-e706-e040-5f3153207ae4	2270	Ormož
00050000-55a8-e706-25b2-abc5b5651fd2	1316	Ortnek
00050000-55a8-e706-04ef-12b28be58408	1337	Osilnica
00050000-55a8-e706-8a66-6323f6058a95	8222	Otočec
00050000-55a8-e706-5bcc-0b8346dc3d4f	2361	Ožbalt
00050000-55a8-e706-3291-a36606de1404	2231	Pernica
00050000-55a8-e706-3b93-71eeacd1f405	2211	Pesnica pri Mariboru
00050000-55a8-e706-433c-79565c9eb583	9203	Petrovci
00050000-55a8-e706-1ce2-e88194106b45	3301	Petrovče
00050000-55a8-e706-adbe-092ee04d5e50	6330	Piran/Pirano
00050000-55a8-e706-e669-9e989c0b539f	8255	Pišece
00050000-55a8-e706-b8d2-5c847c0414cb	6257	Pivka
00050000-55a8-e706-dae9-dd53f3a41f3a	6232	Planina
00050000-55a8-e706-9cde-f218877b917f	3225	Planina pri Sevnici
00050000-55a8-e706-83d8-537e2eb3e968	6276	Pobegi
00050000-55a8-e706-e368-51dd59c7a7e3	8312	Podbočje
00050000-55a8-e706-27fd-7e5ab1fdcf7f	5243	Podbrdo
00050000-55a8-e706-fe8a-f39d728ea9ef	3254	Podčetrtek
00050000-55a8-e706-a19a-1ac54a151921	2273	Podgorci
00050000-55a8-e706-fea6-5c7c3ae27e4c	6216	Podgorje
00050000-55a8-e706-adad-1412fd50f49d	2381	Podgorje pri Slovenj Gradcu
00050000-55a8-e706-40bd-22e2f4a0367d	6244	Podgrad
00050000-55a8-e706-9d68-c2187e6df4f0	1414	Podkum
00050000-55a8-e706-1919-82f4b0ebea39	2286	Podlehnik
00050000-55a8-e706-2caf-86dfe4942287	5272	Podnanos
00050000-55a8-e706-e082-0edbd9449b44	4244	Podnart
00050000-55a8-e706-68bf-ba2e40ca4662	3241	Podplat
00050000-55a8-e706-dcc6-eecb4a360cc7	3257	Podsreda
00050000-55a8-e706-aa0e-a057c64af74c	2363	Podvelka
00050000-55a8-e706-7913-44597affd99c	2208	Pohorje
00050000-55a8-e706-bd61-5b4ed5059dd3	2257	Polenšak
00050000-55a8-e706-afdd-5bc8a9aad6f2	1355	Polhov Gradec
00050000-55a8-e706-babd-c0f8a041effe	4223	Poljane nad Škofjo Loko
00050000-55a8-e706-321f-be6b8dcc1089	2319	Poljčane
00050000-55a8-e706-044a-b4506fad663e	1272	Polšnik
00050000-55a8-e706-23b6-ef854c0ebe05	3313	Polzela
00050000-55a8-e706-bd30-b7d196277c4c	3232	Ponikva
00050000-55a8-e706-9287-0348f7b297d9	6320	Portorož/Portorose
00050000-55a8-e706-a26e-ad0b0cdf240e	6230	Postojna
00050000-55a8-e706-51c9-1478c623df76	2331	Pragersko
00050000-55a8-e706-3947-a2a29f850d91	3312	Prebold
00050000-55a8-e706-c232-130db1911c1d	4205	Preddvor
00050000-55a8-e706-7449-4ae3e629eaa9	6255	Prem
00050000-55a8-e706-69d7-afe759c63d5b	1352	Preserje
00050000-55a8-e706-d7e7-fb3ecc52f141	6258	Prestranek
00050000-55a8-e706-fa64-cf8dd43fdfda	2391	Prevalje
00050000-55a8-e706-6a26-18245c1dadcf	3262	Prevorje
00050000-55a8-e706-9549-fd8b0c95e1bc	1276	Primskovo 
00050000-55a8-e706-b4c6-497348d563fd	3253	Pristava pri Mestinju
00050000-55a8-e706-6aca-cc76d15f73ff	9207	Prosenjakovci/Partosfalva
00050000-55a8-e706-b608-a691deaa2900	5297	Prvačina
00050000-55a8-e706-04c1-e4fa8628ecc6	2250	Ptuj
00050000-55a8-e706-b366-771da59d3a78	2323	Ptujska Gora
00050000-55a8-e706-9259-ae3307b363b1	9201	Puconci
00050000-55a8-e706-69de-ad931e1bed70	2327	Rače
00050000-55a8-e706-ac1c-02df07080a7e	1433	Radeče
00050000-55a8-e706-ceb2-8b20b6c49221	9252	Radenci
00050000-55a8-e706-b0ba-e5f7ed276dae	2360	Radlje ob Dravi
00050000-55a8-e706-b569-eeb24d8656ab	1235	Radomlje
00050000-55a8-e706-cef4-63008163e37a	4240	Radovljica
00050000-55a8-e706-e566-19af55bcb602	8274	Raka
00050000-55a8-e706-d51a-07ba0b092e7a	1381	Rakek
00050000-55a8-e706-14f4-0afa5bf6cc8f	4283	Rateče - Planica
00050000-55a8-e706-2721-de3d1f29a8e1	2390	Ravne na Koroškem
00050000-55a8-e706-ec99-93ca05606dce	9246	Razkrižje
00050000-55a8-e706-41f5-da70c475cc80	3332	Rečica ob Savinji
00050000-55a8-e706-f197-a7bff5e9160c	5292	Renče
00050000-55a8-e706-ee3a-dbb7a938e060	1310	Ribnica
00050000-55a8-e706-afda-39cbdc73c640	2364	Ribnica na Pohorju
00050000-55a8-e706-2db9-6be25a763a3d	3272	Rimske Toplice
00050000-55a8-e706-7d6c-2bf3b4a2297f	1314	Rob
00050000-55a8-e706-91c8-c4e46e734d42	5215	Ročinj
00050000-55a8-e706-7d3e-95b5051be210	3250	Rogaška Slatina
00050000-55a8-e706-f965-1349309fd023	9262	Rogašovci
00050000-55a8-e706-3d53-cb776bf2a738	3252	Rogatec
00050000-55a8-e706-135a-f2a43fbd2300	1373	Rovte
00050000-55a8-e706-002a-637ee17e2ebb	2342	Ruše
00050000-55a8-e706-bb28-091e89004feb	1282	Sava
00050000-55a8-e706-4e07-da6fe5dddc6d	6333	Sečovlje/Sicciole
00050000-55a8-e706-d230-1090f6b836e3	4227	Selca
00050000-55a8-e706-f5f9-0ff332b76437	2352	Selnica ob Dravi
00050000-55a8-e706-6b9b-9a9b6765650f	8333	Semič
00050000-55a8-e706-423b-da4ebb528ae4	8281	Senovo
00050000-55a8-e706-afc8-c5ad41bea92d	6224	Senožeče
00050000-55a8-e706-ca3c-4ec0abbff138	8290	Sevnica
00050000-55a8-e706-4a58-4277c6179b0b	6210	Sežana
00050000-55a8-e706-a737-b495ef08e94a	2214	Sladki Vrh
00050000-55a8-e706-7557-f2b44eb1c1b1	5283	Slap ob Idrijci
00050000-55a8-e706-4b63-1abe53135a12	2380	Slovenj Gradec
00050000-55a8-e706-f04b-3f4f734e6472	2310	Slovenska Bistrica
00050000-55a8-e706-7d27-cc40f8ec6b20	3210	Slovenske Konjice
00050000-55a8-e706-655b-a45ecf2a4748	1216	Smlednik
00050000-55a8-e706-dfdd-4d5e0c4064e2	5232	Soča
00050000-55a8-e706-21f7-cb5a222c4766	1317	Sodražica
00050000-55a8-e706-893c-080bbf518794	3335	Solčava
00050000-55a8-e706-5bea-3cd5269fa7d0	5250	Solkan
00050000-55a8-e706-c76f-0d01f89e1e9e	4229	Sorica
00050000-55a8-e706-f103-724465cc3b68	4225	Sovodenj
00050000-55a8-e706-03a0-801745cf959e	5281	Spodnja Idrija
00050000-55a8-e706-1319-d17d71740b86	2241	Spodnji Duplek
00050000-55a8-e706-5e06-39a6745d7892	9245	Spodnji Ivanjci
00050000-55a8-e706-4a05-1f99883d0809	2277	Središče ob Dravi
00050000-55a8-e706-4b7d-68308f81f2dd	4267	Srednja vas v Bohinju
00050000-55a8-e706-9116-1f67a525ac32	8256	Sromlje 
00050000-55a8-e706-b99a-ecef08420a4b	5224	Srpenica
00050000-55a8-e706-0261-3c2336180b77	1242	Stahovica
00050000-55a8-e706-7477-5a732b461f12	1332	Stara Cerkev
00050000-55a8-e706-9686-511a34955d8c	8342	Stari trg ob Kolpi
00050000-55a8-e706-56cb-3c20b3061f41	1386	Stari trg pri Ložu
00050000-55a8-e706-c737-c1a17db020b2	2205	Starše
00050000-55a8-e706-1564-5e78e4a09878	2289	Stoperce
00050000-55a8-e706-83af-f2e210fd91b8	8322	Stopiče
00050000-55a8-e706-b8cd-98a585abf701	3206	Stranice
00050000-55a8-e706-82e8-db3709911310	8351	Straža
00050000-55a8-e706-6633-a68f728474ca	1313	Struge
00050000-55a8-e706-f64b-e1618bcdccc2	8293	Studenec
00050000-55a8-e706-bc86-fe1714e4a351	8331	Suhor
00050000-55a8-e706-7ba9-6f9888e58ba1	2233	Sv. Ana v Slovenskih goricah
00050000-55a8-e706-d9b1-f16b054c75ce	2235	Sv. Trojica v Slovenskih goricah
00050000-55a8-e706-d486-f346fb5beb11	2353	Sveti Duh na Ostrem Vrhu
00050000-55a8-e706-70e0-c5f0d28ec046	9244	Sveti Jurij ob Ščavnici
00050000-55a8-e706-1c53-d35886cbb84f	3264	Sveti Štefan
00050000-55a8-e706-9c12-541cbe707d44	2258	Sveti Tomaž
00050000-55a8-e706-135c-f6b76892c486	9204	Šalovci
00050000-55a8-e706-c410-0d6b7d4eca6c	5261	Šempas
00050000-55a8-e706-1b41-223b46f44cdd	5290	Šempeter pri Gorici
00050000-55a8-e706-46e3-affa8f1643c0	3311	Šempeter v Savinjski dolini
00050000-55a8-e706-7604-df542c25d622	4208	Šenčur
00050000-55a8-e706-0405-2dee42f992a6	2212	Šentilj v Slovenskih goricah
00050000-55a8-e706-b867-94bafd2bcf9f	8297	Šentjanž
00050000-55a8-e706-efa8-dfd9a2d5f2cc	2373	Šentjanž pri Dravogradu
00050000-55a8-e706-d32d-820ddcdfab8f	8310	Šentjernej
00050000-55a8-e706-1716-b65b9cdabf8e	3230	Šentjur
00050000-55a8-e706-cab3-f4230782e6a7	3271	Šentrupert
00050000-55a8-e706-1a76-f0bb45f4b7c5	8232	Šentrupert
00050000-55a8-e706-04cd-4c419ce781e3	1296	Šentvid pri Stični
00050000-55a8-e706-683d-f47f04f7a3ca	8275	Škocjan
00050000-55a8-e706-b910-0b685c0e46fa	6281	Škofije
00050000-55a8-e706-beee-979193106ca3	4220	Škofja Loka
00050000-55a8-e706-fa52-c72253d98c7b	3211	Škofja vas
00050000-55a8-e706-e944-ae92eff8eb6b	1291	Škofljica
00050000-55a8-e706-5dc3-35e22ad147fd	6274	Šmarje
00050000-55a8-e706-faca-df0b20513870	1293	Šmarje - Sap
00050000-55a8-e706-0c49-8be33ded8a8a	3240	Šmarje pri Jelšah
00050000-55a8-e706-9ba1-d8e46afa3ad0	8220	Šmarješke Toplice
00050000-55a8-e706-eaef-d54f3356428c	2315	Šmartno na Pohorju
00050000-55a8-e706-c4f4-c504e721bf17	3341	Šmartno ob Dreti
00050000-55a8-e706-7c8b-68f8ba6ed965	3327	Šmartno ob Paki
00050000-55a8-e706-514a-67f69928726f	1275	Šmartno pri Litiji
00050000-55a8-e706-c159-042fcb015429	2383	Šmartno pri Slovenj Gradcu
00050000-55a8-e706-bd5b-1e7c54fcb4e1	3201	Šmartno v Rožni dolini
00050000-55a8-e706-84d4-bcc2d49cbae4	3325	Šoštanj
00050000-55a8-e706-1c38-a220d74b7de1	6222	Štanjel
00050000-55a8-e706-9ddc-d2a181e78e65	3220	Štore
00050000-55a8-e706-6345-810a09963742	3304	Tabor
00050000-55a8-e706-9166-ea6851fec601	3221	Teharje
00050000-55a8-e706-e351-4c0739f03285	9251	Tišina
00050000-55a8-e706-6ce5-157dfb6e91df	5220	Tolmin
00050000-55a8-e706-81aa-f494d0fdd1fa	3326	Topolšica
00050000-55a8-e706-f574-78fd0f5f42af	2371	Trbonje
00050000-55a8-e706-ea8f-d13b09729387	1420	Trbovlje
00050000-55a8-e706-2212-a50b31c203d6	8231	Trebelno 
00050000-55a8-e706-1185-e42a6ee896e6	8210	Trebnje
00050000-55a8-e706-7721-ccba22facccc	5252	Trnovo pri Gorici
00050000-55a8-e706-d630-64eea861d204	2254	Trnovska vas
00050000-55a8-e706-1660-c5e2754de72c	1222	Trojane
00050000-55a8-e706-1aa7-732df7e3f17b	1236	Trzin
00050000-55a8-e706-455a-1328536d6cc5	4290	Tržič
00050000-55a8-e706-70e9-dfc5f5d154d2	8295	Tržišče
00050000-55a8-e706-4197-a149b0a84874	1311	Turjak
00050000-55a8-e706-2e76-9c669bd558ed	9224	Turnišče
00050000-55a8-e706-a75a-4e12b80f6c7e	8323	Uršna sela
00050000-55a8-e706-7840-48c410522ce1	1252	Vače
00050000-55a8-e706-584f-5ff3cd4a676e	3320	Velenje 
00050000-55a8-e706-fc51-20c769be7c52	3322	Velenje - poštni predali
00050000-55a8-e706-c052-c8bcf917eb8d	8212	Velika Loka
00050000-55a8-e706-8c52-6a8bc8419925	2274	Velika Nedelja
00050000-55a8-e706-162c-f9f67394cbc8	9225	Velika Polana
00050000-55a8-e706-7a67-760907a2abc2	1315	Velike Lašče
00050000-55a8-e706-bb77-a64fde9005fd	8213	Veliki Gaber
00050000-55a8-e706-f022-fe9710e96a0b	9241	Veržej
00050000-55a8-e706-38b5-97890c234705	1312	Videm - Dobrepolje
00050000-55a8-e706-c92e-9cbd4e0acc2f	2284	Videm pri Ptuju
00050000-55a8-e706-3e31-dda8d40de049	8344	Vinica
00050000-55a8-e706-0b71-b1cb01f0c91b	5271	Vipava
00050000-55a8-e706-85e9-5b87487c69ff	4212	Visoko
00050000-55a8-e706-bbc0-d98c97aacef8	1294	Višnja Gora
00050000-55a8-e706-0d89-f9ceabfb30c0	3205	Vitanje
00050000-55a8-e706-1788-e4af1384b4c9	2255	Vitomarci
00050000-55a8-e706-393a-c4937cf0bfda	1217	Vodice
00050000-55a8-e706-c305-7b377047e0fb	3212	Vojnik\t
00050000-55a8-e706-e3c2-c0f72e608f3c	5293	Volčja Draga
00050000-55a8-e706-61d2-b75c0b63344e	2232	Voličina
00050000-55a8-e706-83f9-2a9d9f01f5f8	3305	Vransko
00050000-55a8-e706-9e8f-c235957b96f7	6217	Vremski Britof
00050000-55a8-e706-7134-39741de103dc	1360	Vrhnika
00050000-55a8-e706-d172-255a1a443f79	2365	Vuhred
00050000-55a8-e706-b682-a59d9744a620	2367	Vuzenica
00050000-55a8-e706-8ec5-70195bdee6c1	8292	Zabukovje 
00050000-55a8-e706-ab3c-10c2f5ad5613	1410	Zagorje ob Savi
00050000-55a8-e706-2b20-8a9595833ef6	1303	Zagradec
00050000-55a8-e706-a201-fb6cc8ebe514	2283	Zavrč
00050000-55a8-e706-c125-13861efdeba8	8272	Zdole 
00050000-55a8-e706-d7d2-c55c47b5ec8f	4201	Zgornja Besnica
00050000-55a8-e706-338e-321108280168	2242	Zgornja Korena
00050000-55a8-e706-043c-e1ac0987257d	2201	Zgornja Kungota
00050000-55a8-e706-c74a-a2f7121a9abb	2316	Zgornja Ložnica
00050000-55a8-e706-1a1d-bd8fb8e002a7	2314	Zgornja Polskava
00050000-55a8-e706-fd41-3e90bd034e30	2213	Zgornja Velka
00050000-55a8-e706-fadf-c04a14577365	4247	Zgornje Gorje
00050000-55a8-e706-e418-a7d66ecc982f	4206	Zgornje Jezersko
00050000-55a8-e706-ecb4-98d106883c18	2285	Zgornji Leskovec
00050000-55a8-e706-cf86-becf4df5582c	1432	Zidani Most
00050000-55a8-e706-b2bd-cff1189fd0ad	3214	Zreče
00050000-55a8-e706-605c-89a3d4b6532b	4209	Žabnica
00050000-55a8-e706-bae9-e5bfba664d90	3310	Žalec
00050000-55a8-e706-0182-5ae09690ec12	4228	Železniki
00050000-55a8-e706-530e-bb2b9be367a9	2287	Žetale
00050000-55a8-e706-1d76-63665c78ea39	4226	Žiri
00050000-55a8-e706-8dd8-cd073e8a98a5	4274	Žirovnica
00050000-55a8-e706-e887-da653b6ffd0a	8360	Žužemberk
\.


--
-- TOC entry 2887 (class 0 OID 10561187)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 10560998)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10561076)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 10561199)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 10561501)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10561512)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a8-e707-b55a-a642cdb98705	00080000-55a8-e707-cff3-038dafc471b8	0900	AK
00190000-55a8-e707-d17e-d3b5d3a8e053	00080000-55a8-e707-ac5c-0a30ef3da5ed	0987	AK
00190000-55a8-e707-b944-4ee93c88dd86	00080000-55a8-e707-5e7e-b2d7f4ee8ba4	0989	AK
00190000-55a8-e707-01ad-1c49ae56eb4a	00080000-55a8-e707-e516-2efd3df6c6fc	0986	AK
00190000-55a8-e707-8c70-26b2d816afb1	00080000-55a8-e707-83a4-0fd09d156716	0984	AK
00190000-55a8-e707-24b6-3013bf113ce4	00080000-55a8-e707-4e0f-9a966987d2a7	0983	AK
00190000-55a8-e707-4f6c-71beccb854df	00080000-55a8-e707-3014-d9db28635d92	0982	AK
\.


--
-- TOC entry 2911 (class 0 OID 10561482)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a8-e708-5827-28b8d1cf92d0	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2856 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 10561520)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 10561228)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a8-e707-9089-428b1e41e860	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a8-e707-a36c-78c2e353299a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a8-e707-21cc-83d332910d95	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a8-e707-20da-ba74edb2ef0f	0004	Mali oder	t	24	Mali oder 
00220000-55a8-e707-78e8-e9d182255741	0005	Komorni oder	t	15	Komorni oder
00220000-55a8-e707-7ab4-b2c4522dac6b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a8-e707-2840-a2c4d4b33be3	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2885 (class 0 OID 10561172)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10561162)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 10561347)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10561296)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 10560870)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2894 (class 0 OID 10561238)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10560908)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a8-e706-0359-53e09e1a554d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a8-e706-7ce7-489168641461	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a8-e706-9da6-dc8be1e48adc	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a8-e706-2b73-6a55c09988ea	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a8-e706-7a81-84d7e9df27b4	planer	Planer dogodkov v koledarju	t
00020000-55a8-e706-7db8-38aba2d92f7c	kadrovska	Kadrovska služba	t
00020000-55a8-e706-e53d-cc14c7fe5499	arhivar	Ažuriranje arhivalij	t
00020000-55a8-e706-ef8f-162d5e3d1767	igralec	Igralec	t
00020000-55a8-e706-f3ad-49b738276ff5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a8-e707-b5e6-6f8c55b33cc5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2860 (class 0 OID 10560892)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a8-e706-3bb3-44deb6dc9b0b	00020000-55a8-e706-9da6-dc8be1e48adc
00010000-55a8-e706-ddd6-f04a08c03479	00020000-55a8-e706-9da6-dc8be1e48adc
00010000-55a8-e707-572c-d0ec9e74eebe	00020000-55a8-e707-b5e6-6f8c55b33cc5
\.


--
-- TOC entry 2896 (class 0 OID 10561252)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 10561193)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 10561143)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 10561561)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a8-e707-550a-307f5e8bfd79	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a8-e707-96be-4a4135e154f4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a8-e707-da62-781a32b94e5b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a8-e707-5f97-6626a433605b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a8-e707-67ee-64ae5be4f278	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2918 (class 0 OID 10561553)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a8-e707-b568-6f5e0b089c2f	00230000-55a8-e707-5f97-6626a433605b	popa
00240000-55a8-e707-3fc5-05a6d73646fb	00230000-55a8-e707-5f97-6626a433605b	oseba
00240000-55a8-e707-bf47-b2e343ade3ed	00230000-55a8-e707-96be-4a4135e154f4	prostor
00240000-55a8-e707-2412-29a4a0955dc8	00230000-55a8-e707-5f97-6626a433605b	besedilo
00240000-55a8-e707-85e3-daa528f26d72	00230000-55a8-e707-5f97-6626a433605b	uprizoritev
00240000-55a8-e707-d665-b9b5d5d92517	00230000-55a8-e707-5f97-6626a433605b	funkcija
00240000-55a8-e707-6c8d-cbf68f2cc6d7	00230000-55a8-e707-5f97-6626a433605b	tipfunkcije
00240000-55a8-e707-938f-09384e6b4d8b	00230000-55a8-e707-5f97-6626a433605b	alternacija
00240000-55a8-e707-885f-5c847d17b69e	00230000-55a8-e707-550a-307f5e8bfd79	pogodba
00240000-55a8-e707-73ed-b460b05c9c20	00230000-55a8-e707-5f97-6626a433605b	zaposlitev
00240000-55a8-e707-6544-05630f894c9f	00230000-55a8-e707-550a-307f5e8bfd79	programdela
\.


--
-- TOC entry 2917 (class 0 OID 10561548)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10561306)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a8-e708-3553-95264cdf6764	000e0000-55a8-e708-793c-d89091d7ad8c	00080000-55a8-e707-0421-a0ced5e164c4	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a8-e708-bbb3-28fbe59f6e5f	000e0000-55a8-e708-793c-d89091d7ad8c	00080000-55a8-e707-0421-a0ced5e164c4	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a8-e708-ac00-b6086c24ac32	000e0000-55a8-e708-793c-d89091d7ad8c	00080000-55a8-e707-5f28-0868242cb9ac	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55a8-e708-83ac-fd02c6c0d231	000e0000-55a8-e708-793c-d89091d7ad8c	00080000-55a8-e707-5f28-0868242cb9ac	Avtorske pravice	300.00	30.00	Odkup avtoskih pravic	avtorprav	3
\.


--
-- TOC entry 2867 (class 0 OID 10560970)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10561149)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a8-e708-3e41-083588c39ced	00180000-55a8-e708-f6d7-338106c443a4	000c0000-55a8-e708-aeb3-6a73be06ebc0	00090000-55a8-e707-6d34-c05253a5617f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e708-e861-9ee5ee60e9a4	00180000-55a8-e708-f6d7-338106c443a4	000c0000-55a8-e708-89da-1f313414f711	00090000-55a8-e707-71aa-9c5a9384b1ac	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e708-1619-ce3c6858e233	00180000-55a8-e708-f6d7-338106c443a4	000c0000-55a8-e708-0bd9-b637613e4f8c	00090000-55a8-e707-ad7f-954901447dd9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e708-3070-63981b2be2d9	00180000-55a8-e708-f6d7-338106c443a4	000c0000-55a8-e708-09e4-446b271dabe1	00090000-55a8-e707-d56e-4088596c60da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e708-4e66-80d9daa5aef4	00180000-55a8-e708-f6d7-338106c443a4	000c0000-55a8-e708-dd40-b81b4e166915	00090000-55a8-e707-9fd7-1e9e3b7554e4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-e708-b634-957fb61640b0	00180000-55a8-e708-7866-034e04fe67bd	\N	00090000-55a8-e707-9fd7-1e9e3b7554e4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2903 (class 0 OID 10561336)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a8-e707-369e-7a5412a2fad0	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a8-e707-a3ef-0f08ce41fd2b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a8-e707-2c9c-2c9ced70fb84	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a8-e707-f4a3-2bd460497a02	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a8-e707-baea-e572e1c60a75	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a8-e707-0ee2-28ccae5db409	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a8-e707-b639-0e42c38bf667	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a8-e707-2622-5bae348e5100	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a8-e707-ec4e-886d869f1d3d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a8-e707-7066-b2f7661f261e	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a8-e707-899f-1e44d20e9ef6	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a8-e707-c998-24272d40fe1c	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a8-e707-cb60-e60b52f04566	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a8-e707-d69c-82949057ba31	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a8-e707-63c2-233a27f26ab1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a8-e707-fd7c-5eb04e4e2ffe	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2915 (class 0 OID 10561530)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a8-e707-69c5-f1a29bf5044e	01	Velika predstava	f	1.00	1.00
002b0000-55a8-e707-487c-7ffba495e7ac	02	Mala predstava	f	0.50	0.50
002b0000-55a8-e707-576f-322369e43b50	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a8-e707-6703-7ec2f92c4efb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a8-e707-feee-97651a2ff62f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2872 (class 0 OID 10561033)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 10560879)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a8-e706-ddd6-f04a08c03479	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRON66cuU16rcmhdUX3YN2WyjHcifJC97e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a8-e707-2bf2-cc3424e066f7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a8-e707-1e17-b4f45916cc5c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a8-e707-3e90-f652fb21aa43	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a8-e707-99e0-604d22823b5d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a8-e707-b42b-bdadb16c3d7d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a8-e707-dd67-b128cdae7de4	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a8-e707-ee40-d123581e0097	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a8-e707-8271-87b3ea975054	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a8-e707-7a8e-495a801cc7c0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a8-e707-572c-d0ec9e74eebe	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a8-e706-3bb3-44deb6dc9b0b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2907 (class 0 OID 10561384)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a8-e708-04ca-506a69637f72	00160000-55a8-e707-3969-dda4f8dc22ee	00150000-55a8-e707-85a9-afe2e6a5d21b	00140000-55a8-e706-e637-0f9bcc5bb15d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a8-e707-78e8-e9d182255741
000e0000-55a8-e708-793c-d89091d7ad8c	00160000-55a8-e707-1ec5-b2296df9ce98	00150000-55a8-e707-65a2-7c41e2b2f9a4	00140000-55a8-e706-3bf0-03cee720dadc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a8-e707-7ab4-b2c4522dac6b
000e0000-55a8-e708-4889-92c1f3246b73	\N	00150000-55a8-e707-65a2-7c41e2b2f9a4	00140000-55a8-e706-3bf0-03cee720dadc	00190000-55a8-e707-d17e-d3b5d3a8e053	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a8-e707-78e8-e9d182255741
000e0000-55a8-e708-5bd3-b864b7fc79a7	\N	00150000-55a8-e707-65a2-7c41e2b2f9a4	00140000-55a8-e706-3bf0-03cee720dadc	00190000-55a8-e707-d17e-d3b5d3a8e053	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a8-e707-78e8-e9d182255741
000e0000-55a8-e708-738f-8f21be449f93	\N	00150000-55a8-e707-65a2-7c41e2b2f9a4	00140000-55a8-e706-3bf0-03cee720dadc	00190000-55a8-e707-d17e-d3b5d3a8e053	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a8-e707-9089-428b1e41e860
\.


--
-- TOC entry 2877 (class 0 OID 10561095)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a8-e708-2d90-a9ae5ad86ea2	000e0000-55a8-e708-793c-d89091d7ad8c	1	
00200000-55a8-e708-bf71-cc2c7188f77f	000e0000-55a8-e708-793c-d89091d7ad8c	2	
\.


--
-- TOC entry 2892 (class 0 OID 10561220)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 10561289)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a8-e707-93a5-763bf66be252	00090000-55a8-e707-71aa-9c5a9384b1ac	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-e707-19f6-2163126ed8eb	00090000-55a8-e707-ad7f-954901447dd9	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-e708-9359-18d9c2b0553e	00090000-55a8-e707-6e04-cb6d064b4959	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2879 (class 0 OID 10561127)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10561374)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a8-e706-e637-0f9bcc5bb15d	01	Drama	drama (SURS 01)
00140000-55a8-e706-4f29-c8b09317afc8	02	Opera	opera (SURS 02)
00140000-55a8-e706-2299-46d209c6c878	03	Balet	balet (SURS 03)
00140000-55a8-e706-177c-a828d8fbaf07	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a8-e706-79bc-5c220b247bc3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a8-e706-3bf0-03cee720dadc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a8-e706-1ac5-782b76e34a3f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2898 (class 0 OID 10561279)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a8-e707-6aec-8615b5612b5d	01	Opera	opera
00150000-55a8-e707-3458-a3c084e6714f	02	Opereta	opereta
00150000-55a8-e707-d70b-708b46b054fe	03	Balet	balet
00150000-55a8-e707-d688-b48abcf7d35a	04	Plesne prireditve	plesne prireditve
00150000-55a8-e707-4108-d797c57e1505	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a8-e707-ba6a-d88a1b886638	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a8-e707-fcc7-80f57201f38a	07	Biografska drama	biografska drama
00150000-55a8-e707-85a9-afe2e6a5d21b	08	Komedija	komedija
00150000-55a8-e707-044f-5e9e94d85dbf	09	Črna komedija	črna komedija
00150000-55a8-e707-211d-a7ee4e216d67	10	E-igra	E-igra
00150000-55a8-e707-65a2-7c41e2b2f9a4	11	Kriminalka	kriminalka
00150000-55a8-e707-3edf-b38a9ed122f9	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 10560933)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 10561431)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 10561421)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 10561335)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 10561117)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 10561142)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 10561546)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 10561059)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 10561476)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 10561275)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 10561093)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 10561136)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 10561073)
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
-- TOC entry 2537 (class 2606 OID 10561185)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 10561212)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 10561031)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 10560942)
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
-- TOC entry 2452 (class 2606 OID 10560966)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 10560922)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 10560907)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 10561218)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 10561251)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 10561369)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 10560995)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 10561019)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 10561191)
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
-- TOC entry 2467 (class 2606 OID 10561009)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 10561080)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 10561203)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 10561509)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 10561517)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 10561499)
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
-- TOC entry 2643 (class 2606 OID 10561528)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 10561235)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 10561176)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 10561167)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 10561357)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 10561303)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 10560878)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 10561242)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 10560896)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 10560916)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 10561260)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 10561198)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 10561148)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 10561570)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 10561558)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 10561552)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 10561316)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 10560975)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 10561158)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 10561346)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 10561540)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 10561044)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 10560891)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 10561400)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 10561102)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 10561226)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 10561294)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 10561131)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 10561382)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 10561287)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 10561124)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 10561317)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 10561318)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 10560997)
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
-- TOC entry 2550 (class 1259 OID 10561219)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 10561205)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 10561204)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 10561103)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 10561276)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10561278)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 10561277)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 10561075)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 10561074)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2641 (class 1259 OID 10561529)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2595 (class 1259 OID 10561371)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 10561372)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 10561373)
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
-- TOC entry 2604 (class 1259 OID 10561405)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 10561402)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 10561406)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 10561404)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 10561403)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 10561046)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 10561045)
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
-- TOC entry 2450 (class 1259 OID 10560969)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 10561243)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 10561137)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 10560923)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 10560924)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 10561263)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 10561262)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 10561261)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 10561081)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 10561083)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 10561082)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2651 (class 1259 OID 10561560)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 10561171)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 10561169)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 10561168)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 10561170)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 10560897)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 10560898)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 10561227)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 10561192)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 10561304)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 10561305)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 10561481)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 10561480)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2627 (class 1259 OID 10561477)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 10561478)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2629 (class 1259 OID 10561479)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 10561011)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 10561010)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 10561012)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2633 (class 1259 OID 10561510)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2634 (class 1259 OID 10561511)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 10561435)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 10561433)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 10561434)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 10561295)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 10561180)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 10561179)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 10561177)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 10561178)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 10561423)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 10561422)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2630 (class 1259 OID 10561500)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 10561094)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2648 (class 1259 OID 10561547)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 10560944)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 10560943)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 10560976)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 10560977)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 10561161)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 10561160)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 10561159)
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
-- TOC entry 2502 (class 1259 OID 10561126)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 10561122)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 10561119)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 10561120)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 10561118)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 10561123)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 10561121)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 10560996)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 10561060)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10561062)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 10561061)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 10561063)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 10561186)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 10561370)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 10561401)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 10560967)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10560968)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 10561288)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 10561571)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 10561032)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2654 (class 1259 OID 10561559)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 10561237)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 10561236)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 10561432)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10561436)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 10561020)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 10561383)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 10561518)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10561519)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 10560917)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 10561125)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2683 (class 2606 OID 10561707)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2686 (class 2606 OID 10561692)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2685 (class 2606 OID 10561697)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2681 (class 2606 OID 10561717)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2687 (class 2606 OID 10561687)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2682 (class 2606 OID 10561712)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2684 (class 2606 OID 10561702)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2717 (class 2606 OID 10561862)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 10561867)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2668 (class 2606 OID 10561622)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2704 (class 2606 OID 10561802)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2702 (class 2606 OID 10561797)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 10561792)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2680 (class 2606 OID 10561682)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 10561832)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2710 (class 2606 OID 10561842)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2711 (class 2606 OID 10561837)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2674 (class 2606 OID 10561657)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2675 (class 2606 OID 10561652)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2700 (class 2606 OID 10561782)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2741 (class 2606 OID 10561987)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2720 (class 2606 OID 10561872)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2719 (class 2606 OID 10561877)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2718 (class 2606 OID 10561882)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2722 (class 2606 OID 10561902)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2725 (class 2606 OID 10561887)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 10561907)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2723 (class 2606 OID 10561897)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2724 (class 2606 OID 10561892)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2672 (class 2606 OID 10561647)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2673 (class 2606 OID 10561642)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 10561607)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2665 (class 2606 OID 10561602)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2706 (class 2606 OID 10561812)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2688 (class 2606 OID 10561722)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 10561582)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2660 (class 2606 OID 10561587)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2707 (class 2606 OID 10561827)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2708 (class 2606 OID 10561822)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2709 (class 2606 OID 10561817)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2678 (class 2606 OID 10561662)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2676 (class 2606 OID 10561672)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2677 (class 2606 OID 10561667)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2743 (class 2606 OID 10561997)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2692 (class 2606 OID 10561757)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2694 (class 2606 OID 10561747)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2695 (class 2606 OID 10561742)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2693 (class 2606 OID 10561752)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2659 (class 2606 OID 10561572)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 10561577)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2705 (class 2606 OID 10561807)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2701 (class 2606 OID 10561787)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2715 (class 2606 OID 10561852)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2714 (class 2606 OID 10561857)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 10561962)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 10561957)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2736 (class 2606 OID 10561942)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 10561947)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2734 (class 2606 OID 10561952)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2670 (class 2606 OID 10561632)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 10561627)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2669 (class 2606 OID 10561637)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 10561972)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2738 (class 2606 OID 10561977)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2729 (class 2606 OID 10561932)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2728 (class 2606 OID 10561937)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2731 (class 2606 OID 10561922)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2730 (class 2606 OID 10561927)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2713 (class 2606 OID 10561847)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2696 (class 2606 OID 10561777)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2697 (class 2606 OID 10561772)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2699 (class 2606 OID 10561762)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2698 (class 2606 OID 10561767)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 10561917)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 10561912)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2737 (class 2606 OID 10561967)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 10561677)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 10561982)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 10561992)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2662 (class 2606 OID 10561597)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2663 (class 2606 OID 10561592)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2667 (class 2606 OID 10561612)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 10561617)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 10561737)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 10561732)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2691 (class 2606 OID 10561727)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-17 13:29:13 CEST

--
-- PostgreSQL database dump complete
--

