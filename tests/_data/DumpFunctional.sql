--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-08 15:50:12 CEST

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
-- TOC entry 183 (class 1259 OID 9434874)
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
-- TOC entry 228 (class 1259 OID 9435372)
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
-- TOC entry 227 (class 1259 OID 9435355)
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
-- TOC entry 221 (class 1259 OID 9435268)
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
-- TOC entry 197 (class 1259 OID 9435053)
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
-- TOC entry 200 (class 1259 OID 9435087)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9435484)
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
-- TOC entry 192 (class 1259 OID 9434996)
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
-- TOC entry 229 (class 1259 OID 9435385)
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
-- TOC entry 216 (class 1259 OID 9435213)
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
-- TOC entry 195 (class 1259 OID 9435033)
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
-- TOC entry 199 (class 1259 OID 9435081)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9435013)
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
-- TOC entry 205 (class 1259 OID 9435130)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9435155)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9434970)
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
-- TOC entry 184 (class 1259 OID 9434883)
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
-- TOC entry 185 (class 1259 OID 9434894)
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
-- TOC entry 180 (class 1259 OID 9434848)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9434867)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9435162)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9435193)
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
-- TOC entry 224 (class 1259 OID 9435306)
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
-- TOC entry 187 (class 1259 OID 9434927)
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
-- TOC entry 189 (class 1259 OID 9434962)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9435136)
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
-- TOC entry 188 (class 1259 OID 9434947)
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
-- TOC entry 194 (class 1259 OID 9435025)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9435148)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9435454)
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
-- TOC entry 232 (class 1259 OID 9435465)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9435435)
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
-- TOC entry 212 (class 1259 OID 9435177)
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
-- TOC entry 204 (class 1259 OID 9435121)
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
-- TOC entry 203 (class 1259 OID 9435111)
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
-- TOC entry 223 (class 1259 OID 9435295)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9435245)
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
-- TOC entry 177 (class 1259 OID 9434819)
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
-- TOC entry 176 (class 1259 OID 9434817)
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
-- TOC entry 213 (class 1259 OID 9435187)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9434857)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9434841)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9435201)
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
-- TOC entry 207 (class 1259 OID 9435142)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9435092)
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
-- TOC entry 237 (class 1259 OID 9435504)
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
-- TOC entry 236 (class 1259 OID 9435496)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9435491)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9435255)
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
-- TOC entry 186 (class 1259 OID 9434919)
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
-- TOC entry 202 (class 1259 OID 9435098)
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
-- TOC entry 222 (class 1259 OID 9435284)
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
-- TOC entry 233 (class 1259 OID 9435473)
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
-- TOC entry 191 (class 1259 OID 9434982)
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
-- TOC entry 178 (class 1259 OID 9434828)
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
-- TOC entry 226 (class 1259 OID 9435332)
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
-- TOC entry 196 (class 1259 OID 9435044)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9435169)
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
-- TOC entry 218 (class 1259 OID 9435238)
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
-- TOC entry 198 (class 1259 OID 9435076)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9435322)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9435228)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9434822)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2857 (class 0 OID 9434874)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 9435372)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559d-2a93-5ae0-a1c470846f51	000d0000-559d-2a93-07ae-581be717a62d	\N	00090000-559d-2a93-aa34-8518c29ab4f9	\N	0001	f	\N	\N	\N	3	\N	\N	f	t
000c0000-559d-2a93-6208-edea75d20c1b	000d0000-559d-2a93-5077-9155552533ed	\N	00090000-559d-2a93-7ced-aa727b342b36	\N	0002	f	\N	\N	\N	8	\N	\N	f	f
000c0000-559d-2a93-6186-61837b595f8e	000d0000-559d-2a93-b2cd-6df5d85ab833	\N	00090000-559d-2a93-7fa1-a6f6cfcd9bca	\N	0003	f	\N	\N	\N	2	\N	\N	f	f
000c0000-559d-2a93-d255-583446aad255	000d0000-559d-2a93-1b25-66c705e3c057	\N	00090000-559d-2a93-5b97-b1084d611184	\N	0004	f	\N	\N	\N	26	\N	\N	f	f
000c0000-559d-2a93-4947-8ff4ce4efa1e	000d0000-559d-2a93-c80a-2a7590049405	\N	00090000-559d-2a93-289b-ff3e718c939d	\N	0005	f	\N	\N	\N	7	\N	\N	f	f
000c0000-559d-2a93-3f36-154687989308	000d0000-559d-2a93-4c4b-5694a35e5a23	\N	00090000-559d-2a93-a8cd-34494171633e	\N	0006	f	\N	\N	\N	1	\N	\N	f	t
000c0000-559d-2a93-9857-a82c7303d43a	000d0000-559d-2a93-e52d-4f35dcb77199	\N	00090000-559d-2a93-a343-3c5144c5f174	\N	0007	f	\N	\N	\N	14	\N	\N	f	t
000c0000-559d-2a93-8cca-ae8b185372f4	000d0000-559d-2a93-7272-55086512dca2	\N	00090000-559d-2a93-eaee-3d8659e72514	\N	0008	f	\N	\N	\N	12	\N	\N	f	t
\.


