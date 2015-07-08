--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-08 10:55:25 CEST

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
-- TOC entry 183 (class 1259 OID 9350703)
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
-- TOC entry 228 (class 1259 OID 9351202)
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
-- TOC entry 227 (class 1259 OID 9351185)
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
-- TOC entry 221 (class 1259 OID 9351097)
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
-- TOC entry 197 (class 1259 OID 9350882)
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
-- TOC entry 200 (class 1259 OID 9350916)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9351314)
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
-- TOC entry 192 (class 1259 OID 9350825)
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
-- TOC entry 229 (class 1259 OID 9351215)
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
-- TOC entry 216 (class 1259 OID 9351042)
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
-- TOC entry 195 (class 1259 OID 9350862)
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
-- TOC entry 199 (class 1259 OID 9350910)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9350842)
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
-- TOC entry 205 (class 1259 OID 9350959)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9350984)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9350799)
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
-- TOC entry 184 (class 1259 OID 9350712)
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
-- TOC entry 185 (class 1259 OID 9350723)
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
-- TOC entry 180 (class 1259 OID 9350677)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9350696)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9350991)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9351022)
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
-- TOC entry 224 (class 1259 OID 9351135)
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
-- TOC entry 187 (class 1259 OID 9350756)
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
-- TOC entry 189 (class 1259 OID 9350791)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9350965)
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
-- TOC entry 188 (class 1259 OID 9350776)
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
-- TOC entry 194 (class 1259 OID 9350854)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9350977)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9351284)
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
-- TOC entry 232 (class 1259 OID 9351295)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9351265)
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
-- TOC entry 212 (class 1259 OID 9351006)
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
-- TOC entry 204 (class 1259 OID 9350950)
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
-- TOC entry 203 (class 1259 OID 9350940)
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
-- TOC entry 223 (class 1259 OID 9351124)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9351074)
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
-- TOC entry 177 (class 1259 OID 9350648)
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
-- TOC entry 176 (class 1259 OID 9350646)
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
-- TOC entry 213 (class 1259 OID 9351016)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9350686)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9350670)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9351030)
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
-- TOC entry 207 (class 1259 OID 9350971)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9350921)
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
-- TOC entry 237 (class 1259 OID 9351334)
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
-- TOC entry 236 (class 1259 OID 9351326)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9351321)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9351084)
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
-- TOC entry 186 (class 1259 OID 9350748)
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
-- TOC entry 202 (class 1259 OID 9350927)
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
-- TOC entry 222 (class 1259 OID 9351113)
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
-- TOC entry 233 (class 1259 OID 9351303)
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
-- TOC entry 191 (class 1259 OID 9350811)
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
-- TOC entry 178 (class 1259 OID 9350657)
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
-- TOC entry 226 (class 1259 OID 9351162)
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
-- TOC entry 196 (class 1259 OID 9350873)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9350998)
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
-- TOC entry 218 (class 1259 OID 9351067)
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
-- TOC entry 198 (class 1259 OID 9350905)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9351152)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9351057)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9350651)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9350703)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9351202)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559c-e57d-ad67-e82726c4f1d7	000d0000-559c-e57d-a958-494904ec01c7	\N	00090000-559c-e57d-eb2c-9b09fd308491	000b0000-559c-e57d-da4a-1ac825cef60f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-559c-e57d-3312-be174b3a53c8	000d0000-559c-e57d-a580-99d894066363	\N	00090000-559c-e57d-2ee3-25b62e85c326	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-559c-e57d-884a-30f713b43192	000d0000-559c-e57d-57d4-168fba3663a9	\N	00090000-559c-e57d-676e-890f2365549d	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-559c-e57d-25c9-9cf3e38e7c9b	000d0000-559c-e57d-ce37-745d8702fb5f	\N	00090000-559c-e57d-e18d-503e12c46ac2	\N	0004	t	\N	\N	\N	26	\N	\N	f	f
000c0000-559c-e57d-aa2a-c5722df5bbea	000d0000-559c-e57d-dc6d-948106957284	\N	00090000-559c-e57d-c99c-7f7770e753f8	\N	0005	t	\N	\N	\N	7	\N	\N	f	f
000c0000-559c-e57d-44c8-da903e7e0c22	000d0000-559c-e57d-2fd8-3d3982122398	\N	00090000-559c-e57d-23dc-e6db451fcfcf	000b0000-559c-e57d-b12a-96ecb4718088	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-559c-e57d-9a3e-b10572dafd12	000d0000-559c-e57d-58c8-951ebaf91e15	\N	00090000-559c-e57d-b3e4-58ad42a5cddc	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-559c-e57d-8c49-b1ef58d50cae	000d0000-559c-e57d-367f-d4257992a98b	\N	00090000-559c-e57d-fa11-84a5d5229c79	000b0000-559c-e57d-b06c-e412dbdacd34	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2902 (class 0 OID 9351185)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9351097)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559c-e57c-f520-c30cd9d0c886	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559c-e57c-4955-320f8596cc76	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559c-e57c-eaa6-dbe710b7e109	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9350882)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559c-e57d-dfd3-8f692fd6e463	\N	\N	00200000-559c-e57d-a76c-347d9d9dcd8b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559c-e57d-64f1-18ed5abf73f2	\N	\N	00200000-559c-e57d-f5ee-bf65134e8902	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559c-e57d-b3ad-650b6b52377c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559c-e57d-585b-5a759594e42d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559c-e57d-2ea8-aaf28b1fb872	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9350916)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9351314)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9350825)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559c-e57b-6246-221796c2b8a6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559c-e57b-4d25-b3e7b3c1879d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559c-e57b-d0a1-afeee247fa54	AL	ALB	008	Albania 	Albanija	\N
00040000-559c-e57b-63a2-4e41e3a3dc61	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559c-e57b-c221-50a14c80a26d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559c-e57b-73c5-4fb2c41e81e5	AD	AND	020	Andorra 	Andora	\N
00040000-559c-e57b-de13-0370ad14a191	AO	AGO	024	Angola 	Angola	\N
00040000-559c-e57b-ed66-5fadd652d73f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559c-e57b-b04c-757ad3ba79b5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559c-e57b-8b73-98e548d16607	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559c-e57b-0292-5a1443a1c1d8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559c-e57b-9cb3-83432f7ecc5a	AM	ARM	051	Armenia 	Armenija	\N
00040000-559c-e57b-9628-4fcff3998969	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559c-e57b-aeaf-dc88d19e538f	AU	AUS	036	Australia 	Avstralija	\N
00040000-559c-e57b-a9d7-4f208c280e51	AT	AUT	040	Austria 	Avstrija	\N
00040000-559c-e57b-73a1-ff81441b8048	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559c-e57b-31c1-f8c792a36e4c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559c-e57b-445f-a2c03396aa5f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559c-e57b-b6b8-6556a39d4dce	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559c-e57b-04b8-da3cf442e753	BB	BRB	052	Barbados 	Barbados	\N
00040000-559c-e57b-8a45-38717823d604	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559c-e57b-a6fe-291b1d0e3dbb	BE	BEL	056	Belgium 	Belgija	\N
00040000-559c-e57b-bc73-2e0fd21d0313	BZ	BLZ	084	Belize 	Belize	\N
00040000-559c-e57b-7390-d90097c02b6a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559c-e57b-0e33-2678d6cc87a4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559c-e57b-b10f-46a5af2b165c	BT	BTN	064	Bhutan 	Butan	\N
00040000-559c-e57b-628f-fc23668e2290	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559c-e57b-eee9-8e9482d02fb7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559c-e57b-0a1b-2b6091b71122	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559c-e57b-ea9b-0a094883d3f4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559c-e57b-8154-444cd2d51134	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559c-e57b-9f0f-345076a6f641	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559c-e57b-2ae2-c02d5a83c4b6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559c-e57b-2486-77186e5d63cb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559c-e57b-d3ca-e7648fdcdb0e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559c-e57b-ed99-0e0dc31b0f53	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559c-e57b-3867-30f2c5aaa8b8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559c-e57b-70c3-81c41bbc03bc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559c-e57b-ed14-63e78b7056fa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559c-e57b-c3a0-3df01f213478	CA	CAN	124	Canada 	Kanada	\N
00040000-559c-e57b-0cad-c87bb3e7f0d9	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559c-e57b-f824-1b4d6b742c1e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559c-e57b-8577-64d9e70cf43d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559c-e57b-5937-bb478940a116	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559c-e57b-787d-e30deff138be	CL	CHL	152	Chile 	Čile	\N
00040000-559c-e57b-e280-f4a6329ea48b	CN	CHN	156	China 	Kitajska	\N
00040000-559c-e57b-9243-3fbd77b7b675	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559c-e57b-fc9c-31b29386278e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559c-e57b-4c2e-1e814582d2ca	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559c-e57b-888e-24f00ee3e0d3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559c-e57b-5004-70d3b3cbba1e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559c-e57b-1ed2-65f7dec8a9b0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559c-e57b-7c62-b1c38750b1f4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559c-e57b-e801-29bfa1dd69f7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559c-e57b-2c42-1a3a68e6c075	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559c-e57b-fa82-a0948f4fc2d9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559c-e57b-7bb7-affdba312d51	CU	CUB	192	Cuba 	Kuba	\N
00040000-559c-e57b-c4e8-cc87401bde98	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559c-e57b-dfd1-78cdc72b7f09	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559c-e57b-d8aa-51792aceae71	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559c-e57b-5bf6-aa0e18d7ce85	DK	DNK	208	Denmark 	Danska	\N
00040000-559c-e57b-f486-5f449d1945d9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559c-e57b-a5bb-48f246151d34	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559c-e57b-370b-1cb8c2c57b15	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559c-e57b-1ad4-1c58cf445684	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559c-e57b-2d6c-fd917ec29646	EG	EGY	818	Egypt 	Egipt	\N
00040000-559c-e57b-9f53-562b4a43e077	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559c-e57b-7958-09ae438c4304	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559c-e57b-9e7c-016ed46ed132	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559c-e57b-ad69-00e225d2d131	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559c-e57b-e903-4404912acbe4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559c-e57b-d0f9-e1f0e73852c8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559c-e57b-0475-e3e3c3a00f54	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559c-e57b-b80a-ae471513df6c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559c-e57b-d33b-1bef69b448b0	FI	FIN	246	Finland 	Finska	\N
00040000-559c-e57b-6c21-5c730de33baa	FR	FRA	250	France 	Francija	\N
00040000-559c-e57b-cc2a-3ead769111ad	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559c-e57b-8091-5ff0d391b7db	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559c-e57b-e27d-a02c6a1dc9ce	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559c-e57b-a009-f79a391a0fd4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559c-e57b-8d3f-ad91ca1b8ee7	GA	GAB	266	Gabon 	Gabon	\N
00040000-559c-e57b-3721-e98dd7f1fd67	GM	GMB	270	Gambia 	Gambija	\N
00040000-559c-e57b-f9d1-e32f3d5a70af	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559c-e57b-16ee-960eef7297a9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559c-e57b-779e-c799d83d750f	GH	GHA	288	Ghana 	Gana	\N
00040000-559c-e57b-ed3e-bc93c8f23e0c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559c-e57b-0476-e3d48775e9b1	GR	GRC	300	Greece 	Grčija	\N
00040000-559c-e57b-a02c-0d6bb7458326	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559c-e57b-bf2a-1bfc6f50a59a	GD	GRD	308	Grenada 	Grenada	\N
00040000-559c-e57b-786d-7dcd9f2e325d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559c-e57b-941d-af74a75c23af	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559c-e57b-d9d0-36813d7aed77	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559c-e57b-3ba4-36939aca1533	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559c-e57b-a794-0f81032ebe7b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559c-e57b-e985-71805a8ad4f6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559c-e57b-3ccc-b17462e6e891	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559c-e57b-6ca7-a1cc6985b864	HT	HTI	332	Haiti 	Haiti	\N
00040000-559c-e57b-47d9-7916ca3a5d89	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559c-e57b-826a-5d3ca160ce32	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559c-e57b-e716-cad88c76b4a6	HN	HND	340	Honduras 	Honduras	\N
00040000-559c-e57b-b7fb-df7879d2252e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559c-e57b-321e-2672fc185b51	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559c-e57b-ebd1-0ebdfd9bbd63	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559c-e57b-1f49-db4f2d25ef76	IN	IND	356	India 	Indija	\N
00040000-559c-e57b-e9e8-91f540850263	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559c-e57b-d2db-94a05058a790	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559c-e57b-a9d5-05895765d6b6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559c-e57b-2da8-0bb251b59cdd	IE	IRL	372	Ireland 	Irska	\N
00040000-559c-e57b-dd86-d3e3a7c7a82f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559c-e57b-b4d3-ea224e5c96d3	IL	ISR	376	Israel 	Izrael	\N
00040000-559c-e57b-01e8-5cbfcdc6bca7	IT	ITA	380	Italy 	Italija	\N
00040000-559c-e57b-affe-46e0d28c6963	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559c-e57b-00d6-9655c7dabe65	JP	JPN	392	Japan 	Japonska	\N
00040000-559c-e57b-51de-daedda75a231	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559c-e57b-a7a0-63745f4cd0fc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559c-e57b-c775-80d9cc0fe992	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559c-e57b-0400-990167bce7f1	KE	KEN	404	Kenya 	Kenija	\N
00040000-559c-e57b-6e89-90de87a69a2c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559c-e57b-67bd-762b28f18b5f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559c-e57b-c9ce-6513d71be36e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559c-e57b-6b53-bc26763789dd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559c-e57b-f2a2-5ff56b47449e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559c-e57b-13b6-24916b2a19b6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559c-e57b-5a1d-63452ca16439	LV	LVA	428	Latvia 	Latvija	\N
00040000-559c-e57b-967b-3341dad6f856	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559c-e57b-c9b6-70e6cbdd7307	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559c-e57b-0b95-8a622c332629	LR	LBR	430	Liberia 	Liberija	\N
00040000-559c-e57b-ebf9-4e2086be7710	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559c-e57b-411a-09bf35de7795	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559c-e57b-2b55-20f71582da83	LT	LTU	440	Lithuania 	Litva	\N
00040000-559c-e57b-a534-cc2f903508f7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559c-e57b-4da5-a479deb65839	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559c-e57b-5293-e25e493c76a5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559c-e57b-0136-c08540046208	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559c-e57b-39af-f621ed5abee8	MW	MWI	454	Malawi 	Malavi	\N
00040000-559c-e57b-adeb-b6744b37bbe0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559c-e57b-2bf4-ee7f21a07a83	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559c-e57b-be75-5c6079c0cb67	ML	MLI	466	Mali 	Mali	\N
00040000-559c-e57b-442d-13a94bfab22d	MT	MLT	470	Malta 	Malta	\N
00040000-559c-e57b-4271-08876008b4ad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559c-e57b-45b1-8be2aaa6c553	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559c-e57b-3b36-445313490a6a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559c-e57b-fc50-ccdce613f6d6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559c-e57b-c47b-f7b5b7e4555c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559c-e57b-e944-ea2c6d89ee1a	MX	MEX	484	Mexico 	Mehika	\N
00040000-559c-e57b-ecc2-e047573f04ee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559c-e57b-fa41-265385b9697f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559c-e57b-a0c8-e089c57dc832	MC	MCO	492	Monaco 	Monako	\N
00040000-559c-e57b-c433-4b0e0f36f3f2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559c-e57b-6792-74f82f7e037c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559c-e57b-4748-be742922b272	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559c-e57b-8689-83ef636b8ea8	MA	MAR	504	Morocco 	Maroko	\N
00040000-559c-e57b-0bb4-f2fa708a446a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559c-e57b-44a3-5b4703a588ab	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559c-e57b-9198-32e879e58e76	NA	NAM	516	Namibia 	Namibija	\N
00040000-559c-e57b-ca6a-731b40b061f7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559c-e57b-b35c-2f66445591d1	NP	NPL	524	Nepal 	Nepal	\N
00040000-559c-e57b-1104-656480bb5d28	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559c-e57b-8486-64dcebcc6fa3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559c-e57b-c8ef-36a99760cd0c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559c-e57b-a048-226677b5985f	NE	NER	562	Niger 	Niger 	\N
00040000-559c-e57b-481f-8a4c8b939d32	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559c-e57b-6a77-39a3e8d10c73	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559c-e57b-634e-c56cba9c748f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559c-e57b-5971-bb20ec9e1696	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559c-e57b-f3e5-bc9bc2349062	NO	NOR	578	Norway 	Norveška	\N
00040000-559c-e57b-1e3f-a3dcdd92e05d	OM	OMN	512	Oman 	Oman	\N
00040000-559c-e57b-d2b5-5b4ce5c14cda	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559c-e57b-b8ce-d3b8afdaccbb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559c-e57b-eaa1-c50a931a7e0a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559c-e57b-03b5-8ba6cb5f835c	PA	PAN	591	Panama 	Panama	\N
00040000-559c-e57b-b3a5-52c65bd51d47	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559c-e57b-eeaf-de413d3c1906	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559c-e57b-1b93-f999303de8c2	PE	PER	604	Peru 	Peru	\N
00040000-559c-e57b-b7ef-14e87e6e0d3b	PH	PHL	608	Philippines 	Filipini	\N
00040000-559c-e57b-944b-6a1b8146c33f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559c-e57b-801d-134d9c676c2a	PL	POL	616	Poland 	Poljska	\N
00040000-559c-e57b-9342-8166a64f84ea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559c-e57b-1b59-5bb294a34688	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559c-e57b-1ccd-f6127c7973de	QA	QAT	634	Qatar 	Katar	\N
00040000-559c-e57b-fa9f-e774889bfc31	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559c-e57b-15ec-52f673d441c5	RO	ROU	642	Romania 	Romunija	\N
00040000-559c-e57b-2694-8151e5cfa437	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559c-e57b-658f-798d8c30e29d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559c-e57b-01e6-aef22fc74506	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559c-e57b-cf04-27466fd45a8c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559c-e57b-2f63-1d4739479bec	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559c-e57b-dfde-84ab5529275a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559c-e57b-b887-afdf691b032b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559c-e57b-6175-65d0830dd6f9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559c-e57b-b2b8-7c8433de64d3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559c-e57b-e189-71daa2eccf8b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559c-e57b-9d49-ef0907fef5a7	SM	SMR	674	San Marino 	San Marino	\N
00040000-559c-e57b-5435-e207b7af17be	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559c-e57b-a6c2-e5ccbc5a7bfd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559c-e57b-1465-630678f23df5	SN	SEN	686	Senegal 	Senegal	\N
00040000-559c-e57b-8c88-c240054a7101	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559c-e57b-cdbe-54be3436b8fe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559c-e57b-05ee-0408e99073e2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559c-e57b-a1c0-74474de64a50	SG	SGP	702	Singapore 	Singapur	\N
00040000-559c-e57b-3456-74b9626ed129	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559c-e57b-10c4-4ff6f70c9c96	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559c-e57b-8aa3-8c68ad114be8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559c-e57b-e9be-2ca5bc433a0d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559c-e57b-2b87-076c2ee494a5	SO	SOM	706	Somalia 	Somalija	\N
00040000-559c-e57b-33aa-affdaf68f64c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559c-e57b-e186-4bbc0ffe2f90	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559c-e57b-72c6-afd5281bc7d8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559c-e57b-87dc-776ba52e88b8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559c-e57b-ef87-9f0c47324713	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559c-e57b-ec16-2b8c7ac41bbb	SD	SDN	729	Sudan 	Sudan	\N
00040000-559c-e57b-6056-1496ddb96e9b	SR	SUR	740	Suriname 	Surinam	\N
00040000-559c-e57b-bb22-d0b91135724f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559c-e57b-bd8a-0dae739250d2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559c-e57b-d0e2-a1869eb69873	SE	SWE	752	Sweden 	Švedska	\N
00040000-559c-e57b-476b-dc963cab8efe	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559c-e57b-d03f-9acdf639661b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559c-e57b-1a59-4280a2fd8ffb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559c-e57b-88c6-58991f20b646	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559c-e57b-f9df-f02a39befb38	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559c-e57b-e4b3-c447cbc59bd0	TH	THA	764	Thailand 	Tajska	\N
00040000-559c-e57b-a7d3-370d920a0450	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559c-e57b-d96b-49ba50ff1c6f	TG	TGO	768	Togo 	Togo	\N
00040000-559c-e57b-42ee-2904147f0774	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559c-e57b-6275-edcc8f0dcb81	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559c-e57b-997d-65a69fa007b8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559c-e57b-70e0-3f85874cb2dc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559c-e57b-6f2c-f8dcdc205294	TR	TUR	792	Turkey 	Turčija	\N
00040000-559c-e57b-cbde-cb3b109469ee	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559c-e57b-6df6-1f2e5179b7e7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559c-e57b-998b-14c4b54218b3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559c-e57b-fa11-4e8a3e2349fb	UG	UGA	800	Uganda 	Uganda	\N
00040000-559c-e57b-3de3-cd3645796dae	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559c-e57b-cbc6-f4cbeaae68a2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559c-e57b-705e-92556e0e6dbe	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559c-e57b-741b-30e4da53d291	US	USA	840	United States 	Združene države Amerike	\N
00040000-559c-e57b-62d7-5ea12fd0310c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559c-e57b-8a8d-738ea813fb51	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559c-e57b-fd98-f3397a50aa7a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559c-e57b-2589-49ecc4013419	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559c-e57b-eee7-eb7887df033d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559c-e57b-450e-4bfb318c259b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559c-e57b-22ab-95a37c1cd8e0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559c-e57b-2d7a-9dfe49727fa9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559c-e57b-ce1f-65a571c3b8c0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559c-e57b-b718-35df719908a7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559c-e57b-82f0-e734baa2f6ff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559c-e57b-c157-e68a7549ddd1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559c-e57b-21cd-89e6f979399f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9351215)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559c-e57d-8542-48f7500be877	000e0000-559c-e57d-2704-d594cae5dc19	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559c-e57c-84a7-8af02e3e71b3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559c-e57d-feec-3377c0fe7487	000e0000-559c-e57d-935b-3acf677a39c7	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559c-e57c-a7d8-b5cefafbd19e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9351042)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559c-e57d-58c8-951ebaf91e15	000e0000-559c-e57d-935b-3acf677a39c7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559c-e57c-1372-844cf9031bee
000d0000-559c-e57d-a958-494904ec01c7	000e0000-559c-e57d-935b-3acf677a39c7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559c-e57c-1372-844cf9031bee
000d0000-559c-e57d-a580-99d894066363	000e0000-559c-e57d-935b-3acf677a39c7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559c-e57c-ea98-bd99f54c5baa
000d0000-559c-e57d-57d4-168fba3663a9	000e0000-559c-e57d-935b-3acf677a39c7	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559c-e57c-0891-b4a6c3cc1328
000d0000-559c-e57d-ce37-745d8702fb5f	000e0000-559c-e57d-935b-3acf677a39c7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559c-e57c-0891-b4a6c3cc1328
000d0000-559c-e57d-dc6d-948106957284	000e0000-559c-e57d-935b-3acf677a39c7	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559c-e57c-0891-b4a6c3cc1328
000d0000-559c-e57d-2fd8-3d3982122398	000e0000-559c-e57d-935b-3acf677a39c7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559c-e57c-1372-844cf9031bee
000d0000-559c-e57d-367f-d4257992a98b	000e0000-559c-e57d-935b-3acf677a39c7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559c-e57c-9b62-78008b200c96
\.


