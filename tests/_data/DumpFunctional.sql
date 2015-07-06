--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-06 15:58:10 CEST

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
-- TOC entry 183 (class 1259 OID 9205135)
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
-- TOC entry 228 (class 1259 OID 9205634)
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
-- TOC entry 227 (class 1259 OID 9205617)
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
-- TOC entry 221 (class 1259 OID 9205529)
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
-- TOC entry 197 (class 1259 OID 9205314)
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
-- TOC entry 200 (class 1259 OID 9205348)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9205746)
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
-- TOC entry 192 (class 1259 OID 9205257)
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
-- TOC entry 229 (class 1259 OID 9205647)
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
-- TOC entry 216 (class 1259 OID 9205474)
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
-- TOC entry 195 (class 1259 OID 9205294)
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
-- TOC entry 199 (class 1259 OID 9205342)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9205274)
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
-- TOC entry 205 (class 1259 OID 9205391)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9205416)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9205231)
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
-- TOC entry 184 (class 1259 OID 9205144)
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
-- TOC entry 185 (class 1259 OID 9205155)
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
-- TOC entry 180 (class 1259 OID 9205109)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9205128)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9205423)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9205454)
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
-- TOC entry 224 (class 1259 OID 9205567)
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
-- TOC entry 187 (class 1259 OID 9205188)
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
-- TOC entry 189 (class 1259 OID 9205223)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9205397)
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
-- TOC entry 188 (class 1259 OID 9205208)
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
-- TOC entry 194 (class 1259 OID 9205286)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9205409)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9205716)
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
-- TOC entry 232 (class 1259 OID 9205727)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9205697)
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
-- TOC entry 212 (class 1259 OID 9205438)
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
-- TOC entry 204 (class 1259 OID 9205382)
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
-- TOC entry 203 (class 1259 OID 9205372)
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
-- TOC entry 223 (class 1259 OID 9205556)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9205506)
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
-- TOC entry 177 (class 1259 OID 9205080)
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
-- TOC entry 176 (class 1259 OID 9205078)
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
-- TOC entry 213 (class 1259 OID 9205448)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9205118)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9205102)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9205462)
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
-- TOC entry 207 (class 1259 OID 9205403)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9205353)
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
-- TOC entry 237 (class 1259 OID 9205766)
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
-- TOC entry 236 (class 1259 OID 9205758)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9205753)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9205516)
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
-- TOC entry 186 (class 1259 OID 9205180)
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
-- TOC entry 202 (class 1259 OID 9205359)
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
-- TOC entry 222 (class 1259 OID 9205545)
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
-- TOC entry 233 (class 1259 OID 9205735)
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
-- TOC entry 191 (class 1259 OID 9205243)
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
-- TOC entry 178 (class 1259 OID 9205089)
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
-- TOC entry 226 (class 1259 OID 9205594)
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
-- TOC entry 196 (class 1259 OID 9205305)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9205430)
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
-- TOC entry 218 (class 1259 OID 9205499)
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
-- TOC entry 198 (class 1259 OID 9205337)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9205584)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9205489)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9205083)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9205135)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9205634)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559a-8971-e048-6f4dd610cbec	000d0000-559a-8971-2ccf-7b8bee06049f	\N	00090000-559a-8971-8627-7568195104ba	000b0000-559a-8971-7437-4f2c76726be7	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-559a-8971-c6c0-279be039057e	000d0000-559a-8971-0e80-bff9de528364	\N	00090000-559a-8971-7410-8c11f14404dd	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-559a-8971-4614-6c51a2931605	000d0000-559a-8971-ba5f-5e253c108c8d	\N	00090000-559a-8971-915c-fa3dd7917455	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-559a-8971-699d-84d7dcfd2fd0	000d0000-559a-8971-7564-8cb0802b2746	\N	00090000-559a-8971-8501-763b40310eea	\N	0004	t	\N	\N	\N	26	\N	\N	f	f
000c0000-559a-8971-8303-6c50429f98f2	000d0000-559a-8971-fa80-b16da2de13c3	\N	00090000-559a-8971-87cc-d79a5c62616f	\N	0005	t	\N	\N	\N	7	\N	\N	f	f
000c0000-559a-8971-f5cc-64048220c80e	000d0000-559a-8971-b520-886cbc5bf49e	\N	00090000-559a-8971-c6e6-3c14c95baca9	000b0000-559a-8971-4b72-e1de7e66a078	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-559a-8971-8027-bbe899a1dc13	000d0000-559a-8971-73d1-ce78d56890d2	\N	00090000-559a-8971-8a41-c83537f9246f	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-559a-8971-a02e-51bc14ca95df	000d0000-559a-8971-479c-bdf3eaa03b46	\N	00090000-559a-8971-be9b-3d3eb5988032	000b0000-559a-8971-014f-f007bc9b511d	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2902 (class 0 OID 9205617)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9205529)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559a-8971-6f74-9b809c281ced	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559a-8971-de43-07f0874d58ae	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559a-8971-5375-170d792175aa	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9205314)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559a-8971-b92b-8256493184d4	\N	\N	00200000-559a-8971-35df-1c8fb3a959b1	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559a-8971-f840-f87589d9bbe3	\N	\N	00200000-559a-8971-ea2a-757e8f5ef588	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559a-8971-6e20-509c0e845d52	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559a-8971-3594-c333a7a2861e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559a-8971-d183-ae837b287ecc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9205348)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9205746)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9205257)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559a-896f-6910-1d09766ac356	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559a-896f-a106-0b32753b7faa	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559a-896f-3993-741c7ad61b6a	AL	ALB	008	Albania 	Albanija	\N
00040000-559a-896f-7126-71b4d85e0273	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559a-896f-dce2-e6c739d3c6d1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559a-896f-eba2-83534cd662ed	AD	AND	020	Andorra 	Andora	\N
00040000-559a-896f-3ed0-17ffd89f60e7	AO	AGO	024	Angola 	Angola	\N
00040000-559a-896f-ae63-3fcf99e0acae	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559a-896f-bbc5-f9aeea9a49a2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559a-896f-48e4-10d4263c1ff5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559a-896f-30ab-0a50d361f665	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559a-896f-6e7b-afcf5c921f97	AM	ARM	051	Armenia 	Armenija	\N
00040000-559a-896f-73d5-517b0abc37cc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559a-896f-4e71-24513b9f37dc	AU	AUS	036	Australia 	Avstralija	\N
00040000-559a-896f-6ab4-e582b974a42d	AT	AUT	040	Austria 	Avstrija	\N
00040000-559a-896f-9ab8-e5bd1619335e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559a-896f-834c-413b01d37601	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559a-896f-80ca-025ca2e43a76	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559a-896f-567d-8a8a6c718210	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559a-896f-8939-04a2befc8952	BB	BRB	052	Barbados 	Barbados	\N
00040000-559a-896f-99eb-b18dab8d0012	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559a-896f-7ea0-906bbb39b8df	BE	BEL	056	Belgium 	Belgija	\N
00040000-559a-896f-a182-b0b512016779	BZ	BLZ	084	Belize 	Belize	\N
00040000-559a-896f-cab5-864ac8559df0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559a-896f-7bf3-5898fedaacb8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559a-896f-6f67-a175ce243f35	BT	BTN	064	Bhutan 	Butan	\N
00040000-559a-896f-cd99-96fce0e11643	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559a-896f-c870-0bf8384e8b3b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559a-896f-23b3-5cc66861171a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559a-896f-a7ff-5691fc2b8dfa	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559a-896f-06e2-f0a7bf546e0e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559a-896f-1187-fa036b638098	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559a-896f-5cf4-a29edd9dd0ad	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559a-896f-2874-593edf07d87f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559a-896f-25a9-fab12800f649	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559a-896f-5eb5-d59a5fd764c0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559a-896f-3983-91a3d8c9693b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559a-896f-4262-e40d083c599c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559a-896f-7bd2-7dc1a00d5901	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559a-896f-b45f-580e11c13238	CA	CAN	124	Canada 	Kanada	\N
00040000-559a-896f-0ed6-65f33a29b2a8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559a-896f-5e22-a7bf91fa3f10	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559a-896f-bfb8-4b54faf187b3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559a-896f-e022-50c7270b5cec	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559a-896f-abb7-094367d6ce32	CL	CHL	152	Chile 	Čile	\N
00040000-559a-896f-d159-d7657b5573ec	CN	CHN	156	China 	Kitajska	\N
00040000-559a-896f-d850-1e1b1e9219ec	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559a-896f-24de-f45d793163e6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559a-896f-ccdb-884f8549f8f7	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559a-896f-9cbf-3a577e1af419	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559a-896f-a07b-070d95399f3f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559a-896f-1d09-ea9f6d8b1699	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559a-896f-8ad8-73f72f248be9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559a-896f-8bbd-d7e4dc497afd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559a-896f-7cf3-626118c59df1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559a-896f-708f-b6b8cdee240e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559a-896f-5124-6052fb89b09a	CU	CUB	192	Cuba 	Kuba	\N
00040000-559a-896f-dafb-b4d4aef89ba9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559a-896f-9ca5-1bead1f94075	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559a-896f-6b3b-e472997b067c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559a-896f-0ac4-8e602467d09d	DK	DNK	208	Denmark 	Danska	\N
00040000-559a-896f-39a3-23144b6cb342	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559a-896f-e220-b11abdde6ba8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559a-896f-6511-4c776764432f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559a-896f-00f2-086028e7edd7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559a-896f-87b5-96002fc73821	EG	EGY	818	Egypt 	Egipt	\N
00040000-559a-896f-733d-4682adf8a67b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559a-896f-eb2f-8a8755eaac66	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559a-896f-ac54-c41986bb87ca	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559a-896f-c7f9-d90b618f62dd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559a-896f-f207-009799456d40	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559a-896f-82d6-7622c23f471f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559a-896f-b98e-9ed3fdf4d2fc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559a-896f-3da4-6de358a81b60	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559a-896f-da71-6aa7611011fd	FI	FIN	246	Finland 	Finska	\N
00040000-559a-896f-b0bd-80ac7c3a75e3	FR	FRA	250	France 	Francija	\N
00040000-559a-896f-3eba-47b4ec9e0287	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559a-896f-e827-0ad8f725f3c9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559a-896f-ac0c-cd3102801176	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559a-896f-b665-1ab793450bdb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559a-896f-804a-96a78f20a6d7	GA	GAB	266	Gabon 	Gabon	\N
00040000-559a-896f-4bdc-6ba013e487c4	GM	GMB	270	Gambia 	Gambija	\N
00040000-559a-896f-890d-9645fdeb00e7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559a-896f-12f2-23373c4b8245	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559a-896f-9dd9-8a7666b710c9	GH	GHA	288	Ghana 	Gana	\N
00040000-559a-896f-1b3d-c6d9ab65dbf3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559a-896f-aba5-1b562af3c369	GR	GRC	300	Greece 	Grčija	\N
00040000-559a-896f-c1ee-2634c75e1b93	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559a-896f-1f7d-a240a11d721c	GD	GRD	308	Grenada 	Grenada	\N
00040000-559a-896f-a98e-8806f253003b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559a-896f-2773-75b75c13364e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559a-896f-39e8-e07e36870501	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559a-896f-4270-4cf5758d2557	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559a-896f-cc68-68f851b2e41f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559a-896f-32fb-7720a3a387bd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559a-896f-b665-b1cf8f045640	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559a-896f-3ac3-f267fdf8cc40	HT	HTI	332	Haiti 	Haiti	\N
00040000-559a-896f-a3f5-a634c7160741	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559a-896f-29ef-bb564ede7cfb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559a-896f-4d93-c26ea025f694	HN	HND	340	Honduras 	Honduras	\N
00040000-559a-896f-43fa-7aa911323857	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559a-896f-13ba-b5c909f2f473	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559a-896f-a434-008446d5f151	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559a-896f-3b47-55dd235f16cd	IN	IND	356	India 	Indija	\N
00040000-559a-896f-eaf1-5ff940100314	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559a-896f-e554-e1b3503714e5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559a-896f-99fa-e478784fbb34	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559a-896f-d37b-4b294ce23af7	IE	IRL	372	Ireland 	Irska	\N
00040000-559a-896f-7005-cb22dec3530a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559a-896f-622b-eff65378fcdd	IL	ISR	376	Israel 	Izrael	\N
00040000-559a-896f-9bd1-49448504a12a	IT	ITA	380	Italy 	Italija	\N
00040000-559a-896f-770b-48e28070df17	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559a-896f-63c3-c763275f3ee6	JP	JPN	392	Japan 	Japonska	\N
00040000-559a-896f-dd8e-0f9dba6a002f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559a-896f-cbb6-9d2eaebeddb7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559a-896f-2e5c-d9decb7b94de	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559a-896f-e086-070e4daacda9	KE	KEN	404	Kenya 	Kenija	\N
00040000-559a-896f-971f-f8b3950cc3a4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559a-896f-c8dd-42f349f72665	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559a-896f-e4bd-a51a630683bf	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559a-896f-6b51-b567b8e648c6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559a-896f-5a8c-233f532db24f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559a-896f-b92c-fe630258536f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559a-896f-e06e-ecc3e071dc2c	LV	LVA	428	Latvia 	Latvija	\N
00040000-559a-896f-aa8f-1255e06a9663	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559a-896f-5806-e397092643ff	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559a-896f-7bae-3dad0afe49aa	LR	LBR	430	Liberia 	Liberija	\N
00040000-559a-896f-6479-a10b2b833627	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559a-896f-84d7-9922530d83a9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559a-896f-e3ab-2436351b5e1f	LT	LTU	440	Lithuania 	Litva	\N
00040000-559a-896f-8ca9-20cbd92a6552	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559a-896f-d077-ccfc681631ef	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559a-896f-48ed-bb3b15e4085d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559a-896f-1347-5ff4598dcd4f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559a-896f-ba5e-b8611754c87e	MW	MWI	454	Malawi 	Malavi	\N
00040000-559a-896f-c078-9f682c48a809	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559a-896f-a24b-5f739927590a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559a-896f-b985-5e947bdb1a73	ML	MLI	466	Mali 	Mali	\N
00040000-559a-896f-e115-f1a9e2064bc8	MT	MLT	470	Malta 	Malta	\N
00040000-559a-896f-f3ce-1abd5a366dbf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559a-896f-7da7-6af36cd9a88d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559a-896f-c9b1-1801aeb95e9d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559a-896f-d7ff-b7a8485e506a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559a-896f-9da7-01074c613a2b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559a-896f-6054-a9b55ef5547c	MX	MEX	484	Mexico 	Mehika	\N
00040000-559a-896f-f795-692d05b4abdc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559a-896f-efaf-8ff308486755	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559a-896f-3703-ef761ef7838f	MC	MCO	492	Monaco 	Monako	\N
00040000-559a-896f-dc5e-16d24b6de6ce	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559a-896f-a8d5-c96790862d47	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559a-896f-7b17-b5837b3c780e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559a-896f-0884-61cf0336edf3	MA	MAR	504	Morocco 	Maroko	\N
00040000-559a-896f-89bb-5b4e7741fe8b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559a-896f-52e8-d624e15fdae0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559a-896f-c46c-1c01544d00be	NA	NAM	516	Namibia 	Namibija	\N
00040000-559a-896f-ac9f-986aa9a983ea	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559a-896f-4578-eda9c2a8c480	NP	NPL	524	Nepal 	Nepal	\N
00040000-559a-896f-2595-b711ec5de78e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559a-896f-03ba-4864addf9c0b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559a-896f-b27f-632918952141	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559a-896f-b5e3-41d13142c908	NE	NER	562	Niger 	Niger 	\N
00040000-559a-896f-1d5b-52c731448d72	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559a-896f-28b5-500154bfe83e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559a-896f-9be5-27bc8ed96c47	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559a-896f-2d19-9b6d467edd7c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559a-896f-dd55-0b0eda36971b	NO	NOR	578	Norway 	Norveška	\N
00040000-559a-896f-aaae-5a99eb5ae11f	OM	OMN	512	Oman 	Oman	\N
00040000-559a-896f-6aba-63a45288d123	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559a-896f-a68c-fbd41f8ce601	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559a-896f-a14d-6d5d57899b33	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559a-896f-f467-af812e5330a6	PA	PAN	591	Panama 	Panama	\N
00040000-559a-896f-76b7-fc83fc36c133	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559a-896f-cf95-88f951e29029	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559a-896f-7196-06151a7522c6	PE	PER	604	Peru 	Peru	\N
00040000-559a-896f-e34c-d12b47150fb1	PH	PHL	608	Philippines 	Filipini	\N
00040000-559a-896f-91f0-d7308af3e791	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559a-896f-f8ef-3ff4cd841dbf	PL	POL	616	Poland 	Poljska	\N
00040000-559a-896f-4bb8-8b1779ed52ae	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559a-896f-1cb1-23c2722ca57e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559a-896f-5284-0c5b3592bbf6	QA	QAT	634	Qatar 	Katar	\N
00040000-559a-896f-9677-143b5981832f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559a-896f-8b2d-7800a72f2121	RO	ROU	642	Romania 	Romunija	\N
00040000-559a-896f-d9b9-585ca418c8fb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559a-896f-df21-8ea60d9c2997	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559a-896f-c49a-27285b7bd8cc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559a-896f-e923-5c16d16eaf89	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559a-896f-b67f-e282af21bbfe	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559a-896f-14f9-ed8acbc5903c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559a-896f-88a5-a5c849f4853f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559a-896f-9df7-f43ae990753e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559a-896f-eaa8-d91e5f1a7c36	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559a-896f-4caa-ffea134e993f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559a-896f-7ba3-3fb4721639a6	SM	SMR	674	San Marino 	San Marino	\N
00040000-559a-896f-87e3-55e2d5b05516	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559a-896f-7e92-169bb4937a65	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559a-896f-fd6f-3df40101d1d0	SN	SEN	686	Senegal 	Senegal	\N
00040000-559a-896f-b529-b3659011b149	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559a-896f-fd7b-9cd80424d67b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559a-896f-a34d-eefbdfa0d7c5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559a-896f-90a5-bc925ab6010a	SG	SGP	702	Singapore 	Singapur	\N
00040000-559a-896f-ce8b-1a848dbf6679	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559a-896f-269f-318d8b6da28a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559a-896f-5cd7-90713a1a0c8a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559a-896f-e8bc-3f42a127f672	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559a-896f-ac94-ed08882e5e9d	SO	SOM	706	Somalia 	Somalija	\N
00040000-559a-896f-d970-b131abde0449	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559a-896f-370d-0cb43d7b55c4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559a-896f-a607-07a683dbcb35	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559a-896f-9dbb-660aa620e301	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559a-896f-f29d-d9916934c386	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559a-896f-8c3b-66970b74a555	SD	SDN	729	Sudan 	Sudan	\N
00040000-559a-896f-7034-dac7bf5010bc	SR	SUR	740	Suriname 	Surinam	\N
00040000-559a-896f-0ee6-b525af958ccc	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559a-896f-ffbd-a9ccea8ebd0e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559a-896f-66c0-de4ceea6f3fd	SE	SWE	752	Sweden 	Švedska	\N
00040000-559a-896f-a1cd-91349699295a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559a-896f-05bc-0e5fd55aa8e8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559a-896f-3dd2-7be5cf150baf	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559a-896f-1bae-6dcdbe413992	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559a-896f-c832-45ae0d082848	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559a-896f-b6e2-0980d824eb67	TH	THA	764	Thailand 	Tajska	\N
00040000-559a-896f-19d4-6f91da8e6422	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559a-896f-4dc3-5225e046a3e1	TG	TGO	768	Togo 	Togo	\N
00040000-559a-896f-4276-9ae82a579c04	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559a-896f-c89f-af4e39ecf791	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559a-896f-0bcf-4e01fe694004	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559a-896f-9df1-eab87918cd8e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559a-896f-bd88-0c604666bfcf	TR	TUR	792	Turkey 	Turčija	\N
00040000-559a-896f-0f45-4eb3ab32698f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559a-896f-d076-9ebe1b8da63f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559a-896f-6d9e-c27d9203887a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559a-896f-7818-91022a5ffd77	UG	UGA	800	Uganda 	Uganda	\N
00040000-559a-896f-6baf-c1f910a325af	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559a-896f-b45f-8c535b841401	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559a-896f-f523-87cdbd3ae63f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559a-896f-6e33-280af99ef4ff	US	USA	840	United States 	Združene države Amerike	\N
00040000-559a-896f-2dba-35660a6ad24a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559a-896f-3410-ed5c64d2b76b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559a-896f-652a-8d7d9e10e336	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559a-896f-f223-29955e3d3703	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559a-896f-75d8-cfc6667fa229	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559a-896f-05d2-2cb5d5e32ff1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559a-896f-5305-5cb1dd1fbb08	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559a-896f-0a49-dde0cee5a02e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559a-896f-69e8-171f8938660f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559a-896f-64be-1b560488466b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559a-896f-39da-20d0f3b9023f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559a-896f-60e5-08a8bfaee090	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559a-896f-3b3e-41fe3b34fb8e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9205647)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559a-8971-bf46-05fb5008d897	000e0000-559a-8971-e2a4-410ca0641336	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559a-8970-be74-86c887ac63fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559a-8971-da11-2b6b331e5813	000e0000-559a-8971-6de5-196749c0f7cf	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559a-8970-ad61-a9ab5c2122e0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9205474)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559a-8971-73d1-ce78d56890d2	000e0000-559a-8971-6de5-196749c0f7cf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559a-8970-9264-9494847208d9
000d0000-559a-8971-2ccf-7b8bee06049f	000e0000-559a-8971-6de5-196749c0f7cf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559a-8970-9264-9494847208d9
000d0000-559a-8971-0e80-bff9de528364	000e0000-559a-8971-6de5-196749c0f7cf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559a-8970-30f0-ad37c25b0ddd
000d0000-559a-8971-ba5f-5e253c108c8d	000e0000-559a-8971-6de5-196749c0f7cf	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559a-8970-de40-a888a48e50fa
000d0000-559a-8971-7564-8cb0802b2746	000e0000-559a-8971-6de5-196749c0f7cf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559a-8970-de40-a888a48e50fa
000d0000-559a-8971-fa80-b16da2de13c3	000e0000-559a-8971-6de5-196749c0f7cf	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559a-8970-de40-a888a48e50fa
000d0000-559a-8971-b520-886cbc5bf49e	000e0000-559a-8971-6de5-196749c0f7cf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559a-8970-9264-9494847208d9
000d0000-559a-8971-479c-bdf3eaa03b46	000e0000-559a-8971-6de5-196749c0f7cf	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559a-8970-556c-1b0b8ba5adcb
\.


