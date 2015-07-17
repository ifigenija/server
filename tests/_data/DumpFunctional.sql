--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-17 14:59:29 CEST

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
-- TOC entry 183 (class 1259 OID 10592231)
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
-- TOC entry 228 (class 1259 OID 10592730)
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
-- TOC entry 227 (class 1259 OID 10592713)
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
-- TOC entry 221 (class 1259 OID 10592625)
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
-- TOC entry 197 (class 1259 OID 10592410)
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
-- TOC entry 200 (class 1259 OID 10592444)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 10592848)
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
-- TOC entry 192 (class 1259 OID 10592353)
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
-- TOC entry 229 (class 1259 OID 10592743)
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
-- TOC entry 216 (class 1259 OID 10592570)
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
-- TOC entry 195 (class 1259 OID 10592390)
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
-- TOC entry 199 (class 1259 OID 10592438)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10592370)
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
-- TOC entry 205 (class 1259 OID 10592487)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10592512)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10592327)
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
-- TOC entry 184 (class 1259 OID 10592240)
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
-- TOC entry 185 (class 1259 OID 10592251)
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
-- TOC entry 180 (class 1259 OID 10592205)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10592224)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10592519)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10592550)
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
-- TOC entry 224 (class 1259 OID 10592664)
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
-- TOC entry 187 (class 1259 OID 10592284)
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
-- TOC entry 189 (class 1259 OID 10592319)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10592493)
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
-- TOC entry 188 (class 1259 OID 10592304)
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
-- TOC entry 194 (class 1259 OID 10592382)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10592505)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10592808)
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
-- TOC entry 232 (class 1259 OID 10592819)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10592789)
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
-- TOC entry 233 (class 1259 OID 10592827)
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
-- TOC entry 212 (class 1259 OID 10592534)
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
-- TOC entry 204 (class 1259 OID 10592478)
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
-- TOC entry 203 (class 1259 OID 10592468)
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
-- TOC entry 223 (class 1259 OID 10592653)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10592602)
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
-- TOC entry 177 (class 1259 OID 10592176)
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
-- TOC entry 176 (class 1259 OID 10592174)
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
-- TOC entry 213 (class 1259 OID 10592544)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10592214)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10592198)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10592558)
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
-- TOC entry 207 (class 1259 OID 10592499)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10592449)
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
-- TOC entry 238 (class 1259 OID 10592868)
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
-- TOC entry 237 (class 1259 OID 10592860)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 10592855)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10592612)
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
-- TOC entry 186 (class 1259 OID 10592276)
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
-- TOC entry 202 (class 1259 OID 10592455)
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
-- TOC entry 222 (class 1259 OID 10592642)
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
-- TOC entry 234 (class 1259 OID 10592837)
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
-- TOC entry 191 (class 1259 OID 10592339)
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
-- TOC entry 178 (class 1259 OID 10592185)
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
-- TOC entry 226 (class 1259 OID 10592690)
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
-- TOC entry 196 (class 1259 OID 10592401)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10592526)
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
-- TOC entry 218 (class 1259 OID 10592595)
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
-- TOC entry 198 (class 1259 OID 10592433)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10592680)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10592585)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2213 (class 2604 OID 10592179)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2865 (class 0 OID 10592231)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 10592730)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a8-fc30-7321-111911c6491c	000d0000-55a8-fc30-308d-649c0c1b26b1	\N	00090000-55a8-fc30-28d8-3f4de8cd7501	000b0000-55a8-fc30-6521-4488f2848e9a	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a8-fc30-2e41-0e4f71662d93	000d0000-55a8-fc30-b9c0-6e08399ad3e5	00100000-55a8-fc30-b63d-b4556441cbf6	00090000-55a8-fc30-0dd6-93a49b29910c	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a8-fc30-23a7-da25fe25a50c	000d0000-55a8-fc30-49bb-3a3a969f50d1	00100000-55a8-fc30-3785-3d5b4bf917f5	00090000-55a8-fc30-5fc5-7b8ecf7daac5	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a8-fc30-8180-7a8720bc85d9	000d0000-55a8-fc30-6549-683a8e49bebe	\N	00090000-55a8-fc30-06d2-73213c6d7c20	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a8-fc30-8663-035ef1bb222e	000d0000-55a8-fc30-b733-366b717b1878	\N	00090000-55a8-fc30-ad27-1404330bd38b	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a8-fc30-bef7-5a2d28cd3d9a	000d0000-55a8-fc30-54be-a73630b6f433	\N	00090000-55a8-fc30-2b77-c98d26c7a687	000b0000-55a8-fc30-2453-02cd6cf7e8df	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a8-fc30-9c6d-9f087d3cbabd	000d0000-55a8-fc30-0417-559a75e5973c	00100000-55a8-fc30-28a2-b121edc708e5	00090000-55a8-fc30-c57e-93b97b4113b5	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a8-fc30-dad3-108a1af8955b	000d0000-55a8-fc30-244b-40bf12de08bb	\N	00090000-55a8-fc30-46e2-3c3c50dec8d2	000b0000-55a8-fc30-8c88-ec5d68421b1c	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2909 (class 0 OID 10592713)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 10592625)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a8-fc30-05d4-557e7ffd0ae8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a8-fc30-2414-ed3f27e34f42	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a8-fc30-2758-0d8ea167298b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2879 (class 0 OID 10592410)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a8-fc30-903d-d74ae3ddd1ac	\N	\N	00200000-55a8-fc30-0774-058cc87e6930	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a8-fc30-fdea-4b52a5065163	\N	\N	00200000-55a8-fc30-6060-0ab6fd57d704	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a8-fc30-56c7-f253aca9b171	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a8-fc30-3711-f443129b40b2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a8-fc30-7313-e28c68ff3776	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2882 (class 0 OID 10592444)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 10592848)
-- Dependencies: 235
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 10592353)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a8-fc2e-8bc7-740349bd445b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a8-fc2e-c67c-a42a35ce7f0e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a8-fc2e-e136-7fa2187d8b17	AL	ALB	008	Albania 	Albanija	\N
00040000-55a8-fc2e-8f5d-1d1b502ca99f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a8-fc2e-9195-cdcd9cf4a3b6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a8-fc2e-1f8e-d3f08f7227ce	AD	AND	020	Andorra 	Andora	\N
00040000-55a8-fc2e-ad42-2d05ea068b17	AO	AGO	024	Angola 	Angola	\N
00040000-55a8-fc2e-301f-0070e4948e99	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a8-fc2e-e20d-0e25a299470f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a8-fc2e-f3a0-7e3fb0a4682a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-fc2e-1368-1b062cfcc89c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a8-fc2e-421d-5ddea820c77a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a8-fc2e-41b5-3bf198720ea7	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a8-fc2e-c498-b84cee36e17f	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a8-fc2e-7779-e48499ba6b76	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a8-fc2e-0d19-255e3b00a473	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a8-fc2e-dc94-bb3b2ca713b8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a8-fc2e-bf04-54741496781b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a8-fc2e-7872-01d617c75257	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a8-fc2e-b90c-e53c0f26d3a6	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a8-fc2e-b66a-f6ca052ab13f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a8-fc2e-6fb5-36e760d8c5e8	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a8-fc2e-0793-cb6f892a827a	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a8-fc2e-7daa-b453f4cf7100	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a8-fc2e-874b-d1a50b30fac7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a8-fc2e-0d04-824ec9a33c70	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a8-fc2e-0bf6-0832f2142794	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a8-fc2e-c74e-f4639f9307c1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a8-fc2e-e41f-91a89a73d585	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a8-fc2e-2eab-f3830aef24bf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a8-fc2e-03b5-a61ea87bc967	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a8-fc2e-a202-d106fe7aede1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a8-fc2e-146d-d82d02f79188	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a8-fc2e-d0dc-db741d2ed4cd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a8-fc2e-084f-7c9822d6d759	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a8-fc2e-6aff-4453661951a2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a8-fc2e-744b-8fd178ce34cf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a8-fc2e-ffab-092e7e196e08	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a8-fc2e-4170-2cb2db95828b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a8-fc2e-50ce-096e59363ba5	CA	CAN	124	Canada 	Kanada	\N
00040000-55a8-fc2e-db04-9d9a5646a0ec	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a8-fc2e-3bc4-291f0a1bf9c6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a8-fc2e-dfbc-8ab33e36938b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a8-fc2e-7ce7-80d7bb96b00c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a8-fc2e-ffb0-a79465d0c8a3	CL	CHL	152	Chile 	Čile	\N
00040000-55a8-fc2e-e031-1d9895c15f0f	CN	CHN	156	China 	Kitajska	\N
00040000-55a8-fc2e-b284-a45e9eb387a2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a8-fc2e-8521-2c5f9dbfb82d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a8-fc2e-3b82-32928c2e6c62	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a8-fc2e-d5f1-f3460021ac9a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a8-fc2e-c42c-65e05196404d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a8-fc2e-030d-554eeefc6476	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a8-fc2e-8402-69e9b854776a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a8-fc2e-d251-f7234700f623	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a8-fc2e-8eaa-35f1a057673f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a8-fc2e-d46d-b1423491f983	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a8-fc2e-e34d-f4a6201026f4	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a8-fc2e-e19e-011d8a933fa1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a8-fc2e-2143-18dc8aaf6792	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a8-fc2e-6f2c-652a3a0bc606	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a8-fc2e-2a35-9b5fd02267d3	DK	DNK	208	Denmark 	Danska	\N
00040000-55a8-fc2e-15e8-e72631f55688	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a8-fc2e-2dbb-8dc519adc46a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a8-fc2e-7042-39d5ee8bd431	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a8-fc2e-c40d-041e11655096	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a8-fc2e-c6e5-83897269f60d	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a8-fc2e-ab06-b7eac2f842cb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a8-fc2e-47c7-ad0bb48f12fe	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a8-fc2e-68c8-66f69bebf2c9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a8-fc2e-39cc-13756ac2502c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a8-fc2e-a298-337a1425bb95	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a8-fc2e-e81c-e187b81276fc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a8-fc2e-4b16-592235b4aed8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a8-fc2e-d785-d1598663ebeb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a8-fc2e-14b0-e7d7beb56f4d	FI	FIN	246	Finland 	Finska	\N
00040000-55a8-fc2e-52a2-57268b22373b	FR	FRA	250	France 	Francija	\N
00040000-55a8-fc2e-a447-a3dbecbce42a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a8-fc2e-29c6-9889b2949732	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a8-fc2e-8348-00324e23c014	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a8-fc2e-f7b2-2ef037a1b8d5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a8-fc2e-ab70-fe064ec5a1a3	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a8-fc2e-7a09-fa17d8bb4534	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a8-fc2e-a277-0d1b867943ab	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a8-fc2e-b257-dc635de0c768	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a8-fc2e-3420-9e294e18086e	GH	GHA	288	Ghana 	Gana	\N
00040000-55a8-fc2e-b83d-203b0d0c4b48	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a8-fc2e-65ef-31feb3745433	GR	GRC	300	Greece 	Grčija	\N
00040000-55a8-fc2e-95dd-55fa2f94fe48	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a8-fc2e-2972-0d50ddea3355	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a8-fc2e-d177-f30c81594c6d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a8-fc2e-8ec6-2dcd8106af86	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a8-fc2e-5100-5afe17d9b2b4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a8-fc2e-aed7-efe69e969697	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a8-fc2e-4107-94f6a97e08c6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a8-fc2e-c8e2-951ad0f84f21	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a8-fc2e-c748-61e18f904edf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a8-fc2e-22a5-a72500ab4368	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a8-fc2e-9812-2ea21ab940cd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a8-fc2e-1511-0c501f21bbba	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a8-fc2e-8903-7d8bf28c65ea	HN	HND	340	Honduras 	Honduras	\N
00040000-55a8-fc2e-a44c-055562c10ae8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a8-fc2e-e780-1bbcb6b11840	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a8-fc2e-7d89-2d923a31cfd6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a8-fc2e-9615-8627a71617d6	IN	IND	356	India 	Indija	\N
00040000-55a8-fc2e-b862-2d594c7f21cb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a8-fc2e-71b2-3791c20dc473	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a8-fc2e-17c7-48dae5d92f37	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a8-fc2e-a144-686d8224ea4a	IE	IRL	372	Ireland 	Irska	\N
00040000-55a8-fc2e-d549-78e5dff9a8d9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a8-fc2e-bb75-3436b3d3f707	IL	ISR	376	Israel 	Izrael	\N
00040000-55a8-fc2e-1efe-293a4016a771	IT	ITA	380	Italy 	Italija	\N
00040000-55a8-fc2e-a005-54f2f74258d0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a8-fc2e-b610-856d6d745ca4	JP	JPN	392	Japan 	Japonska	\N
00040000-55a8-fc2e-7346-8a4ef202db01	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a8-fc2e-7036-c015aae91dd3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a8-fc2e-8543-2949384f2d17	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a8-fc2e-dc61-7db1958f66f2	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a8-fc2e-8281-0fb3e8466507	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a8-fc2e-28c7-50fb28d29f89	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a8-fc2e-5e82-dae3762a9f11	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a8-fc2e-7ec7-81d610e019af	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a8-fc2e-c166-2d85bea4dd61	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a8-fc2e-9052-9222d7ed278b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a8-fc2e-c6b0-2a1d679af8f8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a8-fc2e-cf06-944bc192bb1e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a8-fc2e-ee99-a90f909f1aeb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a8-fc2e-f8b0-ae5554d22940	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a8-fc2e-6642-d6bca901c708	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a8-fc2e-0575-35fd0620f440	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a8-fc2e-d04d-3cb13df19b41	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a8-fc2e-b107-604933e78c6f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a8-fc2e-8db7-e04c955985c9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a8-fc2e-764c-1e5ffd9b5673	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a8-fc2e-694e-b60812481892	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a8-fc2e-97d4-31999eda3667	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a8-fc2e-1f65-ebcc0ce94463	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a8-fc2e-2985-f9fc4a2d7fe0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a8-fc2e-2d8b-28dacf0d509b	ML	MLI	466	Mali 	Mali	\N
00040000-55a8-fc2e-1b25-cb3018c5002e	MT	MLT	470	Malta 	Malta	\N
00040000-55a8-fc2e-4e6f-dd4dbfb56e8e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a8-fc2e-f1dc-84faf9a18901	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a8-fc2e-37f4-643363021560	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a8-fc2e-49b4-f544060625bb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a8-fc2e-88d2-2a3adb9f1981	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a8-fc2e-f85f-9e41f435151e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a8-fc2e-6152-6ff37ca4814e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a8-fc2e-6dd2-1e18c45327c7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a8-fc2e-e8a9-b91431c7a9ae	MC	MCO	492	Monaco 	Monako	\N
00040000-55a8-fc2e-65f6-bc1e410c3e9d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a8-fc2e-a59c-535bb6b317dc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a8-fc2e-ce1e-cecf30e1805b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a8-fc2e-a105-2f51e8af0120	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a8-fc2e-cabc-f23ecb680417	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a8-fc2e-9b9d-60406a5c2c5a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a8-fc2e-f956-58a5dfb406c1	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a8-fc2e-7510-e40589f9f5ef	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a8-fc2e-0435-785f3617e2b2	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a8-fc2e-47ef-738da176915e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a8-fc2e-2c11-542dea5ed412	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a8-fc2e-411f-19570dca17cf	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a8-fc2e-7173-c817979cb1d4	NE	NER	562	Niger 	Niger 	\N
00040000-55a8-fc2e-79c8-28c069340f19	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a8-fc2e-8b68-1bd565bde0d3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a8-fc2e-6a71-18ba0415bb4b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a8-fc2e-64db-9ceebfb96426	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a8-fc2e-0365-49367d7d0887	NO	NOR	578	Norway 	Norveška	\N
00040000-55a8-fc2e-35c1-4ddc84056c45	OM	OMN	512	Oman 	Oman	\N
00040000-55a8-fc2e-5c8b-7f7cb4ae9f65	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a8-fc2e-9372-6e7a255cdb22	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a8-fc2e-d0d0-f6bf2f72da88	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a8-fc2e-308e-cad5fcc59ab1	PA	PAN	591	Panama 	Panama	\N
00040000-55a8-fc2e-b6d3-dee622aa07d2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a8-fc2e-8b00-e5409a677e23	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a8-fc2e-d1b4-980eaabb2ea4	PE	PER	604	Peru 	Peru	\N
00040000-55a8-fc2e-3cf3-d07bfd41897c	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a8-fc2e-9db6-6776a39b2fe2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a8-fc2e-9ef5-4c1cc47b17a4	PL	POL	616	Poland 	Poljska	\N
00040000-55a8-fc2e-5a09-aab56efa5bcf	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a8-fc2e-6d86-c4a261cb853f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a8-fc2e-732f-cb8a8e0160e8	QA	QAT	634	Qatar 	Katar	\N
00040000-55a8-fc2e-4cc1-d9b03cf48015	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a8-fc2e-2f73-172c6c1de14e	RO	ROU	642	Romania 	Romunija	\N
00040000-55a8-fc2e-5b35-9c0d66880878	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a8-fc2e-62d1-9e1f01746d15	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a8-fc2e-b66c-a71a7efb7fbe	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a8-fc2e-1641-1faba45b9e33	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a8-fc2e-91f5-182fe334f930	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a8-fc2e-a332-8f4e0d0474f0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a8-fc2e-528b-7bd51f451446	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a8-fc2e-edd7-e088cc2af37c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a8-fc2e-bcf0-0fe88234a9a2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a8-fc2e-4b44-5714e1f0b5d8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a8-fc2e-6d7e-013e9c5155c8	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a8-fc2e-1f4d-fb847dd332ab	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a8-fc2e-2c70-f25e7aaadeca	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a8-fc2e-624c-9acfbb2b934f	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a8-fc2e-bd1b-32c55e32e9a4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a8-fc2e-1a82-a54b9fce69d8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a8-fc2e-fc9c-df18676f6b27	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a8-fc2e-7c18-14f3f0d2db87	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a8-fc2e-2b67-f1e0ae2b740f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a8-fc2e-350d-ad69c555312e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a8-fc2e-377c-ee3fab85db4b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a8-fc2e-1a9a-e716ae735740	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a8-fc2e-8d7f-b60ac352d363	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a8-fc2e-3433-abc6db4b011d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a8-fc2e-21c3-8746763fd8ae	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a8-fc2e-3840-97e25dc50f92	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a8-fc2e-4347-0b7f35969d52	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a8-fc2e-ca13-4845d2c9e626	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a8-fc2e-4ef1-05948ef1d033	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a8-fc2e-b721-f9027e61b8c4	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a8-fc2e-6848-17eddb4a5f07	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a8-fc2e-50d6-cdb23c40ea25	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a8-fc2e-8134-0e9612867a2c	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a8-fc2e-b84c-8a363f955f36	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a8-fc2e-6a06-b69a30b1e896	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a8-fc2e-36c1-71e423a458c0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a8-fc2e-f1b4-c600cd77fa50	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a8-fc2e-157b-84977650859f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a8-fc2e-d86a-ab3e48591703	TH	THA	764	Thailand 	Tajska	\N
00040000-55a8-fc2e-3333-9345e50d5624	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a8-fc2e-58a5-8a587d16e7d5	TG	TGO	768	Togo 	Togo	\N
00040000-55a8-fc2e-73bb-52718f7f27f5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a8-fc2e-ed00-9eb791b56e5f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a8-fc2e-4878-62421491c06c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a8-fc2e-7e2d-b5d1652a1678	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a8-fc2e-3f7a-878987405d51	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a8-fc2e-8037-56a717595a58	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a8-fc2e-920b-b1d187c07996	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-fc2e-6a44-6abb47411157	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a8-fc2e-4129-f0e34873ece9	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a8-fc2e-0be0-7d5bd41e0a46	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a8-fc2e-d699-20779a34027a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a8-fc2e-155b-af22cd2109d0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a8-fc2e-219b-908a9209aab2	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a8-fc2e-b4a2-ba263a2caebc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a8-fc2e-1f04-e00653ad46e6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a8-fc2e-1526-95d7d20bc432	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a8-fc2e-ff46-f0b3cb83f98f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a8-fc2e-276c-69b763e7be6d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a8-fc2e-6a86-7e80909ea3ff	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a8-fc2e-1f28-4622be6ba9ce	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a8-fc2e-cddf-d2cbe45d8367	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a8-fc2e-a05d-93995cef6948	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a8-fc2e-badc-8d6c554ba5dd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a8-fc2e-d157-95680e6e1b10	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a8-fc2e-c98b-f229bcc3483b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a8-fc2e-35cc-47bccba238fc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2911 (class 0 OID 10592743)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, avtorskepravice, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a8-fc30-6fe8-8c634291461b	000e0000-55a8-fc30-f0b6-dd1e3d3c64a5	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	200.30	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0	Raznovrstni dogodek		\N	002b0000-55a8-fc2f-fa23-1725016ce1f0	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a8-fc30-ddc1-4b27b9fe49c1	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	200.20	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a8-fc2f-1982-feb10f2c832c	premiera	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-fc30-867d-11a46d27fa30	\N	\N	\N	300.00	300.00	0.00	0.00	20.00	60.00	200.11	0.00	0.00	0.00	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0		Urejanje portala	10	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55a8-fc30-2a91-24d4d6975a5c	\N	\N	\N	203.00	203.00	0.00	0.00	30.00	60.90	100.22	0.00	0.00	0.00	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0		Delavnice otroci	8	\N	razno	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 10592570)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a8-fc30-0417-559a75e5973c	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a8-fc2f-ef49-dcbec3ea3a2a
000d0000-55a8-fc30-308d-649c0c1b26b1	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-fc2f-ef49-dcbec3ea3a2a
000d0000-55a8-fc30-b9c0-6e08399ad3e5	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a8-fc2f-a35b-879a52c82fcf
000d0000-55a8-fc30-49bb-3a3a969f50d1	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a8-fc2f-4d0b-337bced186fa
000d0000-55a8-fc30-6549-683a8e49bebe	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a8-fc2f-4d0b-337bced186fa
000d0000-55a8-fc30-b733-366b717b1878	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a8-fc2f-4d0b-337bced186fa
000d0000-55a8-fc30-54be-a73630b6f433	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a8-fc2f-ef49-dcbec3ea3a2a
000d0000-55a8-fc30-244b-40bf12de08bb	000e0000-55a8-fc30-faf2-f9eb655955a9	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a8-fc2f-ae1d-4616fb15c858
\.


