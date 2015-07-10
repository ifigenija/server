--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-10 13:21:17 CEST

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
-- TOC entry 183 (class 1259 OID 9715502)
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
-- TOC entry 228 (class 1259 OID 9716000)
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
-- TOC entry 227 (class 1259 OID 9715983)
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
-- TOC entry 221 (class 1259 OID 9715896)
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
-- TOC entry 197 (class 1259 OID 9715681)
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
-- TOC entry 200 (class 1259 OID 9715715)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9716113)
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
-- TOC entry 192 (class 1259 OID 9715624)
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
-- TOC entry 229 (class 1259 OID 9716013)
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
-- TOC entry 216 (class 1259 OID 9715841)
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
-- TOC entry 195 (class 1259 OID 9715661)
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
-- TOC entry 199 (class 1259 OID 9715709)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9715641)
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
-- TOC entry 205 (class 1259 OID 9715758)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9715783)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9715598)
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
-- TOC entry 184 (class 1259 OID 9715511)
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
-- TOC entry 185 (class 1259 OID 9715522)
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
-- TOC entry 180 (class 1259 OID 9715476)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9715495)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9715790)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9715821)
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
-- TOC entry 224 (class 1259 OID 9715934)
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
-- TOC entry 187 (class 1259 OID 9715555)
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
-- TOC entry 189 (class 1259 OID 9715590)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9715764)
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
-- TOC entry 188 (class 1259 OID 9715575)
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
-- TOC entry 194 (class 1259 OID 9715653)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9715776)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9716083)
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
-- TOC entry 232 (class 1259 OID 9716094)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9716064)
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
-- TOC entry 212 (class 1259 OID 9715805)
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
-- TOC entry 204 (class 1259 OID 9715749)
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
-- TOC entry 203 (class 1259 OID 9715739)
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
-- TOC entry 223 (class 1259 OID 9715923)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9715873)
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
-- TOC entry 177 (class 1259 OID 9715447)
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
-- TOC entry 176 (class 1259 OID 9715445)
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
-- TOC entry 213 (class 1259 OID 9715815)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9715485)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9715469)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9715829)
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
-- TOC entry 207 (class 1259 OID 9715770)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9715720)
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
-- TOC entry 237 (class 1259 OID 9716133)
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
-- TOC entry 236 (class 1259 OID 9716125)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9716120)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9715883)
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
-- TOC entry 186 (class 1259 OID 9715547)
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
-- TOC entry 202 (class 1259 OID 9715726)
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
-- TOC entry 222 (class 1259 OID 9715912)
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
-- TOC entry 233 (class 1259 OID 9716102)
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
-- TOC entry 191 (class 1259 OID 9715610)
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
-- TOC entry 178 (class 1259 OID 9715456)
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
-- TOC entry 226 (class 1259 OID 9715960)
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
-- TOC entry 196 (class 1259 OID 9715672)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9715797)
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
-- TOC entry 218 (class 1259 OID 9715866)
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
-- TOC entry 198 (class 1259 OID 9715704)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9715950)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9715856)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9715450)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9715502)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9716000)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559f-aaac-44ea-4ff2f3369a02	000d0000-559f-aaac-6dcc-b203782daa11	\N	00090000-559f-aaac-a46b-1274d29d7fd7	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559f-aaac-0f18-755d4b4b5bf3	000d0000-559f-aaac-2fd3-7dd71570c658	\N	00090000-559f-aaac-7467-d0b29d83e5a8	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559f-aaac-00c6-cc45d6bfed36	000d0000-559f-aaac-b676-5829b2a20483	\N	00090000-559f-aaac-0b86-316d0c44d10b	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559f-aaac-37b1-3fcc7c10c10d	000d0000-559f-aaac-96ff-c76cac08650e	\N	00090000-559f-aaac-31c6-959abb9c6ef1	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559f-aaac-34d1-be602b67aa50	000d0000-559f-aaac-b30b-1b79796e7755	\N	00090000-559f-aaac-5b14-4f70389c174b	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559f-aaac-834f-65cc320ce777	000d0000-559f-aaac-72dc-5a0f2c9958d7	\N	00090000-559f-aaac-0598-75ef7d7c2371	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559f-aaac-d24e-f294e9e8fbde	000d0000-559f-aaac-e908-592a9617aab0	\N	00090000-559f-aaac-f8d0-5fbdc0d0e739	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559f-aaac-d0c5-f41d2eb5ed8b	000d0000-559f-aaac-c76b-19b91267d436	\N	00090000-559f-aaac-442f-04dbc5e6a625	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2902 (class 0 OID 9715983)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9715896)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559f-aaac-24e0-3db88e67e8b5	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559f-aaac-c166-2f464a185878	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559f-aaac-2d04-79921976a999	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9715681)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559f-aaac-2464-92fe398e9d11	\N	\N	00200000-559f-aaac-212c-3a47b899bb9f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559f-aaac-90fb-c2bd395f711c	\N	\N	00200000-559f-aaac-b3b8-e757b507faf9	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559f-aaac-5b58-8ef9a390f769	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559f-aaac-7039-a55eb740018a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559f-aaac-7846-1440078dc2a1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9715715)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9716113)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9715624)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559f-aaaa-a708-12fba1dae587	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559f-aaaa-cabb-5ac56fc2a35a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559f-aaaa-0776-4eaeb0831a69	AL	ALB	008	Albania 	Albanija	\N
00040000-559f-aaaa-74d3-c9abb089f157	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559f-aaaa-1020-8fba2880d7ef	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559f-aaaa-8935-ea22142364cc	AD	AND	020	Andorra 	Andora	\N
00040000-559f-aaaa-0812-fb8458cbc0ed	AO	AGO	024	Angola 	Angola	\N
00040000-559f-aaaa-5705-6d6235e7feba	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559f-aaaa-2758-71ed94fd1531	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559f-aaaa-7162-2af41452cd2d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-aaaa-3de6-992aa34e13d8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559f-aaaa-98d1-1a2168f530c5	AM	ARM	051	Armenia 	Armenija	\N
00040000-559f-aaaa-c030-5a97901c19ed	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559f-aaaa-ca9d-00172b775c6f	AU	AUS	036	Australia 	Avstralija	\N
00040000-559f-aaaa-0fd4-cc7d75ac9d8f	AT	AUT	040	Austria 	Avstrija	\N
00040000-559f-aaaa-33be-e1fdd05bf98d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559f-aaaa-b7c1-191cea054984	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559f-aaaa-1221-cee436bed6a9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559f-aaaa-d237-ee3c7b782a07	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559f-aaaa-9c84-4876b31e86a3	BB	BRB	052	Barbados 	Barbados	\N
00040000-559f-aaaa-71f4-6ec68e1ccb9b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559f-aaaa-834f-a9bb29d0b188	BE	BEL	056	Belgium 	Belgija	\N
00040000-559f-aaaa-ba0a-45f0c528b097	BZ	BLZ	084	Belize 	Belize	\N
00040000-559f-aaaa-8fa7-5e14ecd11782	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559f-aaaa-a58b-fc196c386152	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559f-aaaa-40f9-41a519f72da1	BT	BTN	064	Bhutan 	Butan	\N
00040000-559f-aaaa-6275-9fbf26c9f6e4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559f-aaaa-05ec-9f5e69cb731d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559f-aaaa-23d1-82bc395e2c61	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559f-aaaa-a6d4-5fb4c4919163	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559f-aaaa-96af-0c04b7b930a0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559f-aaaa-6dce-4b9caf5724b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559f-aaaa-9a76-25b204438d3f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559f-aaaa-4ffb-1080589b62ad	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559f-aaaa-7845-71182919d0e0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559f-aaaa-9446-7b26d175e7d2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559f-aaaa-f370-60aae98f63bb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559f-aaaa-f00c-738187febbdf	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559f-aaaa-8236-81782e74c00e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559f-aaaa-7844-61b31bc63ba7	CA	CAN	124	Canada 	Kanada	\N
00040000-559f-aaaa-4232-5d579cf3f9bb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559f-aaaa-3ae6-ae09a31b1c27	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559f-aaaa-a3e6-b56e54e17bc2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559f-aaaa-eae4-c5e42f66d71b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559f-aaaa-3924-cd3edc33fb87	CL	CHL	152	Chile 	Čile	\N
00040000-559f-aaaa-9ab8-f22e98bc90d2	CN	CHN	156	China 	Kitajska	\N
00040000-559f-aaaa-d40c-c4e32a68f37b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559f-aaaa-dcbf-7280e789180d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559f-aaaa-be50-77140dc8a48c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559f-aaaa-ad87-6de319e1643a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559f-aaaa-fc80-80cb98a1b00f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559f-aaaa-7a6d-4b1a6104b58c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559f-aaaa-ca87-31fd5e4f25fe	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559f-aaaa-d0cc-62affe6d12d0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559f-aaaa-c187-b73c00c4a9d3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559f-aaaa-3af8-f77edcd20711	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559f-aaaa-7e31-c53545ec58e2	CU	CUB	192	Cuba 	Kuba	\N
00040000-559f-aaaa-e1db-d8d011b10835	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559f-aaaa-488d-9eaff9017da6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559f-aaaa-3a85-20f15b1c8984	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559f-aaaa-d8c5-29e8675d2a48	DK	DNK	208	Denmark 	Danska	\N
00040000-559f-aaaa-9300-c2f48e885bb1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559f-aaaa-56ab-2c73a13b13ad	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559f-aaaa-da8f-c74ecc95554c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559f-aaaa-71af-ac2a5b5d4d68	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559f-aaaa-03a1-ed53e25c8bcc	EG	EGY	818	Egypt 	Egipt	\N
00040000-559f-aaaa-7a86-9455a88c6808	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559f-aaaa-0ca7-123e42fdadd8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559f-aaaa-5bfb-ae4339dc6863	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559f-aaaa-f0e1-dc145f9a4eaa	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559f-aaaa-c373-58c1fb77cf59	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559f-aaaa-ac43-83609142be89	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559f-aaaa-c586-325cf8130f1b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559f-aaaa-76e2-156bf467318f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559f-aaaa-271f-f954cddac458	FI	FIN	246	Finland 	Finska	\N
00040000-559f-aaaa-2180-2588578c52a3	FR	FRA	250	France 	Francija	\N
00040000-559f-aaaa-2826-8756b18e83f7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559f-aaaa-1565-cc5336f73e46	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559f-aaaa-87b1-2c9fee6fcbc2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559f-aaaa-cf90-725132fa0ac7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559f-aaaa-863c-cca8be173ad9	GA	GAB	266	Gabon 	Gabon	\N
00040000-559f-aaaa-8e21-0967573e5c32	GM	GMB	270	Gambia 	Gambija	\N
00040000-559f-aaaa-c4ab-b6785e21d13b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559f-aaaa-b19e-50c9d169eb49	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559f-aaaa-99a9-e9398adc64bd	GH	GHA	288	Ghana 	Gana	\N
00040000-559f-aaaa-8dc3-1a244fb94de5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559f-aaaa-29ee-99cb08048444	GR	GRC	300	Greece 	Grčija	\N
00040000-559f-aaaa-eb12-c36b30160506	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559f-aaaa-513a-12ea031e8c2d	GD	GRD	308	Grenada 	Grenada	\N
00040000-559f-aaaa-40ea-c458296b9e7d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559f-aaaa-97bc-099c2bb4468a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559f-aaaa-9c05-8fe4fb085cf6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559f-aaaa-5fa4-0b3096a1d88a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559f-aaaa-ec13-8a562e925ee9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559f-aaaa-6417-189e66580d79	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559f-aaaa-b65f-a20cca70e3ff	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559f-aaaa-e69e-493479254a38	HT	HTI	332	Haiti 	Haiti	\N
00040000-559f-aaaa-5336-3fbae38e9729	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559f-aaaa-a823-951d8178d656	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559f-aaaa-92eb-290da9384432	HN	HND	340	Honduras 	Honduras	\N
00040000-559f-aaaa-c5a7-401c1dbf5bc5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559f-aaaa-06e7-6271668d98cf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559f-aaaa-e640-7e5430c4fd2f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559f-aaaa-e5ee-e32f87870d46	IN	IND	356	India 	Indija	\N
00040000-559f-aaaa-f104-c082b5e60940	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559f-aaaa-c14d-06bd1ecf9e72	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559f-aaaa-536d-131de3523c7b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559f-aaaa-e89b-35aaab28fd48	IE	IRL	372	Ireland 	Irska	\N
00040000-559f-aaaa-f034-d3d2c44dcea3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559f-aaaa-3fd2-580d43f55270	IL	ISR	376	Israel 	Izrael	\N
00040000-559f-aaaa-2ac1-e1bf8d575cb4	IT	ITA	380	Italy 	Italija	\N
00040000-559f-aaaa-84d2-68df01a09782	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559f-aaaa-3f5d-76b7dd304f28	JP	JPN	392	Japan 	Japonska	\N
00040000-559f-aaaa-2be9-428fa6b5be53	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559f-aaaa-c7a6-9d3563124f7b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559f-aaaa-fa0f-1b05eede4180	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559f-aaaa-ea6a-d5b83c8e77e1	KE	KEN	404	Kenya 	Kenija	\N
00040000-559f-aaaa-94cd-566d855ca3d8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559f-aaaa-48ec-f3e7b0371eca	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559f-aaaa-c4b0-03d53ef2988f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559f-aaaa-cd23-c749e4aa5b2a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559f-aaaa-f8cf-db7e3576c7ba	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559f-aaaa-f421-95ab47d331a6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559f-aaaa-d4cf-07e5908ed5c4	LV	LVA	428	Latvia 	Latvija	\N
00040000-559f-aaaa-ee85-fb5ca7d26d00	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559f-aaaa-0153-3574d410c71e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559f-aaaa-b72c-ce996f2a9b14	LR	LBR	430	Liberia 	Liberija	\N
00040000-559f-aaaa-a54a-d71374e3d832	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559f-aaaa-0d7c-c0362e397881	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559f-aaaa-ec23-2bf181bbf292	LT	LTU	440	Lithuania 	Litva	\N
00040000-559f-aaaa-246a-da62a6e62ebf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559f-aaaa-7658-e1d1b0671d3b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559f-aaaa-1aa9-5ea7832ad332	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559f-aaaa-e595-69e1d94637ac	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559f-aaaa-de80-2c9967f4f64a	MW	MWI	454	Malawi 	Malavi	\N
00040000-559f-aaaa-d5fa-9f09b3f161e6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559f-aaaa-e333-68432917608c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559f-aaaa-03d1-101279114c0f	ML	MLI	466	Mali 	Mali	\N
00040000-559f-aaaa-375e-ffd09af6fa6a	MT	MLT	470	Malta 	Malta	\N
00040000-559f-aaaa-a6b6-2e8dae0bd8f8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559f-aaaa-bdec-1e00e531e8b4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559f-aaaa-b68f-c9e421bf93b9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559f-aaaa-8d35-049bafd4945f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559f-aaaa-dfc1-83d185508d21	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559f-aaaa-3041-ac26f5497599	MX	MEX	484	Mexico 	Mehika	\N
00040000-559f-aaaa-471e-b170bf8ff265	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559f-aaaa-3ddc-68cfdc38479c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559f-aaaa-b138-6695b765edb6	MC	MCO	492	Monaco 	Monako	\N
00040000-559f-aaaa-db0a-6030513e2e85	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559f-aaaa-b78d-8564795d3fcc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559f-aaaa-ce01-7c9d308c17c6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559f-aaaa-c1d5-101f921323d3	MA	MAR	504	Morocco 	Maroko	\N
00040000-559f-aaaa-f8b3-47d06f095e6d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559f-aaaa-ff2f-ec41e6096a51	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559f-aaaa-ca7e-9393e3ea8ae6	NA	NAM	516	Namibia 	Namibija	\N
00040000-559f-aaaa-fc18-11730f0e9986	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559f-aaaa-8d45-cadea51a5de3	NP	NPL	524	Nepal 	Nepal	\N
00040000-559f-aaaa-fe8f-a8557f3e0918	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559f-aaaa-29f6-0459bb8350c0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559f-aaaa-20e7-215e4e286a9f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559f-aaaa-f16f-6dd0683c586c	NE	NER	562	Niger 	Niger 	\N
00040000-559f-aaaa-f425-13c2dad0ada1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559f-aaaa-b6ff-84ea8338b91f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559f-aaaa-f801-5a574f2b1c0c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559f-aaaa-8b54-1c953412da61	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559f-aaaa-61f0-34eb3cdc0cd5	NO	NOR	578	Norway 	Norveška	\N
00040000-559f-aaaa-6134-02ca63149781	OM	OMN	512	Oman 	Oman	\N
00040000-559f-aaaa-b189-ae7b840db675	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559f-aaaa-dd57-8452dfd4a3e3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559f-aaaa-8ad6-ed5c1ee5689e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559f-aaaa-d495-3fcb3a3f41bb	PA	PAN	591	Panama 	Panama	\N
00040000-559f-aaaa-a5e8-5427c4644301	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559f-aaaa-d9ff-17df7b8fab16	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559f-aaaa-502e-5c6f09b05dbb	PE	PER	604	Peru 	Peru	\N
00040000-559f-aaaa-0a49-9a2e113b4e8c	PH	PHL	608	Philippines 	Filipini	\N
00040000-559f-aaaa-3720-a1f9199cee4e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559f-aaaa-9b95-19ea8c8fd028	PL	POL	616	Poland 	Poljska	\N
00040000-559f-aaaa-5b95-f91345137388	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559f-aaaa-8675-dac50e8b952d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559f-aaaa-8c0a-9411b6fa205d	QA	QAT	634	Qatar 	Katar	\N
00040000-559f-aaaa-3afe-a0f38bdb4c78	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559f-aaaa-205d-6071d37b9805	RO	ROU	642	Romania 	Romunija	\N
00040000-559f-aaaa-1ac9-020abd8a3e4d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559f-aaaa-0b29-da9624f0917b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559f-aaaa-f0a7-89a1e53375d6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559f-aaaa-9935-924c73b930ba	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559f-aaaa-7aa1-f77b2437b5d0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559f-aaaa-46f7-908b001ad21a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559f-aaaa-150a-37c2c8e198d1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559f-aaaa-17b8-e74344873bda	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559f-aaaa-067e-2edf403d263f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559f-aaaa-e069-f823384208c9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559f-aaaa-9830-f8a2db6a489c	SM	SMR	674	San Marino 	San Marino	\N
00040000-559f-aaaa-a98a-1a52f6e2595a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559f-aaaa-4dd1-4861c084d974	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559f-aaaa-df3e-d5c4a9790278	SN	SEN	686	Senegal 	Senegal	\N
00040000-559f-aaaa-5e7d-c23c352481d2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559f-aaaa-a28f-a6dba9eff84c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559f-aaaa-7aa8-f41631534857	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559f-aaaa-de8c-6d2fbc843227	SG	SGP	702	Singapore 	Singapur	\N
00040000-559f-aaaa-da40-631f42367514	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559f-aaaa-db82-2e4d1c1066bc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559f-aaaa-4feb-de7fcc4968e2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559f-aaaa-e00f-faeae7eaa45e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559f-aaaa-cb3a-3dce4ed20586	SO	SOM	706	Somalia 	Somalija	\N
00040000-559f-aaaa-6de6-e2cd3c8d68d9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559f-aaaa-106c-a50651d675d1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559f-aaaa-bb55-8d181af9c95b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559f-aaaa-b06a-eb9bac29bab9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559f-aaaa-98a3-511976719af0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559f-aaaa-dcf6-18c8db80e10b	SD	SDN	729	Sudan 	Sudan	\N
00040000-559f-aaaa-42f2-2a06b4e861fe	SR	SUR	740	Suriname 	Surinam	\N
00040000-559f-aaaa-b5a9-9fc70045cc3e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559f-aaaa-ede7-b90fc4d277c7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559f-aaaa-d7b8-3edd95b47982	SE	SWE	752	Sweden 	Švedska	\N
00040000-559f-aaaa-a58e-a7753da90536	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559f-aaaa-0dde-2257b68e0f09	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559f-aaaa-8920-35957fb3973f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559f-aaaa-caf3-e56164bfaad0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559f-aaaa-d956-dea50efa1599	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559f-aaaa-2c99-8b8d9d374e82	TH	THA	764	Thailand 	Tajska	\N
00040000-559f-aaaa-d672-c2c35bb54c32	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559f-aaaa-210e-0fd9cc6c8927	TG	TGO	768	Togo 	Togo	\N
00040000-559f-aaaa-2b7e-732d68716f8a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559f-aaaa-26e8-1ffc10fcbf59	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559f-aaaa-c8c3-1dabbaaffceb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559f-aaaa-773d-4ec89553f2eb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559f-aaaa-b40d-c9bbb59c8012	TR	TUR	792	Turkey 	Turčija	\N
00040000-559f-aaaa-b7a6-7e7f454c910c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559f-aaaa-c84d-42ad45cbfa7b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-aaaa-6bc7-87a72a884d71	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559f-aaaa-414b-1787f35140cd	UG	UGA	800	Uganda 	Uganda	\N
00040000-559f-aaaa-90b5-b316f140c2fe	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559f-aaaa-d96f-7719c8e3df77	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559f-aaaa-5a99-b9ebf20b5f64	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559f-aaaa-26a1-9c6e3eaaee60	US	USA	840	United States 	Združene države Amerike	\N
00040000-559f-aaaa-e2f5-198aff03dc69	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559f-aaaa-8bbe-2f8cb109adad	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559f-aaaa-27ce-4224eb2f2561	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559f-aaaa-1070-af5ccc165eb9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559f-aaaa-4d9c-59480c0d065c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559f-aaaa-05a9-6ef69a0a661b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559f-aaaa-224e-9fadfde7a34b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559f-aaaa-0881-6bc92cd526e1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559f-aaaa-3425-b5550775df6f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559f-aaaa-4113-f645bf49d68c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559f-aaaa-1e51-4e50a2930825	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559f-aaaa-bf5c-3abfca8de99f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559f-aaaa-312d-fba04676985a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9716013)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559f-aaac-fc50-e887522fecfd	000e0000-559f-aaac-7af4-8bc2225768b9	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559f-aaab-afac-75e2dcbf503b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559f-aaac-b7af-c065745a484a	000e0000-559f-aaac-0d91-e5efe3199b95	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559f-aaab-dba3-75def3ddd5c5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9715841)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559f-aaac-e908-592a9617aab0	000e0000-559f-aaac-0d91-e5efe3199b95	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559f-aaab-32f5-c8af2fa9708e
000d0000-559f-aaac-6dcc-b203782daa11	000e0000-559f-aaac-0d91-e5efe3199b95	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-aaab-32f5-c8af2fa9708e
000d0000-559f-aaac-2fd3-7dd71570c658	000e0000-559f-aaac-0d91-e5efe3199b95	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559f-aaab-ade1-87b1bf4ba3b0
000d0000-559f-aaac-b676-5829b2a20483	000e0000-559f-aaac-0d91-e5efe3199b95	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559f-aaab-cfe5-919d0ed583b9
000d0000-559f-aaac-96ff-c76cac08650e	000e0000-559f-aaac-0d91-e5efe3199b95	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559f-aaab-cfe5-919d0ed583b9
000d0000-559f-aaac-b30b-1b79796e7755	000e0000-559f-aaac-0d91-e5efe3199b95	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559f-aaab-cfe5-919d0ed583b9
000d0000-559f-aaac-72dc-5a0f2c9958d7	000e0000-559f-aaac-0d91-e5efe3199b95	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559f-aaab-32f5-c8af2fa9708e
000d0000-559f-aaac-c76b-19b91267d436	000e0000-559f-aaac-0d91-e5efe3199b95	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559f-aaab-2aa0-fd623336d56b
\.