--
-- TOC entry 2870 (class 0 OID 9205294)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9205342)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9205274)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559a-8971-0c6a-36fc9ee7b111	00080000-559a-8971-5454-7a3f3b600622	00090000-559a-8971-8627-7568195104ba	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9205391)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9205416)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9205231)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559a-896f-9f00-df057b0f50a6	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559a-896f-bf80-501da89e22da	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559a-896f-32c1-263d20680499	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559a-896f-68ef-a732976af49f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559a-896f-13e8-c8e06fb5db7b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559a-896f-f6ad-6db61eb54aa4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559a-896f-8c65-f44f77a1c6c2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559a-896f-9ebb-757d15d56144	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559a-896f-fef3-658fac1cacfe	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559a-896f-e56f-5c17cf040bdb	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559a-896f-9432-f139c497e256	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559a-896f-96e5-cacbaa46de73	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559a-896f-6998-100d477c300a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559a-8971-5dd4-f65915bd0039	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559a-8971-b33e-5b9cd0d57157	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559a-8971-241b-b13a179de989	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559a-8971-8f1c-874c0988aa2c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559a-8971-8d9b-0e11fe9efb93	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559a-8971-9281-3d1051fd9b97	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9205144)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559a-8971-5bbf-854081cfd804	00000000-559a-8971-b33e-5b9cd0d57157	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559a-8971-1a8b-074dea53430e	00000000-559a-8971-b33e-5b9cd0d57157	00010000-559a-896f-523f-24e334bc8cda	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559a-8971-5a6b-abbd8aabed22	00000000-559a-8971-241b-b13a179de989	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9205155)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559a-8971-06cd-80d143947379	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559a-8971-8501-763b40310eea	00010000-559a-8971-66db-321a91a15e1b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559a-8971-915c-fa3dd7917455	00010000-559a-8971-25d2-663f8139d04c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559a-8971-6025-bb6ef373450d	00010000-559a-8971-bb8f-387e024cfefc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559a-8971-d082-da8f4308a9b1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559a-8971-c6e6-3c14c95baca9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559a-8971-f81d-b423e3b25b9a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559a-8971-8a41-c83537f9246f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559a-8971-8627-7568195104ba	00010000-559a-8971-b2d4-cc7c1f2b5208	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559a-8971-7410-8c11f14404dd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559a-8971-91a0-712af1cddb08	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559a-8971-87cc-d79a5c62616f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559a-8971-be9b-3d3eb5988032	00010000-559a-8971-2623-dfbb1dc8541a	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9205109)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559a-896f-0435-f950c2fff6cb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559a-896f-d72a-a8acadecddc2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559a-896f-0cf3-d935a8f66683	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559a-896f-68f9-01c277179c79	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559a-896f-52dd-d07c101abd8d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559a-896f-616d-68c7b12cf468	Abonma-read	Abonma - branje	f
00030000-559a-896f-c5de-778cbcbc7ae3	Abonma-write	Abonma - spreminjanje	f
00030000-559a-896f-c82b-6d1fe1126ef4	Alternacija-read	Alternacija - branje	f
00030000-559a-896f-7d3f-93660160aa81	Alternacija-write	Alternacija - spreminjanje	f
00030000-559a-896f-72b6-329caba57896	Arhivalija-read	Arhivalija - branje	f
00030000-559a-896f-bc2f-90f4cfbf6166	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559a-896f-a646-de838752f398	Besedilo-read	Besedilo - branje	f
00030000-559a-896f-9699-53a3f84c4f69	Besedilo-write	Besedilo - spreminjanje	f
00030000-559a-896f-5365-1599431cab61	DogodekIzven-read	DogodekIzven - branje	f
00030000-559a-896f-b70c-7f88b933fa47	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559a-896f-7afa-4870f19e0f7d	Dogodek-read	Dogodek - branje	f
00030000-559a-896f-52b4-3f78a38f8439	Dogodek-write	Dogodek - spreminjanje	f
00030000-559a-896f-50f2-4a201defcfd9	DrugiVir-read	DrugiVir - branje	f
00030000-559a-896f-4758-722082ae586d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559a-896f-91fe-36852eb635ba	Drzava-read	Drzava - branje	f
00030000-559a-896f-b2ed-7489c82d75ce	Drzava-write	Drzava - spreminjanje	f
00030000-559a-896f-03af-34bf61843812	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559a-896f-9137-cc7d50926d5c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559a-896f-0afc-c21a790128dd	Funkcija-read	Funkcija - branje	f
00030000-559a-896f-2a0b-d6570b641d38	Funkcija-write	Funkcija - spreminjanje	f
00030000-559a-896f-f0ab-8e7cdd7f87e8	Gostovanje-read	Gostovanje - branje	f
00030000-559a-896f-a2c9-8a1895dc2460	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559a-896f-0b03-959405c38a6a	Gostujoca-read	Gostujoca - branje	f
00030000-559a-896f-d3e0-cf8750f7ad6f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559a-896f-e90a-b27ec282a1e4	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559a-896f-7b59-e6e7e40b2c65	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559a-896f-d097-d4552d1574d3	Kupec-read	Kupec - branje	f
00030000-559a-896f-ed3e-f3342827e03d	Kupec-write	Kupec - spreminjanje	f
00030000-559a-896f-8f3b-b11676016bc5	NacinPlacina-read	NacinPlacina - branje	f
00030000-559a-896f-535a-dc6d005914fd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559a-896f-0a76-8aac858a0448	Option-read	Option - branje	f
00030000-559a-896f-dd15-9cdb2b7bd598	Option-write	Option - spreminjanje	f
00030000-559a-896f-1534-42cc2aa5e7d5	OptionValue-read	OptionValue - branje	f
00030000-559a-896f-0892-c9a0cf77da4e	OptionValue-write	OptionValue - spreminjanje	f
00030000-559a-896f-8ee7-2b4350f8dcbf	Oseba-read	Oseba - branje	f
00030000-559a-896f-f65f-681a585ba85a	Oseba-write	Oseba - spreminjanje	f
00030000-559a-896f-be01-10cca625dc32	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559a-896f-1006-a570d0d20027	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559a-896f-aafa-8159dedeb624	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559a-896f-17a4-4d036e65e3be	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559a-896f-6a94-d1031b932dd0	Pogodba-read	Pogodba - branje	f
00030000-559a-896f-0ecb-a94fb8e66aa7	Pogodba-write	Pogodba - spreminjanje	f
00030000-559a-896f-aab8-22c037a34b81	Popa-read	Popa - branje	f
00030000-559a-896f-d194-013eb8a82b3d	Popa-write	Popa - spreminjanje	f
00030000-559a-896f-f169-53ccd19b377a	Posta-read	Posta - branje	f
00030000-559a-896f-2645-e47b9ef323a1	Posta-write	Posta - spreminjanje	f
00030000-559a-896f-60b3-0e5f0b6861ef	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559a-896f-9b92-5bd67861afa7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559a-896f-e346-02939f499d47	PostniNaslov-read	PostniNaslov - branje	f
00030000-559a-896f-896c-91ab6355533d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559a-896f-d7b6-1d6a89e14ff4	Predstava-read	Predstava - branje	f
00030000-559a-896f-a03f-019cc5e4b5d2	Predstava-write	Predstava - spreminjanje	f
00030000-559a-896f-5be8-38ee489aeac9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559a-896f-3aa0-5541b2493aed	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559a-896f-7ce7-421ac69c0e7a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559a-896f-3270-f9043da99da7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559a-896f-66ed-71abce712457	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559a-896f-c20f-3c3a4f275380	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559a-896f-a50f-61a32296bddb	ProgramDela-read	ProgramDela - branje	f
00030000-559a-896f-980f-8c4a885ebf3e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559a-896f-7dec-6ca1b9dfc961	ProgramFestival-read	ProgramFestival - branje	f
00030000-559a-896f-755b-0e3f1f524f72	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559a-896f-8a86-b490e3d5b112	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559a-896f-c02b-9bbf7dae2c8d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559a-896f-3e24-76de492a24ec	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559a-896f-260b-73de2752d595	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559a-896f-6fec-4e1da7ef23e6	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559a-896f-5858-400f803790aa	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559a-896f-5d35-a09feb95b3f8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559a-896f-ed95-23816a600cab	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559a-896f-2a90-6d1a0ac6ef59	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559a-896f-0f4e-9fdc012d1c8a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559a-896f-e299-8fdf548cbf58	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559a-896f-4694-6666c66ca9c1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559a-896f-3e28-44a9eb7c03fc	ProgramRazno-read	ProgramRazno - branje	f
00030000-559a-896f-30e4-1b0535d6c00f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559a-896f-6951-ca4019186ce0	Prostor-read	Prostor - branje	f
00030000-559a-896f-9019-d4f9a4f35683	Prostor-write	Prostor - spreminjanje	f
00030000-559a-896f-9102-b50d19e14bf5	Racun-read	Racun - branje	f
00030000-559a-896f-a4e0-fd57d437cb33	Racun-write	Racun - spreminjanje	f
00030000-559a-896f-e2ba-27c7cd7074e2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559a-896f-7ca1-f069c3e853a5	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559a-896f-46b7-dbc5bf714ab7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559a-896f-52ca-a54f43ac9451	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559a-896f-dbd0-329b93560fc7	Rekvizit-read	Rekvizit - branje	f
00030000-559a-896f-f891-c917d715ed3b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559a-896f-aa60-85db22ac0415	Revizija-read	Revizija - branje	f
00030000-559a-896f-4f0b-3b6a484f4516	Revizija-write	Revizija - spreminjanje	f
00030000-559a-896f-4055-59fc5ccca1f2	Rezervacija-read	Rezervacija - branje	f
00030000-559a-896f-fc58-6da5acd5f2e4	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559a-896f-cdd7-018efe8df4a8	SedezniRed-read	SedezniRed - branje	f
00030000-559a-896f-f87c-ed93d3671708	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559a-896f-a4ba-803b72537484	Sedez-read	Sedez - branje	f
00030000-559a-896f-b2f9-c2fb4ec0b3a4	Sedez-write	Sedez - spreminjanje	f
00030000-559a-896f-2af1-444b2adb73c6	Sezona-read	Sezona - branje	f
00030000-559a-896f-04e4-21f8839cea42	Sezona-write	Sezona - spreminjanje	f
00030000-559a-896f-5cb0-74602e7f98dc	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559a-896f-d8a5-735445e44219	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559a-896f-50b3-072629348bef	Stevilcenje-read	Stevilcenje - branje	f
00030000-559a-896f-efb4-88816c363ae7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559a-896f-69b6-c56c93e62a1b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559a-896f-d7f6-5e11a6759975	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559a-896f-6c8f-98e1461fb63b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559a-896f-4c52-251b1809aeae	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559a-896f-e2c5-3eb8526367d1	Telefonska-read	Telefonska - branje	f
00030000-559a-896f-292d-10921a5018cc	Telefonska-write	Telefonska - spreminjanje	f
00030000-559a-896f-66b0-9cbec8d82d50	TerminStoritve-read	TerminStoritve - branje	f
00030000-559a-896f-ec77-bad113bf0417	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559a-896f-536a-d0b7e8403cee	TipFunkcije-read	TipFunkcije - branje	f
00030000-559a-896f-ae1f-3cf2ad1faf9e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559a-896f-b2ef-7a47614f900e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559a-896f-edd6-f8837f4b215b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559a-896f-3f23-abbf8d7ffff3	Trr-read	Trr - branje	f
00030000-559a-896f-1b67-2d3be084fd12	Trr-write	Trr - spreminjanje	f
00030000-559a-896f-d925-b6be96984fc8	Uprizoritev-read	Uprizoritev - branje	f
00030000-559a-896f-44d4-1e65f7fc1029	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559a-896f-3496-faf2fb017cad	Vaja-read	Vaja - branje	f
00030000-559a-896f-ae7a-5c01f558f4f4	Vaja-write	Vaja - spreminjanje	f
00030000-559a-896f-6601-45c5da364240	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559a-896f-238b-52f6177cc10a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559a-896f-31e2-9e38da10a8f3	Zaposlitev-read	Zaposlitev - branje	f
00030000-559a-896f-79ff-0b0d462d6c07	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559a-896f-89d2-92eb25c066d4	Zasedenost-read	Zasedenost - branje	f
00030000-559a-896f-331c-306178cbe029	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559a-896f-5bb2-7e2f8623a22a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559a-896f-3ff1-a12aeed84849	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559a-896f-9ac1-9e5f7cef9f1b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559a-896f-ce0e-8f50650ba72e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9205128)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559a-896f-7832-f0a0002531f5	00030000-559a-896f-d72a-a8acadecddc2
00020000-559a-896f-8158-d1212ec5521c	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-c5de-778cbcbc7ae3
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-c82b-6d1fe1126ef4
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-7d3f-93660160aa81
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-72b6-329caba57896
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-68f9-01c277179c79
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-52b4-3f78a38f8439
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-b2ed-7489c82d75ce
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-0afc-c21a790128dd
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-2a0b-d6570b641d38
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-a2c9-8a1895dc2460
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-d3e0-cf8750f7ad6f
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-e90a-b27ec282a1e4
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-7b59-e6e7e40b2c65
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-8ee7-2b4350f8dcbf
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-f65f-681a585ba85a
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-d194-013eb8a82b3d
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-2645-e47b9ef323a1
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-e346-02939f499d47
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-896c-91ab6355533d
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-a03f-019cc5e4b5d2
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-66ed-71abce712457
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-c20f-3c3a4f275380
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-9019-d4f9a4f35683
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-52ca-a54f43ac9451
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-f891-c917d715ed3b
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-04e4-21f8839cea42
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-536a-d0b7e8403cee
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-d925-b6be96984fc8
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-44d4-1e65f7fc1029
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-3496-faf2fb017cad
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-ae7a-5c01f558f4f4
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-89d2-92eb25c066d4
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-331c-306178cbe029
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-896f-81e3-546ef6a74199	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-72b6-329caba57896
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-e90a-b27ec282a1e4
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-7b59-e6e7e40b2c65
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-8ee7-2b4350f8dcbf
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-f65f-681a585ba85a
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-e346-02939f499d47
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-896c-91ab6355533d
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-e2c5-3eb8526367d1
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-292d-10921a5018cc
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-3f23-abbf8d7ffff3
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-1b67-2d3be084fd12
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-31e2-9e38da10a8f3
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-79ff-0b0d462d6c07
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-896f-940e-ed6a1feb1240	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-896f-696f-854454526705	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-896f-696f-854454526705	00030000-559a-896f-c82b-6d1fe1126ef4
00020000-559a-896f-696f-854454526705	00030000-559a-896f-72b6-329caba57896
00020000-559a-896f-696f-854454526705	00030000-559a-896f-bc2f-90f4cfbf6166
00020000-559a-896f-696f-854454526705	00030000-559a-896f-a646-de838752f398
00020000-559a-896f-696f-854454526705	00030000-559a-896f-5365-1599431cab61
00020000-559a-896f-696f-854454526705	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-896f-696f-854454526705	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-696f-854454526705	00030000-559a-896f-0afc-c21a790128dd
00020000-559a-896f-696f-854454526705	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-896f-696f-854454526705	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-896f-696f-854454526705	00030000-559a-896f-e90a-b27ec282a1e4
00020000-559a-896f-696f-854454526705	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-896f-696f-854454526705	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-896f-696f-854454526705	00030000-559a-896f-8ee7-2b4350f8dcbf
00020000-559a-896f-696f-854454526705	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-896f-696f-854454526705	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-896f-696f-854454526705	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-896f-696f-854454526705	00030000-559a-896f-66ed-71abce712457
00020000-559a-896f-696f-854454526705	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-896f-696f-854454526705	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-896f-696f-854454526705	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-896f-696f-854454526705	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-896f-696f-854454526705	00030000-559a-896f-536a-d0b7e8403cee
00020000-559a-896f-696f-854454526705	00030000-559a-896f-3496-faf2fb017cad
00020000-559a-896f-696f-854454526705	00030000-559a-896f-89d2-92eb25c066d4
00020000-559a-896f-696f-854454526705	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-896f-696f-854454526705	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-c5de-778cbcbc7ae3
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-7d3f-93660160aa81
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-72b6-329caba57896
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-536a-d0b7e8403cee
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-896f-163a-b6e29c79f0b2	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-72b6-329caba57896
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-66b0-9cbec8d82d50
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-0cf3-d935a8f66683
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-536a-d0b7e8403cee
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-896f-330e-429541cdf4de	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0435-f950c2fff6cb
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d72a-a8acadecddc2
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0cf3-d935a8f66683
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-68f9-01c277179c79
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-52dd-d07c101abd8d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-616d-68c7b12cf468
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-c5de-778cbcbc7ae3
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-c82b-6d1fe1126ef4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7d3f-93660160aa81
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-72b6-329caba57896
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-bc2f-90f4cfbf6166
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a646-de838752f398
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9699-53a3f84c4f69
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5365-1599431cab61
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-b70c-7f88b933fa47
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7afa-4870f19e0f7d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-52b4-3f78a38f8439
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-91fe-36852eb635ba
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-b2ed-7489c82d75ce
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-03af-34bf61843812
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9137-cc7d50926d5c
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0afc-c21a790128dd
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-2a0b-d6570b641d38
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-f0ab-8e7cdd7f87e8
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a2c9-8a1895dc2460
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0b03-959405c38a6a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d3e0-cf8750f7ad6f
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-e90a-b27ec282a1e4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7b59-e6e7e40b2c65
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d097-d4552d1574d3
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ed3e-f3342827e03d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-8f3b-b11676016bc5
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-535a-dc6d005914fd
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0a76-8aac858a0448
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-dd15-9cdb2b7bd598
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-1534-42cc2aa5e7d5
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0892-c9a0cf77da4e
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-8ee7-2b4350f8dcbf
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-f65f-681a585ba85a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-be01-10cca625dc32
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-1006-a570d0d20027
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-aafa-8159dedeb624
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-17a4-4d036e65e3be
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-6a94-d1031b932dd0
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0ecb-a94fb8e66aa7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-aab8-22c037a34b81
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d194-013eb8a82b3d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-f169-53ccd19b377a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-2645-e47b9ef323a1
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-60b3-0e5f0b6861ef
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9b92-5bd67861afa7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-e346-02939f499d47
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-896c-91ab6355533d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d7b6-1d6a89e14ff4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a03f-019cc5e4b5d2
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5be8-38ee489aeac9
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3aa0-5541b2493aed
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7ce7-421ac69c0e7a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3270-f9043da99da7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-66ed-71abce712457
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-c20f-3c3a4f275380
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a50f-61a32296bddb
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-980f-8c4a885ebf3e
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7dec-6ca1b9dfc961
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-755b-0e3f1f524f72
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-8a86-b490e3d5b112
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-c02b-9bbf7dae2c8d
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3e24-76de492a24ec
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-260b-73de2752d595
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-6fec-4e1da7ef23e6
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5858-400f803790aa
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5d35-a09feb95b3f8
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ed95-23816a600cab
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-2a90-6d1a0ac6ef59
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-0f4e-9fdc012d1c8a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-e299-8fdf548cbf58
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-4694-6666c66ca9c1
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3e28-44a9eb7c03fc
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-30e4-1b0535d6c00f
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-6951-ca4019186ce0
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9019-d4f9a4f35683
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9102-b50d19e14bf5
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a4e0-fd57d437cb33
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-e2ba-27c7cd7074e2
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-7ca1-f069c3e853a5
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-46b7-dbc5bf714ab7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-52ca-a54f43ac9451
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-dbd0-329b93560fc7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-f891-c917d715ed3b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-aa60-85db22ac0415
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-4f0b-3b6a484f4516
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-4055-59fc5ccca1f2
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-fc58-6da5acd5f2e4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-cdd7-018efe8df4a8
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-f87c-ed93d3671708
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-a4ba-803b72537484
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-b2f9-c2fb4ec0b3a4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-2af1-444b2adb73c6
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-04e4-21f8839cea42
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5cb0-74602e7f98dc
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d8a5-735445e44219
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-50b3-072629348bef
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-efb4-88816c363ae7
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-69b6-c56c93e62a1b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d7f6-5e11a6759975
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-6c8f-98e1461fb63b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-4c52-251b1809aeae
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-e2c5-3eb8526367d1
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-292d-10921a5018cc
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-66b0-9cbec8d82d50
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ec77-bad113bf0417
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-536a-d0b7e8403cee
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ae1f-3cf2ad1faf9e
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-b2ef-7a47614f900e
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-edd6-f8837f4b215b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3f23-abbf8d7ffff3
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-1b67-2d3be084fd12
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-d925-b6be96984fc8
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-44d4-1e65f7fc1029
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3496-faf2fb017cad
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ae7a-5c01f558f4f4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-6601-45c5da364240
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-238b-52f6177cc10a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-31e2-9e38da10a8f3
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-79ff-0b0d462d6c07
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-89d2-92eb25c066d4
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-331c-306178cbe029
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-5bb2-7e2f8623a22a
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-3ff1-a12aeed84849
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-9ac1-9e5f7cef9f1b
00020000-559a-8971-e270-ee3ba71ca8d3	00030000-559a-896f-ce0e-8f50650ba72e
\.