--
-- TOC entry 2877 (class 0 OID 10592390)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10592438)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10592370)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a8-fc30-9e00-c3b4cfd56118	00080000-55a8-fc30-0f3f-66d622779419	00090000-55a8-fc30-4e3d-3502e0bc1003	AK		
\.


--
-- TOC entry 2852 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 10592487)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 10592512)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 10592327)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a8-fc2e-a4c5-b1402c7e99ea	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a8-fc2e-dbae-7053ade92fab	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a8-fc2e-a5d5-8a1f26d67e9d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a8-fc2e-d8f9-b9e1726fc0d2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a8-fc2e-7ce0-3e138c8ed55e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a8-fc2e-6878-9bc2ef45278f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a8-fc2e-e41f-81298ff8ad1c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a8-fc2e-ee00-b94eeb009b23	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-fc2e-5e04-8674445a8ebf	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a8-fc2e-4f57-cd72cdbd4bfb	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a8-fc2e-71a8-64ad51b20882	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a8-fc2e-a3d6-4d8ec7a2785b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a8-fc2e-9555-4b197a84fd73	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55a8-fc30-555e-0efaade14cda	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a8-fc30-f8d2-173bbc6d49ad	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a8-fc30-09cd-0333cce345a5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a8-fc30-4da0-49f52b55992c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a8-fc30-0c5e-cc2e9a72615e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a8-fc30-f5f8-5203e59fc04b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2866 (class 0 OID 10592240)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a8-fc30-a5f9-5faad7d62a0c	00000000-55a8-fc30-f8d2-173bbc6d49ad	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a8-fc30-1201-c8fa55654438	00000000-55a8-fc30-f8d2-173bbc6d49ad	00010000-55a8-fc2e-10e1-f20eb28784c6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a8-fc30-e94d-5399eacdf631	00000000-55a8-fc30-09cd-0333cce345a5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2867 (class 0 OID 10592251)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a8-fc30-28d8-3f4de8cd7501	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a8-fc30-06d2-73213c6d7c20	00010000-55a8-fc30-8932-5753df6036d3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a8-fc30-5fc5-7b8ecf7daac5	00010000-55a8-fc30-7513-d3c9b294d323	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a8-fc30-791c-8af2b88a1323	00010000-55a8-fc30-bbf2-d717b09ba421	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a8-fc30-057b-72244278b513	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a8-fc30-2b77-c98d26c7a687	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a8-fc30-f7d9-a41ce41634aa	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a8-fc30-c57e-93b97b4113b5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a8-fc30-4e3d-3502e0bc1003	00010000-55a8-fc30-3f44-52b70f1c8a9c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a8-fc30-0dd6-93a49b29910c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a8-fc30-4944-c928b6836aae	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a8-fc30-ad27-1404330bd38b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a8-fc30-46e2-3c3c50dec8d2	00010000-55a8-fc30-1dac-f393ed284649	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2854 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10592205)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a8-fc2e-2ecb-ff09c7c0f261	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a8-fc2e-6014-54290bf7e50e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a8-fc2e-26b5-244969994a51	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a8-fc2e-4abc-7b41ed1d6b15	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a8-fc2e-bd02-60735984d177	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a8-fc2e-3177-e153447bfaa3	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a8-fc2e-5e2f-f5cf86a37756	Abonma-read	Abonma - branje	f
00030000-55a8-fc2e-8cd9-ad50ac59ab7a	Abonma-write	Abonma - spreminjanje	f
00030000-55a8-fc2e-455f-21b350a421d9	Alternacija-read	Alternacija - branje	f
00030000-55a8-fc2e-11da-c4e2480d301b	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a8-fc2e-9ebe-cea59843a078	Arhivalija-read	Arhivalija - branje	f
00030000-55a8-fc2e-fa5e-08778b1a57a8	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a8-fc2e-c0b8-9fb6ab8e449f	Besedilo-read	Besedilo - branje	f
00030000-55a8-fc2e-3506-ef1f0145f5c8	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a8-fc2e-a538-ffd77cdfd0d1	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a8-fc2e-2feb-237818d37394	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a8-fc2e-0698-bc0edb5dcebc	Dogodek-read	Dogodek - branje	f
00030000-55a8-fc2e-31c9-995df28f4c47	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a8-fc2e-ab32-5f55a4220090	DrugiVir-read	DrugiVir - branje	f
00030000-55a8-fc2e-655b-2586c2755dea	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a8-fc2e-1d6b-ea5b5a532a79	Drzava-read	Drzava - branje	f
00030000-55a8-fc2e-0ffa-40361d38f05c	Drzava-write	Drzava - spreminjanje	f
00030000-55a8-fc2e-b211-87e625ad241d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a8-fc2e-f7b6-fa6a323a9efb	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a8-fc2e-06c1-ddbda5611667	Funkcija-read	Funkcija - branje	f
00030000-55a8-fc2e-d66a-103354c14c09	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a8-fc2e-6666-4c7fe399614f	Gostovanje-read	Gostovanje - branje	f
00030000-55a8-fc2e-33a4-bf1339cf174a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a8-fc2e-c9fd-0abbb15435e1	Gostujoca-read	Gostujoca - branje	f
00030000-55a8-fc2e-20d3-aace82e70b63	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a8-fc2e-3869-fa547382d525	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a8-fc2e-34f0-86c791051787	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a8-fc2e-bac2-881974e34a69	Kupec-read	Kupec - branje	f
00030000-55a8-fc2e-516d-fcfd366f4020	Kupec-write	Kupec - spreminjanje	f
00030000-55a8-fc2e-b6d7-ab12afb9f964	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a8-fc2e-7e82-afa708d9ec04	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a8-fc2e-ca7a-35c987c350cf	Option-read	Option - branje	f
00030000-55a8-fc2e-5d5f-95c11c4d55ed	Option-write	Option - spreminjanje	f
00030000-55a8-fc2e-73de-1fdc82e527e3	OptionValue-read	OptionValue - branje	f
00030000-55a8-fc2e-5fa4-c56cc658ef2d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a8-fc2e-74df-e2912256ec06	Oseba-read	Oseba - branje	f
00030000-55a8-fc2e-621f-b82b7e7a04f3	Oseba-write	Oseba - spreminjanje	f
00030000-55a8-fc2e-f4dc-03887663fa3e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a8-fc2e-46e1-0b0cf8fa33ad	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a8-fc2e-7e31-cd39661cb495	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a8-fc2e-7adb-47b954d4900c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a8-fc2e-cc61-37ac9bf94424	Pogodba-read	Pogodba - branje	f
00030000-55a8-fc2e-f3a9-44220b7f3ce5	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a8-fc2e-67fa-5f2a8ec5be33	Popa-read	Popa - branje	f
00030000-55a8-fc2e-ece6-34d5716eb58d	Popa-write	Popa - spreminjanje	f
00030000-55a8-fc2e-16dc-c973df13c8f9	Posta-read	Posta - branje	f
00030000-55a8-fc2e-ca29-8822818cc223	Posta-write	Posta - spreminjanje	f
00030000-55a8-fc2e-e323-acbd78368a6a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a8-fc2e-b305-f90ef040b9bf	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a8-fc2e-10cf-49d1384cc8a2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a8-fc2e-749c-ca3264a2f028	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a8-fc2e-c492-e308e1dc6ac7	Predstava-read	Predstava - branje	f
00030000-55a8-fc2e-3e35-02b041c2ee24	Predstava-write	Predstava - spreminjanje	f
00030000-55a8-fc2e-e718-bea1de462567	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a8-fc2e-8199-545d473cedb7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a8-fc2e-7e37-cfec1620e95b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a8-fc2e-5693-390fec385dc9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a8-fc2e-5e5a-7111add99861	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a8-fc2e-14a3-041cf009d2a3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a8-fc2e-993d-d4c1f8fa5ee7	ProgramDela-read	ProgramDela - branje	f
00030000-55a8-fc2e-e63d-164dfe369b03	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a8-fc2e-2c0f-096c60dfba5f	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a8-fc2e-52b3-10c0a169479f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a8-fc2e-ecd0-98cd97bc2fe0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a8-fc2e-f044-9b9964cd725b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a8-fc2e-d5ce-a4f05ae7536a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a8-fc2e-3469-747e6c5b4510	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a8-fc2e-2e11-e43518d68df7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a8-fc2e-a327-6dfdab911457	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a8-fc2e-37d2-076e4ffa0812	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a8-fc2e-fbf3-23916684a502	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a8-fc2e-e206-95eb1d36b09d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a8-fc2e-559d-c24b9a20b171	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a8-fc2e-0a7f-0cd82ae77113	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a8-fc2e-8470-803137afecde	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a8-fc2e-9086-e53ae46e9655	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a8-fc2e-ab00-3ebd088248cb	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a8-fc2e-a3e5-32bfdc777a4d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55a8-fc2e-4eb3-5e23748a342f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55a8-fc2e-a914-1b2182fb1f5a	Prostor-read	Prostor - branje	f
00030000-55a8-fc2e-ea5a-7e9e8023e07f	Prostor-write	Prostor - spreminjanje	f
00030000-55a8-fc2e-7f85-20bd75f01c3f	Racun-read	Racun - branje	f
00030000-55a8-fc2e-a749-29fb3b48ea63	Racun-write	Racun - spreminjanje	f
00030000-55a8-fc2e-dfde-df54e2f66e13	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a8-fc2e-9649-ef202e3a8639	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a8-fc2e-0a6a-742818163c62	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a8-fc2e-33a4-75530791abcf	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a8-fc2e-6cf6-5de2b947679e	Rekvizit-read	Rekvizit - branje	f
00030000-55a8-fc2e-4c51-eef453fe00b6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a8-fc2e-4638-c7b04f695a3d	Revizija-read	Revizija - branje	f
00030000-55a8-fc2e-5e50-83b8440789dd	Revizija-write	Revizija - spreminjanje	f
00030000-55a8-fc2e-f20e-a4d268eceb0f	Rezervacija-read	Rezervacija - branje	f
00030000-55a8-fc2e-30a8-b0f8fe5aedc6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a8-fc2e-b772-d0d91400daed	SedezniRed-read	SedezniRed - branje	f
00030000-55a8-fc2e-dcf4-31390d97eeb0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a8-fc2e-7ce4-96bb07ef612d	Sedez-read	Sedez - branje	f
00030000-55a8-fc2e-22b7-48181dc3b3ad	Sedez-write	Sedez - spreminjanje	f
00030000-55a8-fc2e-d7e0-f3fdbd3637d6	Sezona-read	Sezona - branje	f
00030000-55a8-fc2e-f025-b3c693a369bc	Sezona-write	Sezona - spreminjanje	f
00030000-55a8-fc2e-7ee9-8640808dffb4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a8-fc2e-057b-fa278ad0f013	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a8-fc2e-87e7-040db6c40ae2	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a8-fc2e-7a73-4e00e21e35a8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a8-fc2e-b4da-3f773d7df423	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a8-fc2e-9ccb-c63c2385ac7d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a8-fc2e-9142-c1ac640a6136	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a8-fc2e-755e-9d43dd80c2fb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a8-fc2e-f53e-8dc9f1a539d3	Telefonska-read	Telefonska - branje	f
00030000-55a8-fc2e-961b-64c22d48613f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a8-fc2e-48ab-a80bfc025ba9	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a8-fc2e-58ac-f312d7f885f8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a8-fc2e-d60a-f7b06405d783	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a8-fc2e-bf22-4fc1d96d2327	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a8-fc2e-b263-7c9a42cdd30b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a8-fc2e-fcd4-11242787db76	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a8-fc2e-6388-e2a0dc85100b	Trr-read	Trr - branje	f
00030000-55a8-fc2e-63eb-fa28ca7bb5a5	Trr-write	Trr - spreminjanje	f
00030000-55a8-fc2e-6ba0-35911326f7e7	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a8-fc2e-b214-ca577b15bcfe	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a8-fc2e-d620-bae2eaa5beb1	Vaja-read	Vaja - branje	f
00030000-55a8-fc2e-8f7b-f08efeb3ee68	Vaja-write	Vaja - spreminjanje	f
00030000-55a8-fc2e-818d-b1dda2adb101	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a8-fc2e-714b-a7e22a2ea5ee	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a8-fc2e-d8e7-748fc56ba9d0	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a8-fc2e-68b6-8a4032fdd78e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a8-fc2e-1ccf-89bbebe245d2	Zasedenost-read	Zasedenost - branje	f
00030000-55a8-fc2e-8f3f-f9757b2d3997	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a8-fc2e-4f29-5b61836338c1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a8-fc2e-7f84-9990a1ec19c4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a8-fc2e-496e-10be31263496	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a8-fc2e-fdac-a225917d7a5f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2864 (class 0 OID 10592224)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a8-fc2e-f9bd-6b10dea3c9bf	00030000-55a8-fc2e-6014-54290bf7e50e
00020000-55a8-fc2e-edb2-93da55ea0244	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-8cd9-ad50ac59ab7a
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-455f-21b350a421d9
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-11da-c4e2480d301b
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-4abc-7b41ed1d6b15
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-31c9-995df28f4c47
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-0ffa-40361d38f05c
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-06c1-ddbda5611667
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-d66a-103354c14c09
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-33a4-bf1339cf174a
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-20d3-aace82e70b63
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-3869-fa547382d525
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-34f0-86c791051787
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-74df-e2912256ec06
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-621f-b82b7e7a04f3
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-ece6-34d5716eb58d
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-ca29-8822818cc223
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-10cf-49d1384cc8a2
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-749c-ca3264a2f028
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-3e35-02b041c2ee24
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-5e5a-7111add99861
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-14a3-041cf009d2a3
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-ea5a-7e9e8023e07f
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-33a4-75530791abcf
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-4c51-eef453fe00b6
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-f025-b3c693a369bc
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-d60a-f7b06405d783
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-6ba0-35911326f7e7
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-b214-ca577b15bcfe
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-d620-bae2eaa5beb1
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-8f7b-f08efeb3ee68
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-1ccf-89bbebe245d2
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-8f3f-f9757b2d3997
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-3869-fa547382d525
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-34f0-86c791051787
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-74df-e2912256ec06
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-621f-b82b7e7a04f3
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-10cf-49d1384cc8a2
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-749c-ca3264a2f028
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-f53e-8dc9f1a539d3
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-961b-64c22d48613f
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-6388-e2a0dc85100b
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-63eb-fa28ca7bb5a5
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-d8e7-748fc56ba9d0
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-68b6-8a4032fdd78e
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc2e-ba9e-32d9e69e6be7	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-455f-21b350a421d9
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-fa5e-08778b1a57a8
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-c0b8-9fb6ab8e449f
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-a538-ffd77cdfd0d1
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-06c1-ddbda5611667
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-3869-fa547382d525
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-74df-e2912256ec06
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-5e5a-7111add99861
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-d60a-f7b06405d783
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-d620-bae2eaa5beb1
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-1ccf-89bbebe245d2
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc2e-f419-1cae6206ce71	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-8cd9-ad50ac59ab7a
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-11da-c4e2480d301b
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-d60a-f7b06405d783
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc2e-dcb1-179485a42329	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-48ab-a80bfc025ba9
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-26b5-244969994a51
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-d60a-f7b06405d783
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc2e-77a7-a0c23328b14e	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-2ecb-ff09c7c0f261
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-6014-54290bf7e50e
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-26b5-244969994a51
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-4abc-7b41ed1d6b15
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-bd02-60735984d177
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-3177-e153447bfaa3
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5e2f-f5cf86a37756
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-8cd9-ad50ac59ab7a
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-455f-21b350a421d9
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-11da-c4e2480d301b
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-9ebe-cea59843a078
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-fa5e-08778b1a57a8
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-c0b8-9fb6ab8e449f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-3506-ef1f0145f5c8
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-a538-ffd77cdfd0d1
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-2feb-237818d37394
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-0698-bc0edb5dcebc
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-31c9-995df28f4c47
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-1d6b-ea5b5a532a79
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-0ffa-40361d38f05c
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ab32-5f55a4220090
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-655b-2586c2755dea
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b211-87e625ad241d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f7b6-fa6a323a9efb
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-06c1-ddbda5611667
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d66a-103354c14c09
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-6666-4c7fe399614f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-33a4-bf1339cf174a
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-c9fd-0abbb15435e1
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-20d3-aace82e70b63
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-3869-fa547382d525
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-34f0-86c791051787
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-bac2-881974e34a69
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-516d-fcfd366f4020
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b6d7-ab12afb9f964
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7e82-afa708d9ec04
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ca7a-35c987c350cf
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5d5f-95c11c4d55ed
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-73de-1fdc82e527e3
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5fa4-c56cc658ef2d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-74df-e2912256ec06
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-621f-b82b7e7a04f3
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f4dc-03887663fa3e
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-46e1-0b0cf8fa33ad
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7e31-cd39661cb495
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7adb-47b954d4900c
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-cc61-37ac9bf94424
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f3a9-44220b7f3ce5
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-67fa-5f2a8ec5be33
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ece6-34d5716eb58d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-16dc-c973df13c8f9
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ca29-8822818cc223
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-e323-acbd78368a6a
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b305-f90ef040b9bf
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-10cf-49d1384cc8a2
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-749c-ca3264a2f028
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-c492-e308e1dc6ac7
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-3e35-02b041c2ee24
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-e718-bea1de462567
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-8199-545d473cedb7
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7e37-cfec1620e95b
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5693-390fec385dc9
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5e5a-7111add99861
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-14a3-041cf009d2a3
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-993d-d4c1f8fa5ee7
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-e63d-164dfe369b03
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-2c0f-096c60dfba5f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-52b3-10c0a169479f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ecd0-98cd97bc2fe0
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f044-9b9964cd725b
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d5ce-a4f05ae7536a
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-3469-747e6c5b4510
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-2e11-e43518d68df7
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-a327-6dfdab911457
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-37d2-076e4ffa0812
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-fbf3-23916684a502
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-e206-95eb1d36b09d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-559d-c24b9a20b171
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-0a7f-0cd82ae77113
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-8470-803137afecde
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-9086-e53ae46e9655
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ab00-3ebd088248cb
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-a3e5-32bfdc777a4d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-4eb3-5e23748a342f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-a914-1b2182fb1f5a
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-ea5a-7e9e8023e07f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7f85-20bd75f01c3f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-a749-29fb3b48ea63
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-dfde-df54e2f66e13
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-9649-ef202e3a8639
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-0a6a-742818163c62
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-33a4-75530791abcf
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-6cf6-5de2b947679e
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-4c51-eef453fe00b6
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-4638-c7b04f695a3d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-5e50-83b8440789dd
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f20e-a4d268eceb0f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-30a8-b0f8fe5aedc6
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b772-d0d91400daed
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-dcf4-31390d97eeb0
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7ce4-96bb07ef612d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-22b7-48181dc3b3ad
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d7e0-f3fdbd3637d6
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f025-b3c693a369bc
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7ee9-8640808dffb4
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-057b-fa278ad0f013
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-87e7-040db6c40ae2
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7a73-4e00e21e35a8
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b4da-3f773d7df423
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-9ccb-c63c2385ac7d
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-9142-c1ac640a6136
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-755e-9d43dd80c2fb
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-f53e-8dc9f1a539d3
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-961b-64c22d48613f
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-48ab-a80bfc025ba9
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-58ac-f312d7f885f8
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d60a-f7b06405d783
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-bf22-4fc1d96d2327
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b263-7c9a42cdd30b
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-fcd4-11242787db76
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-6388-e2a0dc85100b
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-63eb-fa28ca7bb5a5
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-6ba0-35911326f7e7
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-b214-ca577b15bcfe
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d620-bae2eaa5beb1
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-8f7b-f08efeb3ee68
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-818d-b1dda2adb101
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-714b-a7e22a2ea5ee
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-d8e7-748fc56ba9d0
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-68b6-8a4032fdd78e
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-1ccf-89bbebe245d2
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-8f3f-f9757b2d3997
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-4f29-5b61836338c1
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-7f84-9990a1ec19c4
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-496e-10be31263496
00020000-55a8-fc30-30e3-c46719da9d66	00030000-55a8-fc2e-fdac-a225917d7a5f
\.


