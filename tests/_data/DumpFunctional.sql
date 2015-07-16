--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-16 13:37:15 CEST

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
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10423703)
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
-- TOC entry 228 (class 1259 OID 10424202)
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
-- TOC entry 227 (class 1259 OID 10424185)
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
-- TOC entry 221 (class 1259 OID 10424097)
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
-- TOC entry 197 (class 1259 OID 10423882)
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
-- TOC entry 200 (class 1259 OID 10423916)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 10424313)
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
-- TOC entry 192 (class 1259 OID 10423825)
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
-- TOC entry 229 (class 1259 OID 10424215)
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
    naslovpe character varying(255) DEFAULT NULL::character varying,
    avtorpe character varying(255) DEFAULT NULL::character varying,
    obsegpe character varying(255) DEFAULT NULL::character varying,
    mesecpe character varying(255) DEFAULT NULL::character varying,
    vrednostpe numeric(15,2) DEFAULT 0::numeric,
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
-- TOC entry 216 (class 1259 OID 10424042)
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
-- TOC entry 195 (class 1259 OID 10423862)
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
-- TOC entry 199 (class 1259 OID 10423910)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10423842)
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
-- TOC entry 205 (class 1259 OID 10423959)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10423984)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10423799)
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
-- TOC entry 184 (class 1259 OID 10423712)
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
-- TOC entry 185 (class 1259 OID 10423723)
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
-- TOC entry 180 (class 1259 OID 10423677)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10423696)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10423991)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10424022)
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
-- TOC entry 224 (class 1259 OID 10424136)
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
-- TOC entry 187 (class 1259 OID 10423756)
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
-- TOC entry 189 (class 1259 OID 10423791)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10423965)
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
-- TOC entry 188 (class 1259 OID 10423776)
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
-- TOC entry 194 (class 1259 OID 10423854)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10423977)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10424283)
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
-- TOC entry 232 (class 1259 OID 10424294)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10424264)
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
-- TOC entry 212 (class 1259 OID 10424006)
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
-- TOC entry 204 (class 1259 OID 10423950)
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
-- TOC entry 203 (class 1259 OID 10423940)
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
-- TOC entry 223 (class 1259 OID 10424125)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10424074)
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
-- TOC entry 177 (class 1259 OID 10423648)
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
-- TOC entry 176 (class 1259 OID 10423646)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10424016)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10423686)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10423670)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10424030)
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
-- TOC entry 207 (class 1259 OID 10423971)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10423921)
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
-- TOC entry 237 (class 1259 OID 10424333)
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
-- TOC entry 236 (class 1259 OID 10424325)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 10424320)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10424084)
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
-- TOC entry 186 (class 1259 OID 10423748)
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
-- TOC entry 202 (class 1259 OID 10423927)
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
-- TOC entry 222 (class 1259 OID 10424114)
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
-- TOC entry 233 (class 1259 OID 10424302)
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
-- TOC entry 191 (class 1259 OID 10423811)
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
-- TOC entry 178 (class 1259 OID 10423657)
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
-- TOC entry 226 (class 1259 OID 10424162)
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
-- TOC entry 196 (class 1259 OID 10423873)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10423998)
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
-- TOC entry 218 (class 1259 OID 10424067)
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
-- TOC entry 198 (class 1259 OID 10423905)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10424152)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10424057)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 10423651)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2857 (class 0 OID 10423703)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 10424202)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a7-976a-ee65-0262844ede07	000d0000-55a7-976a-fda8-5430101d74f3	\N	00090000-55a7-976a-92ed-8ff146c87ba1	000b0000-55a7-976a-354e-8e48502e22c7	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a7-976a-f30a-9ce52a249f7a	000d0000-55a7-976a-c7ea-df96cbcc02ac	00100000-55a7-976a-4736-79f8535f55b3	00090000-55a7-976a-cd27-33cc03ce09d4	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a7-976a-9a96-1e7bf294244a	000d0000-55a7-976a-ce00-d183a383411f	00100000-55a7-976a-5a68-2f70306727d5	00090000-55a7-976a-173b-79f5ef277e5e	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a7-976a-e1d1-5291ec349309	000d0000-55a7-976a-9d6b-239ed77b80a1	\N	00090000-55a7-976a-d6cd-c55d1ea6e65f	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a7-976a-52b8-326fc5b7d0f4	000d0000-55a7-976a-e153-ab5686363040	\N	00090000-55a7-976a-367b-98bfee8ec103	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a7-976a-c60a-91585fae2f40	000d0000-55a7-976a-0d57-4dfd42ac6948	\N	00090000-55a7-976a-6067-486f2bd9a28e	000b0000-55a7-976a-30e0-40c00eb900e2	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a7-976a-0641-0f3a84d4b6bb	000d0000-55a7-976a-5a32-8d6f9eabf1e8	00100000-55a7-976a-99ae-cedc8c8d16c0	00090000-55a7-976a-a5d6-1ad89464a4a2	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a7-976a-ca8c-9f2d674fbaa6	000d0000-55a7-976a-5445-446e7916d4fc	\N	00090000-55a7-976a-2ae6-89c2ae27b3aa	000b0000-55a7-976a-5440-58d5f6ae6d2c	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2901 (class 0 OID 10424185)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 10424097)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a7-976a-82b2-23bb230ec022	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a7-976a-fb3b-6559045af06a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a7-976a-0a97-76981018ae80	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2871 (class 0 OID 10423882)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a7-976a-0ef5-c0f929ea18ef	\N	\N	00200000-55a7-976a-68ed-d0d9fafbd33e	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a7-976a-384d-54df5645c9cb	\N	\N	00200000-55a7-976a-6056-877e4ed3a0d7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a7-976a-0c99-72522ea80e66	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a7-976a-27d5-3afbfc47b59e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a7-976a-cea8-1b889c12f9ac	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2874 (class 0 OID 10423916)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 10424313)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 10423825)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a7-9768-fb80-6862976f313c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a7-9768-cc85-db34bb543b37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a7-9768-1c97-5c28c773d73e	AL	ALB	008	Albania 	Albanija	\N
00040000-55a7-9768-f54f-d1509c25bbce	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a7-9768-9ede-c8c866f551ae	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a7-9768-93bb-0e41f2f6740c	AD	AND	020	Andorra 	Andora	\N
00040000-55a7-9768-a059-ff0b1f3f1301	AO	AGO	024	Angola 	Angola	\N
00040000-55a7-9768-d015-aeb751d8ed44	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a7-9768-dbf8-9a5e3fac9abe	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a7-9768-3745-994cf91a6791	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a7-9768-9e6d-0f042b784bf8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a7-9768-eaca-5f930674e21b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a7-9768-a62e-40300ebbb6ed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a7-9768-62ad-7d2d8fce8837	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a7-9768-8e20-249d8ede0e01	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a7-9768-992d-120b01c7af90	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a7-9768-64ef-31085f938309	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a7-9768-a003-c04ba7956902	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a7-9768-2aea-78666a6223d6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a7-9768-e65c-f9255ccfec92	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a7-9768-1100-3f49298f62de	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a7-9768-bb0e-3b1d5438438e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a7-9768-739a-4042902a0bb5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a7-9768-c1b1-bcea22c5db2d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a7-9768-bc75-1f856d40ed8e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a7-9768-a8e9-f78f5bed549e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a7-9768-7332-ad9e792069e2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a7-9768-805f-1e75c63dca67	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a7-9768-8745-3124c2e4869f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a7-9768-a0d8-f2ce27c1e03a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a7-9768-a4a6-11d39dae66c8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a7-9768-d305-ba6e9a7e23d0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a7-9768-5b96-a90fbc1c1f80	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a7-9768-29b6-28b4fc2e172b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a7-9768-b2d8-672dc4bbec02	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a7-9768-371d-8164d34d19d1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a7-9768-e77c-60c78c7bc3c1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a7-9768-55fb-75d5110fa0de	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a7-9768-c37d-63c701087553	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a7-9768-13a1-861a0e91c4e2	CA	CAN	124	Canada 	Kanada	\N
00040000-55a7-9768-cda5-82ce9c37eacb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a7-9768-ed39-a7af4b9c799e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a7-9768-4147-daa27841a315	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a7-9768-5899-944c7e665d20	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a7-9768-e366-809379e4ff9f	CL	CHL	152	Chile 	Čile	\N
00040000-55a7-9768-d31d-585fca4fceed	CN	CHN	156	China 	Kitajska	\N
00040000-55a7-9768-7ecc-b1f7582cf17b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a7-9768-b07d-bb089021a4be	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a7-9768-63dd-f0a5395497bd	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a7-9768-d32b-5d60c3d0c6f1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a7-9768-f11e-3cf2cf3d9eb8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a7-9768-28a9-e7a582dc5aaa	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a7-9768-4c42-27338b7c4e35	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a7-9768-f2e9-8e1afc58dd3a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a7-9768-e2fc-8532f163f608	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a7-9768-a5a9-41a291ba48a6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a7-9768-c5e6-bb37f627454e	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a7-9768-2ce7-1c19f8861872	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a7-9768-3c25-0ebfbb86e6b6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a7-9768-a3ac-50842077e38f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a7-9768-91c6-3621c8622c75	DK	DNK	208	Denmark 	Danska	\N
00040000-55a7-9768-4461-bd16315ec876	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a7-9768-1db3-eeca0bd4032d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a7-9768-7238-ee400bdf4e44	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a7-9768-77cc-923d6c540bba	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a7-9768-5b39-4628b05f0982	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a7-9768-3982-f65c841da956	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a7-9768-0649-2946f17fe75d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a7-9768-87c5-4a55c4cb85b3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a7-9768-267e-82fe7c8ee7a3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a7-9768-d371-f8b53e913e1c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a7-9768-4bc0-8f84403c75ff	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a7-9768-2c99-b5b1c4eea5d4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a7-9768-42d5-15cf2842bd10	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a7-9768-9b31-7814ce2df86a	FI	FIN	246	Finland 	Finska	\N
00040000-55a7-9768-1c0f-c3808d394006	FR	FRA	250	France 	Francija	\N
00040000-55a7-9768-fb92-76c6521d58ba	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a7-9768-be89-33646b530070	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a7-9768-6646-c12d9d1bc61c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a7-9768-e0cb-7d4c61c9ce7d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a7-9768-4ab3-158b11752eb9	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a7-9768-e11c-02eea92a94f4	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a7-9768-f8b7-85b24384e5f6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a7-9768-6410-3e9a92eccdcf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a7-9768-eb95-845c4c30cbed	GH	GHA	288	Ghana 	Gana	\N
00040000-55a7-9768-0186-74602a61fc12	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a7-9768-f555-098a66663741	GR	GRC	300	Greece 	Grčija	\N
00040000-55a7-9768-d180-a524075a3ba6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a7-9768-096d-b52e10e21060	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a7-9768-43c8-7dd171e698ba	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a7-9768-7805-6e9d3618a015	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a7-9768-297a-864b4b25a529	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a7-9768-08ca-fd428782c371	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a7-9768-01a8-83e38c463bb9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a7-9768-d5ff-1a71feaf29cf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a7-9768-6253-82efe582f394	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a7-9768-c796-125fd657c081	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a7-9768-e998-dd4517f6c022	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a7-9768-2c84-0b40720da0f9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a7-9768-1b8a-e380e5a7ad35	HN	HND	340	Honduras 	Honduras	\N
00040000-55a7-9768-e184-6b38dcb8f26a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a7-9768-544f-54767269f2ae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a7-9768-8c79-518e8373d0e7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a7-9768-f87b-e926ae692127	IN	IND	356	India 	Indija	\N
00040000-55a7-9768-1d9c-36b7053bc618	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a7-9768-62a0-23124d9fb7cb	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a7-9768-5b2b-846db4f594b9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a7-9768-0634-18339d8c1ba9	IE	IRL	372	Ireland 	Irska	\N
00040000-55a7-9768-dc23-cc01559de5ee	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a7-9768-4040-19a5a333b8c7	IL	ISR	376	Israel 	Izrael	\N
00040000-55a7-9768-4e55-8e455aea690e	IT	ITA	380	Italy 	Italija	\N
00040000-55a7-9768-19c4-94c8770ee3cb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a7-9768-8953-1c9fe947195e	JP	JPN	392	Japan 	Japonska	\N
00040000-55a7-9768-632e-ef4d48e1081a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a7-9768-0695-00619f053c92	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a7-9768-a601-d72284669240	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a7-9768-b5ec-2b41d00148e6	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a7-9768-f48e-e2e9fb19027a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a7-9768-e481-5e328b04f841	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a7-9768-8c37-a036125c59cc	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a7-9768-1bb3-5f76aa9bdfbb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a7-9768-b3e0-9c11749ba55d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a7-9768-2d4b-aed84012b82d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a7-9768-d787-a833347a3e86	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a7-9768-51c0-015076026b2b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a7-9768-13d2-3b9496c682d2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a7-9768-d466-e51181bd56bd	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a7-9768-4a13-907b063cbde8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a7-9768-5926-23d746cc6f88	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a7-9768-7ca1-6f3a74cdc13b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a7-9768-f0d8-4763fd41455c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a7-9768-fdeb-20845164bd0f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a7-9768-59db-8598199c4fdf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a7-9768-0daa-5f19cd8abd65	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a7-9768-b92e-4ce3314e8bb9	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a7-9768-27a7-81763420afa2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a7-9768-0eb1-d6477b74f846	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a7-9768-ca67-902bb6a0f2f7	ML	MLI	466	Mali 	Mali	\N
00040000-55a7-9768-a154-c9e2113afac0	MT	MLT	470	Malta 	Malta	\N
00040000-55a7-9768-daed-ce1edf0eb5ec	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a7-9768-6c51-daffb13efb87	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a7-9768-8104-1c1037c975fe	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a7-9768-5b1f-fc4d20d920c4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a7-9768-e6e5-988949ef4f16	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a7-9768-0c3a-d1531e5c33e3	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a7-9768-3ecb-7847a63c54c3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a7-9768-a882-40330fcf468c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a7-9768-f2be-64be025518ee	MC	MCO	492	Monaco 	Monako	\N
00040000-55a7-9768-3ce8-303501f50942	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a7-9768-e299-ecd32b3f6371	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a7-9768-d755-88115ae595db	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a7-9768-1063-d1fcd594ebf8	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a7-9768-60da-35d63325d01b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a7-9768-d4c8-a227120f0f0b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a7-9768-8bd4-c9bf07f01ef0	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a7-9768-e3ff-6382ae87bd61	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a7-9768-376d-ecb3beb986d1	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a7-9768-7b3e-e75cf1d30bf1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a7-9768-929d-706459fd831f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a7-9768-a319-0cedd6c21f9b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a7-9768-c9bc-3d71dab78c80	NE	NER	562	Niger 	Niger 	\N
00040000-55a7-9768-2f93-c988a622dafc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a7-9768-d998-6e696a4bc401	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a7-9768-c502-c1eccdb54ef3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a7-9768-55f0-41362fcaae75	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a7-9768-71e3-838d24d8dd17	NO	NOR	578	Norway 	Norveška	\N
00040000-55a7-9768-4e88-9b94f69c5a69	OM	OMN	512	Oman 	Oman	\N
00040000-55a7-9768-0ef0-cec9ef1abb24	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a7-9768-0dae-e9d02e80cd5c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a7-9768-31c0-001b2b102725	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a7-9768-37b1-7910fe23ddcf	PA	PAN	591	Panama 	Panama	\N
00040000-55a7-9768-1fe0-6b045ded53cf	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a7-9768-2b10-796d58749e00	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a7-9768-04d7-0ab6c37e9c04	PE	PER	604	Peru 	Peru	\N
00040000-55a7-9768-e616-8cd5ddbddea8	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a7-9768-fcbe-299b9672a53c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a7-9768-7429-e538798a4bf1	PL	POL	616	Poland 	Poljska	\N
00040000-55a7-9768-38bf-61fe73a709c4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a7-9768-acd2-7037ffedb4c9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a7-9768-0aca-e564d2312e10	QA	QAT	634	Qatar 	Katar	\N
00040000-55a7-9768-747b-fc68224e8042	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a7-9768-4914-fa3cb4258168	RO	ROU	642	Romania 	Romunija	\N
00040000-55a7-9768-ae64-cc0afb9f7a48	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a7-9768-a179-dfde4200319c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a7-9768-3b1d-1f23df81bcfd	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a7-9768-9979-93ef0f354846	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a7-9768-79d7-d90283a49632	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a7-9768-b51a-937875919298	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a7-9768-36cd-f46408bbcb42	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a7-9768-40bf-1814afa8eeda	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a7-9768-9bb4-9d44638c2108	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a7-9768-b9c1-4f6825776458	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a7-9768-2790-d4516af9f7fa	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a7-9768-1f65-29d7054f5f59	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a7-9768-87bb-9d3e967b9de4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a7-9768-88fe-61755e03d27f	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a7-9768-384f-e761bc8777df	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a7-9768-0bdb-2bbb34ff4940	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a7-9768-fbd8-a8ea08bc5016	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a7-9768-d302-4e7b91557f33	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a7-9768-fb4e-6ba5d75f0041	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a7-9768-d7ed-801e3b526ba9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a7-9768-a3f5-ba1d7907022e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a7-9768-d550-b1bdb308b3ab	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a7-9768-1166-516255ccbe1f	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a7-9768-958e-cca69bc1b1bb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a7-9768-e07d-f322afd8bc0e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a7-9768-14b6-0a6c66e5f22b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a7-9768-634d-e9c31d4b5824	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a7-9768-3e77-74d6edb6860e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a7-9768-61a9-788ab584a7d7	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a7-9768-1fb3-52c0a52a6a1c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a7-9768-cf3c-5b2c0548afc8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a7-9768-e36d-29ae1a1756ad	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a7-9768-0a8d-cc3cf80d814c	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a7-9768-11a9-3749f2038b23	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a7-9768-765f-282fc3214fc2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a7-9768-61c5-e4ed45d55393	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a7-9768-aabf-0768274bab57	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a7-9768-adb6-fdc02902a4c0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a7-9768-0367-831f18178499	TH	THA	764	Thailand 	Tajska	\N
00040000-55a7-9768-22ac-482096056e84	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a7-9768-84ee-7fb5101fcb56	TG	TGO	768	Togo 	Togo	\N
00040000-55a7-9768-5f98-ec4d3bc93a99	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a7-9768-9330-30b42206f7e4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a7-9768-00d2-015bcc0b8157	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a7-9768-73d7-f0b986a1d59d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a7-9768-a020-83fde8da5e5e	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a7-9768-ea27-990f7519679c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a7-9768-4232-a2237dc906a4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a7-9768-e2d9-52dc81ea0d96	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a7-9768-ff6d-7c67ec985380	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a7-9768-be63-c069cd86d84b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a7-9768-a1af-d98eddc6e99c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a7-9768-b1b0-2f01e7ff9125	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a7-9768-77d9-e8aaad6c05b0	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a7-9768-b795-015930006f58	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a7-9768-e0a7-9b78351629e7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a7-9768-b5b8-bf80826e939e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a7-9768-2b08-f34ade68ab24	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a7-9768-102b-76632ac0f73e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a7-9768-b68b-a76b65103839	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a7-9768-b30f-7c3c12fddfbd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a7-9768-bb7c-93172a703aed	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a7-9768-0ad6-7b972a544c82	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a7-9768-db96-eb27b168f440	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a7-9768-1a1e-beab960fd42f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a7-9768-2487-4f7891593ba4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a7-9768-f09a-9786f33dc1b6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2903 (class 0 OID 10424215)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a7-976a-22df-9f0f18fa74ad	000e0000-55a7-976a-4c48-fa037d478287	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a7-9769-4831-a39d9014e088	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a7-976a-c933-ff50ab4e0617	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a7-9769-a8d6-6ccc01f41474	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2890 (class 0 OID 10424042)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a7-976a-5a32-8d6f9eabf1e8	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a7-9769-b368-7072a672258c
000d0000-55a7-976a-fda8-5430101d74f3	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a7-9769-b368-7072a672258c
000d0000-55a7-976a-c7ea-df96cbcc02ac	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a7-9769-8e07-0570a3186471
000d0000-55a7-976a-ce00-d183a383411f	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a7-9769-e8e3-1fb56df4c9bc
000d0000-55a7-976a-9d6b-239ed77b80a1	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a7-9769-e8e3-1fb56df4c9bc
000d0000-55a7-976a-e153-ab5686363040	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a7-9769-e8e3-1fb56df4c9bc
000d0000-55a7-976a-0d57-4dfd42ac6948	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a7-9769-b368-7072a672258c
000d0000-55a7-976a-5445-446e7916d4fc	000e0000-55a7-976a-e15d-258c4cc62b8c	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a7-9769-fd54-d1ba1cf367df
\.


