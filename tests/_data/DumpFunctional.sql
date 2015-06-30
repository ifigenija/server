--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-30 15:16:40 CEST

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
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 8577047)
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
-- TOC entry 230 (class 1259 OID 8577565)
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
-- TOC entry 229 (class 1259 OID 8577548)
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
-- TOC entry 222 (class 1259 OID 8577452)
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
-- TOC entry 197 (class 1259 OID 8577226)
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
-- TOC entry 200 (class 1259 OID 8577260)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8577654)
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
-- TOC entry 192 (class 1259 OID 8577169)
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
-- TOC entry 231 (class 1259 OID 8577578)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stdrugih integer DEFAULT 0 NOT NULL,
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
-- TOC entry 216 (class 1259 OID 8577386)
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
-- TOC entry 195 (class 1259 OID 8577206)
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
-- TOC entry 199 (class 1259 OID 8577254)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8577186)
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
-- TOC entry 205 (class 1259 OID 8577303)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8577328)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8577143)
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
-- TOC entry 184 (class 1259 OID 8577056)
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
-- TOC entry 185 (class 1259 OID 8577067)
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
-- TOC entry 180 (class 1259 OID 8577021)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8577040)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8577335)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8577366)
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
-- TOC entry 226 (class 1259 OID 8577498)
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
-- TOC entry 187 (class 1259 OID 8577100)
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
-- TOC entry 189 (class 1259 OID 8577135)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8577309)
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
-- TOC entry 188 (class 1259 OID 8577120)
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
-- TOC entry 194 (class 1259 OID 8577198)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8577321)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8577441)
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
-- TOC entry 225 (class 1259 OID 8577490)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8577624)
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
-- TOC entry 212 (class 1259 OID 8577350)
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
-- TOC entry 204 (class 1259 OID 8577294)
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
-- TOC entry 203 (class 1259 OID 8577284)
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
-- TOC entry 224 (class 1259 OID 8577479)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8577418)
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
-- TOC entry 177 (class 1259 OID 8576992)
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
-- TOC entry 176 (class 1259 OID 8576990)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 8577360)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8577030)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8577014)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8577374)
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
-- TOC entry 207 (class 1259 OID 8577315)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8577265)
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
-- TOC entry 237 (class 1259 OID 8577674)
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
-- TOC entry 236 (class 1259 OID 8577666)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8577661)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8577428)
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
-- TOC entry 186 (class 1259 OID 8577092)
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
-- TOC entry 202 (class 1259 OID 8577271)
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
-- TOC entry 223 (class 1259 OID 8577468)
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
-- TOC entry 233 (class 1259 OID 8577643)
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
-- TOC entry 191 (class 1259 OID 8577155)
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
-- TOC entry 178 (class 1259 OID 8577001)
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
-- TOC entry 228 (class 1259 OID 8577525)
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
-- TOC entry 196 (class 1259 OID 8577217)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8577342)
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
-- TOC entry 218 (class 1259 OID 8577411)
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
-- TOC entry 198 (class 1259 OID 8577249)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8577515)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8577401)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8576995)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8577047)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8577565)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5592-96b7-6a8e-3cbb9e32480b	000d0000-5592-96b7-2cae-530894f3b10a	\N	00090000-5592-96b7-29ad-d9018f9c9320	000b0000-5592-96b7-793d-96c3961f8e2c	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-96b7-6d27-7760fede37f5	000d0000-5592-96b7-5e39-db294c10f42e	\N	00090000-5592-96b7-68f2-a09da72bd785	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-96b7-491b-4487d9d754e4	000d0000-5592-96b7-e8cb-7a16f9dce856	\N	00090000-5592-96b7-3613-887e830b2c34	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-96b7-2b2f-7d62afe0310c	000d0000-5592-96b7-7ebe-f37efaf88062	\N	00090000-5592-96b7-7c08-e0822175ed6a	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-96b7-d331-d01e84e9baec	000d0000-5592-96b7-7200-2b0f5a11e8e5	\N	00090000-5592-96b7-c2f9-903b078e06fb	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-96b7-8ce3-4b83e815c778	000d0000-5592-96b7-79ee-2370af1c0e97	\N	00090000-5592-96b7-68f2-a09da72bd785	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8577548)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8577452)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5592-96b7-fa72-3fedfe535c45	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5592-96b7-2c6c-9908f6578a10	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5592-96b7-1e86-e606807d449c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8577226)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5592-96b7-f0b8-a5756530a4b1	\N	\N	00200000-5592-96b7-d3d7-7152c38d183f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5592-96b7-c000-5b597d1ad406	\N	\N	00200000-5592-96b7-a10c-7cb2056066ad	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5592-96b7-9022-d79059e25110	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5592-96b7-1fba-c54b3b3e0945	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5592-96b7-e73e-8c381f001ba9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8577260)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8577654)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8577169)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5592-96b5-3b13-9abbaf2ccfec	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5592-96b5-d9a8-cfd6fc39c53e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5592-96b5-bfe2-91a89864bed6	AL	ALB	008	Albania 	Albanija	\N
00040000-5592-96b5-8a64-e43d760ba26b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5592-96b5-96f7-858bc619e77d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5592-96b5-97c4-a8880bd6102e	AD	AND	020	Andorra 	Andora	\N
00040000-5592-96b5-0a1b-5d3f41eccd99	AO	AGO	024	Angola 	Angola	\N
00040000-5592-96b5-6446-7e3c0e7e91b7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5592-96b5-4571-cd8e67b474bc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5592-96b5-4082-dd00668aeb87	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-96b5-a076-fd023fb2ed77	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5592-96b5-c32f-27b1c72a75da	AM	ARM	051	Armenia 	Armenija	\N
00040000-5592-96b5-073e-230f7876fdb1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5592-96b5-d029-79c3374cb8a4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5592-96b5-d45a-72cfba62607c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5592-96b5-6474-31698c0edeba	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5592-96b5-9731-0766e31d96f9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5592-96b5-3d9a-c1612a62c15f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5592-96b5-eb9a-850c23b0aab2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5592-96b5-7fd7-ef60346b22a3	BB	BRB	052	Barbados 	Barbados	\N
00040000-5592-96b5-a647-4bcc7eb43958	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5592-96b5-a465-a113fde1207f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5592-96b5-e4bf-76ed7a39ba69	BZ	BLZ	084	Belize 	Belize	\N
00040000-5592-96b5-11d4-7e805f0f3252	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5592-96b5-ed36-7376bd6b66f0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5592-96b5-2215-7df1b0629880	BT	BTN	064	Bhutan 	Butan	\N
00040000-5592-96b5-ba00-de3f873c2787	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5592-96b5-fc1b-54f3b604154f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5592-96b5-be24-de6187f56e56	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5592-96b5-ae15-d84a5111f4ae	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5592-96b5-a861-595fe5adc1c2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5592-96b5-885b-47982dbd09b0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5592-96b5-c2a9-d1676e0f80af	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5592-96b5-024d-8e3f1d734fd0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5592-96b5-0b82-1ef320a15765	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5592-96b5-86d1-879ff56d3540	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5592-96b5-fd28-8da3f5c04251	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5592-96b5-40a7-3d32ec68a5df	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5592-96b5-a53c-9f659e53b902	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5592-96b5-4d0b-a69c23bee89a	CA	CAN	124	Canada 	Kanada	\N
00040000-5592-96b5-0e9a-cc2ccee37aff	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5592-96b5-acbe-922f92d18bba	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5592-96b5-62be-5727e76df78e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5592-96b5-7249-56570bdd770b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5592-96b5-302c-e21a3b3cdb34	CL	CHL	152	Chile 	Čile	\N
00040000-5592-96b5-e93c-139b1965cc3a	CN	CHN	156	China 	Kitajska	\N
00040000-5592-96b5-6a24-4ecfd685d93b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5592-96b5-789f-167ebf7b2a8e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5592-96b5-c594-b8e88b9bb6fb	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5592-96b5-e6fd-88b75e098f70	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5592-96b5-f93f-24acd012c217	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5592-96b5-5a23-08c412dcdd33	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5592-96b5-3e8f-5cc07d970bb7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5592-96b5-de18-97f80f4ae279	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5592-96b5-4969-1f9ca8b75089	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5592-96b5-f482-e261b20a8c3f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5592-96b5-24c8-b2d53a19e2f9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5592-96b5-06c8-df460597e03d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5592-96b5-0cd1-ac8cfb66da19	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5592-96b5-c30b-f84c8973b40b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5592-96b5-25a5-52d1ebba6d20	DK	DNK	208	Denmark 	Danska	\N
00040000-5592-96b5-4df8-e5bff12d6a19	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5592-96b5-bdb2-e07edd7064ce	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-96b5-feff-350cf6dc4046	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5592-96b5-50d3-d758c50ebd8d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5592-96b5-ea6f-cdf790c6019a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5592-96b5-de4c-3fcac1ee4a30	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5592-96b5-7ef1-069ef4e9cd2f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5592-96b5-2a10-163c4657bcf0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5592-96b5-04e7-beee52531a6f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5592-96b5-21f7-a27dc8eded0b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5592-96b5-370f-423524ea5920	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5592-96b5-d565-4bfcffc712a1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5592-96b5-f4f0-84b0131460f2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5592-96b5-d778-26ccf7502d5d	FI	FIN	246	Finland 	Finska	\N
00040000-5592-96b5-cb40-cbb3f655c69a	FR	FRA	250	France 	Francija	\N
00040000-5592-96b5-80f9-cba6649f3ada	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5592-96b5-ad70-5bf49ccb2636	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5592-96b5-64bd-40b1b5c2eef8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5592-96b5-b430-bf198e3f7318	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5592-96b5-846a-f685db3618f5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5592-96b5-f8ae-7ddb2f3afe44	GM	GMB	270	Gambia 	Gambija	\N
00040000-5592-96b5-5cd7-c608fc3cdecc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5592-96b5-401a-899a53a919c5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5592-96b5-ed08-df6aa905815e	GH	GHA	288	Ghana 	Gana	\N
00040000-5592-96b5-1ba5-1035b8c822ed	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5592-96b5-6c79-3064446f1553	GR	GRC	300	Greece 	Grčija	\N
00040000-5592-96b5-7cb3-fb7a9a621b11	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5592-96b5-73e7-ca64acd6724c	GD	GRD	308	Grenada 	Grenada	\N
00040000-5592-96b5-044e-a38bae2eff0c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5592-96b5-b0d3-4649bf3955dd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5592-96b5-dbf7-5bfd09fe212b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5592-96b5-cbc9-26b5dfb1560b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5592-96b5-a070-0acb60e26524	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5592-96b5-b215-41b5a56e64d8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5592-96b5-6830-6a758035c4ea	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5592-96b5-d213-7f318235d8fc	HT	HTI	332	Haiti 	Haiti	\N
00040000-5592-96b5-85f4-04a047cb9e65	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5592-96b5-0068-cc79ee1b8682	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5592-96b5-dce0-7453baec802c	HN	HND	340	Honduras 	Honduras	\N
00040000-5592-96b5-be03-5deb6e29134b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5592-96b5-b17b-01125b7d5d7e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5592-96b5-b470-e6d88a8377c8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5592-96b5-52fa-a80a02ac9ded	IN	IND	356	India 	Indija	\N
00040000-5592-96b5-1b18-35629002a055	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5592-96b5-bbd1-c1ce67dfbe42	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5592-96b5-0de1-af13ea97a51f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5592-96b5-ac60-3bafdf47bfd7	IE	IRL	372	Ireland 	Irska	\N
00040000-5592-96b5-4db7-15069575ef75	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5592-96b5-44e7-437600898459	IL	ISR	376	Israel 	Izrael	\N
00040000-5592-96b5-5c5b-0025b9547e29	IT	ITA	380	Italy 	Italija	\N
00040000-5592-96b5-ab6a-a38dbe73c3e7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5592-96b5-04d1-3a5f1b10b5db	JP	JPN	392	Japan 	Japonska	\N
00040000-5592-96b5-456b-5e558a7a6eb1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5592-96b5-4e88-dfc8b9a467c5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5592-96b5-aedf-79c8a48f5e95	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5592-96b5-fcb3-562c316de60a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5592-96b5-0073-6c302bde0218	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5592-96b5-8f41-07555e629125	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5592-96b5-5fa2-820975f82ea9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5592-96b5-d9e0-aadd4c04c323	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5592-96b5-9368-b4342dec599c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5592-96b5-2fcc-959027036201	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5592-96b5-3a0b-59590169cbaa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5592-96b5-579b-7d050861bcc7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5592-96b5-974f-2fb770de5347	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5592-96b5-9db7-9864f2a97fc2	LR	LBR	430	Liberia 	Liberija	\N
00040000-5592-96b5-577f-6be88d09889e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5592-96b5-08bd-2bb6a7d375f2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5592-96b5-823f-f125a2544931	LT	LTU	440	Lithuania 	Litva	\N
00040000-5592-96b5-b339-fcec5c3847e6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5592-96b5-45fe-67e5eaac2103	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5592-96b5-5fef-d0d870e12f14	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5592-96b5-3dd7-077954062d19	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5592-96b5-e6ae-a421f4491c53	MW	MWI	454	Malawi 	Malavi	\N
00040000-5592-96b5-9573-b3a3447f47a2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5592-96b5-2f99-cc4ba19942c6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5592-96b5-8b19-40b6781070b4	ML	MLI	466	Mali 	Mali	\N
00040000-5592-96b5-8c60-bd2fcf6ad590	MT	MLT	470	Malta 	Malta	\N
00040000-5592-96b5-578a-009bd6fcf246	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5592-96b5-47b8-d300d953e30a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5592-96b5-1de1-615de26798ec	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5592-96b5-cfe7-6f8ea2b251ba	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5592-96b5-8985-f70bf89a9eef	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5592-96b5-a43c-b190dba4a9d3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5592-96b5-a3ea-6086907033c2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5592-96b5-42bd-4bb69d3b8792	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5592-96b5-842a-b09273ee4526	MC	MCO	492	Monaco 	Monako	\N
00040000-5592-96b5-7f50-4c2fba83d289	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5592-96b5-0b36-6d5b4a1e25b5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5592-96b5-8a91-1211ad8c4dfe	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5592-96b5-b98e-3118f64fb2af	MA	MAR	504	Morocco 	Maroko	\N
00040000-5592-96b5-d442-7a05d0f7f018	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5592-96b5-3db9-fe882d78f486	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5592-96b5-8720-ad41702d0f47	NA	NAM	516	Namibia 	Namibija	\N
00040000-5592-96b5-53eb-73b791428949	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5592-96b5-cc7f-3c6cbad430f3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5592-96b5-653a-f0aa5a5ed8d5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5592-96b5-9af0-2aad7492d770	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5592-96b5-4eb6-c7fb9478f5f4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5592-96b5-b476-b07e5630772c	NE	NER	562	Niger 	Niger 	\N
00040000-5592-96b5-2ad8-b5bedfb4b5dc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5592-96b5-28c5-0ee8c984fae4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5592-96b5-3730-fd1044ea18ba	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5592-96b5-f333-3f0d89a571a5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5592-96b5-0765-8242c5e86fa3	NO	NOR	578	Norway 	Norveška	\N
00040000-5592-96b5-64c4-329aec915cd7	OM	OMN	512	Oman 	Oman	\N
00040000-5592-96b5-14dc-78182b692d4d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5592-96b5-4235-20cddd2abb4d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5592-96b5-2de2-058cce123297	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5592-96b5-e84b-917cdb971288	PA	PAN	591	Panama 	Panama	\N
00040000-5592-96b5-c6d0-e0f679780597	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5592-96b5-0e0e-a2222b12eb95	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5592-96b5-fee4-e9ae3f945838	PE	PER	604	Peru 	Peru	\N
00040000-5592-96b5-35ec-4d1b00d5b14f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5592-96b5-6d37-5b7dedeb0c81	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5592-96b5-0f6c-83c4c5e170d0	PL	POL	616	Poland 	Poljska	\N
00040000-5592-96b5-784e-b7cab056421c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5592-96b5-e985-7cdc459857b9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5592-96b5-8d91-c476f4bedb27	QA	QAT	634	Qatar 	Katar	\N
00040000-5592-96b5-4a52-b592bbf9e03b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5592-96b5-0781-2cb626ed0a5e	RO	ROU	642	Romania 	Romunija	\N
00040000-5592-96b5-f06d-a7f780252d2f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5592-96b5-0011-a7dad291f72e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5592-96b5-3bbe-ebc1d6f9d4fc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5592-96b5-9509-c7db5c738434	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5592-96b5-407a-24141809792b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5592-96b5-4307-ae45ff288e9b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5592-96b5-0306-a6bb8df00d84	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5592-96b5-63a7-59b3cb273a50	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5592-96b5-4f46-577c202c6bfa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5592-96b5-b300-823f08b7d447	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5592-96b5-0db7-32609ec50342	SM	SMR	674	San Marino 	San Marino	\N
00040000-5592-96b5-084b-507c482dc5cc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5592-96b5-8c96-b01dc98288cd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5592-96b5-dddb-49da1ea35226	SN	SEN	686	Senegal 	Senegal	\N
00040000-5592-96b5-96cd-97b0c5ce325e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5592-96b5-e8e3-e602eeb2a904	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5592-96b5-f364-85b152c93481	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5592-96b5-e94c-55f887459769	SG	SGP	702	Singapore 	Singapur	\N
00040000-5592-96b5-10e0-5bf908dac1cc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5592-96b5-8814-67a46117bacc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5592-96b5-5513-c028324f4a1e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5592-96b5-9fba-e8ca82bcecf8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5592-96b5-ed17-95d5e6901a36	SO	SOM	706	Somalia 	Somalija	\N
00040000-5592-96b5-363e-040b757944c2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5592-96b5-fb3a-f73178c558ed	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5592-96b5-435d-b87f9c669126	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5592-96b5-a54c-d2cb99765051	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5592-96b5-3549-61b0f303929f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5592-96b5-8e5e-b27a082dd7f9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5592-96b5-5e2c-cf175293086d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5592-96b5-bd27-0e2c83f71857	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5592-96b5-949b-ce7d0057bd28	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5592-96b5-1448-ead4088fc053	SE	SWE	752	Sweden 	Švedska	\N
00040000-5592-96b5-8041-25982044b85b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5592-96b5-e93f-b72ff337c732	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5592-96b5-e67e-dc2250729c94	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5592-96b5-21c8-7c32c35c5e2d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5592-96b5-bb1c-57f8cc0432dc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5592-96b5-13ba-783edb99e254	TH	THA	764	Thailand 	Tajska	\N
00040000-5592-96b5-d282-24ff467ae015	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5592-96b5-d313-7f0097fa8e53	TG	TGO	768	Togo 	Togo	\N
00040000-5592-96b5-af55-8f0e8554f503	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5592-96b5-6686-0ec49af4c407	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5592-96b5-e15a-c067b3667398	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5592-96b5-f1d9-85bbcbdb6a96	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5592-96b5-990a-1a6770ef2293	TR	TUR	792	Turkey 	Turčija	\N
00040000-5592-96b5-bfcc-fa779105d8c6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5592-96b5-3d5d-b8dcf0464f7e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-96b5-b282-8fe8d56086ad	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5592-96b5-5fb5-6c6d9c5498c4	UG	UGA	800	Uganda 	Uganda	\N
00040000-5592-96b5-104c-15cba254dd38	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5592-96b5-73d2-b8e6689f27a9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5592-96b5-b144-c4b03a83b8ca	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5592-96b5-b35d-4976bca61d16	US	USA	840	United States 	Združene države Amerike	\N
00040000-5592-96b5-29dd-1981f3d5bc9b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5592-96b5-2469-40eff8e98bac	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5592-96b5-83ae-80b94137e1c3	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5592-96b5-af9e-0a547f5cfe2b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5592-96b5-485f-f48f44681ddf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5592-96b5-f00b-151193446180	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5592-96b5-f07c-2eae35865469	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-96b5-d93e-9c5a60f251f9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5592-96b5-ef2f-82ee075a3d58	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5592-96b5-2b63-8776abbcc660	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5592-96b5-4cf6-fbc4271e1a49	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5592-96b5-97bf-aa41c21d6bc5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5592-96b5-0978-29078f1947b1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8577578)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5592-96b7-b8bd-d3b3395b6a22	000e0000-5592-96b7-d29d-0582426bf5cf	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5592-96b6-3bb2-975d5f86af39	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5592-96b7-8899-b06fea482943	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5592-96b6-b6f9-d9a562b46d51	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8577386)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5592-96b7-ac53-7a2e523e7130	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5592-96b6-472e-8c1af3645571
000d0000-5592-96b7-2cae-530894f3b10a	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-96b6-472e-8c1af3645571
000d0000-5592-96b7-5e39-db294c10f42e	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5592-96b6-d0de-8368802e482f
000d0000-5592-96b7-e8cb-7a16f9dce856	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5592-96b6-4cdb-c285a83ac4fc
000d0000-5592-96b7-7ebe-f37efaf88062	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5592-96b6-4cdb-c285a83ac4fc
000d0000-5592-96b7-7200-2b0f5a11e8e5	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5592-96b6-4cdb-c285a83ac4fc
000d0000-5592-96b7-79ee-2370af1c0e97	000e0000-5592-96b7-88a5-4e6e7ef4e05c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-96b6-472e-8c1af3645571
\.