--
-- TOC entry 2870 (class 0 OID 9350862)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9350910)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9350842)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559c-e57d-38a8-871d20433a5a	00080000-559c-e57c-a83b-6f7e4d716898	00090000-559c-e57d-eb2c-9b09fd308491	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9350959)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9350984)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9350799)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559c-e57b-86ec-1433c66e481a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559c-e57b-4ead-49c8c8ee4499	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559c-e57b-8d20-828ce610f92e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559c-e57b-e790-e65d5d7cac74	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559c-e57b-cafb-5de2d9581e76	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559c-e57b-3864-e92880074fd6	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559c-e57b-3ab8-ba21c50774f1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559c-e57b-1495-20cc6addd48a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559c-e57b-bd77-573ca2c6c2f6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559c-e57b-58af-20ce3152740f	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559c-e57b-024a-59999c84a6c1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559c-e57b-6c49-e2763c0fa0af	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559c-e57b-263e-0648f3c6753f	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559c-e57c-9354-7d3e1df43ec9	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559c-e57c-2442-c160bdb145ca	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559c-e57c-86e2-bf32b4bc68f9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559c-e57c-34b7-cbb2d9aa87a5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559c-e57c-2ef5-8d8400be99bd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559c-e57c-9195-c93a10999742	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9350712)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559c-e57c-670d-ccfcb454162b	00000000-559c-e57c-2442-c160bdb145ca	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559c-e57c-86cf-725d8feab1e2	00000000-559c-e57c-2442-c160bdb145ca	00010000-559c-e57b-6c15-006ffdb9b66d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559c-e57c-282e-50b16099d0bd	00000000-559c-e57c-86e2-bf32b4bc68f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9350723)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559c-e57d-abef-8c0f4e5b728b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559c-e57d-e18d-503e12c46ac2	00010000-559c-e57d-1972-a2fc738ee0df	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559c-e57d-676e-890f2365549d	00010000-559c-e57d-85f2-9665fb4498b7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559c-e57d-22d1-cee1ad3238b3	00010000-559c-e57d-6154-f25ca1003f97	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559c-e57d-abb4-f8d1f6810ba6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559c-e57d-23dc-e6db451fcfcf	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559c-e57d-cfc0-5ece58916769	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559c-e57d-b3e4-58ad42a5cddc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559c-e57d-eb2c-9b09fd308491	00010000-559c-e57d-f66f-f2e18db47e45	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559c-e57d-2ee3-25b62e85c326	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559c-e57d-f70d-8407e318f1dc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559c-e57d-c99c-7f7770e753f8	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559c-e57d-fa11-84a5d5229c79	00010000-559c-e57d-eb72-08571cd93e9d	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9350677)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559c-e57b-8d01-f7e335ea64d4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559c-e57b-6a10-3575ce140400	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559c-e57b-2991-3dc1e621bbbb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559c-e57b-e860-5f405c829ca3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559c-e57b-8096-79e8f7745647	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559c-e57b-048a-c879600cbdd8	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559c-e57b-3718-a0074da1fa78	Abonma-read	Abonma - branje	f
00030000-559c-e57b-089b-12e6a5ebffe4	Abonma-write	Abonma - spreminjanje	f
00030000-559c-e57b-aabd-402e156b7502	Alternacija-read	Alternacija - branje	f
00030000-559c-e57b-f7b6-fc35434d4002	Alternacija-write	Alternacija - spreminjanje	f
00030000-559c-e57b-9eda-3567499f38d7	Arhivalija-read	Arhivalija - branje	f
00030000-559c-e57b-fe21-1196f3a60375	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559c-e57b-62d7-f3128c87a553	Besedilo-read	Besedilo - branje	f
00030000-559c-e57b-c920-a20ac05d9d8f	Besedilo-write	Besedilo - spreminjanje	f
00030000-559c-e57b-6a53-910421c0261a	DogodekIzven-read	DogodekIzven - branje	f
00030000-559c-e57b-97d8-c893b8883650	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559c-e57b-bfdd-9200bd3ce2c7	Dogodek-read	Dogodek - branje	f
00030000-559c-e57b-4de9-fb1cec8cc058	Dogodek-write	Dogodek - spreminjanje	f
00030000-559c-e57b-3944-524c6534ab5d	DrugiVir-read	DrugiVir - branje	f
00030000-559c-e57b-f3fe-edbf07d72ceb	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559c-e57b-9021-32b0a7901c7e	Drzava-read	Drzava - branje	f
00030000-559c-e57b-c419-2a7926701604	Drzava-write	Drzava - spreminjanje	f
00030000-559c-e57b-7339-1aa94d81fe60	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559c-e57b-fda2-ec13ae598321	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559c-e57b-23f1-c36aedeb2b92	Funkcija-read	Funkcija - branje	f
00030000-559c-e57b-e591-48b0398be004	Funkcija-write	Funkcija - spreminjanje	f
00030000-559c-e57b-a6c1-0b6d98586047	Gostovanje-read	Gostovanje - branje	f
00030000-559c-e57b-f5ef-9eeb68f8f70e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559c-e57b-10e9-140aaf844cfe	Gostujoca-read	Gostujoca - branje	f
00030000-559c-e57b-f452-04fba9db5436	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559c-e57b-e71d-d3d0d892bc02	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559c-e57b-bd45-6678545d9593	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559c-e57b-59a8-164193515c3a	Kupec-read	Kupec - branje	f
00030000-559c-e57b-7584-7b161b0164b2	Kupec-write	Kupec - spreminjanje	f
00030000-559c-e57b-c75f-844fb75dcc1e	NacinPlacina-read	NacinPlacina - branje	f
00030000-559c-e57b-a987-f545ace07b03	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559c-e57b-5779-e4e1956b004a	Option-read	Option - branje	f
00030000-559c-e57b-5070-5ca601c65fd8	Option-write	Option - spreminjanje	f
00030000-559c-e57b-387e-e2edfd554fa5	OptionValue-read	OptionValue - branje	f
00030000-559c-e57b-12a4-8badabca3682	OptionValue-write	OptionValue - spreminjanje	f
00030000-559c-e57b-f17e-518cb88d57a8	Oseba-read	Oseba - branje	f
00030000-559c-e57b-908b-08166f385110	Oseba-write	Oseba - spreminjanje	f
00030000-559c-e57b-2b50-06b224b222b6	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559c-e57b-3644-fda99c3ac0fb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559c-e57b-dec1-7b992cba3b11	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559c-e57b-76f1-2b36834b2961	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559c-e57b-ad69-a33553b48601	Pogodba-read	Pogodba - branje	f
00030000-559c-e57b-73c4-da21b1586f7d	Pogodba-write	Pogodba - spreminjanje	f
00030000-559c-e57b-e930-1f5b4498c0e4	Popa-read	Popa - branje	f
00030000-559c-e57b-654a-fd4916bb1414	Popa-write	Popa - spreminjanje	f
00030000-559c-e57b-13b9-1d0d02e77d22	Posta-read	Posta - branje	f
00030000-559c-e57b-09e5-fded960507ce	Posta-write	Posta - spreminjanje	f
00030000-559c-e57b-a8ed-49b6e66bb8e4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559c-e57b-39fa-40e6f9d9de2e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559c-e57b-ff42-aaf22b77b63f	PostniNaslov-read	PostniNaslov - branje	f
00030000-559c-e57b-858f-1b64a6e16532	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559c-e57b-5968-db2b523b1136	Predstava-read	Predstava - branje	f
00030000-559c-e57b-08f6-e0db1cb45393	Predstava-write	Predstava - spreminjanje	f
00030000-559c-e57b-eb54-c221a0b57800	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559c-e57b-4d31-b2cbe02b0aa4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559c-e57b-87f0-b18556e1cde9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559c-e57b-f62e-f17c7e5ea8b9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559c-e57b-19e3-3a72bfe3e071	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559c-e57b-7400-92b3bddc6d2d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559c-e57b-cc37-0c1c2a8ec608	ProgramDela-read	ProgramDela - branje	f
00030000-559c-e57b-a33b-9e44a6b376e8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559c-e57b-6078-10a7a39b91b8	ProgramFestival-read	ProgramFestival - branje	f
00030000-559c-e57b-687b-fd7a6e4202b8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559c-e57b-09e9-12b851fb5a91	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559c-e57b-1600-9985a4b8c0ae	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559c-e57b-aa88-5ef2c2f037d6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559c-e57b-e3ed-5923454af489	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559c-e57b-9dd4-05802de8db5d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559c-e57b-69fc-ec93b055fe29	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559c-e57b-67ed-33bd6919fd0c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559c-e57b-8128-2d9e5d1e953b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559c-e57b-6129-bf9f036643ba	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559c-e57b-2fae-4f3225aa99f0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559c-e57b-69ce-203025f6429d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559c-e57b-6b5e-a1908e957be3	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559c-e57b-39bb-253be34f1c3b	ProgramRazno-read	ProgramRazno - branje	f
00030000-559c-e57b-5501-32338fb1d587	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559c-e57b-f5ec-3a052fc772d2	Prostor-read	Prostor - branje	f
00030000-559c-e57b-db9f-11ea83fa3c8f	Prostor-write	Prostor - spreminjanje	f
00030000-559c-e57b-4505-619218171acf	Racun-read	Racun - branje	f
00030000-559c-e57b-48e1-24681e553dda	Racun-write	Racun - spreminjanje	f
00030000-559c-e57b-8d38-0f1dc3361032	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559c-e57b-5653-46fbb6fe5412	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559c-e57b-8cd2-ab250f5b41e9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559c-e57b-e5ad-34aa0ccba76c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559c-e57b-89ea-3e50fa31270e	Rekvizit-read	Rekvizit - branje	f
00030000-559c-e57b-020c-2e04d46d7783	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559c-e57b-45b9-673a0d355ebe	Revizija-read	Revizija - branje	f
00030000-559c-e57b-16b4-4b07e954bbdd	Revizija-write	Revizija - spreminjanje	f
00030000-559c-e57b-593d-c679ef57dd9b	Rezervacija-read	Rezervacija - branje	f
00030000-559c-e57b-e10e-bebe327446c7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559c-e57b-ab94-9fe0ff02429e	SedezniRed-read	SedezniRed - branje	f
00030000-559c-e57b-4c0b-815dd320cb36	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559c-e57b-f880-4acfaf9303c4	Sedez-read	Sedez - branje	f
00030000-559c-e57b-8498-0be80abbab52	Sedez-write	Sedez - spreminjanje	f
00030000-559c-e57b-4a71-975f37e2e42e	Sezona-read	Sezona - branje	f
00030000-559c-e57b-c4a9-444fb5fe24f3	Sezona-write	Sezona - spreminjanje	f
00030000-559c-e57b-266a-b2108021ce27	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559c-e57b-c927-d395bce045db	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559c-e57b-a13b-1d38ca833943	Stevilcenje-read	Stevilcenje - branje	f
00030000-559c-e57b-774b-483c6723b253	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559c-e57b-050c-f1cdfe0c2471	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559c-e57b-e77c-24c58517569f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559c-e57b-5090-810fa7cce1da	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559c-e57b-5ceb-00e0552ee6e6	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559c-e57b-03db-a8bcf7fab2d9	Telefonska-read	Telefonska - branje	f
00030000-559c-e57b-737c-8c69fb09db28	Telefonska-write	Telefonska - spreminjanje	f
00030000-559c-e57b-dc15-bc470ed3f952	TerminStoritve-read	TerminStoritve - branje	f
00030000-559c-e57b-8318-3ba0c4d2e864	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559c-e57b-f8ff-9ad1c03bcc18	TipFunkcije-read	TipFunkcije - branje	f
00030000-559c-e57b-1990-794b7dcae22f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559c-e57b-f139-7311c3acd7db	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559c-e57b-e04e-0885a64e1a1f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559c-e57b-9e04-74c6f1b367b8	Trr-read	Trr - branje	f
00030000-559c-e57b-d3bf-79a2c0327b9a	Trr-write	Trr - spreminjanje	f
00030000-559c-e57b-95f9-10a4e66aa8e6	Uprizoritev-read	Uprizoritev - branje	f
00030000-559c-e57b-5ede-ccb4d0e14482	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559c-e57b-167c-423127bde696	Vaja-read	Vaja - branje	f
00030000-559c-e57b-581f-685589883ffd	Vaja-write	Vaja - spreminjanje	f
00030000-559c-e57b-e005-3488fdfd7d04	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559c-e57b-54a6-703f46ec34bb	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559c-e57b-a2f4-a0ebec81e76c	Zaposlitev-read	Zaposlitev - branje	f
00030000-559c-e57b-efc4-de2c6ec858a6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559c-e57b-9c07-7c8ac3590c31	Zasedenost-read	Zasedenost - branje	f
00030000-559c-e57b-3b8e-a78f86be3bd2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559c-e57b-df5a-b480613e5ebd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559c-e57b-ff64-35fdb24099b9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559c-e57b-91c7-4143754760a9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559c-e57b-9f66-df8ebbf462cb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9350696)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559c-e57b-5d9c-a0e8a7d62a81	00030000-559c-e57b-6a10-3575ce140400
00020000-559c-e57b-453a-b185acff14e5	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-089b-12e6a5ebffe4
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-aabd-402e156b7502
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f7b6-fc35434d4002
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-e860-5f405c829ca3
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-4de9-fb1cec8cc058
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-c419-2a7926701604
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-23f1-c36aedeb2b92
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-e591-48b0398be004
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f5ef-9eeb68f8f70e
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f452-04fba9db5436
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-e71d-d3d0d892bc02
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-bd45-6678545d9593
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f17e-518cb88d57a8
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-908b-08166f385110
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-654a-fd4916bb1414
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-09e5-fded960507ce
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-ff42-aaf22b77b63f
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-858f-1b64a6e16532
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-08f6-e0db1cb45393
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-19e3-3a72bfe3e071
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-7400-92b3bddc6d2d
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-db9f-11ea83fa3c8f
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-e5ad-34aa0ccba76c
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-020c-2e04d46d7783
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-c4a9-444fb5fe24f3
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-f8ff-9ad1c03bcc18
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-95f9-10a4e66aa8e6
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-5ede-ccb4d0e14482
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-167c-423127bde696
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-581f-685589883ffd
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-9c07-7c8ac3590c31
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-3b8e-a78f86be3bd2
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57b-9117-4054f73af63d	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-e71d-d3d0d892bc02
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-bd45-6678545d9593
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-f17e-518cb88d57a8
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-908b-08166f385110
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-ff42-aaf22b77b63f
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-858f-1b64a6e16532
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-03db-a8bcf7fab2d9
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-737c-8c69fb09db28
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-9e04-74c6f1b367b8
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-d3bf-79a2c0327b9a
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-a2f4-a0ebec81e76c
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-efc4-de2c6ec858a6
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57b-1023-864cc7338eb8	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-aabd-402e156b7502
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-fe21-1196f3a60375
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-62d7-f3128c87a553
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-6a53-910421c0261a
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-23f1-c36aedeb2b92
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-e71d-d3d0d892bc02
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-f17e-518cb88d57a8
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-19e3-3a72bfe3e071
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-f8ff-9ad1c03bcc18
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-167c-423127bde696
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-9c07-7c8ac3590c31
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57b-c474-f89feee6a686	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-089b-12e6a5ebffe4
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-f7b6-fc35434d4002
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-f8ff-9ad1c03bcc18
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57b-af8f-25cc03e3d334	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-dc15-bc470ed3f952
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-2991-3dc1e621bbbb
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-f8ff-9ad1c03bcc18
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57b-31f3-c7294c3e82c3	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8d01-f7e335ea64d4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-6a10-3575ce140400
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-2991-3dc1e621bbbb
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e860-5f405c829ca3
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8096-79e8f7745647
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-048a-c879600cbdd8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-3718-a0074da1fa78
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-089b-12e6a5ebffe4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-aabd-402e156b7502
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f7b6-fc35434d4002
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9eda-3567499f38d7
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-fe21-1196f3a60375
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-62d7-f3128c87a553
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-c920-a20ac05d9d8f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-6a53-910421c0261a
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-97d8-c893b8883650
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-bfdd-9200bd3ce2c7
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-4de9-fb1cec8cc058
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9021-32b0a7901c7e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-c419-2a7926701604
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-7339-1aa94d81fe60
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-fda2-ec13ae598321
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-23f1-c36aedeb2b92
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e591-48b0398be004
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a6c1-0b6d98586047
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f5ef-9eeb68f8f70e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-10e9-140aaf844cfe
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f452-04fba9db5436
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e71d-d3d0d892bc02
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-bd45-6678545d9593
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-59a8-164193515c3a
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-7584-7b161b0164b2
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-c75f-844fb75dcc1e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a987-f545ace07b03
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5779-e4e1956b004a
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5070-5ca601c65fd8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-387e-e2edfd554fa5
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-12a4-8badabca3682
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f17e-518cb88d57a8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-908b-08166f385110
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-2b50-06b224b222b6
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-3644-fda99c3ac0fb
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-dec1-7b992cba3b11
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-76f1-2b36834b2961
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-ad69-a33553b48601
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-73c4-da21b1586f7d
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e930-1f5b4498c0e4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-654a-fd4916bb1414
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-13b9-1d0d02e77d22
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-09e5-fded960507ce
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a8ed-49b6e66bb8e4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-39fa-40e6f9d9de2e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-ff42-aaf22b77b63f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-858f-1b64a6e16532
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5968-db2b523b1136
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-08f6-e0db1cb45393
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-eb54-c221a0b57800
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-4d31-b2cbe02b0aa4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-87f0-b18556e1cde9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f62e-f17c7e5ea8b9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-19e3-3a72bfe3e071
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-7400-92b3bddc6d2d
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-cc37-0c1c2a8ec608
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a33b-9e44a6b376e8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-6078-10a7a39b91b8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-687b-fd7a6e4202b8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-09e9-12b851fb5a91
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-1600-9985a4b8c0ae
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-aa88-5ef2c2f037d6
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e3ed-5923454af489
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9dd4-05802de8db5d
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-69fc-ec93b055fe29
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-67ed-33bd6919fd0c
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8128-2d9e5d1e953b
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-6129-bf9f036643ba
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-2fae-4f3225aa99f0
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-69ce-203025f6429d
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-6b5e-a1908e957be3
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-39bb-253be34f1c3b
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5501-32338fb1d587
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f5ec-3a052fc772d2
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-db9f-11ea83fa3c8f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-4505-619218171acf
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-48e1-24681e553dda
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8d38-0f1dc3361032
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5653-46fbb6fe5412
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8cd2-ab250f5b41e9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e5ad-34aa0ccba76c
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-89ea-3e50fa31270e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-020c-2e04d46d7783
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-45b9-673a0d355ebe
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-16b4-4b07e954bbdd
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-593d-c679ef57dd9b
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e10e-bebe327446c7
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-ab94-9fe0ff02429e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-4c0b-815dd320cb36
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f880-4acfaf9303c4
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8498-0be80abbab52
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-4a71-975f37e2e42e
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-c4a9-444fb5fe24f3
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-266a-b2108021ce27
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-c927-d395bce045db
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a13b-1d38ca833943
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-774b-483c6723b253
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-050c-f1cdfe0c2471
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e77c-24c58517569f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5090-810fa7cce1da
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5ceb-00e0552ee6e6
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-03db-a8bcf7fab2d9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-737c-8c69fb09db28
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-dc15-bc470ed3f952
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-8318-3ba0c4d2e864
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f8ff-9ad1c03bcc18
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-1990-794b7dcae22f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-f139-7311c3acd7db
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e04e-0885a64e1a1f
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9e04-74c6f1b367b8
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-d3bf-79a2c0327b9a
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-95f9-10a4e66aa8e6
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-5ede-ccb4d0e14482
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-167c-423127bde696
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-581f-685589883ffd
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-e005-3488fdfd7d04
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-54a6-703f46ec34bb
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-a2f4-a0ebec81e76c
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-efc4-de2c6ec858a6
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9c07-7c8ac3590c31
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-3b8e-a78f86be3bd2
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-df5a-b480613e5ebd
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-ff64-35fdb24099b9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-91c7-4143754760a9
00020000-559c-e57c-003e-dce05ca5a16c	00030000-559c-e57b-9f66-df8ebbf462cb
\.