--
-- TOC entry 2869 (class 0 OID 10423862)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 10423910)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 10423842)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a7-976a-4ff2-dd84e6d75832	00080000-55a7-976a-b0fa-14ae7e6e609f	00090000-55a7-976a-635d-bc6ee9044c4c	AK		
\.


--
-- TOC entry 2844 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 10423959)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10423984)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 10423799)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a7-9769-a9a8-49699c8c5262	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a7-9769-9dec-1af40c8baa3f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a7-9769-bf44-9694c23f1826	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a7-9769-f78f-1c1d39c274b1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a7-9769-12b3-b3791a7d7bc1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a7-9769-be84-4fd9e78b1059	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a7-9769-486b-868c3c2c535b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a7-9769-f370-1b807b93f03e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a7-9769-4869-193b7d5588ab	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a7-9769-3555-3d0f265a8ada	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a7-9769-4abc-cc6d2f182870	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a7-9769-2fdf-63ce74085564	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a7-9769-af70-ef50237e4228	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a7-976a-169e-b0adced51510	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a7-976a-3d91-ae76157d47e8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a7-976a-b471-5c97275c4bc4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a7-976a-af3c-335e078d1827	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a7-976a-e410-d81820aadfa1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a7-976a-dc77-e2b5f649116d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2858 (class 0 OID 10423712)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a7-976a-fffb-e4c91dd1b960	00000000-55a7-976a-3d91-ae76157d47e8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a7-976a-83b9-5854ac4a4825	00000000-55a7-976a-3d91-ae76157d47e8	00010000-55a7-9769-3dd3-3a81262abef5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a7-976a-1037-0051a7b73917	00000000-55a7-976a-b471-5c97275c4bc4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2859 (class 0 OID 10423723)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a7-976a-92ed-8ff146c87ba1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a7-976a-d6cd-c55d1ea6e65f	00010000-55a7-976a-b8be-2814af6b400b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a7-976a-173b-79f5ef277e5e	00010000-55a7-976a-06f6-000fba66fa42	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a7-976a-06e1-0205f6e0e9f1	00010000-55a7-976a-fb4d-ac030caace0a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a7-976a-e374-b6dca3c1c288	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a7-976a-6067-486f2bd9a28e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a7-976a-80c2-7ca13f98cc39	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a7-976a-a5d6-1ad89464a4a2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a7-976a-635d-bc6ee9044c4c	00010000-55a7-976a-c86c-e5c2ea6f267e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a7-976a-cd27-33cc03ce09d4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a7-976a-e300-8e6bcfce3a17	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a7-976a-367b-98bfee8ec103	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a7-976a-2ae6-89c2ae27b3aa	00010000-55a7-976a-9f6c-ce452c3d6294	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2846 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 10423677)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a7-9768-bd06-6eefad07735f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a7-9768-27fd-c9b5cb0d49c5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a7-9768-a9be-e8e9d9cd3f26	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a7-9768-9b71-fd969beab438	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a7-9768-45e1-a11352f1077f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a7-9768-b2e1-bb350ca242b6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a7-9768-1a56-5e88679e8b54	Abonma-read	Abonma - branje	f
00030000-55a7-9768-7f09-a762210289ff	Abonma-write	Abonma - spreminjanje	f
00030000-55a7-9768-e7f9-31b49bf8f47a	Alternacija-read	Alternacija - branje	f
00030000-55a7-9768-ecf1-bd927338fad9	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a7-9768-6c81-79930b655d28	Arhivalija-read	Arhivalija - branje	f
00030000-55a7-9768-dee0-ac9e97766034	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a7-9768-d033-f95b3761cee5	Besedilo-read	Besedilo - branje	f
00030000-55a7-9768-067a-909814ff5596	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a7-9768-f043-94d83b02c9a1	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a7-9768-80a7-b283cfb49e3f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a7-9768-8c2b-d0e585f84527	Dogodek-read	Dogodek - branje	f
00030000-55a7-9768-ca29-a66b3244c58c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a7-9768-3697-07d8efaeb825	DrugiVir-read	DrugiVir - branje	f
00030000-55a7-9768-4cdd-8d32e47351af	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a7-9768-0191-887a9d806356	Drzava-read	Drzava - branje	f
00030000-55a7-9768-533d-0da90791abbe	Drzava-write	Drzava - spreminjanje	f
00030000-55a7-9768-087d-f6ed4d4e1d92	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a7-9768-2e9b-10163b14826e	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a7-9768-d131-24082a1c8d19	Funkcija-read	Funkcija - branje	f
00030000-55a7-9768-dd3e-6f8ee87a8226	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a7-9768-6101-0736a2179996	Gostovanje-read	Gostovanje - branje	f
00030000-55a7-9768-f46d-17479c0a5b46	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a7-9768-129d-34633685100d	Gostujoca-read	Gostujoca - branje	f
00030000-55a7-9768-54ec-0203be0c09ad	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a7-9768-4254-8042ef9d17bd	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a7-9768-91bf-5ac323d02614	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a7-9768-9cd8-1ad09314ddb0	Kupec-read	Kupec - branje	f
00030000-55a7-9768-85b5-a4544f121220	Kupec-write	Kupec - spreminjanje	f
00030000-55a7-9768-3323-43fac49bc0bf	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a7-9768-6fa5-7b5082941740	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a7-9768-ab3d-54a6bcebdb75	Option-read	Option - branje	f
00030000-55a7-9768-bb99-983eb3227c13	Option-write	Option - spreminjanje	f
00030000-55a7-9768-8149-a1c9de5ec91a	OptionValue-read	OptionValue - branje	f
00030000-55a7-9768-873e-5e016678deaa	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a7-9768-0a32-193e6d0b9b2f	Oseba-read	Oseba - branje	f
00030000-55a7-9768-50fe-102eab5734e2	Oseba-write	Oseba - spreminjanje	f
00030000-55a7-9768-264b-9fbb62f29f46	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a7-9768-d037-84e2943cc69f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a7-9768-2330-33aeb06d767e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a7-9768-a67b-e4db322372ed	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a7-9768-2610-14bd46caf5bf	Pogodba-read	Pogodba - branje	f
00030000-55a7-9768-52fc-09848d03e063	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a7-9768-c1b5-b4bbf8b8d7a6	Popa-read	Popa - branje	f
00030000-55a7-9768-2597-17df20b3e910	Popa-write	Popa - spreminjanje	f
00030000-55a7-9768-ff1a-7f574313f13d	Posta-read	Posta - branje	f
00030000-55a7-9768-58c8-b11167a74ebf	Posta-write	Posta - spreminjanje	f
00030000-55a7-9768-6ef9-9741b3577360	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a7-9768-484b-0d941574aa7a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a7-9768-53b6-a5dc85b48e13	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a7-9768-d697-1219bd2f652e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a7-9768-82ed-259a487633c1	Predstava-read	Predstava - branje	f
00030000-55a7-9768-2dae-400149e975f3	Predstava-write	Predstava - spreminjanje	f
00030000-55a7-9768-c835-cc7627c37c0a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a7-9768-e346-ffa7c363b861	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a7-9768-9c2a-f7d9c37a72f5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a7-9768-25eb-e52c71cc2f15	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a7-9768-ce84-0da5986be89c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a7-9768-d7e6-21054df8b427	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a7-9768-9cd8-1806a84c11dc	ProgramDela-read	ProgramDela - branje	f
00030000-55a7-9768-c7f0-58b8621c5fad	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a7-9768-27c4-6522a61d7ff5	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a7-9768-140f-6eb722375ecf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a7-9768-425f-0355f19962fd	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a7-9768-b8bc-b857a44fd3ea	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a7-9768-921f-6bd2353a5c71	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a7-9768-3be0-f6b708ba7491	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a7-9768-5cab-9e06e7eed553	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a7-9768-4b91-9572f0b59730	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a7-9768-d54e-9553045128e8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a7-9768-1ad8-3afe00b721dc	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a7-9768-93cc-120e9c9b0184	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a7-9768-a810-8ca4b52e941f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a7-9768-c8f3-e09e84c36d21	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a7-9768-d650-c22eb03bf97d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a7-9768-4829-664184023322	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a7-9768-af40-9e94b8aa0ead	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a7-9768-dc07-6782430db6fe	Prostor-read	Prostor - branje	f
00030000-55a7-9768-5ec2-66bae80c9386	Prostor-write	Prostor - spreminjanje	f
00030000-55a7-9768-e2fd-1502e75c0d23	Racun-read	Racun - branje	f
00030000-55a7-9768-3466-c84f0df2a8f7	Racun-write	Racun - spreminjanje	f
00030000-55a7-9768-0b01-6aaed3f5408e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a7-9768-7bf2-d8cdc8064e92	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a7-9768-541c-13ee9c58c501	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a7-9768-f92b-f59de717545d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a7-9768-5610-3d66f610d875	Rekvizit-read	Rekvizit - branje	f
00030000-55a7-9768-956f-8174fa08620b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a7-9768-b9a7-fe6ec42664fb	Revizija-read	Revizija - branje	f
00030000-55a7-9768-290c-050f569ca82f	Revizija-write	Revizija - spreminjanje	f
00030000-55a7-9768-2b44-f949cc486ad8	Rezervacija-read	Rezervacija - branje	f
00030000-55a7-9768-2558-81ec9f1aa541	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a7-9768-1fab-fc3f64cca7fb	SedezniRed-read	SedezniRed - branje	f
00030000-55a7-9769-6596-8483a612daa5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a7-9769-5c25-dc92212ea0c7	Sedez-read	Sedez - branje	f
00030000-55a7-9769-8e27-ac9e5ec03ed2	Sedez-write	Sedez - spreminjanje	f
00030000-55a7-9769-43d4-e0a449afa566	Sezona-read	Sezona - branje	f
00030000-55a7-9769-fed6-0a60bab7b7e2	Sezona-write	Sezona - spreminjanje	f
00030000-55a7-9769-0274-598e8f65141c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a7-9769-ce97-e025b7ac5dc4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a7-9769-4923-36a9972e05ad	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a7-9769-3687-0bf92b541323	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a7-9769-8fb0-6b90af8df5cc	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a7-9769-cadf-0c687087eca3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a7-9769-7b55-6aaf1c8e267e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a7-9769-5544-a5277610dbd8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a7-9769-6765-49c6b7bef06d	Telefonska-read	Telefonska - branje	f
00030000-55a7-9769-a518-81672c5b55ea	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a7-9769-f174-4639ecd2a512	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a7-9769-de0f-63f805edb913	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a7-9769-803b-698ab4951219	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a7-9769-a7de-32d8d3116274	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a7-9769-e994-54b0b6f79764	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a7-9769-cd16-25acc1be53b0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a7-9769-b07d-8735b36230bd	Trr-read	Trr - branje	f
00030000-55a7-9769-d6c7-2a02cb03e2f6	Trr-write	Trr - spreminjanje	f
00030000-55a7-9769-524b-4e9b0ad8a384	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a7-9769-2c84-95d83e53e054	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a7-9769-68ee-a6291eb6de89	Vaja-read	Vaja - branje	f
00030000-55a7-9769-8ee9-0de57e82b753	Vaja-write	Vaja - spreminjanje	f
00030000-55a7-9769-489f-6e477d05c3fb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a7-9769-39a8-44301ef9bda1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a7-9769-f0e9-3f284c9f5b66	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a7-9769-27c1-df638b5554d9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a7-9769-f009-2572d7943670	Zasedenost-read	Zasedenost - branje	f
00030000-55a7-9769-1855-92fe3d08413a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a7-9769-9870-f15a4d8ce021	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a7-9769-cf79-c6c362a8cccd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a7-9769-9b50-3e989f744e2b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a7-9769-8329-b80004784781	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2856 (class 0 OID 10423696)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a7-9769-8117-74c1762f36ab	00030000-55a7-9768-27fd-c9b5cb0d49c5
00020000-55a7-9769-1984-7fe96dded7c4	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-7f09-a762210289ff
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-e7f9-31b49bf8f47a
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-ecf1-bd927338fad9
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-9b71-fd969beab438
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-ca29-a66b3244c58c
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-533d-0da90791abbe
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-d131-24082a1c8d19
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-dd3e-6f8ee87a8226
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-f46d-17479c0a5b46
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-129d-34633685100d
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-54ec-0203be0c09ad
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-4254-8042ef9d17bd
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-91bf-5ac323d02614
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-0a32-193e6d0b9b2f
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-50fe-102eab5734e2
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-2597-17df20b3e910
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-58c8-b11167a74ebf
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-53b6-a5dc85b48e13
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-d697-1219bd2f652e
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-2dae-400149e975f3
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-ce84-0da5986be89c
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-d7e6-21054df8b427
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-5ec2-66bae80c9386
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-f92b-f59de717545d
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9768-956f-8174fa08620b
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-fed6-0a60bab7b7e2
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-803b-698ab4951219
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-524b-4e9b0ad8a384
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-2c84-95d83e53e054
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-68ee-a6291eb6de89
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-8ee9-0de57e82b753
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-f009-2572d7943670
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-1855-92fe3d08413a
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-9769-44c0-678dc2d75e1e	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-129d-34633685100d
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-4254-8042ef9d17bd
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-91bf-5ac323d02614
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-0a32-193e6d0b9b2f
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-50fe-102eab5734e2
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-53b6-a5dc85b48e13
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-d697-1219bd2f652e
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-6765-49c6b7bef06d
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-a518-81672c5b55ea
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-b07d-8735b36230bd
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-d6c7-2a02cb03e2f6
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-f0e9-3f284c9f5b66
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-27c1-df638b5554d9
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-9769-0bbd-b78ee49727b6	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-e7f9-31b49bf8f47a
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-dee0-ac9e97766034
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-d033-f95b3761cee5
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-f043-94d83b02c9a1
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-d131-24082a1c8d19
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-129d-34633685100d
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-4254-8042ef9d17bd
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-0a32-193e6d0b9b2f
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-ce84-0da5986be89c
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-803b-698ab4951219
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-68ee-a6291eb6de89
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-f009-2572d7943670
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-9769-b755-2cf0090d963f	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-7f09-a762210289ff
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-ecf1-bd927338fad9
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-129d-34633685100d
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9769-803b-698ab4951219
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-9769-70e6-87bf5bc1bd37	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-129d-34633685100d
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9769-f174-4639ecd2a512
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9768-a9be-e8e9d9cd3f26
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9769-803b-698ab4951219
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-9769-99b7-cb4d8392c1e7	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-bd06-6eefad07735f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-27fd-c9b5cb0d49c5
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-a9be-e8e9d9cd3f26
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-9b71-fd969beab438
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-45e1-a11352f1077f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-b2e1-bb350ca242b6
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-1a56-5e88679e8b54
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-7f09-a762210289ff
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-e7f9-31b49bf8f47a
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-ecf1-bd927338fad9
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-6c81-79930b655d28
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-dee0-ac9e97766034
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d033-f95b3761cee5
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-067a-909814ff5596
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-f043-94d83b02c9a1
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-80a7-b283cfb49e3f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-8c2b-d0e585f84527
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-ca29-a66b3244c58c
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-0191-887a9d806356
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-533d-0da90791abbe
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-3697-07d8efaeb825
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-4cdd-8d32e47351af
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-087d-f6ed4d4e1d92
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2e9b-10163b14826e
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d131-24082a1c8d19
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-dd3e-6f8ee87a8226
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-6101-0736a2179996
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-f46d-17479c0a5b46
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-129d-34633685100d
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-54ec-0203be0c09ad
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-4254-8042ef9d17bd
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-91bf-5ac323d02614
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-9cd8-1ad09314ddb0
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-85b5-a4544f121220
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-3323-43fac49bc0bf
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-6fa5-7b5082941740
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-ab3d-54a6bcebdb75
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-bb99-983eb3227c13
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-8149-a1c9de5ec91a
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-873e-5e016678deaa
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-0a32-193e6d0b9b2f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-50fe-102eab5734e2
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-264b-9fbb62f29f46
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d037-84e2943cc69f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2330-33aeb06d767e
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-a67b-e4db322372ed
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2610-14bd46caf5bf
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-52fc-09848d03e063
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-c1b5-b4bbf8b8d7a6
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2597-17df20b3e910
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-ff1a-7f574313f13d
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-58c8-b11167a74ebf
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-6ef9-9741b3577360
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-484b-0d941574aa7a
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-53b6-a5dc85b48e13
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d697-1219bd2f652e
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-82ed-259a487633c1
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2dae-400149e975f3
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-c835-cc7627c37c0a
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-e346-ffa7c363b861
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-9c2a-f7d9c37a72f5
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-25eb-e52c71cc2f15
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-ce84-0da5986be89c
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d7e6-21054df8b427
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-9cd8-1806a84c11dc
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-c7f0-58b8621c5fad
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-27c4-6522a61d7ff5
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-140f-6eb722375ecf
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-425f-0355f19962fd
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-b8bc-b857a44fd3ea
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-921f-6bd2353a5c71
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-3be0-f6b708ba7491
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-5cab-9e06e7eed553
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-4b91-9572f0b59730
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d54e-9553045128e8
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-1ad8-3afe00b721dc
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-93cc-120e9c9b0184
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-a810-8ca4b52e941f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-c8f3-e09e84c36d21
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-d650-c22eb03bf97d
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-4829-664184023322
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-af40-9e94b8aa0ead
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-dc07-6782430db6fe
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-5ec2-66bae80c9386
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-e2fd-1502e75c0d23
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-3466-c84f0df2a8f7
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-0b01-6aaed3f5408e
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-7bf2-d8cdc8064e92
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-541c-13ee9c58c501
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-f92b-f59de717545d
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-5610-3d66f610d875
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-956f-8174fa08620b
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-b9a7-fe6ec42664fb
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-290c-050f569ca82f
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2b44-f949cc486ad8
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-2558-81ec9f1aa541
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9768-1fab-fc3f64cca7fb
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-6596-8483a612daa5
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-5c25-dc92212ea0c7
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-8e27-ac9e5ec03ed2
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-43d4-e0a449afa566
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-fed6-0a60bab7b7e2
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-0274-598e8f65141c
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-ce97-e025b7ac5dc4
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-4923-36a9972e05ad
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-3687-0bf92b541323
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-8fb0-6b90af8df5cc
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-cadf-0c687087eca3
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-7b55-6aaf1c8e267e
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-5544-a5277610dbd8
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-6765-49c6b7bef06d
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-a518-81672c5b55ea
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-f174-4639ecd2a512
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-de0f-63f805edb913
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-803b-698ab4951219
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-a7de-32d8d3116274
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-e994-54b0b6f79764
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-cd16-25acc1be53b0
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-b07d-8735b36230bd
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-d6c7-2a02cb03e2f6
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-524b-4e9b0ad8a384
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-2c84-95d83e53e054
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-68ee-a6291eb6de89
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-8ee9-0de57e82b753
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-489f-6e477d05c3fb
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-39a8-44301ef9bda1
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-f0e9-3f284c9f5b66
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-27c1-df638b5554d9
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-f009-2572d7943670
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-1855-92fe3d08413a
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-9870-f15a4d8ce021
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-cf79-c6c362a8cccd
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-9b50-3e989f744e2b
00020000-55a7-976a-06ff-0d00515778e9	00030000-55a7-9769-8329-b80004784781
\.