--
-- TOC entry 2885 (class 0 OID 9205423)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9205454)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9205567)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559a-8971-7437-4f2c76726be7	00090000-559a-8971-06cd-80d143947379	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
000b0000-559a-8971-4b72-e1de7e66a078	00090000-559a-8971-c6e6-3c14c95baca9	\N	\N	0002	401.00	\N	\N	11.00	31.00	11.00	401.00	t	f	Pogodba za vlogo Helena
000b0000-559a-8971-014f-f007bc9b511d	00090000-559a-8971-be9b-3d3eb5988032	\N	\N	0003	402.00	\N	\N	12.00	32.00	12.00	402.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9205188)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559a-8971-5454-7a3f3b600622	00040000-559a-896f-5cd7-90713a1a0c8a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-8d7f-acac01c243dd	00040000-559a-896f-5cd7-90713a1a0c8a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559a-8971-69a8-1e4f9cba850e	00040000-559a-896f-5cd7-90713a1a0c8a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-e019-d38b7da93469	00040000-559a-896f-5cd7-90713a1a0c8a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-85fd-946ce69466fb	00040000-559a-896f-5cd7-90713a1a0c8a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-6611-6675522f1e30	00040000-559a-896f-30ab-0a50d361f665	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-cec0-21f35e2757c9	00040000-559a-896f-708f-b6b8cdee240e	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-e5d2-ee955b25de89	00040000-559a-896f-6ab4-e582b974a42d	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559a-8971-953f-81fbdd1c4954	00040000-559a-896f-5cd7-90713a1a0c8a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9205223)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559a-896f-8425-1d39f51f5b92	8341	Adlešiči
00050000-559a-896f-f185-ac4b43d55d4e	5270	Ajdovščina
00050000-559a-896f-f425-e7ca5fb515aa	6280	Ankaran/Ancarano
00050000-559a-896f-733f-eaf1e243a604	9253	Apače
00050000-559a-896f-a9ed-65ed0f0a0563	8253	Artiče
00050000-559a-896f-1bc0-cfebed39b7fa	4275	Begunje na Gorenjskem
00050000-559a-896f-8901-404d7634b82d	1382	Begunje pri Cerknici
00050000-559a-896f-3d9b-290fd1c922ec	9231	Beltinci
00050000-559a-896f-ca76-7cb153dfb48f	2234	Benedikt
00050000-559a-896f-6d69-eaaf103dfff9	2345	Bistrica ob Dravi
00050000-559a-896f-a4f6-ace899877f67	3256	Bistrica ob Sotli
00050000-559a-896f-cd9e-5185d63a3f00	8259	Bizeljsko
00050000-559a-896f-c193-e23303a06dc0	1223	Blagovica
00050000-559a-896f-b89e-c55626e85408	8283	Blanca
00050000-559a-896f-6527-a208537b2816	4260	Bled
00050000-559a-896f-6508-fe38db18aec9	4273	Blejska Dobrava
00050000-559a-896f-2d2f-39fc160327b0	9265	Bodonci
00050000-559a-896f-00e4-66eb38dbbd3a	9222	Bogojina
00050000-559a-896f-dca5-19c81bf9d461	4263	Bohinjska Bela
00050000-559a-896f-c001-2424db45f682	4264	Bohinjska Bistrica
00050000-559a-896f-f399-2b79e60e26dd	4265	Bohinjsko jezero
00050000-559a-896f-9c70-e6a9d3d6d285	1353	Borovnica
00050000-559a-896f-a7ca-d77af886e3a4	8294	Boštanj
00050000-559a-896f-2ef5-3d6c7c157fd9	5230	Bovec
00050000-559a-896f-2761-b25c21f731d9	5295	Branik
00050000-559a-896f-5970-df247d8d4267	3314	Braslovče
00050000-559a-896f-2d6f-d9a8ffe48241	5223	Breginj
00050000-559a-896f-980d-eae524af09e9	8280	Brestanica
00050000-559a-896f-6755-2f74d6b43f97	2354	Bresternica
00050000-559a-896f-3fde-81824565d5a3	4243	Brezje
00050000-559a-896f-797f-c864dbec85d8	1351	Brezovica pri Ljubljani
00050000-559a-896f-ddc0-bae1aa2772f0	8250	Brežice
00050000-559a-896f-c5c0-5982cd67d1a8	4210	Brnik - Aerodrom
00050000-559a-896f-a994-b49a9a11a946	8321	Brusnice
00050000-559a-896f-d4f0-26246d4528e2	3255	Buče
00050000-559a-896f-11e2-c7a88bae3e36	8276	Bučka 
00050000-559a-896f-3513-f22d3b16093c	9261	Cankova
00050000-559a-896f-d674-24ecd89632d8	3000	Celje 
00050000-559a-896f-c56b-f3de61a28bfb	3001	Celje - poštni predali
00050000-559a-896f-794b-6e1ed36ab3e5	4207	Cerklje na Gorenjskem
00050000-559a-896f-d368-23708ba22ed5	8263	Cerklje ob Krki
00050000-559a-896f-aac7-ffb7df520c58	1380	Cerknica
00050000-559a-896f-f5fc-7cb4abfea730	5282	Cerkno
00050000-559a-896f-ab0b-b38e5c7ffcc1	2236	Cerkvenjak
00050000-559a-896f-13a1-986f0d2daaee	2215	Ceršak
00050000-559a-896f-747e-a7c30ab4f968	2326	Cirkovce
00050000-559a-896f-5e38-ffe9da90077c	2282	Cirkulane
00050000-559a-896f-105c-cc59f4ddaaa0	5273	Col
00050000-559a-896f-b068-278f02409a10	8251	Čatež ob Savi
00050000-559a-896f-40d1-edcfa78f0ec4	1413	Čemšenik
00050000-559a-896f-ddad-db367febf338	5253	Čepovan
00050000-559a-896f-f64a-e2bf9ae800d5	9232	Črenšovci
00050000-559a-896f-65d2-09f0352a6701	2393	Črna na Koroškem
00050000-559a-896f-b20e-21b458149deb	6275	Črni Kal
00050000-559a-896f-11d6-0317c08ea1c6	5274	Črni Vrh nad Idrijo
00050000-559a-896f-e500-76b011ad4f83	5262	Črniče
00050000-559a-896f-466f-baca1f5fff83	8340	Črnomelj
00050000-559a-896f-0d3c-2006f81f516b	6271	Dekani
00050000-559a-896f-7410-d9ba46fb8458	5210	Deskle
00050000-559a-896f-9fbb-3f03f4a7ead3	2253	Destrnik
00050000-559a-896f-7299-d1b335c6e6c5	6215	Divača
00050000-559a-896f-3abd-4692763df892	1233	Dob
00050000-559a-896f-f176-70b46e9a8f41	3224	Dobje pri Planini
00050000-559a-896f-42ca-1195dba8c4f9	8257	Dobova
00050000-559a-896f-3c32-bb84ee044d15	1423	Dobovec
00050000-559a-896f-8c29-adf60a68cadc	5263	Dobravlje
00050000-559a-896f-85df-6ee430dc8ca5	3204	Dobrna
00050000-559a-896f-6350-88001509a749	8211	Dobrnič
00050000-559a-896f-58fb-b23c14468c89	1356	Dobrova
00050000-559a-8970-419a-d54f77722848	9223	Dobrovnik/Dobronak 
00050000-559a-8970-3b41-0a8e06cd112c	5212	Dobrovo v Brdih
00050000-559a-8970-59d7-2dfa42d67a0c	1431	Dol pri Hrastniku
00050000-559a-8970-963a-0eec10f1bbb2	1262	Dol pri Ljubljani
00050000-559a-8970-f7f8-2f603f5a0175	1273	Dole pri Litiji
00050000-559a-8970-5c38-3637556a8f8b	1331	Dolenja vas
00050000-559a-8970-c0c7-5896d9d4f9f2	8350	Dolenjske Toplice
00050000-559a-8970-d3a4-154362038f33	1230	Domžale
00050000-559a-8970-aadd-97c7fac2e00b	2252	Dornava
00050000-559a-8970-079d-8b0076380c02	5294	Dornberk
00050000-559a-8970-7acc-5a128e4bb5a2	1319	Draga
00050000-559a-8970-c0e5-71855fb93251	8343	Dragatuš
00050000-559a-8970-9ceb-5888ee63adce	3222	Dramlje
00050000-559a-8970-452e-5c59012aec4a	2370	Dravograd
00050000-559a-8970-0ee6-72de14013777	4203	Duplje
00050000-559a-8970-b05e-fbfd611a3189	6221	Dutovlje
00050000-559a-8970-374a-896a1f3ee034	8361	Dvor
00050000-559a-8970-1ffb-4043008fc056	2343	Fala
00050000-559a-8970-5cac-095382d54a56	9208	Fokovci
00050000-559a-8970-8bf6-7cda984d5d3e	2313	Fram
00050000-559a-8970-744b-5b47464f3f03	3213	Frankolovo
00050000-559a-8970-5560-480ce3c247c5	1274	Gabrovka
00050000-559a-8970-6519-799649d9bee4	8254	Globoko
00050000-559a-8970-96f4-80a16b2981fb	5275	Godovič
00050000-559a-8970-6a5b-33cf68de95dd	4204	Golnik
00050000-559a-8970-1022-59854a39e081	3303	Gomilsko
00050000-559a-8970-0bd3-ae23fb1f8025	4224	Gorenja vas
00050000-559a-8970-daae-d8eb63fdd1df	3263	Gorica pri Slivnici
00050000-559a-8970-e20a-73d6794d99b2	2272	Gorišnica
00050000-559a-8970-13b8-bd128eed4879	9250	Gornja Radgona
00050000-559a-8970-b05f-218303d121e7	3342	Gornji Grad
00050000-559a-8970-cb29-c1fd797011ed	4282	Gozd Martuljek
00050000-559a-8970-0a8f-354409f141c1	6272	Gračišče
00050000-559a-8970-748b-f162ad695d0d	9264	Grad
00050000-559a-8970-fbd6-a172eb7b29b2	8332	Gradac
00050000-559a-8970-ef17-f79b13e77147	1384	Grahovo
00050000-559a-8970-7934-876e2ebba68e	5242	Grahovo ob Bači
00050000-559a-8970-7665-f58fd668b848	5251	Grgar
00050000-559a-8970-c423-c059f8ba5b2c	3302	Griže
00050000-559a-8970-0605-c2c78a2e9fe6	3231	Grobelno
00050000-559a-8970-a82e-2a8fa0d1949c	1290	Grosuplje
00050000-559a-8970-7077-98b9b7737c32	2288	Hajdina
00050000-559a-8970-2549-a6b42ea3be6e	8362	Hinje
00050000-559a-8970-2665-6b347989b939	2311	Hoče
00050000-559a-8970-ce82-1144a16a3039	9205	Hodoš/Hodos
00050000-559a-8970-9b13-67d406d18b03	1354	Horjul
00050000-559a-8970-ccd9-cde2885d4532	1372	Hotedršica
00050000-559a-8970-b663-e6d07c12f1e2	1430	Hrastnik
00050000-559a-8970-09a1-05e1fdab4def	6225	Hruševje
00050000-559a-8970-5833-8fd090ce21eb	4276	Hrušica
00050000-559a-8970-3053-8afddb1185cc	5280	Idrija
00050000-559a-8970-ca92-bc1294134d0e	1292	Ig
00050000-559a-8970-5afa-afc0f3cae933	6250	Ilirska Bistrica
00050000-559a-8970-82f5-523e7d9aa20b	6251	Ilirska Bistrica-Trnovo
00050000-559a-8970-2512-6f9dfb4af7e9	1295	Ivančna Gorica
00050000-559a-8970-578a-666cb2eb0918	2259	Ivanjkovci
00050000-559a-8970-533c-cefceb3453ff	1411	Izlake
00050000-559a-8970-f7e3-eef1946ac0cd	6310	Izola/Isola
00050000-559a-8970-0e71-6273562d63c3	2222	Jakobski Dol
00050000-559a-8970-c1e7-f296e0c0981e	2221	Jarenina
00050000-559a-8970-e078-994af7391b0a	6254	Jelšane
00050000-559a-8970-be09-5dfa514eead4	4270	Jesenice
00050000-559a-8970-7943-87072359af78	8261	Jesenice na Dolenjskem
00050000-559a-8970-45f7-6161457e96e5	3273	Jurklošter
00050000-559a-8970-1530-c796b4f22d15	2223	Jurovski Dol
00050000-559a-8970-b279-f50503036f5f	2256	Juršinci
00050000-559a-8970-088e-7f6cc01a4b6b	5214	Kal nad Kanalom
00050000-559a-8970-a41a-3819a3f03e21	3233	Kalobje
00050000-559a-8970-8312-62fc784a5296	4246	Kamna Gorica
00050000-559a-8970-0e0d-ddd0143af378	2351	Kamnica
00050000-559a-8970-cfa2-4c581e3a7b2b	1241	Kamnik
00050000-559a-8970-f5a6-f9c0ee925bdb	5213	Kanal
00050000-559a-8970-798b-5a5a63c71558	8258	Kapele
00050000-559a-8970-8ea8-50a0f5579633	2362	Kapla
00050000-559a-8970-f352-d7f7841ff75b	2325	Kidričevo
00050000-559a-8970-3a2d-b24c35e5ea38	1412	Kisovec
00050000-559a-8970-e8c2-aaf503bb5cea	6253	Knežak
00050000-559a-8970-4a95-74fbb9b2195e	5222	Kobarid
00050000-559a-8970-ba5d-14aa32338646	9227	Kobilje
00050000-559a-8970-e1fb-97e810036c3b	1330	Kočevje
00050000-559a-8970-7864-c572def1bffa	1338	Kočevska Reka
00050000-559a-8970-32cf-d5d940863bd9	2276	Kog
00050000-559a-8970-c8b7-9bc3161d10e3	5211	Kojsko
00050000-559a-8970-0255-034c3f1fb972	6223	Komen
00050000-559a-8970-f902-bb823be09337	1218	Komenda
00050000-559a-8970-772a-d59cd550c7ba	6000	Koper/Capodistria 
00050000-559a-8970-274e-6a4c22b584f7	6001	Koper/Capodistria - poštni predali
00050000-559a-8970-4259-ab22c4943e1f	8282	Koprivnica
00050000-559a-8970-27d3-712c6846b8c4	5296	Kostanjevica na Krasu
00050000-559a-8970-a7cc-f1d35b82360c	8311	Kostanjevica na Krki
00050000-559a-8970-4c73-1c1c1966aefa	1336	Kostel
00050000-559a-8970-f391-242179e4c797	6256	Košana
00050000-559a-8970-11a3-948fd649b5d5	2394	Kotlje
00050000-559a-8970-5695-317f128d89af	6240	Kozina
00050000-559a-8970-bb71-60ebc089a1f0	3260	Kozje
00050000-559a-8970-7996-414f6a68a2de	4000	Kranj 
00050000-559a-8970-f7be-8380f34c33e2	4001	Kranj - poštni predali
00050000-559a-8970-a4c1-b69b15419fc3	4280	Kranjska Gora
00050000-559a-8970-e866-d511ce466d6b	1281	Kresnice
00050000-559a-8970-3642-b86f75f1c605	4294	Križe
00050000-559a-8970-2e6f-c811041ab33a	9206	Križevci
00050000-559a-8970-dfc7-580bdb76e790	9242	Križevci pri Ljutomeru
00050000-559a-8970-6805-08d5edcdc088	1301	Krka
00050000-559a-8970-e96a-2e06c3874349	8296	Krmelj
00050000-559a-8970-c839-1fdb28877584	4245	Kropa
00050000-559a-8970-b7d6-4844da292b53	8262	Krška vas
00050000-559a-8970-de89-6d8d77166b1b	8270	Krško
00050000-559a-8970-339a-52a206eb092c	9263	Kuzma
00050000-559a-8970-1d25-fe7a7a71ee49	2318	Laporje
00050000-559a-8970-ecf3-621a085e7cd0	3270	Laško
00050000-559a-8970-d41f-897e0efd7397	1219	Laze v Tuhinju
00050000-559a-8970-32b8-bf2d8e95b196	2230	Lenart v Slovenskih goricah
00050000-559a-8970-06eb-435e04af51f1	9220	Lendava/Lendva
00050000-559a-8970-88de-e5580d8043ab	4248	Lesce
00050000-559a-8970-9a03-d06b03c1868e	3261	Lesično
00050000-559a-8970-bb93-1ea56370629b	8273	Leskovec pri Krškem
00050000-559a-8970-5890-7ed2de2e0ca2	2372	Libeliče
00050000-559a-8970-a0a5-6d47a3419ed9	2341	Limbuš
00050000-559a-8970-e676-4bd093655068	1270	Litija
00050000-559a-8970-0297-d302a78a2b11	3202	Ljubečna
00050000-559a-8970-f586-024250872ab6	1000	Ljubljana 
00050000-559a-8970-14af-07ca6f5c82e4	1001	Ljubljana - poštni predali
00050000-559a-8970-05e6-d226fe660944	1231	Ljubljana - Črnuče
00050000-559a-8970-db1e-22678da778d9	1261	Ljubljana - Dobrunje
00050000-559a-8970-8fce-ffd71e545517	1260	Ljubljana - Polje
00050000-559a-8970-cf56-5ccbe14d56ce	1210	Ljubljana - Šentvid
00050000-559a-8970-d4df-ebb48de22d51	1211	Ljubljana - Šmartno
00050000-559a-8970-fa69-1355b2bf3fb2	3333	Ljubno ob Savinji
00050000-559a-8970-b029-7ae4ae333746	9240	Ljutomer
00050000-559a-8970-4793-fd29070651d1	3215	Loče
00050000-559a-8970-aac6-56eddd839d1e	5231	Log pod Mangartom
00050000-559a-8970-f065-7bf2313c405c	1358	Log pri Brezovici
00050000-559a-8970-f52b-df458a058f04	1370	Logatec
00050000-559a-8970-4dd4-7f144e7083bf	1371	Logatec
00050000-559a-8970-0d24-fc7cda036fe2	1434	Loka pri Zidanem Mostu
00050000-559a-8970-e022-ff4c63ccb867	3223	Loka pri Žusmu
00050000-559a-8970-ee7b-16c1c20118b3	6219	Lokev
00050000-559a-8970-c313-78729a5ec856	1318	Loški Potok
00050000-559a-8970-3862-2320d9e91ec1	2324	Lovrenc na Dravskem polju
00050000-559a-8970-29f3-72670b977596	2344	Lovrenc na Pohorju
00050000-559a-8970-5578-a4a80131b1db	3334	Luče
00050000-559a-8970-353e-9631c3d7f0d9	1225	Lukovica
00050000-559a-8970-3b00-93d2001e0436	9202	Mačkovci
00050000-559a-8970-e6d4-7828c1c3770b	2322	Majšperk
00050000-559a-8970-48be-471cef38cc8a	2321	Makole
00050000-559a-8970-46ad-3eb29f710dc2	9243	Mala Nedelja
00050000-559a-8970-0c80-45ed33b31802	2229	Malečnik
00050000-559a-8970-24d4-c8b3bcd279f2	6273	Marezige
00050000-559a-8970-fa3f-dcd9f5d9b284	2000	Maribor 
00050000-559a-8970-341f-a717ee13a4a6	2001	Maribor - poštni predali
00050000-559a-8970-a9db-d7372013db6c	2206	Marjeta na Dravskem polju
00050000-559a-8970-5ccd-8a00a2325456	2281	Markovci
00050000-559a-8970-a58f-cd23b5cb23d1	9221	Martjanci
00050000-559a-8970-7c39-4065d5d73dcb	6242	Materija
00050000-559a-8970-f140-b1a37c1c1d25	4211	Mavčiče
00050000-559a-8970-45b7-afa8ffe9ef9c	1215	Medvode
00050000-559a-8970-e2ac-5d827b2d1ad1	1234	Mengeš
00050000-559a-8970-1af5-d4131dcd6523	8330	Metlika
00050000-559a-8970-35a7-1137695c987d	2392	Mežica
00050000-559a-8970-8dba-fada48e540a4	2204	Miklavž na Dravskem polju
00050000-559a-8970-3a0d-9d2ffa82524d	2275	Miklavž pri Ormožu
00050000-559a-8970-ddbe-0317e6fd9a55	5291	Miren
00050000-559a-8970-f98d-1093137281aa	8233	Mirna
00050000-559a-8970-9bd1-69e84d6210d8	8216	Mirna Peč
00050000-559a-8970-6549-8e4586f6f70a	2382	Mislinja
00050000-559a-8970-24ea-fd84da60b21f	4281	Mojstrana
00050000-559a-8970-559b-714ae7e768e7	8230	Mokronog
00050000-559a-8970-0043-85312aa32850	1251	Moravče
00050000-559a-8970-b7ab-92c180e80691	9226	Moravske Toplice
00050000-559a-8970-d10e-162043cb62b9	5216	Most na Soči
00050000-559a-8970-aeb9-2bac825bd37d	1221	Motnik
00050000-559a-8970-610a-792f1c486060	3330	Mozirje
00050000-559a-8970-5a77-37ca7adf20b4	9000	Murska Sobota 
00050000-559a-8970-7634-f5af6195dd31	9001	Murska Sobota - poštni predali
00050000-559a-8970-cfae-3f68c9cc5908	2366	Muta
00050000-559a-8970-5644-2a7b00ee4528	4202	Naklo
00050000-559a-8970-1a86-dcef84a6870b	3331	Nazarje
00050000-559a-8970-238e-00c07c2b1d1c	1357	Notranje Gorice
00050000-559a-8970-4f22-f602ffcdd1c9	3203	Nova Cerkev
00050000-559a-8970-d6c9-8c66760e818f	5000	Nova Gorica 
00050000-559a-8970-6d55-1f5aef219643	5001	Nova Gorica - poštni predali
00050000-559a-8970-db1d-ee5ade160c75	1385	Nova vas
00050000-559a-8970-0cc1-97f9391306c4	8000	Novo mesto
00050000-559a-8970-006f-566a09780369	8001	Novo mesto - poštni predali
00050000-559a-8970-5005-854656df1c27	6243	Obrov
00050000-559a-8970-17b8-bc420bce937d	9233	Odranci
00050000-559a-8970-7366-5992582692f4	2317	Oplotnica
00050000-559a-8970-0565-994020745180	2312	Orehova vas
00050000-559a-8970-87b3-e135cd645107	2270	Ormož
00050000-559a-8970-5219-25252c5b8939	1316	Ortnek
00050000-559a-8970-d021-c5811fe109af	1337	Osilnica
00050000-559a-8970-d0c0-2f8cfedc2ffd	8222	Otočec
00050000-559a-8970-2a96-c2cac4a945ea	2361	Ožbalt
00050000-559a-8970-a08c-759f04b75044	2231	Pernica
00050000-559a-8970-3760-c5dab7df7d57	2211	Pesnica pri Mariboru
00050000-559a-8970-fd56-8c64d6f8ba4d	9203	Petrovci
00050000-559a-8970-8d49-6f59c1e52b3f	3301	Petrovče
00050000-559a-8970-4f5a-5c0aaf3a4cb6	6330	Piran/Pirano
00050000-559a-8970-b41b-d1d307489ee4	8255	Pišece
00050000-559a-8970-e184-47ac2cc0d1cc	6257	Pivka
00050000-559a-8970-cc9a-e4c73c3f18d9	6232	Planina
00050000-559a-8970-799e-158388710b4c	3225	Planina pri Sevnici
00050000-559a-8970-7ede-106702778007	6276	Pobegi
00050000-559a-8970-6cad-6334e64508e2	8312	Podbočje
00050000-559a-8970-1e11-48082f6c3254	5243	Podbrdo
00050000-559a-8970-0637-34f9cd7b4cfe	3254	Podčetrtek
00050000-559a-8970-a77c-8a661a3242ab	2273	Podgorci
00050000-559a-8970-8670-d18318417c53	6216	Podgorje
00050000-559a-8970-aded-fb19a0bcd6c8	2381	Podgorje pri Slovenj Gradcu
00050000-559a-8970-3fc8-8947addec086	6244	Podgrad
00050000-559a-8970-01c5-597f7a67629e	1414	Podkum
00050000-559a-8970-289f-6d5db14eaac8	2286	Podlehnik
00050000-559a-8970-d455-a10189f772d3	5272	Podnanos
00050000-559a-8970-f245-9b21ca1a7f6b	4244	Podnart
00050000-559a-8970-fa96-a4627aac1765	3241	Podplat
00050000-559a-8970-0660-510036ce2635	3257	Podsreda
00050000-559a-8970-2f15-d34149452ee9	2363	Podvelka
00050000-559a-8970-3983-affaa9bb030e	2208	Pohorje
00050000-559a-8970-8d9f-a3f94402a489	2257	Polenšak
00050000-559a-8970-b770-643791190b8f	1355	Polhov Gradec
00050000-559a-8970-4dfd-36474c5d6177	4223	Poljane nad Škofjo Loko
00050000-559a-8970-4938-94243e87c27e	2319	Poljčane
00050000-559a-8970-d3ec-f9f2f348861f	1272	Polšnik
00050000-559a-8970-51de-45a847b02074	3313	Polzela
00050000-559a-8970-ebd8-8f44ae35433d	3232	Ponikva
00050000-559a-8970-b747-816467c0b0ad	6320	Portorož/Portorose
00050000-559a-8970-5203-dbde20777961	6230	Postojna
00050000-559a-8970-3696-d2fbf0f968e6	2331	Pragersko
00050000-559a-8970-5550-bb3fe66072f3	3312	Prebold
00050000-559a-8970-a313-0519bdd53973	4205	Preddvor
00050000-559a-8970-19f0-0a6806bdb1f3	6255	Prem
00050000-559a-8970-3092-9f08ff577b64	1352	Preserje
00050000-559a-8970-68c9-d321db54745d	6258	Prestranek
00050000-559a-8970-cefe-817907e942a3	2391	Prevalje
00050000-559a-8970-794e-0440a1fb4fc0	3262	Prevorje
00050000-559a-8970-9201-591afdb0adcb	1276	Primskovo 
00050000-559a-8970-f97d-b6deb95b663e	3253	Pristava pri Mestinju
00050000-559a-8970-bb8d-02768e9e2d27	9207	Prosenjakovci/Partosfalva
00050000-559a-8970-1256-1813cb8b0aeb	5297	Prvačina
00050000-559a-8970-a444-83a04272429e	2250	Ptuj
00050000-559a-8970-8592-b29bf29b4fe3	2323	Ptujska Gora
00050000-559a-8970-1649-2e39477fd84d	9201	Puconci
00050000-559a-8970-aebb-55f3f29c8d68	2327	Rače
00050000-559a-8970-c1b5-dde94101cfe7	1433	Radeče
00050000-559a-8970-22fb-4993b3163135	9252	Radenci
00050000-559a-8970-167d-0a6f49222d16	2360	Radlje ob Dravi
00050000-559a-8970-6ff4-36cf77188927	1235	Radomlje
00050000-559a-8970-ec30-65d24de6b4a6	4240	Radovljica
00050000-559a-8970-4adb-04a28e165c8b	8274	Raka
00050000-559a-8970-a57d-fd30149cc43a	1381	Rakek
00050000-559a-8970-991c-1b6cf7575aab	4283	Rateče - Planica
00050000-559a-8970-e244-b5fc26c074f9	2390	Ravne na Koroškem
00050000-559a-8970-e55e-3891d5d969cf	9246	Razkrižje
00050000-559a-8970-9d55-3709ac84e7a3	3332	Rečica ob Savinji
00050000-559a-8970-37b9-91201555cb3b	5292	Renče
00050000-559a-8970-ac2f-4c5b0e152ce9	1310	Ribnica
00050000-559a-8970-4606-b86d39b9a365	2364	Ribnica na Pohorju
00050000-559a-8970-b8f4-44fe7430d976	3272	Rimske Toplice
00050000-559a-8970-bb56-c9b5921c0bee	1314	Rob
00050000-559a-8970-9832-9bf37e0e7b27	5215	Ročinj
00050000-559a-8970-04c3-230e880db620	3250	Rogaška Slatina
00050000-559a-8970-ce75-ab7d5c179116	9262	Rogašovci
00050000-559a-8970-abec-c05ae16fe181	3252	Rogatec
00050000-559a-8970-a8ea-57f24f5494e2	1373	Rovte
00050000-559a-8970-d634-b23e4ad81824	2342	Ruše
00050000-559a-8970-5a30-19ff99ea232e	1282	Sava
00050000-559a-8970-e9e4-84894e876032	6333	Sečovlje/Sicciole
00050000-559a-8970-c0c8-b72f4a909f30	4227	Selca
00050000-559a-8970-279f-c86d1a9a586b	2352	Selnica ob Dravi
00050000-559a-8970-9dbd-04e4372fef1e	8333	Semič
00050000-559a-8970-b1e9-9e903c6a4dd9	8281	Senovo
00050000-559a-8970-3ac7-e0b992f84e62	6224	Senožeče
00050000-559a-8970-3e12-bb9afec42f19	8290	Sevnica
00050000-559a-8970-1e23-722b9fe49a94	6210	Sežana
00050000-559a-8970-f3a2-24b4dc941b48	2214	Sladki Vrh
00050000-559a-8970-2bc8-a389d85bc365	5283	Slap ob Idrijci
00050000-559a-8970-e457-2378b1e9aabf	2380	Slovenj Gradec
00050000-559a-8970-ea96-86abe85802f6	2310	Slovenska Bistrica
00050000-559a-8970-645a-d846bd038c31	3210	Slovenske Konjice
00050000-559a-8970-71c4-ae4564f2ae89	1216	Smlednik
00050000-559a-8970-8cbd-eebe3bdc2a54	5232	Soča
00050000-559a-8970-1286-a16352b593ba	1317	Sodražica
00050000-559a-8970-0228-76668c954c0e	3335	Solčava
00050000-559a-8970-5cfb-6e3ae1b3b60f	5250	Solkan
00050000-559a-8970-9037-ffcb9c8dca72	4229	Sorica
00050000-559a-8970-9e3d-e4335dcd0b09	4225	Sovodenj
00050000-559a-8970-def6-07047dc51ab8	5281	Spodnja Idrija
00050000-559a-8970-8618-6158976c6df3	2241	Spodnji Duplek
00050000-559a-8970-4dc6-470dc9d21cea	9245	Spodnji Ivanjci
00050000-559a-8970-b916-797e0d83bd89	2277	Središče ob Dravi
00050000-559a-8970-890f-98ed91512639	4267	Srednja vas v Bohinju
00050000-559a-8970-4967-8529ee0dec0c	8256	Sromlje 
00050000-559a-8970-ed92-7cd36fd09aca	5224	Srpenica
00050000-559a-8970-ce05-eb4f6f83c412	1242	Stahovica
00050000-559a-8970-c92a-06ea55d9ac96	1332	Stara Cerkev
00050000-559a-8970-aee0-fe23d72cea11	8342	Stari trg ob Kolpi
00050000-559a-8970-a469-e6e120c9f783	1386	Stari trg pri Ložu
00050000-559a-8970-9485-5d8b33bf1b6a	2205	Starše
00050000-559a-8970-fd8a-d451ff0939fc	2289	Stoperce
00050000-559a-8970-e2fe-bb14a99fc6ba	8322	Stopiče
00050000-559a-8970-8f36-e2f942b0aa6d	3206	Stranice
00050000-559a-8970-81d2-c0e742562627	8351	Straža
00050000-559a-8970-4f1a-86f8197c136c	1313	Struge
00050000-559a-8970-7e66-9e83db6dc301	8293	Studenec
00050000-559a-8970-8c13-b00ca55091a5	8331	Suhor
00050000-559a-8970-1be3-170677645b15	2233	Sv. Ana v Slovenskih goricah
00050000-559a-8970-1d76-00e734ffe4c0	2235	Sv. Trojica v Slovenskih goricah
00050000-559a-8970-83cf-f38a0dfeda1a	2353	Sveti Duh na Ostrem Vrhu
00050000-559a-8970-c23e-f7027853250a	9244	Sveti Jurij ob Ščavnici
00050000-559a-8970-cd37-6c21132c1f90	3264	Sveti Štefan
00050000-559a-8970-9d3f-b4b840814c19	2258	Sveti Tomaž
00050000-559a-8970-1186-ee37ce4723dd	9204	Šalovci
00050000-559a-8970-10db-ad55acc6c18f	5261	Šempas
00050000-559a-8970-1e00-d3e555c9cf82	5290	Šempeter pri Gorici
00050000-559a-8970-44e2-1c602bbccc76	3311	Šempeter v Savinjski dolini
00050000-559a-8970-19bd-6665cda4ad6e	4208	Šenčur
00050000-559a-8970-10ac-0a16d985efdf	2212	Šentilj v Slovenskih goricah
00050000-559a-8970-2681-2a6a1cd708ed	8297	Šentjanž
00050000-559a-8970-713d-5268ca2c5ca5	2373	Šentjanž pri Dravogradu
00050000-559a-8970-0e6f-2df3b64e8dc4	8310	Šentjernej
00050000-559a-8970-e9af-4fa803578fdc	3230	Šentjur
00050000-559a-8970-352f-8dbb6bf76bd7	3271	Šentrupert
00050000-559a-8970-79ac-007e7d42ee7c	8232	Šentrupert
00050000-559a-8970-602a-81b5fd5a1d7d	1296	Šentvid pri Stični
00050000-559a-8970-2461-99d5987593ce	8275	Škocjan
00050000-559a-8970-fdd5-5c71b016e84c	6281	Škofije
00050000-559a-8970-6f70-c528205d8eb0	4220	Škofja Loka
00050000-559a-8970-4e42-dd32d0142d30	3211	Škofja vas
00050000-559a-8970-c4f9-82d2558c9e17	1291	Škofljica
00050000-559a-8970-8dbe-71758224634a	6274	Šmarje
00050000-559a-8970-b59f-c31eb252327d	1293	Šmarje - Sap
00050000-559a-8970-c129-0af5f255b438	3240	Šmarje pri Jelšah
00050000-559a-8970-4dfb-1a8083749c24	8220	Šmarješke Toplice
00050000-559a-8970-0894-a53d97faaa02	2315	Šmartno na Pohorju
00050000-559a-8970-1425-38360bd7c5ed	3341	Šmartno ob Dreti
00050000-559a-8970-f5e1-5b8ac03ceca4	3327	Šmartno ob Paki
00050000-559a-8970-5989-a4daea80bdff	1275	Šmartno pri Litiji
00050000-559a-8970-959a-9a1493ca6e7d	2383	Šmartno pri Slovenj Gradcu
00050000-559a-8970-accc-5eef30818627	3201	Šmartno v Rožni dolini
00050000-559a-8970-e03a-fbb9e7928514	3325	Šoštanj
00050000-559a-8970-ad57-0ce8e6ddaa14	6222	Štanjel
00050000-559a-8970-b6b0-175833ec42b9	3220	Štore
00050000-559a-8970-afb0-2bff6ce376fa	3304	Tabor
00050000-559a-8970-6969-3c1b8b183dd8	3221	Teharje
00050000-559a-8970-e03b-411fa30aeaf9	9251	Tišina
00050000-559a-8970-831c-bacfd1c19e01	5220	Tolmin
00050000-559a-8970-5058-d72e2f6c4e33	3326	Topolšica
00050000-559a-8970-92cc-1feeb065b00f	2371	Trbonje
00050000-559a-8970-7cdc-44c8fbe87412	1420	Trbovlje
00050000-559a-8970-f8b9-39544fb61752	8231	Trebelno 
00050000-559a-8970-b9c0-573329e893d4	8210	Trebnje
00050000-559a-8970-144a-949fcedeb630	5252	Trnovo pri Gorici
00050000-559a-8970-6eb5-7ea631383c11	2254	Trnovska vas
00050000-559a-8970-07c7-5d71a1459106	1222	Trojane
00050000-559a-8970-8200-1780f055dfeb	1236	Trzin
00050000-559a-8970-ee97-4891fb992d0f	4290	Tržič
00050000-559a-8970-acf6-8fd33010d608	8295	Tržišče
00050000-559a-8970-82e1-13d8ec825546	1311	Turjak
00050000-559a-8970-8f25-ef8dba9e01c9	9224	Turnišče
00050000-559a-8970-39d4-1a2bb28e6f1f	8323	Uršna sela
00050000-559a-8970-55c3-4ac654e5053f	1252	Vače
00050000-559a-8970-fc46-009458877d7b	3320	Velenje 
00050000-559a-8970-05a1-01d739ce617a	3322	Velenje - poštni predali
00050000-559a-8970-1984-2f8fbdb59f7b	8212	Velika Loka
00050000-559a-8970-78d4-20c103a54a23	2274	Velika Nedelja
00050000-559a-8970-1fa7-c813c7e592fc	9225	Velika Polana
00050000-559a-8970-c2ad-7ebcb8100828	1315	Velike Lašče
00050000-559a-8970-bbda-108985be6e56	8213	Veliki Gaber
00050000-559a-8970-ed36-c6237894b016	9241	Veržej
00050000-559a-8970-6f32-73971a15d999	1312	Videm - Dobrepolje
00050000-559a-8970-68d2-2a4a96a06fb1	2284	Videm pri Ptuju
00050000-559a-8970-9d1c-bc907518dbb9	8344	Vinica
00050000-559a-8970-4ddc-e86ba98f3c17	5271	Vipava
00050000-559a-8970-97f3-7200141fee76	4212	Visoko
00050000-559a-8970-d6e0-c9233896bdc5	1294	Višnja Gora
00050000-559a-8970-b78e-40dc1bac84f2	3205	Vitanje
00050000-559a-8970-33b3-f5bf9643ddf5	2255	Vitomarci
00050000-559a-8970-5939-096d56b94af5	1217	Vodice
00050000-559a-8970-e744-00bb9732cb6d	3212	Vojnik\t
00050000-559a-8970-9e78-9d6ae8c2d7f7	5293	Volčja Draga
00050000-559a-8970-40ca-0b603b528dd3	2232	Voličina
00050000-559a-8970-ed1f-54bd423f3e00	3305	Vransko
00050000-559a-8970-f3c0-bab94c6d5aac	6217	Vremski Britof
00050000-559a-8970-3ca3-67cd531150cf	1360	Vrhnika
00050000-559a-8970-2164-991fd5d5027b	2365	Vuhred
00050000-559a-8970-4084-7595ad28c501	2367	Vuzenica
00050000-559a-8970-ff82-4a4ba4607f28	8292	Zabukovje 
00050000-559a-8970-7fb0-5e4f87915c36	1410	Zagorje ob Savi
00050000-559a-8970-3c10-12defd81b1f8	1303	Zagradec
00050000-559a-8970-8fec-22a88e1c0277	2283	Zavrč
00050000-559a-8970-0da2-b640d57b322d	8272	Zdole 
00050000-559a-8970-6582-de993e5d55da	4201	Zgornja Besnica
00050000-559a-8970-faae-b3f0709b0dcf	2242	Zgornja Korena
00050000-559a-8970-cf01-0e9028327744	2201	Zgornja Kungota
00050000-559a-8970-e0a9-d1ccc2a62342	2316	Zgornja Ložnica
00050000-559a-8970-6cb2-18f85694761e	2314	Zgornja Polskava
00050000-559a-8970-9297-98c4159a93a5	2213	Zgornja Velka
00050000-559a-8970-bf69-5e50fdb2d0a1	4247	Zgornje Gorje
00050000-559a-8970-7549-8589ea1923aa	4206	Zgornje Jezersko
00050000-559a-8970-fd08-0af175368e07	2285	Zgornji Leskovec
00050000-559a-8970-d403-253b2d52738f	1432	Zidani Most
00050000-559a-8970-f97e-14b409aa09d7	3214	Zreče
00050000-559a-8970-d812-b0aa34f8fca8	4209	Žabnica
00050000-559a-8970-a720-6c255e60971c	3310	Žalec
00050000-559a-8970-50f8-dd1ad5b505b0	4228	Železniki
00050000-559a-8970-0573-ecce7c4b0d0f	2287	Žetale
00050000-559a-8970-36a2-c24b4e3d4da6	4226	Žiri
00050000-559a-8970-5460-026092253834	4274	Žirovnica
00050000-559a-8970-ae50-d15134cc6788	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9205397)
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
-- TOC entry 2863 (class 0 OID 9205208)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9205286)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9205409)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9205716)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9205727)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559a-8971-6ec7-29712516f0a6	00080000-559a-8971-953f-81fbdd1c4954	0900	AK
00190000-559a-8971-7d35-b5457c88e1ed	00080000-559a-8971-69a8-1e4f9cba850e	0987	A
00190000-559a-8971-034a-b09ad5a6a6a6	00080000-559a-8971-8d7f-acac01c243dd	0989	A
00190000-559a-8971-e06c-cba215959c67	00080000-559a-8971-e019-d38b7da93469	0986	A
00190000-559a-8971-240d-f73923904105	00080000-559a-8971-6611-6675522f1e30	0984	A
00190000-559a-8971-2720-515cd349a322	00080000-559a-8971-cec0-21f35e2757c9	0983	A
00190000-559a-8971-d844-19114c56a0e9	00080000-559a-8971-e5d2-ee955b25de89	0982	A
\.