--
-- TOC entry 2866 (class 0 OID 8577206)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8577254)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8577186)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5592-96b7-f566-e2a1b99b5ec4	00080000-5592-96b7-9e83-9a8b6209665c	00090000-5592-96b7-29ad-d9018f9c9320	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8577303)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8577328)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8577143)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5592-96b5-46d8-94804775ce17	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5592-96b5-a879-8b7b445dfd43	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5592-96b5-32f2-f777455fd3f8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5592-96b5-de25-587416c26758	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5592-96b5-06c3-b19b854515f7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5592-96b5-95b1-67e3c3a51c62	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5592-96b5-64df-18b565a44fc6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5592-96b5-20ec-211e8765ade7	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-96b5-7553-457266110c86	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-96b5-45c0-a10b2e185d2a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5592-96b5-6aa7-91e5cad3f168	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5592-96b5-c30a-035830657f4b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5592-96b5-7694-b17115536d7d	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5592-96b7-8327-780a49fd0c45	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5592-96b7-fae6-30ce80bf9586	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5592-96b7-5969-d28f808380b2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5592-96b7-3d2d-11b880cf797e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5592-96b7-f06a-0b38be4f8725	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5592-96b7-d17c-ffed351b9010	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8577056)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5592-96b7-f9fb-90f06a099807	00000000-5592-96b7-fae6-30ce80bf9586	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5592-96b7-fb02-0b2336d55278	00000000-5592-96b7-fae6-30ce80bf9586	00010000-5592-96b5-b8ff-c7c7f62533c8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5592-96b7-8adc-4a0f2365e0be	00000000-5592-96b7-5969-d28f808380b2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8577067)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5592-96b7-5e55-deb85dbe67f8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5592-96b7-7c08-e0822175ed6a	00010000-5592-96b7-7a82-8440b8dc627f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5592-96b7-3613-887e830b2c34	00010000-5592-96b7-fc9a-9219f18347eb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5592-96b7-44d0-4a6631d1cf1b	00010000-5592-96b7-de04-034624001cb6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5592-96b7-757f-b531ae5fb4b4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5592-96b7-c679-422eef0d63af	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5592-96b7-7b2e-3aea2df2db42	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5592-96b7-b468-5b0646b0dda1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5592-96b7-29ad-d9018f9c9320	00010000-5592-96b7-6c19-882bed6fa77b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5592-96b7-68f2-a09da72bd785	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5592-96b7-c887-a84f1e153581	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5592-96b7-c2f9-903b078e06fb	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5592-96b7-8553-77bf307f31a7	00010000-5592-96b7-41c2-9bdd348c4b40	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8577021)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5592-96b5-a092-d2087549eab9	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5592-96b5-7e41-a5988b337f46	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5592-96b5-b1a1-de2c5121ffde	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5592-96b5-b4df-3f449508882e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5592-96b5-2a35-c5e50d15ee26	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5592-96b5-39be-5087bb43fa62	Abonma-read	Abonma - branje	f
00030000-5592-96b5-3205-4e7a390cda0f	Abonma-write	Abonma - spreminjanje	f
00030000-5592-96b5-5cf3-81f6e5307423	Alternacija-read	Alternacija - branje	f
00030000-5592-96b5-a3f3-109be52b3214	Alternacija-write	Alternacija - spreminjanje	f
00030000-5592-96b5-0e2d-6d71a8f458c7	Arhivalija-read	Arhivalija - branje	f
00030000-5592-96b5-1811-b2ba8675b971	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5592-96b5-b8a0-9a4763f3d0fc	Besedilo-read	Besedilo - branje	f
00030000-5592-96b5-2879-1f2360f4c0b8	Besedilo-write	Besedilo - spreminjanje	f
00030000-5592-96b5-bcdd-db677ee58da5	DogodekIzven-read	DogodekIzven - branje	f
00030000-5592-96b5-8264-5c45f0c9ae00	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5592-96b5-6b3d-5074850343f4	Dogodek-read	Dogodek - branje	f
00030000-5592-96b5-a1f6-9f317a98bea1	Dogodek-write	Dogodek - spreminjanje	f
00030000-5592-96b5-7439-8b11af77d63e	DrugiVir-read	DrugiVir - branje	f
00030000-5592-96b5-289d-c3367d8c8dca	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5592-96b5-f63c-06c490cf2294	Drzava-read	Drzava - branje	f
00030000-5592-96b5-9b0b-483fdfa33dcf	Drzava-write	Drzava - spreminjanje	f
00030000-5592-96b5-ffd1-1068cef4ed91	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5592-96b5-9be5-0e57b6ba46f4	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5592-96b5-286b-47d5c3b226ca	Funkcija-read	Funkcija - branje	f
00030000-5592-96b5-18c5-6c8567d7ddc4	Funkcija-write	Funkcija - spreminjanje	f
00030000-5592-96b5-cd51-b32b0e65f997	Gostovanje-read	Gostovanje - branje	f
00030000-5592-96b5-35a7-c067a91abcde	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5592-96b5-9038-005d8f2911e8	Gostujoca-read	Gostujoca - branje	f
00030000-5592-96b5-ac54-8d26038ca023	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5592-96b5-727a-ffcaccd30469	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5592-96b5-5f7f-9552dd5a5485	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5592-96b5-a39b-2bd8b837ff76	Kupec-read	Kupec - branje	f
00030000-5592-96b5-0726-69efa242c4fd	Kupec-write	Kupec - spreminjanje	f
00030000-5592-96b5-7fa5-e82e6a382ec9	NacinPlacina-read	NacinPlacina - branje	f
00030000-5592-96b5-5aaa-bdd152428a6b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5592-96b5-8807-936f02d2dfb7	Option-read	Option - branje	f
00030000-5592-96b5-f98f-c4f931282158	Option-write	Option - spreminjanje	f
00030000-5592-96b5-8c38-4686f94577a8	OptionValue-read	OptionValue - branje	f
00030000-5592-96b5-fe45-417c622505b0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5592-96b5-d314-8c273ad6f17a	Oseba-read	Oseba - branje	f
00030000-5592-96b5-f029-f2e8de87ea1c	Oseba-write	Oseba - spreminjanje	f
00030000-5592-96b5-cb09-cf33d92ca720	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5592-96b5-1d4d-fda54918fd1a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5592-96b5-35cc-601a469584ad	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5592-96b5-f4b9-7da100a8e5cf	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5592-96b5-5f43-367f5e28f983	Pogodba-read	Pogodba - branje	f
00030000-5592-96b5-fbe3-be69590c8909	Pogodba-write	Pogodba - spreminjanje	f
00030000-5592-96b5-08d7-ebb42fc60512	Popa-read	Popa - branje	f
00030000-5592-96b5-8adb-08f42794f93f	Popa-write	Popa - spreminjanje	f
00030000-5592-96b5-d596-a88a189f47ba	Posta-read	Posta - branje	f
00030000-5592-96b5-e08e-2700368a6a2d	Posta-write	Posta - spreminjanje	f
00030000-5592-96b5-cd29-022d323eda8d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5592-96b5-7d6e-32a2d68ba78d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5592-96b5-f8cd-9c81988f691f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5592-96b5-0999-1c29ab26bcc2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5592-96b5-7419-84316ee48c36	Predstava-read	Predstava - branje	f
00030000-5592-96b5-d2ab-610474467570	Predstava-write	Predstava - spreminjanje	f
00030000-5592-96b5-0adf-2ec9fdd28714	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5592-96b5-90c6-030d7417baa0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5592-96b5-cce5-8c2af9a4d291	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5592-96b5-07d4-6c11f83e747c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5592-96b5-a7fa-9657c7cc586a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5592-96b5-24f4-c55fa71a0450	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5592-96b5-6be0-824d4d411c83	ProgramDela-read	ProgramDela - branje	f
00030000-5592-96b5-88aa-fd9c9869783b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5592-96b5-2df9-54f904821881	ProgramFestival-read	ProgramFestival - branje	f
00030000-5592-96b5-26cb-922881b9976c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5592-96b5-9168-6ba10381a44a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5592-96b5-a01c-74c5e3c4c091	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5592-96b5-38a2-3abc789dc1f1	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5592-96b5-8e0a-b5e67723269e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5592-96b5-093e-5c5fede6cd57	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5592-96b5-98bf-4f838d6c6f4f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5592-96b5-6d07-1910df7de605	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5592-96b5-ffb6-31686db90520	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5592-96b5-75e6-68705e86a411	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5592-96b5-8fdb-42a0fc6b1b76	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5592-96b5-e749-9fcbb4c28134	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5592-96b5-1a0c-08c89e97e584	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5592-96b5-340b-32d1cb82a259	ProgramRazno-read	ProgramRazno - branje	f
00030000-5592-96b5-0a4e-fab30632a998	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5592-96b5-cb1f-b38268fd2267	Prostor-read	Prostor - branje	f
00030000-5592-96b5-17a1-ac8b90374b9a	Prostor-write	Prostor - spreminjanje	f
00030000-5592-96b5-cad1-97e322905787	Racun-read	Racun - branje	f
00030000-5592-96b5-ac7a-55c99d350965	Racun-write	Racun - spreminjanje	f
00030000-5592-96b5-bbc2-f18318db497a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5592-96b5-9be7-35217df39e91	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5592-96b5-8f73-a6d438c3bfd5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5592-96b5-c951-499836daaaa6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5592-96b5-0f30-36b977e02931	Rekvizit-read	Rekvizit - branje	f
00030000-5592-96b5-1c01-ee24dc379c2f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5592-96b5-5401-394c84e2b2f9	Revizija-read	Revizija - branje	f
00030000-5592-96b5-1955-d00ec6883811	Revizija-write	Revizija - spreminjanje	f
00030000-5592-96b5-82d5-cdcc1101e8bc	Rezervacija-read	Rezervacija - branje	f
00030000-5592-96b5-9848-3fd50cb1c035	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5592-96b5-2fe8-d28f3260e5f2	SedezniRed-read	SedezniRed - branje	f
00030000-5592-96b5-c4ea-e43c0127b1aa	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5592-96b5-e524-77059e2d50fb	Sedez-read	Sedez - branje	f
00030000-5592-96b5-6a4d-bb259092ce6a	Sedez-write	Sedez - spreminjanje	f
00030000-5592-96b5-c999-fe0f2923c171	Sezona-read	Sezona - branje	f
00030000-5592-96b5-2933-bda66e0ada0b	Sezona-write	Sezona - spreminjanje	f
00030000-5592-96b5-1f84-a8c4c36cbcca	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5592-96b5-4a93-ebd83288ef43	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5592-96b5-fac2-6dcc34501a78	Stevilcenje-read	Stevilcenje - branje	f
00030000-5592-96b5-fa9e-5ee48ba47541	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5592-96b5-b6de-11d3c8ab1946	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5592-96b5-94ae-2dcb4c9bb12b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5592-96b5-f315-f0e825f977a2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5592-96b5-d1b2-8c8543e5a30c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5592-96b5-6a2c-e5e44f5c8b44	Telefonska-read	Telefonska - branje	f
00030000-5592-96b5-a8cf-23d531a41ade	Telefonska-write	Telefonska - spreminjanje	f
00030000-5592-96b5-c1ff-6023ed1ddb8f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5592-96b5-03d7-579aa2718bdf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5592-96b5-e46b-cf470ae3b3c1	TipFunkcije-read	TipFunkcije - branje	f
00030000-5592-96b5-526a-cd1363494cc2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5592-96b5-3b47-ee2ec7a1f498	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5592-96b5-a1e4-6119784dd251	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5592-96b5-9ccb-339265357590	Trr-read	Trr - branje	f
00030000-5592-96b5-155f-e884df8fec40	Trr-write	Trr - spreminjanje	f
00030000-5592-96b5-7cd0-34e4df57c2c9	Uprizoritev-read	Uprizoritev - branje	f
00030000-5592-96b5-c94e-b3ead165e9f2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5592-96b5-c977-b1aec2754a90	Vaja-read	Vaja - branje	f
00030000-5592-96b5-43c9-0b90ae1d00e4	Vaja-write	Vaja - spreminjanje	f
00030000-5592-96b5-7e45-cdf82df950ce	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5592-96b5-4129-d94b4e7f4e7d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5592-96b5-f535-a24b2c64cc53	Zaposlitev-read	Zaposlitev - branje	f
00030000-5592-96b5-d7e5-223d836c3b21	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5592-96b5-c7b6-d52ea82196d0	Zasedenost-read	Zasedenost - branje	f
00030000-5592-96b5-24c5-380e91a56855	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5592-96b5-3878-d7b523ad72c8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5592-96b5-6557-523045402602	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5592-96b5-6f1a-87e2078fe444	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5592-96b5-8a49-4ca920ee449d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8577040)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5592-96b5-3db2-c16f98b81bbe	00030000-5592-96b5-7e41-a5988b337f46
00020000-5592-96b5-358b-ee4024e1593f	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-3205-4e7a390cda0f
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-5cf3-81f6e5307423
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-a3f3-109be52b3214
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-b4df-3f449508882e
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-a1f6-9f317a98bea1
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-9b0b-483fdfa33dcf
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-286b-47d5c3b226ca
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-18c5-6c8567d7ddc4
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-35a7-c067a91abcde
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-ac54-8d26038ca023
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-727a-ffcaccd30469
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-5f7f-9552dd5a5485
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-d314-8c273ad6f17a
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-f029-f2e8de87ea1c
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-8adb-08f42794f93f
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-e08e-2700368a6a2d
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-f8cd-9c81988f691f
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-0999-1c29ab26bcc2
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-d2ab-610474467570
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-a7fa-9657c7cc586a
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-24f4-c55fa71a0450
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-17a1-ac8b90374b9a
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-c951-499836daaaa6
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-1c01-ee24dc379c2f
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-2933-bda66e0ada0b
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-e46b-cf470ae3b3c1
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-7cd0-34e4df57c2c9
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-c94e-b3ead165e9f2
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-c977-b1aec2754a90
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-43c9-0b90ae1d00e4
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-c7b6-d52ea82196d0
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-24c5-380e91a56855
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b5-0763-00b3ba4a2577	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-727a-ffcaccd30469
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-5f7f-9552dd5a5485
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-d314-8c273ad6f17a
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-f029-f2e8de87ea1c
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-f8cd-9c81988f691f
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-0999-1c29ab26bcc2
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-6a2c-e5e44f5c8b44
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-a8cf-23d531a41ade
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-9ccb-339265357590
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-155f-e884df8fec40
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-f535-a24b2c64cc53
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-d7e5-223d836c3b21
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b5-e26e-353c90a695ad	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-5cf3-81f6e5307423
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-1811-b2ba8675b971
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-b8a0-9a4763f3d0fc
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-bcdd-db677ee58da5
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-286b-47d5c3b226ca
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-727a-ffcaccd30469
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-d314-8c273ad6f17a
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-a7fa-9657c7cc586a
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-e46b-cf470ae3b3c1
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-c977-b1aec2754a90
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-c7b6-d52ea82196d0
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b5-0466-335b329f1d7c	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-3205-4e7a390cda0f
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-a3f3-109be52b3214
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-e46b-cf470ae3b3c1
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b5-9f8e-3b82c664edb4	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-c1ff-6023ed1ddb8f
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-b1a1-de2c5121ffde
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-e46b-cf470ae3b3c1
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b5-d031-5379238d5a58	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a092-d2087549eab9
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7e41-a5988b337f46
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-b1a1-de2c5121ffde
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-b4df-3f449508882e
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-2a35-c5e50d15ee26
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-39be-5087bb43fa62
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-3205-4e7a390cda0f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-5cf3-81f6e5307423
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a3f3-109be52b3214
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0e2d-6d71a8f458c7
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1811-b2ba8675b971
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-b8a0-9a4763f3d0fc
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-2879-1f2360f4c0b8
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-bcdd-db677ee58da5
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8264-5c45f0c9ae00
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6b3d-5074850343f4
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a1f6-9f317a98bea1
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f63c-06c490cf2294
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9b0b-483fdfa33dcf
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-ffd1-1068cef4ed91
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9be5-0e57b6ba46f4
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-286b-47d5c3b226ca
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-18c5-6c8567d7ddc4
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cd51-b32b0e65f997
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-35a7-c067a91abcde
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9038-005d8f2911e8
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-ac54-8d26038ca023
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-727a-ffcaccd30469
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-5f7f-9552dd5a5485
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a39b-2bd8b837ff76
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0726-69efa242c4fd
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7fa5-e82e6a382ec9
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-5aaa-bdd152428a6b
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8807-936f02d2dfb7
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f98f-c4f931282158
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8c38-4686f94577a8
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-fe45-417c622505b0
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-d314-8c273ad6f17a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f029-f2e8de87ea1c
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cb09-cf33d92ca720
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1d4d-fda54918fd1a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-35cc-601a469584ad
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f4b9-7da100a8e5cf
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-5f43-367f5e28f983
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-fbe3-be69590c8909
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-08d7-ebb42fc60512
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8adb-08f42794f93f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-d596-a88a189f47ba
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-e08e-2700368a6a2d
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cd29-022d323eda8d
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7d6e-32a2d68ba78d
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f8cd-9c81988f691f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0999-1c29ab26bcc2
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7419-84316ee48c36
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-d2ab-610474467570
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0adf-2ec9fdd28714
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-90c6-030d7417baa0
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cce5-8c2af9a4d291
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-07d4-6c11f83e747c
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a7fa-9657c7cc586a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-24f4-c55fa71a0450
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6be0-824d4d411c83
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-88aa-fd9c9869783b
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-2df9-54f904821881
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-26cb-922881b9976c
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9168-6ba10381a44a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a01c-74c5e3c4c091
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-38a2-3abc789dc1f1
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8e0a-b5e67723269e
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-093e-5c5fede6cd57
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-98bf-4f838d6c6f4f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6d07-1910df7de605
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-ffb6-31686db90520
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-75e6-68705e86a411
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8fdb-42a0fc6b1b76
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-e749-9fcbb4c28134
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1a0c-08c89e97e584
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-340b-32d1cb82a259
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0a4e-fab30632a998
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cb1f-b38268fd2267
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-17a1-ac8b90374b9a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-cad1-97e322905787
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-ac7a-55c99d350965
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-bbc2-f18318db497a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9be7-35217df39e91
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8f73-a6d438c3bfd5
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c951-499836daaaa6
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-0f30-36b977e02931
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1c01-ee24dc379c2f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-5401-394c84e2b2f9
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1955-d00ec6883811
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-82d5-cdcc1101e8bc
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9848-3fd50cb1c035
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-2fe8-d28f3260e5f2
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c4ea-e43c0127b1aa
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-e524-77059e2d50fb
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6a4d-bb259092ce6a
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c999-fe0f2923c171
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-2933-bda66e0ada0b
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-1f84-a8c4c36cbcca
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-4a93-ebd83288ef43
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-fac2-6dcc34501a78
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-fa9e-5ee48ba47541
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-b6de-11d3c8ab1946
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-94ae-2dcb4c9bb12b
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f315-f0e825f977a2
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-d1b2-8c8543e5a30c
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6a2c-e5e44f5c8b44
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a8cf-23d531a41ade
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c1ff-6023ed1ddb8f
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-03d7-579aa2718bdf
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-e46b-cf470ae3b3c1
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-526a-cd1363494cc2
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-3b47-ee2ec7a1f498
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-a1e4-6119784dd251
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-9ccb-339265357590
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-155f-e884df8fec40
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7cd0-34e4df57c2c9
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c94e-b3ead165e9f2
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c977-b1aec2754a90
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-43c9-0b90ae1d00e4
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-7e45-cdf82df950ce
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-4129-d94b4e7f4e7d
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-f535-a24b2c64cc53
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-d7e5-223d836c3b21
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-c7b6-d52ea82196d0
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-24c5-380e91a56855
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-3878-d7b523ad72c8
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6557-523045402602
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-6f1a-87e2078fe444
00020000-5592-96b7-3a26-5c4835148fd8	00030000-5592-96b5-8a49-4ca920ee449d
\.


