--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-07-13 16:59:00 CEST

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
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 10076793)
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
-- TOC entry 228 (class 1259 OID 10077292)
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
-- TOC entry 227 (class 1259 OID 10077275)
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
-- TOC entry 221 (class 1259 OID 10077187)
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
-- TOC entry 197 (class 1259 OID 10076972)
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
-- TOC entry 200 (class 1259 OID 10077006)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 10077405)
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
-- TOC entry 192 (class 1259 OID 10076915)
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
-- TOC entry 229 (class 1259 OID 10077305)
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
-- TOC entry 216 (class 1259 OID 10077132)
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
-- TOC entry 195 (class 1259 OID 10076952)
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
-- TOC entry 199 (class 1259 OID 10077000)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 10076932)
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
-- TOC entry 205 (class 1259 OID 10077049)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 10077074)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 10076889)
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
-- TOC entry 184 (class 1259 OID 10076802)
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
-- TOC entry 185 (class 1259 OID 10076813)
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
-- TOC entry 180 (class 1259 OID 10076767)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 10076786)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10077081)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 10077112)
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
-- TOC entry 224 (class 1259 OID 10077226)
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
-- TOC entry 187 (class 1259 OID 10076846)
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
-- TOC entry 189 (class 1259 OID 10076881)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 10077055)
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
-- TOC entry 188 (class 1259 OID 10076866)
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
-- TOC entry 194 (class 1259 OID 10076944)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 10077067)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10077375)
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
-- TOC entry 232 (class 1259 OID 10077386)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 10077356)
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
-- TOC entry 212 (class 1259 OID 10077096)
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
-- TOC entry 204 (class 1259 OID 10077040)
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
-- TOC entry 203 (class 1259 OID 10077030)
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
-- TOC entry 223 (class 1259 OID 10077215)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 10077164)
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
-- TOC entry 177 (class 1259 OID 10076738)
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
-- TOC entry 176 (class 1259 OID 10076736)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 10077106)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 10076776)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 10076760)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 10077120)
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
-- TOC entry 207 (class 1259 OID 10077061)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 10077011)
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
-- TOC entry 237 (class 1259 OID 10077425)
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
-- TOC entry 236 (class 1259 OID 10077417)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 10077412)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 10077174)
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
-- TOC entry 186 (class 1259 OID 10076838)
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
-- TOC entry 202 (class 1259 OID 10077017)
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
-- TOC entry 222 (class 1259 OID 10077204)
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
-- TOC entry 233 (class 1259 OID 10077394)
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
-- TOC entry 191 (class 1259 OID 10076901)
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
-- TOC entry 178 (class 1259 OID 10076747)
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
-- TOC entry 226 (class 1259 OID 10077252)
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
-- TOC entry 196 (class 1259 OID 10076963)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 10077088)
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
-- TOC entry 218 (class 1259 OID 10077157)
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
-- TOC entry 198 (class 1259 OID 10076995)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10077242)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 10077147)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 10076741)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2859 (class 0 OID 10076793)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 10077292)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55a3-d233-a4c0-1237a8a3ac6e	000d0000-55a3-d233-1186-2ec74644c4bf	\N	00090000-55a3-d233-a9d6-e677476b290b	000b0000-55a3-d233-c0a8-62b4a4625af1	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55a3-d233-e7fb-1f0e54f6867e	000d0000-55a3-d233-02ac-524f7a8efd2e	00100000-55a3-d233-1052-7d196ac0d38b	00090000-55a3-d233-dd32-30297025b16e	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-55a3-d233-86a6-a7263322a7b5	000d0000-55a3-d233-d95b-c72e8f7d6a4d	00100000-55a3-d233-6294-0390e1e7b34d	00090000-55a3-d233-9d0f-f421448e4fdc	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-55a3-d233-3b62-f1602d1ada81	000d0000-55a3-d233-37f2-a311bd7c3ed4	\N	00090000-55a3-d233-ec01-d99b944efd29	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-55a3-d233-5d5a-324391761905	000d0000-55a3-d233-6997-1e23ad656726	\N	00090000-55a3-d233-a58a-5298f242a908	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-55a3-d233-0d7f-34be093cdf35	000d0000-55a3-d233-ece6-0e99009db34f	\N	00090000-55a3-d233-dcbd-695323fb8f3f	000b0000-55a3-d233-22d6-7e26e5470b6e	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-55a3-d233-901a-5fa179ad1c63	000d0000-55a3-d233-be28-4d8da9ff1582	00100000-55a3-d233-bef8-9921cb9c63f9	00090000-55a3-d233-bf04-341ab252024d	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-55a3-d233-c231-38015ae2df0f	000d0000-55a3-d233-6429-d83710f2eff7	\N	00090000-55a3-d233-3ca8-533de07d7710	000b0000-55a3-d233-b68a-236dae4ee61b	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2903 (class 0 OID 10077275)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 10077187)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55a3-d233-3938-3a541266c4f6	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55a3-d233-bbf1-c9852462e4ad	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55a3-d233-29c5-82c03d03e848	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 10076972)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55a3-d233-d231-d45c680e17f3	\N	\N	00200000-55a3-d233-452b-5329f129eea3	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55a3-d233-1b8e-1c04465bd70f	\N	\N	00200000-55a3-d233-7eb0-67b776ba23e7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55a3-d233-2849-dfb9b2866634	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55a3-d233-c3a6-2682381f08de	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55a3-d233-f588-c6a6c3acb1b0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2876 (class 0 OID 10077006)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 10077405)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 10076915)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55a3-d231-57b8-033a18487f60	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55a3-d231-6860-c2138e3e4b69	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55a3-d231-5fd0-ab4d1e461bed	AL	ALB	008	Albania 	Albanija	\N
00040000-55a3-d231-f26a-bdf40e37b557	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55a3-d231-5c91-69a7e7c89134	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55a3-d231-b0f1-fe80c10cb305	AD	AND	020	Andorra 	Andora	\N
00040000-55a3-d231-14cd-d05b98275be4	AO	AGO	024	Angola 	Angola	\N
00040000-55a3-d231-4773-64cb4fe6e4d6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55a3-d231-73b1-e07b90e55eb4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55a3-d231-2389-b667d70f2ff6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-d231-d126-2808c06c385c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55a3-d231-dc67-0e1950d27670	AM	ARM	051	Armenia 	Armenija	\N
00040000-55a3-d231-a5a8-6229ca057b5b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55a3-d231-29a0-91eca77f4578	AU	AUS	036	Australia 	Avstralija	\N
00040000-55a3-d231-2bb9-033489fe0281	AT	AUT	040	Austria 	Avstrija	\N
00040000-55a3-d231-2c78-34ec96951e8e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55a3-d231-bad5-5593af694ba5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55a3-d231-b9f7-8f0f0ed6d38c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55a3-d231-34fc-5ddab95c9c2d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55a3-d231-b230-319bf5caf66b	BB	BRB	052	Barbados 	Barbados	\N
00040000-55a3-d231-393c-c32d967b9213	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55a3-d231-b98a-5925b6a8d509	BE	BEL	056	Belgium 	Belgija	\N
00040000-55a3-d231-21d3-3328c3b91c57	BZ	BLZ	084	Belize 	Belize	\N
00040000-55a3-d231-c57e-871694a2305c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55a3-d231-7ee7-c5e4faa057a1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55a3-d231-eae4-ef983f6ebad9	BT	BTN	064	Bhutan 	Butan	\N
00040000-55a3-d231-ef3d-152c52b277dc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55a3-d231-c2a9-a06c2321784f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55a3-d231-a365-a08fbf36af12	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55a3-d231-6230-f2991d97ea02	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55a3-d231-24c6-4836219f5409	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55a3-d231-3982-99191158da95	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55a3-d231-90ed-82e334d35ed0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55a3-d231-f599-8e6864ee11df	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55a3-d231-8c4b-1187d5952dcf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55a3-d231-efa5-38d15fe4e97a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55a3-d231-e737-6f526f9249ae	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55a3-d231-d384-79ced37d7760	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55a3-d231-04cd-e09343ddc8cb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55a3-d231-7d4a-06eebb71ccf9	CA	CAN	124	Canada 	Kanada	\N
00040000-55a3-d231-720a-ab0b5166ff28	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55a3-d231-b627-6b8b2938158f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55a3-d231-d42e-c82fc6d1a9b7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55a3-d231-5273-477e2d295417	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55a3-d231-9fd1-6447a22da655	CL	CHL	152	Chile 	Čile	\N
00040000-55a3-d231-5ee0-8f5d0646b605	CN	CHN	156	China 	Kitajska	\N
00040000-55a3-d231-da82-2613e8a29344	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55a3-d231-9f91-774f5e68fe31	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55a3-d231-e739-36f06d9244e2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55a3-d231-8975-583d978a3da2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55a3-d231-ed5c-80e4298cfc6b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55a3-d231-0598-efd37e917aff	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55a3-d231-4788-9f5f74c30e44	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55a3-d231-1a3c-98d9384bd95d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55a3-d231-8599-5fa00346c295	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55a3-d231-4b86-66a2334f74be	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55a3-d231-6b25-5fadcef5882a	CU	CUB	192	Cuba 	Kuba	\N
00040000-55a3-d231-6357-51ab3b5bfa56	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55a3-d231-a4bc-0c4bbf2ce255	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55a3-d231-bcd4-721ee683c697	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55a3-d231-4ac1-e8f214cc8747	DK	DNK	208	Denmark 	Danska	\N
00040000-55a3-d231-abff-f236f75eca51	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55a3-d231-31a0-b3a2d9478cc2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55a3-d231-cd00-7cd975453dd4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55a3-d231-5c83-7e58a2b7a375	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55a3-d231-3869-47d13b2632a9	EG	EGY	818	Egypt 	Egipt	\N
00040000-55a3-d231-f623-a218bab23af6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55a3-d231-4d76-b02e41c73c3e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55a3-d231-ec7b-962a8ceb43b5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55a3-d231-2f5e-ba7ef0d5adbf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55a3-d231-a17e-6fb93c914df2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55a3-d231-0c2d-c225755dfd18	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55a3-d231-3881-9611ec2efbc7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55a3-d231-72c9-5bd911615ead	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55a3-d231-1789-fefb9669714f	FI	FIN	246	Finland 	Finska	\N
00040000-55a3-d231-fc99-87e93b6274c9	FR	FRA	250	France 	Francija	\N
00040000-55a3-d231-d428-1549173c9f6c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55a3-d231-36a3-7bb82017da24	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55a3-d231-84c5-06f7a7c873bd	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55a3-d231-5a24-d0913a338895	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55a3-d231-5206-bd3cc17829eb	GA	GAB	266	Gabon 	Gabon	\N
00040000-55a3-d231-1d19-500e420ee50b	GM	GMB	270	Gambia 	Gambija	\N
00040000-55a3-d231-5b97-acc05cefb8bb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55a3-d231-0e3c-2c0c6b778103	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55a3-d231-1fc3-acc17f035a3e	GH	GHA	288	Ghana 	Gana	\N
00040000-55a3-d231-0ee1-64806d021ae6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55a3-d231-9624-820b7d844a01	GR	GRC	300	Greece 	Grčija	\N
00040000-55a3-d231-e2d6-5743a2399d8d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55a3-d231-0b9b-37d6098772ef	GD	GRD	308	Grenada 	Grenada	\N
00040000-55a3-d231-3b53-871281f78d7a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55a3-d231-51f3-3a310dc2c053	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55a3-d231-2e2f-4e5747711112	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55a3-d231-78e3-e3bfc852cb7f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55a3-d231-f14d-faa04b080b0c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55a3-d231-8727-ff2f9ab15c75	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55a3-d231-402a-1ca95f17c505	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55a3-d231-7bee-c4beff7c175f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55a3-d231-dce6-2936b2ef6a60	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55a3-d231-f5b9-481701a2a948	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55a3-d231-e7cf-30932ec9f34c	HN	HND	340	Honduras 	Honduras	\N
00040000-55a3-d231-a961-a180856b976a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55a3-d231-62a2-4150fc5b55e9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55a3-d231-d96e-3fff3ba18f2e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55a3-d231-56f9-2a56f15749f5	IN	IND	356	India 	Indija	\N
00040000-55a3-d231-5676-c276353c01c8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55a3-d231-e2ed-bef8c3bc25b9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55a3-d231-aa46-acdea3434999	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55a3-d231-c3cf-19efab308acc	IE	IRL	372	Ireland 	Irska	\N
00040000-55a3-d231-d23f-406c55ae5794	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55a3-d231-0748-01bdd5b21438	IL	ISR	376	Israel 	Izrael	\N
00040000-55a3-d231-666f-4bb969ceffca	IT	ITA	380	Italy 	Italija	\N
00040000-55a3-d231-2e10-620ddcc9865c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55a3-d231-0ed6-589cfd0369b5	JP	JPN	392	Japan 	Japonska	\N
00040000-55a3-d231-e995-9e49aede7187	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55a3-d231-c1e7-3a04f9d174b5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55a3-d231-7260-7bce445efdce	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55a3-d231-4063-0561be8b734a	KE	KEN	404	Kenya 	Kenija	\N
00040000-55a3-d231-6a08-80c7629cea37	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55a3-d231-fdb3-48f003d4baa6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55a3-d231-e9bb-fa27db1532b9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55a3-d231-78fc-30dd74f12bef	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55a3-d231-9c3c-49b4cf3cac58	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55a3-d231-3f8e-32baf2b4ce6a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55a3-d231-06b1-83a140260c97	LV	LVA	428	Latvia 	Latvija	\N
00040000-55a3-d231-14b7-2455468c94ce	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55a3-d231-7d0f-c849f6a50f30	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55a3-d231-ae94-ab530e6b83b6	LR	LBR	430	Liberia 	Liberija	\N
00040000-55a3-d231-4cee-c4a13baf915b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55a3-d231-13be-b383a17dcba0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55a3-d231-d79c-8743cc6e6f57	LT	LTU	440	Lithuania 	Litva	\N
00040000-55a3-d231-812b-faa69390a10c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55a3-d231-f49b-a3f12469fb62	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55a3-d231-6a79-70ce36bea24e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55a3-d231-eea7-e60be198ae4c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55a3-d231-eb71-d7c75c631de1	MW	MWI	454	Malawi 	Malavi	\N
00040000-55a3-d231-d559-192f54f353cb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55a3-d231-350f-3e1bf6c71dd9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55a3-d231-2762-0561a4807715	ML	MLI	466	Mali 	Mali	\N
00040000-55a3-d231-2246-208112742779	MT	MLT	470	Malta 	Malta	\N
00040000-55a3-d231-e1ac-ac6b6bb2c351	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55a3-d231-8dd6-904ac27129a3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55a3-d231-6792-8f90e55d0332	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55a3-d231-73e1-6b67c697f6b9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55a3-d231-95e5-bebf84e2d9d0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55a3-d231-628e-a2a5b40cfa30	MX	MEX	484	Mexico 	Mehika	\N
00040000-55a3-d231-6181-b6427fd7ab34	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55a3-d231-ad37-374221deb88a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55a3-d231-cdfe-bdc7c88bb0bd	MC	MCO	492	Monaco 	Monako	\N
00040000-55a3-d231-5f25-0590f24035d5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55a3-d231-4b8e-0cb14b137b24	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55a3-d231-aa42-2dd03e32eade	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55a3-d231-5210-2475c088382b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55a3-d231-b1e8-019c63d04825	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55a3-d231-6bb1-e85b0d0dc098	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55a3-d231-87d9-4636efd7cf77	NA	NAM	516	Namibia 	Namibija	\N
00040000-55a3-d231-78de-e23f3ec4af5c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55a3-d231-6ddf-97cb57aeae91	NP	NPL	524	Nepal 	Nepal	\N
00040000-55a3-d231-657a-4897bbcd1745	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55a3-d231-521c-dc6a70253eae	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55a3-d231-8231-da75034b11de	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55a3-d231-8015-e784f711c79b	NE	NER	562	Niger 	Niger 	\N
00040000-55a3-d231-c3c3-6ae393ea1e0d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55a3-d231-0642-eceefe6c9824	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55a3-d231-b5c4-1293631f4a2c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55a3-d231-e35d-0ede2d138f4f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55a3-d231-bda5-b20ec265c8b5	NO	NOR	578	Norway 	Norveška	\N
00040000-55a3-d231-b8f7-1e46ad24ecb5	OM	OMN	512	Oman 	Oman	\N
00040000-55a3-d231-86fb-f42675c29849	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55a3-d231-5926-910c45085fe4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55a3-d231-83e5-db301fb6d8f6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55a3-d231-be32-7f08d6767814	PA	PAN	591	Panama 	Panama	\N
00040000-55a3-d231-6427-e7f6b340ca60	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55a3-d231-a60e-c7507266cb5a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55a3-d231-a415-5a91f08187b5	PE	PER	604	Peru 	Peru	\N
00040000-55a3-d231-ac80-c884f2f9121b	PH	PHL	608	Philippines 	Filipini	\N
00040000-55a3-d231-86ff-993653bfc37d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55a3-d231-ad0a-cef4631d0a04	PL	POL	616	Poland 	Poljska	\N
00040000-55a3-d231-5360-36bc6a1889b0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55a3-d231-e68e-1f63ad787b61	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55a3-d231-c8f3-4ec842020840	QA	QAT	634	Qatar 	Katar	\N
00040000-55a3-d231-5ddd-12e1961b0c70	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55a3-d231-a065-3b4fda5f1aef	RO	ROU	642	Romania 	Romunija	\N
00040000-55a3-d231-54b7-6f16448023d1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55a3-d231-e2c5-c0beb52c4788	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55a3-d231-a17a-062f41146327	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55a3-d231-4b83-e95b6880ed81	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55a3-d231-f693-7be04109df08	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55a3-d231-48eb-6539b3c1096d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55a3-d231-84bb-558d36d24249	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55a3-d231-1c50-77fe7184f9c8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55a3-d231-1a73-f7faba6a2b79	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55a3-d231-8a6b-c6055ecfe007	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55a3-d231-28d4-4f24236fa8d7	SM	SMR	674	San Marino 	San Marino	\N
00040000-55a3-d231-08e2-fd188a5a040d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55a3-d231-502a-b74e72196792	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55a3-d231-85a0-14f2306c5826	SN	SEN	686	Senegal 	Senegal	\N
00040000-55a3-d231-f616-121cddf09ea8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55a3-d231-89fb-d4ecea4c65e5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55a3-d231-c3d3-ff0e6903e44b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55a3-d231-0aed-25549e39c02d	SG	SGP	702	Singapore 	Singapur	\N
00040000-55a3-d231-bf7b-907aa1c1524a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55a3-d231-dae9-79e7bed6fcfc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55a3-d231-e43f-baaa0029115a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55a3-d231-2113-03eb26bdcd81	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55a3-d231-63db-8a0bfe5bcdb2	SO	SOM	706	Somalia 	Somalija	\N
00040000-55a3-d231-e6b9-ca74fad868ca	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55a3-d231-7cfe-884cc64e4f44	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55a3-d231-1b96-65bf0c764fec	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55a3-d231-a3c4-063ad643e618	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55a3-d231-6347-6416214b7754	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55a3-d231-6e85-dbf58c523762	SD	SDN	729	Sudan 	Sudan	\N
00040000-55a3-d231-2336-723a0a054e30	SR	SUR	740	Suriname 	Surinam	\N
00040000-55a3-d231-d02c-8e9b9b7f7810	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55a3-d231-f5fc-a8e3135d524c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55a3-d231-d17f-f28f873c096e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55a3-d231-5424-95e7ef9aa0ba	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55a3-d231-b09f-bd19d3c1b4db	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55a3-d231-b469-6e8fdd41a6f1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55a3-d231-6f1e-bd701ba19c4d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55a3-d231-3cf2-4c47fa16aec9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55a3-d231-1273-494e8cb44a85	TH	THA	764	Thailand 	Tajska	\N
00040000-55a3-d231-fa07-d38211df2c72	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55a3-d231-b9d8-117a9679d314	TG	TGO	768	Togo 	Togo	\N
00040000-55a3-d231-1f51-2149599fd073	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55a3-d231-cfc3-9ae2e4c59881	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55a3-d231-e4c7-55adc7a425ac	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55a3-d231-5f4e-51a413b970dd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55a3-d231-9c3d-564f184e2098	TR	TUR	792	Turkey 	Turčija	\N
00040000-55a3-d231-1ea3-74eb1797c400	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55a3-d231-7217-93e20f0fa131	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-d231-a8e0-7577fdb13f27	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55a3-d231-bd51-c4e9a055b7ac	UG	UGA	800	Uganda 	Uganda	\N
00040000-55a3-d231-6f7a-640a85ab3efa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55a3-d231-8d3c-62860d4e0261	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55a3-d231-bcbb-6bdaa9998627	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55a3-d231-8d91-30e7635f61d6	US	USA	840	United States 	Združene države Amerike	\N
00040000-55a3-d231-db3b-2392c7dcc426	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55a3-d231-034f-1ccdc6f4702b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55a3-d231-f98b-0d5ae08cee88	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55a3-d231-c3ff-b27a4a866bde	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55a3-d231-541a-ab4dd9e47342	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55a3-d231-e1fe-c93305eb5e51	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55a3-d231-86b7-8db32a3a9ac6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55a3-d231-71ed-c74f4147354c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55a3-d231-b6d6-254cc2ee5634	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55a3-d231-77ad-d784fa2e47aa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55a3-d231-1855-795dadf41ebb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55a3-d231-2f97-a5c2a9f54946	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55a3-d231-b81a-11480c539897	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2905 (class 0 OID 10077305)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaprosenprocent, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-55a3-d233-e3a2-fb26cdb33610	000e0000-55a3-d233-7378-e7ad59cc85b0	\N	\N	9000.30	9000.30	0.00	0.00	40.00	3600.12	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-55a3-d232-cd7c-146f20e913ba	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55a3-d233-5ef2-afd42ed0de03	000e0000-55a3-d233-3fda-9723016abf79	\N	\N	4900.20	4900.20	0.00	0.00	40.00	1960.08	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-55a3-d232-a2bf-d47fa23a4061	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 10077132)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55a3-d233-be28-4d8da9ff1582	000e0000-55a3-d233-3fda-9723016abf79	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55a3-d232-6fe8-e221a0d34d11
000d0000-55a3-d233-1186-2ec74644c4bf	000e0000-55a3-d233-3fda-9723016abf79	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-d232-6fe8-e221a0d34d11
000d0000-55a3-d233-02ac-524f7a8efd2e	000e0000-55a3-d233-3fda-9723016abf79	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55a3-d232-ff79-efae7479db50
000d0000-55a3-d233-d95b-c72e8f7d6a4d	000e0000-55a3-d233-3fda-9723016abf79	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-55a3-d232-fdc3-b5e658305cf1
000d0000-55a3-d233-37f2-a311bd7c3ed4	000e0000-55a3-d233-3fda-9723016abf79	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55a3-d232-fdc3-b5e658305cf1
000d0000-55a3-d233-6997-1e23ad656726	000e0000-55a3-d233-3fda-9723016abf79	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55a3-d232-fdc3-b5e658305cf1
000d0000-55a3-d233-ece6-0e99009db34f	000e0000-55a3-d233-3fda-9723016abf79	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55a3-d232-6fe8-e221a0d34d11
000d0000-55a3-d233-6429-d83710f2eff7	000e0000-55a3-d233-3fda-9723016abf79	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55a3-d232-4c88-901faf8c5ffc
\.