--
-- TOC entry 2870 (class 0 OID 9715661)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9715709)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9715641)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559f-aaac-a4d0-f76614897096	00080000-559f-aaac-dfc5-1c9e7776c176	00090000-559f-aaac-a46b-1274d29d7fd7	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9715758)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9715783)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9715598)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559f-aaab-0a6c-2667f6a995f4	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559f-aaab-9e8c-43cb8e60569d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559f-aaab-19ee-015ca4b23191	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559f-aaab-b1aa-027914b9bc05	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559f-aaab-1200-17fb17c61ca3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559f-aaab-3de6-3820792d5c45	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559f-aaab-b22e-325bba1b109c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559f-aaab-7156-b235d427e672	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-aaab-0594-12fe1e64be3a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559f-aaab-466b-d2b822188adc	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559f-aaab-2f8a-fe839714789f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559f-aaab-4d69-dec51841c5e3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559f-aaab-b156-4f9689c7adfb	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559f-aaac-69b3-29266ebc83ad	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559f-aaac-a5a8-3e3aee8080bf	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559f-aaac-8b1a-2ccae0109bc1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559f-aaac-1880-efb09698b4ef	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559f-aaac-edbd-2d9a16f274d2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559f-aaac-969d-07fa1945484d	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9715511)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559f-aaac-1fd9-3ec087a2bd9e	00000000-559f-aaac-a5a8-3e3aee8080bf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559f-aaac-3272-19f4c3a6c5e0	00000000-559f-aaac-a5a8-3e3aee8080bf	00010000-559f-aaab-9468-7bea32688cf3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559f-aaac-0fa2-e6d163ffc432	00000000-559f-aaac-8b1a-2ccae0109bc1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9715522)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559f-aaac-aeeb-1393397ddbe8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559f-aaac-31c6-959abb9c6ef1	00010000-559f-aaac-e613-66664fa33efc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559f-aaac-0b86-316d0c44d10b	00010000-559f-aaac-32f7-f3c946356d86	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559f-aaac-fcc1-420ba0ae0538	00010000-559f-aaac-0845-0e0a8204e6c6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559f-aaac-a121-19b32e9d1e4a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559f-aaac-0598-75ef7d7c2371	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559f-aaac-4765-a241d3348d70	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559f-aaac-f8d0-5fbdc0d0e739	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559f-aaac-a46b-1274d29d7fd7	00010000-559f-aaac-8cbc-f8be17ecc7ff	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559f-aaac-7467-d0b29d83e5a8	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559f-aaac-997d-1a2f8a2025b9	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559f-aaac-5b14-4f70389c174b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559f-aaac-442f-04dbc5e6a625	00010000-559f-aaac-c1e3-e81a33cd7fb2	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9715476)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559f-aaab-948b-ab537d6a5091	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559f-aaab-0bcb-90515cf4e78a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559f-aaab-36ab-47543ab7ce8f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559f-aaab-53bb-f0ee30f3f7d8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559f-aaab-2c9b-613cfff9674f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559f-aaab-61ce-fa4589e9893b	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559f-aaab-d961-bb177cf107ac	Abonma-read	Abonma - branje	f
00030000-559f-aaab-e80b-b61c303533df	Abonma-write	Abonma - spreminjanje	f
00030000-559f-aaab-34de-f0492cbd8501	Alternacija-read	Alternacija - branje	f
00030000-559f-aaab-61cb-116e0c2a5e6d	Alternacija-write	Alternacija - spreminjanje	f
00030000-559f-aaab-df98-6fba651a0f0f	Arhivalija-read	Arhivalija - branje	f
00030000-559f-aaab-4d4b-8660c14554d5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559f-aaab-b349-fea903048432	Besedilo-read	Besedilo - branje	f
00030000-559f-aaab-7397-b9a6ba50a049	Besedilo-write	Besedilo - spreminjanje	f
00030000-559f-aaab-9575-9bce67970a0e	DogodekIzven-read	DogodekIzven - branje	f
00030000-559f-aaab-aa98-f78254353eb4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559f-aaab-d0f4-980e41148eb4	Dogodek-read	Dogodek - branje	f
00030000-559f-aaab-6b9d-146021c083b1	Dogodek-write	Dogodek - spreminjanje	f
00030000-559f-aaab-f124-6df9b320fec6	DrugiVir-read	DrugiVir - branje	f
00030000-559f-aaab-7756-d3e68299611c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559f-aaab-adf4-4a632b629556	Drzava-read	Drzava - branje	f
00030000-559f-aaab-7445-e20c547a6284	Drzava-write	Drzava - spreminjanje	f
00030000-559f-aaab-91a4-2f1c52a9860c	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559f-aaab-b6a4-0917d6f8f962	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559f-aaab-900e-5df6abd9ebf7	Funkcija-read	Funkcija - branje	f
00030000-559f-aaab-6305-a92be01b902d	Funkcija-write	Funkcija - spreminjanje	f
00030000-559f-aaab-221d-fc8c013353cb	Gostovanje-read	Gostovanje - branje	f
00030000-559f-aaab-1158-5fb8855170d3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559f-aaab-d3ac-ae690256bd7f	Gostujoca-read	Gostujoca - branje	f
00030000-559f-aaab-b346-b2eb52aca945	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559f-aaab-d12b-b19c16bc860b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559f-aaab-fc85-84dadcef1b8f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559f-aaab-e3cd-202f24b58f8c	Kupec-read	Kupec - branje	f
00030000-559f-aaab-f735-6e0c57b7cda5	Kupec-write	Kupec - spreminjanje	f
00030000-559f-aaab-8b35-384ade7cb846	NacinPlacina-read	NacinPlacina - branje	f
00030000-559f-aaab-1f70-31f81d25ab64	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559f-aaab-4a3d-cda56532c554	Option-read	Option - branje	f
00030000-559f-aaab-ed84-4d4d943fb9a2	Option-write	Option - spreminjanje	f
00030000-559f-aaab-abb4-8d82b28a7012	OptionValue-read	OptionValue - branje	f
00030000-559f-aaab-7a90-ed29ab3f7730	OptionValue-write	OptionValue - spreminjanje	f
00030000-559f-aaab-fb67-3a3af3c77f87	Oseba-read	Oseba - branje	f
00030000-559f-aaab-9a1b-3fdda021f7f8	Oseba-write	Oseba - spreminjanje	f
00030000-559f-aaab-e08f-8345bdb10519	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559f-aaab-d602-d82e0190f370	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559f-aaab-0f3f-a7aaac8bff20	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559f-aaab-0939-4033fc89ff63	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559f-aaab-cb48-8aa98a1c25c8	Pogodba-read	Pogodba - branje	f
00030000-559f-aaab-befc-a33fb1ece6c3	Pogodba-write	Pogodba - spreminjanje	f
00030000-559f-aaab-de24-ff52c8d597ef	Popa-read	Popa - branje	f
00030000-559f-aaab-505f-4035d8bb1387	Popa-write	Popa - spreminjanje	f
00030000-559f-aaab-7b0c-b2f464acebd8	Posta-read	Posta - branje	f
00030000-559f-aaab-a11b-de0c610dd870	Posta-write	Posta - spreminjanje	f
00030000-559f-aaab-f65d-7a3aad7bcb3f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559f-aaab-b779-2b122e1c438d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559f-aaab-7227-746c05f722ac	PostniNaslov-read	PostniNaslov - branje	f
00030000-559f-aaab-5951-3e42566d45a8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559f-aaab-761f-7f6844486aa6	Predstava-read	Predstava - branje	f
00030000-559f-aaab-3693-7817f49c3ca2	Predstava-write	Predstava - spreminjanje	f
00030000-559f-aaab-f449-f213c4f5c567	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559f-aaab-7558-7eec61f4cec7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559f-aaab-b4fb-73c52bdd274b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559f-aaab-35a3-af5ceae3bd69	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559f-aaab-2339-cea51d799d40	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559f-aaab-312c-911c4942669f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559f-aaab-114b-2d8873374117	ProgramDela-read	ProgramDela - branje	f
00030000-559f-aaab-75c1-533a1588f1bf	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559f-aaab-c7f8-5f709fa11d7f	ProgramFestival-read	ProgramFestival - branje	f
00030000-559f-aaab-a7e1-3fab7e349cfd	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559f-aaab-7183-44c182003bbe	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559f-aaab-27c6-264a51344b60	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559f-aaab-04ae-04359095e1f2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559f-aaab-53d9-d2d125dea4d9	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559f-aaab-9e52-8a3fe4b19816	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559f-aaab-a8b2-e9734ce04e25	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559f-aaab-2e3b-17ba1647cec9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559f-aaab-f091-a5c46b4326f0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559f-aaab-5ec8-02588c7881d2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559f-aaab-0053-295ee728418a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559f-aaab-6533-4532dc18ecd7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559f-aaab-ab5a-ea47474e7633	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559f-aaab-fbd2-2ba038109dd3	ProgramRazno-read	ProgramRazno - branje	f
00030000-559f-aaab-0798-f3602b00b65a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559f-aaab-08a1-94f307d6f9e9	Prostor-read	Prostor - branje	f
00030000-559f-aaab-480d-9cf48b5d05a7	Prostor-write	Prostor - spreminjanje	f
00030000-559f-aaab-5150-00a791d86353	Racun-read	Racun - branje	f
00030000-559f-aaab-56ce-87ef47b6e6aa	Racun-write	Racun - spreminjanje	f
00030000-559f-aaab-b5dd-7ef90d4b2150	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559f-aaab-4c9d-2527ac1fdd12	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559f-aaab-3ed2-b181f2995120	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559f-aaab-b44e-07f513708be3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559f-aaab-a22e-2189422e031b	Rekvizit-read	Rekvizit - branje	f
00030000-559f-aaab-062a-99c954715349	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559f-aaab-e7fc-52b03bb90188	Revizija-read	Revizija - branje	f
00030000-559f-aaab-9c49-3d2340027851	Revizija-write	Revizija - spreminjanje	f
00030000-559f-aaab-a195-65bd2591611b	Rezervacija-read	Rezervacija - branje	f
00030000-559f-aaab-8901-47cec20a1546	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559f-aaab-fd81-419bec171b17	SedezniRed-read	SedezniRed - branje	f
00030000-559f-aaab-dae7-4f0c6b09a340	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559f-aaab-caa8-bb23ca4cec12	Sedez-read	Sedez - branje	f
00030000-559f-aaab-1630-293774d9acba	Sedez-write	Sedez - spreminjanje	f
00030000-559f-aaab-64b6-024685d3d82e	Sezona-read	Sezona - branje	f
00030000-559f-aaab-67c3-e270473b199c	Sezona-write	Sezona - spreminjanje	f
00030000-559f-aaab-8202-0b18b2cf1626	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559f-aaab-1bc3-48856d302110	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559f-aaab-56f4-a2a30b8b35e4	Stevilcenje-read	Stevilcenje - branje	f
00030000-559f-aaab-4ba2-f5a4ec2534e3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559f-aaab-acbd-29a8519dbcee	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559f-aaab-6d6a-6ac75516e642	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559f-aaab-29f9-e32978982dcd	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559f-aaab-6f35-c3673534a450	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559f-aaab-0267-2a39c0761f86	Telefonska-read	Telefonska - branje	f
00030000-559f-aaab-54d9-9f7048ec47f3	Telefonska-write	Telefonska - spreminjanje	f
00030000-559f-aaab-5ecd-e9e4f210884b	TerminStoritve-read	TerminStoritve - branje	f
00030000-559f-aaab-586a-41710c29e082	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559f-aaab-014c-04cbfd47edb9	TipFunkcije-read	TipFunkcije - branje	f
00030000-559f-aaab-7a77-ccc6742c06c5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559f-aaab-5e8c-70beca4edb6b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559f-aaab-40fc-5a9d6de3a785	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559f-aaab-ecd0-d383782cb2f6	Trr-read	Trr - branje	f
00030000-559f-aaab-94d9-0a36064082a7	Trr-write	Trr - spreminjanje	f
00030000-559f-aaab-f8b5-9ab7f921fde0	Uprizoritev-read	Uprizoritev - branje	f
00030000-559f-aaab-acb3-158019542f25	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559f-aaab-3ed3-2506530724bd	Vaja-read	Vaja - branje	f
00030000-559f-aaab-091b-93a7ca7a0d9a	Vaja-write	Vaja - spreminjanje	f
00030000-559f-aaab-0d62-509e1bc51396	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559f-aaab-a054-1490c3263b42	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559f-aaab-7d7d-ff2cf24bc606	Zaposlitev-read	Zaposlitev - branje	f
00030000-559f-aaab-d002-7a73c4354b5b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559f-aaab-b24a-c4f284b8ebf7	Zasedenost-read	Zasedenost - branje	f
00030000-559f-aaab-046d-2b42259442ba	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559f-aaab-9a69-c8e61e327b83	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559f-aaab-8ae4-41cbbe2da08a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559f-aaab-2ab9-1bcaf4713184	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559f-aaab-9917-28aad5f271b6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9715495)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559f-aaab-6803-742e13a075f3	00030000-559f-aaab-0bcb-90515cf4e78a
00020000-559f-aaab-6081-993efc6ff9f7	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-e80b-b61c303533df
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-34de-f0492cbd8501
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-61cb-116e0c2a5e6d
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-53bb-f0ee30f3f7d8
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-6b9d-146021c083b1
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-7445-e20c547a6284
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-900e-5df6abd9ebf7
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-6305-a92be01b902d
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-1158-5fb8855170d3
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-b346-b2eb52aca945
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-d12b-b19c16bc860b
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-fc85-84dadcef1b8f
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-fb67-3a3af3c77f87
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-9a1b-3fdda021f7f8
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-505f-4035d8bb1387
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-a11b-de0c610dd870
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-7227-746c05f722ac
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-5951-3e42566d45a8
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-3693-7817f49c3ca2
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-2339-cea51d799d40
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-312c-911c4942669f
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-480d-9cf48b5d05a7
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-b44e-07f513708be3
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-062a-99c954715349
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-67c3-e270473b199c
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-014c-04cbfd47edb9
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-f8b5-9ab7f921fde0
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-acb3-158019542f25
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-3ed3-2506530724bd
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-091b-93a7ca7a0d9a
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-b24a-c4f284b8ebf7
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-046d-2b42259442ba
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaab-6a94-122f28eebfc9	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-d12b-b19c16bc860b
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-fc85-84dadcef1b8f
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-fb67-3a3af3c77f87
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-9a1b-3fdda021f7f8
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-7227-746c05f722ac
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-5951-3e42566d45a8
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-0267-2a39c0761f86
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-54d9-9f7048ec47f3
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-ecd0-d383782cb2f6
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-94d9-0a36064082a7
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-7d7d-ff2cf24bc606
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-d002-7a73c4354b5b
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaab-d9d8-e76fd51245c2	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-34de-f0492cbd8501
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-4d4b-8660c14554d5
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-b349-fea903048432
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-9575-9bce67970a0e
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-900e-5df6abd9ebf7
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-d12b-b19c16bc860b
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-fb67-3a3af3c77f87
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-2339-cea51d799d40
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-014c-04cbfd47edb9
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-3ed3-2506530724bd
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-b24a-c4f284b8ebf7
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaab-be1b-efdc50938b08	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-e80b-b61c303533df
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-61cb-116e0c2a5e6d
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-014c-04cbfd47edb9
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaab-18d7-1a87b56663d4	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-5ecd-e9e4f210884b
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-36ab-47543ab7ce8f
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-014c-04cbfd47edb9
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaab-80a0-e51c92441db0	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-948b-ab537d6a5091
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0bcb-90515cf4e78a
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-36ab-47543ab7ce8f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-53bb-f0ee30f3f7d8
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-2c9b-613cfff9674f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-61ce-fa4589e9893b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d961-bb177cf107ac
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-e80b-b61c303533df
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-34de-f0492cbd8501
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-61cb-116e0c2a5e6d
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-df98-6fba651a0f0f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-4d4b-8660c14554d5
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b349-fea903048432
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7397-b9a6ba50a049
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9575-9bce67970a0e
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-aa98-f78254353eb4
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d0f4-980e41148eb4
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-6b9d-146021c083b1
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-adf4-4a632b629556
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7445-e20c547a6284
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-91a4-2f1c52a9860c
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b6a4-0917d6f8f962
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-900e-5df6abd9ebf7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-6305-a92be01b902d
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-221d-fc8c013353cb
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-1158-5fb8855170d3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d3ac-ae690256bd7f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b346-b2eb52aca945
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d12b-b19c16bc860b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-fc85-84dadcef1b8f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-e3cd-202f24b58f8c
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-f735-6e0c57b7cda5
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-8b35-384ade7cb846
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-1f70-31f81d25ab64
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-4a3d-cda56532c554
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-ed84-4d4d943fb9a2
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-abb4-8d82b28a7012
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7a90-ed29ab3f7730
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-fb67-3a3af3c77f87
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9a1b-3fdda021f7f8
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-e08f-8345bdb10519
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d602-d82e0190f370
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0f3f-a7aaac8bff20
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0939-4033fc89ff63
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-cb48-8aa98a1c25c8
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-befc-a33fb1ece6c3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-de24-ff52c8d597ef
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-505f-4035d8bb1387
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7b0c-b2f464acebd8
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a11b-de0c610dd870
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-f65d-7a3aad7bcb3f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b779-2b122e1c438d
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7227-746c05f722ac
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-5951-3e42566d45a8
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-761f-7f6844486aa6
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-3693-7817f49c3ca2
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-f449-f213c4f5c567
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7558-7eec61f4cec7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b4fb-73c52bdd274b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-35a3-af5ceae3bd69
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-2339-cea51d799d40
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-312c-911c4942669f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-114b-2d8873374117
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-75c1-533a1588f1bf
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-c7f8-5f709fa11d7f
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a7e1-3fab7e349cfd
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7183-44c182003bbe
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-27c6-264a51344b60
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-04ae-04359095e1f2
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-53d9-d2d125dea4d9
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9e52-8a3fe4b19816
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a8b2-e9734ce04e25
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-2e3b-17ba1647cec9
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-f091-a5c46b4326f0
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-5ec8-02588c7881d2
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0053-295ee728418a
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-6533-4532dc18ecd7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-ab5a-ea47474e7633
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-fbd2-2ba038109dd3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0798-f3602b00b65a
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-08a1-94f307d6f9e9
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-480d-9cf48b5d05a7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-5150-00a791d86353
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-56ce-87ef47b6e6aa
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b5dd-7ef90d4b2150
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-4c9d-2527ac1fdd12
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-3ed2-b181f2995120
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b44e-07f513708be3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a22e-2189422e031b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-062a-99c954715349
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-e7fc-52b03bb90188
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9c49-3d2340027851
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a195-65bd2591611b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-8901-47cec20a1546
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-fd81-419bec171b17
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-dae7-4f0c6b09a340
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-caa8-bb23ca4cec12
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-1630-293774d9acba
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-64b6-024685d3d82e
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-67c3-e270473b199c
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-8202-0b18b2cf1626
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-1bc3-48856d302110
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-56f4-a2a30b8b35e4
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-4ba2-f5a4ec2534e3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-acbd-29a8519dbcee
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-6d6a-6ac75516e642
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-29f9-e32978982dcd
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-6f35-c3673534a450
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0267-2a39c0761f86
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-54d9-9f7048ec47f3
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-5ecd-e9e4f210884b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-586a-41710c29e082
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-014c-04cbfd47edb9
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7a77-ccc6742c06c5
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-5e8c-70beca4edb6b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-40fc-5a9d6de3a785
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-ecd0-d383782cb2f6
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-94d9-0a36064082a7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-f8b5-9ab7f921fde0
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-acb3-158019542f25
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-3ed3-2506530724bd
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-091b-93a7ca7a0d9a
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-0d62-509e1bc51396
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-a054-1490c3263b42
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-7d7d-ff2cf24bc606
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-d002-7a73c4354b5b
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-b24a-c4f284b8ebf7
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-046d-2b42259442ba
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9a69-c8e61e327b83
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-8ae4-41cbbe2da08a
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-2ab9-1bcaf4713184
00020000-559f-aaac-6ff0-b93214c26d37	00030000-559f-aaab-9917-28aad5f271b6
\.