--
-- TOC entry 2881 (class 0 OID 8577335)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8577366)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8577498)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5592-96b7-793d-96c3961f8e2c	00090000-5592-96b7-5e55-deb85dbe67f8	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8577100)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5592-96b7-9e83-9a8b6209665c	00040000-5592-96b5-3b13-9abbaf2ccfec	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-96b7-87fa-89aa7b1641cb	00040000-5592-96b5-3b13-9abbaf2ccfec	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-96b7-6799-739fe830ff6a	00040000-5592-96b5-3b13-9abbaf2ccfec	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-96b7-04fa-62d10a89d2fa	00040000-5592-96b5-3b13-9abbaf2ccfec	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-96b7-fcdb-0ad9a7141047	00040000-5592-96b5-3b13-9abbaf2ccfec	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-96b7-13a2-8cab3144408a	00040000-5592-96b5-5513-c028324f4a1e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8577135)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5592-96b5-b15d-a169bc88e56f	8341	Adlešiči
00050000-5592-96b5-dd10-b14f33d10eac	5270	Ajdovščina
00050000-5592-96b5-79a8-4d24e0bb079f	6280	Ankaran/Ancarano
00050000-5592-96b5-f1c6-98441686efaa	9253	Apače
00050000-5592-96b5-d18d-035f6a6f4b30	8253	Artiče
00050000-5592-96b5-4fd5-c9962816280c	4275	Begunje na Gorenjskem
00050000-5592-96b5-f104-b7b6c9e60b2c	1382	Begunje pri Cerknici
00050000-5592-96b5-0a5d-89118090db47	9231	Beltinci
00050000-5592-96b5-4c04-48c025b257b8	2234	Benedikt
00050000-5592-96b5-e54c-f969d2edfbc6	2345	Bistrica ob Dravi
00050000-5592-96b5-e629-88c106aa426d	3256	Bistrica ob Sotli
00050000-5592-96b5-69f9-b60382ac62c5	8259	Bizeljsko
00050000-5592-96b5-669e-8a048222172c	1223	Blagovica
00050000-5592-96b5-c30c-cd1ea2092e28	8283	Blanca
00050000-5592-96b5-36c5-d476b4e27ad6	4260	Bled
00050000-5592-96b5-f703-ee5759b595a2	4273	Blejska Dobrava
00050000-5592-96b5-d42a-2a449e4d30f2	9265	Bodonci
00050000-5592-96b5-4eba-35c3c03155be	9222	Bogojina
00050000-5592-96b5-7587-25ccaaa9a8c7	4263	Bohinjska Bela
00050000-5592-96b5-bb7a-b4a410c47ca4	4264	Bohinjska Bistrica
00050000-5592-96b5-d201-e80a256db956	4265	Bohinjsko jezero
00050000-5592-96b5-d784-907e80043d93	1353	Borovnica
00050000-5592-96b5-639a-0f6aeaf00d7c	8294	Boštanj
00050000-5592-96b5-8a85-34e374827acd	5230	Bovec
00050000-5592-96b5-03be-c49d651a1e8f	5295	Branik
00050000-5592-96b5-162a-df28bdec9924	3314	Braslovče
00050000-5592-96b5-ac29-d15c18febc9a	5223	Breginj
00050000-5592-96b5-7f8f-acb45ce69859	8280	Brestanica
00050000-5592-96b5-2aa8-3d385ad7b524	2354	Bresternica
00050000-5592-96b5-95d8-1e14a9ce9926	4243	Brezje
00050000-5592-96b5-53d0-f3c1ea78ef7c	1351	Brezovica pri Ljubljani
00050000-5592-96b5-027c-09823edda316	8250	Brežice
00050000-5592-96b5-ec66-9b2bbe54dc89	4210	Brnik - Aerodrom
00050000-5592-96b5-9509-439a8229d78c	8321	Brusnice
00050000-5592-96b5-38ea-9d017f1b4a58	3255	Buče
00050000-5592-96b5-4725-3df77d9e7409	8276	Bučka 
00050000-5592-96b6-162b-8ed790302047	9261	Cankova
00050000-5592-96b6-3d95-b4fb0b0b1b9c	3000	Celje 
00050000-5592-96b6-6d16-2c299805c999	3001	Celje - poštni predali
00050000-5592-96b6-1bbb-a160a628dc47	4207	Cerklje na Gorenjskem
00050000-5592-96b6-e135-793833b1e206	8263	Cerklje ob Krki
00050000-5592-96b6-1b67-6d4d91f35db0	1380	Cerknica
00050000-5592-96b6-8dea-473c64546179	5282	Cerkno
00050000-5592-96b6-6a9e-9fb184af1acc	2236	Cerkvenjak
00050000-5592-96b6-3f4f-ca6daa79f344	2215	Ceršak
00050000-5592-96b6-7ba1-38b1ad90593b	2326	Cirkovce
00050000-5592-96b6-4fed-43cd12b36545	2282	Cirkulane
00050000-5592-96b6-fb0a-a516e3c5c241	5273	Col
00050000-5592-96b6-965a-1f01b0f6f0f2	8251	Čatež ob Savi
00050000-5592-96b6-d7cc-8e21c9502d98	1413	Čemšenik
00050000-5592-96b6-b2e2-69a35b497722	5253	Čepovan
00050000-5592-96b6-9af4-15bfda6ed65f	9232	Črenšovci
00050000-5592-96b6-72da-b94f2fe7a755	2393	Črna na Koroškem
00050000-5592-96b6-b658-df753c9e6751	6275	Črni Kal
00050000-5592-96b6-261f-b1eae1d690b2	5274	Črni Vrh nad Idrijo
00050000-5592-96b6-4918-eb4e8ee18a14	5262	Črniče
00050000-5592-96b6-bdb3-7eb90df9b819	8340	Črnomelj
00050000-5592-96b6-f9a3-6df02d9f228c	6271	Dekani
00050000-5592-96b6-437a-bbd436636e05	5210	Deskle
00050000-5592-96b6-f375-fc0433f944c4	2253	Destrnik
00050000-5592-96b6-ac07-b93dcb357689	6215	Divača
00050000-5592-96b6-5834-2d4a64688f20	1233	Dob
00050000-5592-96b6-3a4f-67434ecc7fd0	3224	Dobje pri Planini
00050000-5592-96b6-da35-95af8d2913dc	8257	Dobova
00050000-5592-96b6-0eda-7d7f2b2c3eec	1423	Dobovec
00050000-5592-96b6-7a57-3bcd44ec22d7	5263	Dobravlje
00050000-5592-96b6-2b50-3996f3eccbd2	3204	Dobrna
00050000-5592-96b6-39f9-4806ed5552e2	8211	Dobrnič
00050000-5592-96b6-49d5-9e7d5bbfa1a7	1356	Dobrova
00050000-5592-96b6-a231-35ca00149ffb	9223	Dobrovnik/Dobronak 
00050000-5592-96b6-e907-06ba5bb2cdde	5212	Dobrovo v Brdih
00050000-5592-96b6-9586-8129dc9dda33	1431	Dol pri Hrastniku
00050000-5592-96b6-60be-0c0340475f5b	1262	Dol pri Ljubljani
00050000-5592-96b6-006c-c958d7362c3a	1273	Dole pri Litiji
00050000-5592-96b6-6450-336ff9f8cf25	1331	Dolenja vas
00050000-5592-96b6-c373-b91cf016b815	8350	Dolenjske Toplice
00050000-5592-96b6-a72e-8a3df5bd4ce9	1230	Domžale
00050000-5592-96b6-2116-d50c9f174498	2252	Dornava
00050000-5592-96b6-c6e8-3172cecba61b	5294	Dornberk
00050000-5592-96b6-f511-d1e199549180	1319	Draga
00050000-5592-96b6-1ab1-855b0fc32e25	8343	Dragatuš
00050000-5592-96b6-45b6-add3461543a4	3222	Dramlje
00050000-5592-96b6-dd68-894291969d39	2370	Dravograd
00050000-5592-96b6-7fe9-4d410bb9bc07	4203	Duplje
00050000-5592-96b6-a39c-3e042935f4da	6221	Dutovlje
00050000-5592-96b6-d796-4a386954c202	8361	Dvor
00050000-5592-96b6-0bc3-3ee2b98d81e7	2343	Fala
00050000-5592-96b6-eeac-100918211d42	9208	Fokovci
00050000-5592-96b6-fdf9-8152857a7322	2313	Fram
00050000-5592-96b6-cd5c-7d55b19497b3	3213	Frankolovo
00050000-5592-96b6-6527-036496c00e26	1274	Gabrovka
00050000-5592-96b6-fe7e-e9f3eee56b09	8254	Globoko
00050000-5592-96b6-8062-5191ee0b4217	5275	Godovič
00050000-5592-96b6-36c7-3e90258be919	4204	Golnik
00050000-5592-96b6-2b80-86b657b0529e	3303	Gomilsko
00050000-5592-96b6-14e3-4e47a9d26caf	4224	Gorenja vas
00050000-5592-96b6-dd34-c6de9bdc0d8b	3263	Gorica pri Slivnici
00050000-5592-96b6-1484-908d143c98d3	2272	Gorišnica
00050000-5592-96b6-5dfd-b24de2af2c3e	9250	Gornja Radgona
00050000-5592-96b6-f7c9-20ebd475f5ad	3342	Gornji Grad
00050000-5592-96b6-0bd0-5055ca40ecfd	4282	Gozd Martuljek
00050000-5592-96b6-10d3-d8fb7c776e5f	6272	Gračišče
00050000-5592-96b6-92b9-d6aeb910b8d7	9264	Grad
00050000-5592-96b6-946c-56a1626b810a	8332	Gradac
00050000-5592-96b6-4c9e-a16daf2caee4	1384	Grahovo
00050000-5592-96b6-c18e-1552b8411954	5242	Grahovo ob Bači
00050000-5592-96b6-0e1e-c8ad84381ca5	5251	Grgar
00050000-5592-96b6-bf03-def9d5af8da7	3302	Griže
00050000-5592-96b6-1f2a-20bedb4d5d58	3231	Grobelno
00050000-5592-96b6-0117-b6cac9c971cf	1290	Grosuplje
00050000-5592-96b6-b65f-8476ed9f04c4	2288	Hajdina
00050000-5592-96b6-d1bd-a30683fa97c4	8362	Hinje
00050000-5592-96b6-a2ba-7296ee6ac226	2311	Hoče
00050000-5592-96b6-18ae-c6c6d68974e1	9205	Hodoš/Hodos
00050000-5592-96b6-6a0d-d10dbc035e2e	1354	Horjul
00050000-5592-96b6-7ed5-cc83a47aca99	1372	Hotedršica
00050000-5592-96b6-4211-a138d9f09d80	1430	Hrastnik
00050000-5592-96b6-5e96-55584579243c	6225	Hruševje
00050000-5592-96b6-c7bf-24c9552fe9d2	4276	Hrušica
00050000-5592-96b6-1047-2f570724a1c1	5280	Idrija
00050000-5592-96b6-ad08-7618f005ed62	1292	Ig
00050000-5592-96b6-f08b-b9d67e3939db	6250	Ilirska Bistrica
00050000-5592-96b6-6bbb-b1b47ceda8e2	6251	Ilirska Bistrica-Trnovo
00050000-5592-96b6-f443-c901973ab7e5	1295	Ivančna Gorica
00050000-5592-96b6-ba19-1503265358bc	2259	Ivanjkovci
00050000-5592-96b6-e585-0e28759ec588	1411	Izlake
00050000-5592-96b6-b628-9cc6f8915ba4	6310	Izola/Isola
00050000-5592-96b6-10a3-e62e5c3d39f9	2222	Jakobski Dol
00050000-5592-96b6-b44d-f1eea7371df4	2221	Jarenina
00050000-5592-96b6-9323-cb8cfca8cf62	6254	Jelšane
00050000-5592-96b6-1c01-82b1e1dee723	4270	Jesenice
00050000-5592-96b6-8321-1f3b257263ad	8261	Jesenice na Dolenjskem
00050000-5592-96b6-54fa-6f5255cfa831	3273	Jurklošter
00050000-5592-96b6-b3f5-af544ea3881a	2223	Jurovski Dol
00050000-5592-96b6-2ab5-ec51803830a5	2256	Juršinci
00050000-5592-96b6-fea2-9abce502a9a4	5214	Kal nad Kanalom
00050000-5592-96b6-c95b-eff29552bde6	3233	Kalobje
00050000-5592-96b6-7d58-6c82a13785be	4246	Kamna Gorica
00050000-5592-96b6-8ab4-df0531b11ade	2351	Kamnica
00050000-5592-96b6-f0c0-4bb1bd7c62d2	1241	Kamnik
00050000-5592-96b6-2d67-1d072248ffde	5213	Kanal
00050000-5592-96b6-a8d9-eef3bc9a3bb7	8258	Kapele
00050000-5592-96b6-fc6a-da21e8b31082	2362	Kapla
00050000-5592-96b6-7c99-c8e8392d56ae	2325	Kidričevo
00050000-5592-96b6-c4cc-dfe386e5d157	1412	Kisovec
00050000-5592-96b6-0de9-622f273e39fb	6253	Knežak
00050000-5592-96b6-4425-771b3ce76983	5222	Kobarid
00050000-5592-96b6-6e98-0a63934374e4	9227	Kobilje
00050000-5592-96b6-8218-a1630505630e	1330	Kočevje
00050000-5592-96b6-0e0f-6ff10bed0720	1338	Kočevska Reka
00050000-5592-96b6-dd8c-0618d0b13212	2276	Kog
00050000-5592-96b6-88df-02ed191173c1	5211	Kojsko
00050000-5592-96b6-8b72-8c3d3adff5d2	6223	Komen
00050000-5592-96b6-49b7-fcbae5b3d6b4	1218	Komenda
00050000-5592-96b6-abc1-4a19936a463e	6000	Koper/Capodistria 
00050000-5592-96b6-17ab-4a86e1ea158e	6001	Koper/Capodistria - poštni predali
00050000-5592-96b6-086e-36ed6e28e2ad	8282	Koprivnica
00050000-5592-96b6-6e9b-f853860f2125	5296	Kostanjevica na Krasu
00050000-5592-96b6-2d13-fcdb226ddbd9	8311	Kostanjevica na Krki
00050000-5592-96b6-d5cf-e51b470455ac	1336	Kostel
00050000-5592-96b6-e68c-4ce1fc948e21	6256	Košana
00050000-5592-96b6-f15d-5b7ba15b1a2b	2394	Kotlje
00050000-5592-96b6-2e76-aa13cb669ac4	6240	Kozina
00050000-5592-96b6-b7bc-c7b2718a58b5	3260	Kozje
00050000-5592-96b6-12a2-68907df77a9e	4000	Kranj 
00050000-5592-96b6-8037-2ef234256868	4001	Kranj - poštni predali
00050000-5592-96b6-d46b-05594df5d281	4280	Kranjska Gora
00050000-5592-96b6-fb89-429bccbb8606	1281	Kresnice
00050000-5592-96b6-d91e-b0bedef5a888	4294	Križe
00050000-5592-96b6-1080-f19be8437b3c	9206	Križevci
00050000-5592-96b6-f763-9e75cb17c953	9242	Križevci pri Ljutomeru
00050000-5592-96b6-e1b6-9c6a1a579146	1301	Krka
00050000-5592-96b6-65d5-5d2f089eb84b	8296	Krmelj
00050000-5592-96b6-1c3f-024602616ed0	4245	Kropa
00050000-5592-96b6-4441-0e604689ebc2	8262	Krška vas
00050000-5592-96b6-d9f2-4abb658ab62b	8270	Krško
00050000-5592-96b6-e2be-fde5628a22a4	9263	Kuzma
00050000-5592-96b6-795e-75dce5595026	2318	Laporje
00050000-5592-96b6-e69b-07e8ecbc493c	3270	Laško
00050000-5592-96b6-b90d-28a40d3a71bc	1219	Laze v Tuhinju
00050000-5592-96b6-76cf-884af2121ee4	2230	Lenart v Slovenskih goricah
00050000-5592-96b6-6f29-b3b5e00ddc53	9220	Lendava/Lendva
00050000-5592-96b6-fdd3-21a492807af7	4248	Lesce
00050000-5592-96b6-f6ba-d4d737025ffd	3261	Lesično
00050000-5592-96b6-e3e8-7147aad7f72d	8273	Leskovec pri Krškem
00050000-5592-96b6-8c1b-ec9d078b85e3	2372	Libeliče
00050000-5592-96b6-e69a-c6b0ee309da3	2341	Limbuš
00050000-5592-96b6-4e78-b64f24c0eb2c	1270	Litija
00050000-5592-96b6-2d23-97cad802c1d7	3202	Ljubečna
00050000-5592-96b6-4aaa-3e711a7ab548	1000	Ljubljana 
00050000-5592-96b6-5da6-40b454e20608	1001	Ljubljana - poštni predali
00050000-5592-96b6-219c-e1c23306a8a8	1231	Ljubljana - Črnuče
00050000-5592-96b6-f0e4-ebf8a526a52a	1261	Ljubljana - Dobrunje
00050000-5592-96b6-cf85-efd5ba7e4077	1260	Ljubljana - Polje
00050000-5592-96b6-fc9d-19d997653a60	1210	Ljubljana - Šentvid
00050000-5592-96b6-9aee-81b55869135d	1211	Ljubljana - Šmartno
00050000-5592-96b6-7350-e7be0ee383a6	3333	Ljubno ob Savinji
00050000-5592-96b6-a850-2eb4e005b46b	9240	Ljutomer
00050000-5592-96b6-506c-93d5aff5bec6	3215	Loče
00050000-5592-96b6-abff-382ccf03032d	5231	Log pod Mangartom
00050000-5592-96b6-c5b4-ba23a1025c00	1358	Log pri Brezovici
00050000-5592-96b6-24fe-46f6e38dcb38	1370	Logatec
00050000-5592-96b6-8e9e-5029d0ef4ed1	1371	Logatec
00050000-5592-96b6-0744-952d1afc8caf	1434	Loka pri Zidanem Mostu
00050000-5592-96b6-5044-7217659dafce	3223	Loka pri Žusmu
00050000-5592-96b6-55c8-cc1535ef5d42	6219	Lokev
00050000-5592-96b6-30c7-027871b79805	1318	Loški Potok
00050000-5592-96b6-f7ad-19ad5b909902	2324	Lovrenc na Dravskem polju
00050000-5592-96b6-f73d-81a2ccd1f6b9	2344	Lovrenc na Pohorju
00050000-5592-96b6-38ed-a8bb30b10dce	3334	Luče
00050000-5592-96b6-a438-8511152aa8ea	1225	Lukovica
00050000-5592-96b6-e3c7-3117064bde4c	9202	Mačkovci
00050000-5592-96b6-2fc7-00c2b0ee6502	2322	Majšperk
00050000-5592-96b6-2164-cd0ebbd305b7	2321	Makole
00050000-5592-96b6-fd55-47258a6fc718	9243	Mala Nedelja
00050000-5592-96b6-de0c-65d142600d7c	2229	Malečnik
00050000-5592-96b6-57af-4a1b647680a0	6273	Marezige
00050000-5592-96b6-a1fb-48383f83ba39	2000	Maribor 
00050000-5592-96b6-db23-b35b77a09ff2	2001	Maribor - poštni predali
00050000-5592-96b6-a5ba-2398f41a5452	2206	Marjeta na Dravskem polju
00050000-5592-96b6-1077-ce4527221e13	2281	Markovci
00050000-5592-96b6-19bb-22f50239a007	9221	Martjanci
00050000-5592-96b6-fb66-f354d8fcf355	6242	Materija
00050000-5592-96b6-220d-bddb8e925871	4211	Mavčiče
00050000-5592-96b6-e0f2-5a942de39b04	1215	Medvode
00050000-5592-96b6-d894-b3faba2f6ee9	1234	Mengeš
00050000-5592-96b6-3f5a-c1cb6f4fb529	8330	Metlika
00050000-5592-96b6-062d-54d3a36ddb9c	2392	Mežica
00050000-5592-96b6-915d-ec7e6f45edf8	2204	Miklavž na Dravskem polju
00050000-5592-96b6-95ce-1a78a1ebb958	2275	Miklavž pri Ormožu
00050000-5592-96b6-6d5e-db1a62668e2d	5291	Miren
00050000-5592-96b6-7ab8-6c2428313c13	8233	Mirna
00050000-5592-96b6-e457-5ddd4f5de5ee	8216	Mirna Peč
00050000-5592-96b6-b8d1-667b1223e301	2382	Mislinja
00050000-5592-96b6-9f79-f2e075cc6d08	4281	Mojstrana
00050000-5592-96b6-c5cc-02356f31c7e0	8230	Mokronog
00050000-5592-96b6-5bb6-a76075650f57	1251	Moravče
00050000-5592-96b6-f3d9-f4a221a77c52	9226	Moravske Toplice
00050000-5592-96b6-6f54-b546ad279b20	5216	Most na Soči
00050000-5592-96b6-df26-af9664d332ae	1221	Motnik
00050000-5592-96b6-4937-3dea36684ee2	3330	Mozirje
00050000-5592-96b6-0092-e0e69d348116	9000	Murska Sobota 
00050000-5592-96b6-822e-9c4f56a0bd87	9001	Murska Sobota - poštni predali
00050000-5592-96b6-ac73-68b5c454fed5	2366	Muta
00050000-5592-96b6-f761-1ceb5998fdc2	4202	Naklo
00050000-5592-96b6-0a2d-a6ecf7f483ff	3331	Nazarje
00050000-5592-96b6-d3a6-103622b7c302	1357	Notranje Gorice
00050000-5592-96b6-7c2c-2d47f998b7e2	3203	Nova Cerkev
00050000-5592-96b6-e1bd-7537e8a24559	5000	Nova Gorica 
00050000-5592-96b6-3c37-9ca3f0bf9a91	5001	Nova Gorica - poštni predali
00050000-5592-96b6-fe10-91272362e20d	1385	Nova vas
00050000-5592-96b6-41d5-c836be68c9f8	8000	Novo mesto
00050000-5592-96b6-00b0-15a94a64c6f6	8001	Novo mesto - poštni predali
00050000-5592-96b6-06ea-eac1759851a3	6243	Obrov
00050000-5592-96b6-c391-1e7fdd0d3a67	9233	Odranci
00050000-5592-96b6-a371-fb958dc4504d	2317	Oplotnica
00050000-5592-96b6-03cd-37b464ab642f	2312	Orehova vas
00050000-5592-96b6-fe38-4da2155b9f11	2270	Ormož
00050000-5592-96b6-d4d8-30bae64d8f7d	1316	Ortnek
00050000-5592-96b6-1f4d-4da73e2d7f60	1337	Osilnica
00050000-5592-96b6-bd46-8e22a585a365	8222	Otočec
00050000-5592-96b6-844f-255d504375bb	2361	Ožbalt
00050000-5592-96b6-f69a-ac626b2aba73	2231	Pernica
00050000-5592-96b6-cb0d-259068711c93	2211	Pesnica pri Mariboru
00050000-5592-96b6-fce4-c6d07be00499	9203	Petrovci
00050000-5592-96b6-bca1-6d590bdf0a8a	3301	Petrovče
00050000-5592-96b6-52b1-d73463091d96	6330	Piran/Pirano
00050000-5592-96b6-3d1a-1f6a02cd8e5d	8255	Pišece
00050000-5592-96b6-2c9e-6d557dfe8232	6257	Pivka
00050000-5592-96b6-6b6e-0c31220a9796	6232	Planina
00050000-5592-96b6-ad64-6befa37bdbcb	3225	Planina pri Sevnici
00050000-5592-96b6-9fa7-2efe9ab40bc8	6276	Pobegi
00050000-5592-96b6-abe2-dd0fac5615e2	8312	Podbočje
00050000-5592-96b6-06ae-88ab7531422f	5243	Podbrdo
00050000-5592-96b6-1b1d-3ecec578692e	3254	Podčetrtek
00050000-5592-96b6-8fe1-8b5647845805	2273	Podgorci
00050000-5592-96b6-e984-b4b4c6729cc5	6216	Podgorje
00050000-5592-96b6-c13e-8743f03b8547	2381	Podgorje pri Slovenj Gradcu
00050000-5592-96b6-3d01-d582f574c066	6244	Podgrad
00050000-5592-96b6-77c3-cc66d4bd8d93	1414	Podkum
00050000-5592-96b6-51d0-97e3f0b1638f	2286	Podlehnik
00050000-5592-96b6-2e38-b6bdc2af6cce	5272	Podnanos
00050000-5592-96b6-0454-1903e571a857	4244	Podnart
00050000-5592-96b6-ef21-b77c7f877a39	3241	Podplat
00050000-5592-96b6-bca5-bdeb9c520ec4	3257	Podsreda
00050000-5592-96b6-ff72-c4326cb13095	2363	Podvelka
00050000-5592-96b6-7589-70e5b3419ddc	2208	Pohorje
00050000-5592-96b6-a92c-7383588ec614	2257	Polenšak
00050000-5592-96b6-2a3a-bc0844fb83bb	1355	Polhov Gradec
00050000-5592-96b6-e4db-356aa39a0856	4223	Poljane nad Škofjo Loko
00050000-5592-96b6-8922-443f2f55217d	2319	Poljčane
00050000-5592-96b6-7f9e-e1d6faa9e16c	1272	Polšnik
00050000-5592-96b6-5e0b-8c44114a6084	3313	Polzela
00050000-5592-96b6-9dfc-4f6ba3c85cd7	3232	Ponikva
00050000-5592-96b6-d997-23d58454b36f	6320	Portorož/Portorose
00050000-5592-96b6-aa7b-80782915eddf	6230	Postojna
00050000-5592-96b6-38c8-9a145b332e68	2331	Pragersko
00050000-5592-96b6-9590-f412b658fa88	3312	Prebold
00050000-5592-96b6-3b30-aabe44409569	4205	Preddvor
00050000-5592-96b6-97a3-b6cfdb16d41b	6255	Prem
00050000-5592-96b6-002c-afbbade941d1	1352	Preserje
00050000-5592-96b6-b76d-496423d1ef5b	6258	Prestranek
00050000-5592-96b6-4e64-90852ea58885	2391	Prevalje
00050000-5592-96b6-f143-8950b4fd31a9	3262	Prevorje
00050000-5592-96b6-ff13-feb2d60404c4	1276	Primskovo 
00050000-5592-96b6-da41-657c9a27d390	3253	Pristava pri Mestinju
00050000-5592-96b6-aebd-6c4390cb78f5	9207	Prosenjakovci/Partosfalva
00050000-5592-96b6-4ca8-8a02bb7a9960	5297	Prvačina
00050000-5592-96b6-a881-70109d776d2f	2250	Ptuj
00050000-5592-96b6-bd62-0c9f863b7949	2323	Ptujska Gora
00050000-5592-96b6-9785-f537c19ae1f1	9201	Puconci
00050000-5592-96b6-6580-bda482fbabd1	2327	Rače
00050000-5592-96b6-95f0-e5c5a3613264	1433	Radeče
00050000-5592-96b6-69bd-ddbd83c585fc	9252	Radenci
00050000-5592-96b6-8f2a-66d3cabca821	2360	Radlje ob Dravi
00050000-5592-96b6-1a7b-8b8a9df40a3c	1235	Radomlje
00050000-5592-96b6-7750-a50e3d76156d	4240	Radovljica
00050000-5592-96b6-359a-606275fb3648	8274	Raka
00050000-5592-96b6-cf43-ea83c2e31608	1381	Rakek
00050000-5592-96b6-d3c5-04f978505237	4283	Rateče - Planica
00050000-5592-96b6-abbc-70f8ba62c285	2390	Ravne na Koroškem
00050000-5592-96b6-23cd-7c3926479d56	9246	Razkrižje
00050000-5592-96b6-b8f6-2983883160fb	3332	Rečica ob Savinji
00050000-5592-96b6-eea8-82a828ffcda5	5292	Renče
00050000-5592-96b6-3081-b479d8bee4df	1310	Ribnica
00050000-5592-96b6-913f-ed3d68715c92	2364	Ribnica na Pohorju
00050000-5592-96b6-1cc4-86b37f8738f9	3272	Rimske Toplice
00050000-5592-96b6-9d5d-de02950cc411	1314	Rob
00050000-5592-96b6-9b2e-2cf796bc0b79	5215	Ročinj
00050000-5592-96b6-9bf9-e56b87757c2a	3250	Rogaška Slatina
00050000-5592-96b6-b933-a551974557f4	9262	Rogašovci
00050000-5592-96b6-0635-413b84972e3d	3252	Rogatec
00050000-5592-96b6-b3bc-d7f5017e3192	1373	Rovte
00050000-5592-96b6-2251-234f24c09752	2342	Ruše
00050000-5592-96b6-43db-59926cd2cd30	1282	Sava
00050000-5592-96b6-95e9-251d37d08458	6333	Sečovlje/Sicciole
00050000-5592-96b6-1a01-8c0725e1af17	4227	Selca
00050000-5592-96b6-45f1-78da116bfd9f	2352	Selnica ob Dravi
00050000-5592-96b6-984a-77a84f2e57ea	8333	Semič
00050000-5592-96b6-f217-7ce341781617	8281	Senovo
00050000-5592-96b6-91dd-bbea3646a6bb	6224	Senožeče
00050000-5592-96b6-4013-0a99459d17b8	8290	Sevnica
00050000-5592-96b6-48d5-9f2472cf3c55	6210	Sežana
00050000-5592-96b6-efa5-0b475b0d2c59	2214	Sladki Vrh
00050000-5592-96b6-e356-d7f63d95b3d9	5283	Slap ob Idrijci
00050000-5592-96b6-beb5-7228b4a6660d	2380	Slovenj Gradec
00050000-5592-96b6-a2d8-c0ca18f28ef5	2310	Slovenska Bistrica
00050000-5592-96b6-a4da-cf490d5a3fdc	3210	Slovenske Konjice
00050000-5592-96b6-174b-19b410ff4f51	1216	Smlednik
00050000-5592-96b6-d5af-c899c9224c8e	5232	Soča
00050000-5592-96b6-e2e4-406eb9223630	1317	Sodražica
00050000-5592-96b6-7e0b-d40134fb445a	3335	Solčava
00050000-5592-96b6-f16b-db704530fe2f	5250	Solkan
00050000-5592-96b6-6901-bfbf5fdcecec	4229	Sorica
00050000-5592-96b6-0aae-552fc89d1a1b	4225	Sovodenj
00050000-5592-96b6-c8fa-7ae527747ecb	5281	Spodnja Idrija
00050000-5592-96b6-801d-3445ab0e43d9	2241	Spodnji Duplek
00050000-5592-96b6-ef70-d9b5c140c9ea	9245	Spodnji Ivanjci
00050000-5592-96b6-aaf3-efbb78570052	2277	Središče ob Dravi
00050000-5592-96b6-dfb4-801ec2c1169a	4267	Srednja vas v Bohinju
00050000-5592-96b6-3fb0-83510156980e	8256	Sromlje 
00050000-5592-96b6-1564-5d494ed1f8d7	5224	Srpenica
00050000-5592-96b6-4ca5-11c15e55bf01	1242	Stahovica
00050000-5592-96b6-c09d-54ab4257fc60	1332	Stara Cerkev
00050000-5592-96b6-a4f0-4f43a93963c2	8342	Stari trg ob Kolpi
00050000-5592-96b6-9f59-7ae36c5d645c	1386	Stari trg pri Ložu
00050000-5592-96b6-1c9d-95d17fdc808c	2205	Starše
00050000-5592-96b6-dfe9-42611f9f503e	2289	Stoperce
00050000-5592-96b6-e5f3-6bfa98bca61c	8322	Stopiče
00050000-5592-96b6-7626-44799913bed1	3206	Stranice
00050000-5592-96b6-6f0f-41905615a5e8	8351	Straža
00050000-5592-96b6-c38d-f6c7f722e267	1313	Struge
00050000-5592-96b6-c9d3-ef62de4bcbd0	8293	Studenec
00050000-5592-96b6-1f36-9c0293e585ee	8331	Suhor
00050000-5592-96b6-7503-94d04361f75e	2233	Sv. Ana v Slovenskih goricah
00050000-5592-96b6-af95-5378df8aaf7d	2235	Sv. Trojica v Slovenskih goricah
00050000-5592-96b6-2f9b-413aef543022	2353	Sveti Duh na Ostrem Vrhu
00050000-5592-96b6-7ef7-b9e17c90f5ab	9244	Sveti Jurij ob Ščavnici
00050000-5592-96b6-20e0-b7729640f440	3264	Sveti Štefan
00050000-5592-96b6-15b3-0e4e40fdab6d	2258	Sveti Tomaž
00050000-5592-96b6-1bb2-8aaff7b9e12b	9204	Šalovci
00050000-5592-96b6-6db8-67c5c4339b38	5261	Šempas
00050000-5592-96b6-b380-1eac18097fdf	5290	Šempeter pri Gorici
00050000-5592-96b6-1d35-20b7fed31712	3311	Šempeter v Savinjski dolini
00050000-5592-96b6-b710-29e577ff054d	4208	Šenčur
00050000-5592-96b6-044c-95c88322ba52	2212	Šentilj v Slovenskih goricah
00050000-5592-96b6-4d4e-67256f72b1cb	8297	Šentjanž
00050000-5592-96b6-8663-0e493fae345b	2373	Šentjanž pri Dravogradu
00050000-5592-96b6-c2ef-d8aeffb18eb4	8310	Šentjernej
00050000-5592-96b6-b839-f7fe58413508	3230	Šentjur
00050000-5592-96b6-2219-6850f4a874ab	3271	Šentrupert
00050000-5592-96b6-0692-d4407ee083cf	8232	Šentrupert
00050000-5592-96b6-a806-9f0c0425b7cd	1296	Šentvid pri Stični
00050000-5592-96b6-cd26-c7276be08dfa	8275	Škocjan
00050000-5592-96b6-bc0f-28d60ca97bca	6281	Škofije
00050000-5592-96b6-76c2-bef38cbf2c1b	4220	Škofja Loka
00050000-5592-96b6-8103-5fa0d0531532	3211	Škofja vas
00050000-5592-96b6-57ac-5e77c9aea4a5	1291	Škofljica
00050000-5592-96b6-c016-bc4c80ba3de1	6274	Šmarje
00050000-5592-96b6-9951-8e8b921ce7a4	1293	Šmarje - Sap
00050000-5592-96b6-136c-1882a112ed07	3240	Šmarje pri Jelšah
00050000-5592-96b6-474c-09ad38227130	8220	Šmarješke Toplice
00050000-5592-96b6-1259-ede77df23137	2315	Šmartno na Pohorju
00050000-5592-96b6-a95d-53b8ce2ead05	3341	Šmartno ob Dreti
00050000-5592-96b6-5f8e-317299e7cb30	3327	Šmartno ob Paki
00050000-5592-96b6-7f17-9772f5ee4435	1275	Šmartno pri Litiji
00050000-5592-96b6-3c70-94e874e8f96d	2383	Šmartno pri Slovenj Gradcu
00050000-5592-96b6-c170-6aec31e3b80a	3201	Šmartno v Rožni dolini
00050000-5592-96b6-0b2f-376f74ea3a42	3325	Šoštanj
00050000-5592-96b6-552c-5468f25852d4	6222	Štanjel
00050000-5592-96b6-f2b9-f34e8918ac36	3220	Štore
00050000-5592-96b6-1d46-bc57776a6048	3304	Tabor
00050000-5592-96b6-d78c-12fa4b5931a5	3221	Teharje
00050000-5592-96b6-f4b7-eedfe0ccde3f	9251	Tišina
00050000-5592-96b6-a0e3-e83955a809c0	5220	Tolmin
00050000-5592-96b6-60cb-9f3251d80904	3326	Topolšica
00050000-5592-96b6-e562-750c80e0e0a7	2371	Trbonje
00050000-5592-96b6-92cc-fe91497296e6	1420	Trbovlje
00050000-5592-96b6-79d6-77e46c31a61d	8231	Trebelno 
00050000-5592-96b6-ff89-3b6d89d18f9f	8210	Trebnje
00050000-5592-96b6-e702-8429a5f974ce	5252	Trnovo pri Gorici
00050000-5592-96b6-c4a7-0525eb557532	2254	Trnovska vas
00050000-5592-96b6-fe68-a375b5b40ead	1222	Trojane
00050000-5592-96b6-f3d3-bdcdfc81f560	1236	Trzin
00050000-5592-96b6-3000-db64d1caeb83	4290	Tržič
00050000-5592-96b6-0daa-08e7ccd5302c	8295	Tržišče
00050000-5592-96b6-b7dd-dd71f53df484	1311	Turjak
00050000-5592-96b6-61bf-ad4d60b737c3	9224	Turnišče
00050000-5592-96b6-2529-d37b1e336637	8323	Uršna sela
00050000-5592-96b6-1049-0655209194d3	1252	Vače
00050000-5592-96b6-826e-5dcaccc97f2b	3320	Velenje 
00050000-5592-96b6-111c-2f8dc46c0321	3322	Velenje - poštni predali
00050000-5592-96b6-4f66-cd681ce2aa5d	8212	Velika Loka
00050000-5592-96b6-143b-57412bc4e58c	2274	Velika Nedelja
00050000-5592-96b6-a289-2276b0f263a1	9225	Velika Polana
00050000-5592-96b6-8899-023594f5429e	1315	Velike Lašče
00050000-5592-96b6-c3d2-11de1087b70d	8213	Veliki Gaber
00050000-5592-96b6-b131-d331903afcef	9241	Veržej
00050000-5592-96b6-5929-d61568e125bc	1312	Videm - Dobrepolje
00050000-5592-96b6-5e38-70589dd678d8	2284	Videm pri Ptuju
00050000-5592-96b6-e56b-0a1f51e65e4e	8344	Vinica
00050000-5592-96b6-d0fe-87bf2eee2c9b	5271	Vipava
00050000-5592-96b6-8e76-5a606db7a625	4212	Visoko
00050000-5592-96b6-f5ef-370ab20dadb4	1294	Višnja Gora
00050000-5592-96b6-cf77-4bfde1c3d548	3205	Vitanje
00050000-5592-96b6-78c4-08b554cbd60c	2255	Vitomarci
00050000-5592-96b6-61f7-108a9879bdfc	1217	Vodice
00050000-5592-96b6-8922-45e92c2db555	3212	Vojnik\t
00050000-5592-96b6-4cf0-ac4acda57321	5293	Volčja Draga
00050000-5592-96b6-f289-355481902437	2232	Voličina
00050000-5592-96b6-5b26-678bcd3dcbf2	3305	Vransko
00050000-5592-96b6-66de-72f5bf5b8dd1	6217	Vremski Britof
00050000-5592-96b6-87cc-f65546686d7d	1360	Vrhnika
00050000-5592-96b6-a5c1-046085cb50f9	2365	Vuhred
00050000-5592-96b6-c655-c118dd7ac280	2367	Vuzenica
00050000-5592-96b6-6308-d15a7cf3743a	8292	Zabukovje 
00050000-5592-96b6-902d-9509235a55ea	1410	Zagorje ob Savi
00050000-5592-96b6-7443-4f4c21fa3f13	1303	Zagradec
00050000-5592-96b6-68e6-e1848c664362	2283	Zavrč
00050000-5592-96b6-fb3e-f2798801533f	8272	Zdole 
00050000-5592-96b6-c301-eeacb215fd9f	4201	Zgornja Besnica
00050000-5592-96b6-5b1a-a78520667486	2242	Zgornja Korena
00050000-5592-96b6-9bc6-4b4ccdf54e57	2201	Zgornja Kungota
00050000-5592-96b6-e779-49b719778f3a	2316	Zgornja Ložnica
00050000-5592-96b6-1abb-38bba9880670	2314	Zgornja Polskava
00050000-5592-96b6-6b52-fe08ef41ebd4	2213	Zgornja Velka
00050000-5592-96b6-3da8-becaa170f4c9	4247	Zgornje Gorje
00050000-5592-96b6-7076-1da39b2dac46	4206	Zgornje Jezersko
00050000-5592-96b6-4841-fc0628286425	2285	Zgornji Leskovec
00050000-5592-96b6-7a6b-d40bce5eaeee	1432	Zidani Most
00050000-5592-96b6-fc16-7f61ab73d79c	3214	Zreče
00050000-5592-96b6-afdd-df6124b2d3e5	4209	Žabnica
00050000-5592-96b6-551a-dc68fe82f5fd	3310	Žalec
00050000-5592-96b6-327a-cc29d358d6cf	4228	Železniki
00050000-5592-96b6-2597-da84c53ca370	2287	Žetale
00050000-5592-96b6-a96c-5835c0985ccf	4226	Žiri
00050000-5592-96b6-6ded-826a8ec616ff	4274	Žirovnica
00050000-5592-96b6-0520-48707f00c2f7	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8577309)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8577120)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8577198)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8577321)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8577441)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8577490)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5592-96b7-0a5a-9c5fd5d1fa7d	00080000-5592-96b7-13a2-8cab3144408a	0900	AK
00190000-5592-96b7-afa2-d3dbc973759f	00080000-5592-96b7-6799-739fe830ff6a	0987	A
00190000-5592-96b7-0c36-b5ec987578a1	00080000-5592-96b7-87fa-89aa7b1641cb	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8577624)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8577350)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5592-96b7-d4bf-eb5f3b769424	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5592-96b7-a485-2c308dca76ac	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5592-96b7-b02b-7cdb65489845	0003	Kazinska	t	84	Kazinska dvorana
00220000-5592-96b7-f5d7-820b18f174d2	0004	Mali oder	t	24	Mali oder 
00220000-5592-96b7-d54c-bbb191652461	0005	Komorni oder	t	15	Komorni oder
00220000-5592-96b7-2532-995d9785b95b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5592-96b7-2f51-9af8f2edb49c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8577294)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8577284)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8577479)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8577418)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8576992)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2884 (class 0 OID 8577360)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8577030)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5592-96b5-3db2-c16f98b81bbe	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5592-96b5-358b-ee4024e1593f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5592-96b5-ccc8-e91968f02836	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5592-96b5-89ec-4628fca6acf6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5592-96b5-0763-00b3ba4a2577	planer	Planer dogodkov v koledarju	t
00020000-5592-96b5-e26e-353c90a695ad	kadrovska	Kadrovska služba	t
00020000-5592-96b5-0466-335b329f1d7c	arhivar	Ažuriranje arhivalij	t
00020000-5592-96b5-9f8e-3b82c664edb4	igralec	Igralec	t
00020000-5592-96b5-d031-5379238d5a58	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5592-96b7-3a26-5c4835148fd8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8577014)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5592-96b5-b8ff-c7c7f62533c8	00020000-5592-96b5-ccc8-e91968f02836
00010000-5592-96b5-a772-61785a370fa6	00020000-5592-96b5-ccc8-e91968f02836
00010000-5592-96b7-5101-265bde8d81aa	00020000-5592-96b7-3a26-5c4835148fd8
\.