--
-- TOC entry 2871 (class 0 OID 10076952)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 10077000)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 10076932)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55a3-d233-b8a9-4c3608bb9910	00080000-55a3-d233-60e7-68f6e680fc32	00090000-55a3-d233-d92e-459085661c67	AK		
\.


--
-- TOC entry 2846 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 10077049)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 10077074)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 10076889)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55a3-d232-cefc-51031e37e357	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55a3-d232-4a59-d1282ad4ff30	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55a3-d232-9b0a-fe4a6769375d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55a3-d232-184a-6ea5a43f9fe8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55a3-d232-4e79-cf45eecb8278	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55a3-d232-b205-de6dbc9303d9	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55a3-d232-ec7b-8e05501a67c1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55a3-d232-7ff8-cc126e144be3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-d232-5da4-995278021343	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55a3-d232-7296-7c71a32e1f25	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55a3-d232-ca74-1babd2366164	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55a3-d232-eed5-981dcf6d7289	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55a3-d232-e0b2-ba3504accef4	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-55a3-d233-78d6-2c07eab2d939	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55a3-d233-f9e1-6ca9248a1646	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55a3-d233-ee80-ef1f3ec4f229	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55a3-d233-dbb3-00cf1776c0a6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55a3-d233-17cf-d6cc11516855	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55a3-d233-9964-0d1806218f89	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2860 (class 0 OID 10076802)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55a3-d233-1e1f-3a9ef0ba3225	00000000-55a3-d233-f9e1-6ca9248a1646	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55a3-d233-a337-86dce535baae	00000000-55a3-d233-f9e1-6ca9248a1646	00010000-55a3-d232-f5f4-74e93e89fa66	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55a3-d233-2d55-aadc9a9b8b36	00000000-55a3-d233-ee80-ef1f3ec4f229	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2861 (class 0 OID 10076813)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55a3-d233-a9d6-e677476b290b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55a3-d233-ec01-d99b944efd29	00010000-55a3-d233-4aae-48ba0d8be4fc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55a3-d233-9d0f-f421448e4fdc	00010000-55a3-d233-9e9a-bf64df929472	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55a3-d233-6b51-ebdb3230cfc6	00010000-55a3-d233-bae8-d67f2147a20c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55a3-d233-a2d5-d9e38c116025	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55a3-d233-dcbd-695323fb8f3f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55a3-d233-ed6b-713dcbef0d03	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55a3-d233-bf04-341ab252024d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55a3-d233-d92e-459085661c67	00010000-55a3-d233-834a-92ec556217fc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55a3-d233-dd32-30297025b16e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55a3-d233-696a-385df19d1fdd	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55a3-d233-a58a-5298f242a908	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55a3-d233-3ca8-533de07d7710	00010000-55a3-d233-6000-23b9eadfd5da	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 10076767)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55a3-d231-79cd-be60b00bedd1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55a3-d231-bd10-d3c6e17d20da	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55a3-d231-3e42-baa06bdd6238	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55a3-d231-3bc4-c017ba5eab98	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55a3-d231-2219-aa5bf271be6c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55a3-d231-2b52-9d7e531bb4c5	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55a3-d231-9f0e-1fca933394ff	Abonma-read	Abonma - branje	f
00030000-55a3-d231-e2f8-b77d0398f56a	Abonma-write	Abonma - spreminjanje	f
00030000-55a3-d231-e56b-dc4bcdcd3fec	Alternacija-read	Alternacija - branje	f
00030000-55a3-d231-2f94-243576bfaf9f	Alternacija-write	Alternacija - spreminjanje	f
00030000-55a3-d231-f910-bd5f58803d01	Arhivalija-read	Arhivalija - branje	f
00030000-55a3-d231-26b9-eb1e8ba76fae	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55a3-d231-76fc-8b3fa7b1ac53	Besedilo-read	Besedilo - branje	f
00030000-55a3-d231-eb9a-8289264c5087	Besedilo-write	Besedilo - spreminjanje	f
00030000-55a3-d231-d637-852a94b9dbd5	DogodekIzven-read	DogodekIzven - branje	f
00030000-55a3-d231-836e-03cb6cd73fe5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55a3-d231-bff5-c76f38d06f08	Dogodek-read	Dogodek - branje	f
00030000-55a3-d231-fba8-93eeaaa7f16d	Dogodek-write	Dogodek - spreminjanje	f
00030000-55a3-d231-3748-f0bab4f548a3	DrugiVir-read	DrugiVir - branje	f
00030000-55a3-d231-70bf-31072132f9c3	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55a3-d231-d22c-df056ff5b50e	Drzava-read	Drzava - branje	f
00030000-55a3-d231-c7e7-1c06ed4c2cef	Drzava-write	Drzava - spreminjanje	f
00030000-55a3-d231-d45f-f13af1f62616	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55a3-d231-5acb-361bf24f013a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55a3-d231-a83d-9a9436390f4b	Funkcija-read	Funkcija - branje	f
00030000-55a3-d231-8f9e-6e424a8dcdd9	Funkcija-write	Funkcija - spreminjanje	f
00030000-55a3-d231-06dc-a72f07628812	Gostovanje-read	Gostovanje - branje	f
00030000-55a3-d231-2dfb-a5c3350306b1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55a3-d231-ebce-f5032da6fa87	Gostujoca-read	Gostujoca - branje	f
00030000-55a3-d231-6ef6-3ee6dc646d29	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55a3-d231-0aa0-1858a7edd110	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55a3-d231-c350-65d65f6eeb12	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55a3-d231-8e15-a8304f2237ea	Kupec-read	Kupec - branje	f
00030000-55a3-d231-a186-a5b0c6a1d570	Kupec-write	Kupec - spreminjanje	f
00030000-55a3-d231-48ff-429f004e6f0c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55a3-d231-3cb0-ab09653debc7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55a3-d231-32fa-1ede63446c10	Option-read	Option - branje	f
00030000-55a3-d231-859a-a5d04b7c8211	Option-write	Option - spreminjanje	f
00030000-55a3-d231-cba9-d551d9bb9bf7	OptionValue-read	OptionValue - branje	f
00030000-55a3-d231-1434-6804a6bbf085	OptionValue-write	OptionValue - spreminjanje	f
00030000-55a3-d231-80ad-796e84b6f02b	Oseba-read	Oseba - branje	f
00030000-55a3-d231-d133-d6458c52fb4c	Oseba-write	Oseba - spreminjanje	f
00030000-55a3-d231-a536-d9cf05026a95	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55a3-d231-7a2d-808f12f2354c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55a3-d231-ebc8-6ff1b32362c9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55a3-d231-e27d-ac862d3daf58	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55a3-d231-7f86-a1eb65e8a58d	Pogodba-read	Pogodba - branje	f
00030000-55a3-d231-6319-d8ed04612b42	Pogodba-write	Pogodba - spreminjanje	f
00030000-55a3-d231-d9db-68c691746949	Popa-read	Popa - branje	f
00030000-55a3-d231-a865-14c441a0903d	Popa-write	Popa - spreminjanje	f
00030000-55a3-d231-c292-fa6f9322a1e8	Posta-read	Posta - branje	f
00030000-55a3-d231-958f-22ba13dfe2e1	Posta-write	Posta - spreminjanje	f
00030000-55a3-d231-2c04-7391805417cf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55a3-d231-232e-b800e42c240b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55a3-d231-b3da-44537db75b21	PostniNaslov-read	PostniNaslov - branje	f
00030000-55a3-d231-b0dc-b0d0ecdd8620	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55a3-d231-7815-023c9a2909c8	Predstava-read	Predstava - branje	f
00030000-55a3-d231-4747-142e8f4ce38a	Predstava-write	Predstava - spreminjanje	f
00030000-55a3-d231-1636-a1621e72bf97	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55a3-d231-c96f-5d9e8df59c93	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55a3-d231-b792-22c407ab289b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55a3-d231-6f4f-f99bf9a10c9b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55a3-d231-bcf7-ea7ea5172800	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55a3-d231-7477-3c4d79788d6f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55a3-d231-ef1a-d64716e3c5e1	ProgramDela-read	ProgramDela - branje	f
00030000-55a3-d231-52a5-1d75ee39c970	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55a3-d231-73c3-70927714ee9f	ProgramFestival-read	ProgramFestival - branje	f
00030000-55a3-d231-72fb-b9e77cb91e0a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55a3-d231-203e-e10f19a6c6be	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55a3-d231-adb4-1e1c7f23deaf	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55a3-d231-036c-39320e42f52d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55a3-d231-d85a-9facc98df22a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55a3-d231-618b-b54e1b1bf815	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55a3-d231-f3cd-d0002b904d84	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55a3-d231-0ab7-e14d89b2307b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55a3-d231-5938-29c14fb2f458	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55a3-d231-ebd9-64215da9ed5b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55a3-d231-e4cf-ecfeee7bcc1b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55a3-d231-aa67-db76572f6609	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55a3-d231-c126-fc0084558b35	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55a3-d231-8147-3ae2c580116f	ProgramRazno-read	ProgramRazno - branje	f
00030000-55a3-d231-d213-8b29cc45b5e2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55a3-d231-75c9-e95d76bdd978	Prostor-read	Prostor - branje	f
00030000-55a3-d231-a67a-cae4d517298a	Prostor-write	Prostor - spreminjanje	f
00030000-55a3-d231-7a8d-e690e99d0381	Racun-read	Racun - branje	f
00030000-55a3-d231-d423-4f81c2560cde	Racun-write	Racun - spreminjanje	f
00030000-55a3-d231-77f0-4a258b2b1495	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55a3-d231-1bb3-d9aa3aaab03f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55a3-d231-97dc-602fab7d5f03	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55a3-d231-fdbb-67c8cc954197	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55a3-d231-0b2f-235512ae0279	Rekvizit-read	Rekvizit - branje	f
00030000-55a3-d231-8ed5-dc9d647e3967	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55a3-d231-a8e1-29793b313582	Revizija-read	Revizija - branje	f
00030000-55a3-d231-54ef-ad76b405f6a8	Revizija-write	Revizija - spreminjanje	f
00030000-55a3-d231-5cc7-d75a8ac0ca88	Rezervacija-read	Rezervacija - branje	f
00030000-55a3-d231-ac4a-81ba980c4c97	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55a3-d231-19dc-0af57d12e9da	SedezniRed-read	SedezniRed - branje	f
00030000-55a3-d231-c4a5-c4dea4ff831d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55a3-d231-5514-480f2b65337a	Sedez-read	Sedez - branje	f
00030000-55a3-d231-c635-64c4300bbd60	Sedez-write	Sedez - spreminjanje	f
00030000-55a3-d231-de0c-d34a1950f956	Sezona-read	Sezona - branje	f
00030000-55a3-d231-409d-af9e5ca3c497	Sezona-write	Sezona - spreminjanje	f
00030000-55a3-d231-8cb8-9f7986ac1719	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55a3-d231-8db4-e28586ec9dd1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55a3-d231-d9bc-202a4133496d	Stevilcenje-read	Stevilcenje - branje	f
00030000-55a3-d231-4ca0-e9877c4d056f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55a3-d231-0aa0-6b1357125f27	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55a3-d231-82b7-13a4a40b1953	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55a3-d231-dc53-6073388e57bd	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55a3-d231-2178-d69d8979eec2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55a3-d231-a88a-76b3e19bb694	Telefonska-read	Telefonska - branje	f
00030000-55a3-d231-7c46-0eb2b6ec74e0	Telefonska-write	Telefonska - spreminjanje	f
00030000-55a3-d231-9644-ad3f92f5caf2	TerminStoritve-read	TerminStoritve - branje	f
00030000-55a3-d231-5c07-5aa504bc55ee	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55a3-d231-76d2-9199ec7c610c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55a3-d231-c06e-8e4f639bd23b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55a3-d231-bc8d-89829e65513f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55a3-d231-c42c-b2ed4b4d590b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55a3-d231-268d-1c9a24749cd1	Trr-read	Trr - branje	f
00030000-55a3-d231-d172-687b2f1beba8	Trr-write	Trr - spreminjanje	f
00030000-55a3-d231-0343-0402bdf9bdca	Uprizoritev-read	Uprizoritev - branje	f
00030000-55a3-d231-a1c7-d337d45eb878	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55a3-d231-c240-155f7fd9a204	Vaja-read	Vaja - branje	f
00030000-55a3-d231-6a2b-532a837bc03e	Vaja-write	Vaja - spreminjanje	f
00030000-55a3-d231-43e7-3718946a9438	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55a3-d231-755c-f7929c4dca05	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55a3-d231-b897-598a8ff5eaa7	Zaposlitev-read	Zaposlitev - branje	f
00030000-55a3-d231-5aad-60733b3c2221	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55a3-d231-4287-2ec375bb01d8	Zasedenost-read	Zasedenost - branje	f
00030000-55a3-d231-3f23-62c6306ea1bc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55a3-d231-df7f-89b1b7ac9485	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55a3-d231-ea88-e8bbb8c855ca	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55a3-d231-f384-14e19385ee6a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55a3-d231-40ae-a9cacf567ae7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2858 (class 0 OID 10076786)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55a3-d231-01f6-c1d5fc2a705f	00030000-55a3-d231-bd10-d3c6e17d20da
00020000-55a3-d231-2b31-1149e647013f	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-e2f8-b77d0398f56a
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-e56b-dc4bcdcd3fec
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-2f94-243576bfaf9f
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-3bc4-c017ba5eab98
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-fba8-93eeaaa7f16d
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-c7e7-1c06ed4c2cef
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-a83d-9a9436390f4b
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-8f9e-6e424a8dcdd9
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-2dfb-a5c3350306b1
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-6ef6-3ee6dc646d29
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-0aa0-1858a7edd110
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-c350-65d65f6eeb12
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-80ad-796e84b6f02b
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-d133-d6458c52fb4c
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-a865-14c441a0903d
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-958f-22ba13dfe2e1
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-b3da-44537db75b21
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-b0dc-b0d0ecdd8620
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-4747-142e8f4ce38a
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-bcf7-ea7ea5172800
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-7477-3c4d79788d6f
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-a67a-cae4d517298a
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-fdbb-67c8cc954197
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-8ed5-dc9d647e3967
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-409d-af9e5ca3c497
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-76d2-9199ec7c610c
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-0343-0402bdf9bdca
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-a1c7-d337d45eb878
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-c240-155f7fd9a204
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-6a2b-532a837bc03e
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-4287-2ec375bb01d8
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-3f23-62c6306ea1bc
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d231-1446-22cb47c1f313	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-0aa0-1858a7edd110
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-c350-65d65f6eeb12
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-80ad-796e84b6f02b
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-d133-d6458c52fb4c
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-b3da-44537db75b21
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-b0dc-b0d0ecdd8620
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-a88a-76b3e19bb694
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-7c46-0eb2b6ec74e0
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-268d-1c9a24749cd1
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-d172-687b2f1beba8
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-b897-598a8ff5eaa7
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-5aad-60733b3c2221
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d231-b7ba-ee14af48362c	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-e56b-dc4bcdcd3fec
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-26b9-eb1e8ba76fae
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-76fc-8b3fa7b1ac53
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-d637-852a94b9dbd5
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-a83d-9a9436390f4b
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-0aa0-1858a7edd110
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-80ad-796e84b6f02b
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-bcf7-ea7ea5172800
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-76d2-9199ec7c610c
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-c240-155f7fd9a204
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-4287-2ec375bb01d8
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d231-bdc3-65fe4998b0a6	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-e2f8-b77d0398f56a
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-2f94-243576bfaf9f
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-76d2-9199ec7c610c
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d231-7ba8-10564908edcf	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-9644-ad3f92f5caf2
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-3e42-baa06bdd6238
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-76d2-9199ec7c610c
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d231-ad0c-485b79f3d518	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-79cd-be60b00bedd1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-bd10-d3c6e17d20da
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-3e42-baa06bdd6238
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-3bc4-c017ba5eab98
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2219-aa5bf271be6c
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2b52-9d7e531bb4c5
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-9f0e-1fca933394ff
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-e2f8-b77d0398f56a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-e56b-dc4bcdcd3fec
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2f94-243576bfaf9f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-f910-bd5f58803d01
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-26b9-eb1e8ba76fae
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-76fc-8b3fa7b1ac53
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-eb9a-8289264c5087
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d637-852a94b9dbd5
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-836e-03cb6cd73fe5
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-bff5-c76f38d06f08
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-fba8-93eeaaa7f16d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d22c-df056ff5b50e
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c7e7-1c06ed4c2cef
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-3748-f0bab4f548a3
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-70bf-31072132f9c3
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d45f-f13af1f62616
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5acb-361bf24f013a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a83d-9a9436390f4b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8f9e-6e424a8dcdd9
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-06dc-a72f07628812
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2dfb-a5c3350306b1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ebce-f5032da6fa87
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-6ef6-3ee6dc646d29
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-0aa0-1858a7edd110
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c350-65d65f6eeb12
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8e15-a8304f2237ea
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a186-a5b0c6a1d570
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-48ff-429f004e6f0c
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-3cb0-ab09653debc7
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-32fa-1ede63446c10
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-859a-a5d04b7c8211
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-cba9-d551d9bb9bf7
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-1434-6804a6bbf085
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-80ad-796e84b6f02b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d133-d6458c52fb4c
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a536-d9cf05026a95
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7a2d-808f12f2354c
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ebc8-6ff1b32362c9
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-e27d-ac862d3daf58
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7f86-a1eb65e8a58d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-6319-d8ed04612b42
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d9db-68c691746949
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a865-14c441a0903d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c292-fa6f9322a1e8
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-958f-22ba13dfe2e1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2c04-7391805417cf
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-232e-b800e42c240b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-b3da-44537db75b21
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-b0dc-b0d0ecdd8620
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7815-023c9a2909c8
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-4747-142e8f4ce38a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-1636-a1621e72bf97
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c96f-5d9e8df59c93
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-b792-22c407ab289b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-6f4f-f99bf9a10c9b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-bcf7-ea7ea5172800
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7477-3c4d79788d6f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ef1a-d64716e3c5e1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-52a5-1d75ee39c970
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-73c3-70927714ee9f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-72fb-b9e77cb91e0a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-203e-e10f19a6c6be
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-adb4-1e1c7f23deaf
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-036c-39320e42f52d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d85a-9facc98df22a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-618b-b54e1b1bf815
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-f3cd-d0002b904d84
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-0ab7-e14d89b2307b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5938-29c14fb2f458
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ebd9-64215da9ed5b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-e4cf-ecfeee7bcc1b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-aa67-db76572f6609
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c126-fc0084558b35
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8147-3ae2c580116f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d213-8b29cc45b5e2
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-75c9-e95d76bdd978
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a67a-cae4d517298a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7a8d-e690e99d0381
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d423-4f81c2560cde
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-77f0-4a258b2b1495
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-1bb3-d9aa3aaab03f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-97dc-602fab7d5f03
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-fdbb-67c8cc954197
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-0b2f-235512ae0279
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8ed5-dc9d647e3967
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a8e1-29793b313582
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-54ef-ad76b405f6a8
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5cc7-d75a8ac0ca88
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ac4a-81ba980c4c97
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-19dc-0af57d12e9da
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c4a5-c4dea4ff831d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5514-480f2b65337a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c635-64c4300bbd60
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-de0c-d34a1950f956
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-409d-af9e5ca3c497
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8cb8-9f7986ac1719
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-8db4-e28586ec9dd1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d9bc-202a4133496d
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-4ca0-e9877c4d056f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-0aa0-6b1357125f27
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-82b7-13a4a40b1953
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-dc53-6073388e57bd
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-2178-d69d8979eec2
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a88a-76b3e19bb694
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-7c46-0eb2b6ec74e0
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-9644-ad3f92f5caf2
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5c07-5aa504bc55ee
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-76d2-9199ec7c610c
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c06e-8e4f639bd23b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-bc8d-89829e65513f
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c42c-b2ed4b4d590b
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-268d-1c9a24749cd1
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-d172-687b2f1beba8
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-0343-0402bdf9bdca
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-a1c7-d337d45eb878
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-c240-155f7fd9a204
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-6a2b-532a837bc03e
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-43e7-3718946a9438
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-755c-f7929c4dca05
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-b897-598a8ff5eaa7
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-5aad-60733b3c2221
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-4287-2ec375bb01d8
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-3f23-62c6306ea1bc
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-df7f-89b1b7ac9485
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-ea88-e8bbb8c855ca
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-f384-14e19385ee6a
00020000-55a3-d233-24a2-7549faf4c2d3	00030000-55a3-d231-40ae-a9cacf567ae7
\.