--
-- TOC entry 2901 (class 0 OID 9435355)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9435268)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559d-2a93-33b4-f7dfcd36aea4	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559d-2a93-9d99-c34e8d5bc913	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559d-2a93-0e57-3047b054e6f9	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2871 (class 0 OID 9435053)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559d-2a93-85d3-302c61cf8f55	\N	\N	00200000-559d-2a93-b639-2db3321c8428	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559d-2a93-4b1a-8845a76a176a	\N	\N	00200000-559d-2a93-9a85-f790f0969788	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559d-2a93-e5b1-afe0589e94d9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559d-2a93-e11a-230d57f469a7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559d-2a93-d3d8-10c2a8828854	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2874 (class 0 OID 9435087)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 9435484)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 9434996)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559d-2a91-3ef8-7fc0b23217d4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559d-2a91-cad6-cf3e39e51425	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559d-2a91-3145-3345b6bce4a6	AL	ALB	008	Albania 	Albanija	\N
00040000-559d-2a91-463f-6fd6d52314fe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559d-2a91-cd0e-f013bbf0a879	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559d-2a91-861c-0c33283b7e61	AD	AND	020	Andorra 	Andora	\N
00040000-559d-2a91-a579-dfda0059a3d9	AO	AGO	024	Angola 	Angola	\N
00040000-559d-2a91-a596-ada38150b64f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559d-2a91-2414-592a9ed84af2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559d-2a91-fd3d-8c6da737f73b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559d-2a91-d2ee-27334a3c3aba	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559d-2a91-7c2f-a22628a3bde8	AM	ARM	051	Armenia 	Armenija	\N
00040000-559d-2a91-4784-5b70f1bc3e16	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559d-2a91-ef21-f16d0082a9d7	AU	AUS	036	Australia 	Avstralija	\N
00040000-559d-2a91-3ea8-a25cfa76a1e3	AT	AUT	040	Austria 	Avstrija	\N
00040000-559d-2a91-408b-640169c82372	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559d-2a91-f8c2-36d8054b328f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559d-2a91-1a5d-421d7e0a6f60	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559d-2a91-07fe-0809d7ef2503	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559d-2a91-5329-d3261c22f0e7	BB	BRB	052	Barbados 	Barbados	\N
00040000-559d-2a91-fcdf-3ec4b9e87670	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559d-2a91-8f5b-9ea4abccec81	BE	BEL	056	Belgium 	Belgija	\N
00040000-559d-2a91-1a3e-afabaf18d299	BZ	BLZ	084	Belize 	Belize	\N
00040000-559d-2a91-97fc-85857e1e1fc4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559d-2a91-de5e-c92221484263	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559d-2a91-c205-5bb7a2f5c31f	BT	BTN	064	Bhutan 	Butan	\N
00040000-559d-2a91-6ed9-c5075b753f72	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559d-2a91-d741-ddbff296fe72	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559d-2a91-43b4-715632411ee9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559d-2a91-daec-a3578e52cf59	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559d-2a91-4d2c-c09cd6d910be	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559d-2a91-6ea7-acbb7699fca3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559d-2a91-f210-bbfe065aac30	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559d-2a91-fb5c-899ddf1e1e67	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559d-2a91-397e-fe8dd267e3e1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559d-2a91-e9e6-3985b48d5721	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559d-2a91-e112-f7e6f736f6f1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559d-2a91-623e-f1555ca13176	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559d-2a91-390a-3bcc8aff4dfa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559d-2a91-9787-aaa1bc6666df	CA	CAN	124	Canada 	Kanada	\N
00040000-559d-2a91-6b54-83c8bf8e7575	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559d-2a91-6228-d445af593ade	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559d-2a91-bc43-3f4398526534	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559d-2a91-2078-f0a9a264afef	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559d-2a91-3eed-50b39353e140	CL	CHL	152	Chile 	Čile	\N
00040000-559d-2a91-452e-de01ca6384c4	CN	CHN	156	China 	Kitajska	\N
00040000-559d-2a91-adc5-821e879eab3c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559d-2a91-7535-0c32296533cb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559d-2a91-2782-ca235a8098b9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559d-2a91-9efa-92e64b35e500	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559d-2a91-ee1a-2adbc705ba63	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559d-2a91-b082-67414f1a18f2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559d-2a91-eb7a-a5e17242502a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559d-2a91-0017-0cef92da47d8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559d-2a91-1ee5-056520f49318	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559d-2a91-b6f5-554125138fb8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559d-2a91-75e1-c5dd66b73283	CU	CUB	192	Cuba 	Kuba	\N
00040000-559d-2a91-c135-a5da6197419c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559d-2a91-3401-14a10d7e013b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559d-2a91-bc9a-e61f9f33469d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559d-2a91-f4cf-c672e999b531	DK	DNK	208	Denmark 	Danska	\N
00040000-559d-2a91-33a0-1286ce6ce46d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559d-2a91-d2e3-ac79577d1256	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559d-2a91-f1ad-9382ddbde23b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559d-2a91-1903-a17a6f17439a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559d-2a91-2572-8dd49701efa7	EG	EGY	818	Egypt 	Egipt	\N
00040000-559d-2a91-571d-f8cb1cd3527e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559d-2a91-1a5b-956cdd44b228	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559d-2a91-8246-01a079fb6622	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559d-2a91-34d8-522686025727	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559d-2a91-dfd8-25d2bcbaf7c7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559d-2a91-148e-4b262ff29546	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559d-2a91-fb97-d1a5e726edbd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559d-2a91-00db-843a9c86a002	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559d-2a91-0813-46104bd79aac	FI	FIN	246	Finland 	Finska	\N
00040000-559d-2a91-84a8-3fa6919c9822	FR	FRA	250	France 	Francija	\N
00040000-559d-2a91-7ed0-f4fc20bdaeed	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559d-2a91-f6d2-ad750d54723d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559d-2a91-ef9c-a2d7caafeda0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559d-2a91-c038-7140a1039fdd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559d-2a91-6ba1-23f3ab2bcaf0	GA	GAB	266	Gabon 	Gabon	\N
00040000-559d-2a91-cca9-9c91701deacf	GM	GMB	270	Gambia 	Gambija	\N
00040000-559d-2a91-d383-ddfb5778ad23	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559d-2a91-926e-dfa7ef546920	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559d-2a91-b25c-92f009566dfc	GH	GHA	288	Ghana 	Gana	\N
00040000-559d-2a91-6457-9dfa52cbf529	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559d-2a91-7c00-3bc415a16554	GR	GRC	300	Greece 	Grčija	\N
00040000-559d-2a91-1087-33d03fdf4b8a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559d-2a91-8922-8f54395439d1	GD	GRD	308	Grenada 	Grenada	\N
00040000-559d-2a91-4a80-d26435b62da8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559d-2a91-6388-fb2e6668e7ad	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559d-2a91-26ae-078485201542	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559d-2a91-08fb-b3a80393a067	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559d-2a91-a189-b5fc26cc64ca	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559d-2a91-cc8b-e4eb7218e038	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559d-2a91-38f2-73bcd3e7cb29	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559d-2a91-540f-99121487ffec	HT	HTI	332	Haiti 	Haiti	\N
00040000-559d-2a91-7549-f1a13de0edc7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559d-2a91-8ef1-9fd090d7dd64	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559d-2a91-fa0b-135b0d637887	HN	HND	340	Honduras 	Honduras	\N
00040000-559d-2a91-4fca-3aa0fcf649cf	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559d-2a91-fd73-cb3af2ad1aba	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559d-2a91-617d-2708be1c5454	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559d-2a91-8f5a-910d08cc1ad2	IN	IND	356	India 	Indija	\N
00040000-559d-2a91-a024-f62f4d81975e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559d-2a91-f530-e764d1c8734b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559d-2a91-6a04-e7b286e747ba	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559d-2a91-ab62-01b9a78110e5	IE	IRL	372	Ireland 	Irska	\N
00040000-559d-2a91-d95a-0daaad26f63d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559d-2a91-37ef-947531824153	IL	ISR	376	Israel 	Izrael	\N
00040000-559d-2a91-c938-d5cbb3996e51	IT	ITA	380	Italy 	Italija	\N
00040000-559d-2a91-c8fe-4768f3063dd2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559d-2a91-910f-27cb7f9d5c20	JP	JPN	392	Japan 	Japonska	\N
00040000-559d-2a91-ff30-a10c8ef73875	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559d-2a91-f456-27f596b548ae	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559d-2a91-54cc-fa4cf4bcdd58	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559d-2a91-d5d1-a02566b2ca10	KE	KEN	404	Kenya 	Kenija	\N
00040000-559d-2a91-8ca1-c77aada70094	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559d-2a91-83a7-00b9a1d44f5d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559d-2a91-d54b-1f31a8b657fb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559d-2a91-2cc3-dcfa9ddfd871	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559d-2a91-05fe-25f30de49b7f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559d-2a91-a961-0e8779ae3d3e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559d-2a91-110a-6c9efe838acc	LV	LVA	428	Latvia 	Latvija	\N
00040000-559d-2a91-85d1-67a983c2adbb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559d-2a91-8339-e1a3d45fd810	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559d-2a91-bea4-06c743d8307f	LR	LBR	430	Liberia 	Liberija	\N
00040000-559d-2a91-60d9-269e4f1e2f41	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559d-2a91-4f31-e172af199170	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559d-2a91-eefb-614bc764e9f4	LT	LTU	440	Lithuania 	Litva	\N
00040000-559d-2a91-590f-41792cb62638	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559d-2a91-2cca-5ef50e3956e1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559d-2a91-624a-8afedf263de5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559d-2a91-9ece-a1cad470aebd	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559d-2a91-5781-20c1fe8f77bf	MW	MWI	454	Malawi 	Malavi	\N
00040000-559d-2a91-5223-73de7f9feb70	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559d-2a91-f173-bddc3e05da78	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559d-2a91-a657-5d926b4239ab	ML	MLI	466	Mali 	Mali	\N
00040000-559d-2a91-328c-b66102ec2779	MT	MLT	470	Malta 	Malta	\N
00040000-559d-2a91-9420-ee4931e6e9ea	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559d-2a91-d078-77bca2b3bd73	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559d-2a91-91a4-f27f414ead78	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559d-2a91-63c8-07ba31c4ab49	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559d-2a91-fe49-eee17c338401	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559d-2a91-757a-7a78e8ceb2fa	MX	MEX	484	Mexico 	Mehika	\N
00040000-559d-2a91-0be3-21537d633978	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559d-2a91-0805-3d1055d2651a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559d-2a91-ec07-4b92cbcdd59c	MC	MCO	492	Monaco 	Monako	\N
00040000-559d-2a91-2541-d89822547506	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559d-2a91-056c-2f2352f757e2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559d-2a91-2615-63e83efe0864	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559d-2a91-4ef2-c6c92807b86c	MA	MAR	504	Morocco 	Maroko	\N
00040000-559d-2a91-71da-9dd413ca8be4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559d-2a91-cc09-c4f6522d84ca	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559d-2a91-c300-f88894dad72a	NA	NAM	516	Namibia 	Namibija	\N
00040000-559d-2a91-5e53-1c5faf232940	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559d-2a91-41d1-48898133dee9	NP	NPL	524	Nepal 	Nepal	\N
00040000-559d-2a91-fc44-4a97afe822e7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559d-2a91-1e3e-ab363d957d37	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559d-2a91-638a-899d0d8791e5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559d-2a91-17fb-987f8d60f0b4	NE	NER	562	Niger 	Niger 	\N
00040000-559d-2a91-e475-ee62ddb2d75a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559d-2a91-f9cd-f43d0eb23301	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559d-2a91-4098-183395df4b57	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559d-2a91-b013-1a1535e90394	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559d-2a91-d824-276932ef6a32	NO	NOR	578	Norway 	Norveška	\N
00040000-559d-2a91-8a8e-c2b8cb98746a	OM	OMN	512	Oman 	Oman	\N
00040000-559d-2a91-d695-0ea46112b80f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559d-2a91-0e29-4b09411feea1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559d-2a91-0d4d-1907deaab54c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559d-2a91-d7af-967d64409e45	PA	PAN	591	Panama 	Panama	\N
00040000-559d-2a91-e619-7245a469be74	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559d-2a91-5773-9fb97b437a47	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559d-2a91-16ef-81ca2d905361	PE	PER	604	Peru 	Peru	\N
00040000-559d-2a91-5c6c-3fdd550b85fb	PH	PHL	608	Philippines 	Filipini	\N
00040000-559d-2a91-5c54-ff59f96d973f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559d-2a91-5532-44a4543b7c99	PL	POL	616	Poland 	Poljska	\N
00040000-559d-2a91-42f6-0be3c625d6d8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559d-2a91-aea5-0da1ad867459	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559d-2a91-c9cf-a880eeb5ad62	QA	QAT	634	Qatar 	Katar	\N
00040000-559d-2a91-4355-24c0a4925061	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559d-2a91-e582-93c1becc7925	RO	ROU	642	Romania 	Romunija	\N
00040000-559d-2a91-ea3e-a3a23c9f577a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559d-2a91-cc61-c59b2d877b3d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559d-2a91-daad-6627985bec78	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559d-2a91-e801-09f800dafd56	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559d-2a91-c6d3-f7016f9213ad	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559d-2a91-b161-f836f5c5ec97	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559d-2a91-ad8b-17fa63729bcb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559d-2a91-94f9-7e45669a0c87	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559d-2a91-eaf7-0c9b706f307e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559d-2a91-5f07-b34411324ca8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559d-2a91-e349-506d2a5a228c	SM	SMR	674	San Marino 	San Marino	\N
00040000-559d-2a91-a69a-5fd76f02eec2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559d-2a91-3348-599190f26280	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559d-2a91-765a-a2ef6698b6f4	SN	SEN	686	Senegal 	Senegal	\N
00040000-559d-2a91-4668-8e7624f931f4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559d-2a91-2450-a267d2350679	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559d-2a91-7170-a0efddb18c3c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559d-2a91-5396-68ee2019be7b	SG	SGP	702	Singapore 	Singapur	\N
00040000-559d-2a91-f929-d867460b204e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559d-2a91-c7b7-e1c65a7179d3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559d-2a91-1aed-398ea5a325c6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559d-2a91-9f63-59304d91645c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559d-2a91-3362-c21edbc461fd	SO	SOM	706	Somalia 	Somalija	\N
00040000-559d-2a91-6bc5-c95b7044cdf3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559d-2a91-e4d8-9419f4a32e7f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559d-2a91-a391-86efb80d7cd4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559d-2a91-919e-dd45323de35e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559d-2a91-6f47-2f8b4d1dd6ca	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559d-2a91-4f57-2cf84d23f535	SD	SDN	729	Sudan 	Sudan	\N
00040000-559d-2a91-d09b-af9c20d53d5b	SR	SUR	740	Suriname 	Surinam	\N
00040000-559d-2a91-086d-5c0dae1003bd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559d-2a91-696d-a880b8903668	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559d-2a91-8a9e-8d831ea2960b	SE	SWE	752	Sweden 	Švedska	\N
00040000-559d-2a91-aff2-cc4151e0ec42	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559d-2a91-5a0b-1ae3bc74a6a7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559d-2a91-d711-36643a8b68ac	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559d-2a91-8dd4-d45004db13cd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559d-2a91-141c-87e6b418e879	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559d-2a91-b525-d5da27f26a55	TH	THA	764	Thailand 	Tajska	\N
00040000-559d-2a91-0b95-2d465cf724a7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559d-2a91-614d-969657fb20da	TG	TGO	768	Togo 	Togo	\N
00040000-559d-2a91-fceb-e882c487e9e5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559d-2a91-9741-aab664704d36	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559d-2a91-561f-981a3bb4e300	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559d-2a91-060c-607899433138	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559d-2a91-07c8-1c966611ad33	TR	TUR	792	Turkey 	Turčija	\N
00040000-559d-2a91-eb43-168ebbf7243d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559d-2a91-0e76-e7ca4d58fcbe	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559d-2a91-1db7-b485c04d3074	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559d-2a91-14f7-3c6d4aed27a8	UG	UGA	800	Uganda 	Uganda	\N
00040000-559d-2a91-1cfe-452cb7585403	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559d-2a91-4c6d-1403e37801f4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559d-2a91-42f8-49a337f7c5b5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559d-2a91-fb88-ecbf2b098983	US	USA	840	United States 	Združene države Amerike	\N
00040000-559d-2a91-b9c4-74fa0af8b18f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559d-2a91-128a-65d5c8571448	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559d-2a91-a025-d2308fbb2e6e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559d-2a91-a3d1-87c17302b3fd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559d-2a91-5942-27bc5b68a2b5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559d-2a91-fa7c-f1727c6e02eb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559d-2a91-2e3c-ab26c426e20d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559d-2a91-cb89-61ece8369d9f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559d-2a91-7868-984c42001bd1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559d-2a91-1aa1-3038ee13b85d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559d-2a91-1f85-1a06c7f0697b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559d-2a91-e283-fb2f0390e2c3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559d-2a91-3061-1f48b9adb779	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2903 (class 0 OID 9435385)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559d-2a93-90fa-1586cc292a7d	000e0000-559d-2a93-809f-dd9071de4729	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559d-2a92-9509-779d94ef86c8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559d-2a93-6865-e4b0accbd0fa	000e0000-559d-2a93-8758-f98690dba76a	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559d-2a92-1d7c-a6d139e613c0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2890 (class 0 OID 9435213)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559d-2a93-e52d-4f35dcb77199	000e0000-559d-2a93-8758-f98690dba76a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559d-2a92-51bb-229f964d9904
000d0000-559d-2a93-07ae-581be717a62d	000e0000-559d-2a93-8758-f98690dba76a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559d-2a92-51bb-229f964d9904
000d0000-559d-2a93-5077-9155552533ed	000e0000-559d-2a93-8758-f98690dba76a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559d-2a92-efa3-cfc8385d8c39
000d0000-559d-2a93-b2cd-6df5d85ab833	000e0000-559d-2a93-8758-f98690dba76a	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559d-2a92-e922-fff1c5dcc302
000d0000-559d-2a93-1b25-66c705e3c057	000e0000-559d-2a93-8758-f98690dba76a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559d-2a92-e922-fff1c5dcc302
000d0000-559d-2a93-c80a-2a7590049405	000e0000-559d-2a93-8758-f98690dba76a	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559d-2a92-e922-fff1c5dcc302
000d0000-559d-2a93-4c4b-5694a35e5a23	000e0000-559d-2a93-8758-f98690dba76a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559d-2a92-51bb-229f964d9904
000d0000-559d-2a93-7272-55086512dca2	000e0000-559d-2a93-8758-f98690dba76a	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559d-2a92-8598-5e82217f4ce9
\.


--
-- TOC entry 2869 (class 0 OID 9435033)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9435081)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9435013)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559d-2a93-84e9-ef9803da3d12	00080000-559d-2a93-671b-cebe9459c3bf	00090000-559d-2a93-aa34-8518c29ab4f9	AK		
\.