--
-- TOC entry 2892 (class 0 OID 10592519)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 10592550)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10592664)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55a8-fc30-6521-4488f2848e9a	00090000-55a8-fc30-28d8-3f4de8cd7501	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55a8-fc30-2453-02cd6cf7e8df	00090000-55a8-fc30-2b77-c98d26c7a687	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55a8-fc30-8c88-ec5d68421b1c	00090000-55a8-fc30-46e2-3c3c50dec8d2	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2869 (class 0 OID 10592284)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a8-fc30-0f3f-66d622779419	00040000-55a8-fc2e-377c-ee3fab85db4b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-7b7c-2053eb96fdb5	00040000-55a8-fc2e-377c-ee3fab85db4b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a8-fc30-654e-ec677ab44eac	00040000-55a8-fc2e-377c-ee3fab85db4b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-8d7a-a4295cb07043	00040000-55a8-fc2e-377c-ee3fab85db4b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-a72c-c82735ed38cf	00040000-55a8-fc2e-377c-ee3fab85db4b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-14dd-7da87b62d9d1	00040000-55a8-fc2e-1368-1b062cfcc89c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-e9bc-e36f1b0f5141	00040000-55a8-fc2e-d46d-b1423491f983	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-4ee9-7f58ce1835e7	00040000-55a8-fc2e-7779-e48499ba6b76	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a8-fc30-dd50-5dc88b85beb9	00040000-55a8-fc2e-377c-ee3fab85db4b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2871 (class 0 OID 10592319)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a8-fc2e-a0ed-1d65ee9cd1df	8341	Adlešiči
00050000-55a8-fc2e-298a-8cd320a5c79b	5270	Ajdovščina
00050000-55a8-fc2e-cafb-ccb224afbba6	6280	Ankaran/Ancarano
00050000-55a8-fc2e-ba69-0c301df71f6b	9253	Apače
00050000-55a8-fc2e-c533-afd0e690f372	8253	Artiče
00050000-55a8-fc2e-779b-cd399079ce20	4275	Begunje na Gorenjskem
00050000-55a8-fc2e-e89c-91266379aed5	1382	Begunje pri Cerknici
00050000-55a8-fc2e-046f-32206ed49c7f	9231	Beltinci
00050000-55a8-fc2e-edb9-08bc01e4513d	2234	Benedikt
00050000-55a8-fc2e-5304-098bd01dbc8a	2345	Bistrica ob Dravi
00050000-55a8-fc2e-9ba1-5524423c134c	3256	Bistrica ob Sotli
00050000-55a8-fc2e-f2fc-052bbbc3283e	8259	Bizeljsko
00050000-55a8-fc2e-84ff-a558f2e7ec69	1223	Blagovica
00050000-55a8-fc2e-47cd-fdfeee2cf4bf	8283	Blanca
00050000-55a8-fc2e-b2df-c8b6ec974cc0	4260	Bled
00050000-55a8-fc2e-b7d1-1bee0ac07a82	4273	Blejska Dobrava
00050000-55a8-fc2e-e4ba-6e2506a57f73	9265	Bodonci
00050000-55a8-fc2e-b690-30b90682bc4b	9222	Bogojina
00050000-55a8-fc2e-5c3d-a12bf0ffe525	4263	Bohinjska Bela
00050000-55a8-fc2e-d94f-f977536b9822	4264	Bohinjska Bistrica
00050000-55a8-fc2e-fbd0-39552697afda	4265	Bohinjsko jezero
00050000-55a8-fc2e-dc21-543a109d371d	1353	Borovnica
00050000-55a8-fc2e-e196-c8684f932a2e	8294	Boštanj
00050000-55a8-fc2e-9d28-7534b740ee80	5230	Bovec
00050000-55a8-fc2e-049d-9acf5162a465	5295	Branik
00050000-55a8-fc2e-18c5-70c540680aef	3314	Braslovče
00050000-55a8-fc2e-0c1e-9be126b32475	5223	Breginj
00050000-55a8-fc2e-681c-9f680cba8b21	8280	Brestanica
00050000-55a8-fc2e-697d-f5d3a6935276	2354	Bresternica
00050000-55a8-fc2e-3b42-5f1d4403deab	4243	Brezje
00050000-55a8-fc2e-aab0-795fb11755b3	1351	Brezovica pri Ljubljani
00050000-55a8-fc2e-c68a-b3957eebae0a	8250	Brežice
00050000-55a8-fc2e-0c16-4f60faaae8bc	4210	Brnik - Aerodrom
00050000-55a8-fc2e-c705-48f192d07cc5	8321	Brusnice
00050000-55a8-fc2e-33d6-3bc6424407d1	3255	Buče
00050000-55a8-fc2e-2e45-7a0e65e6b46a	8276	Bučka 
00050000-55a8-fc2e-e725-7347c4266561	9261	Cankova
00050000-55a8-fc2e-91ed-1504255a176a	3000	Celje 
00050000-55a8-fc2e-dda1-3c6a95de3de2	3001	Celje - poštni predali
00050000-55a8-fc2e-33ac-41d7ae21b119	4207	Cerklje na Gorenjskem
00050000-55a8-fc2e-521f-d3a055a556ef	8263	Cerklje ob Krki
00050000-55a8-fc2e-7185-0cfb62155ef4	1380	Cerknica
00050000-55a8-fc2e-25ef-6ab719003424	5282	Cerkno
00050000-55a8-fc2e-5c06-435ddee58809	2236	Cerkvenjak
00050000-55a8-fc2e-4efa-920db2cc3f5e	2215	Ceršak
00050000-55a8-fc2e-fc8f-875ada07c350	2326	Cirkovce
00050000-55a8-fc2e-bc71-20bb69abd71a	2282	Cirkulane
00050000-55a8-fc2e-338f-9ba2a6c46f02	5273	Col
00050000-55a8-fc2e-94d6-ae67365a6504	8251	Čatež ob Savi
00050000-55a8-fc2e-97b8-01f2dbea058d	1413	Čemšenik
00050000-55a8-fc2e-04df-183830995075	5253	Čepovan
00050000-55a8-fc2e-1fa8-37d106d45fec	9232	Črenšovci
00050000-55a8-fc2e-fca5-67d685993b51	2393	Črna na Koroškem
00050000-55a8-fc2e-ee27-52837deb5564	6275	Črni Kal
00050000-55a8-fc2e-0329-bab177f9d888	5274	Črni Vrh nad Idrijo
00050000-55a8-fc2e-2bd9-2273357c2e47	5262	Črniče
00050000-55a8-fc2e-8a9c-19a769853078	8340	Črnomelj
00050000-55a8-fc2e-5480-663036f5513d	6271	Dekani
00050000-55a8-fc2e-0515-7b2084068a05	5210	Deskle
00050000-55a8-fc2e-b7b1-4a031b1e7419	2253	Destrnik
00050000-55a8-fc2e-58a5-9babf55c1b04	6215	Divača
00050000-55a8-fc2e-e761-a14abd4ac8fd	1233	Dob
00050000-55a8-fc2e-c545-cd71646df136	3224	Dobje pri Planini
00050000-55a8-fc2e-093a-245abaeb74fe	8257	Dobova
00050000-55a8-fc2e-f139-e84036bd8fae	1423	Dobovec
00050000-55a8-fc2e-5c98-0066066fec87	5263	Dobravlje
00050000-55a8-fc2e-e5e4-e94ad60dc564	3204	Dobrna
00050000-55a8-fc2e-bfd4-ba32caa30631	8211	Dobrnič
00050000-55a8-fc2e-e9fc-b318a627fb8e	1356	Dobrova
00050000-55a8-fc2e-4476-cd94d109b629	9223	Dobrovnik/Dobronak 
00050000-55a8-fc2e-465d-dfb8e35f624a	5212	Dobrovo v Brdih
00050000-55a8-fc2e-1b7c-946ce023e636	1431	Dol pri Hrastniku
00050000-55a8-fc2e-2413-cb90e25ee6a0	1262	Dol pri Ljubljani
00050000-55a8-fc2e-3e2a-270f907ddf7b	1273	Dole pri Litiji
00050000-55a8-fc2e-3125-3d3c35a06cd2	1331	Dolenja vas
00050000-55a8-fc2e-d9f7-8aa903fd8d2c	8350	Dolenjske Toplice
00050000-55a8-fc2e-22bd-333472062839	1230	Domžale
00050000-55a8-fc2e-d5d0-2a77418ad4a3	2252	Dornava
00050000-55a8-fc2e-0c5e-145e94231f3c	5294	Dornberk
00050000-55a8-fc2e-fa13-6451885d340a	1319	Draga
00050000-55a8-fc2e-0314-e6a4ad45b280	8343	Dragatuš
00050000-55a8-fc2e-1b5c-1d3f6a304783	3222	Dramlje
00050000-55a8-fc2e-4efe-4c2ff4af155b	2370	Dravograd
00050000-55a8-fc2e-1f99-ee5fe567a528	4203	Duplje
00050000-55a8-fc2e-a129-904335a55f55	6221	Dutovlje
00050000-55a8-fc2e-4dff-0c73508f12b0	8361	Dvor
00050000-55a8-fc2e-d0e8-368d304730dd	2343	Fala
00050000-55a8-fc2e-c94d-d0e8cd8484b1	9208	Fokovci
00050000-55a8-fc2f-1dc7-5f66165df72b	2313	Fram
00050000-55a8-fc2f-8cf3-b47ecf280b1e	3213	Frankolovo
00050000-55a8-fc2f-12bd-dba2e0ee50ad	1274	Gabrovka
00050000-55a8-fc2f-0349-b87e4a0cbc76	8254	Globoko
00050000-55a8-fc2f-28a4-b9656bff493f	5275	Godovič
00050000-55a8-fc2f-6c75-6c436196bed1	4204	Golnik
00050000-55a8-fc2f-f816-41ac4a828416	3303	Gomilsko
00050000-55a8-fc2f-8138-59c5361f80c3	4224	Gorenja vas
00050000-55a8-fc2f-b316-955e2c206f11	3263	Gorica pri Slivnici
00050000-55a8-fc2f-bb8a-f002f11ca105	2272	Gorišnica
00050000-55a8-fc2f-e239-081e1776e6d1	9250	Gornja Radgona
00050000-55a8-fc2f-fcd6-1bc525e3eb3c	3342	Gornji Grad
00050000-55a8-fc2f-5a68-54473bc84564	4282	Gozd Martuljek
00050000-55a8-fc2f-5498-3b5a14428f67	6272	Gračišče
00050000-55a8-fc2f-6102-ff8644af4c62	9264	Grad
00050000-55a8-fc2f-e226-15f69868d128	8332	Gradac
00050000-55a8-fc2f-5748-3e3efa3de7b1	1384	Grahovo
00050000-55a8-fc2f-28f3-477701c3658d	5242	Grahovo ob Bači
00050000-55a8-fc2f-9958-d329ce027a45	5251	Grgar
00050000-55a8-fc2f-266b-dbd3f24eac17	3302	Griže
00050000-55a8-fc2f-52b3-3b055422d356	3231	Grobelno
00050000-55a8-fc2f-5f51-7e7f3bc7e64c	1290	Grosuplje
00050000-55a8-fc2f-ae3e-570ec70fe8ba	2288	Hajdina
00050000-55a8-fc2f-25e2-ec271f8e7654	8362	Hinje
00050000-55a8-fc2f-6fb2-dbee35daadd7	2311	Hoče
00050000-55a8-fc2f-335b-b2c696bc5811	9205	Hodoš/Hodos
00050000-55a8-fc2f-e116-aa745e7f795d	1354	Horjul
00050000-55a8-fc2f-1026-b1f2d9305c5a	1372	Hotedršica
00050000-55a8-fc2f-5575-5c3543b233aa	1430	Hrastnik
00050000-55a8-fc2f-b7cf-39579eb968b7	6225	Hruševje
00050000-55a8-fc2f-6813-f9ceb7ae013b	4276	Hrušica
00050000-55a8-fc2f-4a5a-022c40f167fb	5280	Idrija
00050000-55a8-fc2f-79d0-42677a640c9a	1292	Ig
00050000-55a8-fc2f-33a1-6c0b5ed5542a	6250	Ilirska Bistrica
00050000-55a8-fc2f-a8cd-7eea1f53f892	6251	Ilirska Bistrica-Trnovo
00050000-55a8-fc2f-40f4-d6dffc98a7aa	1295	Ivančna Gorica
00050000-55a8-fc2f-11ed-dab3ee814a70	2259	Ivanjkovci
00050000-55a8-fc2f-db3e-cb67abff5f6c	1411	Izlake
00050000-55a8-fc2f-762a-f442cc8cdcb8	6310	Izola/Isola
00050000-55a8-fc2f-f59e-eb5d9c6e40b3	2222	Jakobski Dol
00050000-55a8-fc2f-ae75-cd82f00977c0	2221	Jarenina
00050000-55a8-fc2f-1db0-36d394a1a7b0	6254	Jelšane
00050000-55a8-fc2f-b8ff-d563b0d2f2b1	4270	Jesenice
00050000-55a8-fc2f-1efe-a0dab0ef2845	8261	Jesenice na Dolenjskem
00050000-55a8-fc2f-1058-1c03e1281acd	3273	Jurklošter
00050000-55a8-fc2f-a91c-85932320f943	2223	Jurovski Dol
00050000-55a8-fc2f-7175-69270274a305	2256	Juršinci
00050000-55a8-fc2f-d7de-7e8e3d2622cb	5214	Kal nad Kanalom
00050000-55a8-fc2f-54ea-c8e5ca0f6b17	3233	Kalobje
00050000-55a8-fc2f-ba30-4dce389a74b2	4246	Kamna Gorica
00050000-55a8-fc2f-9d12-62905856c7f9	2351	Kamnica
00050000-55a8-fc2f-8a4f-e280add37eda	1241	Kamnik
00050000-55a8-fc2f-6fc1-592eebfe5777	5213	Kanal
00050000-55a8-fc2f-a720-0d0f755e23c1	8258	Kapele
00050000-55a8-fc2f-4f09-03ce4508a4bf	2362	Kapla
00050000-55a8-fc2f-77d4-ed900d0611b0	2325	Kidričevo
00050000-55a8-fc2f-6e08-a1ef35070753	1412	Kisovec
00050000-55a8-fc2f-146a-71e7dbd4433e	6253	Knežak
00050000-55a8-fc2f-6142-ce35563d3b1a	5222	Kobarid
00050000-55a8-fc2f-1251-ff7babf0292b	9227	Kobilje
00050000-55a8-fc2f-2bd0-0b3aa252819f	1330	Kočevje
00050000-55a8-fc2f-708f-69df8f529e41	1338	Kočevska Reka
00050000-55a8-fc2f-f03d-e364d1fa4482	2276	Kog
00050000-55a8-fc2f-5c86-d795f76d1d15	5211	Kojsko
00050000-55a8-fc2f-89c5-7818f0ff0daa	6223	Komen
00050000-55a8-fc2f-165b-220d506e46b0	1218	Komenda
00050000-55a8-fc2f-bb0b-1991f26da017	6000	Koper/Capodistria 
00050000-55a8-fc2f-4523-e43acfa47e6a	6001	Koper/Capodistria - poštni predali
00050000-55a8-fc2f-4ece-9efbeb5d0fbc	8282	Koprivnica
00050000-55a8-fc2f-0d66-3efa24ef175a	5296	Kostanjevica na Krasu
00050000-55a8-fc2f-bddf-2fa3ba6259bc	8311	Kostanjevica na Krki
00050000-55a8-fc2f-c589-8d5512862c33	1336	Kostel
00050000-55a8-fc2f-aa24-f2433af28137	6256	Košana
00050000-55a8-fc2f-08f4-40872823cfe8	2394	Kotlje
00050000-55a8-fc2f-2c84-779f4ffac19f	6240	Kozina
00050000-55a8-fc2f-30be-7b52573299f2	3260	Kozje
00050000-55a8-fc2f-3cf2-e9862202d6c1	4000	Kranj 
00050000-55a8-fc2f-119a-2e97440a4445	4001	Kranj - poštni predali
00050000-55a8-fc2f-ce19-7b9d4bb9f010	4280	Kranjska Gora
00050000-55a8-fc2f-439c-590b0b340948	1281	Kresnice
00050000-55a8-fc2f-b41d-e37738e970fd	4294	Križe
00050000-55a8-fc2f-5e97-7430cf07ddc8	9206	Križevci
00050000-55a8-fc2f-60c2-1ace28ae4309	9242	Križevci pri Ljutomeru
00050000-55a8-fc2f-be2a-51b09c66fb14	1301	Krka
00050000-55a8-fc2f-f681-29ffe190a822	8296	Krmelj
00050000-55a8-fc2f-b0ee-31e18a1a7d2d	4245	Kropa
00050000-55a8-fc2f-f1a4-693b8d69dbcb	8262	Krška vas
00050000-55a8-fc2f-7220-f74d3363146e	8270	Krško
00050000-55a8-fc2f-c114-96d58fbf4e84	9263	Kuzma
00050000-55a8-fc2f-a8ad-51551324c655	2318	Laporje
00050000-55a8-fc2f-0522-d28e021d5c64	3270	Laško
00050000-55a8-fc2f-2de1-ae09ee5877b2	1219	Laze v Tuhinju
00050000-55a8-fc2f-5825-6d0ef7f76731	2230	Lenart v Slovenskih goricah
00050000-55a8-fc2f-1b83-34f80829f838	9220	Lendava/Lendva
00050000-55a8-fc2f-13d7-d5b3b3e141ee	4248	Lesce
00050000-55a8-fc2f-274e-ed7cd5eddc17	3261	Lesično
00050000-55a8-fc2f-53e7-3a530df7f239	8273	Leskovec pri Krškem
00050000-55a8-fc2f-8b0e-c43048ffdde9	2372	Libeliče
00050000-55a8-fc2f-36c1-46bba2ea0d46	2341	Limbuš
00050000-55a8-fc2f-9f2d-8394e788371a	1270	Litija
00050000-55a8-fc2f-472a-6e35c3e3629e	3202	Ljubečna
00050000-55a8-fc2f-bfc2-2697ee36c4f1	1000	Ljubljana 
00050000-55a8-fc2f-e5a2-4fe5bd8f9810	1001	Ljubljana - poštni predali
00050000-55a8-fc2f-e082-361aeec411af	1231	Ljubljana - Črnuče
00050000-55a8-fc2f-b5bd-07dfbdae256d	1261	Ljubljana - Dobrunje
00050000-55a8-fc2f-a75e-01430cb279fc	1260	Ljubljana - Polje
00050000-55a8-fc2f-abd3-2d4974a8b8d3	1210	Ljubljana - Šentvid
00050000-55a8-fc2f-dbc3-faef2b4912bb	1211	Ljubljana - Šmartno
00050000-55a8-fc2f-7b8a-976ac210abff	3333	Ljubno ob Savinji
00050000-55a8-fc2f-f20f-daf4ff7564ff	9240	Ljutomer
00050000-55a8-fc2f-da7a-2f731d2f6385	3215	Loče
00050000-55a8-fc2f-d2a7-e0e8339a224f	5231	Log pod Mangartom
00050000-55a8-fc2f-23aa-8cd0326bfaeb	1358	Log pri Brezovici
00050000-55a8-fc2f-1680-27cd0c04ba80	1370	Logatec
00050000-55a8-fc2f-1ccf-8993b52f917e	1371	Logatec
00050000-55a8-fc2f-3132-c8377efa1c54	1434	Loka pri Zidanem Mostu
00050000-55a8-fc2f-363b-d206b0335f82	3223	Loka pri Žusmu
00050000-55a8-fc2f-afdf-0056d716e293	6219	Lokev
00050000-55a8-fc2f-b6fa-5efe37114dcc	1318	Loški Potok
00050000-55a8-fc2f-fe5f-082ae50a5a2c	2324	Lovrenc na Dravskem polju
00050000-55a8-fc2f-c065-a7253b3ce098	2344	Lovrenc na Pohorju
00050000-55a8-fc2f-335c-dd4d0c517160	3334	Luče
00050000-55a8-fc2f-af69-42140dec43ea	1225	Lukovica
00050000-55a8-fc2f-bb86-d53e89938788	9202	Mačkovci
00050000-55a8-fc2f-909d-90872c3aabf2	2322	Majšperk
00050000-55a8-fc2f-48c4-6bf37fa7db02	2321	Makole
00050000-55a8-fc2f-bcde-6c190c0a13ac	9243	Mala Nedelja
00050000-55a8-fc2f-52f2-4372f87d47fd	2229	Malečnik
00050000-55a8-fc2f-723b-caa61b60d190	6273	Marezige
00050000-55a8-fc2f-93cf-e34fb6df22ec	2000	Maribor 
00050000-55a8-fc2f-3195-b56cf6c30cc0	2001	Maribor - poštni predali
00050000-55a8-fc2f-ae6e-60e502bc0265	2206	Marjeta na Dravskem polju
00050000-55a8-fc2f-bbe8-0b1b5ba97783	2281	Markovci
00050000-55a8-fc2f-64f3-4b0c041c39d3	9221	Martjanci
00050000-55a8-fc2f-a36b-6fc4de20907f	6242	Materija
00050000-55a8-fc2f-74e7-4873e67cd9e9	4211	Mavčiče
00050000-55a8-fc2f-2d74-4325696887ea	1215	Medvode
00050000-55a8-fc2f-17a1-e75963fed7db	1234	Mengeš
00050000-55a8-fc2f-a6ba-f9587e77cc88	8330	Metlika
00050000-55a8-fc2f-674a-fdaabefd095b	2392	Mežica
00050000-55a8-fc2f-c12b-d75c4edb47bd	2204	Miklavž na Dravskem polju
00050000-55a8-fc2f-2f15-d59f32b6c583	2275	Miklavž pri Ormožu
00050000-55a8-fc2f-1c94-a739812cfa52	5291	Miren
00050000-55a8-fc2f-0dcb-2210da757939	8233	Mirna
00050000-55a8-fc2f-a67d-bda18cc87f46	8216	Mirna Peč
00050000-55a8-fc2f-e45a-b27ba511607b	2382	Mislinja
00050000-55a8-fc2f-7fa6-443b822c87f7	4281	Mojstrana
00050000-55a8-fc2f-d07b-ea6468b5ce2f	8230	Mokronog
00050000-55a8-fc2f-5dd3-150770aa5685	1251	Moravče
00050000-55a8-fc2f-29f5-a5f9639023d6	9226	Moravske Toplice
00050000-55a8-fc2f-840a-9261e295f8b4	5216	Most na Soči
00050000-55a8-fc2f-f739-c5656d77efd5	1221	Motnik
00050000-55a8-fc2f-185e-6099b3182f80	3330	Mozirje
00050000-55a8-fc2f-6c5b-bacb0bd2806a	9000	Murska Sobota 
00050000-55a8-fc2f-6724-a37b821d2bba	9001	Murska Sobota - poštni predali
00050000-55a8-fc2f-3c14-7121a7b57004	2366	Muta
00050000-55a8-fc2f-a5c1-610a2088b304	4202	Naklo
00050000-55a8-fc2f-902a-77d60820ba4f	3331	Nazarje
00050000-55a8-fc2f-61ec-f59f2edf1d8d	1357	Notranje Gorice
00050000-55a8-fc2f-aa95-c9cabc931a9f	3203	Nova Cerkev
00050000-55a8-fc2f-edbd-5f09e4cb69b5	5000	Nova Gorica 
00050000-55a8-fc2f-1af3-46d73e0a6be0	5001	Nova Gorica - poštni predali
00050000-55a8-fc2f-faa8-38b28e725c19	1385	Nova vas
00050000-55a8-fc2f-0910-d6ecfde484fd	8000	Novo mesto
00050000-55a8-fc2f-b16e-ccf2aff9830c	8001	Novo mesto - poštni predali
00050000-55a8-fc2f-57e1-817b3809eef5	6243	Obrov
00050000-55a8-fc2f-2a42-ba97bca007af	9233	Odranci
00050000-55a8-fc2f-9050-59470f96f30c	2317	Oplotnica
00050000-55a8-fc2f-6c9f-4f9c023b2450	2312	Orehova vas
00050000-55a8-fc2f-eaa4-008933fd4df3	2270	Ormož
00050000-55a8-fc2f-ecc0-9821a611fb9b	1316	Ortnek
00050000-55a8-fc2f-d598-074a801d43df	1337	Osilnica
00050000-55a8-fc2f-8adb-cf4077beeadc	8222	Otočec
00050000-55a8-fc2f-9a49-00ec36ee7061	2361	Ožbalt
00050000-55a8-fc2f-2c37-a422f8c16643	2231	Pernica
00050000-55a8-fc2f-0426-431035aac38d	2211	Pesnica pri Mariboru
00050000-55a8-fc2f-03ec-935700599b73	9203	Petrovci
00050000-55a8-fc2f-601c-e55fa2306a44	3301	Petrovče
00050000-55a8-fc2f-bebb-661463bef2b4	6330	Piran/Pirano
00050000-55a8-fc2f-b9b5-1b4b5866a498	8255	Pišece
00050000-55a8-fc2f-a15f-9cae46134a6b	6257	Pivka
00050000-55a8-fc2f-24ba-e9bbdebb03fb	6232	Planina
00050000-55a8-fc2f-4a31-087562c38384	3225	Planina pri Sevnici
00050000-55a8-fc2f-aa87-baec9a6a9ebd	6276	Pobegi
00050000-55a8-fc2f-fd03-e26c89871f48	8312	Podbočje
00050000-55a8-fc2f-c34e-7a232d7a39c5	5243	Podbrdo
00050000-55a8-fc2f-f3a2-eab0f5f6bcd0	3254	Podčetrtek
00050000-55a8-fc2f-b819-5abf6dc8572c	2273	Podgorci
00050000-55a8-fc2f-d4f2-f28c18a94e8d	6216	Podgorje
00050000-55a8-fc2f-9d1c-e7985bb52e32	2381	Podgorje pri Slovenj Gradcu
00050000-55a8-fc2f-98ed-331e0ddfd84f	6244	Podgrad
00050000-55a8-fc2f-f11c-b31c25a8a847	1414	Podkum
00050000-55a8-fc2f-ebf3-d040a8b4deaa	2286	Podlehnik
00050000-55a8-fc2f-249c-c94ff09e1f01	5272	Podnanos
00050000-55a8-fc2f-744a-c84f193031c3	4244	Podnart
00050000-55a8-fc2f-acd7-e625f95d8677	3241	Podplat
00050000-55a8-fc2f-deac-2a40652ae5d3	3257	Podsreda
00050000-55a8-fc2f-ded5-4f9499f194cb	2363	Podvelka
00050000-55a8-fc2f-f0c9-a974eda099ee	2208	Pohorje
00050000-55a8-fc2f-13ed-8ff6ace12908	2257	Polenšak
00050000-55a8-fc2f-d5d6-8114b1d9483a	1355	Polhov Gradec
00050000-55a8-fc2f-804c-ea37eb0c2a38	4223	Poljane nad Škofjo Loko
00050000-55a8-fc2f-e348-677d886d1621	2319	Poljčane
00050000-55a8-fc2f-398f-1f81a0c6a8bd	1272	Polšnik
00050000-55a8-fc2f-3e9e-19faf2aa8686	3313	Polzela
00050000-55a8-fc2f-0630-8fdee701e67d	3232	Ponikva
00050000-55a8-fc2f-93ce-d17f6d67451b	6320	Portorož/Portorose
00050000-55a8-fc2f-fe0b-43fea04a7482	6230	Postojna
00050000-55a8-fc2f-184e-b925387fa82f	2331	Pragersko
00050000-55a8-fc2f-1150-cb5578df2ab3	3312	Prebold
00050000-55a8-fc2f-cddf-2e443ff038b4	4205	Preddvor
00050000-55a8-fc2f-1f2b-ec623cd15602	6255	Prem
00050000-55a8-fc2f-c845-18b6bbf26da4	1352	Preserje
00050000-55a8-fc2f-3c84-204b995f0de1	6258	Prestranek
00050000-55a8-fc2f-99a5-4cc2f72383e9	2391	Prevalje
00050000-55a8-fc2f-01c3-e9e75438e492	3262	Prevorje
00050000-55a8-fc2f-73c4-8fce5c6725fc	1276	Primskovo 
00050000-55a8-fc2f-a03f-20b267a4c38c	3253	Pristava pri Mestinju
00050000-55a8-fc2f-3f59-85e0055c5245	9207	Prosenjakovci/Partosfalva
00050000-55a8-fc2f-8547-830e27ccf6b0	5297	Prvačina
00050000-55a8-fc2f-9501-6c92b93a1f12	2250	Ptuj
00050000-55a8-fc2f-4847-8b6e05c21b78	2323	Ptujska Gora
00050000-55a8-fc2f-74b9-5a61566100ea	9201	Puconci
00050000-55a8-fc2f-28cf-ced324f2bc55	2327	Rače
00050000-55a8-fc2f-2b14-3cb164576932	1433	Radeče
00050000-55a8-fc2f-0108-7448140b1a1b	9252	Radenci
00050000-55a8-fc2f-6e86-8d73341c9729	2360	Radlje ob Dravi
00050000-55a8-fc2f-815a-dde03ecbb8c7	1235	Radomlje
00050000-55a8-fc2f-72de-bf359e9f8248	4240	Radovljica
00050000-55a8-fc2f-2ff6-4f7559d77cbb	8274	Raka
00050000-55a8-fc2f-20c2-25ec30a22bbe	1381	Rakek
00050000-55a8-fc2f-e02b-17d93a7f2f31	4283	Rateče - Planica
00050000-55a8-fc2f-9bee-03d3dc343e81	2390	Ravne na Koroškem
00050000-55a8-fc2f-35e2-2990bfb24ff2	9246	Razkrižje
00050000-55a8-fc2f-a60a-3828df540f25	3332	Rečica ob Savinji
00050000-55a8-fc2f-119d-494bff4048d7	5292	Renče
00050000-55a8-fc2f-d32e-763002bb832e	1310	Ribnica
00050000-55a8-fc2f-c13b-b71fa5ed0d9c	2364	Ribnica na Pohorju
00050000-55a8-fc2f-8b02-578a4a7c8102	3272	Rimske Toplice
00050000-55a8-fc2f-9cc0-93eceeead75d	1314	Rob
00050000-55a8-fc2f-7ce4-fecb64ac389b	5215	Ročinj
00050000-55a8-fc2f-69b5-15626aa2db17	3250	Rogaška Slatina
00050000-55a8-fc2f-2af0-336c4ebe361d	9262	Rogašovci
00050000-55a8-fc2f-2f4b-d8df3648a315	3252	Rogatec
00050000-55a8-fc2f-725c-1b1800d7d669	1373	Rovte
00050000-55a8-fc2f-afc8-9901d68b28da	2342	Ruše
00050000-55a8-fc2f-361a-dfcedec10830	1282	Sava
00050000-55a8-fc2f-2ff0-2cccf8560ac4	6333	Sečovlje/Sicciole
00050000-55a8-fc2f-6f48-840d254724de	4227	Selca
00050000-55a8-fc2f-5595-40307048bd74	2352	Selnica ob Dravi
00050000-55a8-fc2f-cb54-773a1dacce0b	8333	Semič
00050000-55a8-fc2f-f5fe-c6f1270f4e8b	8281	Senovo
00050000-55a8-fc2f-0e8c-9f2dea8458ef	6224	Senožeče
00050000-55a8-fc2f-cb9a-cc999bcd9c1b	8290	Sevnica
00050000-55a8-fc2f-22be-9255397498de	6210	Sežana
00050000-55a8-fc2f-8b34-6b4c3eb81ce1	2214	Sladki Vrh
00050000-55a8-fc2f-4030-30ffd92276da	5283	Slap ob Idrijci
00050000-55a8-fc2f-550e-52f689f4652f	2380	Slovenj Gradec
00050000-55a8-fc2f-ab0f-111d481b4c9f	2310	Slovenska Bistrica
00050000-55a8-fc2f-1dff-d2238abac421	3210	Slovenske Konjice
00050000-55a8-fc2f-df70-89f892d99355	1216	Smlednik
00050000-55a8-fc2f-a1f3-03968b3224fd	5232	Soča
00050000-55a8-fc2f-7284-917786fa47fc	1317	Sodražica
00050000-55a8-fc2f-e24b-3609489cecbf	3335	Solčava
00050000-55a8-fc2f-2906-d83f6ad85991	5250	Solkan
00050000-55a8-fc2f-e9c8-526eabc1e56a	4229	Sorica
00050000-55a8-fc2f-a803-5721c0c6e55e	4225	Sovodenj
00050000-55a8-fc2f-cc51-ae912b7e36dc	5281	Spodnja Idrija
00050000-55a8-fc2f-48bf-239792fad082	2241	Spodnji Duplek
00050000-55a8-fc2f-5ba1-65a0f84432ba	9245	Spodnji Ivanjci
00050000-55a8-fc2f-e4bd-6505ac4bacc8	2277	Središče ob Dravi
00050000-55a8-fc2f-cb16-8dbc1912ccbb	4267	Srednja vas v Bohinju
00050000-55a8-fc2f-c1f5-046b58538848	8256	Sromlje 
00050000-55a8-fc2f-2063-f68ff2a8ad4d	5224	Srpenica
00050000-55a8-fc2f-625b-e58712ee5f57	1242	Stahovica
00050000-55a8-fc2f-1b22-0d029b9285fc	1332	Stara Cerkev
00050000-55a8-fc2f-742d-401703f76dd0	8342	Stari trg ob Kolpi
00050000-55a8-fc2f-37a2-eb49baf61d66	1386	Stari trg pri Ložu
00050000-55a8-fc2f-ad05-c9932ac4d2a1	2205	Starše
00050000-55a8-fc2f-70ae-b47f0137c7a5	2289	Stoperce
00050000-55a8-fc2f-9a9e-50bd98e327aa	8322	Stopiče
00050000-55a8-fc2f-2d08-48bd8ef6bcee	3206	Stranice
00050000-55a8-fc2f-3036-dc6505083e74	8351	Straža
00050000-55a8-fc2f-bc82-dd8613f2aa4f	1313	Struge
00050000-55a8-fc2f-8872-65a067ef553d	8293	Studenec
00050000-55a8-fc2f-2f93-265df7a68e22	8331	Suhor
00050000-55a8-fc2f-246e-1cc1b231bcac	2233	Sv. Ana v Slovenskih goricah
00050000-55a8-fc2f-7495-14b66d021297	2235	Sv. Trojica v Slovenskih goricah
00050000-55a8-fc2f-a811-6e7d3a74a2d8	2353	Sveti Duh na Ostrem Vrhu
00050000-55a8-fc2f-68bd-9b66205045ab	9244	Sveti Jurij ob Ščavnici
00050000-55a8-fc2f-3fe3-3b527e73b54c	3264	Sveti Štefan
00050000-55a8-fc2f-f012-1eeac6b458bc	2258	Sveti Tomaž
00050000-55a8-fc2f-985f-d34a7bf8bbad	9204	Šalovci
00050000-55a8-fc2f-1732-48f022d99077	5261	Šempas
00050000-55a8-fc2f-e623-e4ae2556ac1d	5290	Šempeter pri Gorici
00050000-55a8-fc2f-7dac-6d79cb661cfc	3311	Šempeter v Savinjski dolini
00050000-55a8-fc2f-ab63-bbe30fb3a893	4208	Šenčur
00050000-55a8-fc2f-7239-8bf14087215d	2212	Šentilj v Slovenskih goricah
00050000-55a8-fc2f-9c91-3e37f4af3903	8297	Šentjanž
00050000-55a8-fc2f-92cd-30151478beea	2373	Šentjanž pri Dravogradu
00050000-55a8-fc2f-9d59-eaea2d7325ff	8310	Šentjernej
00050000-55a8-fc2f-27bb-f3e92be752eb	3230	Šentjur
00050000-55a8-fc2f-6cc1-341c2c47a9dd	3271	Šentrupert
00050000-55a8-fc2f-987a-ee406908aa33	8232	Šentrupert
00050000-55a8-fc2f-4550-da7202dc9130	1296	Šentvid pri Stični
00050000-55a8-fc2f-541f-a3f6da91ec75	8275	Škocjan
00050000-55a8-fc2f-209d-79877e220df6	6281	Škofije
00050000-55a8-fc2f-7cf3-61a405f2e05b	4220	Škofja Loka
00050000-55a8-fc2f-3351-35ee67c6958f	3211	Škofja vas
00050000-55a8-fc2f-05c3-04369a2b1bf4	1291	Škofljica
00050000-55a8-fc2f-7cad-bdd23b5a5763	6274	Šmarje
00050000-55a8-fc2f-aefc-f326676419fa	1293	Šmarje - Sap
00050000-55a8-fc2f-6710-5dbb8dddc690	3240	Šmarje pri Jelšah
00050000-55a8-fc2f-07f3-65f695906591	8220	Šmarješke Toplice
00050000-55a8-fc2f-1a91-fcb0c8d81397	2315	Šmartno na Pohorju
00050000-55a8-fc2f-d941-4fc610165ed5	3341	Šmartno ob Dreti
00050000-55a8-fc2f-50e0-4ed0b0811507	3327	Šmartno ob Paki
00050000-55a8-fc2f-c0fe-40f9a33af4c5	1275	Šmartno pri Litiji
00050000-55a8-fc2f-408e-48bf315f9b58	2383	Šmartno pri Slovenj Gradcu
00050000-55a8-fc2f-d29e-8da23217a3fb	3201	Šmartno v Rožni dolini
00050000-55a8-fc2f-f607-4af3a0c7f306	3325	Šoštanj
00050000-55a8-fc2f-b5fb-737a6951e59d	6222	Štanjel
00050000-55a8-fc2f-2324-2ad4ed973562	3220	Štore
00050000-55a8-fc2f-319d-5b2be68e8e8f	3304	Tabor
00050000-55a8-fc2f-6138-4cf3aba09c1d	3221	Teharje
00050000-55a8-fc2f-0161-c878106620b5	9251	Tišina
00050000-55a8-fc2f-4a99-ac41891bf16a	5220	Tolmin
00050000-55a8-fc2f-a5a2-c8cdbca8d5cf	3326	Topolšica
00050000-55a8-fc2f-521e-c4bd8a8cb378	2371	Trbonje
00050000-55a8-fc2f-259d-6bdf6108c2f6	1420	Trbovlje
00050000-55a8-fc2f-c86d-b5e006c3c657	8231	Trebelno 
00050000-55a8-fc2f-347f-0317d95d7015	8210	Trebnje
00050000-55a8-fc2f-bf82-7d7e35060fcb	5252	Trnovo pri Gorici
00050000-55a8-fc2f-d3d0-c2802f014348	2254	Trnovska vas
00050000-55a8-fc2f-1403-079804e9c608	1222	Trojane
00050000-55a8-fc2f-4a76-035294e9894c	1236	Trzin
00050000-55a8-fc2f-5b41-f1fc00a6811c	4290	Tržič
00050000-55a8-fc2f-1a01-ee3b36b4ca0b	8295	Tržišče
00050000-55a8-fc2f-3473-7610e3a56138	1311	Turjak
00050000-55a8-fc2f-c9d9-f9bf8019ac17	9224	Turnišče
00050000-55a8-fc2f-a094-bac67d7c2f93	8323	Uršna sela
00050000-55a8-fc2f-e43a-7edc80eae7bf	1252	Vače
00050000-55a8-fc2f-f1bf-43a081801932	3320	Velenje 
00050000-55a8-fc2f-f6cb-f675e635c28f	3322	Velenje - poštni predali
00050000-55a8-fc2f-a034-be9a3196f287	8212	Velika Loka
00050000-55a8-fc2f-3724-7c3d34a52917	2274	Velika Nedelja
00050000-55a8-fc2f-cd74-452798d63fb1	9225	Velika Polana
00050000-55a8-fc2f-1a05-92fde34aa0b6	1315	Velike Lašče
00050000-55a8-fc2f-87d6-1c6e89c69d6f	8213	Veliki Gaber
00050000-55a8-fc2f-9d76-7f1a9719b344	9241	Veržej
00050000-55a8-fc2f-fec0-2bffebb2db1f	1312	Videm - Dobrepolje
00050000-55a8-fc2f-2b76-124dfbd88b78	2284	Videm pri Ptuju
00050000-55a8-fc2f-c4be-2828c98212bd	8344	Vinica
00050000-55a8-fc2f-dc26-87a22cd76ea0	5271	Vipava
00050000-55a8-fc2f-241c-4252f99a7b6a	4212	Visoko
00050000-55a8-fc2f-95af-11f0ef9a5975	1294	Višnja Gora
00050000-55a8-fc2f-4593-3f864163da75	3205	Vitanje
00050000-55a8-fc2f-1feb-11c1fc935f8e	2255	Vitomarci
00050000-55a8-fc2f-ed4f-053ebce37abb	1217	Vodice
00050000-55a8-fc2f-3805-2135cfa817f0	3212	Vojnik\t
00050000-55a8-fc2f-e0b8-a518d8a5915e	5293	Volčja Draga
00050000-55a8-fc2f-d0d0-646742989fe2	2232	Voličina
00050000-55a8-fc2f-4085-3860f8e33899	3305	Vransko
00050000-55a8-fc2f-efec-7670a474da80	6217	Vremski Britof
00050000-55a8-fc2f-def2-5156964fa2f8	1360	Vrhnika
00050000-55a8-fc2f-5a86-791f2652bbef	2365	Vuhred
00050000-55a8-fc2f-0150-d2c60ec92f69	2367	Vuzenica
00050000-55a8-fc2f-9961-94a2e5234c3b	8292	Zabukovje 
00050000-55a8-fc2f-82f6-dc388e77e4ab	1410	Zagorje ob Savi
00050000-55a8-fc2f-b225-f37a20002d0a	1303	Zagradec
00050000-55a8-fc2f-253f-ec959e5d110e	2283	Zavrč
00050000-55a8-fc2f-cb8c-290c7c36e1fa	8272	Zdole 
00050000-55a8-fc2f-fd6f-bbd00886ae6c	4201	Zgornja Besnica
00050000-55a8-fc2f-7bbd-87440539f233	2242	Zgornja Korena
00050000-55a8-fc2f-5334-df6911128b83	2201	Zgornja Kungota
00050000-55a8-fc2f-fc6a-08601ef0c581	2316	Zgornja Ložnica
00050000-55a8-fc2f-64ca-92799147c4f6	2314	Zgornja Polskava
00050000-55a8-fc2f-a2cb-10a4d4adbc56	2213	Zgornja Velka
00050000-55a8-fc2f-67f3-7a8540b5284b	4247	Zgornje Gorje
00050000-55a8-fc2f-9075-b4389f6d7fd5	4206	Zgornje Jezersko
00050000-55a8-fc2f-64f9-d96fb044cba0	2285	Zgornji Leskovec
00050000-55a8-fc2f-9904-9867e79bcfb5	1432	Zidani Most
00050000-55a8-fc2f-b541-fe388f247e15	3214	Zreče
00050000-55a8-fc2f-c88e-718363cd3a22	4209	Žabnica
00050000-55a8-fc2f-c243-ea29556c4420	3310	Žalec
00050000-55a8-fc2f-015d-3e92326ce3b0	4228	Železniki
00050000-55a8-fc2f-f00b-ad6e2794c43d	2287	Žetale
00050000-55a8-fc2f-9bf7-1031d890225e	4226	Žiri
00050000-55a8-fc2f-e803-142d4b28b3e0	4274	Žirovnica
00050000-55a8-fc2f-f745-449f3d1050a8	8360	Žužemberk
\.