--
-- TOC entry 2886 (class 0 OID 10077081)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 10077112)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 10077226)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-55a3-d233-c0a8-62b4a4625af1	00090000-55a3-d233-a9d6-e677476b290b	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-55a3-d233-22d6-7e26e5470b6e	00090000-55a3-d233-dcbd-695323fb8f3f	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-55a3-d233-b68a-236dae4ee61b	00090000-55a3-d233-3ca8-533de07d7710	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2863 (class 0 OID 10076846)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55a3-d233-60e7-68f6e680fc32	00040000-55a3-d231-e43f-baaa0029115a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-0133-a0797c27133c	00040000-55a3-d231-e43f-baaa0029115a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55a3-d233-f55a-8c6835d68ae2	00040000-55a3-d231-e43f-baaa0029115a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-ca53-b7a471c58548	00040000-55a3-d231-e43f-baaa0029115a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-0903-da663f8ae3c6	00040000-55a3-d231-e43f-baaa0029115a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-0945-8852cf561caa	00040000-55a3-d231-d126-2808c06c385c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-cf8a-db1a77600d7e	00040000-55a3-d231-4b86-66a2334f74be	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-c846-3174b2a8fba5	00040000-55a3-d231-2bb9-033489fe0281	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55a3-d233-5f32-019d76ed2074	00040000-55a3-d231-e43f-baaa0029115a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2865 (class 0 OID 10076881)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55a3-d232-cd87-bd7abb4305e9	8341	Adlešiči
00050000-55a3-d232-9a42-c15f78fd3a1d	5270	Ajdovščina
00050000-55a3-d232-3f7d-1aa582085d51	6280	Ankaran/Ancarano
00050000-55a3-d232-78c6-e1020806f608	9253	Apače
00050000-55a3-d232-4fe6-15b900efc72b	8253	Artiče
00050000-55a3-d232-2e85-731f01b8b2c5	4275	Begunje na Gorenjskem
00050000-55a3-d232-055a-906674ce4e7c	1382	Begunje pri Cerknici
00050000-55a3-d232-a540-80c1bd231f28	9231	Beltinci
00050000-55a3-d232-232e-feb2d8005289	2234	Benedikt
00050000-55a3-d232-ddb7-fd45da11799d	2345	Bistrica ob Dravi
00050000-55a3-d232-f077-482583b58823	3256	Bistrica ob Sotli
00050000-55a3-d232-9a6a-f89ecf75ed49	8259	Bizeljsko
00050000-55a3-d232-e177-35df5146930c	1223	Blagovica
00050000-55a3-d232-bb43-e1ef24ef3976	8283	Blanca
00050000-55a3-d232-08a3-15d75db0371e	4260	Bled
00050000-55a3-d232-d02b-c04fd23e3c36	4273	Blejska Dobrava
00050000-55a3-d232-9e47-ada8dc5fb2ef	9265	Bodonci
00050000-55a3-d232-7b3b-ba432768dda6	9222	Bogojina
00050000-55a3-d232-a76d-36e0e64076a7	4263	Bohinjska Bela
00050000-55a3-d232-b708-e7867bb3670b	4264	Bohinjska Bistrica
00050000-55a3-d232-b553-b4bd053ad260	4265	Bohinjsko jezero
00050000-55a3-d232-e5f4-2ea01b493113	1353	Borovnica
00050000-55a3-d232-10b1-803c57a4ad9d	8294	Boštanj
00050000-55a3-d232-f892-1eb83a56d532	5230	Bovec
00050000-55a3-d232-99b2-54ac9d9b0d7a	5295	Branik
00050000-55a3-d232-dc0c-183c8b01ce21	3314	Braslovče
00050000-55a3-d232-e52f-85ef034c98ce	5223	Breginj
00050000-55a3-d232-9fcc-c002204ab67e	8280	Brestanica
00050000-55a3-d232-ddd5-72c4c35a8366	2354	Bresternica
00050000-55a3-d232-a45c-3d0df17ab676	4243	Brezje
00050000-55a3-d232-3ed1-38c70c7b8013	1351	Brezovica pri Ljubljani
00050000-55a3-d232-3f4a-645837a58435	8250	Brežice
00050000-55a3-d232-3542-297d1a7ec466	4210	Brnik - Aerodrom
00050000-55a3-d232-0fbc-e090a825cfab	8321	Brusnice
00050000-55a3-d232-5586-7070d6dfba56	3255	Buče
00050000-55a3-d232-a990-eea5baaad648	8276	Bučka 
00050000-55a3-d232-bd08-73db9209b8f9	9261	Cankova
00050000-55a3-d232-1b50-bea8b4d7a9db	3000	Celje 
00050000-55a3-d232-c4df-29967bc37c62	3001	Celje - poštni predali
00050000-55a3-d232-90f0-d6b20bb9bbb9	4207	Cerklje na Gorenjskem
00050000-55a3-d232-d11f-ec9a4a446a6d	8263	Cerklje ob Krki
00050000-55a3-d232-2141-ce27348d8ab9	1380	Cerknica
00050000-55a3-d232-96d5-e30cf3d61121	5282	Cerkno
00050000-55a3-d232-40c2-837a12757682	2236	Cerkvenjak
00050000-55a3-d232-e021-ab5b465a4c7c	2215	Ceršak
00050000-55a3-d232-da0c-eaa4116fd0a3	2326	Cirkovce
00050000-55a3-d232-51a1-276bb4c8dda6	2282	Cirkulane
00050000-55a3-d232-c808-25fcebf57da3	5273	Col
00050000-55a3-d232-30f4-62bc1f45e47f	8251	Čatež ob Savi
00050000-55a3-d232-ba03-f61ba06dde9c	1413	Čemšenik
00050000-55a3-d232-48d5-172c44bcb249	5253	Čepovan
00050000-55a3-d232-f6b7-cc26a5ad62ce	9232	Črenšovci
00050000-55a3-d232-c2d4-51b13e5dee4e	2393	Črna na Koroškem
00050000-55a3-d232-4d6f-dd15f7a24895	6275	Črni Kal
00050000-55a3-d232-27a1-43e557f7d418	5274	Črni Vrh nad Idrijo
00050000-55a3-d232-bef8-85a9b971b62c	5262	Črniče
00050000-55a3-d232-0c47-8f713bba917a	8340	Črnomelj
00050000-55a3-d232-d8a1-f2794502f72e	6271	Dekani
00050000-55a3-d232-edc9-8aae76b17c0c	5210	Deskle
00050000-55a3-d232-41d1-4ace992c6a16	2253	Destrnik
00050000-55a3-d232-d091-1af98c917521	6215	Divača
00050000-55a3-d232-c74b-be3a43230069	1233	Dob
00050000-55a3-d232-b789-12b747b46004	3224	Dobje pri Planini
00050000-55a3-d232-d295-5c228dde1d64	8257	Dobova
00050000-55a3-d232-0ca1-901cb2120241	1423	Dobovec
00050000-55a3-d232-d35e-daaaa802b404	5263	Dobravlje
00050000-55a3-d232-1cc9-dc8d8773dec5	3204	Dobrna
00050000-55a3-d232-4d23-9e775ac6f460	8211	Dobrnič
00050000-55a3-d232-2cb3-008c0b7ce889	1356	Dobrova
00050000-55a3-d232-8c11-950832abfcb3	9223	Dobrovnik/Dobronak 
00050000-55a3-d232-9e3e-620a0ced0de8	5212	Dobrovo v Brdih
00050000-55a3-d232-e0e5-a183c7bda874	1431	Dol pri Hrastniku
00050000-55a3-d232-81ae-cbe628989b98	1262	Dol pri Ljubljani
00050000-55a3-d232-1438-9c09dd9f1971	1273	Dole pri Litiji
00050000-55a3-d232-6d4e-66ef97844ca0	1331	Dolenja vas
00050000-55a3-d232-1ef5-08d01bca21bc	8350	Dolenjske Toplice
00050000-55a3-d232-e79c-675df47b4fee	1230	Domžale
00050000-55a3-d232-2d7a-0f7ce862b256	2252	Dornava
00050000-55a3-d232-5c2b-65c7a7ab7268	5294	Dornberk
00050000-55a3-d232-6cff-ca09b8d3dd8d	1319	Draga
00050000-55a3-d232-a52a-c6dffc1739c3	8343	Dragatuš
00050000-55a3-d232-8e1d-91d5a228a6ae	3222	Dramlje
00050000-55a3-d232-5296-377519d4e136	2370	Dravograd
00050000-55a3-d232-5a81-9804240f075a	4203	Duplje
00050000-55a3-d232-fb4e-95f14e064a91	6221	Dutovlje
00050000-55a3-d232-93a2-921f88af1272	8361	Dvor
00050000-55a3-d232-4a5f-2241b0ba2f03	2343	Fala
00050000-55a3-d232-6173-dee5dfcdf20f	9208	Fokovci
00050000-55a3-d232-9e6a-e73ea4f2d96c	2313	Fram
00050000-55a3-d232-edfa-c6a9bc44ee98	3213	Frankolovo
00050000-55a3-d232-e1a1-9c3eb4940f4f	1274	Gabrovka
00050000-55a3-d232-2788-b61101b298d8	8254	Globoko
00050000-55a3-d232-aed0-63e861a6514e	5275	Godovič
00050000-55a3-d232-18b4-f8fe770aa2bb	4204	Golnik
00050000-55a3-d232-9e28-d50ec6f316b0	3303	Gomilsko
00050000-55a3-d232-e04c-04de237d5826	4224	Gorenja vas
00050000-55a3-d232-32ea-1ceb58117da9	3263	Gorica pri Slivnici
00050000-55a3-d232-6541-56c276f22274	2272	Gorišnica
00050000-55a3-d232-16e4-641e2bcda39e	9250	Gornja Radgona
00050000-55a3-d232-0e5a-3d9fbf168912	3342	Gornji Grad
00050000-55a3-d232-c06a-03c9b43fa3e6	4282	Gozd Martuljek
00050000-55a3-d232-083c-0b005f369f7c	6272	Gračišče
00050000-55a3-d232-9792-54be8e613185	9264	Grad
00050000-55a3-d232-675b-30443de91a77	8332	Gradac
00050000-55a3-d232-90ff-513cfd451c61	1384	Grahovo
00050000-55a3-d232-cb1f-119b2c392ef9	5242	Grahovo ob Bači
00050000-55a3-d232-641b-ca156415456e	5251	Grgar
00050000-55a3-d232-0575-210a0c000dd2	3302	Griže
00050000-55a3-d232-79c4-5e8be3c08181	3231	Grobelno
00050000-55a3-d232-c9ff-d976472683ec	1290	Grosuplje
00050000-55a3-d232-de27-216de90b747d	2288	Hajdina
00050000-55a3-d232-3196-a5047efb15df	8362	Hinje
00050000-55a3-d232-773d-d1c19262c586	2311	Hoče
00050000-55a3-d232-da75-df489ed66e28	9205	Hodoš/Hodos
00050000-55a3-d232-fd7c-9b0c1681cb8b	1354	Horjul
00050000-55a3-d232-c0cf-f278829d208e	1372	Hotedršica
00050000-55a3-d232-5ad7-4f1ce6d18e30	1430	Hrastnik
00050000-55a3-d232-e0f2-227f10efc810	6225	Hruševje
00050000-55a3-d232-1525-1fb703517812	4276	Hrušica
00050000-55a3-d232-78e1-ae5a7f8c8cf7	5280	Idrija
00050000-55a3-d232-8b29-0d265b05f8e5	1292	Ig
00050000-55a3-d232-3ce7-2600ea675a29	6250	Ilirska Bistrica
00050000-55a3-d232-f799-bf0382f724ca	6251	Ilirska Bistrica-Trnovo
00050000-55a3-d232-3977-a5e333217d42	1295	Ivančna Gorica
00050000-55a3-d232-4ff2-50a66c26828c	2259	Ivanjkovci
00050000-55a3-d232-c221-fda9bb91b5d3	1411	Izlake
00050000-55a3-d232-b1a2-e6d5fad24ffd	6310	Izola/Isola
00050000-55a3-d232-99b7-87ca119f7f7a	2222	Jakobski Dol
00050000-55a3-d232-3629-5fa2ed516936	2221	Jarenina
00050000-55a3-d232-416e-0874d3e90a06	6254	Jelšane
00050000-55a3-d232-83c9-037e7f9f3be7	4270	Jesenice
00050000-55a3-d232-3a57-cff813412a53	8261	Jesenice na Dolenjskem
00050000-55a3-d232-66e8-737462837a45	3273	Jurklošter
00050000-55a3-d232-43e9-67a9cb13c7bb	2223	Jurovski Dol
00050000-55a3-d232-3fe8-bc4d874323aa	2256	Juršinci
00050000-55a3-d232-1953-cef03f90c7da	5214	Kal nad Kanalom
00050000-55a3-d232-a6b0-e79a5ae50750	3233	Kalobje
00050000-55a3-d232-30ca-fbb50af2a354	4246	Kamna Gorica
00050000-55a3-d232-abb0-9b78da52d5f0	2351	Kamnica
00050000-55a3-d232-a4a7-2f48c9d84885	1241	Kamnik
00050000-55a3-d232-2fcc-81ece8215a89	5213	Kanal
00050000-55a3-d232-84a1-d4f09bdb0f39	8258	Kapele
00050000-55a3-d232-7138-be684c3d4337	2362	Kapla
00050000-55a3-d232-11c4-5f736a38a723	2325	Kidričevo
00050000-55a3-d232-a93c-f121c09dd2c0	1412	Kisovec
00050000-55a3-d232-8242-98f196ba24ec	6253	Knežak
00050000-55a3-d232-587c-5f7ba2c67fe6	5222	Kobarid
00050000-55a3-d232-ea9e-37d3d134c2f7	9227	Kobilje
00050000-55a3-d232-caa9-cac7c7b9108a	1330	Kočevje
00050000-55a3-d232-747c-1f7767ab80bc	1338	Kočevska Reka
00050000-55a3-d232-963a-90492ebefb3a	2276	Kog
00050000-55a3-d232-af13-a7cee48ed8ce	5211	Kojsko
00050000-55a3-d232-e20b-d861fdb78dae	6223	Komen
00050000-55a3-d232-7f33-12090c16dfcf	1218	Komenda
00050000-55a3-d232-fad5-526467f83457	6000	Koper/Capodistria 
00050000-55a3-d232-923f-8b27e5850fcc	6001	Koper/Capodistria - poštni predali
00050000-55a3-d232-8246-453930f8dfa5	8282	Koprivnica
00050000-55a3-d232-e9b8-ce44a3f652f3	5296	Kostanjevica na Krasu
00050000-55a3-d232-4e94-b6b50d9737f7	8311	Kostanjevica na Krki
00050000-55a3-d232-d4c5-05f05fd16ff1	1336	Kostel
00050000-55a3-d232-1f15-d1b245c2a819	6256	Košana
00050000-55a3-d232-3df5-7c125c164d2c	2394	Kotlje
00050000-55a3-d232-02d5-b56e802493eb	6240	Kozina
00050000-55a3-d232-9d24-5de79c8a0f26	3260	Kozje
00050000-55a3-d232-eec2-f595b85e1667	4000	Kranj 
00050000-55a3-d232-9a75-41fc48932b24	4001	Kranj - poštni predali
00050000-55a3-d232-1578-1e9e27673df3	4280	Kranjska Gora
00050000-55a3-d232-3b47-01e4858ec106	1281	Kresnice
00050000-55a3-d232-f984-12fe7c120ed0	4294	Križe
00050000-55a3-d232-c299-fd22b5ac4a31	9206	Križevci
00050000-55a3-d232-b037-7f5ee128a7d4	9242	Križevci pri Ljutomeru
00050000-55a3-d232-2394-103f0123f50a	1301	Krka
00050000-55a3-d232-b8dc-e53f7cf3ee50	8296	Krmelj
00050000-55a3-d232-02aa-24944636b623	4245	Kropa
00050000-55a3-d232-a1b3-2370a3881b95	8262	Krška vas
00050000-55a3-d232-121d-60bb2e127a7a	8270	Krško
00050000-55a3-d232-ef9a-d1bc473a2c7e	9263	Kuzma
00050000-55a3-d232-e01b-8bc1cb9daee8	2318	Laporje
00050000-55a3-d232-67e1-a8343f83d18a	3270	Laško
00050000-55a3-d232-cd27-174ad356f4c0	1219	Laze v Tuhinju
00050000-55a3-d232-84fe-bfce84896a2d	2230	Lenart v Slovenskih goricah
00050000-55a3-d232-636e-48d0a07c7457	9220	Lendava/Lendva
00050000-55a3-d232-f4f5-e7441d412b4f	4248	Lesce
00050000-55a3-d232-fbfe-d847b7413369	3261	Lesično
00050000-55a3-d232-bc34-aa2ef042c9aa	8273	Leskovec pri Krškem
00050000-55a3-d232-071e-57fefd146df3	2372	Libeliče
00050000-55a3-d232-f623-a1b057a1d99f	2341	Limbuš
00050000-55a3-d232-57c5-bf52a0b6174d	1270	Litija
00050000-55a3-d232-38f0-d2af55d87d6d	3202	Ljubečna
00050000-55a3-d232-c10c-ab5950056c2d	1000	Ljubljana 
00050000-55a3-d232-c74a-e0c52366f94e	1001	Ljubljana - poštni predali
00050000-55a3-d232-7779-e11235ba79d0	1231	Ljubljana - Črnuče
00050000-55a3-d232-55e3-526cba10a6c2	1261	Ljubljana - Dobrunje
00050000-55a3-d232-2e20-52a0006ca954	1260	Ljubljana - Polje
00050000-55a3-d232-aab7-458eb602a77c	1210	Ljubljana - Šentvid
00050000-55a3-d232-3b38-30b1dd900657	1211	Ljubljana - Šmartno
00050000-55a3-d232-3cb2-7d7d1bd057b7	3333	Ljubno ob Savinji
00050000-55a3-d232-991a-46ede76e8722	9240	Ljutomer
00050000-55a3-d232-3524-69ab9b81446b	3215	Loče
00050000-55a3-d232-8528-9df1d63765bf	5231	Log pod Mangartom
00050000-55a3-d232-c7c7-c83a91eafec1	1358	Log pri Brezovici
00050000-55a3-d232-0c64-b5b84fc8c541	1370	Logatec
00050000-55a3-d232-8a2b-f7e3bcc57ef0	1371	Logatec
00050000-55a3-d232-8845-18d0fb9753d4	1434	Loka pri Zidanem Mostu
00050000-55a3-d232-9b8a-f7e7a5c75e1e	3223	Loka pri Žusmu
00050000-55a3-d232-986b-2fcc8c2dc714	6219	Lokev
00050000-55a3-d232-2836-24ee8baeff81	1318	Loški Potok
00050000-55a3-d232-c119-b32a9bf50d98	2324	Lovrenc na Dravskem polju
00050000-55a3-d232-17e9-b35251f20954	2344	Lovrenc na Pohorju
00050000-55a3-d232-43a9-b8c8d826adcd	3334	Luče
00050000-55a3-d232-c9ff-3ca4216153a2	1225	Lukovica
00050000-55a3-d232-3734-23a336e6b267	9202	Mačkovci
00050000-55a3-d232-a982-33ecd447ef36	2322	Majšperk
00050000-55a3-d232-4e54-ca5b7ea83e4d	2321	Makole
00050000-55a3-d232-b09e-93f22c2f3bf7	9243	Mala Nedelja
00050000-55a3-d232-64de-10a810057765	2229	Malečnik
00050000-55a3-d232-fcd0-9fee41ab02f1	6273	Marezige
00050000-55a3-d232-4368-c28e732c09a3	2000	Maribor 
00050000-55a3-d232-c79f-5b600e1fe037	2001	Maribor - poštni predali
00050000-55a3-d232-5794-1819795a1693	2206	Marjeta na Dravskem polju
00050000-55a3-d232-fa1e-896551a3ceea	2281	Markovci
00050000-55a3-d232-0e36-c5ace83a8cfc	9221	Martjanci
00050000-55a3-d232-da34-f2244c273ef3	6242	Materija
00050000-55a3-d232-c079-fe1eb94aa079	4211	Mavčiče
00050000-55a3-d232-f848-ebd7873864cd	1215	Medvode
00050000-55a3-d232-440e-470c344c3bea	1234	Mengeš
00050000-55a3-d232-b248-8b696b4c9b41	8330	Metlika
00050000-55a3-d232-ce46-a7115603dc16	2392	Mežica
00050000-55a3-d232-b66d-f3a86661a60a	2204	Miklavž na Dravskem polju
00050000-55a3-d232-f0d5-8a0b9982dfcd	2275	Miklavž pri Ormožu
00050000-55a3-d232-91fe-d473f7a4db10	5291	Miren
00050000-55a3-d232-f4da-01e29095bb5e	8233	Mirna
00050000-55a3-d232-401c-009ea9ee1430	8216	Mirna Peč
00050000-55a3-d232-3920-ac39f7534562	2382	Mislinja
00050000-55a3-d232-e3f1-871dc80fed99	4281	Mojstrana
00050000-55a3-d232-0ca5-58dd4c1c7e7c	8230	Mokronog
00050000-55a3-d232-a22e-4eddf982c932	1251	Moravče
00050000-55a3-d232-f5ef-52051ae351b9	9226	Moravske Toplice
00050000-55a3-d232-42ec-bf1249fd0fc0	5216	Most na Soči
00050000-55a3-d232-37a9-731ed1faabec	1221	Motnik
00050000-55a3-d232-6b5c-5e5076ea7324	3330	Mozirje
00050000-55a3-d232-5b72-749d31edb280	9000	Murska Sobota 
00050000-55a3-d232-dc62-41e9779f8339	9001	Murska Sobota - poštni predali
00050000-55a3-d232-0ddb-f17c397d25a8	2366	Muta
00050000-55a3-d232-6e7e-7d2b946b4898	4202	Naklo
00050000-55a3-d232-fa24-249fa3d21edc	3331	Nazarje
00050000-55a3-d232-6e07-bcdbab95ea65	1357	Notranje Gorice
00050000-55a3-d232-c11f-120a6c620b66	3203	Nova Cerkev
00050000-55a3-d232-3567-df1a0c6f44e3	5000	Nova Gorica 
00050000-55a3-d232-c973-fea3cba1eba2	5001	Nova Gorica - poštni predali
00050000-55a3-d232-11e8-debb8eb50f35	1385	Nova vas
00050000-55a3-d232-2f89-2d6b4d5a985d	8000	Novo mesto
00050000-55a3-d232-c2b2-9603f201a602	8001	Novo mesto - poštni predali
00050000-55a3-d232-e3f7-fc9c4038504c	6243	Obrov
00050000-55a3-d232-68a9-d748dff01f35	9233	Odranci
00050000-55a3-d232-44a6-15e0cb09f299	2317	Oplotnica
00050000-55a3-d232-818a-4c0e236e3e21	2312	Orehova vas
00050000-55a3-d232-0481-3a779a7fb115	2270	Ormož
00050000-55a3-d232-6e09-8916d2ef3295	1316	Ortnek
00050000-55a3-d232-f32e-eff91f977dcc	1337	Osilnica
00050000-55a3-d232-d9d2-e7b755ef7fcf	8222	Otočec
00050000-55a3-d232-1e17-e717633b8a5f	2361	Ožbalt
00050000-55a3-d232-0cb2-f00cb3615506	2231	Pernica
00050000-55a3-d232-5ff6-e3c85a734b4b	2211	Pesnica pri Mariboru
00050000-55a3-d232-88ed-451cf5f7bdff	9203	Petrovci
00050000-55a3-d232-1a4d-bff6b3cf2004	3301	Petrovče
00050000-55a3-d232-3e7d-3619bb35ba51	6330	Piran/Pirano
00050000-55a3-d232-76cf-df6a8e2b7289	8255	Pišece
00050000-55a3-d232-9970-a20d17de0090	6257	Pivka
00050000-55a3-d232-2e4d-07dd86b00c05	6232	Planina
00050000-55a3-d232-b651-d31e7bbb799c	3225	Planina pri Sevnici
00050000-55a3-d232-5ce3-29c085794ac2	6276	Pobegi
00050000-55a3-d232-9410-5730b0659403	8312	Podbočje
00050000-55a3-d232-409a-43125b3789c6	5243	Podbrdo
00050000-55a3-d232-0090-26fc75f75162	3254	Podčetrtek
00050000-55a3-d232-2586-162134f9a9dc	2273	Podgorci
00050000-55a3-d232-b457-8d2b2f18c863	6216	Podgorje
00050000-55a3-d232-a5fc-3daf95756931	2381	Podgorje pri Slovenj Gradcu
00050000-55a3-d232-308e-a08608ee4c14	6244	Podgrad
00050000-55a3-d232-968e-9e0a81018406	1414	Podkum
00050000-55a3-d232-ee37-a8c0f71346be	2286	Podlehnik
00050000-55a3-d232-bf26-69ac3f03efda	5272	Podnanos
00050000-55a3-d232-d7fc-61e341aa44cc	4244	Podnart
00050000-55a3-d232-c1f2-74943d22bb19	3241	Podplat
00050000-55a3-d232-ea01-071b20a4550d	3257	Podsreda
00050000-55a3-d232-3336-9387e3995a28	2363	Podvelka
00050000-55a3-d232-266f-61ddc3e4a7e1	2208	Pohorje
00050000-55a3-d232-9659-fccdc0fd653f	2257	Polenšak
00050000-55a3-d232-8a8d-75d7c02eba68	1355	Polhov Gradec
00050000-55a3-d232-9b06-b857d9dca957	4223	Poljane nad Škofjo Loko
00050000-55a3-d232-471d-8db1a60c6fbf	2319	Poljčane
00050000-55a3-d232-3226-15b86b19b559	1272	Polšnik
00050000-55a3-d232-3ca1-175429794f0f	3313	Polzela
00050000-55a3-d232-af91-043cb5ca3a75	3232	Ponikva
00050000-55a3-d232-a979-c9ba87b236cb	6320	Portorož/Portorose
00050000-55a3-d232-0e2a-7f94552bd068	6230	Postojna
00050000-55a3-d232-554d-dfc4375e1e7f	2331	Pragersko
00050000-55a3-d232-d656-6d4c05f9cc86	3312	Prebold
00050000-55a3-d232-3d0c-1078d9036ccf	4205	Preddvor
00050000-55a3-d232-ccd0-0fe3a9b38eac	6255	Prem
00050000-55a3-d232-7aa7-045aec15f8c9	1352	Preserje
00050000-55a3-d232-f283-06b616e01e48	6258	Prestranek
00050000-55a3-d232-881b-069b9a5ed6af	2391	Prevalje
00050000-55a3-d232-3f60-996d121eb468	3262	Prevorje
00050000-55a3-d232-4139-eec1bbd8cd2c	1276	Primskovo 
00050000-55a3-d232-fc63-81d561bd0264	3253	Pristava pri Mestinju
00050000-55a3-d232-7f40-3768a55ab919	9207	Prosenjakovci/Partosfalva
00050000-55a3-d232-9d2f-120cc29515f3	5297	Prvačina
00050000-55a3-d232-d6f4-9275b2a6f9cd	2250	Ptuj
00050000-55a3-d232-d521-0b565ea5af32	2323	Ptujska Gora
00050000-55a3-d232-883b-7b1683f86c25	9201	Puconci
00050000-55a3-d232-63e5-6874d5c51b98	2327	Rače
00050000-55a3-d232-900e-2a97a0e99c54	1433	Radeče
00050000-55a3-d232-b7e9-d08e967af3a3	9252	Radenci
00050000-55a3-d232-6e14-31de47011504	2360	Radlje ob Dravi
00050000-55a3-d232-890b-1ec339e16547	1235	Radomlje
00050000-55a3-d232-1530-e765e2eb93fc	4240	Radovljica
00050000-55a3-d232-0320-620d690a7efd	8274	Raka
00050000-55a3-d232-f21e-c34ef1824f0b	1381	Rakek
00050000-55a3-d232-69f4-6e41233e8576	4283	Rateče - Planica
00050000-55a3-d232-ec6e-698f3e8e51f0	2390	Ravne na Koroškem
00050000-55a3-d232-3ed6-18ec73982cce	9246	Razkrižje
00050000-55a3-d232-f73a-df982b90995b	3332	Rečica ob Savinji
00050000-55a3-d232-dc85-bd7967926aff	5292	Renče
00050000-55a3-d232-cefa-7d913226bcc3	1310	Ribnica
00050000-55a3-d232-e8c9-c693ec0c85c1	2364	Ribnica na Pohorju
00050000-55a3-d232-b32f-9b657b5efb7b	3272	Rimske Toplice
00050000-55a3-d232-4c07-e5c2fe4c3c9a	1314	Rob
00050000-55a3-d232-769d-47bf706aad07	5215	Ročinj
00050000-55a3-d232-b39a-b9b7767e71c0	3250	Rogaška Slatina
00050000-55a3-d232-cde6-91e2e339e7d9	9262	Rogašovci
00050000-55a3-d232-1f6f-ddfe62ad91e2	3252	Rogatec
00050000-55a3-d232-546b-4b4fd5a4becb	1373	Rovte
00050000-55a3-d232-05ac-0044f7436ea9	2342	Ruše
00050000-55a3-d232-96a0-b68156d14a3a	1282	Sava
00050000-55a3-d232-95fe-ccb791870954	6333	Sečovlje/Sicciole
00050000-55a3-d232-a1b4-604681b4412f	4227	Selca
00050000-55a3-d232-bc00-51d2eb3bde18	2352	Selnica ob Dravi
00050000-55a3-d232-3dae-e3495dbc3f7c	8333	Semič
00050000-55a3-d232-4aa5-ca52500f824a	8281	Senovo
00050000-55a3-d232-8250-0d04deb19af8	6224	Senožeče
00050000-55a3-d232-3098-37906c8436d0	8290	Sevnica
00050000-55a3-d232-7e30-1163a583c0ec	6210	Sežana
00050000-55a3-d232-1991-e2b74a1efdb9	2214	Sladki Vrh
00050000-55a3-d232-87a4-b24d99666157	5283	Slap ob Idrijci
00050000-55a3-d232-2eb9-a38cb27b864b	2380	Slovenj Gradec
00050000-55a3-d232-9071-c9556e511e85	2310	Slovenska Bistrica
00050000-55a3-d232-281d-67cc43c05c3f	3210	Slovenske Konjice
00050000-55a3-d232-e09a-f23e5479d86d	1216	Smlednik
00050000-55a3-d232-98c0-f4342919082b	5232	Soča
00050000-55a3-d232-d660-771c16caa127	1317	Sodražica
00050000-55a3-d232-3354-b6665304cf0f	3335	Solčava
00050000-55a3-d232-bebd-c385cb28019d	5250	Solkan
00050000-55a3-d232-c8df-ed0e16829a88	4229	Sorica
00050000-55a3-d232-d499-434c1706ddec	4225	Sovodenj
00050000-55a3-d232-d8d3-e71f7482371a	5281	Spodnja Idrija
00050000-55a3-d232-eb84-237cf1a3fa98	2241	Spodnji Duplek
00050000-55a3-d232-65e0-810014cf19df	9245	Spodnji Ivanjci
00050000-55a3-d232-7a27-7101782343eb	2277	Središče ob Dravi
00050000-55a3-d232-a083-29ea1e9d53b6	4267	Srednja vas v Bohinju
00050000-55a3-d232-3a93-f4cd7ef2f398	8256	Sromlje 
00050000-55a3-d232-a02e-04371f7b3bb3	5224	Srpenica
00050000-55a3-d232-9fae-335268aa2f8a	1242	Stahovica
00050000-55a3-d232-70e1-1f575f1e3bbd	1332	Stara Cerkev
00050000-55a3-d232-319b-f88efe2ba8aa	8342	Stari trg ob Kolpi
00050000-55a3-d232-3d40-a4e94cf0af79	1386	Stari trg pri Ložu
00050000-55a3-d232-71cf-33088422ec76	2205	Starše
00050000-55a3-d232-3e1e-a29bafa2a9da	2289	Stoperce
00050000-55a3-d232-36db-702f6cb431bd	8322	Stopiče
00050000-55a3-d232-829c-570fee2f2d06	3206	Stranice
00050000-55a3-d232-f3f6-11241a9d532a	8351	Straža
00050000-55a3-d232-c6ec-bf98549fba35	1313	Struge
00050000-55a3-d232-54aa-1b7870629b6c	8293	Studenec
00050000-55a3-d232-d8de-3537f8244451	8331	Suhor
00050000-55a3-d232-8521-85232481bc83	2233	Sv. Ana v Slovenskih goricah
00050000-55a3-d232-588a-d1679c790161	2235	Sv. Trojica v Slovenskih goricah
00050000-55a3-d232-72ba-b87098bf2cb6	2353	Sveti Duh na Ostrem Vrhu
00050000-55a3-d232-aec5-8f3f343b23b0	9244	Sveti Jurij ob Ščavnici
00050000-55a3-d232-c773-1eb7c5712b17	3264	Sveti Štefan
00050000-55a3-d232-650e-29675a698806	2258	Sveti Tomaž
00050000-55a3-d232-8607-127c71aff73a	9204	Šalovci
00050000-55a3-d232-6c93-f80aaf9cb5b5	5261	Šempas
00050000-55a3-d232-da28-5d81d34e55af	5290	Šempeter pri Gorici
00050000-55a3-d232-161f-c3e2a594b5fd	3311	Šempeter v Savinjski dolini
00050000-55a3-d232-9e68-e8b32f66ebee	4208	Šenčur
00050000-55a3-d232-4134-7c0295a0df3b	2212	Šentilj v Slovenskih goricah
00050000-55a3-d232-944d-364587f969af	8297	Šentjanž
00050000-55a3-d232-ce7f-40af64288d57	2373	Šentjanž pri Dravogradu
00050000-55a3-d232-cedb-b42c5de6a1c1	8310	Šentjernej
00050000-55a3-d232-0024-dc809aa56c75	3230	Šentjur
00050000-55a3-d232-ddc1-ae36bf5e26d7	3271	Šentrupert
00050000-55a3-d232-d44f-9e5eb2340301	8232	Šentrupert
00050000-55a3-d232-7f36-5255c1aa5296	1296	Šentvid pri Stični
00050000-55a3-d232-2394-719515c4442b	8275	Škocjan
00050000-55a3-d232-f8ee-6269b4f82eed	6281	Škofije
00050000-55a3-d232-b2ca-26658005504c	4220	Škofja Loka
00050000-55a3-d232-3cf2-3a36d7930c82	3211	Škofja vas
00050000-55a3-d232-ed65-64e144bee42f	1291	Škofljica
00050000-55a3-d232-1ee0-11ff0d5b6048	6274	Šmarje
00050000-55a3-d232-1c88-5789af9060ac	1293	Šmarje - Sap
00050000-55a3-d232-6798-b99ba8b83413	3240	Šmarje pri Jelšah
00050000-55a3-d232-2001-84efce7a1e4a	8220	Šmarješke Toplice
00050000-55a3-d232-e032-6091160dadcb	2315	Šmartno na Pohorju
00050000-55a3-d232-708e-d7617549933e	3341	Šmartno ob Dreti
00050000-55a3-d232-0cec-0524bc1065e2	3327	Šmartno ob Paki
00050000-55a3-d232-2130-822c72b2b13a	1275	Šmartno pri Litiji
00050000-55a3-d232-5b90-6a41e69dafe1	2383	Šmartno pri Slovenj Gradcu
00050000-55a3-d232-0279-75e219ae7b5b	3201	Šmartno v Rožni dolini
00050000-55a3-d232-ed6f-cd0c29f13082	3325	Šoštanj
00050000-55a3-d232-a905-d73f856f2a56	6222	Štanjel
00050000-55a3-d232-c1a6-498790b9be70	3220	Štore
00050000-55a3-d232-026f-ba46c0d71b6b	3304	Tabor
00050000-55a3-d232-b5e5-d8fd20e4dbe9	3221	Teharje
00050000-55a3-d232-6d3e-8dc8d3b28014	9251	Tišina
00050000-55a3-d232-3c3a-2996d57503eb	5220	Tolmin
00050000-55a3-d232-7134-698aed7dd370	3326	Topolšica
00050000-55a3-d232-9392-e54f6f458299	2371	Trbonje
00050000-55a3-d232-4a3f-6f0934afb7ff	1420	Trbovlje
00050000-55a3-d232-b63d-f2b5353e402a	8231	Trebelno 
00050000-55a3-d232-631b-1f326b1ceab3	8210	Trebnje
00050000-55a3-d232-e959-1a3fbf6a5b11	5252	Trnovo pri Gorici
00050000-55a3-d232-084b-2eeb301828d8	2254	Trnovska vas
00050000-55a3-d232-dc00-77c01e6b405c	1222	Trojane
00050000-55a3-d232-80e2-09b8e92ae507	1236	Trzin
00050000-55a3-d232-ef25-ef04d5429ad2	4290	Tržič
00050000-55a3-d232-64e1-8883143f756f	8295	Tržišče
00050000-55a3-d232-3a51-94ae0c523deb	1311	Turjak
00050000-55a3-d232-fc2f-0339a581c5b1	9224	Turnišče
00050000-55a3-d232-15f1-a89c47e3d6ef	8323	Uršna sela
00050000-55a3-d232-5e24-36e087538d3b	1252	Vače
00050000-55a3-d232-3a98-dc7e3847b3b4	3320	Velenje 
00050000-55a3-d232-085f-70e8b7d7cb3b	3322	Velenje - poštni predali
00050000-55a3-d232-bbb2-0fd8e39519b8	8212	Velika Loka
00050000-55a3-d232-e81e-6da631e46442	2274	Velika Nedelja
00050000-55a3-d232-8197-9fd49c234b94	9225	Velika Polana
00050000-55a3-d232-c6aa-f782953a0bd5	1315	Velike Lašče
00050000-55a3-d232-0230-987df53fc9cc	8213	Veliki Gaber
00050000-55a3-d232-2c72-ba280b2822bb	9241	Veržej
00050000-55a3-d232-dded-888bdf2d00bc	1312	Videm - Dobrepolje
00050000-55a3-d232-afc2-8940a8e694bf	2284	Videm pri Ptuju
00050000-55a3-d232-c69c-9faa2dc0744f	8344	Vinica
00050000-55a3-d232-f49b-46ca06be59c2	5271	Vipava
00050000-55a3-d232-7f6a-3d995e580bf4	4212	Visoko
00050000-55a3-d232-0846-4c2a6abea2d1	1294	Višnja Gora
00050000-55a3-d232-2324-77e427316799	3205	Vitanje
00050000-55a3-d232-d8bb-008253dd7a51	2255	Vitomarci
00050000-55a3-d232-6460-fe9d244ccd3e	1217	Vodice
00050000-55a3-d232-79e6-d0f99ea46dee	3212	Vojnik\t
00050000-55a3-d232-a2fc-c22c66a56be5	5293	Volčja Draga
00050000-55a3-d232-fc93-1b2585ce0a3e	2232	Voličina
00050000-55a3-d232-094b-9839d66455aa	3305	Vransko
00050000-55a3-d232-ee10-4cf76db1b2c2	6217	Vremski Britof
00050000-55a3-d232-64b9-564f9945f8d8	1360	Vrhnika
00050000-55a3-d232-9edb-af5f5e38f3cf	2365	Vuhred
00050000-55a3-d232-1dd0-3cdbc7177a0e	2367	Vuzenica
00050000-55a3-d232-d899-a70c88a563f3	8292	Zabukovje 
00050000-55a3-d232-8955-d7aa144ece2d	1410	Zagorje ob Savi
00050000-55a3-d232-9bf8-7191d93b1727	1303	Zagradec
00050000-55a3-d232-19bb-8e95f390e49d	2283	Zavrč
00050000-55a3-d232-cc29-7897e4b21b36	8272	Zdole 
00050000-55a3-d232-48f4-6c82f6d31e50	4201	Zgornja Besnica
00050000-55a3-d232-47bf-a22e555091d1	2242	Zgornja Korena
00050000-55a3-d232-3abd-9380df5d7f5e	2201	Zgornja Kungota
00050000-55a3-d232-fbc0-b3be1151747e	2316	Zgornja Ložnica
00050000-55a3-d232-9aeb-dfba87602344	2314	Zgornja Polskava
00050000-55a3-d232-edf5-6c852fc510c6	2213	Zgornja Velka
00050000-55a3-d232-7eda-bdb70c75c095	4247	Zgornje Gorje
00050000-55a3-d232-425f-627e0b0d081b	4206	Zgornje Jezersko
00050000-55a3-d232-351a-329884966bc9	2285	Zgornji Leskovec
00050000-55a3-d232-0655-c759f82fc8b3	1432	Zidani Most
00050000-55a3-d232-3403-4a6a212185ac	3214	Zreče
00050000-55a3-d232-58b1-9fa925983db5	4209	Žabnica
00050000-55a3-d232-81d8-fb809c4ed7a3	3310	Žalec
00050000-55a3-d232-278c-ea0d62a0405e	4228	Železniki
00050000-55a3-d232-c509-e5b413ab0fc9	2287	Žetale
00050000-55a3-d232-9746-0641622c7bb4	4226	Žiri
00050000-55a3-d232-fc19-5b44291d42af	4274	Žirovnica
00050000-55a3-d232-0b5a-8c2b5dac0f2e	8360	Žužemberk
\.