--
-- TOC entry 2885 (class 0 OID 9350991)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9351022)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9351135)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559c-e57d-da4a-1ac825cef60f	00090000-559c-e57d-abef-8c0f4e5b728b	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
000b0000-559c-e57d-b12a-96ecb4718088	00090000-559c-e57d-23dc-e6db451fcfcf	\N	\N	0002	401.00	\N	\N	11.00	31.00	11.00	401.00	t	f	Pogodba za vlogo Helena
000b0000-559c-e57d-b06c-e412dbdacd34	00090000-559c-e57d-fa11-84a5d5229c79	\N	\N	0003	402.00	\N	\N	12.00	32.00	12.00	402.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9350756)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559c-e57c-a83b-6f7e4d716898	00040000-559c-e57b-8aa3-8c68ad114be8	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-bd65-12da153e7004	00040000-559c-e57b-8aa3-8c68ad114be8	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559c-e57c-004e-6ba8b83f851e	00040000-559c-e57b-8aa3-8c68ad114be8	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-6278-d207d0e377da	00040000-559c-e57b-8aa3-8c68ad114be8	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-a53c-e9445779c122	00040000-559c-e57b-8aa3-8c68ad114be8	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-410a-e9562492671a	00040000-559c-e57b-0292-5a1443a1c1d8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-abd0-ac17bc590c4c	00040000-559c-e57b-fa82-a0948f4fc2d9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57c-9eb2-2625eff5df63	00040000-559c-e57b-a9d7-4f208c280e51	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559c-e57d-4208-f31415fbeca2	00040000-559c-e57b-8aa3-8c68ad114be8	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9350791)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559c-e57b-8e83-661e2dadaa41	8341	Adlešiči
00050000-559c-e57b-2245-b0f4ca2e46d1	5270	Ajdovščina
00050000-559c-e57b-25cf-bcfabaea1e28	6280	Ankaran/Ancarano
00050000-559c-e57b-55b7-26dfcacbc501	9253	Apače
00050000-559c-e57b-d180-e054dacc21e5	8253	Artiče
00050000-559c-e57b-9a1e-96b5e148b410	4275	Begunje na Gorenjskem
00050000-559c-e57b-e820-2c5f9aa36e8c	1382	Begunje pri Cerknici
00050000-559c-e57b-873e-9eebbffbcb7c	9231	Beltinci
00050000-559c-e57b-a548-0399708004c7	2234	Benedikt
00050000-559c-e57b-9996-510021255ed1	2345	Bistrica ob Dravi
00050000-559c-e57b-a32d-19a5b7bb34f9	3256	Bistrica ob Sotli
00050000-559c-e57b-7485-c15a78cd5ca5	8259	Bizeljsko
00050000-559c-e57b-2bf7-2896eee86d14	1223	Blagovica
00050000-559c-e57b-0229-5ea91381e38f	8283	Blanca
00050000-559c-e57b-cc43-2c38975c6287	4260	Bled
00050000-559c-e57b-ea15-87094c69802e	4273	Blejska Dobrava
00050000-559c-e57b-c60c-85ae59357ee6	9265	Bodonci
00050000-559c-e57b-73e7-eda206c8d29c	9222	Bogojina
00050000-559c-e57b-2ee0-c4bed0653e64	4263	Bohinjska Bela
00050000-559c-e57b-5100-a74df629bfb2	4264	Bohinjska Bistrica
00050000-559c-e57b-e504-d7fd13ee5e43	4265	Bohinjsko jezero
00050000-559c-e57b-f3d5-228fab1d5110	1353	Borovnica
00050000-559c-e57b-97ee-084f43473c44	8294	Boštanj
00050000-559c-e57b-1967-17e3391dbb1e	5230	Bovec
00050000-559c-e57b-ebbd-966a90170fa8	5295	Branik
00050000-559c-e57b-5b1e-34ac7d233c69	3314	Braslovče
00050000-559c-e57b-c0c3-72967d9c1834	5223	Breginj
00050000-559c-e57b-da0f-9c6854a0d298	8280	Brestanica
00050000-559c-e57b-8638-00b20a14a255	2354	Bresternica
00050000-559c-e57b-9ccb-fab7768b1c85	4243	Brezje
00050000-559c-e57b-d73c-5fbd3519b8ba	1351	Brezovica pri Ljubljani
00050000-559c-e57b-ee95-8c9f42c90a76	8250	Brežice
00050000-559c-e57b-b94b-8408aff9c576	4210	Brnik - Aerodrom
00050000-559c-e57b-f7a2-22e2897faaaf	8321	Brusnice
00050000-559c-e57b-fc25-d962c58112a9	3255	Buče
00050000-559c-e57b-7edf-229919daa831	8276	Bučka 
00050000-559c-e57b-8b70-6ea74462f79f	9261	Cankova
00050000-559c-e57b-8ab5-a65b5ce4832e	3000	Celje 
00050000-559c-e57b-5af0-40a092d6cc42	3001	Celje - poštni predali
00050000-559c-e57b-c907-b87a3ecb32e2	4207	Cerklje na Gorenjskem
00050000-559c-e57b-e153-a97a789125ce	8263	Cerklje ob Krki
00050000-559c-e57b-22b9-4340f008e0c2	1380	Cerknica
00050000-559c-e57b-0ca0-3c1b6f658b24	5282	Cerkno
00050000-559c-e57b-b205-022bd3ec5bcd	2236	Cerkvenjak
00050000-559c-e57b-70b6-bf936fc9c383	2215	Ceršak
00050000-559c-e57b-c9a5-ee3e3247ee5c	2326	Cirkovce
00050000-559c-e57b-f432-0b4d88170b9e	2282	Cirkulane
00050000-559c-e57b-1052-9fd44e37ec91	5273	Col
00050000-559c-e57b-53b3-21d15dbbad5d	8251	Čatež ob Savi
00050000-559c-e57b-b061-ca5ac17b9dd2	1413	Čemšenik
00050000-559c-e57b-d064-d01899a04841	5253	Čepovan
00050000-559c-e57b-e15e-7544ed160d05	9232	Črenšovci
00050000-559c-e57b-1cca-50476d742c33	2393	Črna na Koroškem
00050000-559c-e57b-d88e-58dded2f6e51	6275	Črni Kal
00050000-559c-e57b-d571-eee927dc7356	5274	Črni Vrh nad Idrijo
00050000-559c-e57b-11b4-43cec8fa9686	5262	Črniče
00050000-559c-e57b-33bf-d97811466e3b	8340	Črnomelj
00050000-559c-e57b-aba8-75ff66ab9328	6271	Dekani
00050000-559c-e57b-8731-6130b5d16b59	5210	Deskle
00050000-559c-e57b-56f6-8fd7c68fb8e8	2253	Destrnik
00050000-559c-e57b-6298-9157af178cb6	6215	Divača
00050000-559c-e57b-c7cf-558a82e698e1	1233	Dob
00050000-559c-e57b-8c61-5c880da50da3	3224	Dobje pri Planini
00050000-559c-e57b-a587-13ad4827facb	8257	Dobova
00050000-559c-e57b-4817-6dc865ec0179	1423	Dobovec
00050000-559c-e57b-31ba-58136aaf466d	5263	Dobravlje
00050000-559c-e57b-ce8a-1e04fc5be20c	3204	Dobrna
00050000-559c-e57b-39bf-54d4fc6044b1	8211	Dobrnič
00050000-559c-e57b-7231-e03a641a699b	1356	Dobrova
00050000-559c-e57b-dab7-ffe5f868b39b	9223	Dobrovnik/Dobronak 
00050000-559c-e57b-d03c-dc9773084789	5212	Dobrovo v Brdih
00050000-559c-e57b-adc8-433387befc2c	1431	Dol pri Hrastniku
00050000-559c-e57b-9a0c-25b2b77720d5	1262	Dol pri Ljubljani
00050000-559c-e57b-66b4-6c5ddfd543ae	1273	Dole pri Litiji
00050000-559c-e57b-6459-846cc736145d	1331	Dolenja vas
00050000-559c-e57b-2f41-a97287e2b765	8350	Dolenjske Toplice
00050000-559c-e57b-b89b-213d99489ed3	1230	Domžale
00050000-559c-e57b-0251-73afd8e46bd0	2252	Dornava
00050000-559c-e57b-7e15-f1233c6ac8b1	5294	Dornberk
00050000-559c-e57b-ddb3-476365829aa2	1319	Draga
00050000-559c-e57b-14a7-6a0309dd79ca	8343	Dragatuš
00050000-559c-e57b-3744-bdf54ca7e326	3222	Dramlje
00050000-559c-e57b-da3d-6fb8f5b9eaa8	2370	Dravograd
00050000-559c-e57b-8e49-2862980a1567	4203	Duplje
00050000-559c-e57b-2c73-efebcbd9aca9	6221	Dutovlje
00050000-559c-e57b-cfed-4bc7b4cffa33	8361	Dvor
00050000-559c-e57b-954a-12c74680ae2a	2343	Fala
00050000-559c-e57b-5e44-d84829a23f09	9208	Fokovci
00050000-559c-e57b-662b-4dc803760a72	2313	Fram
00050000-559c-e57b-e2fd-2b79956b7882	3213	Frankolovo
00050000-559c-e57b-428e-00360701dd1e	1274	Gabrovka
00050000-559c-e57b-d11e-e02f7fecb59d	8254	Globoko
00050000-559c-e57b-1459-8458cd9c63bc	5275	Godovič
00050000-559c-e57b-c84e-4500bb96536b	4204	Golnik
00050000-559c-e57b-6475-ee0d67b47295	3303	Gomilsko
00050000-559c-e57b-6669-d59688d3a0f9	4224	Gorenja vas
00050000-559c-e57b-3c30-768dc0d5cd8f	3263	Gorica pri Slivnici
00050000-559c-e57b-8720-a32a2bec251c	2272	Gorišnica
00050000-559c-e57b-39a6-604ff253f618	9250	Gornja Radgona
00050000-559c-e57b-e8c7-e6d6be00284f	3342	Gornji Grad
00050000-559c-e57b-487c-483c83626633	4282	Gozd Martuljek
00050000-559c-e57b-d4ef-7eabaf013d63	6272	Gračišče
00050000-559c-e57b-13c9-460fb31d2eba	9264	Grad
00050000-559c-e57b-4f54-000135ad28b5	8332	Gradac
00050000-559c-e57b-6d9a-98738bcd3bbe	1384	Grahovo
00050000-559c-e57b-8655-f0c4becc8592	5242	Grahovo ob Bači
00050000-559c-e57b-66f5-e4ca09fde771	5251	Grgar
00050000-559c-e57b-4610-b51a6ed9ac86	3302	Griže
00050000-559c-e57b-e6bc-dc8051f90a6e	3231	Grobelno
00050000-559c-e57b-acca-fee9a0019c4f	1290	Grosuplje
00050000-559c-e57b-1000-765d9c213401	2288	Hajdina
00050000-559c-e57b-d210-4e2b1a7b7e34	8362	Hinje
00050000-559c-e57b-9460-24e0cb6ccc4e	2311	Hoče
00050000-559c-e57b-c017-76981a58b2d9	9205	Hodoš/Hodos
00050000-559c-e57b-c056-4f0057b60bdc	1354	Horjul
00050000-559c-e57b-23aa-22fe61116362	1372	Hotedršica
00050000-559c-e57b-f29a-c898eb103690	1430	Hrastnik
00050000-559c-e57b-d8ec-c8e9657b2a21	6225	Hruševje
00050000-559c-e57b-06af-a424be7ec0c5	4276	Hrušica
00050000-559c-e57b-9cdc-dae1a49dc144	5280	Idrija
00050000-559c-e57b-f001-8f63ab2b35ff	1292	Ig
00050000-559c-e57b-f8ee-63f1d56326d5	6250	Ilirska Bistrica
00050000-559c-e57b-1989-99730c51bb31	6251	Ilirska Bistrica-Trnovo
00050000-559c-e57b-4d58-aa83482142e0	1295	Ivančna Gorica
00050000-559c-e57b-0e1f-b2e2d8a5f578	2259	Ivanjkovci
00050000-559c-e57b-97b4-9b43e25cb961	1411	Izlake
00050000-559c-e57b-1b44-56a0a0a9e4d8	6310	Izola/Isola
00050000-559c-e57b-f97e-d1ecf8c95410	2222	Jakobski Dol
00050000-559c-e57b-92b5-f209ce22039c	2221	Jarenina
00050000-559c-e57b-9d89-614aff3c6c80	6254	Jelšane
00050000-559c-e57b-270b-4337bb63340e	4270	Jesenice
00050000-559c-e57b-740c-581d07cc1835	8261	Jesenice na Dolenjskem
00050000-559c-e57b-4dd1-6f409d169621	3273	Jurklošter
00050000-559c-e57b-90c9-7ecbb43cdc6c	2223	Jurovski Dol
00050000-559c-e57b-600b-8d9bdf40b9fa	2256	Juršinci
00050000-559c-e57b-2635-d8ab4a8c97fa	5214	Kal nad Kanalom
00050000-559c-e57b-9f20-e45b0af7b5a4	3233	Kalobje
00050000-559c-e57b-35a5-973768b18f49	4246	Kamna Gorica
00050000-559c-e57b-246b-6f7c3ec6b548	2351	Kamnica
00050000-559c-e57b-9b75-11a655955c7d	1241	Kamnik
00050000-559c-e57b-a401-012e4871e177	5213	Kanal
00050000-559c-e57b-9901-2d32f21ae992	8258	Kapele
00050000-559c-e57b-1d41-be7ab76dff8c	2362	Kapla
00050000-559c-e57b-0cae-8a5c8a1f5381	2325	Kidričevo
00050000-559c-e57b-3452-b2ba0f6533db	1412	Kisovec
00050000-559c-e57b-65e3-9a90839598f1	6253	Knežak
00050000-559c-e57b-62b2-cadf39c131cf	5222	Kobarid
00050000-559c-e57b-5617-c1b9bcf65173	9227	Kobilje
00050000-559c-e57b-68fd-5e666c99cb97	1330	Kočevje
00050000-559c-e57b-b0bb-c197cae9ce94	1338	Kočevska Reka
00050000-559c-e57b-b197-fd22af34a241	2276	Kog
00050000-559c-e57b-29ff-6538d9fb28ae	5211	Kojsko
00050000-559c-e57b-f930-d413cd9b19d0	6223	Komen
00050000-559c-e57b-09bf-b5ba1a423cef	1218	Komenda
00050000-559c-e57b-6592-3b07cdb8be45	6000	Koper/Capodistria 
00050000-559c-e57b-6380-5fd93f5e3a4f	6001	Koper/Capodistria - poštni predali
00050000-559c-e57b-c6e8-576070fdae9a	8282	Koprivnica
00050000-559c-e57b-6992-e6114d0edeeb	5296	Kostanjevica na Krasu
00050000-559c-e57b-b42b-f26ae5fda46c	8311	Kostanjevica na Krki
00050000-559c-e57b-f25f-629d2445eef4	1336	Kostel
00050000-559c-e57b-1cbc-f9c95ba97b9e	6256	Košana
00050000-559c-e57b-788f-73121b352f2a	2394	Kotlje
00050000-559c-e57b-b3e3-efac5c8b7191	6240	Kozina
00050000-559c-e57b-4fc9-c72edd1c1345	3260	Kozje
00050000-559c-e57b-2d0b-ef5d4d59c705	4000	Kranj 
00050000-559c-e57b-3b6f-e2f3a5898d06	4001	Kranj - poštni predali
00050000-559c-e57b-21c7-dba003dec94c	4280	Kranjska Gora
00050000-559c-e57b-447a-c95fd4abe1ff	1281	Kresnice
00050000-559c-e57b-c285-fad895155bfe	4294	Križe
00050000-559c-e57b-4359-d7d8160791c4	9206	Križevci
00050000-559c-e57b-ef8e-3e6ab65ed10a	9242	Križevci pri Ljutomeru
00050000-559c-e57b-fde0-2a9565486c4e	1301	Krka
00050000-559c-e57b-7a14-b8ade38141f1	8296	Krmelj
00050000-559c-e57b-770f-74c5ac6eaf7d	4245	Kropa
00050000-559c-e57b-ad64-e9df66ace3bc	8262	Krška vas
00050000-559c-e57b-5a27-7431d2849f29	8270	Krško
00050000-559c-e57b-35de-7307319ae19d	9263	Kuzma
00050000-559c-e57b-ae96-d864231e3a48	2318	Laporje
00050000-559c-e57b-b459-69b5c4061ff0	3270	Laško
00050000-559c-e57b-1851-549a9db8a3f1	1219	Laze v Tuhinju
00050000-559c-e57b-9649-6da3d2f759ab	2230	Lenart v Slovenskih goricah
00050000-559c-e57b-6ebb-1100f868e9e6	9220	Lendava/Lendva
00050000-559c-e57b-72e8-eb3eb3db7885	4248	Lesce
00050000-559c-e57b-31ef-b676e34fefbb	3261	Lesično
00050000-559c-e57b-b488-4735c3ce3b73	8273	Leskovec pri Krškem
00050000-559c-e57b-f57a-7451933444f2	2372	Libeliče
00050000-559c-e57b-34ff-5a4c6891e391	2341	Limbuš
00050000-559c-e57b-6b9e-f493dc04f12c	1270	Litija
00050000-559c-e57b-1265-f6fc71882ead	3202	Ljubečna
00050000-559c-e57b-f151-2c02d5ac7e10	1000	Ljubljana 
00050000-559c-e57b-18ca-84c8c94080a8	1001	Ljubljana - poštni predali
00050000-559c-e57b-4c85-ac372d460f0b	1231	Ljubljana - Črnuče
00050000-559c-e57b-2dbc-746211a56460	1261	Ljubljana - Dobrunje
00050000-559c-e57b-b232-0d70c61c10d0	1260	Ljubljana - Polje
00050000-559c-e57b-c29f-ce8fffd90bdf	1210	Ljubljana - Šentvid
00050000-559c-e57b-834d-0c178923e54f	1211	Ljubljana - Šmartno
00050000-559c-e57b-06e5-f3e5b08d02ad	3333	Ljubno ob Savinji
00050000-559c-e57b-c791-8ab1ee91d746	9240	Ljutomer
00050000-559c-e57b-9961-4adfb1eb0eb0	3215	Loče
00050000-559c-e57b-3b14-32b41d674b41	5231	Log pod Mangartom
00050000-559c-e57b-0d38-eb6fbb19d31d	1358	Log pri Brezovici
00050000-559c-e57b-d443-f873c3f17a87	1370	Logatec
00050000-559c-e57b-9c8d-98187f3f5ccc	1371	Logatec
00050000-559c-e57b-b5ed-97766560549c	1434	Loka pri Zidanem Mostu
00050000-559c-e57b-c1e3-f925211d4a8d	3223	Loka pri Žusmu
00050000-559c-e57b-9902-78a909f983f5	6219	Lokev
00050000-559c-e57b-d250-93eee427a911	1318	Loški Potok
00050000-559c-e57b-bca2-c0e177a66323	2324	Lovrenc na Dravskem polju
00050000-559c-e57b-5529-3481118d6d65	2344	Lovrenc na Pohorju
00050000-559c-e57b-8ca4-858d5fb92dd9	3334	Luče
00050000-559c-e57b-cea3-9499a4c9f031	1225	Lukovica
00050000-559c-e57b-fa20-3a0531e71126	9202	Mačkovci
00050000-559c-e57b-b9f4-22c7373aa851	2322	Majšperk
00050000-559c-e57b-650e-c6fb30685983	2321	Makole
00050000-559c-e57b-1b7e-0a6cb94e54e4	9243	Mala Nedelja
00050000-559c-e57b-0eda-b9b6726b6550	2229	Malečnik
00050000-559c-e57b-f9dc-179bd373b8fc	6273	Marezige
00050000-559c-e57b-18cd-ba81614a57e1	2000	Maribor 
00050000-559c-e57b-c041-4a79b544c5c8	2001	Maribor - poštni predali
00050000-559c-e57b-ccdb-ad72fc3501c8	2206	Marjeta na Dravskem polju
00050000-559c-e57b-98e9-02b8a36d018e	2281	Markovci
00050000-559c-e57b-311a-fd0e5b205baf	9221	Martjanci
00050000-559c-e57b-1ced-447b7f83369f	6242	Materija
00050000-559c-e57b-f9c3-0b8070961330	4211	Mavčiče
00050000-559c-e57b-c962-c01cc8f1cc0d	1215	Medvode
00050000-559c-e57b-054f-15141d3754c4	1234	Mengeš
00050000-559c-e57b-ba93-9250454821ac	8330	Metlika
00050000-559c-e57b-033f-583742ed0706	2392	Mežica
00050000-559c-e57b-300c-a7dbcc1f702c	2204	Miklavž na Dravskem polju
00050000-559c-e57b-3f45-a56d07a3aa04	2275	Miklavž pri Ormožu
00050000-559c-e57b-b646-79c5916b78e8	5291	Miren
00050000-559c-e57b-546c-71ff5c8d45b9	8233	Mirna
00050000-559c-e57b-2618-a5c428c34f9b	8216	Mirna Peč
00050000-559c-e57b-3f6d-5c6912924f1f	2382	Mislinja
00050000-559c-e57b-1167-677216717ed6	4281	Mojstrana
00050000-559c-e57b-fd39-62bfa40ccc46	8230	Mokronog
00050000-559c-e57b-ec86-8b4109fb9eca	1251	Moravče
00050000-559c-e57b-7778-51b819f3ea4a	9226	Moravske Toplice
00050000-559c-e57b-a2dc-007f1bed72a8	5216	Most na Soči
00050000-559c-e57b-0673-960c839c94a9	1221	Motnik
00050000-559c-e57b-2abb-0e042890aa91	3330	Mozirje
00050000-559c-e57b-bc38-4fa4d9223d87	9000	Murska Sobota 
00050000-559c-e57b-7b61-fba3824c69a9	9001	Murska Sobota - poštni predali
00050000-559c-e57b-8dda-eed03b78458c	2366	Muta
00050000-559c-e57b-33a5-3ccc4f7d1a69	4202	Naklo
00050000-559c-e57b-8958-041a21aa6284	3331	Nazarje
00050000-559c-e57b-0a3f-ff17e383cd8e	1357	Notranje Gorice
00050000-559c-e57b-7ffa-e24e57ca893c	3203	Nova Cerkev
00050000-559c-e57b-648c-3c74d66cd8fe	5000	Nova Gorica 
00050000-559c-e57b-7480-141b664ccaa3	5001	Nova Gorica - poštni predali
00050000-559c-e57b-d37c-089e7ad2c2be	1385	Nova vas
00050000-559c-e57b-1add-59ea2dc00cd4	8000	Novo mesto
00050000-559c-e57b-de19-964d0afd5e70	8001	Novo mesto - poštni predali
00050000-559c-e57b-0e40-1e293b5db461	6243	Obrov
00050000-559c-e57b-3655-f38c679bf02c	9233	Odranci
00050000-559c-e57b-ac30-59a39b564b22	2317	Oplotnica
00050000-559c-e57b-7954-f55f3d228b14	2312	Orehova vas
00050000-559c-e57b-3bab-45423814711e	2270	Ormož
00050000-559c-e57b-bd61-63e103347973	1316	Ortnek
00050000-559c-e57b-c9dd-bca4631c521c	1337	Osilnica
00050000-559c-e57b-106b-4dc1e38ab915	8222	Otočec
00050000-559c-e57b-82ed-a393e81e886c	2361	Ožbalt
00050000-559c-e57b-7017-3907df67cb26	2231	Pernica
00050000-559c-e57b-98a5-dd2632526603	2211	Pesnica pri Mariboru
00050000-559c-e57b-5053-6459f39cfce4	9203	Petrovci
00050000-559c-e57b-a9e6-49c596ec3cfe	3301	Petrovče
00050000-559c-e57b-3a19-371d9e5a2fbb	6330	Piran/Pirano
00050000-559c-e57b-d431-09b5ae9a6883	8255	Pišece
00050000-559c-e57b-b609-667ba99cc75b	6257	Pivka
00050000-559c-e57b-7ead-1bbb0bef59cc	6232	Planina
00050000-559c-e57b-81d5-ad782b698611	3225	Planina pri Sevnici
00050000-559c-e57b-06c0-6d46ea908c07	6276	Pobegi
00050000-559c-e57b-a4cc-54334536fa12	8312	Podbočje
00050000-559c-e57b-b9d5-4cc673cb8036	5243	Podbrdo
00050000-559c-e57b-4324-eec3a71b859f	3254	Podčetrtek
00050000-559c-e57b-8a9e-af0c91055e88	2273	Podgorci
00050000-559c-e57b-374a-860f30ff24b8	6216	Podgorje
00050000-559c-e57b-032f-7b8756c3677f	2381	Podgorje pri Slovenj Gradcu
00050000-559c-e57b-621f-49648e0c9efa	6244	Podgrad
00050000-559c-e57b-fd9d-1a733295226a	1414	Podkum
00050000-559c-e57b-287b-6ab98d70124a	2286	Podlehnik
00050000-559c-e57b-04d4-f0376894e23d	5272	Podnanos
00050000-559c-e57b-e0f1-d6c3710919f0	4244	Podnart
00050000-559c-e57b-3b91-e791adcece54	3241	Podplat
00050000-559c-e57b-104a-4a189489e03a	3257	Podsreda
00050000-559c-e57b-fc07-8dc5e342b9ee	2363	Podvelka
00050000-559c-e57b-d256-a72755882425	2208	Pohorje
00050000-559c-e57b-6855-74103094c41e	2257	Polenšak
00050000-559c-e57b-4fe1-7d53367d89dc	1355	Polhov Gradec
00050000-559c-e57b-e07a-3947e816b654	4223	Poljane nad Škofjo Loko
00050000-559c-e57b-5f98-ba72a5f5079e	2319	Poljčane
00050000-559c-e57b-632a-360454f43745	1272	Polšnik
00050000-559c-e57b-3aad-ea207c1d4f04	3313	Polzela
00050000-559c-e57b-84eb-8793c003cd96	3232	Ponikva
00050000-559c-e57b-399b-128e290f2691	6320	Portorož/Portorose
00050000-559c-e57b-01d5-027d3daa0fb0	6230	Postojna
00050000-559c-e57b-34fe-ff0f07f3757b	2331	Pragersko
00050000-559c-e57b-e550-e5d41a0e03f6	3312	Prebold
00050000-559c-e57b-55b3-182080fe15b7	4205	Preddvor
00050000-559c-e57b-3490-0ca34d8f15b1	6255	Prem
00050000-559c-e57b-2b17-ac8f3ad6bd42	1352	Preserje
00050000-559c-e57b-14a4-7f08169eae30	6258	Prestranek
00050000-559c-e57b-62ee-c3e2a49ab712	2391	Prevalje
00050000-559c-e57b-3e5d-e7aebd15ab20	3262	Prevorje
00050000-559c-e57b-5d45-4efdbe395470	1276	Primskovo 
00050000-559c-e57b-0ccc-79d44cbeb238	3253	Pristava pri Mestinju
00050000-559c-e57b-ed8f-0f188cd1e58f	9207	Prosenjakovci/Partosfalva
00050000-559c-e57b-ff3f-2fef96faee1b	5297	Prvačina
00050000-559c-e57b-d98c-a96642e52d51	2250	Ptuj
00050000-559c-e57b-41fb-b59eb19d35d6	2323	Ptujska Gora
00050000-559c-e57b-6e6b-829585c92167	9201	Puconci
00050000-559c-e57b-aee8-1805aa64f15d	2327	Rače
00050000-559c-e57b-4719-869fe69e65a0	1433	Radeče
00050000-559c-e57b-b636-a31af2ff29d0	9252	Radenci
00050000-559c-e57b-f860-7a0ccad3fcce	2360	Radlje ob Dravi
00050000-559c-e57b-cece-7490caeff37d	1235	Radomlje
00050000-559c-e57b-0526-9fb19f747554	4240	Radovljica
00050000-559c-e57b-fdec-876b56b69445	8274	Raka
00050000-559c-e57b-951b-8ad4aece92d4	1381	Rakek
00050000-559c-e57b-c3fa-cd60b14d6a71	4283	Rateče - Planica
00050000-559c-e57b-89af-b56ac0363f79	2390	Ravne na Koroškem
00050000-559c-e57b-bd6b-db7a8ded795c	9246	Razkrižje
00050000-559c-e57b-033c-1d32481bfb1f	3332	Rečica ob Savinji
00050000-559c-e57b-e988-ecd525037935	5292	Renče
00050000-559c-e57b-b0b4-932ab21724d4	1310	Ribnica
00050000-559c-e57b-74ae-8a860424f55b	2364	Ribnica na Pohorju
00050000-559c-e57b-3dc8-8dac4c8e8439	3272	Rimske Toplice
00050000-559c-e57b-d607-933edc581c08	1314	Rob
00050000-559c-e57b-488f-873f3053db8a	5215	Ročinj
00050000-559c-e57b-1105-33de421dd2fb	3250	Rogaška Slatina
00050000-559c-e57b-ee6a-26be1cc1120d	9262	Rogašovci
00050000-559c-e57b-2a08-c84b42734ff7	3252	Rogatec
00050000-559c-e57b-16a4-e9f035b85592	1373	Rovte
00050000-559c-e57b-f6b1-b7e64b828f80	2342	Ruše
00050000-559c-e57b-440a-ae63273c4450	1282	Sava
00050000-559c-e57b-7403-f40e19fa0e43	6333	Sečovlje/Sicciole
00050000-559c-e57b-0b01-8fa69928e975	4227	Selca
00050000-559c-e57b-260c-bf143f66fa70	2352	Selnica ob Dravi
00050000-559c-e57b-e8a3-ce095422e679	8333	Semič
00050000-559c-e57b-236d-8c185340cdc4	8281	Senovo
00050000-559c-e57b-5260-629782939848	6224	Senožeče
00050000-559c-e57b-94b6-2e9e4cb8e4fe	8290	Sevnica
00050000-559c-e57b-2c4e-1bcecaffb107	6210	Sežana
00050000-559c-e57b-3204-8c2333384dc1	2214	Sladki Vrh
00050000-559c-e57b-df03-f27e28881995	5283	Slap ob Idrijci
00050000-559c-e57b-eecb-3f775561e951	2380	Slovenj Gradec
00050000-559c-e57b-4616-9580b93d04ee	2310	Slovenska Bistrica
00050000-559c-e57b-0016-c232ba95e521	3210	Slovenske Konjice
00050000-559c-e57b-d2f5-257303044e5c	1216	Smlednik
00050000-559c-e57b-fcdb-25b579663bc9	5232	Soča
00050000-559c-e57b-2cf2-1357ba09f0c9	1317	Sodražica
00050000-559c-e57b-5519-a682d426aff7	3335	Solčava
00050000-559c-e57b-bffb-7aeb8ad67d34	5250	Solkan
00050000-559c-e57b-402c-1b25c4475ad7	4229	Sorica
00050000-559c-e57b-4c24-120a6a40b791	4225	Sovodenj
00050000-559c-e57b-cca2-f210942ad363	5281	Spodnja Idrija
00050000-559c-e57b-309f-81f11ed80412	2241	Spodnji Duplek
00050000-559c-e57b-f0fc-d7907b8e5475	9245	Spodnji Ivanjci
00050000-559c-e57b-7682-ae2e5ef3e553	2277	Središče ob Dravi
00050000-559c-e57b-67cc-d8e4760a35da	4267	Srednja vas v Bohinju
00050000-559c-e57b-8122-6ed6abecbc7a	8256	Sromlje 
00050000-559c-e57b-a48e-f74ff1871481	5224	Srpenica
00050000-559c-e57b-4d5c-0c96f0fa59f4	1242	Stahovica
00050000-559c-e57b-0ac8-c09ca2dfecfb	1332	Stara Cerkev
00050000-559c-e57b-8790-dff880809790	8342	Stari trg ob Kolpi
00050000-559c-e57b-5a16-b316ccf25a0a	1386	Stari trg pri Ložu
00050000-559c-e57b-e84c-a316c8694639	2205	Starše
00050000-559c-e57b-4fb6-0d5100afb91c	2289	Stoperce
00050000-559c-e57b-5713-fdef2f27fa7b	8322	Stopiče
00050000-559c-e57b-3ace-fc62a64a6e5f	3206	Stranice
00050000-559c-e57b-c66e-f92d45549eb3	8351	Straža
00050000-559c-e57b-38fa-897fdb375bd1	1313	Struge
00050000-559c-e57b-2b71-a3a3970d0553	8293	Studenec
00050000-559c-e57b-ff85-f39cb0edd137	8331	Suhor
00050000-559c-e57b-bbd3-b956675da13b	2233	Sv. Ana v Slovenskih goricah
00050000-559c-e57b-eefb-604b0450860e	2235	Sv. Trojica v Slovenskih goricah
00050000-559c-e57b-ac39-447b78334ced	2353	Sveti Duh na Ostrem Vrhu
00050000-559c-e57b-b086-7344ace3d2f8	9244	Sveti Jurij ob Ščavnici
00050000-559c-e57b-63ab-30a6cc358235	3264	Sveti Štefan
00050000-559c-e57b-42d1-37e44c0fa7e7	2258	Sveti Tomaž
00050000-559c-e57b-01b0-d96d9a8d5fad	9204	Šalovci
00050000-559c-e57b-9b65-610204ef09a6	5261	Šempas
00050000-559c-e57b-b530-c8a73edb900f	5290	Šempeter pri Gorici
00050000-559c-e57b-61f6-0ab031fc2259	3311	Šempeter v Savinjski dolini
00050000-559c-e57b-0cdd-287d95dd9b51	4208	Šenčur
00050000-559c-e57b-8ef9-c75b880824fe	2212	Šentilj v Slovenskih goricah
00050000-559c-e57b-5e05-118a33370cfe	8297	Šentjanž
00050000-559c-e57b-b878-1f3c7dac21ec	2373	Šentjanž pri Dravogradu
00050000-559c-e57b-a676-16305dddbef5	8310	Šentjernej
00050000-559c-e57b-6f79-393482b15099	3230	Šentjur
00050000-559c-e57b-c167-f67bc38617d5	3271	Šentrupert
00050000-559c-e57b-1d6d-14f9bac0064c	8232	Šentrupert
00050000-559c-e57b-f191-0d08ca8d1d68	1296	Šentvid pri Stični
00050000-559c-e57b-0e6a-888cc937bb4d	8275	Škocjan
00050000-559c-e57b-56ff-39a9fc609fdf	6281	Škofije
00050000-559c-e57b-846a-cd27b26859e5	4220	Škofja Loka
00050000-559c-e57b-5814-cd227db99a8c	3211	Škofja vas
00050000-559c-e57b-114d-fe223541dc14	1291	Škofljica
00050000-559c-e57b-c2e4-3bbfa0b623f3	6274	Šmarje
00050000-559c-e57b-83f7-dbddfafe487b	1293	Šmarje - Sap
00050000-559c-e57b-2ffc-1c53cce3e4ce	3240	Šmarje pri Jelšah
00050000-559c-e57b-7259-d344a1b88e3c	8220	Šmarješke Toplice
00050000-559c-e57b-7177-1f7d9e875efe	2315	Šmartno na Pohorju
00050000-559c-e57b-f1f4-968b87e55e3a	3341	Šmartno ob Dreti
00050000-559c-e57b-2f2c-258bc2a1197d	3327	Šmartno ob Paki
00050000-559c-e57b-0f12-85853741c3ae	1275	Šmartno pri Litiji
00050000-559c-e57b-67d4-87043a278841	2383	Šmartno pri Slovenj Gradcu
00050000-559c-e57b-5e77-e374bec06b27	3201	Šmartno v Rožni dolini
00050000-559c-e57b-923c-84d521d27ad4	3325	Šoštanj
00050000-559c-e57b-c3e9-47d460a7d1a0	6222	Štanjel
00050000-559c-e57b-fc32-c621800b7b3d	3220	Štore
00050000-559c-e57b-b93d-5f506d2bdf09	3304	Tabor
00050000-559c-e57b-9e0c-30cc9f22d380	3221	Teharje
00050000-559c-e57b-be1b-0a3081219a07	9251	Tišina
00050000-559c-e57b-d19e-6383acf2f47f	5220	Tolmin
00050000-559c-e57b-aa9b-2a8e14d58893	3326	Topolšica
00050000-559c-e57b-17b3-fddbca583f00	2371	Trbonje
00050000-559c-e57b-d2b9-7e2a49f0e77f	1420	Trbovlje
00050000-559c-e57b-5442-a52802fe33d5	8231	Trebelno 
00050000-559c-e57b-7eef-23cb0d580204	8210	Trebnje
00050000-559c-e57b-12e2-1346ea6ffc91	5252	Trnovo pri Gorici
00050000-559c-e57b-bade-5a5db7bf9ed3	2254	Trnovska vas
00050000-559c-e57b-7265-7e8ef1f48395	1222	Trojane
00050000-559c-e57b-9d04-feb58d2d66a3	1236	Trzin
00050000-559c-e57b-bf33-41622f899686	4290	Tržič
00050000-559c-e57b-2983-7df1f312de69	8295	Tržišče
00050000-559c-e57b-155c-f0678489b527	1311	Turjak
00050000-559c-e57b-0a39-021058b0ff0d	9224	Turnišče
00050000-559c-e57b-fe85-1e51f4d03212	8323	Uršna sela
00050000-559c-e57b-7bf0-481f45ed7f4f	1252	Vače
00050000-559c-e57b-d533-6dc1c655ca1c	3320	Velenje 
00050000-559c-e57b-4e3d-37e2074e672e	3322	Velenje - poštni predali
00050000-559c-e57b-bd11-49ff7a1008d7	8212	Velika Loka
00050000-559c-e57b-2c92-363a7fa86f5e	2274	Velika Nedelja
00050000-559c-e57b-1e81-db45c8ca8456	9225	Velika Polana
00050000-559c-e57b-ddc2-cf5a0d4b7968	1315	Velike Lašče
00050000-559c-e57b-cd76-3be5867d02ad	8213	Veliki Gaber
00050000-559c-e57b-3118-5b25f844c95a	9241	Veržej
00050000-559c-e57b-2816-59b93f2e4f2f	1312	Videm - Dobrepolje
00050000-559c-e57b-81f4-3ae5bd078b7e	2284	Videm pri Ptuju
00050000-559c-e57b-e076-521b7dd0f7c0	8344	Vinica
00050000-559c-e57b-282e-ec9ee2ac011d	5271	Vipava
00050000-559c-e57b-c588-1a3755f5ba4e	4212	Visoko
00050000-559c-e57b-0495-7d4c7f8daaf1	1294	Višnja Gora
00050000-559c-e57b-9a28-568ca4351b71	3205	Vitanje
00050000-559c-e57b-876a-d423c1fba7ef	2255	Vitomarci
00050000-559c-e57b-0860-f85d9f529640	1217	Vodice
00050000-559c-e57b-5def-bd491cd5ecfc	3212	Vojnik\t
00050000-559c-e57b-4a2e-41c3dfe189f0	5293	Volčja Draga
00050000-559c-e57b-f1d8-12f5fc1e31af	2232	Voličina
00050000-559c-e57b-fd56-f0f98b386b74	3305	Vransko
00050000-559c-e57b-7499-62694b569bee	6217	Vremski Britof
00050000-559c-e57c-2a50-b42ae70d34f1	1360	Vrhnika
00050000-559c-e57c-8b62-16eedaba45c8	2365	Vuhred
00050000-559c-e57c-bc73-70647336a54b	2367	Vuzenica
00050000-559c-e57c-dedc-83bd61029dba	8292	Zabukovje 
00050000-559c-e57c-9cd3-3e650c2a9aad	1410	Zagorje ob Savi
00050000-559c-e57c-ec0c-a2970db00671	1303	Zagradec
00050000-559c-e57c-506c-3bc8bc28f817	2283	Zavrč
00050000-559c-e57c-4d02-73e093a732c1	8272	Zdole 
00050000-559c-e57c-b052-1ffb222e86f4	4201	Zgornja Besnica
00050000-559c-e57c-d916-56a92e31b126	2242	Zgornja Korena
00050000-559c-e57c-53f7-aae395704db3	2201	Zgornja Kungota
00050000-559c-e57c-85db-adf04d2609c0	2316	Zgornja Ložnica
00050000-559c-e57c-53f6-a261ee6ddf69	2314	Zgornja Polskava
00050000-559c-e57c-3cda-d291631c5eb1	2213	Zgornja Velka
00050000-559c-e57c-922d-e2b73c674ace	4247	Zgornje Gorje
00050000-559c-e57c-292a-3de951f2a3e3	4206	Zgornje Jezersko
00050000-559c-e57c-5b3b-d60b8b74ab5b	2285	Zgornji Leskovec
00050000-559c-e57c-1a5e-67aec4623e77	1432	Zidani Most
00050000-559c-e57c-c8a9-776130238dd0	3214	Zreče
00050000-559c-e57c-9d99-a8d04c14bff0	4209	Žabnica
00050000-559c-e57c-88fa-0e10b1982d7e	3310	Žalec
00050000-559c-e57c-f084-f7e71be3da24	4228	Železniki
00050000-559c-e57c-3578-5c2f208cd8d4	2287	Žetale
00050000-559c-e57c-7c3e-200b5886661e	4226	Žiri
00050000-559c-e57c-503a-ab5b9f1d46a1	4274	Žirovnica
00050000-559c-e57c-81a2-83488341c1eb	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9350965)
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
-- TOC entry 2863 (class 0 OID 9350776)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9350854)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9350977)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9351284)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9351295)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559c-e57d-ed52-59e6471b179f	00080000-559c-e57d-4208-f31415fbeca2	0900	AK
00190000-559c-e57d-578c-9214c20ccd9f	00080000-559c-e57c-004e-6ba8b83f851e	0987	A
00190000-559c-e57d-77dd-7a48d858b032	00080000-559c-e57c-bd65-12da153e7004	0989	A
00190000-559c-e57d-4daa-4eb8c5320083	00080000-559c-e57c-6278-d207d0e377da	0986	A
00190000-559c-e57d-0dd4-139371e93532	00080000-559c-e57c-410a-e9562492671a	0984	A
00190000-559c-e57d-7bef-c6594056d7bb	00080000-559c-e57c-abd0-ac17bc590c4c	0983	A
00190000-559c-e57d-6ad2-cd68f86e8f2a	00080000-559c-e57c-9eb2-2625eff5df63	0982	A
\.