--
-- TOC entry 2888 (class 0 OID 10592493)
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
-- TOC entry 2870 (class 0 OID 10592304)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 10592382)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10592505)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10592808)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 10592819)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a8-fc30-a470-c6f0d93daad2	00080000-55a8-fc30-dd50-5dc88b85beb9	0900	AK
00190000-55a8-fc30-b667-c4cbefbaf35f	00080000-55a8-fc30-654e-ec677ab44eac	0987	AK
00190000-55a8-fc30-7aa8-9d1e0f05259c	00080000-55a8-fc30-7b7c-2053eb96fdb5	0989	AK
00190000-55a8-fc30-2555-fb58487f7f50	00080000-55a8-fc30-8d7a-a4295cb07043	0986	AK
00190000-55a8-fc30-b6bb-602d2ef03d57	00080000-55a8-fc30-14dd-7da87b62d9d1	0984	AK
00190000-55a8-fc30-abe8-1cb669a8313f	00080000-55a8-fc30-e9bc-e36f1b0f5141	0983	AK
00190000-55a8-fc30-f33c-d33cf284acbd	00080000-55a8-fc30-4ee9-7f58ce1835e7	0982	AK
\.


--
-- TOC entry 2912 (class 0 OID 10592789)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a8-fc30-8ffc-97a24b819465	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2915 (class 0 OID 10592827)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10592534)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a8-fc30-aa1f-b81a448663b4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a8-fc30-2641-4d6cbfea689d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a8-fc30-6eba-c565183c60ba	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a8-fc30-e5df-5bd3e35980a1	0004	Mali oder	t	24	Mali oder 
00220000-55a8-fc30-9248-2613ca9642ae	0005	Komorni oder	t	15	Komorni oder
00220000-55a8-fc30-46dd-26183ac45d4b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a8-fc30-967d-65eeee07a880	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2886 (class 0 OID 10592478)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 10592468)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10592653)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10592602)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 10592176)
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
-- TOC entry 2895 (class 0 OID 10592544)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 10592214)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a8-fc2e-f9bd-6b10dea3c9bf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a8-fc2e-edb2-93da55ea0244	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a8-fc2e-c5af-b9459a284edf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a8-fc2e-80d0-2188b7e31721	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a8-fc2e-dda3-0bf7e2b0ed89	planer	Planer dogodkov v koledarju	t
00020000-55a8-fc2e-ba9e-32d9e69e6be7	kadrovska	Kadrovska služba	t
00020000-55a8-fc2e-f419-1cae6206ce71	arhivar	Ažuriranje arhivalij	t
00020000-55a8-fc2e-dcb1-179485a42329	igralec	Igralec	t
00020000-55a8-fc2e-77a7-a0c23328b14e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a8-fc30-30e3-c46719da9d66	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2861 (class 0 OID 10592198)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a8-fc2e-10e1-f20eb28784c6	00020000-55a8-fc2e-c5af-b9459a284edf
00010000-55a8-fc2e-1812-5ba54152d922	00020000-55a8-fc2e-c5af-b9459a284edf
00010000-55a8-fc30-7093-9fc30be199fa	00020000-55a8-fc30-30e3-c46719da9d66
\.