--
-- TOC entry 2905 (class 0 OID 9205697)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
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
-- TOC entry 2887 (class 0 OID 9205438)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559a-8971-d43f-91f02c75bbe1	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559a-8971-3aca-c2c23a0b453e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559a-8971-5e5a-7b763cf9519d	0003	Kazinska	t	84	Kazinska dvorana
00220000-559a-8971-b41b-a2e15fa01363	0004	Mali oder	t	24	Mali oder 
00220000-559a-8971-5813-fae09226034b	0005	Komorni oder	t	15	Komorni oder
00220000-559a-8971-c94e-83c8c99d509f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559a-8971-37b3-48655a84339e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9205382)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9205372)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9205556)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9205506)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9205080)
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
-- TOC entry 2888 (class 0 OID 9205448)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9205118)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559a-896f-7832-f0a0002531f5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559a-896f-8158-d1212ec5521c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559a-896f-6b2b-a5eecc79384d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559a-896f-dc86-6686ca337048	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559a-896f-81e3-546ef6a74199	planer	Planer dogodkov v koledarju	t
00020000-559a-896f-940e-ed6a1feb1240	kadrovska	Kadrovska služba	t
00020000-559a-896f-696f-854454526705	arhivar	Ažuriranje arhivalij	t
00020000-559a-896f-163a-b6e29c79f0b2	igralec	Igralec	t
00020000-559a-896f-330e-429541cdf4de	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559a-8971-e270-ee3ba71ca8d3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9205102)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559a-896f-523f-24e334bc8cda	00020000-559a-896f-6b2b-a5eecc79384d
00010000-559a-896f-997c-99365bff99bb	00020000-559a-896f-6b2b-a5eecc79384d
00010000-559a-8971-d6c3-30bf3a543104	00020000-559a-8971-e270-ee3ba71ca8d3
\.