--
-- TOC entry 2885 (class 0 OID 9715790)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9715821)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9715934)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559f-aaac-765c-657f862cdcd5	00090000-559f-aaac-aeeb-1393397ddbe8	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559f-aaac-0b85-79ed28b6f683	00090000-559f-aaac-0598-75ef7d7c2371	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559f-aaac-b3bc-e02e862ac4ac	00090000-559f-aaac-442f-04dbc5e6a625	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9715555)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559f-aaac-dfc5-1c9e7776c176	00040000-559f-aaaa-4feb-de7fcc4968e2	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-28ae-bbceadb578e8	00040000-559f-aaaa-4feb-de7fcc4968e2	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559f-aaac-51e3-3b8d41aa9810	00040000-559f-aaaa-4feb-de7fcc4968e2	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-7a7c-882e57b38edf	00040000-559f-aaaa-4feb-de7fcc4968e2	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-03f4-126a415693c0	00040000-559f-aaaa-4feb-de7fcc4968e2	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-eef8-aa47fe4b85fe	00040000-559f-aaaa-3de6-992aa34e13d8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-1f8f-a4fceed072b6	00040000-559f-aaaa-3af8-f77edcd20711	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-d1fb-99355e579593	00040000-559f-aaaa-0fd4-cc7d75ac9d8f	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559f-aaac-34f3-cde442a4e1f7	00040000-559f-aaaa-4feb-de7fcc4968e2	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9715590)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559f-aaab-3e54-e0f8b3882f11	8341	Adlešiči
00050000-559f-aaab-b088-f3f65a16513d	5270	Ajdovščina
00050000-559f-aaab-1951-2e14536ca70e	6280	Ankaran/Ancarano
00050000-559f-aaab-ecaf-668f8b2c410b	9253	Apače
00050000-559f-aaab-d999-b83e07574122	8253	Artiče
00050000-559f-aaab-cc8b-ae9badd0b709	4275	Begunje na Gorenjskem
00050000-559f-aaab-4576-2552a99ec4c8	1382	Begunje pri Cerknici
00050000-559f-aaab-5bd4-3c16bf349f7f	9231	Beltinci
00050000-559f-aaab-02f4-05e66c085764	2234	Benedikt
00050000-559f-aaab-36a1-baf2de3532cf	2345	Bistrica ob Dravi
00050000-559f-aaab-5366-5097d5d48229	3256	Bistrica ob Sotli
00050000-559f-aaab-1964-7794e3c0f35e	8259	Bizeljsko
00050000-559f-aaab-1edb-9699410ebd32	1223	Blagovica
00050000-559f-aaab-080a-890539482a93	8283	Blanca
00050000-559f-aaab-e2f4-43081136d461	4260	Bled
00050000-559f-aaab-89eb-031b974d2d47	4273	Blejska Dobrava
00050000-559f-aaab-3c57-e3681944eef1	9265	Bodonci
00050000-559f-aaab-b8d7-593c69ac81b7	9222	Bogojina
00050000-559f-aaab-9c01-ea2bc25d9f69	4263	Bohinjska Bela
00050000-559f-aaab-e268-b73c17d26daf	4264	Bohinjska Bistrica
00050000-559f-aaab-73a8-d6899dfdbd6a	4265	Bohinjsko jezero
00050000-559f-aaab-90e1-295a9b4215f0	1353	Borovnica
00050000-559f-aaab-3d3f-99f3af9be9e0	8294	Boštanj
00050000-559f-aaab-bd8e-1a5b7dd17b9b	5230	Bovec
00050000-559f-aaab-7840-b0ad05b88062	5295	Branik
00050000-559f-aaab-8667-553e17bb3aac	3314	Braslovče
00050000-559f-aaab-d052-c89ffa0510f4	5223	Breginj
00050000-559f-aaab-4b49-329279a1d15f	8280	Brestanica
00050000-559f-aaab-2df5-e9a835a4b03d	2354	Bresternica
00050000-559f-aaab-bb27-af2e57141be5	4243	Brezje
00050000-559f-aaab-065e-3b07e307bf30	1351	Brezovica pri Ljubljani
00050000-559f-aaab-1836-9f6a682b3736	8250	Brežice
00050000-559f-aaab-8e25-c6076507575a	4210	Brnik - Aerodrom
00050000-559f-aaab-c164-26df2db17faa	8321	Brusnice
00050000-559f-aaab-17fc-7969df279cd5	3255	Buče
00050000-559f-aaab-4c6d-01fc5b1a3ae9	8276	Bučka 
00050000-559f-aaab-2ff5-ebdc3c166860	9261	Cankova
00050000-559f-aaab-87fd-50816654fa3a	3000	Celje 
00050000-559f-aaab-989b-6522d4ff383c	3001	Celje - poštni predali
00050000-559f-aaab-582a-2e47d97bf1b4	4207	Cerklje na Gorenjskem
00050000-559f-aaab-2a16-e1a762a3b8fc	8263	Cerklje ob Krki
00050000-559f-aaab-dc5b-f81facd9d6f4	1380	Cerknica
00050000-559f-aaab-4922-b6cd84952cc0	5282	Cerkno
00050000-559f-aaab-ee00-2187c9ec2303	2236	Cerkvenjak
00050000-559f-aaab-8a75-0ccb767f0538	2215	Ceršak
00050000-559f-aaab-9248-7d4c262aa892	2326	Cirkovce
00050000-559f-aaab-4633-67f424ce4d61	2282	Cirkulane
00050000-559f-aaab-aae4-568af5afddd2	5273	Col
00050000-559f-aaab-5bad-7436b05ac97e	8251	Čatež ob Savi
00050000-559f-aaab-3a26-b1d2389e0e13	1413	Čemšenik
00050000-559f-aaab-30d2-14fc81c10960	5253	Čepovan
00050000-559f-aaab-fd23-f4356defb4c8	9232	Črenšovci
00050000-559f-aaab-32a8-680c9229ef65	2393	Črna na Koroškem
00050000-559f-aaab-f12a-a11494da3a59	6275	Črni Kal
00050000-559f-aaab-c4c2-79f52ba0f28e	5274	Črni Vrh nad Idrijo
00050000-559f-aaab-69af-9f87306cc93c	5262	Črniče
00050000-559f-aaab-d4ed-1b46543ea44c	8340	Črnomelj
00050000-559f-aaab-697b-b77d26affe96	6271	Dekani
00050000-559f-aaab-4016-0fd919fc6734	5210	Deskle
00050000-559f-aaab-b0a9-f2fc26d90e32	2253	Destrnik
00050000-559f-aaab-82c5-ba1e6c0a0efe	6215	Divača
00050000-559f-aaab-0c54-8e662b8cd4eb	1233	Dob
00050000-559f-aaab-9c36-8b25d365007d	3224	Dobje pri Planini
00050000-559f-aaab-08be-3898aa6b05f6	8257	Dobova
00050000-559f-aaab-9ebc-a97941396ee8	1423	Dobovec
00050000-559f-aaab-66c4-bb010a6de8b1	5263	Dobravlje
00050000-559f-aaab-ff68-2582a3061089	3204	Dobrna
00050000-559f-aaab-4c0a-4d1ddfbb2d49	8211	Dobrnič
00050000-559f-aaab-ed21-0b6c6dc7b5b3	1356	Dobrova
00050000-559f-aaab-9a1f-3e318f4bb6fb	9223	Dobrovnik/Dobronak 
00050000-559f-aaab-2360-05e99e0c5cc7	5212	Dobrovo v Brdih
00050000-559f-aaab-13b8-c6893f71faf1	1431	Dol pri Hrastniku
00050000-559f-aaab-96d2-6950b2d7a107	1262	Dol pri Ljubljani
00050000-559f-aaab-29aa-8c8fcb7b8072	1273	Dole pri Litiji
00050000-559f-aaab-9de9-e64e46538473	1331	Dolenja vas
00050000-559f-aaab-b27e-d4614b2962eb	8350	Dolenjske Toplice
00050000-559f-aaab-bc82-9210f9be5cd4	1230	Domžale
00050000-559f-aaab-5113-5f7980a84a7a	2252	Dornava
00050000-559f-aaab-e3cf-e0daa16df125	5294	Dornberk
00050000-559f-aaab-8bd8-82401561616c	1319	Draga
00050000-559f-aaab-f412-4df205963d0a	8343	Dragatuš
00050000-559f-aaab-8efe-4d6c60c4b5e8	3222	Dramlje
00050000-559f-aaab-ce96-fb2fc2c441ab	2370	Dravograd
00050000-559f-aaab-a478-59d43ddd1050	4203	Duplje
00050000-559f-aaab-b975-896b55b595a6	6221	Dutovlje
00050000-559f-aaab-763c-93be8ebe32c4	8361	Dvor
00050000-559f-aaab-5edd-4c86ec864087	2343	Fala
00050000-559f-aaab-aa77-aba8baff49cd	9208	Fokovci
00050000-559f-aaab-e872-5ebaba21cac9	2313	Fram
00050000-559f-aaab-81e5-ef18ac2aa835	3213	Frankolovo
00050000-559f-aaab-f11e-c91c277a0c6a	1274	Gabrovka
00050000-559f-aaab-5f18-d11a5feed980	8254	Globoko
00050000-559f-aaab-be88-7a24a6f1700a	5275	Godovič
00050000-559f-aaab-09ea-3aef6ddc41fa	4204	Golnik
00050000-559f-aaab-c4f6-116877e62c83	3303	Gomilsko
00050000-559f-aaab-2aeb-4ce65b664ea7	4224	Gorenja vas
00050000-559f-aaab-8e9d-8f27a996ffd4	3263	Gorica pri Slivnici
00050000-559f-aaab-1d11-b27c15780d21	2272	Gorišnica
00050000-559f-aaab-f0db-0eb46f578f2d	9250	Gornja Radgona
00050000-559f-aaab-fabb-72e11be2d0af	3342	Gornji Grad
00050000-559f-aaab-c6f6-c8aabdedb14f	4282	Gozd Martuljek
00050000-559f-aaab-a3b1-9b811485d33a	6272	Gračišče
00050000-559f-aaab-0efc-378be0c2ea56	9264	Grad
00050000-559f-aaab-4a33-19a2b68c481a	8332	Gradac
00050000-559f-aaab-4161-b8bbaabc2f33	1384	Grahovo
00050000-559f-aaab-ebb3-bcf8cf60b976	5242	Grahovo ob Bači
00050000-559f-aaab-efa2-30e8d0cbdd8f	5251	Grgar
00050000-559f-aaab-afb0-88f0ba1f84c0	3302	Griže
00050000-559f-aaab-6130-c2a0329aa5e1	3231	Grobelno
00050000-559f-aaab-ec2a-bf7adda6b0e3	1290	Grosuplje
00050000-559f-aaab-da77-85d5bd2fdff6	2288	Hajdina
00050000-559f-aaab-3712-4c8c57cca47c	8362	Hinje
00050000-559f-aaab-c637-fbf02a540574	2311	Hoče
00050000-559f-aaab-0dbe-1a00fdbf911e	9205	Hodoš/Hodos
00050000-559f-aaab-8619-2dfe512d2035	1354	Horjul
00050000-559f-aaab-70e3-def172c71f0d	1372	Hotedršica
00050000-559f-aaab-4be3-07146f339e5d	1430	Hrastnik
00050000-559f-aaab-565f-9720380e1fa2	6225	Hruševje
00050000-559f-aaab-5f0d-9bc45e28845e	4276	Hrušica
00050000-559f-aaab-01cb-4d897c138ed4	5280	Idrija
00050000-559f-aaab-e4f3-29363cdeb077	1292	Ig
00050000-559f-aaab-6e8e-30c2eec4f459	6250	Ilirska Bistrica
00050000-559f-aaab-c5c4-a584c7ef02d0	6251	Ilirska Bistrica-Trnovo
00050000-559f-aaab-441d-5058fc9856f7	1295	Ivančna Gorica
00050000-559f-aaab-59c8-fa905d79e118	2259	Ivanjkovci
00050000-559f-aaab-4d92-33b3e3e7f658	1411	Izlake
00050000-559f-aaab-64c3-4ef20cb2f1d9	6310	Izola/Isola
00050000-559f-aaab-79ab-f0c359107273	2222	Jakobski Dol
00050000-559f-aaab-a621-b3f2d7c7b8eb	2221	Jarenina
00050000-559f-aaab-b36c-c40ce2a23e7e	6254	Jelšane
00050000-559f-aaab-d22d-721e4da94a74	4270	Jesenice
00050000-559f-aaab-08ec-26007f5c629e	8261	Jesenice na Dolenjskem
00050000-559f-aaab-13aa-03716d89274a	3273	Jurklošter
00050000-559f-aaab-4827-e2700dffccbf	2223	Jurovski Dol
00050000-559f-aaab-2322-82cbbd4618df	2256	Juršinci
00050000-559f-aaab-aeb3-be4d63256bb3	5214	Kal nad Kanalom
00050000-559f-aaab-4a25-7f48a9aa82dc	3233	Kalobje
00050000-559f-aaab-09c1-287248cbc193	4246	Kamna Gorica
00050000-559f-aaab-47f0-a8b8c9d720e1	2351	Kamnica
00050000-559f-aaab-a97f-3c8c1970a7c3	1241	Kamnik
00050000-559f-aaab-8484-74ed368f5985	5213	Kanal
00050000-559f-aaab-5a9d-27de4f9f8bb8	8258	Kapele
00050000-559f-aaab-3cc6-10c830a626fd	2362	Kapla
00050000-559f-aaab-5b53-dcf3eee1c91f	2325	Kidričevo
00050000-559f-aaab-caf9-c34bb08cb378	1412	Kisovec
00050000-559f-aaab-9a02-03545883e96e	6253	Knežak
00050000-559f-aaab-b20d-f74500b69c84	5222	Kobarid
00050000-559f-aaab-e4fc-ef5d5bea1dd7	9227	Kobilje
00050000-559f-aaab-0002-084b9b74d442	1330	Kočevje
00050000-559f-aaab-c466-7aa282e23ae4	1338	Kočevska Reka
00050000-559f-aaab-2398-9239041f0efd	2276	Kog
00050000-559f-aaab-e6a4-d6c4073f1d6b	5211	Kojsko
00050000-559f-aaab-d732-c5d5c853b852	6223	Komen
00050000-559f-aaab-5527-8f01d9795862	1218	Komenda
00050000-559f-aaab-1f6c-a4aa24602c1b	6000	Koper/Capodistria 
00050000-559f-aaab-5891-f0e477a170a3	6001	Koper/Capodistria - poštni predali
00050000-559f-aaab-ea74-7d432b871038	8282	Koprivnica
00050000-559f-aaab-edb7-7d49dbe92222	5296	Kostanjevica na Krasu
00050000-559f-aaab-3505-cc558738c8d0	8311	Kostanjevica na Krki
00050000-559f-aaab-6e55-f1c52ea6b6e5	1336	Kostel
00050000-559f-aaab-f920-7ca9c8957e6f	6256	Košana
00050000-559f-aaab-52b4-1115c7cf334b	2394	Kotlje
00050000-559f-aaab-87eb-558f47a761fb	6240	Kozina
00050000-559f-aaab-199b-544fe03c38fb	3260	Kozje
00050000-559f-aaab-f71a-cb0b1b247d2f	4000	Kranj 
00050000-559f-aaab-6216-67aec676d12c	4001	Kranj - poštni predali
00050000-559f-aaab-883e-8b27ecc181c6	4280	Kranjska Gora
00050000-559f-aaab-97c0-d19092060e9e	1281	Kresnice
00050000-559f-aaab-164b-e6a16d3ea816	4294	Križe
00050000-559f-aaab-814d-884287ecae6e	9206	Križevci
00050000-559f-aaab-27f4-15293bc7df82	9242	Križevci pri Ljutomeru
00050000-559f-aaab-731f-35460e94a715	1301	Krka
00050000-559f-aaab-37f0-56c2a90ba981	8296	Krmelj
00050000-559f-aaab-5bea-77d30434474b	4245	Kropa
00050000-559f-aaab-a42c-0d3964fc3ebe	8262	Krška vas
00050000-559f-aaab-bced-b454fb592dde	8270	Krško
00050000-559f-aaab-a915-7845115b0d90	9263	Kuzma
00050000-559f-aaab-6f89-42e8d1e77e93	2318	Laporje
00050000-559f-aaab-60a7-587438a6bcdc	3270	Laško
00050000-559f-aaab-c2eb-387b010f9d2e	1219	Laze v Tuhinju
00050000-559f-aaab-1910-55476e26652a	2230	Lenart v Slovenskih goricah
00050000-559f-aaab-5523-dc37e5dedd35	9220	Lendava/Lendva
00050000-559f-aaab-1dc5-08f823fd71f0	4248	Lesce
00050000-559f-aaab-f867-4b9f2cb215dc	3261	Lesično
00050000-559f-aaab-9927-59c2e1a43c5c	8273	Leskovec pri Krškem
00050000-559f-aaab-34ef-704d836f1f24	2372	Libeliče
00050000-559f-aaab-39dc-102000a7a72e	2341	Limbuš
00050000-559f-aaab-b6e8-de49af60fca4	1270	Litija
00050000-559f-aaab-fd29-c4a857d71331	3202	Ljubečna
00050000-559f-aaab-653b-803f57533dec	1000	Ljubljana 
00050000-559f-aaab-6fc1-910331e04957	1001	Ljubljana - poštni predali
00050000-559f-aaab-53c7-1bedb53744b6	1231	Ljubljana - Črnuče
00050000-559f-aaab-9f41-efef0aca7017	1261	Ljubljana - Dobrunje
00050000-559f-aaab-3f6b-4d4190eaa150	1260	Ljubljana - Polje
00050000-559f-aaab-21c7-4bbc948ba814	1210	Ljubljana - Šentvid
00050000-559f-aaab-935c-8f68c3da35b5	1211	Ljubljana - Šmartno
00050000-559f-aaab-6559-02891ee50107	3333	Ljubno ob Savinji
00050000-559f-aaab-2f52-f4468a968fbc	9240	Ljutomer
00050000-559f-aaab-5aff-2758b27f4eed	3215	Loče
00050000-559f-aaab-81d4-6dcdd4c0b337	5231	Log pod Mangartom
00050000-559f-aaab-afa6-d2156d49d20e	1358	Log pri Brezovici
00050000-559f-aaab-763d-3381eefc601d	1370	Logatec
00050000-559f-aaab-cd85-9fc790826ef2	1371	Logatec
00050000-559f-aaab-df4e-e46c9a743032	1434	Loka pri Zidanem Mostu
00050000-559f-aaab-37c6-cbd42ece4c20	3223	Loka pri Žusmu
00050000-559f-aaab-3b7a-ffca57608f5f	6219	Lokev
00050000-559f-aaab-e768-320df4a33126	1318	Loški Potok
00050000-559f-aaab-557f-094813c848ea	2324	Lovrenc na Dravskem polju
00050000-559f-aaab-9a19-654e6908ed59	2344	Lovrenc na Pohorju
00050000-559f-aaab-a47d-6f6e20d3bbbc	3334	Luče
00050000-559f-aaab-5b58-061079ee54cd	1225	Lukovica
00050000-559f-aaab-7a70-79f53efa40f7	9202	Mačkovci
00050000-559f-aaab-96a1-d51c7e452231	2322	Majšperk
00050000-559f-aaab-0cf2-b00a37ec6af3	2321	Makole
00050000-559f-aaab-e1ed-d57da3858007	9243	Mala Nedelja
00050000-559f-aaab-e09e-a00192746e93	2229	Malečnik
00050000-559f-aaab-6c9c-55ec5e2510dc	6273	Marezige
00050000-559f-aaab-2021-b11c0e92a13c	2000	Maribor 
00050000-559f-aaab-e986-b2c89a85f62d	2001	Maribor - poštni predali
00050000-559f-aaab-ae0e-b2f15be52fbe	2206	Marjeta na Dravskem polju
00050000-559f-aaab-0ad3-3c6b8fca9017	2281	Markovci
00050000-559f-aaab-2d60-8e9827c5fb92	9221	Martjanci
00050000-559f-aaab-bbe1-76d712841631	6242	Materija
00050000-559f-aaab-079e-128bfdbbdd23	4211	Mavčiče
00050000-559f-aaab-3881-4de54cc99730	1215	Medvode
00050000-559f-aaab-48c5-fa1c87562fba	1234	Mengeš
00050000-559f-aaab-0117-561b59614e55	8330	Metlika
00050000-559f-aaab-1168-e2be360451ce	2392	Mežica
00050000-559f-aaab-5165-629c68c97b05	2204	Miklavž na Dravskem polju
00050000-559f-aaab-7655-c00aec8db158	2275	Miklavž pri Ormožu
00050000-559f-aaab-3323-8b307671e1bb	5291	Miren
00050000-559f-aaab-2d72-eeeabc96c5b4	8233	Mirna
00050000-559f-aaab-9612-f3a6d131e78b	8216	Mirna Peč
00050000-559f-aaab-d163-4de62c71b215	2382	Mislinja
00050000-559f-aaab-2868-184c52f366f3	4281	Mojstrana
00050000-559f-aaab-68fc-ae3e4f59f462	8230	Mokronog
00050000-559f-aaab-6870-e4cf0710b190	1251	Moravče
00050000-559f-aaab-dcf9-f21ca844460f	9226	Moravske Toplice
00050000-559f-aaab-85ae-736defd72c8e	5216	Most na Soči
00050000-559f-aaab-e852-8028acc87797	1221	Motnik
00050000-559f-aaab-94ee-cd927feef03b	3330	Mozirje
00050000-559f-aaab-cf0a-957d135ff7c3	9000	Murska Sobota 
00050000-559f-aaab-7ce0-2ced0330a950	9001	Murska Sobota - poštni predali
00050000-559f-aaab-7523-83e45379156b	2366	Muta
00050000-559f-aaab-5cea-72c77f64fbd0	4202	Naklo
00050000-559f-aaab-a180-6b6d111d9da2	3331	Nazarje
00050000-559f-aaab-0f3f-aa3e3d8497e7	1357	Notranje Gorice
00050000-559f-aaab-4c9c-8e67cca73513	3203	Nova Cerkev
00050000-559f-aaab-7728-15143b17753f	5000	Nova Gorica 
00050000-559f-aaab-6cd5-0df2d898fde4	5001	Nova Gorica - poštni predali
00050000-559f-aaab-6b99-2da27bc5aeda	1385	Nova vas
00050000-559f-aaab-2fdf-536bbf2104ff	8000	Novo mesto
00050000-559f-aaab-17ec-b5524268e549	8001	Novo mesto - poštni predali
00050000-559f-aaab-b69f-7650d9094b77	6243	Obrov
00050000-559f-aaab-78bf-e05f3a28a467	9233	Odranci
00050000-559f-aaab-9261-0efa253d83e8	2317	Oplotnica
00050000-559f-aaab-9e2c-f6784931d2e4	2312	Orehova vas
00050000-559f-aaab-62aa-70190b70bd66	2270	Ormož
00050000-559f-aaab-7b1d-5a1f95336b7f	1316	Ortnek
00050000-559f-aaab-2cbf-d300c1331ee1	1337	Osilnica
00050000-559f-aaab-0652-d384edbc48a7	8222	Otočec
00050000-559f-aaab-a69e-617fcdc4f91d	2361	Ožbalt
00050000-559f-aaab-b17f-b0954a4a6dc3	2231	Pernica
00050000-559f-aaab-2bef-f20e8153ded1	2211	Pesnica pri Mariboru
00050000-559f-aaab-05d2-9f97d6c2720e	9203	Petrovci
00050000-559f-aaab-005e-10740b4e2d70	3301	Petrovče
00050000-559f-aaab-e33f-0660f506da00	6330	Piran/Pirano
00050000-559f-aaab-faf0-5852e0f25eba	8255	Pišece
00050000-559f-aaab-e033-dccb0ec62d73	6257	Pivka
00050000-559f-aaab-ee09-21e4e10ba978	6232	Planina
00050000-559f-aaab-8078-6598a4c4684f	3225	Planina pri Sevnici
00050000-559f-aaab-c7c7-6b2481b117ce	6276	Pobegi
00050000-559f-aaab-0f77-56156add1322	8312	Podbočje
00050000-559f-aaab-779a-e4499a9948e8	5243	Podbrdo
00050000-559f-aaab-7867-836c4bbbede9	3254	Podčetrtek
00050000-559f-aaab-568d-cf025a67b292	2273	Podgorci
00050000-559f-aaab-8621-c740e40c83cb	6216	Podgorje
00050000-559f-aaab-27ff-fb1ab90713f2	2381	Podgorje pri Slovenj Gradcu
00050000-559f-aaab-b311-84fa40a23767	6244	Podgrad
00050000-559f-aaab-51b7-e98a2fa53a9b	1414	Podkum
00050000-559f-aaab-adb4-e8dc493e4e90	2286	Podlehnik
00050000-559f-aaab-240a-f44a7eaf7fb2	5272	Podnanos
00050000-559f-aaab-23c0-fa824524d6ab	4244	Podnart
00050000-559f-aaab-d178-82b1ba2efb1d	3241	Podplat
00050000-559f-aaab-7e08-02417bc79524	3257	Podsreda
00050000-559f-aaab-02db-8ffabb7fdfbf	2363	Podvelka
00050000-559f-aaab-797f-b727d0df9041	2208	Pohorje
00050000-559f-aaab-e79e-a470ba2cd944	2257	Polenšak
00050000-559f-aaab-f880-33588c5be655	1355	Polhov Gradec
00050000-559f-aaab-d454-277054554bb3	4223	Poljane nad Škofjo Loko
00050000-559f-aaab-fac4-da6ef852c654	2319	Poljčane
00050000-559f-aaab-5f4a-5082b846e68b	1272	Polšnik
00050000-559f-aaab-8bf1-db07048e8277	3313	Polzela
00050000-559f-aaab-17c9-d217b4fdb41a	3232	Ponikva
00050000-559f-aaab-e513-b50170cc3e3d	6320	Portorož/Portorose
00050000-559f-aaab-80ae-3fa0d5bb1091	6230	Postojna
00050000-559f-aaab-11f6-957caacfd35f	2331	Pragersko
00050000-559f-aaab-2155-1e02d2be3813	3312	Prebold
00050000-559f-aaab-1452-e4410d5d6636	4205	Preddvor
00050000-559f-aaab-6634-fb6a0dd7c9b0	6255	Prem
00050000-559f-aaab-548b-7b773d93139e	1352	Preserje
00050000-559f-aaab-c5aa-8e7fc0a838db	6258	Prestranek
00050000-559f-aaab-6e0d-64e2a116845f	2391	Prevalje
00050000-559f-aaab-957b-127501687b86	3262	Prevorje
00050000-559f-aaab-f37f-31c14ce3eafc	1276	Primskovo 
00050000-559f-aaab-f248-613a868d3083	3253	Pristava pri Mestinju
00050000-559f-aaab-7233-8afde0de0bc7	9207	Prosenjakovci/Partosfalva
00050000-559f-aaab-97c4-10ec116bf123	5297	Prvačina
00050000-559f-aaab-9f41-bebdee5306c3	2250	Ptuj
00050000-559f-aaab-97f4-51e39f473b90	2323	Ptujska Gora
00050000-559f-aaab-da66-9890a90736cc	9201	Puconci
00050000-559f-aaab-c484-305851754915	2327	Rače
00050000-559f-aaab-2b70-d32c13ec84ee	1433	Radeče
00050000-559f-aaab-a766-2dc9cf83c621	9252	Radenci
00050000-559f-aaab-9438-e2d9b3876eab	2360	Radlje ob Dravi
00050000-559f-aaab-bcf5-7fc73559226f	1235	Radomlje
00050000-559f-aaab-0420-e1c82842bb03	4240	Radovljica
00050000-559f-aaab-9fed-5ff2b4ad8a6e	8274	Raka
00050000-559f-aaab-0cfa-baca7df78023	1381	Rakek
00050000-559f-aaab-65b4-6740710a1345	4283	Rateče - Planica
00050000-559f-aaab-1738-a1ce4f3788d5	2390	Ravne na Koroškem
00050000-559f-aaab-2342-420ff1c2944f	9246	Razkrižje
00050000-559f-aaab-bc87-9e7752f2e3ed	3332	Rečica ob Savinji
00050000-559f-aaab-856e-52de22e22757	5292	Renče
00050000-559f-aaab-5d67-59861107defb	1310	Ribnica
00050000-559f-aaab-f69e-da7b729da9c0	2364	Ribnica na Pohorju
00050000-559f-aaab-fda8-bb4449712b30	3272	Rimske Toplice
00050000-559f-aaab-1f76-8b69fb4320e4	1314	Rob
00050000-559f-aaab-98b8-e8868eba1266	5215	Ročinj
00050000-559f-aaab-63ab-148d762fff47	3250	Rogaška Slatina
00050000-559f-aaab-7c49-d112dfe72bb9	9262	Rogašovci
00050000-559f-aaab-064c-30a6f3298545	3252	Rogatec
00050000-559f-aaab-e356-93be60f8c666	1373	Rovte
00050000-559f-aaab-380e-6af2fbeddd67	2342	Ruše
00050000-559f-aaab-07aa-7d146124c6cf	1282	Sava
00050000-559f-aaab-d31c-6d269d9829dd	6333	Sečovlje/Sicciole
00050000-559f-aaab-970c-625d86112604	4227	Selca
00050000-559f-aaab-36ed-910c2f69c962	2352	Selnica ob Dravi
00050000-559f-aaab-9524-44d8894f8fc0	8333	Semič
00050000-559f-aaab-be7f-de30f5a8acfa	8281	Senovo
00050000-559f-aaab-648b-082fecc873a5	6224	Senožeče
00050000-559f-aaab-5bd7-ee300dd456c6	8290	Sevnica
00050000-559f-aaab-3833-84a79639614f	6210	Sežana
00050000-559f-aaab-f58d-7125debf1462	2214	Sladki Vrh
00050000-559f-aaab-cc1a-73314dda96cd	5283	Slap ob Idrijci
00050000-559f-aaab-60f1-7108969f4eac	2380	Slovenj Gradec
00050000-559f-aaab-95fc-dff48a1f4b0a	2310	Slovenska Bistrica
00050000-559f-aaab-ff78-bf371048e0a5	3210	Slovenske Konjice
00050000-559f-aaab-f9fe-942e0897d041	1216	Smlednik
00050000-559f-aaab-4e0c-38c0138b6ee2	5232	Soča
00050000-559f-aaab-cae7-9e92e262be1f	1317	Sodražica
00050000-559f-aaab-165c-b2baaba06456	3335	Solčava
00050000-559f-aaab-9da2-4e100c15f86f	5250	Solkan
00050000-559f-aaab-220a-3e409cd473f7	4229	Sorica
00050000-559f-aaab-8909-76617cd334ac	4225	Sovodenj
00050000-559f-aaab-bac0-66dc037ea19a	5281	Spodnja Idrija
00050000-559f-aaab-8a90-e83c55ef78aa	2241	Spodnji Duplek
00050000-559f-aaab-0c3f-aa45d8851351	9245	Spodnji Ivanjci
00050000-559f-aaab-d6c4-99331cebc797	2277	Središče ob Dravi
00050000-559f-aaab-0b5d-54fbddde2357	4267	Srednja vas v Bohinju
00050000-559f-aaab-9701-5cf3049794e8	8256	Sromlje 
00050000-559f-aaab-cc37-082271d6a9a5	5224	Srpenica
00050000-559f-aaab-0ebf-60377c87c7f3	1242	Stahovica
00050000-559f-aaab-d920-1003e312f3c3	1332	Stara Cerkev
00050000-559f-aaab-1805-b7f7a65d419e	8342	Stari trg ob Kolpi
00050000-559f-aaab-2276-3d9316047d7f	1386	Stari trg pri Ložu
00050000-559f-aaab-f8cb-15f10bb2359c	2205	Starše
00050000-559f-aaab-274e-18d2bb929378	2289	Stoperce
00050000-559f-aaab-7960-cf6582759ee3	8322	Stopiče
00050000-559f-aaab-7cf5-d1dba98e3337	3206	Stranice
00050000-559f-aaab-795b-08ca2900f162	8351	Straža
00050000-559f-aaab-f31f-cbe8981a67d2	1313	Struge
00050000-559f-aaab-25ac-51eb668a9007	8293	Studenec
00050000-559f-aaab-6c30-953c5178db9a	8331	Suhor
00050000-559f-aaab-ea16-4c248418622e	2233	Sv. Ana v Slovenskih goricah
00050000-559f-aaab-3fd5-414e58261cff	2235	Sv. Trojica v Slovenskih goricah
00050000-559f-aaab-80d7-b1a0e70ff21f	2353	Sveti Duh na Ostrem Vrhu
00050000-559f-aaab-8171-60f594a73da2	9244	Sveti Jurij ob Ščavnici
00050000-559f-aaab-4861-5913d530007e	3264	Sveti Štefan
00050000-559f-aaab-0b87-90f0fcbb41cd	2258	Sveti Tomaž
00050000-559f-aaab-30b9-7c901b916ac4	9204	Šalovci
00050000-559f-aaab-8801-4413cd942555	5261	Šempas
00050000-559f-aaab-f71e-7dbcbf0eb704	5290	Šempeter pri Gorici
00050000-559f-aaab-6a23-e86d61b6a509	3311	Šempeter v Savinjski dolini
00050000-559f-aaab-e6f8-d322037150de	4208	Šenčur
00050000-559f-aaab-929a-1c5207000cb1	2212	Šentilj v Slovenskih goricah
00050000-559f-aaab-badb-602479decf34	8297	Šentjanž
00050000-559f-aaab-3043-574de7a92e54	2373	Šentjanž pri Dravogradu
00050000-559f-aaab-0b22-b7915fd1dce6	8310	Šentjernej
00050000-559f-aaab-6a02-d1d5d453a86e	3230	Šentjur
00050000-559f-aaab-47b6-23b69906fdb5	3271	Šentrupert
00050000-559f-aaab-a2f0-d76d48556964	8232	Šentrupert
00050000-559f-aaab-5760-9638333f46f1	1296	Šentvid pri Stični
00050000-559f-aaab-c5a2-f96687aecf49	8275	Škocjan
00050000-559f-aaab-bf77-8b57a679262d	6281	Škofije
00050000-559f-aaab-970a-0fb4873f353d	4220	Škofja Loka
00050000-559f-aaab-7efa-d9fca871a5df	3211	Škofja vas
00050000-559f-aaab-1a6d-c9cc7ba87c17	1291	Škofljica
00050000-559f-aaab-8e71-9001ebfe3270	6274	Šmarje
00050000-559f-aaab-74bf-cd36e1381569	1293	Šmarje - Sap
00050000-559f-aaab-6521-2d79251f3cb3	3240	Šmarje pri Jelšah
00050000-559f-aaab-3209-446ab38562b6	8220	Šmarješke Toplice
00050000-559f-aaab-9be9-645ea19e2948	2315	Šmartno na Pohorju
00050000-559f-aaab-e374-77edc5c08bb9	3341	Šmartno ob Dreti
00050000-559f-aaab-c3b1-2b938b034f89	3327	Šmartno ob Paki
00050000-559f-aaab-3a19-8ebd47a6f27d	1275	Šmartno pri Litiji
00050000-559f-aaab-6be3-f8330795f5f0	2383	Šmartno pri Slovenj Gradcu
00050000-559f-aaab-ee0a-fc68cd4e5b73	3201	Šmartno v Rožni dolini
00050000-559f-aaab-2883-9295b1cd0386	3325	Šoštanj
00050000-559f-aaab-b691-c0f91fbf6699	6222	Štanjel
00050000-559f-aaab-27e3-de0e76c9b85d	3220	Štore
00050000-559f-aaab-a1b6-5d941e4a73a6	3304	Tabor
00050000-559f-aaab-ab21-00671eda74d3	3221	Teharje
00050000-559f-aaab-0040-7fdcfa7430b6	9251	Tišina
00050000-559f-aaab-b96f-500ce38e9cb4	5220	Tolmin
00050000-559f-aaab-121a-8910bf044c49	3326	Topolšica
00050000-559f-aaab-0224-1abf11edbe7a	2371	Trbonje
00050000-559f-aaab-2c57-34c9f9fe0b2d	1420	Trbovlje
00050000-559f-aaab-5c2c-63c8e1724d02	8231	Trebelno 
00050000-559f-aaab-c471-d8d16d5848f6	8210	Trebnje
00050000-559f-aaab-08b1-d2822413ec0e	5252	Trnovo pri Gorici
00050000-559f-aaab-bb90-ee4b680325a6	2254	Trnovska vas
00050000-559f-aaab-ccc6-89943abd4bd4	1222	Trojane
00050000-559f-aaab-72b9-6c6e8b4ebdc8	1236	Trzin
00050000-559f-aaab-a7e3-75c130c01fa2	4290	Tržič
00050000-559f-aaab-cf5e-60c9f7e02fee	8295	Tržišče
00050000-559f-aaab-f520-a31cb75b66f2	1311	Turjak
00050000-559f-aaab-2569-33c42ae6f0bc	9224	Turnišče
00050000-559f-aaab-f017-098fc1468dac	8323	Uršna sela
00050000-559f-aaab-91e5-a85af60397e9	1252	Vače
00050000-559f-aaab-11f6-30fb437d10e1	3320	Velenje 
00050000-559f-aaab-fe61-e96a6847ec34	3322	Velenje - poštni predali
00050000-559f-aaab-d09d-a61c91a086fb	8212	Velika Loka
00050000-559f-aaab-6e28-51fa705bd059	2274	Velika Nedelja
00050000-559f-aaab-862f-e0c02cd14703	9225	Velika Polana
00050000-559f-aaab-44f3-48527637c19e	1315	Velike Lašče
00050000-559f-aaab-17f8-fdc01c5621e3	8213	Veliki Gaber
00050000-559f-aaab-60f1-8c1c552bad04	9241	Veržej
00050000-559f-aaab-0998-ec29c8709882	1312	Videm - Dobrepolje
00050000-559f-aaab-f0f5-15af8b7ae62b	2284	Videm pri Ptuju
00050000-559f-aaab-33ed-96d8ba627c20	8344	Vinica
00050000-559f-aaab-4dbf-b6f5518d94c8	5271	Vipava
00050000-559f-aaab-ecdb-31a8522b76bc	4212	Visoko
00050000-559f-aaab-8884-a38aaa074fe8	1294	Višnja Gora
00050000-559f-aaab-189e-24395f3a6ea1	3205	Vitanje
00050000-559f-aaab-570d-844cdf1c7291	2255	Vitomarci
00050000-559f-aaab-4644-3eb52ebd99ca	1217	Vodice
00050000-559f-aaab-c970-a2c64afa9e02	3212	Vojnik\t
00050000-559f-aaab-215f-d8dbbe24c687	5293	Volčja Draga
00050000-559f-aaab-4563-0e742224be36	2232	Voličina
00050000-559f-aaab-57b4-986879680b44	3305	Vransko
00050000-559f-aaab-0ae8-6dd802645369	6217	Vremski Britof
00050000-559f-aaab-68f5-4ba70f9461be	1360	Vrhnika
00050000-559f-aaab-1463-526a61dceac5	2365	Vuhred
00050000-559f-aaab-8f55-ee86160d6740	2367	Vuzenica
00050000-559f-aaab-3a4f-32637760acbd	8292	Zabukovje 
00050000-559f-aaab-a6ad-7632ce1e200d	1410	Zagorje ob Savi
00050000-559f-aaab-ccf7-5ba5017a2461	1303	Zagradec
00050000-559f-aaab-840c-6a59ecf718a9	2283	Zavrč
00050000-559f-aaab-a92c-6a2193558068	8272	Zdole 
00050000-559f-aaab-85e9-48027fd79c8c	4201	Zgornja Besnica
00050000-559f-aaab-67ad-32b6b712b3ed	2242	Zgornja Korena
00050000-559f-aaab-cd7d-1447a02072f6	2201	Zgornja Kungota
00050000-559f-aaab-c917-46f9ea0037ea	2316	Zgornja Ložnica
00050000-559f-aaab-a7eb-b33db8c456f8	2314	Zgornja Polskava
00050000-559f-aaab-d2bf-e3ddaaa1a797	2213	Zgornja Velka
00050000-559f-aaab-4f44-42e51af49c3e	4247	Zgornje Gorje
00050000-559f-aaab-2733-0bf74cbb7d03	4206	Zgornje Jezersko
00050000-559f-aaab-0c6f-2eb4d5aa3d96	2285	Zgornji Leskovec
00050000-559f-aaab-8ea8-2e548b0e295a	1432	Zidani Most
00050000-559f-aaab-69d6-b0f922b7ac1c	3214	Zreče
00050000-559f-aaab-c68c-414bbe29e90d	4209	Žabnica
00050000-559f-aaab-a6bd-b7e5f5a54c49	3310	Žalec
00050000-559f-aaab-6680-a28675e897ea	4228	Železniki
00050000-559f-aaab-5cc7-4d8614ce3673	2287	Žetale
00050000-559f-aaab-2ad3-4cf96aee78c8	4226	Žiri
00050000-559f-aaab-7139-74ad7a592925	4274	Žirovnica
00050000-559f-aaab-9be6-4f38694c3d67	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9715764)
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
-- TOC entry 2863 (class 0 OID 9715575)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9715653)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9715776)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9716083)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9716094)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559f-aaac-5418-705c57a1d1f6	00080000-559f-aaac-34f3-cde442a4e1f7	0900	AK
00190000-559f-aaac-6c7b-bb5424ee8b69	00080000-559f-aaac-51e3-3b8d41aa9810	0987	AK
00190000-559f-aaac-aace-151d5e38367e	00080000-559f-aaac-28ae-bbceadb578e8	0989	AK
00190000-559f-aaac-0563-56f62964eee7	00080000-559f-aaac-7a7c-882e57b38edf	0986	AK
00190000-559f-aaac-752e-d78239364d65	00080000-559f-aaac-eef8-aa47fe4b85fe	0984	AK
00190000-559f-aaac-12cc-46c825ad2e1f	00080000-559f-aaac-1f8f-a4fceed072b6	0983	AK
00190000-559f-aaac-3a7d-783c1644ee0e	00080000-559f-aaac-d1fb-99355e579593	0982	AK
\.