--
-- TOC entry 2884 (class 0 OID 10423991)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 10424022)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 10424136)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-55a7-976a-354e-8e48502e22c7	00090000-55a7-976a-92ed-8ff146c87ba1	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-55a7-976a-30e0-40c00eb900e2	00090000-55a7-976a-6067-486f2bd9a28e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-55a7-976a-5440-58d5f6ae6d2c	00090000-55a7-976a-2ae6-89c2ae27b3aa	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2861 (class 0 OID 10423756)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a7-976a-b0fa-14ae7e6e609f	00040000-55a7-9768-a3f5-ba1d7907022e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-6a59-2550d1673287	00040000-55a7-9768-a3f5-ba1d7907022e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a7-976a-d1f7-a30b31149617	00040000-55a7-9768-a3f5-ba1d7907022e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-acb1-8537b9a35382	00040000-55a7-9768-a3f5-ba1d7907022e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-3978-37d640cc41b9	00040000-55a7-9768-a3f5-ba1d7907022e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-102f-ef3ef6ec2837	00040000-55a7-9768-9e6d-0f042b784bf8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-00fb-e83f27a27ae4	00040000-55a7-9768-a5a9-41a291ba48a6	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-6ffa-9c59767ce503	00040000-55a7-9768-8e20-249d8ede0e01	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a7-976a-7beb-bf58b703f2cb	00040000-55a7-9768-a3f5-ba1d7907022e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2863 (class 0 OID 10423791)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a7-9769-454f-121ef50f7aaa	8341	Adlešiči
00050000-55a7-9769-4221-5308ecf2d84d	5270	Ajdovščina
00050000-55a7-9769-e65f-938ec4981b5e	6280	Ankaran/Ancarano
00050000-55a7-9769-fc77-0514f0c1fcfc	9253	Apače
00050000-55a7-9769-65a4-f238f697f8c9	8253	Artiče
00050000-55a7-9769-9440-884ef34f699c	4275	Begunje na Gorenjskem
00050000-55a7-9769-4f0a-935da4a34e98	1382	Begunje pri Cerknici
00050000-55a7-9769-8193-341d0707ed40	9231	Beltinci
00050000-55a7-9769-42bf-4d1e06c56a22	2234	Benedikt
00050000-55a7-9769-1010-175424d687b4	2345	Bistrica ob Dravi
00050000-55a7-9769-434b-0b93df48f5b0	3256	Bistrica ob Sotli
00050000-55a7-9769-2518-cd58630d6a4b	8259	Bizeljsko
00050000-55a7-9769-62a2-ee04eccb8e9f	1223	Blagovica
00050000-55a7-9769-d200-1a92e91363e5	8283	Blanca
00050000-55a7-9769-1b54-62eacb1f00f9	4260	Bled
00050000-55a7-9769-0459-af3f87bd8a88	4273	Blejska Dobrava
00050000-55a7-9769-de97-d9626f235a20	9265	Bodonci
00050000-55a7-9769-33cc-73c217df28c2	9222	Bogojina
00050000-55a7-9769-e710-f716ca0d220e	4263	Bohinjska Bela
00050000-55a7-9769-b9fd-fb342e41822e	4264	Bohinjska Bistrica
00050000-55a7-9769-b6d0-adca81ac1199	4265	Bohinjsko jezero
00050000-55a7-9769-6e36-494d1a8abfba	1353	Borovnica
00050000-55a7-9769-88a2-acc95819b0de	8294	Boštanj
00050000-55a7-9769-f5d0-d3fbaa6758c3	5230	Bovec
00050000-55a7-9769-fb7e-688cee67662e	5295	Branik
00050000-55a7-9769-2712-313092aab966	3314	Braslovče
00050000-55a7-9769-38a4-06771c673b93	5223	Breginj
00050000-55a7-9769-b331-0bbafa2800bf	8280	Brestanica
00050000-55a7-9769-a398-7af7aa3f77a1	2354	Bresternica
00050000-55a7-9769-dda2-91d9df5f6f38	4243	Brezje
00050000-55a7-9769-b826-4c65e2c5f04e	1351	Brezovica pri Ljubljani
00050000-55a7-9769-ef4c-f6e1a4c8dc45	8250	Brežice
00050000-55a7-9769-ea56-4c405050f4e7	4210	Brnik - Aerodrom
00050000-55a7-9769-011a-1d4df69e7967	8321	Brusnice
00050000-55a7-9769-72f4-2e0113e05e0e	3255	Buče
00050000-55a7-9769-b53a-563b5351936f	8276	Bučka 
00050000-55a7-9769-9b14-2d5c84d404a6	9261	Cankova
00050000-55a7-9769-6c00-7d7e75a96063	3000	Celje 
00050000-55a7-9769-1650-671b9bb6f2fc	3001	Celje - poštni predali
00050000-55a7-9769-9f15-1c26e96c1c11	4207	Cerklje na Gorenjskem
00050000-55a7-9769-d08f-b268a10c6694	8263	Cerklje ob Krki
00050000-55a7-9769-35f9-29c081611a0f	1380	Cerknica
00050000-55a7-9769-4daf-5750da1b9a01	5282	Cerkno
00050000-55a7-9769-992e-8f63a4c9fcd5	2236	Cerkvenjak
00050000-55a7-9769-2550-9aed4e2a59ab	2215	Ceršak
00050000-55a7-9769-ec58-97e125f6d0c1	2326	Cirkovce
00050000-55a7-9769-79da-6d43b5b90f67	2282	Cirkulane
00050000-55a7-9769-8e08-7566b0764ba6	5273	Col
00050000-55a7-9769-b682-852b41c74cc3	8251	Čatež ob Savi
00050000-55a7-9769-9440-4b8ad7aac4de	1413	Čemšenik
00050000-55a7-9769-8961-c5aedffd1650	5253	Čepovan
00050000-55a7-9769-4816-214644ad07f2	9232	Črenšovci
00050000-55a7-9769-3ef3-0f68238c08e8	2393	Črna na Koroškem
00050000-55a7-9769-33ec-302e4ee34a70	6275	Črni Kal
00050000-55a7-9769-3443-1c9a0bc50997	5274	Črni Vrh nad Idrijo
00050000-55a7-9769-ee2d-fe254d536dc9	5262	Črniče
00050000-55a7-9769-270b-dfd92b58d185	8340	Črnomelj
00050000-55a7-9769-1321-fa7a0ea7015e	6271	Dekani
00050000-55a7-9769-6e64-511cf8496471	5210	Deskle
00050000-55a7-9769-1944-c8df2e5e31f1	2253	Destrnik
00050000-55a7-9769-90f7-fffd503bfea8	6215	Divača
00050000-55a7-9769-93da-683073d6bb47	1233	Dob
00050000-55a7-9769-9c5c-db73e22b6ff1	3224	Dobje pri Planini
00050000-55a7-9769-affa-44df2b05a53b	8257	Dobova
00050000-55a7-9769-9d0a-05b74705dde0	1423	Dobovec
00050000-55a7-9769-ac8b-5b1aafe612f4	5263	Dobravlje
00050000-55a7-9769-fe74-822bd9e690bf	3204	Dobrna
00050000-55a7-9769-6650-e6c01c8eeeaf	8211	Dobrnič
00050000-55a7-9769-76c9-139241f05bac	1356	Dobrova
00050000-55a7-9769-a0dd-94715f74ae6f	9223	Dobrovnik/Dobronak 
00050000-55a7-9769-52af-c9247d4445bc	5212	Dobrovo v Brdih
00050000-55a7-9769-6308-0555d87659e3	1431	Dol pri Hrastniku
00050000-55a7-9769-0974-067f2ebea968	1262	Dol pri Ljubljani
00050000-55a7-9769-5c97-c7768e7e2b0c	1273	Dole pri Litiji
00050000-55a7-9769-88c3-785ac4d5f6cb	1331	Dolenja vas
00050000-55a7-9769-ff17-e21d7d3610f6	8350	Dolenjske Toplice
00050000-55a7-9769-25c8-6d9d47e6f97b	1230	Domžale
00050000-55a7-9769-746b-513492f3f3c1	2252	Dornava
00050000-55a7-9769-7e91-921afd39f86c	5294	Dornberk
00050000-55a7-9769-845b-37bb16595166	1319	Draga
00050000-55a7-9769-ae85-53624a7b5d50	8343	Dragatuš
00050000-55a7-9769-44f8-41f11596eed7	3222	Dramlje
00050000-55a7-9769-907b-b734957b5ab9	2370	Dravograd
00050000-55a7-9769-5d80-cb1899521e93	4203	Duplje
00050000-55a7-9769-b114-9dfe6c4a1062	6221	Dutovlje
00050000-55a7-9769-d0a3-13f22341372f	8361	Dvor
00050000-55a7-9769-b91a-a6c948aadc9a	2343	Fala
00050000-55a7-9769-e13d-9484e0b1797a	9208	Fokovci
00050000-55a7-9769-2263-a7e991f50e20	2313	Fram
00050000-55a7-9769-fcc1-8a6cd172dadc	3213	Frankolovo
00050000-55a7-9769-6d7f-4f1af0ee11b1	1274	Gabrovka
00050000-55a7-9769-200e-5a9dd77a15db	8254	Globoko
00050000-55a7-9769-331f-3a135deaa7ab	5275	Godovič
00050000-55a7-9769-6030-ae99a60b7d12	4204	Golnik
00050000-55a7-9769-4d77-aba2af3d2cf8	3303	Gomilsko
00050000-55a7-9769-d163-e706b9daa246	4224	Gorenja vas
00050000-55a7-9769-1b9d-93028e8f4faa	3263	Gorica pri Slivnici
00050000-55a7-9769-e971-0e685d319c9d	2272	Gorišnica
00050000-55a7-9769-a3d1-993e2891aa4a	9250	Gornja Radgona
00050000-55a7-9769-4566-15c7018a6867	3342	Gornji Grad
00050000-55a7-9769-f60b-5644a7ab7e3e	4282	Gozd Martuljek
00050000-55a7-9769-40e3-4a407aadb8eb	6272	Gračišče
00050000-55a7-9769-342d-b32a348faa34	9264	Grad
00050000-55a7-9769-dbe8-dc25985e1ddf	8332	Gradac
00050000-55a7-9769-27fc-0a3668597db9	1384	Grahovo
00050000-55a7-9769-746d-67f1a2121dd6	5242	Grahovo ob Bači
00050000-55a7-9769-6dc4-d7674bfab478	5251	Grgar
00050000-55a7-9769-3a7e-a8418ace1a39	3302	Griže
00050000-55a7-9769-24d5-e0e3545b0add	3231	Grobelno
00050000-55a7-9769-2b5c-622888e85fe7	1290	Grosuplje
00050000-55a7-9769-d135-969d74da036d	2288	Hajdina
00050000-55a7-9769-4654-175529b96c57	8362	Hinje
00050000-55a7-9769-adc3-c179b9ad6319	2311	Hoče
00050000-55a7-9769-7fc2-f6e0b6f75340	9205	Hodoš/Hodos
00050000-55a7-9769-1e88-3f2710dc41f6	1354	Horjul
00050000-55a7-9769-1ea1-f1ea07f6e34e	1372	Hotedršica
00050000-55a7-9769-a0a5-83b752e84273	1430	Hrastnik
00050000-55a7-9769-026b-efe450599c7f	6225	Hruševje
00050000-55a7-9769-16f4-d909d6ee08c5	4276	Hrušica
00050000-55a7-9769-7f64-bb34a1767c18	5280	Idrija
00050000-55a7-9769-91ff-c8bc526455cd	1292	Ig
00050000-55a7-9769-597a-af4643695399	6250	Ilirska Bistrica
00050000-55a7-9769-8db2-e2fae48094fe	6251	Ilirska Bistrica-Trnovo
00050000-55a7-9769-06c6-7efd9fe02555	1295	Ivančna Gorica
00050000-55a7-9769-62c8-e3c2f1b4706e	2259	Ivanjkovci
00050000-55a7-9769-3b5e-cb4559ef55bb	1411	Izlake
00050000-55a7-9769-f7d3-dae04c5f4f2a	6310	Izola/Isola
00050000-55a7-9769-0e9b-0dffbd56b67e	2222	Jakobski Dol
00050000-55a7-9769-211f-04ef177c831e	2221	Jarenina
00050000-55a7-9769-6dbd-f953e5ec8f2a	6254	Jelšane
00050000-55a7-9769-7cca-eeecace59f20	4270	Jesenice
00050000-55a7-9769-4635-573dabfe6c02	8261	Jesenice na Dolenjskem
00050000-55a7-9769-a648-d08d57dbb069	3273	Jurklošter
00050000-55a7-9769-cab2-2da10968a5c0	2223	Jurovski Dol
00050000-55a7-9769-eac7-8a8e01776de0	2256	Juršinci
00050000-55a7-9769-2d25-b109348ab04f	5214	Kal nad Kanalom
00050000-55a7-9769-2bc3-801af2a46b0b	3233	Kalobje
00050000-55a7-9769-1b43-9d0f79087c0f	4246	Kamna Gorica
00050000-55a7-9769-66bb-5fa089dabff6	2351	Kamnica
00050000-55a7-9769-d820-7190f607b361	1241	Kamnik
00050000-55a7-9769-dbfb-078ca76b691c	5213	Kanal
00050000-55a7-9769-4d16-cb7928732a36	8258	Kapele
00050000-55a7-9769-0ba8-9b242aba0992	2362	Kapla
00050000-55a7-9769-3c19-e9956d1ebfff	2325	Kidričevo
00050000-55a7-9769-5609-a79b23951f65	1412	Kisovec
00050000-55a7-9769-1d47-36a01e8550c0	6253	Knežak
00050000-55a7-9769-5e5d-b79271663681	5222	Kobarid
00050000-55a7-9769-8a6b-5caa646c3695	9227	Kobilje
00050000-55a7-9769-a630-408118e5c8f4	1330	Kočevje
00050000-55a7-9769-6a57-0bf00520d8a1	1338	Kočevska Reka
00050000-55a7-9769-c914-1d0364fe9c47	2276	Kog
00050000-55a7-9769-74e7-cdfbdeb268ca	5211	Kojsko
00050000-55a7-9769-1787-cd790b4498c3	6223	Komen
00050000-55a7-9769-dcd2-7994f2379a02	1218	Komenda
00050000-55a7-9769-c353-07c1852f003f	6000	Koper/Capodistria 
00050000-55a7-9769-e3c2-feef1d7a27a4	6001	Koper/Capodistria - poštni predali
00050000-55a7-9769-4b98-d00d6ceb95e0	8282	Koprivnica
00050000-55a7-9769-26e8-7f6a4ca0b81f	5296	Kostanjevica na Krasu
00050000-55a7-9769-44b7-e651e390c099	8311	Kostanjevica na Krki
00050000-55a7-9769-c8c8-af746500723e	1336	Kostel
00050000-55a7-9769-266f-0a87c8bd5a04	6256	Košana
00050000-55a7-9769-1858-94b6d21039ce	2394	Kotlje
00050000-55a7-9769-bc91-306b949669d0	6240	Kozina
00050000-55a7-9769-0827-210ee5e0fd68	3260	Kozje
00050000-55a7-9769-5a3d-5f65b8d7bc61	4000	Kranj 
00050000-55a7-9769-29d4-cb94bf56972e	4001	Kranj - poštni predali
00050000-55a7-9769-40d7-23500a783d7a	4280	Kranjska Gora
00050000-55a7-9769-68cc-38f4b962eeb5	1281	Kresnice
00050000-55a7-9769-d162-19f16f23f603	4294	Križe
00050000-55a7-9769-81ef-d35be76bd4ce	9206	Križevci
00050000-55a7-9769-7fdc-d6296dd99a01	9242	Križevci pri Ljutomeru
00050000-55a7-9769-aa32-f7d7b6e3698e	1301	Krka
00050000-55a7-9769-518c-56a4c69f9df0	8296	Krmelj
00050000-55a7-9769-b7df-a4bedbc0f46a	4245	Kropa
00050000-55a7-9769-c234-86a75379ab50	8262	Krška vas
00050000-55a7-9769-5fab-6bfef5cb2fe7	8270	Krško
00050000-55a7-9769-908b-6cbcdc02d312	9263	Kuzma
00050000-55a7-9769-4998-f4f3833ed26b	2318	Laporje
00050000-55a7-9769-6841-dda0988db41f	3270	Laško
00050000-55a7-9769-df74-f9cfbe4016c8	1219	Laze v Tuhinju
00050000-55a7-9769-5c37-6dc51d12d5a8	2230	Lenart v Slovenskih goricah
00050000-55a7-9769-9d6a-03dd9e940fd3	9220	Lendava/Lendva
00050000-55a7-9769-b261-998e825ae218	4248	Lesce
00050000-55a7-9769-b8eb-91366a90380c	3261	Lesično
00050000-55a7-9769-32eb-c88654aa31db	8273	Leskovec pri Krškem
00050000-55a7-9769-51d1-0fdb17a521be	2372	Libeliče
00050000-55a7-9769-1991-2411aef325e8	2341	Limbuš
00050000-55a7-9769-e872-a3fa17a21006	1270	Litija
00050000-55a7-9769-56f6-c128865e0609	3202	Ljubečna
00050000-55a7-9769-09b7-92771059a957	1000	Ljubljana 
00050000-55a7-9769-0234-44239d0561f4	1001	Ljubljana - poštni predali
00050000-55a7-9769-81a5-68a25bf21a14	1231	Ljubljana - Črnuče
00050000-55a7-9769-3f54-9ec0ad0bbfed	1261	Ljubljana - Dobrunje
00050000-55a7-9769-3488-7e16e138f30a	1260	Ljubljana - Polje
00050000-55a7-9769-cb24-b60161b26799	1210	Ljubljana - Šentvid
00050000-55a7-9769-49b6-0b8fbdb4abe8	1211	Ljubljana - Šmartno
00050000-55a7-9769-d383-8d3ae96d458f	3333	Ljubno ob Savinji
00050000-55a7-9769-abfa-8930487d39a0	9240	Ljutomer
00050000-55a7-9769-87c4-bfe93888678d	3215	Loče
00050000-55a7-9769-afeb-f0931bc42a30	5231	Log pod Mangartom
00050000-55a7-9769-b8ea-a6f8cd67dd55	1358	Log pri Brezovici
00050000-55a7-9769-a947-f732a76f1cc1	1370	Logatec
00050000-55a7-9769-33c1-009833aac7f6	1371	Logatec
00050000-55a7-9769-a4ed-69ebde4ad88a	1434	Loka pri Zidanem Mostu
00050000-55a7-9769-e933-bf5a1ef4d6b9	3223	Loka pri Žusmu
00050000-55a7-9769-5cf6-9734d265d02c	6219	Lokev
00050000-55a7-9769-53ab-9ccd53945ef4	1318	Loški Potok
00050000-55a7-9769-8680-b8eb6dffe56b	2324	Lovrenc na Dravskem polju
00050000-55a7-9769-6d34-98b5e7ad80e0	2344	Lovrenc na Pohorju
00050000-55a7-9769-daaa-c2781b9170d8	3334	Luče
00050000-55a7-9769-7803-f08b99aa5638	1225	Lukovica
00050000-55a7-9769-d302-74b8011db0cd	9202	Mačkovci
00050000-55a7-9769-7ea8-0a53bd8aa3f5	2322	Majšperk
00050000-55a7-9769-b287-8b3b2d57219f	2321	Makole
00050000-55a7-9769-b769-b13f97bc842f	9243	Mala Nedelja
00050000-55a7-9769-3228-b7a3ee36d6aa	2229	Malečnik
00050000-55a7-9769-0a31-b6dd2f2c6c74	6273	Marezige
00050000-55a7-9769-e5c6-c5b7403600a7	2000	Maribor 
00050000-55a7-9769-8271-1f9a1bd6a71c	2001	Maribor - poštni predali
00050000-55a7-9769-2e9c-e6484897177c	2206	Marjeta na Dravskem polju
00050000-55a7-9769-7dce-887817028087	2281	Markovci
00050000-55a7-9769-61a6-899f8ac64e36	9221	Martjanci
00050000-55a7-9769-14c2-6be56d6124f2	6242	Materija
00050000-55a7-9769-146f-cb8fd9c46e3a	4211	Mavčiče
00050000-55a7-9769-19fe-489a1d15a830	1215	Medvode
00050000-55a7-9769-0021-d5b2c883a1b0	1234	Mengeš
00050000-55a7-9769-1c1e-9808c13e0f3d	8330	Metlika
00050000-55a7-9769-6851-4f5c1aea30bb	2392	Mežica
00050000-55a7-9769-1fea-9f7642f25d0a	2204	Miklavž na Dravskem polju
00050000-55a7-9769-688b-6b2471cc80d7	2275	Miklavž pri Ormožu
00050000-55a7-9769-4f11-8fe60233a615	5291	Miren
00050000-55a7-9769-aeb0-a6cf26b4b307	8233	Mirna
00050000-55a7-9769-426b-bf1ada826c57	8216	Mirna Peč
00050000-55a7-9769-c8dd-e946692c6696	2382	Mislinja
00050000-55a7-9769-176e-53d065161ec4	4281	Mojstrana
00050000-55a7-9769-3c6e-24715708e688	8230	Mokronog
00050000-55a7-9769-c6a6-1c5824667358	1251	Moravče
00050000-55a7-9769-2b7d-7d8af439106a	9226	Moravske Toplice
00050000-55a7-9769-2875-9a742da0e11e	5216	Most na Soči
00050000-55a7-9769-01d2-19d5971002cc	1221	Motnik
00050000-55a7-9769-7305-59c91ae453e5	3330	Mozirje
00050000-55a7-9769-b004-3779a4ddcff8	9000	Murska Sobota 
00050000-55a7-9769-4e42-b0f46bc0dd0a	9001	Murska Sobota - poštni predali
00050000-55a7-9769-5ec1-367e2a67e933	2366	Muta
00050000-55a7-9769-c99e-7d2fc174a511	4202	Naklo
00050000-55a7-9769-775a-f261cb817498	3331	Nazarje
00050000-55a7-9769-41db-ee821c04ac09	1357	Notranje Gorice
00050000-55a7-9769-0c2d-b778e0ee0c7a	3203	Nova Cerkev
00050000-55a7-9769-35fb-39b67c185b72	5000	Nova Gorica 
00050000-55a7-9769-21a7-02dc01990ef6	5001	Nova Gorica - poštni predali
00050000-55a7-9769-28ef-8ad02c366036	1385	Nova vas
00050000-55a7-9769-8e33-67357353bee1	8000	Novo mesto
00050000-55a7-9769-e3b3-9e6402dd9bfb	8001	Novo mesto - poštni predali
00050000-55a7-9769-bcbf-efa1c00a1fca	6243	Obrov
00050000-55a7-9769-f1c3-bb62edeac0e6	9233	Odranci
00050000-55a7-9769-89e9-bd889d4c2cc1	2317	Oplotnica
00050000-55a7-9769-a620-068708385a80	2312	Orehova vas
00050000-55a7-9769-8b67-55870a1fa0a9	2270	Ormož
00050000-55a7-9769-2846-4a86554f470f	1316	Ortnek
00050000-55a7-9769-2765-bc7e50e23345	1337	Osilnica
00050000-55a7-9769-6b06-0fa8c31c3799	8222	Otočec
00050000-55a7-9769-51ff-85c1d5e7661b	2361	Ožbalt
00050000-55a7-9769-751c-19eab14e24b3	2231	Pernica
00050000-55a7-9769-5fad-4aef259ca71b	2211	Pesnica pri Mariboru
00050000-55a7-9769-4dbe-ed9dab08722c	9203	Petrovci
00050000-55a7-9769-6315-e490590adb1f	3301	Petrovče
00050000-55a7-9769-d140-db3ad16861d4	6330	Piran/Pirano
00050000-55a7-9769-da69-754158e8fd8f	8255	Pišece
00050000-55a7-9769-d2b1-5099e131cfbd	6257	Pivka
00050000-55a7-9769-d129-6b29979933aa	6232	Planina
00050000-55a7-9769-9f5d-b4aefd3bcedb	3225	Planina pri Sevnici
00050000-55a7-9769-c53b-c5ae472d759b	6276	Pobegi
00050000-55a7-9769-05a6-cb7ee0fda840	8312	Podbočje
00050000-55a7-9769-8223-2adaeebdf515	5243	Podbrdo
00050000-55a7-9769-187b-da9c29ace5ba	3254	Podčetrtek
00050000-55a7-9769-28fc-3e3189054a46	2273	Podgorci
00050000-55a7-9769-23dd-d0074fe9f58f	6216	Podgorje
00050000-55a7-9769-6495-fa50972766eb	2381	Podgorje pri Slovenj Gradcu
00050000-55a7-9769-d886-14b57c8909fb	6244	Podgrad
00050000-55a7-9769-0326-3ba15c30e78d	1414	Podkum
00050000-55a7-9769-3d73-9f58244dd819	2286	Podlehnik
00050000-55a7-9769-4eca-1851fd479e8d	5272	Podnanos
00050000-55a7-9769-e37e-3fa98a98b7be	4244	Podnart
00050000-55a7-9769-b1dd-e303485ed5fd	3241	Podplat
00050000-55a7-9769-e548-43ca1061aacf	3257	Podsreda
00050000-55a7-9769-a8af-96b1be91db21	2363	Podvelka
00050000-55a7-9769-0b68-f32c5ae56b5c	2208	Pohorje
00050000-55a7-9769-4158-a646231c66d5	2257	Polenšak
00050000-55a7-9769-bb13-901e9b853ce3	1355	Polhov Gradec
00050000-55a7-9769-bee4-de454e6f83f7	4223	Poljane nad Škofjo Loko
00050000-55a7-9769-efc8-204058373f87	2319	Poljčane
00050000-55a7-9769-9adb-0d76ac6f61c6	1272	Polšnik
00050000-55a7-9769-7ce0-3e842dbbf36b	3313	Polzela
00050000-55a7-9769-6263-8318cc27d8dc	3232	Ponikva
00050000-55a7-9769-a7e1-ea79b0893c21	6320	Portorož/Portorose
00050000-55a7-9769-f401-719b70c16884	6230	Postojna
00050000-55a7-9769-9da8-7c4f3b32f5a5	2331	Pragersko
00050000-55a7-9769-3076-cff87f95f552	3312	Prebold
00050000-55a7-9769-b34a-0c78a685f606	4205	Preddvor
00050000-55a7-9769-0261-56b5d5eaa3fc	6255	Prem
00050000-55a7-9769-f8ff-1d0f809283f1	1352	Preserje
00050000-55a7-9769-1541-e1c160626fdd	6258	Prestranek
00050000-55a7-9769-f68e-2b8ed6a5bf59	2391	Prevalje
00050000-55a7-9769-86db-80504dd0e93c	3262	Prevorje
00050000-55a7-9769-5d34-0fc93c5d5981	1276	Primskovo 
00050000-55a7-9769-93fd-45a663d6fd46	3253	Pristava pri Mestinju
00050000-55a7-9769-fb5a-5fd7d992c02a	9207	Prosenjakovci/Partosfalva
00050000-55a7-9769-1b5f-64a5062cf802	5297	Prvačina
00050000-55a7-9769-d34d-4e8c5f371d07	2250	Ptuj
00050000-55a7-9769-3599-7c9befab643e	2323	Ptujska Gora
00050000-55a7-9769-1bdf-b4ec0796ffe6	9201	Puconci
00050000-55a7-9769-6ea2-e2bd45a257b4	2327	Rače
00050000-55a7-9769-4305-5b0be3900cce	1433	Radeče
00050000-55a7-9769-8409-7600d3c134dd	9252	Radenci
00050000-55a7-9769-5cef-f04b8569f457	2360	Radlje ob Dravi
00050000-55a7-9769-7b09-33c327bec180	1235	Radomlje
00050000-55a7-9769-c8cb-70c7295f55f3	4240	Radovljica
00050000-55a7-9769-b875-fd35699744a1	8274	Raka
00050000-55a7-9769-9fa5-dca429314702	1381	Rakek
00050000-55a7-9769-24a6-fd40ed902712	4283	Rateče - Planica
00050000-55a7-9769-3ac7-efe4df16f863	2390	Ravne na Koroškem
00050000-55a7-9769-cb86-8265d0c53f94	9246	Razkrižje
00050000-55a7-9769-8561-7aefcf9afe61	3332	Rečica ob Savinji
00050000-55a7-9769-31de-c226e066c8e9	5292	Renče
00050000-55a7-9769-1fbd-07b107a96792	1310	Ribnica
00050000-55a7-9769-7e7d-96be9f478c45	2364	Ribnica na Pohorju
00050000-55a7-9769-6572-b49200ecdc0e	3272	Rimske Toplice
00050000-55a7-9769-7f7a-61d229bb347c	1314	Rob
00050000-55a7-9769-38f6-3c7550328d4d	5215	Ročinj
00050000-55a7-9769-0b54-425861354106	3250	Rogaška Slatina
00050000-55a7-9769-69a2-b47b8533f958	9262	Rogašovci
00050000-55a7-9769-67a0-048a899b5211	3252	Rogatec
00050000-55a7-9769-6eb3-527ec86e220f	1373	Rovte
00050000-55a7-9769-f24c-ad53b9afc9a6	2342	Ruše
00050000-55a7-9769-a4c6-a8ae7b093fd2	1282	Sava
00050000-55a7-9769-d324-85a8843f6c52	6333	Sečovlje/Sicciole
00050000-55a7-9769-6b11-53a7051041e1	4227	Selca
00050000-55a7-9769-188e-4a4af8283a1d	2352	Selnica ob Dravi
00050000-55a7-9769-58f1-2caf8a016aae	8333	Semič
00050000-55a7-9769-2b7f-b69d341ec700	8281	Senovo
00050000-55a7-9769-80ae-8770ce1a3914	6224	Senožeče
00050000-55a7-9769-59e7-728b6523d8d5	8290	Sevnica
00050000-55a7-9769-470f-2640046f0780	6210	Sežana
00050000-55a7-9769-d0b5-51d363fbb88c	2214	Sladki Vrh
00050000-55a7-9769-073f-a087018c84a9	5283	Slap ob Idrijci
00050000-55a7-9769-13a9-e7f889844f40	2380	Slovenj Gradec
00050000-55a7-9769-7ea7-a18f5453171f	2310	Slovenska Bistrica
00050000-55a7-9769-0417-cb495fd952cd	3210	Slovenske Konjice
00050000-55a7-9769-a69e-9a6abc535229	1216	Smlednik
00050000-55a7-9769-fd6d-aa4369dd845a	5232	Soča
00050000-55a7-9769-b64f-57064a12e988	1317	Sodražica
00050000-55a7-9769-148d-69d2d765e79f	3335	Solčava
00050000-55a7-9769-cd16-6580868f521c	5250	Solkan
00050000-55a7-9769-6900-f38634c26be2	4229	Sorica
00050000-55a7-9769-4571-54472e30c9e3	4225	Sovodenj
00050000-55a7-9769-b085-ef4c7fd4b2b0	5281	Spodnja Idrija
00050000-55a7-9769-40fc-14d6f1eb7ca4	2241	Spodnji Duplek
00050000-55a7-9769-c8d8-0dbfc1dedeb0	9245	Spodnji Ivanjci
00050000-55a7-9769-e8fe-a4d22d0988c3	2277	Središče ob Dravi
00050000-55a7-9769-7a5a-78a78a31749b	4267	Srednja vas v Bohinju
00050000-55a7-9769-d96f-29cd315695f5	8256	Sromlje 
00050000-55a7-9769-46e4-8622b9e76fb7	5224	Srpenica
00050000-55a7-9769-6321-09b257878049	1242	Stahovica
00050000-55a7-9769-7278-cfbef469fd7b	1332	Stara Cerkev
00050000-55a7-9769-4494-c251b09b0cf1	8342	Stari trg ob Kolpi
00050000-55a7-9769-e1f8-1840b4a38f0f	1386	Stari trg pri Ložu
00050000-55a7-9769-019a-2f39f86ef6e8	2205	Starše
00050000-55a7-9769-9ab3-e1a0f8ef2053	2289	Stoperce
00050000-55a7-9769-fc75-578e427e3e98	8322	Stopiče
00050000-55a7-9769-6477-5e60a0502fb1	3206	Stranice
00050000-55a7-9769-e4d3-03636d2f20e2	8351	Straža
00050000-55a7-9769-1ec5-d9885c4acf11	1313	Struge
00050000-55a7-9769-b50b-611548d23a26	8293	Studenec
00050000-55a7-9769-6aa6-eb25cc42dca9	8331	Suhor
00050000-55a7-9769-8a1c-d446e44ae4ae	2233	Sv. Ana v Slovenskih goricah
00050000-55a7-9769-a8a7-2504331d4432	2235	Sv. Trojica v Slovenskih goricah
00050000-55a7-9769-58b4-d9c957a6377d	2353	Sveti Duh na Ostrem Vrhu
00050000-55a7-9769-ea5a-a6527238632d	9244	Sveti Jurij ob Ščavnici
00050000-55a7-9769-431e-06484d5e24e4	3264	Sveti Štefan
00050000-55a7-9769-7cee-ba0754f0dbf5	2258	Sveti Tomaž
00050000-55a7-9769-9d12-14b913cfdeff	9204	Šalovci
00050000-55a7-9769-d1f9-c382dcee473f	5261	Šempas
00050000-55a7-9769-da3d-f7e97aabbeeb	5290	Šempeter pri Gorici
00050000-55a7-9769-02df-e107874b0567	3311	Šempeter v Savinjski dolini
00050000-55a7-9769-967e-36b21595c1a0	4208	Šenčur
00050000-55a7-9769-79d4-53eb6b185f21	2212	Šentilj v Slovenskih goricah
00050000-55a7-9769-7a4f-b287759b16b8	8297	Šentjanž
00050000-55a7-9769-1074-2ea425396d88	2373	Šentjanž pri Dravogradu
00050000-55a7-9769-f0b0-491b35d216ab	8310	Šentjernej
00050000-55a7-9769-b823-dd1febd1c462	3230	Šentjur
00050000-55a7-9769-2cb4-1f407152592f	3271	Šentrupert
00050000-55a7-9769-602d-d3ecee319037	8232	Šentrupert
00050000-55a7-9769-dda7-0fb436c899cb	1296	Šentvid pri Stični
00050000-55a7-9769-f767-5257c85cd4bc	8275	Škocjan
00050000-55a7-9769-44a5-e9da00da32aa	6281	Škofije
00050000-55a7-9769-2ace-f736e4c1f5ba	4220	Škofja Loka
00050000-55a7-9769-a6df-911bfa465340	3211	Škofja vas
00050000-55a7-9769-aec7-1a10a45a498e	1291	Škofljica
00050000-55a7-9769-7d14-e352d9b84533	6274	Šmarje
00050000-55a7-9769-2de4-6707f50e64db	1293	Šmarje - Sap
00050000-55a7-9769-1b40-1ed5130c65e1	3240	Šmarje pri Jelšah
00050000-55a7-9769-9e07-a5d3d0b335ff	8220	Šmarješke Toplice
00050000-55a7-9769-b263-6acfa28ff07b	2315	Šmartno na Pohorju
00050000-55a7-9769-1576-31b46b7e18a9	3341	Šmartno ob Dreti
00050000-55a7-9769-41c0-36ea8d479691	3327	Šmartno ob Paki
00050000-55a7-9769-37a8-ab05401c58be	1275	Šmartno pri Litiji
00050000-55a7-9769-dd6f-e2d60c9bf048	2383	Šmartno pri Slovenj Gradcu
00050000-55a7-9769-7e13-3451b1419704	3201	Šmartno v Rožni dolini
00050000-55a7-9769-1629-539bfc4c7678	3325	Šoštanj
00050000-55a7-9769-ca16-efc557c03779	6222	Štanjel
00050000-55a7-9769-2e49-a8a69b84081f	3220	Štore
00050000-55a7-9769-90e7-8f3c3b4bd703	3304	Tabor
00050000-55a7-9769-7c04-c21a7af269e8	3221	Teharje
00050000-55a7-9769-d459-d0ea09c93f5a	9251	Tišina
00050000-55a7-9769-9ef6-f87f91279329	5220	Tolmin
00050000-55a7-9769-98fd-248fbae166d1	3326	Topolšica
00050000-55a7-9769-bd22-423cb242e0c6	2371	Trbonje
00050000-55a7-9769-d884-3955a314aea4	1420	Trbovlje
00050000-55a7-9769-5856-7521d8d1071d	8231	Trebelno 
00050000-55a7-9769-90b7-5a43e2bb7e03	8210	Trebnje
00050000-55a7-9769-a70d-9b729e88c7b5	5252	Trnovo pri Gorici
00050000-55a7-9769-fe5c-eb6da24bf018	2254	Trnovska vas
00050000-55a7-9769-29e1-24df1d692746	1222	Trojane
00050000-55a7-9769-aa13-752a65feabdb	1236	Trzin
00050000-55a7-9769-a3c4-23a57a97efb5	4290	Tržič
00050000-55a7-9769-327b-5ae460eb45e0	8295	Tržišče
00050000-55a7-9769-eee3-851c5f3a1e64	1311	Turjak
00050000-55a7-9769-3abf-05af24a511eb	9224	Turnišče
00050000-55a7-9769-e246-753a30d897b3	8323	Uršna sela
00050000-55a7-9769-ff2d-bf77c9a6ae1a	1252	Vače
00050000-55a7-9769-6b51-7515bdee02dd	3320	Velenje 
00050000-55a7-9769-76b3-9e6e145cc074	3322	Velenje - poštni predali
00050000-55a7-9769-5d11-08bf030d3f76	8212	Velika Loka
00050000-55a7-9769-90e1-827fca6a242d	2274	Velika Nedelja
00050000-55a7-9769-0c4d-13bb3e616030	9225	Velika Polana
00050000-55a7-9769-bfb0-fec1f2d1af95	1315	Velike Lašče
00050000-55a7-9769-d65b-ec193dd7306c	8213	Veliki Gaber
00050000-55a7-9769-7004-6d419dcde883	9241	Veržej
00050000-55a7-9769-3102-194676cd2593	1312	Videm - Dobrepolje
00050000-55a7-9769-2f7f-de1cdd39c1b7	2284	Videm pri Ptuju
00050000-55a7-9769-422f-796556fc4978	8344	Vinica
00050000-55a7-9769-a538-68ce9c4c2f4a	5271	Vipava
00050000-55a7-9769-95ac-8c0eb9338b06	4212	Visoko
00050000-55a7-9769-3938-4073e8fd7258	1294	Višnja Gora
00050000-55a7-9769-2178-acc9dd107052	3205	Vitanje
00050000-55a7-9769-b180-c740761f00d1	2255	Vitomarci
00050000-55a7-9769-4393-fd231d46aee0	1217	Vodice
00050000-55a7-9769-75a4-3affba0717f2	3212	Vojnik\t
00050000-55a7-9769-42a0-5e4b08b561a7	5293	Volčja Draga
00050000-55a7-9769-fcfe-adad51d1a02b	2232	Voličina
00050000-55a7-9769-486e-8c6f0539fbfa	3305	Vransko
00050000-55a7-9769-8b71-133dc4a9659d	6217	Vremski Britof
00050000-55a7-9769-5582-187c0a1ef03e	1360	Vrhnika
00050000-55a7-9769-eb31-65b75adf39e0	2365	Vuhred
00050000-55a7-9769-525b-7085be769b89	2367	Vuzenica
00050000-55a7-9769-30b0-86187ef1f454	8292	Zabukovje 
00050000-55a7-9769-6a80-4281be01ed58	1410	Zagorje ob Savi
00050000-55a7-9769-998d-6252f2f9fcae	1303	Zagradec
00050000-55a7-9769-7a8f-865f18320d87	2283	Zavrč
00050000-55a7-9769-78b6-90a387c2a489	8272	Zdole 
00050000-55a7-9769-7daf-38605a30a55c	4201	Zgornja Besnica
00050000-55a7-9769-5939-3747d031382c	2242	Zgornja Korena
00050000-55a7-9769-8945-ca16cd3f09ee	2201	Zgornja Kungota
00050000-55a7-9769-a689-23e9d9f521ea	2316	Zgornja Ložnica
00050000-55a7-9769-e12e-ac2ec62ecee2	2314	Zgornja Polskava
00050000-55a7-9769-9e4c-ff207f1a7bf9	2213	Zgornja Velka
00050000-55a7-9769-d748-bc2dc40f0bab	4247	Zgornje Gorje
00050000-55a7-9769-3748-7f1dbbe87028	4206	Zgornje Jezersko
00050000-55a7-9769-25d1-0ac08792d62f	2285	Zgornji Leskovec
00050000-55a7-9769-88f4-5744d17a1344	1432	Zidani Most
00050000-55a7-9769-880a-cdafbd130f06	3214	Zreče
00050000-55a7-9769-1b19-ef6a01b39530	4209	Žabnica
00050000-55a7-9769-fd41-48e38e397a66	3310	Žalec
00050000-55a7-9769-2ef1-08fa597c5f71	4228	Železniki
00050000-55a7-9769-6cab-71af2563205c	2287	Žetale
00050000-55a7-9769-4bbf-3f06ebd58043	4226	Žiri
00050000-55a7-9769-cd0b-3e0b416e458f	4274	Žirovnica
00050000-55a7-9769-0650-b147caec5266	8360	Žužemberk
\.