--
-- TOC entry 2882 (class 0 OID 10077055)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 10076866)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 10076944)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 10077067)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 10077375)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 10077386)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55a3-d233-2f46-6b4bb6f43036	00080000-55a3-d233-5f32-019d76ed2074	0900	AK
00190000-55a3-d233-f369-a664c5653684	00080000-55a3-d233-f55a-8c6835d68ae2	0987	AK
00190000-55a3-d233-a90d-74d3178f2a75	00080000-55a3-d233-0133-a0797c27133c	0989	AK
00190000-55a3-d233-2d9e-01c5c8af8428	00080000-55a3-d233-ca53-b7a471c58548	0986	AK
00190000-55a3-d233-7754-1ede99f6fa14	00080000-55a3-d233-0945-8852cf561caa	0984	AK
00190000-55a3-d233-48aa-2dc647b56a36	00080000-55a3-d233-cf8a-db1a77600d7e	0983	AK
00190000-55a3-d233-50d7-07a5a23225ba	00080000-55a3-d233-c846-3174b2a8fba5	0982	AK
\.


--
-- TOC entry 2906 (class 0 OID 10077356)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-55a3-d233-273b-d660fd1eaf4e	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2851 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 10077096)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55a3-d233-2565-68abbf6fd2b2	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55a3-d233-8da8-7bbb0a89b5ce	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55a3-d233-6f4b-2d918339f83d	0003	Kazinska	t	84	Kazinska dvorana
00220000-55a3-d233-0610-1b5c8061b85f	0004	Mali oder	t	24	Mali oder 
00220000-55a3-d233-4227-d37ec67f691c	0005	Komorni oder	t	15	Komorni oder
00220000-55a3-d233-8b52-11f518d235e2	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55a3-d233-a39b-691e80865fe7	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2880 (class 0 OID 10077040)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 10077030)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 10077215)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 10077164)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 10076738)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2889 (class 0 OID 10077106)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 10076776)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55a3-d231-01f6-c1d5fc2a705f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55a3-d231-2b31-1149e647013f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55a3-d231-8037-717d4b0c864f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55a3-d231-f5eb-bfd7515d9f32	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55a3-d231-1446-22cb47c1f313	planer	Planer dogodkov v koledarju	t
00020000-55a3-d231-b7ba-ee14af48362c	kadrovska	Kadrovska služba	t
00020000-55a3-d231-bdc3-65fe4998b0a6	arhivar	Ažuriranje arhivalij	t
00020000-55a3-d231-7ba8-10564908edcf	igralec	Igralec	t
00020000-55a3-d231-ad0c-485b79f3d518	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55a3-d233-24a2-7549faf4c2d3	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2855 (class 0 OID 10076760)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55a3-d232-f5f4-74e93e89fa66	00020000-55a3-d231-8037-717d4b0c864f
00010000-55a3-d232-685d-938d7ecf9850	00020000-55a3-d231-8037-717d4b0c864f
00010000-55a3-d233-71c6-08a50009c5ad	00020000-55a3-d233-24a2-7549faf4c2d3
\.