--
-- TOC entry 2890 (class 0 OID 9205462)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9205403)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9205353)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9205766)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559a-8970-ab74-67873639e743	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559a-8970-3f59-459593bbd18d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559a-8970-1a10-fca78cfa4eca	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559a-8970-0ac0-d3d57e68a4cd	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559a-8970-4f1c-830211138d01	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9205758)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559a-8970-054f-bfe8aa1b06b1	00230000-559a-8970-0ac0-d3d57e68a4cd	popa
00240000-559a-8970-fd28-a30df89b9bc5	00230000-559a-8970-0ac0-d3d57e68a4cd	oseba
00240000-559a-8970-69a7-5965056575f1	00230000-559a-8970-3f59-459593bbd18d	prostor
00240000-559a-8970-9820-dd013060bd2f	00230000-559a-8970-0ac0-d3d57e68a4cd	besedilo
00240000-559a-8970-22ee-5c0019dd14a6	00230000-559a-8970-0ac0-d3d57e68a4cd	uprizoritev
00240000-559a-8970-c7ea-891c868e659b	00230000-559a-8970-0ac0-d3d57e68a4cd	funkcija
00240000-559a-8970-5d10-48a31618105b	00230000-559a-8970-0ac0-d3d57e68a4cd	tipfunkcije
00240000-559a-8970-3486-0f030b2b3ebf	00230000-559a-8970-0ac0-d3d57e68a4cd	alternacija
00240000-559a-8970-9fb2-c3393b6ead94	00230000-559a-8970-ab74-67873639e743	pogodba
00240000-559a-8970-baba-8c40d4431f4a	00230000-559a-8970-0ac0-d3d57e68a4cd	zaposlitev
\.