--
-- TOC entry 2880 (class 0 OID 10423965)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 10423776)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 10423854)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 10423977)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 10424283)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 10424294)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a7-976a-0e0a-e259bacabd81	00080000-55a7-976a-7beb-bf58b703f2cb	0900	AK
00190000-55a7-976a-7de0-0699afe13e9f	00080000-55a7-976a-d1f7-a30b31149617	0987	AK
00190000-55a7-976a-4668-1449a212e415	00080000-55a7-976a-6a59-2550d1673287	0989	AK
00190000-55a7-976a-8709-39d11230615f	00080000-55a7-976a-acb1-8537b9a35382	0986	AK
00190000-55a7-976a-b151-9c6105a0fd6b	00080000-55a7-976a-102f-ef3ef6ec2837	0984	AK
00190000-55a7-976a-3cd6-f6078de674f1	00080000-55a7-976a-00fb-e83f27a27ae4	0983	AK
00190000-55a7-976a-0bee-793be1846012	00080000-55a7-976a-6ffa-9c59767ce503	0982	AK
\.


--
-- TOC entry 2904 (class 0 OID 10424264)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a7-976a-2a6f-173e98db9ce6	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 10424006)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a7-976a-6dfa-b947a3dee800	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a7-976a-3409-e323425ee21d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a7-976a-15a8-19482af54502	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a7-976a-890a-fa8cd7d04d95	0004	Mali oder	t	24	Mali oder 
00220000-55a7-976a-7545-93eb7eb19176	0005	Komorni oder	t	15	Komorni oder
00220000-55a7-976a-095b-5a8567f3f819	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a7-976a-f114-d0b57fedc52c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2878 (class 0 OID 10423950)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 10423940)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 10424125)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 10424074)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 10423648)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2887 (class 0 OID 10424016)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 10423686)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a7-9769-8117-74c1762f36ab	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a7-9769-1984-7fe96dded7c4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a7-9769-7c3e-203fca35bdda	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a7-9769-810f-c45b25374e79	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a7-9769-44c0-678dc2d75e1e	planer	Planer dogodkov v koledarju	t
00020000-55a7-9769-0bbd-b78ee49727b6	kadrovska	Kadrovska služba	t
00020000-55a7-9769-b755-2cf0090d963f	arhivar	Ažuriranje arhivalij	t
00020000-55a7-9769-70e6-87bf5bc1bd37	igralec	Igralec	t
00020000-55a7-9769-99b7-cb4d8392c1e7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a7-976a-06ff-0d00515778e9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2853 (class 0 OID 10423670)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a7-9769-3dd3-3a81262abef5	00020000-55a7-9769-7c3e-203fca35bdda
00010000-55a7-9769-c873-1bdd94eba76b	00020000-55a7-9769-7c3e-203fca35bdda
00010000-55a7-976a-2a4d-69cdd8110647	00020000-55a7-976a-06ff-0d00515778e9
\.