--
-- TOC entry 2891 (class 0 OID 10077120)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 10077061)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 10077011)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 10077425)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55a3-d232-4023-1c76889ddb34	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55a3-d232-8707-634d9796862b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55a3-d232-1537-3c901d57d8fa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55a3-d232-7893-0a7d93cbaa6a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55a3-d232-f801-142fe4e158fd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2912 (class 0 OID 10077417)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55a3-d232-809a-89f6eebae2bd	00230000-55a3-d232-7893-0a7d93cbaa6a	popa
00240000-55a3-d232-60b2-8ca956adf017	00230000-55a3-d232-7893-0a7d93cbaa6a	oseba
00240000-55a3-d232-0ba9-9ceaf84c8033	00230000-55a3-d232-8707-634d9796862b	prostor
00240000-55a3-d232-f2d2-8848330824e9	00230000-55a3-d232-7893-0a7d93cbaa6a	besedilo
00240000-55a3-d232-3546-6403dec5646f	00230000-55a3-d232-7893-0a7d93cbaa6a	uprizoritev
00240000-55a3-d232-8957-02236813c061	00230000-55a3-d232-7893-0a7d93cbaa6a	funkcija
00240000-55a3-d232-6a3d-bd62d894e394	00230000-55a3-d232-7893-0a7d93cbaa6a	tipfunkcije
00240000-55a3-d232-4ccd-2bdb64b08956	00230000-55a3-d232-7893-0a7d93cbaa6a	alternacija
00240000-55a3-d232-8889-4ef22d467775	00230000-55a3-d232-4023-1c76889ddb34	pogodba
00240000-55a3-d232-e01a-a01a665fd3f5	00230000-55a3-d232-7893-0a7d93cbaa6a	zaposlitev
00240000-55a3-d232-e91a-f46aa018b78a	00230000-55a3-d232-4023-1c76889ddb34	programdela
\.