--
-- TOC entry 2844 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 9435130)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9435155)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 9434970)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559d-2a91-b7db-8604aa3f2da6	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559d-2a91-ae20-47fe1eacd6a8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559d-2a91-adae-91bbbaaefe45	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559d-2a91-d4a1-b0ed7c7bb8c3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559d-2a91-00aa-123351f1e9ab	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559d-2a91-6f9e-d58e37fbedc3	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559d-2a91-8f6e-b4cd708b04b5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559d-2a91-fe65-9e78867e2e8d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559d-2a91-cbd4-b01c6e15d882	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559d-2a91-df81-8f5c03c0c617	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559d-2a91-6043-0009e948de81	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559d-2a91-3220-053cfd074827	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559d-2a92-39a2-3d33d9628c25	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559d-2a93-a0ca-b331b75eb618	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559d-2a93-200e-ea3f0d18b63b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559d-2a93-6cef-459b3422aece	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559d-2a93-46df-ff1c3934719d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559d-2a93-3c33-4e07a1a16fa8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559d-2a93-531f-8a6677d94ac1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2858 (class 0 OID 9434883)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559d-2a93-6d63-5dc10348ec8a	00000000-559d-2a93-200e-ea3f0d18b63b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559d-2a93-f365-3d76bcb17444	00000000-559d-2a93-200e-ea3f0d18b63b	00010000-559d-2a91-93a6-cf8209516d5d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559d-2a93-a03e-2966bf33cb96	00000000-559d-2a93-6cef-459b3422aece	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2859 (class 0 OID 9434894)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559d-2a93-e25d-335ad88b673d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559d-2a93-5b97-b1084d611184	00010000-559d-2a93-101c-d5c305a98c4b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559d-2a93-7fa1-a6f6cfcd9bca	00010000-559d-2a93-72c1-774e1b75cede	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559d-2a93-f65a-3552e4b0a89c	00010000-559d-2a93-a606-ee5fe2e67e32	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559d-2a93-d91f-24d688d0462d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559d-2a93-a8cd-34494171633e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559d-2a93-d313-bc778efa7045	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559d-2a93-a343-3c5144c5f174	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559d-2a93-aa34-8518c29ab4f9	00010000-559d-2a93-5d03-be99f76da2b0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559d-2a93-7ced-aa727b342b36	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559d-2a93-1bca-4d068f637d1d	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559d-2a93-289b-ff3e718c939d	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559d-2a93-eaee-3d8659e72514	00010000-559d-2a93-e1c6-b382b354e5f8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2846 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 9434848)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559d-2a91-263b-a907fae73e89	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559d-2a91-7361-aa9117eb5271	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559d-2a91-1295-6ef84cc86407	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559d-2a91-9326-2347824dc060	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559d-2a91-64d3-37140df52c83	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559d-2a91-da0d-2845723a7c1c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-559d-2a91-49b4-dea08bbd14a8	Abonma-read	Abonma - branje	f
00030000-559d-2a91-7df8-2d5ef163dae2	Abonma-write	Abonma - spreminjanje	f
00030000-559d-2a91-c414-e24c5a24ad3f	Alternacija-read	Alternacija - branje	f
00030000-559d-2a91-81b7-bf316a0c7ba0	Alternacija-write	Alternacija - spreminjanje	f
00030000-559d-2a91-5966-6ee379fcf2d8	Arhivalija-read	Arhivalija - branje	f
00030000-559d-2a91-f949-51fcf4af07e7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559d-2a91-1cc4-248c895f1d46	Besedilo-read	Besedilo - branje	f
00030000-559d-2a91-18e7-96b37d8e705e	Besedilo-write	Besedilo - spreminjanje	f
00030000-559d-2a91-7732-f13de88be44b	DogodekIzven-read	DogodekIzven - branje	f
00030000-559d-2a91-b3bd-1ff6c1260b26	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559d-2a91-526c-228b34ca97da	Dogodek-read	Dogodek - branje	f
00030000-559d-2a91-8a20-9779e1c4f831	Dogodek-write	Dogodek - spreminjanje	f
00030000-559d-2a91-7384-1c69535ece1a	DrugiVir-read	DrugiVir - branje	f
00030000-559d-2a91-ff67-cdbfdb889eac	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559d-2a91-37a9-b5e743680ed7	Drzava-read	Drzava - branje	f
00030000-559d-2a91-5265-372de7d5ad35	Drzava-write	Drzava - spreminjanje	f
00030000-559d-2a91-1848-d951f6157eea	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559d-2a91-acba-96a8e4832988	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559d-2a91-f914-8fc456ef7553	Funkcija-read	Funkcija - branje	f
00030000-559d-2a91-891c-bbe44ef97f77	Funkcija-write	Funkcija - spreminjanje	f
00030000-559d-2a91-47a5-c198c68740cb	Gostovanje-read	Gostovanje - branje	f
00030000-559d-2a91-e121-d89dc3d77c75	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559d-2a91-b49f-223aa78d5ea1	Gostujoca-read	Gostujoca - branje	f
00030000-559d-2a91-4a74-a627a3f7c084	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559d-2a91-4704-b18d8bc0504b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559d-2a91-c703-b6187b94df4d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559d-2a91-253e-b1d8e5d04b91	Kupec-read	Kupec - branje	f
00030000-559d-2a91-4401-e8108054bc98	Kupec-write	Kupec - spreminjanje	f
00030000-559d-2a91-1b33-ea7297847616	NacinPlacina-read	NacinPlacina - branje	f
00030000-559d-2a91-7642-7582155f075c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559d-2a91-ac8b-66576659a736	Option-read	Option - branje	f
00030000-559d-2a91-8c4f-88662e77a759	Option-write	Option - spreminjanje	f
00030000-559d-2a91-7179-97854e5d8aa2	OptionValue-read	OptionValue - branje	f
00030000-559d-2a91-8365-69c8b939029a	OptionValue-write	OptionValue - spreminjanje	f
00030000-559d-2a91-628a-65c80d4b0253	Oseba-read	Oseba - branje	f
00030000-559d-2a91-9335-df38567d3b68	Oseba-write	Oseba - spreminjanje	f
00030000-559d-2a91-3f67-bf149cca66c0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559d-2a91-29fa-92c6bb0c5001	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559d-2a91-7598-8f6d7af17f29	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559d-2a91-bf92-5e1bbc6d6cac	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559d-2a91-9eaf-f5f50633fb54	Pogodba-read	Pogodba - branje	f
00030000-559d-2a91-705e-f81d1cae7d88	Pogodba-write	Pogodba - spreminjanje	f
00030000-559d-2a91-60fa-38503aa34b9a	Popa-read	Popa - branje	f
00030000-559d-2a91-6b95-a61e52e9304f	Popa-write	Popa - spreminjanje	f
00030000-559d-2a91-2d77-c9f0580a3c2a	Posta-read	Posta - branje	f
00030000-559d-2a91-2589-5bb30fe3765a	Posta-write	Posta - spreminjanje	f
00030000-559d-2a91-1be9-68bd1865f441	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559d-2a91-03af-f87b5d620c3f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559d-2a91-8f0f-80f34b2ef60a	PostniNaslov-read	PostniNaslov - branje	f
00030000-559d-2a91-b256-f1c59ea452f2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559d-2a91-ccd8-fb1645c973af	Predstava-read	Predstava - branje	f
00030000-559d-2a91-b65f-203eb05870cd	Predstava-write	Predstava - spreminjanje	f
00030000-559d-2a91-e7f4-9afcf8928be1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559d-2a91-a110-c8128464397e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559d-2a91-5bd6-923021917f65	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559d-2a91-f313-3020a8b31d29	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559d-2a91-22ef-b932391e5daa	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559d-2a91-ad66-638f88068daa	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559d-2a91-2ef0-adff2fd983a5	ProgramDela-read	ProgramDela - branje	f
00030000-559d-2a91-903d-973208cb5d6a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559d-2a91-1d75-7cbc80734223	ProgramFestival-read	ProgramFestival - branje	f
00030000-559d-2a91-a8cf-057c14f454c4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559d-2a91-1c82-3f349aa35f87	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559d-2a91-a6d0-6cb7406f22d4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559d-2a91-10a4-45d4b0071d02	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559d-2a91-64ef-c162672ab89d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559d-2a91-efb5-79a2063e1562	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559d-2a91-4be5-2a96ec796a57	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559d-2a91-5330-ae27dab42e3b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559d-2a91-1ddc-e7e1e309faa5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559d-2a91-86f9-44f8564fbd3b	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559d-2a91-ba29-364082905cd2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559d-2a91-eb82-9e47abeeba93	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559d-2a91-3432-577afb7c469c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559d-2a91-f6ba-c006a5f9ea09	ProgramRazno-read	ProgramRazno - branje	f
00030000-559d-2a91-8855-f4d4de4c3d59	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559d-2a91-50d6-6522105563e3	Prostor-read	Prostor - branje	f
00030000-559d-2a91-83ef-a6f93399793e	Prostor-write	Prostor - spreminjanje	f
00030000-559d-2a91-c2aa-b752ae5c4b31	Racun-read	Racun - branje	f
00030000-559d-2a91-7640-e7ea7b11c67b	Racun-write	Racun - spreminjanje	f
00030000-559d-2a91-1e8c-fd3aa701df48	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559d-2a91-0685-180b5ee64e2c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559d-2a91-111f-0f8b613be50e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559d-2a91-8c84-7ee757334183	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559d-2a91-24ff-292e53e729f1	Rekvizit-read	Rekvizit - branje	f
00030000-559d-2a91-1efc-8de5068572fa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559d-2a91-0093-c2c3d150e180	Revizija-read	Revizija - branje	f
00030000-559d-2a91-948a-631c643bb67b	Revizija-write	Revizija - spreminjanje	f
00030000-559d-2a91-8299-a8a5645ab413	Rezervacija-read	Rezervacija - branje	f
00030000-559d-2a91-5f5e-0e3a4ad92551	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559d-2a91-2d63-a7c574bd569d	SedezniRed-read	SedezniRed - branje	f
00030000-559d-2a91-b276-88e545c000b0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559d-2a91-0bbf-f800b667a320	Sedez-read	Sedez - branje	f
00030000-559d-2a91-e0a2-18b94af24659	Sedez-write	Sedez - spreminjanje	f
00030000-559d-2a91-5fc9-a780899f174b	Sezona-read	Sezona - branje	f
00030000-559d-2a91-062f-5b38ebf2a587	Sezona-write	Sezona - spreminjanje	f
00030000-559d-2a91-2f8f-4a65e17ef6f4	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559d-2a91-163a-e12da2c83582	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559d-2a91-0f83-6db1f68dac7c	Stevilcenje-read	Stevilcenje - branje	f
00030000-559d-2a91-5b24-d5e5d2918d3f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559d-2a91-9932-d498e8e0c9c8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559d-2a91-b4ad-0886e0967547	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559d-2a91-e767-5c5e8c98feaa	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559d-2a91-6143-e6dc4d3ea3f5	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559d-2a91-1139-86df19b02038	Telefonska-read	Telefonska - branje	f
00030000-559d-2a91-e155-1a570047fe82	Telefonska-write	Telefonska - spreminjanje	f
00030000-559d-2a91-8e4e-3015ffe606cb	TerminStoritve-read	TerminStoritve - branje	f
00030000-559d-2a91-e797-54a411e89cf0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559d-2a91-2eaf-c86b79821b4a	TipFunkcije-read	TipFunkcije - branje	f
00030000-559d-2a91-0614-dd2b2f44581d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559d-2a91-384b-b701b429b742	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559d-2a91-5e46-e9f5d8706dc5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559d-2a91-4756-3d256bd76da4	Trr-read	Trr - branje	f
00030000-559d-2a91-f401-1ae2028804ce	Trr-write	Trr - spreminjanje	f
00030000-559d-2a91-ceee-0eb2835b9a97	Uprizoritev-read	Uprizoritev - branje	f
00030000-559d-2a91-6b58-94fe7bf0b153	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559d-2a91-c6fb-1af13b991d1d	Vaja-read	Vaja - branje	f
00030000-559d-2a91-4afe-e427c4abfd4b	Vaja-write	Vaja - spreminjanje	f
00030000-559d-2a91-f0ef-d5872920ecf4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559d-2a91-02ed-9bb27f1c5606	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559d-2a91-6e32-1a9112fef4c6	Zaposlitev-read	Zaposlitev - branje	f
00030000-559d-2a91-a999-74fd7f71d8ce	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559d-2a91-e2bf-1773e51e5b42	Zasedenost-read	Zasedenost - branje	f
00030000-559d-2a91-06ca-de61a8fd222a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559d-2a91-7386-33aa1c08705b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559d-2a91-c53a-8a44f0f96bc3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559d-2a91-c791-d68c54d05296	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559d-2a91-6f14-f62fd26dd24a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2856 (class 0 OID 9434867)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559d-2a91-a7be-5ab9fe071645	00030000-559d-2a91-7361-aa9117eb5271
00020000-559d-2a91-5b51-ad068e6ec606	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-7df8-2d5ef163dae2
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-c414-e24c5a24ad3f
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-81b7-bf316a0c7ba0
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-9326-2347824dc060
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-8a20-9779e1c4f831
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-5265-372de7d5ad35
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-f914-8fc456ef7553
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-891c-bbe44ef97f77
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-e121-d89dc3d77c75
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-4a74-a627a3f7c084
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-4704-b18d8bc0504b
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-c703-b6187b94df4d
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-628a-65c80d4b0253
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-9335-df38567d3b68
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-6b95-a61e52e9304f
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-2589-5bb30fe3765a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-8f0f-80f34b2ef60a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-b256-f1c59ea452f2
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-b65f-203eb05870cd
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-22ef-b932391e5daa
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-ad66-638f88068daa
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-83ef-a6f93399793e
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-8c84-7ee757334183
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-1efc-8de5068572fa
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-062f-5b38ebf2a587
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-2eaf-c86b79821b4a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-ceee-0eb2835b9a97
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-6b58-94fe7bf0b153
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-c6fb-1af13b991d1d
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-4afe-e427c4abfd4b
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-e2bf-1773e51e5b42
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-06ca-de61a8fd222a
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a91-2a3c-c0d2c1b1b084	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-4704-b18d8bc0504b
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-c703-b6187b94df4d
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-628a-65c80d4b0253
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-9335-df38567d3b68
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-8f0f-80f34b2ef60a
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-b256-f1c59ea452f2
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-1139-86df19b02038
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-e155-1a570047fe82
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-4756-3d256bd76da4
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-f401-1ae2028804ce
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-6e32-1a9112fef4c6
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-a999-74fd7f71d8ce
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a91-bb0a-84981b26dfd5	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-c414-e24c5a24ad3f
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-f949-51fcf4af07e7
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-1cc4-248c895f1d46
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-7732-f13de88be44b
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-f914-8fc456ef7553
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-4704-b18d8bc0504b
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-628a-65c80d4b0253
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-22ef-b932391e5daa
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-2eaf-c86b79821b4a
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-c6fb-1af13b991d1d
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-e2bf-1773e51e5b42
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a91-8b38-8dc9fa1ea0bd	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-7df8-2d5ef163dae2
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-81b7-bf316a0c7ba0
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-2eaf-c86b79821b4a
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a91-642e-654a90cfc28e	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-8e4e-3015ffe606cb
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-1295-6ef84cc86407
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-2eaf-c86b79821b4a
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a91-6431-ce2fbfdd8eb0	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-263b-a907fae73e89
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7361-aa9117eb5271
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1295-6ef84cc86407
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-9326-2347824dc060
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-64d3-37140df52c83
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-da0d-2845723a7c1c
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-49b4-dea08bbd14a8
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7df8-2d5ef163dae2
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c414-e24c5a24ad3f
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-81b7-bf316a0c7ba0
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5966-6ee379fcf2d8
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f949-51fcf4af07e7
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1cc4-248c895f1d46
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-18e7-96b37d8e705e
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7732-f13de88be44b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b3bd-1ff6c1260b26
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-526c-228b34ca97da
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8a20-9779e1c4f831
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-37a9-b5e743680ed7
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5265-372de7d5ad35
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1848-d951f6157eea
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-acba-96a8e4832988
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f914-8fc456ef7553
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-891c-bbe44ef97f77
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-47a5-c198c68740cb
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e121-d89dc3d77c75
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b49f-223aa78d5ea1
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4a74-a627a3f7c084
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4704-b18d8bc0504b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c703-b6187b94df4d
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-253e-b1d8e5d04b91
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4401-e8108054bc98
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1b33-ea7297847616
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7642-7582155f075c
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-ac8b-66576659a736
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8c4f-88662e77a759
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7179-97854e5d8aa2
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8365-69c8b939029a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-628a-65c80d4b0253
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-9335-df38567d3b68
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-3f67-bf149cca66c0
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-29fa-92c6bb0c5001
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7598-8f6d7af17f29
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-bf92-5e1bbc6d6cac
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-9eaf-f5f50633fb54
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-705e-f81d1cae7d88
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-60fa-38503aa34b9a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-6b95-a61e52e9304f
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2d77-c9f0580a3c2a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2589-5bb30fe3765a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1be9-68bd1865f441
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-03af-f87b5d620c3f
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8f0f-80f34b2ef60a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b256-f1c59ea452f2
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-ccd8-fb1645c973af
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b65f-203eb05870cd
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e7f4-9afcf8928be1
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-a110-c8128464397e
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5bd6-923021917f65
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f313-3020a8b31d29
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-22ef-b932391e5daa
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-ad66-638f88068daa
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2ef0-adff2fd983a5
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-903d-973208cb5d6a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1d75-7cbc80734223
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-a8cf-057c14f454c4
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1c82-3f349aa35f87
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-a6d0-6cb7406f22d4
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-10a4-45d4b0071d02
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-64ef-c162672ab89d
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-efb5-79a2063e1562
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4be5-2a96ec796a57
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5330-ae27dab42e3b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1ddc-e7e1e309faa5
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-86f9-44f8564fbd3b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-ba29-364082905cd2
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-eb82-9e47abeeba93
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-3432-577afb7c469c
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f6ba-c006a5f9ea09
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8855-f4d4de4c3d59
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-50d6-6522105563e3
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-83ef-a6f93399793e
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c2aa-b752ae5c4b31
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7640-e7ea7b11c67b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1e8c-fd3aa701df48
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-0685-180b5ee64e2c
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-111f-0f8b613be50e
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8c84-7ee757334183
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-24ff-292e53e729f1
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1efc-8de5068572fa
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-0093-c2c3d150e180
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-948a-631c643bb67b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8299-a8a5645ab413
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5f5e-0e3a4ad92551
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2d63-a7c574bd569d
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b276-88e545c000b0
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-0bbf-f800b667a320
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e0a2-18b94af24659
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5fc9-a780899f174b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-062f-5b38ebf2a587
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2f8f-4a65e17ef6f4
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-163a-e12da2c83582
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-0f83-6db1f68dac7c
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5b24-d5e5d2918d3f
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-9932-d498e8e0c9c8
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-b4ad-0886e0967547
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e767-5c5e8c98feaa
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-6143-e6dc4d3ea3f5
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-1139-86df19b02038
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e155-1a570047fe82
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-8e4e-3015ffe606cb
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e797-54a411e89cf0
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-2eaf-c86b79821b4a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-0614-dd2b2f44581d
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-384b-b701b429b742
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-5e46-e9f5d8706dc5
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4756-3d256bd76da4
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f401-1ae2028804ce
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-ceee-0eb2835b9a97
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-6b58-94fe7bf0b153
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c6fb-1af13b991d1d
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-4afe-e427c4abfd4b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-f0ef-d5872920ecf4
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-02ed-9bb27f1c5606
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-6e32-1a9112fef4c6
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-a999-74fd7f71d8ce
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-e2bf-1773e51e5b42
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-06ca-de61a8fd222a
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-7386-33aa1c08705b
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c53a-8a44f0f96bc3
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-c791-d68c54d05296
00020000-559d-2a93-d6b0-4a7ded9acef2	00030000-559d-2a91-6f14-f62fd26dd24a
\.