--
-- TOC entry 2889 (class 0 OID 10424030)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10423971)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10423921)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 10424333)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a7-9769-6470-2de2fe1377cc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a7-9769-dbe0-70a7d5f9464b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a7-9769-0bf6-ea4c75051141	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a7-9769-2f5d-3e4e8335574b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a7-9769-1e7e-f1821c38a89d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2910 (class 0 OID 10424325)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a7-9769-d384-084634f3ded1	00230000-55a7-9769-2f5d-3e4e8335574b	popa
00240000-55a7-9769-dbaa-57e260471f3b	00230000-55a7-9769-2f5d-3e4e8335574b	oseba
00240000-55a7-9769-31f2-3eeb1ef9ae0f	00230000-55a7-9769-dbe0-70a7d5f9464b	prostor
00240000-55a7-9769-4896-bfd678a0a95a	00230000-55a7-9769-2f5d-3e4e8335574b	besedilo
00240000-55a7-9769-3386-87825a7a40dd	00230000-55a7-9769-2f5d-3e4e8335574b	uprizoritev
00240000-55a7-9769-6326-96c105f27acd	00230000-55a7-9769-2f5d-3e4e8335574b	funkcija
00240000-55a7-9769-1e6c-1d22a84a7315	00230000-55a7-9769-2f5d-3e4e8335574b	tipfunkcije
00240000-55a7-9769-1850-55464e9395ec	00230000-55a7-9769-2f5d-3e4e8335574b	alternacija
00240000-55a7-9769-59d6-7e9eed29cd22	00230000-55a7-9769-6470-2de2fe1377cc	pogodba
00240000-55a7-9769-054a-634380924849	00230000-55a7-9769-2f5d-3e4e8335574b	zaposlitev
00240000-55a7-9769-4aa6-16c254debd43	00230000-55a7-9769-6470-2de2fe1377cc	programdela
\.