--
-- TOC entry 2911 (class 0 OID 10077412)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 10077174)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55a3-d233-ea17-618c54960ccf	000e0000-55a3-d233-3fda-9723016abf79	00080000-55a3-d233-60e7-68f6e680fc32	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55a3-d233-e16c-9e3231a57d80	000e0000-55a3-d233-3fda-9723016abf79	00080000-55a3-d233-60e7-68f6e680fc32	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55a3-d233-169f-4547e893ce3b	000e0000-55a3-d233-3fda-9723016abf79	00080000-55a3-d233-0903-da663f8ae3c6	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2862 (class 0 OID 10076838)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 10077017)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55a3-d234-a2d5-81e39a92969e	00180000-55a3-d233-d231-d45c680e17f3	000c0000-55a3-d233-a4c0-1237a8a3ac6e	00090000-55a3-d233-d92e-459085661c67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-d234-ce91-2eb88e3beac4	00180000-55a3-d233-d231-d45c680e17f3	000c0000-55a3-d233-e7fb-1f0e54f6867e	00090000-55a3-d233-dd32-30297025b16e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-d234-4423-e434d757206a	00180000-55a3-d233-d231-d45c680e17f3	000c0000-55a3-d233-86a6-a7263322a7b5	00090000-55a3-d233-9d0f-f421448e4fdc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-d234-6d48-7b697b71bfd5	00180000-55a3-d233-d231-d45c680e17f3	000c0000-55a3-d233-3b62-f1602d1ada81	00090000-55a3-d233-ec01-d99b944efd29	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-d234-48ed-040df2e06f87	00180000-55a3-d233-d231-d45c680e17f3	000c0000-55a3-d233-5d5a-324391761905	00090000-55a3-d233-a58a-5298f242a908	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55a3-d234-0fc7-04b0e3dd8015	00180000-55a3-d233-2849-dfb9b2866634	\N	00090000-55a3-d233-a58a-5298f242a908	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2898 (class 0 OID 10077204)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-55a3-d232-6fe8-e221a0d34d11	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-55a3-d232-f191-1b941f3048c8	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-55a3-d232-d281-c1128f7d15bc	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-55a3-d232-ff79-efae7479db50	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-55a3-d232-0ed0-79c864d5172e	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-55a3-d232-c61a-d1c7ba69c7cd	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-55a3-d232-7076-2ae245975f01	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-55a3-d232-0fa8-a529e1cf8622	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-55a3-d232-512b-48fea400f6fb	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-55a3-d232-e903-19013f9bc892	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-55a3-d232-4eeb-2c560aa30639	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-55a3-d232-4c88-901faf8c5ffc	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-55a3-d232-8011-9d8e8fa55ba9	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-55a3-d232-0dfc-309308c1f5d2	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-55a3-d232-f833-2447a51f1889	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-55a3-d232-fdc3-b5e658305cf1	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2909 (class 0 OID 10077394)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55a3-d232-8644-9df1d5fb1f24	01	Velika predstava	f	1.00	1.00
002b0000-55a3-d232-94f7-828bb5279bb2	02	Mala predstava	f	0.50	0.50
002b0000-55a3-d232-eacf-d0c8bc213344	03	Mala koprodukcija	t	0.40	1.00
002b0000-55a3-d232-cd7c-146f20e913ba	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55a3-d232-a2bf-d47fa23a4061	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2867 (class 0 OID 10076901)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 10076747)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55a3-d232-685d-938d7ecf9850	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObsXxZ5O66WzosqaXBRupIYPusrQagya	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55a3-d233-9e9a-bf64df929472	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55a3-d233-4aae-48ba0d8be4fc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55a3-d233-834a-92ec556217fc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55a3-d233-6000-23b9eadfd5da	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55a3-d233-bae8-d67f2147a20c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55a3-d233-d47e-3662ef889606	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55a3-d233-8770-5e063d32ed51	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55a3-d233-02fc-611f8e4a3dc4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55a3-d233-2913-0188f3f0af85	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55a3-d233-71c6-08a50009c5ad	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55a3-d232-f5f4-74e93e89fa66	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2902 (class 0 OID 10077252)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55a3-d233-7378-e7ad59cc85b0	00160000-55a3-d233-3938-3a541266c4f6	00150000-55a3-d232-e6f7-ac78b9bcb3eb	00140000-55a3-d231-b76b-de4825ce6e07	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55a3-d233-4227-d37ec67f691c
000e0000-55a3-d233-3fda-9723016abf79	00160000-55a3-d233-29c5-82c03d03e848	00150000-55a3-d232-93e2-95a27b0390a4	00140000-55a3-d231-26cb-ab9231dd340d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55a3-d233-8b52-11f518d235e2
000e0000-55a3-d233-0364-4cdbf518a0c7	\N	00150000-55a3-d232-93e2-95a27b0390a4	00140000-55a3-d231-26cb-ab9231dd340d	00190000-55a3-d233-f369-a664c5653684	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55a3-d233-4227-d37ec67f691c
000e0000-55a3-d233-7263-149a11adc0f8	\N	00150000-55a3-d232-93e2-95a27b0390a4	00140000-55a3-d231-26cb-ab9231dd340d	00190000-55a3-d233-f369-a664c5653684	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55a3-d233-4227-d37ec67f691c
000e0000-55a3-d233-9257-df39b91c7e7e	\N	00150000-55a3-d232-93e2-95a27b0390a4	00140000-55a3-d231-26cb-ab9231dd340d	00190000-55a3-d233-f369-a664c5653684	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55a3-d233-2565-68abbf6fd2b2
\.