--
-- TOC entry 2905 (class 0 OID 9351265)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559c-e57d-efec-dee333fc753b	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2887 (class 0 OID 9351006)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559c-e57c-a027-38553194ba1e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559c-e57c-0024-52bd5516a34e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559c-e57c-3ad9-0b00ba8b23f8	0003	Kazinska	t	84	Kazinska dvorana
00220000-559c-e57c-9795-b87719d0502f	0004	Mali oder	t	24	Mali oder 
00220000-559c-e57c-c29d-25e663da981c	0005	Komorni oder	t	15	Komorni oder
00220000-559c-e57c-3002-cb527ce0cfc9	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559c-e57c-b9bc-21352e2ba7eb	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9350950)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9350940)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9351124)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9351074)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9350648)
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
-- TOC entry 2888 (class 0 OID 9351016)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9350686)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559c-e57b-5d9c-a0e8a7d62a81	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559c-e57b-453a-b185acff14e5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559c-e57b-6255-e75d3fc3f3ee	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559c-e57b-b0f2-c52e3bd72606	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559c-e57b-9117-4054f73af63d	planer	Planer dogodkov v koledarju	t
00020000-559c-e57b-1023-864cc7338eb8	kadrovska	Kadrovska služba	t
00020000-559c-e57b-c474-f89feee6a686	arhivar	Ažuriranje arhivalij	t
00020000-559c-e57b-af8f-25cc03e3d334	igralec	Igralec	t
00020000-559c-e57b-31f3-c7294c3e82c3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559c-e57c-003e-dce05ca5a16c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9350670)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559c-e57b-6c15-006ffdb9b66d	00020000-559c-e57b-6255-e75d3fc3f3ee
00010000-559c-e57b-23b8-01abee83f75d	00020000-559c-e57b-6255-e75d3fc3f3ee
00010000-559c-e57d-c09b-cca960e8f719	00020000-559c-e57c-003e-dce05ca5a16c
\.