--
-- TOC entry 2909 (class 0 OID 10424320)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10424084)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a7-976a-ef84-23ae071ce9d2	000e0000-55a7-976a-e15d-258c4cc62b8c	00080000-55a7-976a-b0fa-14ae7e6e609f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a7-976a-3ab2-4e3fe0d0088d	000e0000-55a7-976a-e15d-258c4cc62b8c	00080000-55a7-976a-b0fa-14ae7e6e609f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a7-976a-617e-4ae23090145a	000e0000-55a7-976a-e15d-258c4cc62b8c	00080000-55a7-976a-3978-37d640cc41b9	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2860 (class 0 OID 10423748)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 10423927)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a7-976a-4aee-db78027bbd61	00180000-55a7-976a-0ef5-c0f929ea18ef	000c0000-55a7-976a-ee65-0262844ede07	00090000-55a7-976a-635d-bc6ee9044c4c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a7-976a-c891-e11b21bf1261	00180000-55a7-976a-0ef5-c0f929ea18ef	000c0000-55a7-976a-f30a-9ce52a249f7a	00090000-55a7-976a-cd27-33cc03ce09d4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a7-976a-5d9f-cc1e64306160	00180000-55a7-976a-0ef5-c0f929ea18ef	000c0000-55a7-976a-9a96-1e7bf294244a	00090000-55a7-976a-173b-79f5ef277e5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a7-976a-f4ca-53753b5d6083	00180000-55a7-976a-0ef5-c0f929ea18ef	000c0000-55a7-976a-e1d1-5291ec349309	00090000-55a7-976a-d6cd-c55d1ea6e65f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a7-976a-b99f-5d5ff3e656e9	00180000-55a7-976a-0ef5-c0f929ea18ef	000c0000-55a7-976a-52b8-326fc5b7d0f4	00090000-55a7-976a-367b-98bfee8ec103	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a7-976a-fe43-07079a257d9a	00180000-55a7-976a-0c99-72522ea80e66	\N	00090000-55a7-976a-367b-98bfee8ec103	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2896 (class 0 OID 10424114)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a7-9769-b368-7072a672258c	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a7-9769-8d40-4278341a05d2	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a7-9769-5f6d-da1a3d8e88bd	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a7-9769-8e07-0570a3186471	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a7-9769-1687-f5c7d6f5f8cd	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a7-9769-ea5e-bab13868ce00	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a7-9769-51de-e6429536ed69	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a7-9769-4457-3a3e51ee12b2	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a7-9769-417a-126f9dda166a	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a7-9769-61c9-2a32b2257a26	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a7-9769-00c4-6a9e7237b585	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a7-9769-fd54-d1ba1cf367df	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a7-9769-4eea-170410d7193b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a7-9769-adf0-eb25234cc7bf	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a7-9769-68a8-a61b114544a0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a7-9769-e8e3-1fb56df4c9bc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2907 (class 0 OID 10424302)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a7-9769-dc53-825c926caad8	01	Velika predstava	f	1.00	1.00
002b0000-55a7-9769-e993-8a3e34dd840e	02	Mala predstava	f	0.50	0.50
002b0000-55a7-9769-cba7-04e11f253e9d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a7-9769-4831-a39d9014e088	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a7-9769-a8d6-6ccc01f41474	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2865 (class 0 OID 10423811)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 10423657)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a7-9769-c873-1bdd94eba76b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZiGFAPyYlwoAxscqaJp.80IxR7ctVwG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a7-976a-06f6-000fba66fa42	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a7-976a-b8be-2814af6b400b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a7-976a-c86c-e5c2ea6f267e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a7-976a-9f6c-ce452c3d6294	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a7-976a-fb4d-ac030caace0a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a7-976a-7f47-f570feddcd73	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a7-976a-7b67-a39306958872	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a7-976a-ac21-84ba389f784f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a7-976a-4278-6ef7bd499c50	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a7-976a-2a4d-69cdd8110647	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a7-9769-3dd3-3a81262abef5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 10424162)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a7-976a-4c48-fa037d478287	00160000-55a7-976a-82b2-23bb230ec022	00150000-55a7-9769-9fad-0c4b758162ae	00140000-55a7-9768-c43d-e93b771d5ffb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a7-976a-7545-93eb7eb19176
000e0000-55a7-976a-e15d-258c4cc62b8c	00160000-55a7-976a-0a97-76981018ae80	00150000-55a7-9769-3e9d-4b6d0cd47b36	00140000-55a7-9768-ccaa-a3a26ad7b90d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a7-976a-095b-5a8567f3f819
000e0000-55a7-976a-a1e1-868f16319043	\N	00150000-55a7-9769-3e9d-4b6d0cd47b36	00140000-55a7-9768-ccaa-a3a26ad7b90d	00190000-55a7-976a-7de0-0699afe13e9f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a7-976a-7545-93eb7eb19176
000e0000-55a7-976a-7eac-46d8a80cde2c	\N	00150000-55a7-9769-3e9d-4b6d0cd47b36	00140000-55a7-9768-ccaa-a3a26ad7b90d	00190000-55a7-976a-7de0-0699afe13e9f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a7-976a-7545-93eb7eb19176
000e0000-55a7-976a-8244-f41a5468dc72	\N	00150000-55a7-9769-3e9d-4b6d0cd47b36	00140000-55a7-9768-ccaa-a3a26ad7b90d	00190000-55a7-976a-7de0-0699afe13e9f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a7-976a-6dfa-b947a3dee800
\.