--
-- TOC entry 2897 (class 0 OID 10592558)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 10592499)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10592449)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 10592868)
-- Dependencies: 238
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a8-fc2f-e691-8b4d29d2f278	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a8-fc2f-7d56-afa78706ec09	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a8-fc2f-c2e9-ad6b6f794c1a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a8-fc2f-a94e-58d4cd2d9961	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a8-fc2f-5f1f-83a2fb51efb9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2919 (class 0 OID 10592860)
-- Dependencies: 237
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a8-fc2f-c488-a724f12d2527	00230000-55a8-fc2f-a94e-58d4cd2d9961	popa
00240000-55a8-fc2f-81bf-c80b7933810d	00230000-55a8-fc2f-a94e-58d4cd2d9961	oseba
00240000-55a8-fc2f-dfa3-a424586b4035	00230000-55a8-fc2f-7d56-afa78706ec09	prostor
00240000-55a8-fc2f-300a-04b47eee8643	00230000-55a8-fc2f-a94e-58d4cd2d9961	besedilo
00240000-55a8-fc2f-7dad-ecad138879ac	00230000-55a8-fc2f-a94e-58d4cd2d9961	uprizoritev
00240000-55a8-fc2f-18c6-2fe5634639ed	00230000-55a8-fc2f-a94e-58d4cd2d9961	funkcija
00240000-55a8-fc2f-4355-2c04d6eca765	00230000-55a8-fc2f-a94e-58d4cd2d9961	tipfunkcije
00240000-55a8-fc2f-b306-3790f6bb4a53	00230000-55a8-fc2f-a94e-58d4cd2d9961	alternacija
00240000-55a8-fc2f-e689-50175bcac82c	00230000-55a8-fc2f-e691-8b4d29d2f278	pogodba
00240000-55a8-fc2f-14fc-d69fcb88d500	00230000-55a8-fc2f-a94e-58d4cd2d9961	zaposlitev
00240000-55a8-fc2f-6632-992f6e920669	00230000-55a8-fc2f-e691-8b4d29d2f278	programdela
\.