--
-- TOC entry 2905 (class 0 OID 9716064)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559f-aaac-eb42-429dea04d586	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2887 (class 0 OID 9715805)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559f-aaac-93ba-49d7b274f84f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559f-aaac-e5d4-2ec64a223018	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559f-aaac-e044-fd5e08db301d	0003	Kazinska	t	84	Kazinska dvorana
00220000-559f-aaac-67dd-bfd3cdc47760	0004	Mali oder	t	24	Mali oder 
00220000-559f-aaac-5e39-c9c5085eee53	0005	Komorni oder	t	15	Komorni oder
00220000-559f-aaac-7e36-61974948ac58	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559f-aaac-1f67-78e9bfb69f41	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9715749)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9715739)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9715923)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9715873)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9715447)
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
-- TOC entry 2888 (class 0 OID 9715815)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9715485)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559f-aaab-6803-742e13a075f3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559f-aaab-6081-993efc6ff9f7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559f-aaab-af8b-64b411b97b47	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559f-aaab-61fb-a333ace886dd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559f-aaab-6a94-122f28eebfc9	planer	Planer dogodkov v koledarju	t
00020000-559f-aaab-d9d8-e76fd51245c2	kadrovska	Kadrovska služba	t
00020000-559f-aaab-be1b-efdc50938b08	arhivar	Ažuriranje arhivalij	t
00020000-559f-aaab-18d7-1a87b56663d4	igralec	Igralec	t
00020000-559f-aaab-80a0-e51c92441db0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559f-aaac-6ff0-b93214c26d37	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9715469)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559f-aaab-9468-7bea32688cf3	00020000-559f-aaab-af8b-64b411b97b47
00010000-559f-aaab-02d4-3f35a1e2d237	00020000-559f-aaab-af8b-64b411b97b47
00010000-559f-aaac-aaa4-fcec8ae9ad4f	00020000-559f-aaac-6ff0-b93214c26d37
\.