--
-- TOC entry 2886 (class 0 OID 8577374)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8577315)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8577265)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8577674)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5592-96b6-1974-d728e493386b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5592-96b6-e201-6b28ca97e815	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5592-96b6-b957-e5f0eb85bf22	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5592-96b6-17d8-b9b48106d788	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5592-96b6-4a13-aa249daa86d9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8577666)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5592-96b6-b741-8f5a63e1e37a	00230000-5592-96b6-17d8-b9b48106d788	popa
00240000-5592-96b6-5bce-adc7734f6344	00230000-5592-96b6-17d8-b9b48106d788	oseba
00240000-5592-96b6-f85d-48208dfe6e46	00230000-5592-96b6-e201-6b28ca97e815	prostor
00240000-5592-96b6-a674-a717572b0dc7	00230000-5592-96b6-17d8-b9b48106d788	besedilo
00240000-5592-96b6-35f4-aba3dbab970a	00230000-5592-96b6-17d8-b9b48106d788	uprizoritev
00240000-5592-96b6-3a25-ff3a7de20468	00230000-5592-96b6-17d8-b9b48106d788	funkcija
00240000-5592-96b6-e2ab-96289630cfce	00230000-5592-96b6-17d8-b9b48106d788	tipfunkcije
00240000-5592-96b6-f92d-fe30c7714d96	00230000-5592-96b6-17d8-b9b48106d788	alternacija
00240000-5592-96b6-520d-ebc050b4d1b1	00230000-5592-96b6-1974-d728e493386b	pogodba
00240000-5592-96b6-167e-85482c991c90	00230000-5592-96b6-17d8-b9b48106d788	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8577661)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8577428)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5592-96b7-9e8d-b604b7a26bc8	000e0000-5592-96b7-88a5-4e6e7ef4e05c	00080000-5592-96b7-9e83-9a8b6209665c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5592-96b7-6076-9b825de40839	000e0000-5592-96b7-88a5-4e6e7ef4e05c	00080000-5592-96b7-9e83-9a8b6209665c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5592-96b7-d68c-2ba2dd3dc2bb	000e0000-5592-96b7-88a5-4e6e7ef4e05c	00080000-5592-96b7-fcdb-0ad9a7141047	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8577092)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8577271)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5592-96b7-ff03-bec3bda0e206	00180000-5592-96b7-f0b8-a5756530a4b1	000c0000-5592-96b7-6a8e-3cbb9e32480b	00090000-5592-96b7-29ad-d9018f9c9320	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-96b7-d467-ed6c99417127	00180000-5592-96b7-f0b8-a5756530a4b1	000c0000-5592-96b7-6d27-7760fede37f5	00090000-5592-96b7-68f2-a09da72bd785	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-96b7-f2fd-2499130dfe1d	00180000-5592-96b7-f0b8-a5756530a4b1	000c0000-5592-96b7-491b-4487d9d754e4	00090000-5592-96b7-3613-887e830b2c34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-96b7-4aa5-8ce91cda76d2	00180000-5592-96b7-f0b8-a5756530a4b1	000c0000-5592-96b7-2b2f-7d62afe0310c	00090000-5592-96b7-7c08-e0822175ed6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-96b7-9816-98da2f77a33f	00180000-5592-96b7-f0b8-a5756530a4b1	000c0000-5592-96b7-d331-d01e84e9baec	00090000-5592-96b7-c2f9-903b078e06fb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-96b7-3b12-69c7f9959651	00180000-5592-96b7-9022-d79059e25110	\N	00090000-5592-96b7-c2f9-903b078e06fb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8577468)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5592-96b6-472e-8c1af3645571	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5592-96b6-153b-0feee9726484	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5592-96b6-cf5f-d9d65fb0da35	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5592-96b6-d0de-8368802e482f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5592-96b6-b201-91299a06dc58	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5592-96b6-b938-f3d40681386f	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5592-96b6-b411-84955ded1be9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5592-96b6-512b-7e7542a221ba	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5592-96b6-187d-543485f732e9	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5592-96b6-09a8-758ffa196473	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5592-96b6-0846-98c9059ec8a0	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5592-96b6-9d8e-271b430d74d7	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5592-96b6-62ed-f1edf29c9aca	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5592-96b6-239a-fa3045777edf	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5592-96b6-9e1a-15b7903f6554	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5592-96b6-4cdb-c285a83ac4fc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8577643)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5592-96b6-3bb2-975d5f86af39	01	Velika predstava	f	1.00	1.00
002b0000-5592-96b6-b6f9-d9a562b46d51	02	Mala predstava	f	0.50	0.50
002b0000-5592-96b6-e3eb-60ac7fe5c404	03	Mala koprodukcija	t	0.40	1.00
002b0000-5592-96b6-63c6-ce4d748c16ae	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5592-96b6-e64f-e414db30fb2b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8577155)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8577001)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5592-96b5-a772-61785a370fa6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBne2IoUwzmJqfUU0UltrLPqlnTkF3ju	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5592-96b7-fc9a-9219f18347eb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5592-96b7-7a82-8440b8dc627f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5592-96b7-6c19-882bed6fa77b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5592-96b7-41c2-9bdd348c4b40	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5592-96b7-de04-034624001cb6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5592-96b7-7759-4ab11a799e4b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5592-96b7-8953-9234481c1e84	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5592-96b7-3f01-6ad7c18816a2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5592-96b7-133e-7ff0a66ddd20	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5592-96b7-5101-265bde8d81aa	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5592-96b5-b8ff-c7c7f62533c8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8577525)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5592-96b7-d29d-0582426bf5cf	00160000-5592-96b7-fa72-3fedfe535c45	00150000-5592-96b6-34d2-24f61424848c	00140000-5592-96b5-6814-7eda434485c7	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5592-96b7-d54c-bbb191652461
000e0000-5592-96b7-88a5-4e6e7ef4e05c	00160000-5592-96b7-1e86-e606807d449c	00150000-5592-96b6-08cc-da2c14ad7a73	00140000-5592-96b5-9621-8938f6c1c257	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5592-96b7-2532-995d9785b95b
000e0000-5592-96b7-a471-0433d0a139f8	\N	00150000-5592-96b6-08cc-da2c14ad7a73	00140000-5592-96b5-9621-8938f6c1c257	00190000-5592-96b7-afa2-d3dbc973759f	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5592-96b7-d54c-bbb191652461
000e0000-5592-96b7-f914-d57ae30162ad	\N	00150000-5592-96b6-08cc-da2c14ad7a73	00140000-5592-96b5-9621-8938f6c1c257	00190000-5592-96b7-afa2-d3dbc973759f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5592-96b7-d54c-bbb191652461
000e0000-5592-96b7-99ba-152a07f9b124	\N	00150000-5592-96b6-08cc-da2c14ad7a73	00140000-5592-96b5-9621-8938f6c1c257	00190000-5592-96b7-afa2-d3dbc973759f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5592-96b7-d4bf-eb5f3b769424
\.