--
-- TOC entry 2910 (class 0 OID 9205753)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9205516)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559a-8971-44bb-4aa07f218e14	000e0000-559a-8971-6de5-196749c0f7cf	00080000-559a-8971-5454-7a3f3b600622	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559a-8971-cc43-5f552fe7da2e	000e0000-559a-8971-6de5-196749c0f7cf	00080000-559a-8971-5454-7a3f3b600622	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559a-8971-b0af-49199de20ac5	000e0000-559a-8971-6de5-196749c0f7cf	00080000-559a-8971-85fd-946ce69466fb	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9205180)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9205359)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559a-8971-a323-538ed1b4a806	00180000-559a-8971-b92b-8256493184d4	000c0000-559a-8971-e048-6f4dd610cbec	00090000-559a-8971-8627-7568195104ba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559a-8971-4234-ab1cdbf7cad2	00180000-559a-8971-b92b-8256493184d4	000c0000-559a-8971-c6c0-279be039057e	00090000-559a-8971-7410-8c11f14404dd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559a-8971-5a3c-a35792012fab	00180000-559a-8971-b92b-8256493184d4	000c0000-559a-8971-4614-6c51a2931605	00090000-559a-8971-915c-fa3dd7917455	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559a-8971-ef37-251587752966	00180000-559a-8971-b92b-8256493184d4	000c0000-559a-8971-699d-84d7dcfd2fd0	00090000-559a-8971-8501-763b40310eea	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559a-8971-8db6-72335aa9c797	00180000-559a-8971-b92b-8256493184d4	000c0000-559a-8971-8303-6c50429f98f2	00090000-559a-8971-87cc-d79a5c62616f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559a-8971-ff0e-ab51ce71eedb	00180000-559a-8971-6e20-509c0e845d52	\N	00090000-559a-8971-87cc-d79a5c62616f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9205545)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559a-8970-9264-9494847208d9	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559a-8970-4ca0-606ab14a20dc	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559a-8970-0655-aab7050bce78	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559a-8970-30f0-ad37c25b0ddd	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559a-8970-f3b7-8e2f93503e2c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559a-8970-a402-06e91d94f80f	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559a-8970-03e3-bf801c27864f	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559a-8970-17f7-972bd646a90d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559a-8970-1b8f-55e7f323f69d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559a-8970-4a13-d291ef866541	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559a-8970-2240-672dca018a2e	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559a-8970-556c-1b0b8ba5adcb	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559a-8970-2b0a-c8f50665d530	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559a-8970-1812-214b453d23af	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559a-8970-688b-9d9995089b4c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559a-8970-de40-a888a48e50fa	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9205735)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559a-8970-be74-86c887ac63fe	01	Velika predstava	f	1.00	1.00
002b0000-559a-8970-ad61-a9ab5c2122e0	02	Mala predstava	f	0.50	0.50
002b0000-559a-8970-9807-256e932ab9bd	03	Mala koprodukcija	t	0.40	1.00
002b0000-559a-8970-1078-0ffdf062ffd6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559a-8970-f81b-f30018a51ba1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9205243)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9205089)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559a-896f-997c-99365bff99bb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROJRVRht7c/1jgozw9rAF6HBdCs7JNDOm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559a-8971-25d2-663f8139d04c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559a-8971-66db-321a91a15e1b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559a-8971-b2d4-cc7c1f2b5208	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559a-8971-2623-dfbb1dc8541a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559a-8971-bb8f-387e024cfefc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559a-8971-f166-6afae56c4b7e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559a-8971-9d96-9742e294b3d4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559a-8971-e4d6-678d17379a9f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559a-8971-88ce-2410a0e792dd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559a-8971-d6c3-30bf3a543104	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559a-896f-523f-24e334bc8cda	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9205594)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559a-8971-e2a4-410ca0641336	00160000-559a-8971-6f74-9b809c281ced	00150000-559a-8970-be11-361622022bb7	00140000-559a-896f-4ebb-714bba2c3d88	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559a-8971-5813-fae09226034b
000e0000-559a-8971-6de5-196749c0f7cf	00160000-559a-8971-5375-170d792175aa	00150000-559a-8970-ab18-99907565d6c1	00140000-559a-896f-2121-ea2773e9d3d5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559a-8971-c94e-83c8c99d509f
000e0000-559a-8971-56cf-671cb584aae4	\N	00150000-559a-8970-ab18-99907565d6c1	00140000-559a-896f-2121-ea2773e9d3d5	00190000-559a-8971-7d35-b5457c88e1ed	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559a-8971-5813-fae09226034b
000e0000-559a-8971-f96f-dddce977a009	\N	00150000-559a-8970-ab18-99907565d6c1	00140000-559a-896f-2121-ea2773e9d3d5	00190000-559a-8971-7d35-b5457c88e1ed	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559a-8971-5813-fae09226034b
000e0000-559a-8971-78db-c281baba4b70	\N	00150000-559a-8970-ab18-99907565d6c1	00140000-559a-896f-2121-ea2773e9d3d5	00190000-559a-8971-7d35-b5457c88e1ed	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559a-8971-d43f-91f02c75bbe1
\.