--
-- TOC entry 2890 (class 0 OID 9715829)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9715770)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9715720)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9716133)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559f-aaab-31a6-69cc57991ed5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559f-aaab-983d-8b7bcf2ec10b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559f-aaab-c4fe-8adcb20cbd36	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559f-aaab-a2a1-0c741ad83c89	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559f-aaab-df7d-83572190f52e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9716125)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559f-aaab-efc4-f5ce94d9aee5	00230000-559f-aaab-a2a1-0c741ad83c89	popa
00240000-559f-aaab-bd92-eaa2788f1f3c	00230000-559f-aaab-a2a1-0c741ad83c89	oseba
00240000-559f-aaab-ef3a-1674fce35f1f	00230000-559f-aaab-983d-8b7bcf2ec10b	prostor
00240000-559f-aaab-2a49-dfe1d9a7ceb7	00230000-559f-aaab-a2a1-0c741ad83c89	besedilo
00240000-559f-aaab-6348-2fe3e47e4b14	00230000-559f-aaab-a2a1-0c741ad83c89	uprizoritev
00240000-559f-aaab-f7bc-cd50f6f83d78	00230000-559f-aaab-a2a1-0c741ad83c89	funkcija
00240000-559f-aaab-ab4a-d471e8d1c72a	00230000-559f-aaab-a2a1-0c741ad83c89	tipfunkcije
00240000-559f-aaab-d5fa-1786a7f6d8de	00230000-559f-aaab-a2a1-0c741ad83c89	alternacija
00240000-559f-aaab-56e4-ae03621f01ea	00230000-559f-aaab-31a6-69cc57991ed5	pogodba
00240000-559f-aaab-c811-d62290d07332	00230000-559f-aaab-a2a1-0c741ad83c89	zaposlitev
00240000-559f-aaab-cce2-20620b4bf202	00230000-559f-aaab-31a6-69cc57991ed5	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9716120)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9715883)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559f-aaac-fdb8-6803feb6dd61	000e0000-559f-aaac-0d91-e5efe3199b95	00080000-559f-aaac-dfc5-1c9e7776c176	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559f-aaac-556c-eb7c258ac3ef	000e0000-559f-aaac-0d91-e5efe3199b95	00080000-559f-aaac-dfc5-1c9e7776c176	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559f-aaac-8237-193bfc1e4c4f	000e0000-559f-aaac-0d91-e5efe3199b95	00080000-559f-aaac-03f4-126a415693c0	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9715547)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9715726)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559f-aaac-8ac4-4c6ffe3850a4	00180000-559f-aaac-2464-92fe398e9d11	000c0000-559f-aaac-44ea-4ff2f3369a02	00090000-559f-aaac-a46b-1274d29d7fd7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559f-aaac-0a3a-60bb65ea2396	00180000-559f-aaac-2464-92fe398e9d11	000c0000-559f-aaac-0f18-755d4b4b5bf3	00090000-559f-aaac-7467-d0b29d83e5a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559f-aaac-257e-198ed6bcbb30	00180000-559f-aaac-2464-92fe398e9d11	000c0000-559f-aaac-00c6-cc45d6bfed36	00090000-559f-aaac-0b86-316d0c44d10b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559f-aaac-6809-ab59b6df9b14	00180000-559f-aaac-2464-92fe398e9d11	000c0000-559f-aaac-37b1-3fcc7c10c10d	00090000-559f-aaac-31c6-959abb9c6ef1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559f-aaac-7d66-ab1d36a3be81	00180000-559f-aaac-2464-92fe398e9d11	000c0000-559f-aaac-34d1-be602b67aa50	00090000-559f-aaac-5b14-4f70389c174b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559f-aaac-739a-53ba9ab49774	00180000-559f-aaac-5b58-8ef9a390f769	\N	00090000-559f-aaac-5b14-4f70389c174b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9715912)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559f-aaab-32f5-c8af2fa9708e	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559f-aaab-136c-b24e15fc1cb2	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559f-aaab-ee1c-849ee6c096d2	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559f-aaab-ade1-87b1bf4ba3b0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559f-aaab-eaf6-3677d9aa62eb	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559f-aaab-5881-0e8ad405d873	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559f-aaab-a0c4-c83e9355d5f2	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559f-aaab-56da-f87cef757ac3	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559f-aaab-83e2-0dd62901aef0	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559f-aaab-6d24-73445826eba8	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559f-aaab-aec6-a792fb513be9	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559f-aaab-2aa0-fd623336d56b	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559f-aaab-f0db-86d7941c20ab	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559f-aaab-9b42-fa84044f8b46	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559f-aaab-d2ae-64b19e91deff	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559f-aaab-cfe5-919d0ed583b9	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9716102)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559f-aaab-afac-75e2dcbf503b	01	Velika predstava	f	1.00	1.00
002b0000-559f-aaab-dba3-75def3ddd5c5	02	Mala predstava	f	0.50	0.50
002b0000-559f-aaab-19b6-d45f5ff0506d	03	Mala koprodukcija	t	0.40	1.00
002b0000-559f-aaab-5d87-ce5e36cd3143	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559f-aaab-2151-8f16debdfc55	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9715610)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9715456)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559f-aaab-02d4-3f35a1e2d237	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROzwKbm8jidT9DOcObdYeOsh9s4lJl46a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559f-aaac-32f7-f3c946356d86	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559f-aaac-e613-66664fa33efc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559f-aaac-8cbc-f8be17ecc7ff	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559f-aaac-c1e3-e81a33cd7fb2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559f-aaac-0845-0e0a8204e6c6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559f-aaac-4681-2a2e3b96da0c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559f-aaac-ebaf-372a33047bf6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559f-aaac-a4d7-a4c24eaa285c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559f-aaac-da17-c1d5e6177b69	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559f-aaac-aaa4-fcec8ae9ad4f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559f-aaab-9468-7bea32688cf3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9715960)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559f-aaac-7af4-8bc2225768b9	00160000-559f-aaac-24e0-3db88e67e8b5	00150000-559f-aaab-3716-118f700915aa	00140000-559f-aaaa-9d66-ad58420bcb31	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559f-aaac-5e39-c9c5085eee53
000e0000-559f-aaac-0d91-e5efe3199b95	00160000-559f-aaac-2d04-79921976a999	00150000-559f-aaab-9d71-fda44087fab5	00140000-559f-aaaa-41f6-b8e3cf7f6caa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559f-aaac-7e36-61974948ac58
000e0000-559f-aaac-f98d-7ec6387492e1	\N	00150000-559f-aaab-9d71-fda44087fab5	00140000-559f-aaaa-41f6-b8e3cf7f6caa	00190000-559f-aaac-6c7b-bb5424ee8b69	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559f-aaac-5e39-c9c5085eee53
000e0000-559f-aaac-a014-2dd07a875fae	\N	00150000-559f-aaab-9d71-fda44087fab5	00140000-559f-aaaa-41f6-b8e3cf7f6caa	00190000-559f-aaac-6c7b-bb5424ee8b69	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559f-aaac-5e39-c9c5085eee53
000e0000-559f-aaac-c89e-a2fbb1ac66e7	\N	00150000-559f-aaab-9d71-fda44087fab5	00140000-559f-aaaa-41f6-b8e3cf7f6caa	00190000-559f-aaac-6c7b-bb5424ee8b69	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559f-aaac-93ba-49d7b274f84f
\.