--
-- TOC entry 2918 (class 0 OID 10592855)
-- Dependencies: 236
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10592612)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a8-fc30-86d3-6ae53e375378	000e0000-55a8-fc30-faf2-f9eb655955a9	00080000-55a8-fc30-0f3f-66d622779419	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a8-fc30-4524-884d3f6ec998	000e0000-55a8-fc30-faf2-f9eb655955a9	00080000-55a8-fc30-0f3f-66d622779419	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a8-fc30-151b-1376e944c91f	000e0000-55a8-fc30-faf2-f9eb655955a9	00080000-55a8-fc30-a72c-c82735ed38cf	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55a8-fc30-7a5f-cbd906621dc1	000e0000-55a8-fc30-faf2-f9eb655955a9	00080000-55a8-fc30-a72c-c82735ed38cf	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2868 (class 0 OID 10592276)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10592455)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a8-fc30-8ae3-ccbfa1d3d913	00180000-55a8-fc30-903d-d74ae3ddd1ac	000c0000-55a8-fc30-7321-111911c6491c	00090000-55a8-fc30-4e3d-3502e0bc1003	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-fc30-ff10-dae96d8e938d	00180000-55a8-fc30-903d-d74ae3ddd1ac	000c0000-55a8-fc30-2e41-0e4f71662d93	00090000-55a8-fc30-0dd6-93a49b29910c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-fc30-28b5-1ddce07d4846	00180000-55a8-fc30-903d-d74ae3ddd1ac	000c0000-55a8-fc30-23a7-da25fe25a50c	00090000-55a8-fc30-5fc5-7b8ecf7daac5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-fc30-33b4-6d4c66551b57	00180000-55a8-fc30-903d-d74ae3ddd1ac	000c0000-55a8-fc30-8180-7a8720bc85d9	00090000-55a8-fc30-06d2-73213c6d7c20	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-fc30-5b87-c4fe13a4b995	00180000-55a8-fc30-903d-d74ae3ddd1ac	000c0000-55a8-fc30-8663-035ef1bb222e	00090000-55a8-fc30-ad27-1404330bd38b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a8-fc30-ab97-1246a2a87021	00180000-55a8-fc30-56c7-f253aca9b171	\N	00090000-55a8-fc30-ad27-1404330bd38b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2904 (class 0 OID 10592642)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a8-fc2f-ef49-dcbec3ea3a2a	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a8-fc2f-dfdd-0ab3c011a787	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a8-fc2f-d2ae-a65fa07e6111	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a8-fc2f-a35b-879a52c82fcf	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a8-fc2f-4ff5-6df193a63889	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a8-fc2f-d304-5213d0d23ccf	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a8-fc2f-b711-386598723038	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a8-fc2f-99fb-c0c46aee77ee	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a8-fc2f-a8ee-bcb6fc5c5774	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a8-fc2f-5d6b-882d2ca74e7b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a8-fc2f-7645-ab7a584eedaa	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a8-fc2f-ae1d-4616fb15c858	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a8-fc2f-758f-c845b4a0d30a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a8-fc2f-4379-dac56a1aa0bc	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a8-fc2f-466b-fdcc4a0aeef5	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a8-fc2f-4d0b-337bced186fa	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2916 (class 0 OID 10592837)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a8-fc2f-88a1-cba2f58c847b	01	Velika predstava	f	1.00	1.00
002b0000-55a8-fc2f-ace7-307719fbf678	02	Mala predstava	f	0.50	0.50
002b0000-55a8-fc2f-f2bd-6be13ca06a77	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a8-fc2f-fa23-1725016ce1f0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a8-fc2f-1982-feb10f2c832c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2873 (class 0 OID 10592339)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 10592185)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a8-fc2e-1812-5ba54152d922	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO52zyc.1Zbx9j6g0Tp6y0iDu2wrNvCJO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-7513-d3c9b294d323	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-8932-5753df6036d3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-3f44-52b70f1c8a9c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-1dac-f393ed284649	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-bbf2-d717b09ba421	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-1f53-2112cf012003	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-f9b0-59189d79e7e3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-2958-fa35f6b82560	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-21c9-ea8d9adb3e10	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a8-fc30-7093-9fc30be199fa	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a8-fc2e-10e1-f20eb28784c6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 10592690)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a8-fc30-f0b6-dd1e3d3c64a5	00160000-55a8-fc30-05d4-557e7ffd0ae8	00150000-55a8-fc2f-e6ec-8ff38127b0f7	00140000-55a8-fc2e-382f-3433d457e84c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a8-fc30-9248-2613ca9642ae
000e0000-55a8-fc30-faf2-f9eb655955a9	00160000-55a8-fc30-2758-0d8ea167298b	00150000-55a8-fc2f-d7db-f5505ab4d575	00140000-55a8-fc2e-cc50-d6d5ac548b72	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a8-fc30-46dd-26183ac45d4b
000e0000-55a8-fc30-e00d-84e06e4b7c26	\N	00150000-55a8-fc2f-d7db-f5505ab4d575	00140000-55a8-fc2e-cc50-d6d5ac548b72	00190000-55a8-fc30-b667-c4cbefbaf35f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a8-fc30-9248-2613ca9642ae
000e0000-55a8-fc30-cdd0-2363fe04c147	\N	00150000-55a8-fc2f-d7db-f5505ab4d575	00140000-55a8-fc2e-cc50-d6d5ac548b72	00190000-55a8-fc30-b667-c4cbefbaf35f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a8-fc30-9248-2613ca9642ae
000e0000-55a8-fc30-bc40-fc7a210eaf27	\N	00150000-55a8-fc2f-d7db-f5505ab4d575	00140000-55a8-fc2e-cc50-d6d5ac548b72	00190000-55a8-fc30-b667-c4cbefbaf35f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a8-fc30-aa1f-b81a448663b4
\.