--
-- TOC entry 2870 (class 0 OID 10423873)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a7-976a-68ed-d0d9fafbd33e	000e0000-55a7-976a-e15d-258c4cc62b8c	1	
00200000-55a7-976a-6056-877e4ed3a0d7	000e0000-55a7-976a-e15d-258c4cc62b8c	2	
\.


--
-- TOC entry 2885 (class 0 OID 10423998)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 10424067)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a7-976a-4736-79f8535f55b3	00090000-55a7-976a-cd27-33cc03ce09d4	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a7-976a-5a68-2f70306727d5	00090000-55a7-976a-173b-79f5ef277e5e	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a7-976a-99ae-cedc8c8d16c0	00090000-55a7-976a-a5d6-1ad89464a4a2	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2872 (class 0 OID 10423905)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 10424152)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a7-9768-c43d-e93b771d5ffb	01	Drama	drama (SURS 01)
00140000-55a7-9768-7140-3ce5facfb412	02	Opera	opera (SURS 02)
00140000-55a7-9768-d549-b744df181711	03	Balet	balet (SURS 03)
00140000-55a7-9768-723c-b927e2094d51	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a7-9768-d774-0d1015fc46f5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a7-9768-ccaa-a3a26ad7b90d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a7-9768-d528-43b9d1add524	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2891 (class 0 OID 10424057)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a7-9769-6ca8-565388868fdd	01	Opera	opera
00150000-55a7-9769-42c4-94573eabb5bc	02	Opereta	opereta
00150000-55a7-9769-ce99-fea2c0092788	03	Balet	balet
00150000-55a7-9769-d63d-fd66f4670fff	04	Plesne prireditve	plesne prireditve
00150000-55a7-9769-5160-04144526a825	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a7-9769-8b26-f42d8481484c	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a7-9769-bed1-bf2f0b002a5f	07	Biografska drama	biografska drama
00150000-55a7-9769-9fad-0c4b758162ae	08	Komedija	komedija
00150000-55a7-9769-e103-d0212a96e88d	09	Črna komedija	črna komedija
00150000-55a7-9769-14e0-c8c403940bf6	10	E-igra	E-igra
00150000-55a7-9769-3e9d-4b6d0cd47b36	11	Kriminalka	kriminalka
00150000-55a7-9769-1815-bb400c30e806	12	Musical	musical
\.