--
-- TOC entry 2867 (class 0 OID 8577217)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5592-96b7-d3d7-7152c38d183f	000e0000-5592-96b7-88a5-4e6e7ef4e05c	1	
00200000-5592-96b7-a10c-7cb2056066ad	000e0000-5592-96b7-88a5-4e6e7ef4e05c	2	
\.


--
-- TOC entry 2882 (class 0 OID 8577342)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8577411)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8577249)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8577515)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5592-96b5-6814-7eda434485c7	01	Drama	drama (SURS 01)
00140000-5592-96b5-88ad-f560b01eab50	02	Opera	opera (SURS 02)
00140000-5592-96b5-a5af-1ad1277c1424	03	Balet	balet (SURS 03)
00140000-5592-96b5-bd98-d204462f5d90	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5592-96b5-3728-6d53d5b49846	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5592-96b5-9621-8938f6c1c257	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5592-96b5-b3e8-33787be65916	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8577401)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5592-96b6-6ca7-85bfc388ef8a	01	Opera	opera
00150000-5592-96b6-a1f0-1235b2931bd8	02	Opereta	opereta
00150000-5592-96b6-c633-0422b8f54d07	03	Balet	balet
00150000-5592-96b6-53ab-eb21722c3018	04	Plesne prireditve	plesne prireditve
00150000-5592-96b6-4681-5cd8aae1771d	05	Lutkovno gledališče	lutkovno gledališče
00150000-5592-96b6-9f39-2ecefe079027	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5592-96b6-8325-4db13a3bb306	07	Biografska drama	biografska drama
00150000-5592-96b6-34d2-24f61424848c	08	Komedija	komedija
00150000-5592-96b6-ea39-7eb3159a67bf	09	Črna komedija	črna komedija
00150000-5592-96b6-5a24-b3d27cda2834	10	E-igra	E-igra
00150000-5592-96b6-08cc-da2c14ad7a73	11	Kriminalka	kriminalka
00150000-5592-96b6-a390-ae713dcb898c	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8577055)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8577572)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8577562)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8577467)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8577239)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8577264)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8577659)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8577181)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8577619)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8577397)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8577215)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8577258)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8577195)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8577307)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8577334)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8577153)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8577064)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2448 (class 2606 OID 8577088)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8577044)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8577029)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8577340)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8577373)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8577510)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8577117)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8577141)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8577313)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8577131)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8577202)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8577325)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8577449)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8577495)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8577641)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 8577357)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8577298)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8577289)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8577489)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8577425)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8577000)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8577364)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8577018)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8577038)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8577382)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8577320)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8577270)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8577683)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8577671)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8577665)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8577438)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8577097)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8577280)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8577478)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8577653)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8577166)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8577013)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8577541)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8577224)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8577348)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8577416)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8577253)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8577523)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8577409)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8577246)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8577439)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8577440)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8577119)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2402 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2403 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2404 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 8577341)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8577327)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8577326)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8577225)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8577398)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8577400)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8577399)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8577197)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8577196)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8577512)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8577513)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8577514)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2416 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2608 (class 1259 OID 8577546)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8577543)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8577547)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8577545)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8577544)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8577168)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8577167)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2407 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 8577091)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8577365)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8577259)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8577045)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8577046)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8577385)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8577384)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8577383)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8577203)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8577205)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8577204)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8577673)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8577293)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8577291)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8577290)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8577292)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8577019)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8577020)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8577349)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8577314)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8577426)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8577427)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8577623)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8577620)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8577621)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8577622)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8577133)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8577132)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8577134)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8577450)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8577451)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8577576)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8577577)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8577574)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8577575)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8577417)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8577302)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8577301)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8577299)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8577300)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8577564)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8577563)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8577642)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8577216)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8577660)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8577066)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8577065)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8577098)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8577099)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8577283)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8577282)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8577281)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2411 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2412 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2498 (class 1259 OID 8577248)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8577244)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8577241)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8577242)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8577240)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8577245)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8577243)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8577118)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8577182)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8577184)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8577183)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8577185)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8577308)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8577511)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8577542)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8577089)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8577090)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8577410)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8577684)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8577154)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8577672)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8577359)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8577358)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8577573)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8577142)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8577524)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8577496)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8577497)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8577039)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8577247)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8577820)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8577805)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8577810)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8577830)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8577800)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8577825)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8577815)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8577975)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8577980)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8577735)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8577915)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8577910)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8577905)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8577795)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8577945)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8577955)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8577950)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8577770)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8577765)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8577895)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8578000)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8578005)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8578010)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8578030)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8578015)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8578035)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8578025)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8578020)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8577760)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8577755)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8577720)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8577715)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8577925)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8577835)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8577695)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8577700)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8577940)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8577935)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8577930)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8577775)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8577785)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8577780)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8578100)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8577870)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8577860)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8577855)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8577865)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8577685)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8577690)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8577920)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8577900)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8577965)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8577970)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8578085)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8578070)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8578075)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8578080)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8577745)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8577740)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8577750)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8577985)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8577990)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8578060)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8578065)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8578050)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8578055)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8577960)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8577890)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8577885)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8577875)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8577880)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8578045)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8578040)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8578090)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8577790)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8577995)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8578095)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8577710)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8577705)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8577725)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8577730)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8577850)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8577845)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8577840)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-30 15:16:40 CEST

--
-- PostgreSQL database dump complete
--