--
-- TOC entry 2884 (class 0 OID 9435162)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 9435193)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9435306)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559d-2a93-a407-f81ec7872e87	00090000-559d-2a93-e25d-335ad88b673d	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	Pogodba o sodelovanju
000b0000-559d-2a93-5a76-fda44c31072f	00090000-559d-2a93-a8cd-34494171633e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	Pogodba za vlogo Helena
000b0000-559d-2a93-682a-73d466e9b4e7	00090000-559d-2a93-eaee-3d8659e72514	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2861 (class 0 OID 9434927)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559d-2a93-671b-cebe9459c3bf	00040000-559d-2a91-1aed-398ea5a325c6	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-dd06-297c2d8530d4	00040000-559d-2a91-1aed-398ea5a325c6	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559d-2a93-2532-233cbe6a203c	00040000-559d-2a91-1aed-398ea5a325c6	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-78b9-92c71124be5e	00040000-559d-2a91-1aed-398ea5a325c6	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-7a35-6804af2092f1	00040000-559d-2a91-1aed-398ea5a325c6	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-50e3-48bbb8fcec28	00040000-559d-2a91-d2ee-27334a3c3aba	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-2f24-9364acad5605	00040000-559d-2a91-b6f5-554125138fb8	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-dfcf-a343420558bb	00040000-559d-2a91-3ea8-a25cfa76a1e3	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559d-2a93-9494-2814138e1c64	00040000-559d-2a91-1aed-398ea5a325c6	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2863 (class 0 OID 9434962)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559d-2a92-d344-fbdac0183419	8341	Adlešiči
00050000-559d-2a92-9cd1-593c153d3de0	5270	Ajdovščina
00050000-559d-2a92-41f4-dadc391067c8	6280	Ankaran/Ancarano
00050000-559d-2a92-a3f6-3f59e1b7ea08	9253	Apače
00050000-559d-2a92-cf7f-aab30bc02672	8253	Artiče
00050000-559d-2a92-1291-d7676cc71d66	4275	Begunje na Gorenjskem
00050000-559d-2a92-d9f5-87ba476eac39	1382	Begunje pri Cerknici
00050000-559d-2a92-ec6e-a73c24873a01	9231	Beltinci
00050000-559d-2a92-2395-9e9aaa2343f6	2234	Benedikt
00050000-559d-2a92-6d6b-47303c57adb4	2345	Bistrica ob Dravi
00050000-559d-2a92-3e8f-34ece2670f10	3256	Bistrica ob Sotli
00050000-559d-2a92-0482-fd0982aaf107	8259	Bizeljsko
00050000-559d-2a92-9d04-9caf1c9d31be	1223	Blagovica
00050000-559d-2a92-badd-c4227015624d	8283	Blanca
00050000-559d-2a92-14d4-71e319646e9b	4260	Bled
00050000-559d-2a92-7b84-113f438523e4	4273	Blejska Dobrava
00050000-559d-2a92-b1e2-863678b91333	9265	Bodonci
00050000-559d-2a92-570f-536dd3141fca	9222	Bogojina
00050000-559d-2a92-6f57-cfead3d5fdc1	4263	Bohinjska Bela
00050000-559d-2a92-d545-04113b727597	4264	Bohinjska Bistrica
00050000-559d-2a92-fa0a-1620d921833f	4265	Bohinjsko jezero
00050000-559d-2a92-d70a-7d8857c5dade	1353	Borovnica
00050000-559d-2a92-7ebc-e24564337236	8294	Boštanj
00050000-559d-2a92-1180-6fd56766806e	5230	Bovec
00050000-559d-2a92-0c27-639ac57f1091	5295	Branik
00050000-559d-2a92-bcfe-4c0830d395b8	3314	Braslovče
00050000-559d-2a92-43d3-f9d488368bc1	5223	Breginj
00050000-559d-2a92-3437-c9bc1006834b	8280	Brestanica
00050000-559d-2a92-2fe9-3d0b963bb49b	2354	Bresternica
00050000-559d-2a92-9912-40a20f9c9ba7	4243	Brezje
00050000-559d-2a92-7974-de20e96fd11f	1351	Brezovica pri Ljubljani
00050000-559d-2a92-7873-946c901b4060	8250	Brežice
00050000-559d-2a92-2eca-18def1a064b4	4210	Brnik - Aerodrom
00050000-559d-2a92-c533-8f2cfd2ea2fb	8321	Brusnice
00050000-559d-2a92-c24d-431d0eb01928	3255	Buče
00050000-559d-2a92-f4c9-23f03a318229	8276	Bučka 
00050000-559d-2a92-aa04-dd38c9ba050f	9261	Cankova
00050000-559d-2a92-2495-b792b8aed69f	3000	Celje 
00050000-559d-2a92-b4ef-bf8e78f2aa34	3001	Celje - poštni predali
00050000-559d-2a92-5d5d-a9806846c60e	4207	Cerklje na Gorenjskem
00050000-559d-2a92-bb2d-df552f64eb71	8263	Cerklje ob Krki
00050000-559d-2a92-1010-d8dc44c2e29f	1380	Cerknica
00050000-559d-2a92-67e8-72aa2ff7b7c6	5282	Cerkno
00050000-559d-2a92-210b-ca9724f14a9f	2236	Cerkvenjak
00050000-559d-2a92-9c16-5d0ce5b8460a	2215	Ceršak
00050000-559d-2a92-2f00-d73cf102fcc1	2326	Cirkovce
00050000-559d-2a92-fb25-6f091b407186	2282	Cirkulane
00050000-559d-2a92-2907-975024a80ba8	5273	Col
00050000-559d-2a92-91c2-ddc9502ee020	8251	Čatež ob Savi
00050000-559d-2a92-8e97-a0ab96b08ab3	1413	Čemšenik
00050000-559d-2a92-dcec-3d7c2c62199a	5253	Čepovan
00050000-559d-2a92-01a3-7cece81aee14	9232	Črenšovci
00050000-559d-2a92-6068-6c1ad67c0ddc	2393	Črna na Koroškem
00050000-559d-2a92-368e-7690a2fc6345	6275	Črni Kal
00050000-559d-2a92-669a-950f1020ee9a	5274	Črni Vrh nad Idrijo
00050000-559d-2a92-1884-a1062107d5a9	5262	Črniče
00050000-559d-2a92-ff34-9f574b3ffcb5	8340	Črnomelj
00050000-559d-2a92-fa7e-854cad46cd18	6271	Dekani
00050000-559d-2a92-ce01-84f0fa26acde	5210	Deskle
00050000-559d-2a92-284b-43dfc07d4089	2253	Destrnik
00050000-559d-2a92-887a-40c5f1a6eb27	6215	Divača
00050000-559d-2a92-19e5-63bfe2bcf5ba	1233	Dob
00050000-559d-2a92-8918-a5a5e6eae4a9	3224	Dobje pri Planini
00050000-559d-2a92-1243-a9a189eceab2	8257	Dobova
00050000-559d-2a92-dbd5-da8d4c5ce2f7	1423	Dobovec
00050000-559d-2a92-024c-38dbfbd7d4ec	5263	Dobravlje
00050000-559d-2a92-b8b4-855536678fc4	3204	Dobrna
00050000-559d-2a92-cf5e-54a41da41b69	8211	Dobrnič
00050000-559d-2a92-211c-9c5959943c9d	1356	Dobrova
00050000-559d-2a92-d3d8-30c4e01c20e5	9223	Dobrovnik/Dobronak 
00050000-559d-2a92-ef34-1ff706bc331f	5212	Dobrovo v Brdih
00050000-559d-2a92-3716-4c48769c22ed	1431	Dol pri Hrastniku
00050000-559d-2a92-461f-4b8b7faafb7d	1262	Dol pri Ljubljani
00050000-559d-2a92-b6c1-3c10a7b68656	1273	Dole pri Litiji
00050000-559d-2a92-83cd-c93a50ed2b44	1331	Dolenja vas
00050000-559d-2a92-d313-b8bee3ad1b6e	8350	Dolenjske Toplice
00050000-559d-2a92-6f5d-8753326b765e	1230	Domžale
00050000-559d-2a92-925f-1e53fb47432d	2252	Dornava
00050000-559d-2a92-290c-0782f10b1ca7	5294	Dornberk
00050000-559d-2a92-040f-3a6284a9ab61	1319	Draga
00050000-559d-2a92-9207-d6a8cab03dfd	8343	Dragatuš
00050000-559d-2a92-1224-d888eb7d1d16	3222	Dramlje
00050000-559d-2a92-f294-4e9b61379f2e	2370	Dravograd
00050000-559d-2a92-f5db-18ff2e84e1a6	4203	Duplje
00050000-559d-2a92-13ed-1361f182716f	6221	Dutovlje
00050000-559d-2a92-8d0f-85e23d0e240a	8361	Dvor
00050000-559d-2a92-7144-b123ea9d8503	2343	Fala
00050000-559d-2a92-4b3a-77b28c836123	9208	Fokovci
00050000-559d-2a92-97ab-6c3e7a118e8c	2313	Fram
00050000-559d-2a92-930e-fa893320a9be	3213	Frankolovo
00050000-559d-2a92-6e2b-a231a422293b	1274	Gabrovka
00050000-559d-2a92-76e8-8289beb7167a	8254	Globoko
00050000-559d-2a92-4b86-333499ebcd88	5275	Godovič
00050000-559d-2a92-c6bf-2d9e67873704	4204	Golnik
00050000-559d-2a92-8abc-10e2a2cea316	3303	Gomilsko
00050000-559d-2a92-45a8-088e9f3ab850	4224	Gorenja vas
00050000-559d-2a92-43a3-efe2e63ddbdf	3263	Gorica pri Slivnici
00050000-559d-2a92-fb80-459060e6c09a	2272	Gorišnica
00050000-559d-2a92-4738-323d2c861175	9250	Gornja Radgona
00050000-559d-2a92-b780-2199a104de19	3342	Gornji Grad
00050000-559d-2a92-e01a-07ee271cf268	4282	Gozd Martuljek
00050000-559d-2a92-e395-ae5f4a31f87b	6272	Gračišče
00050000-559d-2a92-2b43-efd760c50105	9264	Grad
00050000-559d-2a92-d2fe-c21608d4a4d8	8332	Gradac
00050000-559d-2a92-4311-fd38f6120b48	1384	Grahovo
00050000-559d-2a92-8cea-ab3cb3e3b0f7	5242	Grahovo ob Bači
00050000-559d-2a92-363c-738b301a2ea9	5251	Grgar
00050000-559d-2a92-e5ba-c629f1ba58b7	3302	Griže
00050000-559d-2a92-e054-d1ef8071749f	3231	Grobelno
00050000-559d-2a92-6603-c281e26b08f9	1290	Grosuplje
00050000-559d-2a92-fd0c-4053a29714ed	2288	Hajdina
00050000-559d-2a92-3729-f741d3188fe2	8362	Hinje
00050000-559d-2a92-0ad3-f2e32373ce79	2311	Hoče
00050000-559d-2a92-5c3c-6cbe3779b5f9	9205	Hodoš/Hodos
00050000-559d-2a92-ef2b-ad425cbfac8a	1354	Horjul
00050000-559d-2a92-79e4-4b5ccdc94f89	1372	Hotedršica
00050000-559d-2a92-a88b-e492de064d1e	1430	Hrastnik
00050000-559d-2a92-d912-7fccfe0d7476	6225	Hruševje
00050000-559d-2a92-32e7-ae3274da876d	4276	Hrušica
00050000-559d-2a92-2801-a03c99a3707c	5280	Idrija
00050000-559d-2a92-cd3a-9fe531fd698e	1292	Ig
00050000-559d-2a92-be22-9b1ca1531172	6250	Ilirska Bistrica
00050000-559d-2a92-ad7e-f3c591b4d8ea	6251	Ilirska Bistrica-Trnovo
00050000-559d-2a92-228d-4a9ae7bb2cdc	1295	Ivančna Gorica
00050000-559d-2a92-4b6d-62b0015904b0	2259	Ivanjkovci
00050000-559d-2a92-67d3-f9e8dd246894	1411	Izlake
00050000-559d-2a92-7749-b0ed10fadbb7	6310	Izola/Isola
00050000-559d-2a92-7ba2-101c478f05f4	2222	Jakobski Dol
00050000-559d-2a92-ce8a-0d04901a8cf8	2221	Jarenina
00050000-559d-2a92-ee25-2892920e898c	6254	Jelšane
00050000-559d-2a92-692d-d2213853b770	4270	Jesenice
00050000-559d-2a92-6bcb-b5a0d3c95156	8261	Jesenice na Dolenjskem
00050000-559d-2a92-ee15-addc20fb7d2a	3273	Jurklošter
00050000-559d-2a92-c330-f2c0b63eeeca	2223	Jurovski Dol
00050000-559d-2a92-323f-d2add2e12bd0	2256	Juršinci
00050000-559d-2a92-bb16-e88977615478	5214	Kal nad Kanalom
00050000-559d-2a92-e412-d0e6478c7127	3233	Kalobje
00050000-559d-2a92-0aea-928b403a8e4d	4246	Kamna Gorica
00050000-559d-2a92-acb2-e277e48ed3f3	2351	Kamnica
00050000-559d-2a92-2a9b-f1528bb505b9	1241	Kamnik
00050000-559d-2a92-1273-6ca96b5ae01f	5213	Kanal
00050000-559d-2a92-3b59-e4d2d4fc891d	8258	Kapele
00050000-559d-2a92-aec2-dbe2d399aeb3	2362	Kapla
00050000-559d-2a92-8027-697ab3199038	2325	Kidričevo
00050000-559d-2a92-4ed8-ad9fcff9d494	1412	Kisovec
00050000-559d-2a92-78e6-433209156f2f	6253	Knežak
00050000-559d-2a92-b53e-0b609b9fabb4	5222	Kobarid
00050000-559d-2a92-9846-1782db5ba6c9	9227	Kobilje
00050000-559d-2a92-3dea-63795559fc86	1330	Kočevje
00050000-559d-2a92-514a-4e70f84b7bc8	1338	Kočevska Reka
00050000-559d-2a92-ce6a-694cc456ede2	2276	Kog
00050000-559d-2a92-f92a-47e269e45bd7	5211	Kojsko
00050000-559d-2a92-ef91-0e87777e271e	6223	Komen
00050000-559d-2a92-9ab1-307a7f7a0bcd	1218	Komenda
00050000-559d-2a92-4c56-e0514fdd505b	6000	Koper/Capodistria 
00050000-559d-2a92-3b3b-2a4f556b0536	6001	Koper/Capodistria - poštni predali
00050000-559d-2a92-a9f5-f7b10c5487fd	8282	Koprivnica
00050000-559d-2a92-6d6c-1241571ff8b8	5296	Kostanjevica na Krasu
00050000-559d-2a92-2f44-7b03a276464d	8311	Kostanjevica na Krki
00050000-559d-2a92-0139-6220f846761a	1336	Kostel
00050000-559d-2a92-a437-82e4cdf3c1cf	6256	Košana
00050000-559d-2a92-7596-04d9d00f60a1	2394	Kotlje
00050000-559d-2a92-d3a0-2c2cdb5fe372	6240	Kozina
00050000-559d-2a92-ec3f-11b1601cac00	3260	Kozje
00050000-559d-2a92-3e32-711cd5baea03	4000	Kranj 
00050000-559d-2a92-5032-700c6d9c0801	4001	Kranj - poštni predali
00050000-559d-2a92-b966-cd508b19e867	4280	Kranjska Gora
00050000-559d-2a92-9ffe-aaab05eeb459	1281	Kresnice
00050000-559d-2a92-a4d3-19468f17bf55	4294	Križe
00050000-559d-2a92-55c7-c68b0a79b190	9206	Križevci
00050000-559d-2a92-26db-d890c8703e7f	9242	Križevci pri Ljutomeru
00050000-559d-2a92-ac36-067a92697f0a	1301	Krka
00050000-559d-2a92-e0d1-91698a586b07	8296	Krmelj
00050000-559d-2a92-7798-5a91fecd886b	4245	Kropa
00050000-559d-2a92-5644-4e6e20978687	8262	Krška vas
00050000-559d-2a92-55cd-7d3dffdf224c	8270	Krško
00050000-559d-2a92-8fca-2a0ff7f41b4d	9263	Kuzma
00050000-559d-2a92-1c95-775f77b00ba7	2318	Laporje
00050000-559d-2a92-7dd5-593425c94b63	3270	Laško
00050000-559d-2a92-2830-cb2e4f960941	1219	Laze v Tuhinju
00050000-559d-2a92-fc53-84b1196b46e5	2230	Lenart v Slovenskih goricah
00050000-559d-2a92-70d5-172ba9fcfa6e	9220	Lendava/Lendva
00050000-559d-2a92-321e-5124cc4ba059	4248	Lesce
00050000-559d-2a92-d06f-97ed16828e02	3261	Lesično
00050000-559d-2a92-e35b-d67e339aea78	8273	Leskovec pri Krškem
00050000-559d-2a92-44c2-134a050262c2	2372	Libeliče
00050000-559d-2a92-cc96-989df8d7bdcf	2341	Limbuš
00050000-559d-2a92-2638-f5a838989457	1270	Litija
00050000-559d-2a92-d7cf-844028b1af61	3202	Ljubečna
00050000-559d-2a92-0725-694f91725022	1000	Ljubljana 
00050000-559d-2a92-cea2-a60740538c7e	1001	Ljubljana - poštni predali
00050000-559d-2a92-e249-392fb4cd6add	1231	Ljubljana - Črnuče
00050000-559d-2a92-6b33-f11d768bb8db	1261	Ljubljana - Dobrunje
00050000-559d-2a92-192e-5cc9a6fbfd8c	1260	Ljubljana - Polje
00050000-559d-2a92-fe7c-8eb693661def	1210	Ljubljana - Šentvid
00050000-559d-2a92-9af3-ba87bf5a449c	1211	Ljubljana - Šmartno
00050000-559d-2a92-131e-12092c38d109	3333	Ljubno ob Savinji
00050000-559d-2a92-bd3b-a93c9bc89b34	9240	Ljutomer
00050000-559d-2a92-3b46-2baad6eb2a79	3215	Loče
00050000-559d-2a92-9e11-298f246842d2	5231	Log pod Mangartom
00050000-559d-2a92-034f-3a6894b7170f	1358	Log pri Brezovici
00050000-559d-2a92-4230-bdc1f5f34316	1370	Logatec
00050000-559d-2a92-8bc2-08af809cda10	1371	Logatec
00050000-559d-2a92-e26e-9ac8e5cdc2ba	1434	Loka pri Zidanem Mostu
00050000-559d-2a92-dd90-505f192a94a0	3223	Loka pri Žusmu
00050000-559d-2a92-116b-36acbf814a7c	6219	Lokev
00050000-559d-2a92-e293-c163a01f18cd	1318	Loški Potok
00050000-559d-2a92-9ed9-8ef46af80164	2324	Lovrenc na Dravskem polju
00050000-559d-2a92-b87d-c420c0793e50	2344	Lovrenc na Pohorju
00050000-559d-2a92-c627-0c3a1021a360	3334	Luče
00050000-559d-2a92-b531-186ea12b3c9a	1225	Lukovica
00050000-559d-2a92-b7b6-5d1bb892c459	9202	Mačkovci
00050000-559d-2a92-51c5-91b543b8eeaf	2322	Majšperk
00050000-559d-2a92-258f-ec87249f0838	2321	Makole
00050000-559d-2a92-789d-c430ab7263b0	9243	Mala Nedelja
00050000-559d-2a92-1d40-87e2fb3c43f4	2229	Malečnik
00050000-559d-2a92-55b4-b64d158c90c7	6273	Marezige
00050000-559d-2a92-39b6-85b884c6ce27	2000	Maribor 
00050000-559d-2a92-ee55-f6ba5ce41620	2001	Maribor - poštni predali
00050000-559d-2a92-ad19-777914db1be4	2206	Marjeta na Dravskem polju
00050000-559d-2a92-769d-97df7831676c	2281	Markovci
00050000-559d-2a92-3c00-2f5adc80ab84	9221	Martjanci
00050000-559d-2a92-0e48-1131c94d251f	6242	Materija
00050000-559d-2a92-9385-0fcfcd6e5e4c	4211	Mavčiče
00050000-559d-2a92-c4ee-cb5e87fe5cfd	1215	Medvode
00050000-559d-2a92-ab17-92e6d7b76317	1234	Mengeš
00050000-559d-2a92-215b-bf5600ad3dc9	8330	Metlika
00050000-559d-2a92-6871-2ebee98edef3	2392	Mežica
00050000-559d-2a92-093a-8d3036db4944	2204	Miklavž na Dravskem polju
00050000-559d-2a92-6e5f-5642f8ca6a8d	2275	Miklavž pri Ormožu
00050000-559d-2a92-a39e-e82ff478ae9a	5291	Miren
00050000-559d-2a92-c843-a6f07eef10a3	8233	Mirna
00050000-559d-2a92-2d5c-486848995518	8216	Mirna Peč
00050000-559d-2a92-acd8-58c48ee03c4e	2382	Mislinja
00050000-559d-2a92-c266-21e2d07b34bc	4281	Mojstrana
00050000-559d-2a92-1da1-74e6df1ce29f	8230	Mokronog
00050000-559d-2a92-f6b8-538bf7e8bda9	1251	Moravče
00050000-559d-2a92-8b34-a802405a2a53	9226	Moravske Toplice
00050000-559d-2a92-5970-f51dc932e46f	5216	Most na Soči
00050000-559d-2a92-f3a6-2f7faf355e4a	1221	Motnik
00050000-559d-2a92-e4cb-55ae39a18c82	3330	Mozirje
00050000-559d-2a92-544b-d61fc7d070f0	9000	Murska Sobota 
00050000-559d-2a92-aab9-fca7de641ba9	9001	Murska Sobota - poštni predali
00050000-559d-2a92-3c1e-12f3a7aff037	2366	Muta
00050000-559d-2a92-4fd1-a5cc74df266d	4202	Naklo
00050000-559d-2a92-708a-d7cccff6d89d	3331	Nazarje
00050000-559d-2a92-d552-03a7a0b3becb	1357	Notranje Gorice
00050000-559d-2a92-7875-f58a69cd090d	3203	Nova Cerkev
00050000-559d-2a92-cb80-3e6a58502f4a	5000	Nova Gorica 
00050000-559d-2a92-05e7-09bb593d3c8d	5001	Nova Gorica - poštni predali
00050000-559d-2a92-4e09-55e75420a125	1385	Nova vas
00050000-559d-2a92-1ace-afcb481a8cb1	8000	Novo mesto
00050000-559d-2a92-9ea5-6dd834b863bc	8001	Novo mesto - poštni predali
00050000-559d-2a92-a001-ac6bfc885859	6243	Obrov
00050000-559d-2a92-b7ed-6436d600d9ab	9233	Odranci
00050000-559d-2a92-5fbc-38cc1e3d621b	2317	Oplotnica
00050000-559d-2a92-f58e-cdc8a9102acb	2312	Orehova vas
00050000-559d-2a92-35e9-fb15d34f0797	2270	Ormož
00050000-559d-2a92-8016-c301eaa889a6	1316	Ortnek
00050000-559d-2a92-dcb2-81f3bea1992a	1337	Osilnica
00050000-559d-2a92-eb84-ba5aa8dfb9fa	8222	Otočec
00050000-559d-2a92-bd61-4152ec9b401a	2361	Ožbalt
00050000-559d-2a92-811a-3eff08683b65	2231	Pernica
00050000-559d-2a92-eccb-8b33c61975d4	2211	Pesnica pri Mariboru
00050000-559d-2a92-7758-dd1b1aba6917	9203	Petrovci
00050000-559d-2a92-a61b-85b77ef6b3aa	3301	Petrovče
00050000-559d-2a92-d9da-b5937c2024d2	6330	Piran/Pirano
00050000-559d-2a92-4063-a4589757d2b2	8255	Pišece
00050000-559d-2a92-2e88-0fa1d3425846	6257	Pivka
00050000-559d-2a92-0acf-4b23279ab325	6232	Planina
00050000-559d-2a92-83f1-f3ea5aa5b399	3225	Planina pri Sevnici
00050000-559d-2a92-ed8d-4039d019cb50	6276	Pobegi
00050000-559d-2a92-4979-64d925ae0d5c	8312	Podbočje
00050000-559d-2a92-d9e1-5a2cf8c661c8	5243	Podbrdo
00050000-559d-2a92-9f1b-d7c5872b7f6a	3254	Podčetrtek
00050000-559d-2a92-d5d0-62f4eeffe65f	2273	Podgorci
00050000-559d-2a92-a8c6-34d965cda547	6216	Podgorje
00050000-559d-2a92-e0b4-e3cc7a001b25	2381	Podgorje pri Slovenj Gradcu
00050000-559d-2a92-cdfc-ab900e0c2240	6244	Podgrad
00050000-559d-2a92-8610-a2501af11183	1414	Podkum
00050000-559d-2a92-c18e-4ffdbd8410a7	2286	Podlehnik
00050000-559d-2a92-419c-f9239a5cd170	5272	Podnanos
00050000-559d-2a92-43bf-d64b5387b0e0	4244	Podnart
00050000-559d-2a92-6de5-2a32d4aaad62	3241	Podplat
00050000-559d-2a92-32c8-ca0611082fc0	3257	Podsreda
00050000-559d-2a92-61da-bd1e68c710a7	2363	Podvelka
00050000-559d-2a92-82a9-6079ff9332fc	2208	Pohorje
00050000-559d-2a92-cca6-7c2a73fe0394	2257	Polenšak
00050000-559d-2a92-97cf-064a4c535aa7	1355	Polhov Gradec
00050000-559d-2a92-9500-f9f9636a2f6d	4223	Poljane nad Škofjo Loko
00050000-559d-2a92-ac69-aaecb267a12d	2319	Poljčane
00050000-559d-2a92-685b-982c2793f323	1272	Polšnik
00050000-559d-2a92-e0ef-a4ada559fd88	3313	Polzela
00050000-559d-2a92-a10b-f55743cc38cd	3232	Ponikva
00050000-559d-2a92-d856-5fc22b1409e6	6320	Portorož/Portorose
00050000-559d-2a92-832e-eba76727ce3d	6230	Postojna
00050000-559d-2a92-095f-8eee30289a11	2331	Pragersko
00050000-559d-2a92-78f5-74aa164570c2	3312	Prebold
00050000-559d-2a92-d932-4f8fa15843e4	4205	Preddvor
00050000-559d-2a92-03ff-379d3d0912e3	6255	Prem
00050000-559d-2a92-5f59-73f4d78a9066	1352	Preserje
00050000-559d-2a92-715a-4d19240a2299	6258	Prestranek
00050000-559d-2a92-c492-010e1340d802	2391	Prevalje
00050000-559d-2a92-dba5-a9ef3eb17626	3262	Prevorje
00050000-559d-2a92-158f-c5d4ae36660c	1276	Primskovo 
00050000-559d-2a92-2b29-81a31bc2be23	3253	Pristava pri Mestinju
00050000-559d-2a92-0edd-4c68084d51e6	9207	Prosenjakovci/Partosfalva
00050000-559d-2a92-ce51-c71e4a5bed18	5297	Prvačina
00050000-559d-2a92-16ce-dd692b8b9555	2250	Ptuj
00050000-559d-2a92-e5fd-5ac6326f4bd5	2323	Ptujska Gora
00050000-559d-2a92-3c2c-98d8131c2153	9201	Puconci
00050000-559d-2a92-55f7-8705a6959ffb	2327	Rače
00050000-559d-2a92-d60f-6396e66586da	1433	Radeče
00050000-559d-2a92-9975-f0c408d949a3	9252	Radenci
00050000-559d-2a92-7644-e49491641004	2360	Radlje ob Dravi
00050000-559d-2a92-d04f-585e7c2ffe5e	1235	Radomlje
00050000-559d-2a92-d2f2-9be4a1e4188d	4240	Radovljica
00050000-559d-2a92-8c86-fa20ad1d659e	8274	Raka
00050000-559d-2a92-6e88-b2b72cce517c	1381	Rakek
00050000-559d-2a92-bc71-b90e94cf31a1	4283	Rateče - Planica
00050000-559d-2a92-43ae-89c6e941aed9	2390	Ravne na Koroškem
00050000-559d-2a92-0eaf-9056805233f3	9246	Razkrižje
00050000-559d-2a92-be99-0d1f71c22fa3	3332	Rečica ob Savinji
00050000-559d-2a92-9c19-edeef0722cec	5292	Renče
00050000-559d-2a92-10af-c2b3f78f918b	1310	Ribnica
00050000-559d-2a92-38ad-f7c331c45a14	2364	Ribnica na Pohorju
00050000-559d-2a92-9d03-e0eec8cd78e5	3272	Rimske Toplice
00050000-559d-2a92-55bc-4ca303f19057	1314	Rob
00050000-559d-2a92-2a4f-8b868a0af2a1	5215	Ročinj
00050000-559d-2a92-d895-a9e1ec3ada31	3250	Rogaška Slatina
00050000-559d-2a92-7587-657a6e568be0	9262	Rogašovci
00050000-559d-2a92-7750-99f816bc269b	3252	Rogatec
00050000-559d-2a92-5984-99dbe2230b3a	1373	Rovte
00050000-559d-2a92-5132-e9e115ed27a1	2342	Ruše
00050000-559d-2a92-7ec2-2b2a4d077961	1282	Sava
00050000-559d-2a92-03eb-95959a4e0894	6333	Sečovlje/Sicciole
00050000-559d-2a92-2738-e67f4b22223c	4227	Selca
00050000-559d-2a92-356e-b19e77470611	2352	Selnica ob Dravi
00050000-559d-2a92-0be3-df50ee285302	8333	Semič
00050000-559d-2a92-06f1-57bb65265c47	8281	Senovo
00050000-559d-2a92-08d4-0e787a1bc3af	6224	Senožeče
00050000-559d-2a92-97fc-4e31761961a8	8290	Sevnica
00050000-559d-2a92-5540-7a6914541a3c	6210	Sežana
00050000-559d-2a92-13bf-88a48a9128ec	2214	Sladki Vrh
00050000-559d-2a92-ccff-e0f44417e0d9	5283	Slap ob Idrijci
00050000-559d-2a92-7501-a9006c527f88	2380	Slovenj Gradec
00050000-559d-2a92-2b7d-fca5fc88a50e	2310	Slovenska Bistrica
00050000-559d-2a92-fd78-b8a8a4339704	3210	Slovenske Konjice
00050000-559d-2a92-96b2-582daefa2319	1216	Smlednik
00050000-559d-2a92-69ea-6ba421033a86	5232	Soča
00050000-559d-2a92-b2fa-3b72d286a5cd	1317	Sodražica
00050000-559d-2a92-022d-aa18e96977f2	3335	Solčava
00050000-559d-2a92-97f4-a0d359b5166f	5250	Solkan
00050000-559d-2a92-bd3f-0e93f77677bb	4229	Sorica
00050000-559d-2a92-cb5e-4e745de6ce67	4225	Sovodenj
00050000-559d-2a92-6d7c-9903b87eafa2	5281	Spodnja Idrija
00050000-559d-2a92-1e71-f8c1a88f337c	2241	Spodnji Duplek
00050000-559d-2a92-e96e-e8f783bc9f8b	9245	Spodnji Ivanjci
00050000-559d-2a92-3808-725f45523728	2277	Središče ob Dravi
00050000-559d-2a92-3412-d1209c2d27c9	4267	Srednja vas v Bohinju
00050000-559d-2a92-ae82-d81a095eeaae	8256	Sromlje 
00050000-559d-2a92-6b0c-4acda885f2c4	5224	Srpenica
00050000-559d-2a92-3d6d-977452e7ae4b	1242	Stahovica
00050000-559d-2a92-5a00-b1ad3402b4b2	1332	Stara Cerkev
00050000-559d-2a92-2d38-1edfbcbf10c9	8342	Stari trg ob Kolpi
00050000-559d-2a92-069c-e986085b0dfb	1386	Stari trg pri Ložu
00050000-559d-2a92-8513-189eb304fff6	2205	Starše
00050000-559d-2a92-47e0-22c812b47bec	2289	Stoperce
00050000-559d-2a92-fc57-6b99069f1f82	8322	Stopiče
00050000-559d-2a92-f315-e8c0fdb33d42	3206	Stranice
00050000-559d-2a92-58e0-3461e94e3c92	8351	Straža
00050000-559d-2a92-c9f3-eccd82df1000	1313	Struge
00050000-559d-2a92-4e3a-a2cd36c28eb9	8293	Studenec
00050000-559d-2a92-c56c-c3a52e232e26	8331	Suhor
00050000-559d-2a92-d5b6-1237675226ce	2233	Sv. Ana v Slovenskih goricah
00050000-559d-2a92-4cd9-e0e8a39b0c79	2235	Sv. Trojica v Slovenskih goricah
00050000-559d-2a92-e828-c78252503fa3	2353	Sveti Duh na Ostrem Vrhu
00050000-559d-2a92-d4c4-7921be5ec5c1	9244	Sveti Jurij ob Ščavnici
00050000-559d-2a92-486e-8977f4b3a779	3264	Sveti Štefan
00050000-559d-2a92-6a93-92a0780078c7	2258	Sveti Tomaž
00050000-559d-2a92-9ee1-6db2028b7681	9204	Šalovci
00050000-559d-2a92-8620-ba13d3cddccf	5261	Šempas
00050000-559d-2a92-e004-4c51a58bbd64	5290	Šempeter pri Gorici
00050000-559d-2a92-4022-12f2149cc40c	3311	Šempeter v Savinjski dolini
00050000-559d-2a92-febe-fa15356ef287	4208	Šenčur
00050000-559d-2a92-4ff6-f703b5ec8a4b	2212	Šentilj v Slovenskih goricah
00050000-559d-2a92-d682-7963dc8e7e5b	8297	Šentjanž
00050000-559d-2a92-d870-beb98a4c40ea	2373	Šentjanž pri Dravogradu
00050000-559d-2a92-eb65-5eb86a671a05	8310	Šentjernej
00050000-559d-2a92-c01d-d0545766615b	3230	Šentjur
00050000-559d-2a92-c80b-554d0456ec89	3271	Šentrupert
00050000-559d-2a92-e1d8-cc9d640722af	8232	Šentrupert
00050000-559d-2a92-2359-de6c5c8a5a0d	1296	Šentvid pri Stični
00050000-559d-2a92-c5d7-d389f4939582	8275	Škocjan
00050000-559d-2a92-0b91-6747f12bd88d	6281	Škofije
00050000-559d-2a92-3ccc-fcbb8ba13f1c	4220	Škofja Loka
00050000-559d-2a92-64db-b7598dee0e12	3211	Škofja vas
00050000-559d-2a92-7d8b-1f5a2a0dce16	1291	Škofljica
00050000-559d-2a92-85d5-9988937b0033	6274	Šmarje
00050000-559d-2a92-c869-f0f1a9b366a3	1293	Šmarje - Sap
00050000-559d-2a92-e888-627d01df4121	3240	Šmarje pri Jelšah
00050000-559d-2a92-b0ce-3b15c94fa790	8220	Šmarješke Toplice
00050000-559d-2a92-380f-8fbe53f4e46a	2315	Šmartno na Pohorju
00050000-559d-2a92-b694-b394379f9fd0	3341	Šmartno ob Dreti
00050000-559d-2a92-3a7b-060178b6aa70	3327	Šmartno ob Paki
00050000-559d-2a92-a0cc-5f4121a6aa18	1275	Šmartno pri Litiji
00050000-559d-2a92-85ce-58f23d9b9e6e	2383	Šmartno pri Slovenj Gradcu
00050000-559d-2a92-287d-d78230a5a6aa	3201	Šmartno v Rožni dolini
00050000-559d-2a92-4f0b-bf28635c40d6	3325	Šoštanj
00050000-559d-2a92-77f6-d5c03f14b588	6222	Štanjel
00050000-559d-2a92-ca25-df7e1a6f10d8	3220	Štore
00050000-559d-2a92-2fea-5f7a0824dba8	3304	Tabor
00050000-559d-2a92-4d39-d2ff483705ea	3221	Teharje
00050000-559d-2a92-2926-29616c60356c	9251	Tišina
00050000-559d-2a92-d982-f12bdf40da75	5220	Tolmin
00050000-559d-2a92-2163-f0ce9b69125b	3326	Topolšica
00050000-559d-2a92-5faf-b23081360b19	2371	Trbonje
00050000-559d-2a92-f6f0-c658d1deed93	1420	Trbovlje
00050000-559d-2a92-e03a-3909f2e07104	8231	Trebelno 
00050000-559d-2a92-9fb2-2b0d751a48a4	8210	Trebnje
00050000-559d-2a92-788c-d45cb9c18946	5252	Trnovo pri Gorici
00050000-559d-2a92-04d0-8706cbc24fe8	2254	Trnovska vas
00050000-559d-2a92-11ab-5b4b7f501ad4	1222	Trojane
00050000-559d-2a92-cbd1-79501712b49e	1236	Trzin
00050000-559d-2a92-a385-c11fe31a6311	4290	Tržič
00050000-559d-2a92-0c32-9ee680dbeb78	8295	Tržišče
00050000-559d-2a92-f10e-c72150388edf	1311	Turjak
00050000-559d-2a92-b85a-85bc7d4339df	9224	Turnišče
00050000-559d-2a92-9d17-da532eb927b2	8323	Uršna sela
00050000-559d-2a92-0839-8b8a75e11a31	1252	Vače
00050000-559d-2a92-efa4-37f933eb8b9c	3320	Velenje 
00050000-559d-2a92-d1e4-0f53abe9163c	3322	Velenje - poštni predali
00050000-559d-2a92-4db0-2cd56dea0aaa	8212	Velika Loka
00050000-559d-2a92-dde2-84e7ae070c15	2274	Velika Nedelja
00050000-559d-2a92-639b-cd789b9e3f02	9225	Velika Polana
00050000-559d-2a92-0bd2-f8700ad8e9cf	1315	Velike Lašče
00050000-559d-2a92-4cf3-c2bc1b22a8b3	8213	Veliki Gaber
00050000-559d-2a92-e0fd-54af95177f76	9241	Veržej
00050000-559d-2a92-afb5-85c79abc0e9b	1312	Videm - Dobrepolje
00050000-559d-2a92-c6cb-078541df3a35	2284	Videm pri Ptuju
00050000-559d-2a92-fde5-088df48f6abc	8344	Vinica
00050000-559d-2a92-5f23-2dc55fb2eb4a	5271	Vipava
00050000-559d-2a92-36e6-f4feb3fdf8fb	4212	Visoko
00050000-559d-2a92-4dda-0ddcf7512af7	1294	Višnja Gora
00050000-559d-2a92-b2b1-399b8fc5b178	3205	Vitanje
00050000-559d-2a92-0c13-96a081e1f997	2255	Vitomarci
00050000-559d-2a92-61a5-959f178f6892	1217	Vodice
00050000-559d-2a92-77f8-90c07956f377	3212	Vojnik\t
00050000-559d-2a92-0738-e42b504cb239	5293	Volčja Draga
00050000-559d-2a92-f0b0-0d52bc725547	2232	Voličina
00050000-559d-2a92-37af-9397d3783d9f	3305	Vransko
00050000-559d-2a92-e8fb-7e4a5f2423df	6217	Vremski Britof
00050000-559d-2a92-a72d-d23a5b3aea5a	1360	Vrhnika
00050000-559d-2a92-5765-a4f5390475e6	2365	Vuhred
00050000-559d-2a92-da3c-54beaca35175	2367	Vuzenica
00050000-559d-2a92-8589-4a9350281e33	8292	Zabukovje 
00050000-559d-2a92-7671-de57626fddcf	1410	Zagorje ob Savi
00050000-559d-2a92-e3cc-8df640f04fab	1303	Zagradec
00050000-559d-2a92-d3da-656b9d12067c	2283	Zavrč
00050000-559d-2a92-b605-099cd1d1d00a	8272	Zdole 
00050000-559d-2a92-8434-54f11db0c75d	4201	Zgornja Besnica
00050000-559d-2a92-9df1-a471213a724b	2242	Zgornja Korena
00050000-559d-2a92-3c10-5c7ec7c8a7f1	2201	Zgornja Kungota
00050000-559d-2a92-fe41-955bd83d5181	2316	Zgornja Ložnica
00050000-559d-2a92-aa27-492a6835845d	2314	Zgornja Polskava
00050000-559d-2a92-e22f-b8e245f6d703	2213	Zgornja Velka
00050000-559d-2a92-0b74-1cb551d9155b	4247	Zgornje Gorje
00050000-559d-2a92-0ee9-0b4522d3c1f1	4206	Zgornje Jezersko
00050000-559d-2a92-7213-01b1582f847f	2285	Zgornji Leskovec
00050000-559d-2a92-b522-5a146b0028da	1432	Zidani Most
00050000-559d-2a92-72e5-153b829b21d1	3214	Zreče
00050000-559d-2a92-a83e-9fde5483fc22	4209	Žabnica
00050000-559d-2a92-e35a-c16a9bbb4205	3310	Žalec
00050000-559d-2a92-ee64-4234cd808ca1	4228	Železniki
00050000-559d-2a92-f911-1f75228f9d0f	2287	Žetale
00050000-559d-2a92-1a90-69e016ed195c	4226	Žiri
00050000-559d-2a92-91ef-478584fddb8c	4274	Žirovnica
00050000-559d-2a92-a7dd-25f4e1779000	8360	Žužemberk
\.