--
-- TOC entry 2444 (class 2606 OID 10423711)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 10424209)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10424199)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10424113)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10423895)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 10423920)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 10424318)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10423837)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 10424259)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10424053)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10423871)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10423914)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 10423851)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10423963)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10423990)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 10423809)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 10423720)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2451 (class 2606 OID 10423744)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 10423700)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2435 (class 2606 OID 10423685)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 10423996)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10424029)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 10424147)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 10423773)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 10423797)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 10423969)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 10423787)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 10423858)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 10423981)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 10424291)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 10424299)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 10424281)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10424013)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 10423954)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 10423945)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10424135)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 10424081)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 10423656)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 10424020)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 10423674)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2437 (class 2606 OID 10423694)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 10424038)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10423976)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10423926)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 10424342)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 10424330)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 10424324)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 10424094)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 10423753)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 10423936)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10424124)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 10424312)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 10423822)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10423669)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 10424178)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 10423880)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 10424004)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 10424072)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 10423909)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 10424160)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 10424065)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 1259 OID 10423902)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 10424095)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 10424096)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2458 (class 1259 OID 10423775)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2405 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2406 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2407 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2549 (class 1259 OID 10423997)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2543 (class 1259 OID 10423983)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 10423982)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2495 (class 1259 OID 10423881)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2571 (class 1259 OID 10424054)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 10424056)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2573 (class 1259 OID 10424055)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 10423853)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 10423852)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2594 (class 1259 OID 10424149)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 10424150)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 10424151)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2419 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2420 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2603 (class 1259 OID 10424183)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2604 (class 1259 OID 10424180)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2605 (class 1259 OID 10424184)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2606 (class 1259 OID 10424182)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2607 (class 1259 OID 10424181)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2473 (class 1259 OID 10423824)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2474 (class 1259 OID 10423823)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2410 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2411 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 10423747)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 10424021)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2513 (class 1259 OID 10423915)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 10423701)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2440 (class 1259 OID 10423702)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2564 (class 1259 OID 10424041)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2565 (class 1259 OID 10424040)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2566 (class 1259 OID 10424039)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2487 (class 1259 OID 10423859)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 10423861)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2489 (class 1259 OID 10423860)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 10424332)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2523 (class 1259 OID 10423949)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2524 (class 1259 OID 10423947)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2525 (class 1259 OID 10423946)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2526 (class 1259 OID 10423948)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2430 (class 1259 OID 10423675)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2431 (class 1259 OID 10423676)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2552 (class 1259 OID 10424005)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2538 (class 1259 OID 10423970)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2580 (class 1259 OID 10424082)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2581 (class 1259 OID 10424083)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 10424263)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 10424260)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10424261)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 10424262)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2462 (class 1259 OID 10423789)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2463 (class 1259 OID 10423788)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2464 (class 1259 OID 10423790)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2423 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2631 (class 1259 OID 10424292)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2632 (class 1259 OID 10424293)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2617 (class 1259 OID 10424213)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 10424211)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 10424212)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2577 (class 1259 OID 10424073)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 10423958)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2530 (class 1259 OID 10423957)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2531 (class 1259 OID 10423955)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2532 (class 1259 OID 10423956)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2401 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 10424201)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2614 (class 1259 OID 10424200)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 10424282)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2494 (class 1259 OID 10423872)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 10424319)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2445 (class 1259 OID 10423722)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2446 (class 1259 OID 10423721)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2454 (class 1259 OID 10423754)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 10423755)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2518 (class 1259 OID 10423939)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2519 (class 1259 OID 10423938)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2520 (class 1259 OID 10423937)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2415 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2501 (class 1259 OID 10423904)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2502 (class 1259 OID 10423900)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2503 (class 1259 OID 10423897)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2504 (class 1259 OID 10423898)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2505 (class 1259 OID 10423896)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2506 (class 1259 OID 10423901)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2507 (class 1259 OID 10423899)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2461 (class 1259 OID 10423774)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 10423838)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 10423840)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2481 (class 1259 OID 10423839)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2482 (class 1259 OID 10423841)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2537 (class 1259 OID 10423964)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 10424148)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 10424179)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2452 (class 1259 OID 10423745)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 10423746)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2574 (class 1259 OID 10424066)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 10424343)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 10423810)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 10424331)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2557 (class 1259 OID 10424015)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2558 (class 1259 OID 10424014)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 10424210)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 10424214)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2404 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2469 (class 1259 OID 10423798)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 10424161)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 10424300)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 10424301)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 10423695)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2508 (class 1259 OID 10423903)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2678 (class 2606 OID 10424479)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2681 (class 2606 OID 10424464)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2680 (class 2606 OID 10424469)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2676 (class 2606 OID 10424489)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2682 (class 2606 OID 10424459)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2677 (class 2606 OID 10424484)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2679 (class 2606 OID 10424474)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2712 (class 2606 OID 10424634)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 10424639)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 10424394)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2699 (class 2606 OID 10424574)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2697 (class 2606 OID 10424569)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2698 (class 2606 OID 10424564)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2675 (class 2606 OID 10424454)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 10424604)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 10424614)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2706 (class 2606 OID 10424609)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2669 (class 2606 OID 10424429)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 10424424)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 10424554)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 10424644)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 10424649)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 10424654)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 10424674)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 10424659)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 10424679)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 10424669)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 10424664)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2667 (class 2606 OID 10424419)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 10424414)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 10424379)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2660 (class 2606 OID 10424374)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 10424584)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 10424494)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2656 (class 2606 OID 10424354)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2655 (class 2606 OID 10424359)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2702 (class 2606 OID 10424599)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2703 (class 2606 OID 10424594)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 10424589)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2673 (class 2606 OID 10424434)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 10424444)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2672 (class 2606 OID 10424439)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 10424759)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2687 (class 2606 OID 10424529)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2689 (class 2606 OID 10424519)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2690 (class 2606 OID 10424514)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2688 (class 2606 OID 10424524)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 10424344)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2653 (class 2606 OID 10424349)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 10424579)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2696 (class 2606 OID 10424559)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2710 (class 2606 OID 10424624)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2709 (class 2606 OID 10424629)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 10424729)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 10424714)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 10424719)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 10424724)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2665 (class 2606 OID 10424404)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 10424399)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 10424409)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2733 (class 2606 OID 10424739)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2732 (class 2606 OID 10424744)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 10424704)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 10424709)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 10424694)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 10424699)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2708 (class 2606 OID 10424619)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 10424549)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2692 (class 2606 OID 10424544)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 10424534)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2693 (class 2606 OID 10424539)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 10424689)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 10424684)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 10424734)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2674 (class 2606 OID 10424449)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 10424749)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 10424754)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2657 (class 2606 OID 10424369)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 10424364)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2662 (class 2606 OID 10424384)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 10424389)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 10424509)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 10424504)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2686 (class 2606 OID 10424499)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-16 13:37:15 CEST

--
-- PostgreSQL database dump complete
--