--
-- TOC entry 2871 (class 0 OID 9205305)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559a-8971-35df-1c8fb3a959b1	000e0000-559a-8971-6de5-196749c0f7cf	1	
00200000-559a-8971-ea2a-757e8f5ef588	000e0000-559a-8971-6de5-196749c0f7cf	2	
\.


--
-- TOC entry 2886 (class 0 OID 9205430)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9205499)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9205337)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9205584)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559a-896f-4ebb-714bba2c3d88	01	Drama	drama (SURS 01)
00140000-559a-896f-38e9-6ff25f0e5ca0	02	Opera	opera (SURS 02)
00140000-559a-896f-d599-6ea84e902a05	03	Balet	balet (SURS 03)
00140000-559a-896f-11f3-525f939f4643	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559a-896f-1e2a-1cd2e43cc545	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559a-896f-2121-ea2773e9d3d5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559a-896f-c3dc-2e85d0ed29ec	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9205489)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559a-8970-ed47-ba45054c81a1	01	Opera	opera
00150000-559a-8970-8ce3-3df21de6b602	02	Opereta	opereta
00150000-559a-8970-3894-974c87de2f9b	03	Balet	balet
00150000-559a-8970-bf9f-b932a049df5e	04	Plesne prireditve	plesne prireditve
00150000-559a-8970-b6b9-45591ef27f96	05	Lutkovno gledališče	lutkovno gledališče
00150000-559a-8970-7a62-a1c271e96860	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559a-8970-132b-9ee027f900ac	07	Biografska drama	biografska drama
00150000-559a-8970-be11-361622022bb7	08	Komedija	komedija
00150000-559a-8970-fd40-699767561ec3	09	Črna komedija	črna komedija
00150000-559a-8970-6650-f4a06a7b9704	10	E-igra	E-igra
00150000-559a-8970-ab18-99907565d6c1	11	Kriminalka	kriminalka
00150000-559a-8970-beb8-ef2faccf77fe	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9205143)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9205641)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9205631)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9205544)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9205327)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9205352)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9205751)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9205269)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9205692)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9205485)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9205303)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9205346)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9205283)
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
-- TOC entry 2537 (class 2606 OID 9205395)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9205422)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9205241)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9205152)
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
-- TOC entry 2452 (class 2606 OID 9205176)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9205132)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9205117)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9205428)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9205461)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9205579)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9205205)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9205229)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9205401)
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
-- TOC entry 2467 (class 2606 OID 9205219)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9205290)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9205413)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9205724)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9205732)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9205714)
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
-- TOC entry 2557 (class 2606 OID 9205445)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9205386)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9205377)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9205566)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9205513)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9205088)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9205452)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9205106)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9205126)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9205470)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9205408)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9205358)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9205775)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9205763)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9205757)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9205526)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9205185)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9205368)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9205555)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9205745)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9205254)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9205101)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9205610)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9205312)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9205436)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9205504)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9205341)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9205592)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9205497)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9205334)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9205527)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9205528)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9205207)
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
-- TOC entry 2550 (class 1259 OID 9205429)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9205415)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9205414)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9205313)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9205486)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9205488)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9205487)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9205285)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9205284)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9205581)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9205582)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9205583)
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
-- TOC entry 2604 (class 1259 OID 9205615)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9205612)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9205616)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9205614)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9205613)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9205256)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9205255)
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
-- TOC entry 2450 (class 1259 OID 9205179)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9205453)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9205347)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9205133)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9205134)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9205473)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9205472)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9205471)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9205291)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9205293)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9205292)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9205765)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9205381)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9205379)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9205378)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9205380)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9205107)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9205108)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9205437)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9205402)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9205514)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9205515)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9205696)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9205693)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9205694)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9205695)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9205221)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9205220)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9205222)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9205725)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9205726)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9205645)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9205646)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2620 (class 1259 OID 9205643)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 9205644)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9205505)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9205390)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9205389)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9205387)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9205388)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9205633)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9205632)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9205715)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9205304)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9205752)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9205154)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9205153)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9205186)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9205187)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9205371)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9205370)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9205369)
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
-- TOC entry 2502 (class 1259 OID 9205336)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9205332)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9205329)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9205330)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9205328)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9205333)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9205331)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9205206)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9205270)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9205272)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9205271)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9205273)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9205396)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9205580)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9205611)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9205177)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9205178)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9205498)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9205776)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9205242)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9205764)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9205447)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9205446)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9205642)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9205230)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9205593)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9205733)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9205734)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9205127)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9205335)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9205912)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9205897)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9205902)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9205922)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9205892)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9205917)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9205907)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9206067)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9206072)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9205827)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9206007)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9206002)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9205997)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9205887)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9206037)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9206047)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9206042)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9205862)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9205857)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9205987)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9206077)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9206082)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9206087)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9206107)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9206092)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9206112)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9206102)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9206097)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9205852)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9205847)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9205812)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9205807)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9206017)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9205927)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9205787)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9205792)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9206032)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9206027)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9206022)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9205867)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9205877)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9205872)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9206192)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9205962)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9205952)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9205947)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9205957)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9205777)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9205782)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9206012)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9205992)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9206057)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9206062)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9206162)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9206147)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9206152)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9206157)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9205837)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9205832)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9205842)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9206172)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9206177)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9206137)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9206142)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9206127)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9206132)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9206052)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9205982)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9205977)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9205967)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9205972)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9206122)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9206117)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9206167)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9205882)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9206182)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9206187)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9205802)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9205797)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9205817)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9205822)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9205942)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9205937)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9205932)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-06 15:58:10 CEST

--
-- PostgreSQL database dump complete
--