--
-- TOC entry 2890 (class 0 OID 9351030)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9350971)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9350921)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9351334)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559c-e57c-e464-cb0b512c419a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559c-e57c-37a1-3bf2b1d48871	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559c-e57c-efaa-e277ab3a5e50	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559c-e57c-4729-f6a556cd218c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559c-e57c-8dfb-e58128118104	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9351326)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559c-e57c-73d9-0ea12254b85a	00230000-559c-e57c-4729-f6a556cd218c	popa
00240000-559c-e57c-444c-cf7de196b94c	00230000-559c-e57c-4729-f6a556cd218c	oseba
00240000-559c-e57c-8f88-925f1792ebe8	00230000-559c-e57c-37a1-3bf2b1d48871	prostor
00240000-559c-e57c-26df-f7cafbcf96cc	00230000-559c-e57c-4729-f6a556cd218c	besedilo
00240000-559c-e57c-0ad0-7ecf517439a7	00230000-559c-e57c-4729-f6a556cd218c	uprizoritev
00240000-559c-e57c-5544-1462f961cbd6	00230000-559c-e57c-4729-f6a556cd218c	funkcija
00240000-559c-e57c-4959-cfab67da69fc	00230000-559c-e57c-4729-f6a556cd218c	tipfunkcije
00240000-559c-e57c-c525-f7d439583422	00230000-559c-e57c-4729-f6a556cd218c	alternacija
00240000-559c-e57c-9ea5-dab8e025a552	00230000-559c-e57c-e464-cb0b512c419a	pogodba
00240000-559c-e57c-4cff-c172ebfe446b	00230000-559c-e57c-4729-f6a556cd218c	zaposlitev
00240000-559c-e57c-1c96-fe8dd7099d19	00230000-559c-e57c-e464-cb0b512c419a	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9351321)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9351084)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559c-e57d-acd2-d4fee4af0ff9	000e0000-559c-e57d-935b-3acf677a39c7	00080000-559c-e57c-a83b-6f7e4d716898	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559c-e57d-a356-c5cd763ef539	000e0000-559c-e57d-935b-3acf677a39c7	00080000-559c-e57c-a83b-6f7e4d716898	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559c-e57d-151d-590f5768bba4	000e0000-559c-e57d-935b-3acf677a39c7	00080000-559c-e57c-a53c-e9445779c122	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9350748)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9350927)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559c-e57d-a134-2f772a8be862	00180000-559c-e57d-dfd3-8f692fd6e463	000c0000-559c-e57d-ad67-e82726c4f1d7	00090000-559c-e57d-eb2c-9b09fd308491	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559c-e57d-cb7c-9c5b5d26f5aa	00180000-559c-e57d-dfd3-8f692fd6e463	000c0000-559c-e57d-3312-be174b3a53c8	00090000-559c-e57d-2ee3-25b62e85c326	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559c-e57d-0753-f9703ec66518	00180000-559c-e57d-dfd3-8f692fd6e463	000c0000-559c-e57d-884a-30f713b43192	00090000-559c-e57d-676e-890f2365549d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559c-e57d-50f0-39daf7f43b00	00180000-559c-e57d-dfd3-8f692fd6e463	000c0000-559c-e57d-25c9-9cf3e38e7c9b	00090000-559c-e57d-e18d-503e12c46ac2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559c-e57d-153a-579820ccce6e	00180000-559c-e57d-dfd3-8f692fd6e463	000c0000-559c-e57d-aa2a-c5722df5bbea	00090000-559c-e57d-c99c-7f7770e753f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559c-e57d-8cb7-41580fbffa93	00180000-559c-e57d-b3ad-650b6b52377c	\N	00090000-559c-e57d-c99c-7f7770e753f8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9351113)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559c-e57c-1372-844cf9031bee	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559c-e57c-82e1-71d735b050b1	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559c-e57c-41f2-1592f79daaed	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559c-e57c-ea98-bd99f54c5baa	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559c-e57c-ce1e-a410b1defb39	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559c-e57c-a6af-6a9ff3046575	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559c-e57c-7ee4-50c210154942	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559c-e57c-f9f3-6fc41984d672	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559c-e57c-fc1e-1ef0fdcd6e76	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559c-e57c-5b34-a3c72b1863de	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559c-e57c-06de-192f0f1f1e21	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559c-e57c-9b62-78008b200c96	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559c-e57c-6384-810bbedd0dc2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559c-e57c-6ed5-b868c19ca98f	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559c-e57c-8dbb-0b4049bfd14b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559c-e57c-0891-b4a6c3cc1328	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9351303)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559c-e57c-84a7-8af02e3e71b3	01	Velika predstava	f	1.00	1.00
002b0000-559c-e57c-a7d8-b5cefafbd19e	02	Mala predstava	f	0.50	0.50
002b0000-559c-e57c-cb59-8b2033008435	03	Mala koprodukcija	t	0.40	1.00
002b0000-559c-e57c-925e-037c8414f328	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559c-e57c-48d0-ff49ddc48429	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9350811)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9350657)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559c-e57b-23b8-01abee83f75d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYPoLt4gnIiOY8Fi7b6SPR69I6Chh.li	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559c-e57d-85f2-9665fb4498b7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559c-e57d-1972-a2fc738ee0df	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559c-e57d-f66f-f2e18db47e45	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559c-e57d-eb72-08571cd93e9d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559c-e57d-6154-f25ca1003f97	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559c-e57d-3fb1-a5bac80a2ca7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559c-e57d-bc6c-68d4fcb1e98a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559c-e57d-6884-2c87e76eefe1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559c-e57d-8d66-e199413afdb9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559c-e57d-c09b-cca960e8f719	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559c-e57b-6c15-006ffdb9b66d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9351162)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559c-e57d-2704-d594cae5dc19	00160000-559c-e57c-f520-c30cd9d0c886	00150000-559c-e57c-ad1f-e5b447fbe723	00140000-559c-e57b-494d-46bf76c7dfbb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559c-e57c-c29d-25e663da981c
000e0000-559c-e57d-935b-3acf677a39c7	00160000-559c-e57c-eaa6-dbe710b7e109	00150000-559c-e57c-b938-f7f0f19a54e3	00140000-559c-e57b-215d-289658ff2980	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559c-e57c-3002-cb527ce0cfc9
000e0000-559c-e57d-5301-6c04e90a654c	\N	00150000-559c-e57c-b938-f7f0f19a54e3	00140000-559c-e57b-215d-289658ff2980	00190000-559c-e57d-578c-9214c20ccd9f	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559c-e57c-c29d-25e663da981c
000e0000-559c-e57d-778e-b261938808de	\N	00150000-559c-e57c-b938-f7f0f19a54e3	00140000-559c-e57b-215d-289658ff2980	00190000-559c-e57d-578c-9214c20ccd9f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559c-e57c-c29d-25e663da981c
000e0000-559c-e57d-0d0d-a5a70a8e3ceb	\N	00150000-559c-e57c-b938-f7f0f19a54e3	00140000-559c-e57b-215d-289658ff2980	00190000-559c-e57d-578c-9214c20ccd9f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559c-e57c-a027-38553194ba1e
\.