--
-- TOC entry 2878 (class 0 OID 10592401)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a8-fc30-0774-058cc87e6930	000e0000-55a8-fc30-faf2-f9eb655955a9	1	
00200000-55a8-fc30-6060-0ab6fd57d704	000e0000-55a8-fc30-faf2-f9eb655955a9	2	
\.


--
-- TOC entry 2893 (class 0 OID 10592526)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10592595)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a8-fc30-b63d-b4556441cbf6	00090000-55a8-fc30-0dd6-93a49b29910c	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-fc30-3785-3d5b4bf917f5	00090000-55a8-fc30-5fc5-7b8ecf7daac5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a8-fc30-28a2-b121edc708e5	00090000-55a8-fc30-c57e-93b97b4113b5	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2880 (class 0 OID 10592433)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 10592680)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a8-fc2e-382f-3433d457e84c	01	Drama	drama (SURS 01)
00140000-55a8-fc2e-2394-c2759285e798	02	Opera	opera (SURS 02)
00140000-55a8-fc2e-6efa-1db9395b77c4	03	Balet	balet (SURS 03)
00140000-55a8-fc2e-fc9c-b0d991284cc5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a8-fc2e-695f-f326fc987385	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a8-fc2e-cc50-d6d5ac548b72	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a8-fc2e-aa3e-388a67437447	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2899 (class 0 OID 10592585)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a8-fc2f-6069-46d316b1242c	01	Opera	opera
00150000-55a8-fc2f-4e2d-663e98b85439	02	Opereta	opereta
00150000-55a8-fc2f-41d1-f3f90ec34a95	03	Balet	balet
00150000-55a8-fc2f-5b25-4749cbd3bf6b	04	Plesne prireditve	plesne prireditve
00150000-55a8-fc2f-0edc-a2aca2cc2b29	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a8-fc2f-eefe-13ba29bfb776	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a8-fc2f-dd6c-54a500bcaabf	07	Biografska drama	biografska drama
00150000-55a8-fc2f-e6ec-8ff38127b0f7	08	Komedija	komedija
00150000-55a8-fc2f-8cbb-56bc5684b102	09	Črna komedija	črna komedija
00150000-55a8-fc2f-6470-c4b6c6105f9e	10	E-igra	E-igra
00150000-55a8-fc2f-d7db-f5505ab4d575	11	Kriminalka	kriminalka
00150000-55a8-fc2f-3033-43a999779ef5	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 10592239)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 10592737)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 10592727)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10592641)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 10592423)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10592448)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 10592853)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 10592365)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 10592783)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 10592581)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 10592399)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 10592442)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 10592379)
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
-- TOC entry 2538 (class 2606 OID 10592491)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 10592518)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 10592337)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 10592248)
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
-- TOC entry 2453 (class 2606 OID 10592272)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 10592228)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 10592213)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 10592524)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 10592557)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 10592675)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 10592301)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 10592325)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10592497)
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
-- TOC entry 2468 (class 2606 OID 10592315)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10592386)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10592509)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 10592816)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 10592824)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 10592806)
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
-- TOC entry 2644 (class 2606 OID 10592835)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 10592541)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10592482)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 10592473)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 10592663)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 10592609)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10592184)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10592548)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 10592202)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 10592222)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10592566)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 10592504)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 10592454)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 10592877)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 10592865)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 10592859)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10592622)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 10592281)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 10592464)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10592652)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 10592847)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10592350)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 10592197)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10592706)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10592408)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10592532)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 10592600)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10592437)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 10592688)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 10592593)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 10592430)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 10592623)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2587 (class 1259 OID 10592624)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2460 (class 1259 OID 10592303)
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
-- TOC entry 2551 (class 1259 OID 10592525)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2545 (class 1259 OID 10592511)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 10592510)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 10592409)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10592582)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 10592584)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2575 (class 1259 OID 10592583)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 10592381)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 10592380)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 10592836)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2596 (class 1259 OID 10592677)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2597 (class 1259 OID 10592678)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 10592679)
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
-- TOC entry 2605 (class 1259 OID 10592711)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2606 (class 1259 OID 10592708)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2607 (class 1259 OID 10592712)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2608 (class 1259 OID 10592710)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2609 (class 1259 OID 10592709)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 10592352)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 10592351)
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
-- TOC entry 2451 (class 1259 OID 10592275)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 10592549)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 10592443)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 10592229)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 10592230)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2566 (class 1259 OID 10592569)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2567 (class 1259 OID 10592568)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2568 (class 1259 OID 10592567)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 10592387)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 10592389)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 10592388)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2652 (class 1259 OID 10592867)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 10592477)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 10592475)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 10592474)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 10592476)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 10592203)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 10592204)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 10592533)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2540 (class 1259 OID 10592498)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2582 (class 1259 OID 10592610)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2583 (class 1259 OID 10592611)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10592788)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2627 (class 1259 OID 10592787)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2628 (class 1259 OID 10592784)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 10592785)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2630 (class 1259 OID 10592786)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 10592317)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 10592316)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 10592318)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2425 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2634 (class 1259 OID 10592817)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2635 (class 1259 OID 10592818)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2619 (class 1259 OID 10592741)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 10592739)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 10592740)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2579 (class 1259 OID 10592601)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 10592486)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 10592485)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 10592483)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 10592484)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2403 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 10592729)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 10592728)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2631 (class 1259 OID 10592807)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 10592400)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2649 (class 1259 OID 10592854)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2447 (class 1259 OID 10592250)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 10592249)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 10592282)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 10592283)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 10592467)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 10592466)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 10592465)
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
-- TOC entry 2503 (class 1259 OID 10592432)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 10592428)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 10592425)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 10592426)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 10592424)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 10592429)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 10592427)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 10592302)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10592366)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 10592368)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 10592367)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 10592369)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 10592492)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 10592676)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 10592707)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10592273)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 10592274)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 10592594)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2658 (class 1259 OID 10592878)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 10592338)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2655 (class 1259 OID 10592866)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2559 (class 1259 OID 10592543)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2560 (class 1259 OID 10592542)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10592738)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 10592742)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 10592326)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 10592689)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10592825)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 10592826)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 10592223)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 10592431)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2684 (class 2606 OID 10593014)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2687 (class 2606 OID 10592999)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2686 (class 2606 OID 10593004)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2682 (class 2606 OID 10593024)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2688 (class 2606 OID 10592994)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2683 (class 2606 OID 10593019)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2685 (class 2606 OID 10593009)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2718 (class 2606 OID 10593169)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2717 (class 2606 OID 10593174)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2669 (class 2606 OID 10592929)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 10593109)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2703 (class 2606 OID 10593104)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2704 (class 2606 OID 10593099)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2681 (class 2606 OID 10592989)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 10593139)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 10593149)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2712 (class 2606 OID 10593144)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2675 (class 2606 OID 10592964)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 10592959)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 10593089)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 10593294)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2721 (class 2606 OID 10593179)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 10593184)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 10593189)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2723 (class 2606 OID 10593209)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2726 (class 2606 OID 10593194)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 10593214)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 10593204)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2725 (class 2606 OID 10593199)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2673 (class 2606 OID 10592954)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 10592949)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 10592914)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2666 (class 2606 OID 10592909)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 10593119)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2689 (class 2606 OID 10593029)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 10592889)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2661 (class 2606 OID 10592894)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2708 (class 2606 OID 10593134)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2709 (class 2606 OID 10593129)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2710 (class 2606 OID 10593124)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2679 (class 2606 OID 10592969)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 10592979)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2678 (class 2606 OID 10592974)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2744 (class 2606 OID 10593304)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2693 (class 2606 OID 10593064)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2695 (class 2606 OID 10593054)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2696 (class 2606 OID 10593049)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2694 (class 2606 OID 10593059)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2660 (class 2606 OID 10592879)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 10592884)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2706 (class 2606 OID 10593114)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2702 (class 2606 OID 10593094)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2716 (class 2606 OID 10593159)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2715 (class 2606 OID 10593164)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2733 (class 2606 OID 10593269)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 10593264)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2737 (class 2606 OID 10593249)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 10593254)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2735 (class 2606 OID 10593259)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2671 (class 2606 OID 10592939)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 10592934)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2670 (class 2606 OID 10592944)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2740 (class 2606 OID 10593279)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2739 (class 2606 OID 10593284)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2730 (class 2606 OID 10593239)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2729 (class 2606 OID 10593244)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2732 (class 2606 OID 10593229)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2731 (class 2606 OID 10593234)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2714 (class 2606 OID 10593154)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 10593084)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2698 (class 2606 OID 10593079)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2700 (class 2606 OID 10593069)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2699 (class 2606 OID 10593074)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2727 (class 2606 OID 10593224)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 10593219)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 10593274)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2680 (class 2606 OID 10592984)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 10593289)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2743 (class 2606 OID 10593299)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2663 (class 2606 OID 10592904)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2664 (class 2606 OID 10592899)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2668 (class 2606 OID 10592919)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 10592924)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 10593044)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 10593039)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2692 (class 2606 OID 10593034)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-17 14:59:29 CEST

--
-- PostgreSQL database dump complete
--