--
-- TOC entry 2872 (class 0 OID 10076963)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55a3-d233-452b-5329f129eea3	000e0000-55a3-d233-3fda-9723016abf79	1	
00200000-55a3-d233-7eb0-67b776ba23e7	000e0000-55a3-d233-3fda-9723016abf79	2	
\.


--
-- TOC entry 2887 (class 0 OID 10077088)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 10077157)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55a3-d233-1052-7d196ac0d38b	00090000-55a3-d233-dd32-30297025b16e	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a3-d233-6294-0390e1e7b34d	00090000-55a3-d233-9d0f-f421448e4fdc	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55a3-d233-bef8-9921cb9c63f9	00090000-55a3-d233-bf04-341ab252024d	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2874 (class 0 OID 10076995)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 10077242)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55a3-d231-b76b-de4825ce6e07	01	Drama	drama (SURS 01)
00140000-55a3-d231-7a84-5ed694c314f6	02	Opera	opera (SURS 02)
00140000-55a3-d231-d16d-0fae70308ad3	03	Balet	balet (SURS 03)
00140000-55a3-d231-ce2e-d8abd076f857	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55a3-d231-0d66-e01be8fcf2a9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55a3-d231-26cb-ab9231dd340d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55a3-d231-6217-5b4a72e0cc20	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2893 (class 0 OID 10077147)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55a3-d232-67b9-e8866c69d643	01	Opera	opera
00150000-55a3-d232-aba4-5572d14784d0	02	Opereta	opereta
00150000-55a3-d232-0201-c31102e845dd	03	Balet	balet
00150000-55a3-d232-6831-d5bc3ae4fba3	04	Plesne prireditve	plesne prireditve
00150000-55a3-d232-9d03-5a24236543e5	05	Lutkovno gledališče	lutkovno gledališče
00150000-55a3-d232-26b8-e195743495ba	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55a3-d232-90d6-70f1f6ba9641	07	Biografska drama	biografska drama
00150000-55a3-d232-e6f7-ac78b9bcb3eb	08	Komedija	komedija
00150000-55a3-d232-cc24-e1b73614212c	09	Črna komedija	črna komedija
00150000-55a3-d232-098a-0eac8dbfc13d	10	E-igra	E-igra
00150000-55a3-d232-93e2-95a27b0390a4	11	Kriminalka	kriminalka
00150000-55a3-d232-e15b-3e9dde08c4df	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 10076801)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 10077299)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 10077289)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 10077203)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 10076985)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 10077010)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 10077410)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 10076927)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 10077351)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 10077143)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 10076961)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 10077004)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 10076941)
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
-- TOC entry 2538 (class 2606 OID 10077053)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 10077080)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 10076899)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 10076810)
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
-- TOC entry 2453 (class 2606 OID 10076834)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 10076790)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 10076775)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 10077086)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 10077119)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 10077237)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 10076863)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 10076887)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 10077059)
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
-- TOC entry 2468 (class 2606 OID 10076877)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 10076948)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 10077071)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 10077383)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 10077391)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 10077373)
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
-- TOC entry 2558 (class 2606 OID 10077103)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 10077044)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 10077035)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 10077225)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 10077171)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 10076746)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 10077110)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 10076764)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 10076784)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 10077128)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 10077066)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 10077016)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 10077434)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 10077422)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 10077416)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 10077184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 10076843)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 10077026)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 10077214)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 10077404)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 10076912)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 10076759)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 10077268)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 10076970)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 10077094)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 10077162)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 10076999)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 10077250)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 10077155)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 10076992)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2586 (class 1259 OID 10077185)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2587 (class 1259 OID 10077186)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2460 (class 1259 OID 10076865)
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
-- TOC entry 2551 (class 1259 OID 10077087)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2545 (class 1259 OID 10077073)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2546 (class 1259 OID 10077072)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 10076971)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 10077144)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2574 (class 1259 OID 10077146)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2575 (class 1259 OID 10077145)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 10076943)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 10076942)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 10077239)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2597 (class 1259 OID 10077240)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 10077241)
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
-- TOC entry 2605 (class 1259 OID 10077273)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2606 (class 1259 OID 10077270)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2607 (class 1259 OID 10077274)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2608 (class 1259 OID 10077272)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2609 (class 1259 OID 10077271)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 10076914)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 10076913)
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
-- TOC entry 2451 (class 1259 OID 10076837)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 10077111)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 10077005)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 10076791)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 10076792)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2566 (class 1259 OID 10077131)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2567 (class 1259 OID 10077130)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2568 (class 1259 OID 10077129)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 10076949)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 10076951)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 10076950)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2648 (class 1259 OID 10077424)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2525 (class 1259 OID 10077039)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2526 (class 1259 OID 10077037)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2527 (class 1259 OID 10077036)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2528 (class 1259 OID 10077038)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 10076765)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 10076766)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2554 (class 1259 OID 10077095)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2540 (class 1259 OID 10077060)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2582 (class 1259 OID 10077172)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2583 (class 1259 OID 10077173)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 10077355)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2627 (class 1259 OID 10077352)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 10077353)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2629 (class 1259 OID 10077354)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 10076879)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 10076878)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 10076880)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2425 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2633 (class 1259 OID 10077384)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2634 (class 1259 OID 10077385)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2619 (class 1259 OID 10077303)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 10077301)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 10077302)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2579 (class 1259 OID 10077163)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 10077048)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2532 (class 1259 OID 10077047)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2533 (class 1259 OID 10077045)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2534 (class 1259 OID 10077046)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2403 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 10077291)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 10077290)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2630 (class 1259 OID 10077374)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 10076962)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2645 (class 1259 OID 10077411)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2447 (class 1259 OID 10076812)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 10076811)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 10076844)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 10076845)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 10077029)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 10077028)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2522 (class 1259 OID 10077027)
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
-- TOC entry 2503 (class 1259 OID 10076994)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 10076990)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 10076987)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 10076988)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 10076986)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 10076991)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 10076989)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 10076864)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 10076928)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 10076930)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 10076929)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 10076931)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2539 (class 1259 OID 10077054)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 10077238)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 10077269)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 10076835)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 10076836)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2576 (class 1259 OID 10077156)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 10077435)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 10076900)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2651 (class 1259 OID 10077423)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2559 (class 1259 OID 10077105)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2560 (class 1259 OID 10077104)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 10077300)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 10077304)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 10076888)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 10077251)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 10077392)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 10077393)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 10076785)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 10076993)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2680 (class 2606 OID 10077571)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2683 (class 2606 OID 10077556)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2682 (class 2606 OID 10077561)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2678 (class 2606 OID 10077581)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2684 (class 2606 OID 10077551)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2679 (class 2606 OID 10077576)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2681 (class 2606 OID 10077566)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2714 (class 2606 OID 10077726)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 10077731)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 10077486)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2701 (class 2606 OID 10077666)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2699 (class 2606 OID 10077661)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2700 (class 2606 OID 10077656)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2677 (class 2606 OID 10077546)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 10077696)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 10077706)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2708 (class 2606 OID 10077701)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2671 (class 2606 OID 10077521)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 10077516)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2697 (class 2606 OID 10077646)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2717 (class 2606 OID 10077736)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 10077741)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 10077746)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2719 (class 2606 OID 10077766)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2722 (class 2606 OID 10077751)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2718 (class 2606 OID 10077771)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2720 (class 2606 OID 10077761)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2721 (class 2606 OID 10077756)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2669 (class 2606 OID 10077511)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 10077506)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 10077471)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2662 (class 2606 OID 10077466)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 10077676)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2685 (class 2606 OID 10077586)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2658 (class 2606 OID 10077446)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2657 (class 2606 OID 10077451)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2704 (class 2606 OID 10077691)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2705 (class 2606 OID 10077686)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2706 (class 2606 OID 10077681)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2675 (class 2606 OID 10077526)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 10077536)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2674 (class 2606 OID 10077531)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2738 (class 2606 OID 10077851)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2689 (class 2606 OID 10077621)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2691 (class 2606 OID 10077611)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2692 (class 2606 OID 10077606)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2690 (class 2606 OID 10077616)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2656 (class 2606 OID 10077436)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 10077441)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2702 (class 2606 OID 10077671)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2698 (class 2606 OID 10077651)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2712 (class 2606 OID 10077716)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2711 (class 2606 OID 10077721)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 10077821)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 10077806)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 10077811)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2730 (class 2606 OID 10077816)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2667 (class 2606 OID 10077496)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 10077491)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 10077501)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 10077831)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2734 (class 2606 OID 10077836)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2726 (class 2606 OID 10077796)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 10077801)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2728 (class 2606 OID 10077786)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2727 (class 2606 OID 10077791)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2710 (class 2606 OID 10077711)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 10077641)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2694 (class 2606 OID 10077636)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2696 (class 2606 OID 10077626)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2695 (class 2606 OID 10077631)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 10077781)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2724 (class 2606 OID 10077776)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2733 (class 2606 OID 10077826)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2676 (class 2606 OID 10077541)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2736 (class 2606 OID 10077841)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 10077846)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2659 (class 2606 OID 10077461)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2660 (class 2606 OID 10077456)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2664 (class 2606 OID 10077476)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 10077481)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 10077601)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 10077596)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2688 (class 2606 OID 10077591)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-13 16:59:01 CEST

--
-- PostgreSQL database dump complete
--