--
-- TOC entry 2880 (class 0 OID 9435136)
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
-- TOC entry 2862 (class 0 OID 9434947)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9435025)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9435148)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 9435454)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9435465)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559d-2a93-66e6-eae50b893517	00080000-559d-2a93-9494-2814138e1c64	0900	AK
00190000-559d-2a93-bba3-8af1440430d5	00080000-559d-2a93-2532-233cbe6a203c	0987	A
00190000-559d-2a93-7680-d6ff10165646	00080000-559d-2a93-dd06-297c2d8530d4	0989	A
00190000-559d-2a93-84fc-759ed5cd9ecb	00080000-559d-2a93-78b9-92c71124be5e	0986	A
00190000-559d-2a93-825e-bed9b1c2b535	00080000-559d-2a93-50e3-48bbb8fcec28	0984	A
00190000-559d-2a93-5021-d46943b78ed4	00080000-559d-2a93-2f24-9364acad5605	0983	A
00190000-559d-2a93-273e-34151e9eedb9	00080000-559d-2a93-dfcf-a343420558bb	0982	A
\.


--
-- TOC entry 2904 (class 0 OID 9435435)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
00290000-559d-2a93-d54a-7f6a0b0f03e9	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
-- TOC entry 2886 (class 0 OID 9435177)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559d-2a93-7c27-db55aca0d50d	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559d-2a93-b569-77ed986fbc2f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559d-2a93-5f1f-025b8d57c20b	0003	Kazinska	t	84	Kazinska dvorana
00220000-559d-2a93-0a5b-6c8e3146d25a	0004	Mali oder	t	24	Mali oder 
00220000-559d-2a93-f697-575f08981d59	0005	Komorni oder	t	15	Komorni oder
00220000-559d-2a93-2a25-0c7471465bfe	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559d-2a93-17e0-47a11074943e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2878 (class 0 OID 9435121)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9435111)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 9435295)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9435245)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 9434819)
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
-- TOC entry 2887 (class 0 OID 9435187)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9434857)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559d-2a91-a7be-5ab9fe071645	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559d-2a91-5b51-ad068e6ec606	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559d-2a91-e7f0-cd1bd6625a50	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559d-2a91-9523-3736791a0c9c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559d-2a91-2a3c-c0d2c1b1b084	planer	Planer dogodkov v koledarju	t
00020000-559d-2a91-bb0a-84981b26dfd5	kadrovska	Kadrovska služba	t
00020000-559d-2a91-8b38-8dc9fa1ea0bd	arhivar	Ažuriranje arhivalij	t
00020000-559d-2a91-642e-654a90cfc28e	igralec	Igralec	t
00020000-559d-2a91-6431-ce2fbfdd8eb0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559d-2a93-d6b0-4a7ded9acef2	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2853 (class 0 OID 9434841)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559d-2a91-93a6-cf8209516d5d	00020000-559d-2a91-e7f0-cd1bd6625a50
00010000-559d-2a91-a27c-36bd722b34d5	00020000-559d-2a91-e7f0-cd1bd6625a50
00010000-559d-2a93-f216-3c210b7991ae	00020000-559d-2a93-d6b0-4a7ded9acef2
\.