--
-- TOC entry 2871 (class 0 OID 9715672)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559f-aaac-212c-3a47b899bb9f	000e0000-559f-aaac-0d91-e5efe3199b95	1	
00200000-559f-aaac-b3b8-e757b507faf9	000e0000-559f-aaac-0d91-e5efe3199b95	2	
\.


--
-- TOC entry 2886 (class 0 OID 9715797)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9715866)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9715704)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9715950)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559f-aaaa-9d66-ad58420bcb31	01	Drama	drama (SURS 01)
00140000-559f-aaaa-c215-53b29cbf9618	02	Opera	opera (SURS 02)
00140000-559f-aaaa-da80-f4369e6d2ddd	03	Balet	balet (SURS 03)
00140000-559f-aaaa-af40-6f877bb2eff7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559f-aaaa-a26f-22232b07f97b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559f-aaaa-41f6-b8e3cf7f6caa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559f-aaaa-221b-502b45a101f7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9715856)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559f-aaab-40e7-0ef4bfbc719b	01	Opera	opera
00150000-559f-aaab-e567-a012b34b4611	02	Opereta	opereta
00150000-559f-aaab-9a70-454e060da5d3	03	Balet	balet
00150000-559f-aaab-0c10-66c17a70b426	04	Plesne prireditve	plesne prireditve
00150000-559f-aaab-4124-52923f269014	05	Lutkovno gledališče	lutkovno gledališče
00150000-559f-aaab-3f58-64a0b768dade	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559f-aaab-5142-bfca790453b0	07	Biografska drama	biografska drama
00150000-559f-aaab-3716-118f700915aa	08	Komedija	komedija
00150000-559f-aaab-88e6-79a191e520f0	09	Črna komedija	črna komedija
00150000-559f-aaab-81d4-d860dced9c67	10	E-igra	E-igra
00150000-559f-aaab-9d71-fda44087fab5	11	Kriminalka	kriminalka
00150000-559f-aaab-525d-dc0d5f6c5863	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9715510)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9716007)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9715997)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9715911)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9715694)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9715719)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9716118)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9715636)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9716059)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9715852)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9715670)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9715713)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9715650)
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
-- TOC entry 2537 (class 2606 OID 9715762)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9715789)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9715608)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9715519)
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
-- TOC entry 2452 (class 2606 OID 9715543)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9715499)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9715484)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9715795)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9715828)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9715945)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9715572)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9715596)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9715768)
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
-- TOC entry 2467 (class 2606 OID 9715586)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9715657)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9715780)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9716091)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9716099)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9716081)
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
-- TOC entry 2557 (class 2606 OID 9715812)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9715753)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9715744)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9715933)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9715880)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9715455)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9715819)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9715473)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9715493)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9715837)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9715775)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9715725)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9716142)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9716130)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9716124)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9715893)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9715552)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9715735)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9715922)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9716112)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9715621)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9715468)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9715976)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9715679)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9715803)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9715871)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9715708)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9715958)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9715864)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9715701)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9715894)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9715895)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9715574)
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
-- TOC entry 2550 (class 1259 OID 9715796)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9715782)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9715781)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9715680)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9715853)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9715855)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9715854)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9715652)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9715651)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9715947)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9715948)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9715949)
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
-- TOC entry 2604 (class 1259 OID 9715981)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9715978)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9715982)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9715980)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9715979)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9715623)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9715622)
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
-- TOC entry 2450 (class 1259 OID 9715546)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9715820)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9715714)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9715500)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9715501)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9715840)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9715839)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9715838)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9715658)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9715660)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9715659)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9716132)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9715748)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9715746)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9715745)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9715747)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9715474)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9715475)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9715804)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9715769)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9715881)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9715882)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9716063)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9716060)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9716061)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9716062)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9715588)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9715587)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9715589)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9716092)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9716093)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9716011)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9716009)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2620 (class 1259 OID 9716010)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9715872)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9715757)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9715756)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9715754)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9715755)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9715999)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9715998)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9716082)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9715671)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9716119)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9715521)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9715520)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9715553)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9715554)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9715738)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9715737)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9715736)
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
-- TOC entry 2502 (class 1259 OID 9715703)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9715699)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9715696)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9715697)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9715695)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9715700)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9715698)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9715573)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9715637)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9715639)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9715638)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9715640)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9715763)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9715946)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9715977)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9715544)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9715545)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9715865)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9716143)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9715609)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9716131)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9715814)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9715813)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9716008)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9716012)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9715597)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9715959)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9716100)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9716101)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9715494)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9715702)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9716279)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2682 (class 2606 OID 9716264)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2681 (class 2606 OID 9716269)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2677 (class 2606 OID 9716289)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2683 (class 2606 OID 9716259)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 9716284)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9716274)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 9716434)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2712 (class 2606 OID 9716439)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9716194)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9716374)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 9716369)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2699 (class 2606 OID 9716364)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9716254)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9716404)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9716414)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9716409)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2670 (class 2606 OID 9716229)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 9716224)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9716354)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9716444)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9716449)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9716454)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9716474)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2721 (class 2606 OID 9716459)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 9716479)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9716469)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2720 (class 2606 OID 9716464)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2668 (class 2606 OID 9716219)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 9716214)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 9716179)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2661 (class 2606 OID 9716174)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9716384)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9716294)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 9716154)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2656 (class 2606 OID 9716159)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9716399)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9716394)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 9716389)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2674 (class 2606 OID 9716234)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9716244)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9716239)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9716559)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2688 (class 2606 OID 9716329)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2690 (class 2606 OID 9716319)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2691 (class 2606 OID 9716314)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2689 (class 2606 OID 9716324)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 9716144)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 9716149)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9716379)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9716359)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2711 (class 2606 OID 9716424)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2710 (class 2606 OID 9716429)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 9716529)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 9716514)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 9716519)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 9716524)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9716204)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 9716199)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9716209)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9716539)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2733 (class 2606 OID 9716544)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 9716504)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 9716509)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2727 (class 2606 OID 9716494)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2726 (class 2606 OID 9716499)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9716419)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2692 (class 2606 OID 9716349)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2693 (class 2606 OID 9716344)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 9716334)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2694 (class 2606 OID 9716339)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 9716489)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 9716484)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9716534)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9716249)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9716549)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9716554)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2658 (class 2606 OID 9716169)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 9716164)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2663 (class 2606 OID 9716184)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 9716189)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9716309)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9716304)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2687 (class 2606 OID 9716299)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-10 13:21:17 CEST

--
-- PostgreSQL database dump complete
--