--
-- TOC entry 2871 (class 0 OID 9350873)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559c-e57d-a76c-347d9d9dcd8b	000e0000-559c-e57d-935b-3acf677a39c7	1	
00200000-559c-e57d-f5ee-bf65134e8902	000e0000-559c-e57d-935b-3acf677a39c7	2	
\.


--
-- TOC entry 2886 (class 0 OID 9350998)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9351067)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9350905)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9351152)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559c-e57b-494d-46bf76c7dfbb	01	Drama	drama (SURS 01)
00140000-559c-e57b-1884-07cb35aba8e3	02	Opera	opera (SURS 02)
00140000-559c-e57b-62df-b2be496efdf0	03	Balet	balet (SURS 03)
00140000-559c-e57b-6e63-6ce9cfe607f7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559c-e57b-91c1-3cbfba5fdb59	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559c-e57b-215d-289658ff2980	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559c-e57b-d20e-b21bdfd54397	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9351057)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559c-e57c-5ff4-9e301059269c	01	Opera	opera
00150000-559c-e57c-69b4-7cde8c4e7551	02	Opereta	opereta
00150000-559c-e57c-abbd-f10a8aca6a50	03	Balet	balet
00150000-559c-e57c-d131-6d87f8cdbbb6	04	Plesne prireditve	plesne prireditve
00150000-559c-e57c-9756-7774bc8a2175	05	Lutkovno gledališče	lutkovno gledališče
00150000-559c-e57c-2377-17e1e85b3903	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559c-e57c-8ac6-ab1451d01ac3	07	Biografska drama	biografska drama
00150000-559c-e57c-ad1f-e5b447fbe723	08	Komedija	komedija
00150000-559c-e57c-d4fa-a9548dc52da1	09	Črna komedija	črna komedija
00150000-559c-e57c-021e-1f83a96a2d1e	10	E-igra	E-igra
00150000-559c-e57c-b938-f7f0f19a54e3	11	Kriminalka	kriminalka
00150000-559c-e57c-e2e3-a7a7bad633db	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9350711)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9351209)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9351199)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9351112)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9350895)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9350920)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9351319)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9350837)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9351260)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9351053)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9350871)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9350914)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9350851)
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
-- TOC entry 2537 (class 2606 OID 9350963)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9350990)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9350809)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9350720)
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
-- TOC entry 2452 (class 2606 OID 9350744)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9350700)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9350685)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9350996)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9351029)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9351147)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9350773)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9350797)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9350969)
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
-- TOC entry 2467 (class 2606 OID 9350787)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9350858)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9350981)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9351292)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9351300)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9351282)
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
-- TOC entry 2557 (class 2606 OID 9351013)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9350954)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9350945)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9351134)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9351081)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9350656)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9351020)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9350674)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9350694)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9351038)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9350976)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9350926)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9351343)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9351331)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9351325)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9351094)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9350753)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9350936)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9351123)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9351313)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9350822)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9350669)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9351178)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9350880)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9351004)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9351072)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9350909)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9351160)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9351065)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9350902)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9351095)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9351096)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9350775)
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
-- TOC entry 2550 (class 1259 OID 9350997)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9350983)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9350982)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9350881)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9351054)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9351056)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9351055)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9350853)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9350852)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9351149)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9351150)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9351151)
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
-- TOC entry 2604 (class 1259 OID 9351183)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9351180)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9351184)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9351182)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9351181)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9350824)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9350823)
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
-- TOC entry 2450 (class 1259 OID 9350747)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9351021)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9350915)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9350701)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9350702)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9351041)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9351040)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9351039)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9350859)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9350861)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9350860)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9351333)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9350949)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9350947)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9350946)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9350948)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9350675)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9350676)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9351005)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9350970)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9351082)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9351083)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9351264)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9351261)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9351262)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9351263)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9350789)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9350788)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9350790)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9351293)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9351294)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9351213)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9351214)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2620 (class 1259 OID 9351211)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 9351212)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9351073)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9350958)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9350957)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9350955)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9350956)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9351201)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9351200)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9351283)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9350872)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9351320)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9350722)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9350721)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9350754)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9350755)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9350939)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9350938)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9350937)
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
-- TOC entry 2502 (class 1259 OID 9350904)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9350900)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9350897)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9350898)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9350896)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9350901)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9350899)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9350774)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9350838)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9350840)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9350839)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9350841)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9350964)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9351148)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9351179)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9350745)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9350746)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9351066)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9351344)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9350810)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9351332)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9351015)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9351014)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9351210)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9350798)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9351161)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9351301)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9351302)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9350695)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9350903)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9351480)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9351465)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9351470)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9351490)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9351460)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9351485)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9351475)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9351635)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9351640)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9351395)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9351575)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9351570)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9351565)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9351455)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9351605)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9351615)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9351610)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9351430)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9351425)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9351555)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9351645)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9351650)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9351655)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9351675)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9351660)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9351680)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9351670)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9351665)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9351420)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9351415)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9351380)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9351375)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9351585)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9351495)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9351355)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9351360)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9351600)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9351595)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9351590)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9351435)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9351445)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9351440)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9351760)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9351530)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9351520)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9351515)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9351525)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9351345)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9351350)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9351580)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9351560)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9351625)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9351630)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9351730)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9351715)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9351720)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9351725)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9351405)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9351400)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9351410)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9351740)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9351745)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9351705)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9351710)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9351695)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9351700)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9351620)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9351550)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9351545)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9351535)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9351540)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9351690)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9351685)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9351735)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9351450)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9351750)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9351755)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9351370)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9351365)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9351385)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9351390)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9351510)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9351505)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9351500)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-08 10:55:26 CEST

--
-- PostgreSQL database dump complete
--