--
-- TOC entry 2889 (class 0 OID 9435201)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 9435142)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 9435092)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 9435504)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559d-2a92-63a6-f841d01ee6ae	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559d-2a92-6bb6-3943516a29bc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559d-2a92-0978-25fe846eaf5d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559d-2a92-d173-ef36c413d38b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559d-2a92-8f20-b30ac3a91370	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2910 (class 0 OID 9435496)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559d-2a92-c787-0b157af4be35	00230000-559d-2a92-d173-ef36c413d38b	popa
00240000-559d-2a92-c511-76dadb030f4f	00230000-559d-2a92-d173-ef36c413d38b	oseba
00240000-559d-2a92-6128-1a18c504a48d	00230000-559d-2a92-6bb6-3943516a29bc	prostor
00240000-559d-2a92-9d43-7c3ec349f808	00230000-559d-2a92-d173-ef36c413d38b	besedilo
00240000-559d-2a92-c687-460fad2da9b4	00230000-559d-2a92-d173-ef36c413d38b	uprizoritev
00240000-559d-2a92-4f34-a62128718450	00230000-559d-2a92-d173-ef36c413d38b	funkcija
00240000-559d-2a92-fdd9-140e3a13b6e2	00230000-559d-2a92-d173-ef36c413d38b	tipfunkcije
00240000-559d-2a92-960e-2be321b966b4	00230000-559d-2a92-d173-ef36c413d38b	alternacija
00240000-559d-2a92-3d58-7c9f04662afc	00230000-559d-2a92-63a6-f841d01ee6ae	pogodba
00240000-559d-2a92-767a-321dc21a6cb3	00230000-559d-2a92-d173-ef36c413d38b	zaposlitev
00240000-559d-2a92-5366-b345f02359f8	00230000-559d-2a92-63a6-f841d01ee6ae	programdela
\.


--
-- TOC entry 2909 (class 0 OID 9435491)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9435255)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559d-2a93-647d-8dc68974ec7e	000e0000-559d-2a93-8758-f98690dba76a	00080000-559d-2a93-671b-cebe9459c3bf	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559d-2a93-591c-21c79384a29f	000e0000-559d-2a93-8758-f98690dba76a	00080000-559d-2a93-671b-cebe9459c3bf	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559d-2a93-a264-eb0fd3251f89	000e0000-559d-2a93-8758-f98690dba76a	00080000-559d-2a93-7a35-6804af2092f1	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2860 (class 0 OID 9434919)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9435098)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559d-2a93-11e4-9148397434dc	00180000-559d-2a93-85d3-302c61cf8f55	000c0000-559d-2a93-5ae0-a1c470846f51	00090000-559d-2a93-aa34-8518c29ab4f9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-2a93-b9bf-257ac3f06326	00180000-559d-2a93-85d3-302c61cf8f55	000c0000-559d-2a93-6208-edea75d20c1b	00090000-559d-2a93-7ced-aa727b342b36	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-2a93-5f4b-c2003b182410	00180000-559d-2a93-85d3-302c61cf8f55	000c0000-559d-2a93-6186-61837b595f8e	00090000-559d-2a93-7fa1-a6f6cfcd9bca	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-2a93-d61a-7e6d6badfdf2	00180000-559d-2a93-85d3-302c61cf8f55	000c0000-559d-2a93-d255-583446aad255	00090000-559d-2a93-5b97-b1084d611184	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-2a93-3c5f-a51c353b4bc9	00180000-559d-2a93-85d3-302c61cf8f55	000c0000-559d-2a93-4947-8ff4ce4efa1e	00090000-559d-2a93-289b-ff3e718c939d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559d-2a93-12d6-8175268c8e77	00180000-559d-2a93-e5b1-afe0589e94d9	\N	00090000-559d-2a93-289b-ff3e718c939d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2896 (class 0 OID 9435284)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559d-2a92-51bb-229f964d9904	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559d-2a92-2489-f7f0dc3d1986	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559d-2a92-dc65-19b02ecf6a8d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559d-2a92-efa3-cfc8385d8c39	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559d-2a92-c6bb-01632d31011c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559d-2a92-c3c1-57cb01152161	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559d-2a92-0b4a-e0395eb4669c	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559d-2a92-8be5-5cad19abe65a	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559d-2a92-c141-c66149fd081d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559d-2a92-d8a3-0556a021b904	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559d-2a92-3ea1-ee31e916c301	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559d-2a92-8598-5e82217f4ce9	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559d-2a92-e878-12a72f4359b6	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559d-2a92-1a6b-817669a30db6	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559d-2a92-573a-d0c40415331e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559d-2a92-e922-fff1c5dcc302	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2907 (class 0 OID 9435473)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559d-2a92-9509-779d94ef86c8	01	Velika predstava	f	1.00	1.00
002b0000-559d-2a92-1d7c-a6d139e613c0	02	Mala predstava	f	0.50	0.50
002b0000-559d-2a92-9279-a48646c3953c	03	Mala koprodukcija	t	0.40	1.00
002b0000-559d-2a92-fb82-a0d8cf39583e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559d-2a92-e25f-ce83cca03e62	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2865 (class 0 OID 9434982)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9434828)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559d-2a91-a27c-36bd722b34d5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO1qo.RW/lnxRuMynSNsAOOHhcarhl8Cu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559d-2a93-72c1-774e1b75cede	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559d-2a93-101c-d5c305a98c4b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559d-2a93-5d03-be99f76da2b0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559d-2a93-e1c6-b382b354e5f8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559d-2a93-a606-ee5fe2e67e32	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559d-2a93-3abf-5cab4d315dfd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559d-2a93-c3a9-d1f52c69392d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559d-2a93-8fa5-7f5fe9770bac	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559d-2a93-0632-43aae75b634a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559d-2a93-f216-3c210b7991ae	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559d-2a91-93a6-cf8209516d5d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 9435332)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559d-2a93-809f-dd9071de4729	00160000-559d-2a93-33b4-f7dfcd36aea4	00150000-559d-2a92-c0c0-360b2608fb9a	00140000-559d-2a91-db1f-a9da6dd9644e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559d-2a93-f697-575f08981d59
000e0000-559d-2a93-8758-f98690dba76a	00160000-559d-2a93-0e57-3047b054e6f9	00150000-559d-2a92-6760-e4d4cf6aae66	00140000-559d-2a91-a682-ad54912f2c39	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559d-2a93-2a25-0c7471465bfe
000e0000-559d-2a93-2b63-69424f657bbd	\N	00150000-559d-2a92-6760-e4d4cf6aae66	00140000-559d-2a91-a682-ad54912f2c39	00190000-559d-2a93-bba3-8af1440430d5	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559d-2a93-f697-575f08981d59
000e0000-559d-2a93-5a05-ace59723c8a0	\N	00150000-559d-2a92-6760-e4d4cf6aae66	00140000-559d-2a91-a682-ad54912f2c39	00190000-559d-2a93-bba3-8af1440430d5	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559d-2a93-f697-575f08981d59
000e0000-559d-2a93-42dc-832958638c1e	\N	00150000-559d-2a92-6760-e4d4cf6aae66	00140000-559d-2a91-a682-ad54912f2c39	00190000-559d-2a93-bba3-8af1440430d5	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559d-2a93-7c27-db55aca0d50d
\.


--
-- TOC entry 2870 (class 0 OID 9435044)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559d-2a93-b639-2db3321c8428	000e0000-559d-2a93-8758-f98690dba76a	1	
00200000-559d-2a93-9a85-f790f0969788	000e0000-559d-2a93-8758-f98690dba76a	2	
\.


--
-- TOC entry 2885 (class 0 OID 9435169)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 9435238)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 9435076)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9435322)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559d-2a91-db1f-a9da6dd9644e	01	Drama	drama (SURS 01)
00140000-559d-2a91-41f8-dc12b1a62d23	02	Opera	opera (SURS 02)
00140000-559d-2a91-5757-948f02a2b113	03	Balet	balet (SURS 03)
00140000-559d-2a91-c447-6210488bd738	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559d-2a91-e7fc-d38feb88c06e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559d-2a91-a682-ad54912f2c39	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559d-2a91-b4da-7784bb6623c4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2891 (class 0 OID 9435228)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559d-2a92-6d3e-b154e074d3e7	01	Opera	opera
00150000-559d-2a92-f843-adff571f978c	02	Opereta	opereta
00150000-559d-2a92-2830-302dad87e16f	03	Balet	balet
00150000-559d-2a92-3a0a-e6c62bf178e7	04	Plesne prireditve	plesne prireditve
00150000-559d-2a92-4a88-b16a1a825af5	05	Lutkovno gledališče	lutkovno gledališče
00150000-559d-2a92-c911-922598b9da53	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559d-2a92-55cf-a3f7ff5bc778	07	Biografska drama	biografska drama
00150000-559d-2a92-c0c0-360b2608fb9a	08	Komedija	komedija
00150000-559d-2a92-c806-a46b5aae4b9b	09	Črna komedija	črna komedija
00150000-559d-2a92-9a2d-eb7f3e704094	10	E-igra	E-igra
00150000-559d-2a92-6760-e4d4cf6aae66	11	Kriminalka	kriminalka
00150000-559d-2a92-d45b-e05cb3f6657b	12	Musical	musical
\.


--
-- TOC entry 2444 (class 2606 OID 9434882)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 9435379)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 9435369)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 9435283)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 9435066)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 9435091)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 9435489)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 9435008)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 9435430)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 9435224)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 9435042)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 9435085)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 9435022)
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
-- TOC entry 2536 (class 2606 OID 9435134)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 9435161)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 9434980)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 9434891)
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
-- TOC entry 2451 (class 2606 OID 9434915)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 9434871)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2435 (class 2606 OID 9434856)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 9435167)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 9435200)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 9435317)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 9434944)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 9434968)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 9435140)
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
-- TOC entry 2466 (class 2606 OID 9434958)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 9435029)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 9435152)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 9435462)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 9435470)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 9435452)
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
-- TOC entry 2556 (class 2606 OID 9435184)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 9435125)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 9435116)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 9435305)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 9435252)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 9434827)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 9435191)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 9434845)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2437 (class 2606 OID 9434865)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 9435209)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 9435147)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 9435097)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 9435513)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 9435501)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 9435495)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 9435265)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 9434924)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 9435107)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 9435294)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 9435483)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 9434993)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 9434840)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 9435348)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 9435051)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 9435175)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 9435243)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 9435080)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 9435330)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 9435236)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 1259 OID 9435073)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2584 (class 1259 OID 9435266)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 9435267)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2458 (class 1259 OID 9434946)
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
-- TOC entry 2549 (class 1259 OID 9435168)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2543 (class 1259 OID 9435154)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 9435153)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2495 (class 1259 OID 9435052)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2571 (class 1259 OID 9435225)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9435227)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2573 (class 1259 OID 9435226)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 9435024)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 9435023)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2594 (class 1259 OID 9435319)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 9435320)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 9435321)
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
-- TOC entry 2603 (class 1259 OID 9435353)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2604 (class 1259 OID 9435350)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2605 (class 1259 OID 9435354)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2606 (class 1259 OID 9435352)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2607 (class 1259 OID 9435351)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2473 (class 1259 OID 9434995)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2474 (class 1259 OID 9434994)
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
-- TOC entry 2449 (class 1259 OID 9434918)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 9435192)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2513 (class 1259 OID 9435086)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 9434872)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2440 (class 1259 OID 9434873)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2564 (class 1259 OID 9435212)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2565 (class 1259 OID 9435211)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2566 (class 1259 OID 9435210)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2487 (class 1259 OID 9435030)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 9435032)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2489 (class 1259 OID 9435031)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 9435503)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2523 (class 1259 OID 9435120)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2524 (class 1259 OID 9435118)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2525 (class 1259 OID 9435117)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2526 (class 1259 OID 9435119)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2430 (class 1259 OID 9434846)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2431 (class 1259 OID 9434847)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2552 (class 1259 OID 9435176)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2538 (class 1259 OID 9435141)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2580 (class 1259 OID 9435253)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2581 (class 1259 OID 9435254)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 9435434)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 9435431)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 9435432)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 9435433)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2462 (class 1259 OID 9434960)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2463 (class 1259 OID 9434959)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2464 (class 1259 OID 9434961)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2423 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2631 (class 1259 OID 9435463)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2632 (class 1259 OID 9435464)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2617 (class 1259 OID 9435383)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 9435381)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 9435382)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2577 (class 1259 OID 9435244)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 9435129)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2530 (class 1259 OID 9435128)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2531 (class 1259 OID 9435126)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2532 (class 1259 OID 9435127)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2401 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 9435371)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2614 (class 1259 OID 9435370)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 9435453)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2494 (class 1259 OID 9435043)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 9435490)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2445 (class 1259 OID 9434893)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2446 (class 1259 OID 9434892)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2454 (class 1259 OID 9434925)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 9434926)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2518 (class 1259 OID 9435110)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2519 (class 1259 OID 9435109)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2520 (class 1259 OID 9435108)
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
-- TOC entry 2501 (class 1259 OID 9435075)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2502 (class 1259 OID 9435071)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2503 (class 1259 OID 9435068)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2504 (class 1259 OID 9435069)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2505 (class 1259 OID 9435067)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2506 (class 1259 OID 9435072)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2507 (class 1259 OID 9435070)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2461 (class 1259 OID 9434945)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 9435009)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9435011)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2481 (class 1259 OID 9435010)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2482 (class 1259 OID 9435012)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2537 (class 1259 OID 9435135)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 9435318)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 9435349)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2452 (class 1259 OID 9434916)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9434917)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2574 (class 1259 OID 9435237)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 9435514)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 9434981)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 9435502)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2557 (class 1259 OID 9435186)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2558 (class 1259 OID 9435185)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 9435380)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 9435384)
-- Name: uniq_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2404 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2469 (class 1259 OID 9434969)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 9435331)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 9435471)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9435472)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 9434866)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2508 (class 1259 OID 9435074)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2678 (class 2606 OID 9435650)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2681 (class 2606 OID 9435635)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2680 (class 2606 OID 9435640)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2676 (class 2606 OID 9435660)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2682 (class 2606 OID 9435630)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2677 (class 2606 OID 9435655)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2679 (class 2606 OID 9435645)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2712 (class 2606 OID 9435805)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 9435810)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 9435565)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2699 (class 2606 OID 9435745)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2697 (class 2606 OID 9435740)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2698 (class 2606 OID 9435735)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2675 (class 2606 OID 9435625)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 9435775)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 9435785)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2706 (class 2606 OID 9435780)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2669 (class 2606 OID 9435600)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 9435595)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 9435725)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 9435815)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 9435820)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 9435825)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 9435845)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 9435830)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 9435850)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 9435840)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 9435835)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2667 (class 2606 OID 9435590)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 9435585)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 9435550)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2660 (class 2606 OID 9435545)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 9435755)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 9435665)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2656 (class 2606 OID 9435525)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2655 (class 2606 OID 9435530)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2702 (class 2606 OID 9435770)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2703 (class 2606 OID 9435765)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 9435760)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2673 (class 2606 OID 9435605)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 9435615)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2672 (class 2606 OID 9435610)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2736 (class 2606 OID 9435930)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2687 (class 2606 OID 9435700)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2689 (class 2606 OID 9435690)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2690 (class 2606 OID 9435685)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2688 (class 2606 OID 9435695)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 9435515)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2653 (class 2606 OID 9435520)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 9435750)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2696 (class 2606 OID 9435730)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2710 (class 2606 OID 9435795)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2709 (class 2606 OID 9435800)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 9435900)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 9435885)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 9435890)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 9435895)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2665 (class 2606 OID 9435575)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 9435570)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9435580)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2733 (class 2606 OID 9435910)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2732 (class 2606 OID 9435915)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 9435875)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 9435880)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 9435865)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 9435870)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2708 (class 2606 OID 9435790)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 9435720)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2692 (class 2606 OID 9435715)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 9435705)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2693 (class 2606 OID 9435710)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 9435860)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 9435855)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 9435905)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2674 (class 2606 OID 9435620)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2734 (class 2606 OID 9435920)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 9435925)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2657 (class 2606 OID 9435540)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 9435535)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2662 (class 2606 OID 9435555)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 9435560)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 9435680)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 9435675)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2686 (class 2606 OID 9435670)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-08 15:50:12 CEST

--
-- PostgreSQL database dump complete
--

