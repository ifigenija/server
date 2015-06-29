--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 16:43:05 CEST

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
-- TOC entry 183 (class 1259 OID 8444527)
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
-- TOC entry 230 (class 1259 OID 8445045)
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
-- TOC entry 229 (class 1259 OID 8445028)
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
-- TOC entry 222 (class 1259 OID 8444932)
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
-- TOC entry 197 (class 1259 OID 8444706)
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
-- TOC entry 200 (class 1259 OID 8444740)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8445134)
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
-- TOC entry 192 (class 1259 OID 8444649)
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
-- TOC entry 231 (class 1259 OID 8445058)
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
-- TOC entry 216 (class 1259 OID 8444866)
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
-- TOC entry 195 (class 1259 OID 8444686)
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
-- TOC entry 199 (class 1259 OID 8444734)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8444666)
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
-- TOC entry 205 (class 1259 OID 8444783)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8444808)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8444623)
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
-- TOC entry 184 (class 1259 OID 8444536)
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
-- TOC entry 185 (class 1259 OID 8444547)
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
-- TOC entry 180 (class 1259 OID 8444501)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8444520)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8444815)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8444846)
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
-- TOC entry 226 (class 1259 OID 8444978)
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
-- TOC entry 187 (class 1259 OID 8444580)
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
-- TOC entry 189 (class 1259 OID 8444615)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8444789)
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
-- TOC entry 188 (class 1259 OID 8444600)
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
-- TOC entry 194 (class 1259 OID 8444678)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8444801)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8444921)
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
-- TOC entry 225 (class 1259 OID 8444970)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8445104)
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
    stponprem integer,
    stprej integer,
    stgostuj integer,
    stostalihnek integer,
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
-- TOC entry 212 (class 1259 OID 8444830)
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
-- TOC entry 204 (class 1259 OID 8444774)
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
-- TOC entry 203 (class 1259 OID 8444764)
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
-- TOC entry 224 (class 1259 OID 8444959)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8444898)
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
-- TOC entry 177 (class 1259 OID 8444472)
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
-- TOC entry 176 (class 1259 OID 8444470)
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
-- TOC entry 213 (class 1259 OID 8444840)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8444510)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8444494)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8444854)
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
-- TOC entry 207 (class 1259 OID 8444795)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8444745)
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
-- TOC entry 237 (class 1259 OID 8445154)
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
-- TOC entry 236 (class 1259 OID 8445146)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8445141)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8444908)
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
-- TOC entry 186 (class 1259 OID 8444572)
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
-- TOC entry 202 (class 1259 OID 8444751)
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
-- TOC entry 223 (class 1259 OID 8444948)
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
-- TOC entry 233 (class 1259 OID 8445123)
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
-- TOC entry 191 (class 1259 OID 8444635)
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
-- TOC entry 178 (class 1259 OID 8444481)
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
-- TOC entry 228 (class 1259 OID 8445005)
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
-- TOC entry 196 (class 1259 OID 8444697)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8444822)
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
-- TOC entry 218 (class 1259 OID 8444891)
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
-- TOC entry 198 (class 1259 OID 8444729)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8444995)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8444881)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8444475)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8444527)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8445045)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5591-5978-75b6-21b6e30a4b3f	000d0000-5591-5978-db13-5a07a421e01c	\N	00090000-5591-5978-d6ed-d55f868f3f7c	000b0000-5591-5978-c3bf-09fd3d9f76eb	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5978-6c62-ce47c2d86682	000d0000-5591-5978-89f6-ca7923d56656	\N	00090000-5591-5978-d0f5-679c2498daa2	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5978-606a-660d40668c8e	000d0000-5591-5978-2e35-54d962096dff	\N	00090000-5591-5978-33b2-30a45ab539a4	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5978-10c4-d4c2c7720a33	000d0000-5591-5978-59eb-523044b14044	\N	00090000-5591-5978-4c4b-93df40243e82	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5978-7bb1-36eabfa7f98a	000d0000-5591-5978-60ca-2c15ca5a0804	\N	00090000-5591-5978-04bd-08d1438a7569	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-5978-d477-99208fda74f9	000d0000-5591-5978-2065-d0a681f5dd92	\N	00090000-5591-5978-d0f5-679c2498daa2	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8445028)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8444932)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5591-5977-d925-c7be6fd3299b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5591-5977-0b10-2b8a78b1cfab	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5591-5977-8bec-0aabd7fa504c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8444706)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5591-5978-829e-8d147ddb7888	\N	\N	00200000-5591-5978-48e7-5684a5620dc6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5591-5978-b092-125356bd8149	\N	\N	00200000-5591-5978-8bca-15e92e1e6897	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5591-5978-9db7-dcbc6fa3b342	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5591-5978-2a57-3a9465e26217	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5591-5978-8c75-13101852d009	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8444740)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8445134)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8444649)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5591-5975-d276-eabb22d094f1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5591-5975-e709-481942593b79	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5591-5975-c072-f1d10b14410d	AL	ALB	008	Albania 	Albanija	\N
00040000-5591-5975-3805-7044988fbd42	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5591-5975-7161-3d5540f55fb3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5591-5975-88e8-f534454d272f	AD	AND	020	Andorra 	Andora	\N
00040000-5591-5975-1b32-7e3303f5456a	AO	AGO	024	Angola 	Angola	\N
00040000-5591-5975-644d-2479e22f612e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5591-5975-9de0-71c4c803b9b2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5591-5975-529a-cd69f33eb103	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-5975-6804-91b7d48acfa4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5591-5975-66a3-655973effd12	AM	ARM	051	Armenia 	Armenija	\N
00040000-5591-5975-b796-594e5802dec0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5591-5975-12e3-a38736146f37	AU	AUS	036	Australia 	Avstralija	\N
00040000-5591-5975-37ea-203b1612316f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5591-5975-a28a-983b54e8cbfb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5591-5975-eb09-239ab2db2954	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5591-5975-80f7-718d1a550c14	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5591-5975-9fa5-f19483e03e07	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5591-5975-4778-3fae597f2cd8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5591-5975-2c4d-6921015a9614	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5591-5975-2d9d-e4c33ed01122	BE	BEL	056	Belgium 	Belgija	\N
00040000-5591-5975-853b-bf743e0f6ac9	BZ	BLZ	084	Belize 	Belize	\N
00040000-5591-5975-e439-2617c92c881d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5591-5975-2334-032596770577	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5591-5975-f3c2-f346f9f0cda6	BT	BTN	064	Bhutan 	Butan	\N
00040000-5591-5975-0166-0ae835beaf43	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5591-5975-e518-7e3b275c240b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5591-5975-8f3b-29752fdabff5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5591-5975-46f1-fa7cfed16dab	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5591-5975-bf01-0891e30b106e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5591-5975-e65d-4549a69aa91c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5591-5975-c590-a8e9a8ff62c6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5591-5975-9707-fad3362959be	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5591-5975-72aa-719fd5bd3b2f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5591-5975-3a5a-5f8d6938880a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5591-5975-5245-16a637f6d82e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5591-5975-0516-4f52fc01f373	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5591-5975-e367-68a3fa0c99ca	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5591-5975-03d8-3bae4e61581c	CA	CAN	124	Canada 	Kanada	\N
00040000-5591-5975-2e86-dfc03a4ee762	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5591-5975-3f19-b9979b1a4ea1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5591-5975-8363-26b7bcf2e349	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5591-5975-cf36-aa4878660803	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5591-5975-3575-1bcc74e586a7	CL	CHL	152	Chile 	Čile	\N
00040000-5591-5975-aaf2-42e0a6269610	CN	CHN	156	China 	Kitajska	\N
00040000-5591-5975-61ab-dce27c24b814	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5591-5975-3813-343acfec3d5d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5591-5975-df16-b2bd0755dbff	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5591-5975-06e1-990d695adc94	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5591-5975-eec6-656e0da0e1b6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5591-5975-ca96-f0da242154ec	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5591-5975-3011-8b915a8fd93b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5591-5975-6ad0-dc7e60a64c62	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5591-5975-7aa5-b1a91b1b6e2b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5591-5975-46b7-ac2d88dae2df	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5591-5975-4148-30206883acca	CU	CUB	192	Cuba 	Kuba	\N
00040000-5591-5975-8dbc-3feb41a838b5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5591-5975-21d2-142b18c75caa	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5591-5975-1661-f8b052a3508e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5591-5975-5363-3162e51b77fb	DK	DNK	208	Denmark 	Danska	\N
00040000-5591-5975-9939-43e87162f0a2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5591-5975-4a73-2c9ea88ec270	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-5975-6071-056319c00180	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5591-5975-fa5b-d36d06c013c8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5591-5975-c13c-946df1d8b9c2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5591-5975-3baa-fe6b1ea51268	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5591-5975-cc58-bc8ee33e47d5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5591-5975-c99a-1fd6d06f458d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5591-5975-1d19-9eef6d3a0b3d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5591-5975-45f6-69c28bf0952a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5591-5975-053e-4e692e9de149	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5591-5975-43eb-c9c02d238d0f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5591-5975-ec23-1b1f778b4b66	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5591-5975-dca4-c2d298116277	FI	FIN	246	Finland 	Finska	\N
00040000-5591-5975-93a1-6908885b4db7	FR	FRA	250	France 	Francija	\N
00040000-5591-5975-6db5-ee95f7185698	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5591-5975-1232-299140e09865	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5591-5975-7c00-87971d6a975f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5591-5975-e4c4-4ec92c0181bd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5591-5975-1a9f-909d59f722bf	GA	GAB	266	Gabon 	Gabon	\N
00040000-5591-5975-6773-4b1aac5b3d3d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5591-5975-0ca7-98777c7e9a44	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5591-5975-bfef-aa2f07caf34c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5591-5975-7b60-22ff4c09efc1	GH	GHA	288	Ghana 	Gana	\N
00040000-5591-5975-f733-6e2f218080cf	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5591-5975-a140-129b9859af38	GR	GRC	300	Greece 	Grčija	\N
00040000-5591-5975-de03-ca1d8957994f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5591-5975-8e80-cac40acd7d6e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5591-5975-0c3f-e4463573365f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5591-5975-fc45-e6c4b2de4f5a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5591-5975-6788-3310774f2353	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5591-5975-d5fa-3575cfa1cb8c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5591-5975-2cb6-96c63b0b8793	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5591-5975-2dc6-380994092e28	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5591-5975-4c85-d1dcf4d44c38	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5591-5975-02e4-32f4e215582a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5591-5975-ee89-2dbb087abdcf	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5591-5975-b320-d62aeb81ee13	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5591-5975-e900-69f34de1760e	HN	HND	340	Honduras 	Honduras	\N
00040000-5591-5975-2525-c9bc6eedfdce	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5591-5975-ac3f-a69d49a6cb76	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5591-5975-b1aa-cfcc235a9312	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5591-5975-a37e-10409685f1b7	IN	IND	356	India 	Indija	\N
00040000-5591-5975-9891-d0d1a37244dd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5591-5975-0b67-6ddc284eb1ff	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5591-5975-b9f2-9c443799303d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5591-5975-3961-72c35cba08c1	IE	IRL	372	Ireland 	Irska	\N
00040000-5591-5975-e3c1-48c8fd6a3ce8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5591-5975-6b1e-cc52335b95c0	IL	ISR	376	Israel 	Izrael	\N
00040000-5591-5975-603d-38fdb003bcc4	IT	ITA	380	Italy 	Italija	\N
00040000-5591-5975-a08f-bbab0f271fd1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5591-5975-1a8e-8dce4e510905	JP	JPN	392	Japan 	Japonska	\N
00040000-5591-5975-55f6-3ece62d39ab2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5591-5975-5a12-3d83e270ca12	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5591-5975-b3c5-8d83927886c1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5591-5975-6cab-ba7f70f340b1	KE	KEN	404	Kenya 	Kenija	\N
00040000-5591-5975-a6ad-6b2076bd353a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5591-5975-6941-20ab92e75db5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5591-5975-4904-2723a55c119d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5591-5975-0988-90a845fea7db	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5591-5975-6934-c45bf24056de	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5591-5975-6091-1088980691ba	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5591-5975-e314-92f325de4a3d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5591-5975-46f1-9a9b5e3270b8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5591-5975-48f0-89a3cdbd68d0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5591-5975-9ed7-3b86d44b0a7d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5591-5975-5734-cef1d8ad3fdc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5591-5975-e400-47fe4f8d2a3f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5591-5975-85ed-3e1a588e29bc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5591-5975-6f92-1a347d83782e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5591-5975-7c79-45e68ba89fb3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5591-5975-1b7b-0ef85f67e659	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5591-5975-faea-df43f3da4374	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5591-5975-ec26-6edda8357c26	MW	MWI	454	Malawi 	Malavi	\N
00040000-5591-5975-4340-422006730b4c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5591-5975-7f0d-b4fdc58573ce	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5591-5975-e827-a055dae3d907	ML	MLI	466	Mali 	Mali	\N
00040000-5591-5975-f3f4-974a15319f18	MT	MLT	470	Malta 	Malta	\N
00040000-5591-5975-a29c-88ba1b3277d0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5591-5975-aa42-d9c0d0e14dd0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5591-5975-4c33-629b4d30d7ec	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5591-5975-7107-09c75d8e1327	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5591-5975-51bf-90869f6a4c12	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5591-5975-54ed-f287cd268664	MX	MEX	484	Mexico 	Mehika	\N
00040000-5591-5975-6ab0-44891a3d47ae	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5591-5975-da73-3b3ccd761270	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5591-5975-34f6-26fc27280ac1	MC	MCO	492	Monaco 	Monako	\N
00040000-5591-5975-f2d5-f3f8b6cd6471	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5591-5975-625f-f94f93fdb428	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5591-5975-40ee-1f68680f5772	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5591-5975-e857-92c3fccf08b9	MA	MAR	504	Morocco 	Maroko	\N
00040000-5591-5975-6335-b45295787d36	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5591-5975-f1ae-5ef6c05fd727	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5591-5975-0fa1-05209d4c7f8c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5591-5975-767f-8fc6f1752d3c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5591-5975-5f78-c9067ed6e283	NP	NPL	524	Nepal 	Nepal	\N
00040000-5591-5975-bf3a-41b62669f1a2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5591-5975-1787-6b6c37863234	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5591-5975-7698-5437a0bfb35c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5591-5975-1c1b-6209cf5e007c	NE	NER	562	Niger 	Niger 	\N
00040000-5591-5975-6532-3b001062b036	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5591-5975-9956-2f3f5e596968	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5591-5975-d9f4-0737184200ab	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5591-5975-1cdd-7bfb83741005	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5591-5975-3c4c-08064d43f027	NO	NOR	578	Norway 	Norveška	\N
00040000-5591-5975-1a9f-d1ef739b891b	OM	OMN	512	Oman 	Oman	\N
00040000-5591-5975-3b5f-e00ba249ad8d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5591-5975-d38b-ee69eaf6d32b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5591-5975-3d46-3a4ff9b8b083	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5591-5975-520d-6a5ebf9e969a	PA	PAN	591	Panama 	Panama	\N
00040000-5591-5975-d1a9-21fef0f995ee	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5591-5975-e382-c8bd184b9fe5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5591-5975-dca7-68fea092cbb2	PE	PER	604	Peru 	Peru	\N
00040000-5591-5975-5865-b15b891d08c7	PH	PHL	608	Philippines 	Filipini	\N
00040000-5591-5975-713a-506d3a017adb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5591-5975-2fcd-d6a12be4d2b6	PL	POL	616	Poland 	Poljska	\N
00040000-5591-5975-116a-701c2b165b4c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5591-5975-4dba-689141987b1c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5591-5975-0525-64f7574e97ab	QA	QAT	634	Qatar 	Katar	\N
00040000-5591-5975-9cbe-dccc4846142c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5591-5975-e502-b4cc73e5096b	RO	ROU	642	Romania 	Romunija	\N
00040000-5591-5975-60ec-3723b7108d42	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5591-5975-a9d7-22bbee72b922	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5591-5975-b3d8-3aa0b2828d49	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5591-5975-7f23-86017731ffa5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5591-5975-96e6-233f72e7f8e5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5591-5975-b4a7-f1e69b283d5b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5591-5975-02f2-cacb950d4adf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5591-5975-1a21-6a54f7dc2365	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5591-5975-c405-83925709fe0d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5591-5975-1f0f-10765308fc17	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5591-5975-c03d-36fb9c276214	SM	SMR	674	San Marino 	San Marino	\N
00040000-5591-5975-55b6-8494e614adb3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5591-5975-7577-a06c9170d49c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5591-5975-1efb-268fed058a2e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5591-5975-91c9-48b2f5cdd612	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5591-5975-93ec-e9860229e66c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5591-5975-d323-a4f06cf48243	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5591-5975-8dbc-099ef5eb11be	SG	SGP	702	Singapore 	Singapur	\N
00040000-5591-5975-694c-0bc40b399a6e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5591-5975-b612-0e27023a4e2e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5591-5975-8c43-f420836fe8ab	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5591-5975-acb1-6536b3793224	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5591-5975-62ad-f3ca5fcbaf77	SO	SOM	706	Somalia 	Somalija	\N
00040000-5591-5975-27d2-c85454f79080	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5591-5975-e120-ca0d2fd09336	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5591-5975-44bf-851e7f735bb0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5591-5975-2e8b-6cce973c1d1c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5591-5975-6cdd-2b0283037677	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5591-5975-a7b0-2abeb0a3eb0a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5591-5975-e6ff-e4077fbc1522	SR	SUR	740	Suriname 	Surinam	\N
00040000-5591-5975-12d0-2d0f3d8ba05f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5591-5975-735c-4aaccc334b82	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5591-5975-a938-431b6f0059e0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5591-5975-41bd-2efe7646528d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5591-5975-94f1-cd0893194864	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5591-5975-292f-a6ce8098e69e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5591-5975-a143-7b74777ae0b2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5591-5975-61d5-7c4d79a47983	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5591-5975-ab8e-e7433ec9ad3d	TH	THA	764	Thailand 	Tajska	\N
00040000-5591-5975-1598-031f44c13d87	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5591-5975-c7f1-6ea6534676f3	TG	TGO	768	Togo 	Togo	\N
00040000-5591-5975-cfdf-500f6604772b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5591-5975-5797-313ae732bfd1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5591-5975-7738-8ccdb0fe2675	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5591-5975-3a9b-2c02ff31c8cd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5591-5975-b57b-08bdc0b20ce0	TR	TUR	792	Turkey 	Turčija	\N
00040000-5591-5975-7a75-1769db262480	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5591-5975-f382-7fa99996ca18	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-5975-6d94-abc75c79ba84	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5591-5975-f89a-81a8b93b9870	UG	UGA	800	Uganda 	Uganda	\N
00040000-5591-5975-d63f-f92332bf783c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5591-5975-d2a7-dbf4108d9f71	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5591-5975-ed2b-3faf18bfd512	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5591-5975-f2bd-b377dcd202e9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5591-5975-e8eb-c484129afa4a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5591-5975-38b5-430ec51b4e67	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5591-5975-5983-0c0d7f1aca40	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5591-5975-1b69-fce13ffda820	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5591-5975-365a-338d5a40dc72	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5591-5975-5bb9-e3b829fb1f5e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5591-5975-f345-cce6cd55e1a7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-5975-860b-7ae4f6f1b004	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5591-5975-900c-60062a781cb2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5591-5975-7a2d-6ec10b645f07	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5591-5975-e60c-cb54ec457d2d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5591-5975-2679-1a8c91a09cd4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5591-5975-98a7-2c7367087624	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8445058)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5591-5978-b1f4-b495ffc3da37	000e0000-5591-5978-500d-c5b08d5d897e	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5591-5977-e16a-b0e73e4449e6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5591-5978-d942-026a26e6be47	000e0000-5591-5978-8eb4-2bb17e90f778	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5591-5977-9407-2763dc90c805	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8444866)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5591-5978-3811-2ce74dee2063	000e0000-5591-5978-8eb4-2bb17e90f778	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5591-5977-311d-d19ace978dda
000d0000-5591-5978-db13-5a07a421e01c	000e0000-5591-5978-8eb4-2bb17e90f778	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-5977-311d-d19ace978dda
000d0000-5591-5978-89f6-ca7923d56656	000e0000-5591-5978-8eb4-2bb17e90f778	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5591-5977-1f29-f5b63760d8b8
000d0000-5591-5978-2e35-54d962096dff	000e0000-5591-5978-8eb4-2bb17e90f778	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5591-5977-442c-776a4396bf72
000d0000-5591-5978-59eb-523044b14044	000e0000-5591-5978-8eb4-2bb17e90f778	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5591-5977-442c-776a4396bf72
000d0000-5591-5978-60ca-2c15ca5a0804	000e0000-5591-5978-8eb4-2bb17e90f778	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5591-5977-442c-776a4396bf72
000d0000-5591-5978-2065-d0a681f5dd92	000e0000-5591-5978-8eb4-2bb17e90f778	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-5977-311d-d19ace978dda
\.


--
-- TOC entry 2866 (class 0 OID 8444686)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8444734)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8444666)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5591-5978-1d18-0edbc93a6aba	00080000-5591-5977-9374-4b42c9e87d45	00090000-5591-5978-d6ed-d55f868f3f7c	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8444783)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8444808)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8444623)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5591-5976-be1c-afafd9f2b1ad	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5591-5976-3caa-40e3e56cbd03	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5591-5976-f881-cb9ace638662	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5591-5976-6247-ebccf60d9287	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5591-5976-d8fa-0ffabff3035e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5591-5976-bcad-eb0e09e74244	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5591-5976-e328-274f4ecc7582	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5591-5976-6df1-e284392ed6f3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-5976-ddbf-6e87a7a1e56d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-5976-6a8a-6844080d9727	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5591-5976-fc14-7ca589497e1d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5591-5976-817e-3cd8a4c3dc5a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5591-5976-f5ee-55bbb2f2e17e	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5591-5977-1f78-ac5ff9de2101	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5591-5977-08be-614a477c255e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5591-5977-64fa-588b4b3288f1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5591-5977-da57-861271877209	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5591-5977-7102-e769640a46fd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5591-5977-0e4c-bcf69e5a51bc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8444536)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5591-5977-8046-1df3a860991a	00000000-5591-5977-08be-614a477c255e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5591-5977-0800-c87b41ddfb96	00000000-5591-5977-08be-614a477c255e	00010000-5591-5976-6c53-f0f22e9ee7cc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5591-5977-aa5e-ec459e7e3d09	00000000-5591-5977-64fa-588b4b3288f1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8444547)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5591-5978-01c4-8b87ac4da886	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5591-5978-4c4b-93df40243e82	00010000-5591-5978-57c3-29c3bbdd4e87	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5591-5978-33b2-30a45ab539a4	00010000-5591-5978-9e45-397bd1f45f62	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5591-5978-6457-d80890890228	00010000-5591-5978-5b50-28fe7f1a7104	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5591-5978-c889-bcc8d07261a5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5591-5978-47a0-c883f8a00b8d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5591-5978-353c-19bc5a1ac7db	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5591-5978-a198-6bfa71ce5d27	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5591-5978-d6ed-d55f868f3f7c	00010000-5591-5978-ab91-4c63b0d3b585	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5591-5978-d0f5-679c2498daa2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5591-5978-393f-8de5f47000e8	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5591-5978-04bd-08d1438a7569	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5591-5978-cf77-71b2fc68df36	00010000-5591-5978-f0e8-d345d7b70ae8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8444501)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5591-5976-4049-5335e35ff225	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5591-5976-9e17-f8537b505a20	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5591-5976-0b8f-08ace49d92dd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5591-5976-3499-ce03396eac75	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5591-5976-0127-b8f28fe2db22	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5591-5976-308f-9b67e4346b4f	Abonma-read	Abonma - branje	f
00030000-5591-5976-e135-87172614ba4c	Abonma-write	Abonma - spreminjanje	f
00030000-5591-5976-87c6-b0a73b2d4fef	Alternacija-read	Alternacija - branje	f
00030000-5591-5976-b1c5-55583f2eb110	Alternacija-write	Alternacija - spreminjanje	f
00030000-5591-5976-52b7-19f7c9dbb1bd	Arhivalija-read	Arhivalija - branje	f
00030000-5591-5976-caed-5cefcd1caf65	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5591-5976-021b-c06b4ea17496	Besedilo-read	Besedilo - branje	f
00030000-5591-5976-f615-763326e4a369	Besedilo-write	Besedilo - spreminjanje	f
00030000-5591-5976-6fd9-183fa5b1757c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5591-5976-1115-92eed8bacc96	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5591-5976-1a86-5d31b92dbc85	Dogodek-read	Dogodek - branje	f
00030000-5591-5976-5338-5af7b329adc3	Dogodek-write	Dogodek - spreminjanje	f
00030000-5591-5976-1230-575330a21f67	DrugiVir-read	DrugiVir - branje	f
00030000-5591-5976-b338-217cc9839bd0	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5591-5976-640d-d3413e2ee376	Drzava-read	Drzava - branje	f
00030000-5591-5976-e9a7-f1f344656394	Drzava-write	Drzava - spreminjanje	f
00030000-5591-5976-40d8-7c313941e786	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5591-5976-75b1-1299c899b5f9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5591-5976-81b5-dbf38aa36c78	Funkcija-read	Funkcija - branje	f
00030000-5591-5976-208a-2b3bcbcdb4b7	Funkcija-write	Funkcija - spreminjanje	f
00030000-5591-5976-42e4-83e172b5163f	Gostovanje-read	Gostovanje - branje	f
00030000-5591-5976-df85-d2b6b9250b1f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5591-5976-2bfd-921f6a1f4b1a	Gostujoca-read	Gostujoca - branje	f
00030000-5591-5976-0ef8-3ac129dcdc53	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5591-5976-3453-e122ce0e85c1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5591-5976-3556-957ddea804f3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5591-5976-40d9-257782f059e9	Kupec-read	Kupec - branje	f
00030000-5591-5976-0a2f-babb7e49f517	Kupec-write	Kupec - spreminjanje	f
00030000-5591-5976-66ef-382169e16aea	NacinPlacina-read	NacinPlacina - branje	f
00030000-5591-5976-c0f1-4162d744bf05	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5591-5976-c991-157141bf2451	Option-read	Option - branje	f
00030000-5591-5976-6cac-4df0726e1433	Option-write	Option - spreminjanje	f
00030000-5591-5976-a236-221663bcace1	OptionValue-read	OptionValue - branje	f
00030000-5591-5976-4a36-fe5555b236b0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5591-5976-7eee-c5b240634c3d	Oseba-read	Oseba - branje	f
00030000-5591-5976-fc61-baafec3de880	Oseba-write	Oseba - spreminjanje	f
00030000-5591-5976-e830-cdf96e7c0c5f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5591-5976-3154-815e95c31bf1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5591-5976-e1b6-f6f41ec59adb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5591-5976-eb77-31ea2edbb02e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5591-5976-557f-4204fecf63cf	Pogodba-read	Pogodba - branje	f
00030000-5591-5976-7fc2-c3de90d81cc0	Pogodba-write	Pogodba - spreminjanje	f
00030000-5591-5976-f2f6-1df1ec533542	Popa-read	Popa - branje	f
00030000-5591-5976-a723-a7c97d02a7ef	Popa-write	Popa - spreminjanje	f
00030000-5591-5976-7bbb-db94f70b10de	Posta-read	Posta - branje	f
00030000-5591-5976-efae-47044e594893	Posta-write	Posta - spreminjanje	f
00030000-5591-5976-6121-36bbbc3d1000	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5591-5976-96dd-b4dcc41fb411	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5591-5976-1750-297f532ba3cd	PostniNaslov-read	PostniNaslov - branje	f
00030000-5591-5976-9a06-55a6ef173243	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5591-5976-16d8-cebedc25dbcd	Predstava-read	Predstava - branje	f
00030000-5591-5976-e606-18868dba20fa	Predstava-write	Predstava - spreminjanje	f
00030000-5591-5976-18ee-b5d467f9e072	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5591-5976-643c-c3f5c985298b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5591-5976-f454-b4ca753e56c9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5591-5976-7067-8277dd4bf4e0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5591-5976-b5a4-0a2aaa9a8495	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5591-5976-6afb-637e5e966649	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5591-5976-81d1-f6ebffcd35c2	ProgramDela-read	ProgramDela - branje	f
00030000-5591-5976-aef2-3f341b695bfe	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5591-5976-4ef5-9095feb0e0a7	ProgramFestival-read	ProgramFestival - branje	f
00030000-5591-5976-7da0-036ab76f2751	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5591-5976-4102-b19261451d5f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5591-5976-8639-613475ef32d9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5591-5976-241a-f4a84f903b09	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5591-5976-242d-8baec0e3c700	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5591-5976-a99a-0af835579c6a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5591-5976-61f1-7d86583738a3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5591-5976-c418-999666d82854	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5591-5976-a7dd-ffb1d22f920b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5591-5976-beb2-ec67892f3653	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5591-5976-4331-d052d6cc099f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5591-5976-7d8e-f48bf301ed8a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5591-5976-2103-7c46390a45a2	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5591-5976-09bc-e7ab919606f1	ProgramRazno-read	ProgramRazno - branje	f
00030000-5591-5976-2eb5-4b1f79c366e8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5591-5976-9ec7-b1c0a9823e60	Prostor-read	Prostor - branje	f
00030000-5591-5976-6535-db1e271e80da	Prostor-write	Prostor - spreminjanje	f
00030000-5591-5976-0fe2-54f2d5a0672c	Racun-read	Racun - branje	f
00030000-5591-5976-a18d-f96f941e5493	Racun-write	Racun - spreminjanje	f
00030000-5591-5976-6381-fc0b5911093f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5591-5976-bf79-ce6d032f8907	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5591-5976-a5e7-e438a2938e80	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5591-5976-eaa4-932d5259f218	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5591-5976-e1ef-75535cd9336b	Rekvizit-read	Rekvizit - branje	f
00030000-5591-5976-3d95-474a2af57748	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5591-5976-faaf-c6459f41cfca	Revizija-read	Revizija - branje	f
00030000-5591-5976-52c5-bbd5f0dff3e0	Revizija-write	Revizija - spreminjanje	f
00030000-5591-5976-69fb-7f51ec808194	Rezervacija-read	Rezervacija - branje	f
00030000-5591-5976-461e-8517f2e5d043	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5591-5976-70f0-d9b0a606db0e	SedezniRed-read	SedezniRed - branje	f
00030000-5591-5976-401c-e505676cf8fb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5591-5976-3dae-54b158c10a58	Sedez-read	Sedez - branje	f
00030000-5591-5976-6a29-13eb292502b0	Sedez-write	Sedez - spreminjanje	f
00030000-5591-5976-e074-4c4e253d6670	Sezona-read	Sezona - branje	f
00030000-5591-5976-421e-a254c3e78fcf	Sezona-write	Sezona - spreminjanje	f
00030000-5591-5976-ac56-d92c97e7403d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5591-5976-37f4-421c9789b717	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5591-5976-78c6-0cd0eb59e5c8	Stevilcenje-read	Stevilcenje - branje	f
00030000-5591-5976-f18e-36d7227c0594	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5591-5976-ce5e-415ce3447e33	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5591-5976-b2d5-e18f347bc7d8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5591-5976-6ce8-c56489096c8d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5591-5976-f5e4-9c1c903cf8fd	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5591-5976-707f-ab6061cbf184	Telefonska-read	Telefonska - branje	f
00030000-5591-5976-6ca4-93c8bb3a8b03	Telefonska-write	Telefonska - spreminjanje	f
00030000-5591-5976-2672-047a996ca63d	TerminStoritve-read	TerminStoritve - branje	f
00030000-5591-5976-4016-342b18baf433	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5591-5976-8e52-fa4640a2ad3e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5591-5976-4a9d-c086d3d9c85c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5591-5976-4d54-094dddb8247d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5591-5976-dd7f-b679091fa365	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5591-5976-943d-45b72bd42e25	Trr-read	Trr - branje	f
00030000-5591-5976-26d2-668e9d7c3cf6	Trr-write	Trr - spreminjanje	f
00030000-5591-5976-2048-276cfc207684	Uprizoritev-read	Uprizoritev - branje	f
00030000-5591-5976-e253-7fdc959387a2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5591-5976-5f8a-b57f3fbb9127	Vaja-read	Vaja - branje	f
00030000-5591-5976-539f-649d6796dea9	Vaja-write	Vaja - spreminjanje	f
00030000-5591-5976-f2f1-3ebed4d730b8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5591-5976-e35f-4261d5167619	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5591-5976-d228-f5b3e9b92fc6	Zaposlitev-read	Zaposlitev - branje	f
00030000-5591-5976-972c-ac920b2d9d1e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5591-5976-7c65-8a2d345334a1	Zasedenost-read	Zasedenost - branje	f
00030000-5591-5976-bb2f-1bef31a7b8e6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5591-5976-9943-67f48ca93a45	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5591-5976-d9ee-83de8cef1901	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5591-5976-a9f4-6458b3fff92c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5591-5976-6103-f74e1f10a697	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8444520)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5591-5976-20d9-fb2a1fe6a4b0	00030000-5591-5976-9e17-f8537b505a20
00020000-5591-5976-0015-b440ed6caa32	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e135-87172614ba4c
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-87c6-b0a73b2d4fef
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-b1c5-55583f2eb110
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-3499-ce03396eac75
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-5338-5af7b329adc3
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e9a7-f1f344656394
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-81b5-dbf38aa36c78
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-208a-2b3bcbcdb4b7
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-df85-d2b6b9250b1f
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-0ef8-3ac129dcdc53
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-3453-e122ce0e85c1
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-3556-957ddea804f3
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-c991-157141bf2451
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-a236-221663bcace1
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-7eee-c5b240634c3d
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-fc61-baafec3de880
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-a723-a7c97d02a7ef
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-efae-47044e594893
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-1750-297f532ba3cd
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-9a06-55a6ef173243
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e606-18868dba20fa
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-b5a4-0a2aaa9a8495
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-6afb-637e5e966649
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-6535-db1e271e80da
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-eaa4-932d5259f218
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-3d95-474a2af57748
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-421e-a254c3e78fcf
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-8e52-fa4640a2ad3e
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-2048-276cfc207684
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-e253-7fdc959387a2
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-5f8a-b57f3fbb9127
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-539f-649d6796dea9
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-7c65-8a2d345334a1
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-bb2f-1bef31a7b8e6
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5976-375c-5ca1b622a619	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-3453-e122ce0e85c1
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-3556-957ddea804f3
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-c991-157141bf2451
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-a236-221663bcace1
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-7eee-c5b240634c3d
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-fc61-baafec3de880
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-1750-297f532ba3cd
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-9a06-55a6ef173243
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-707f-ab6061cbf184
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-6ca4-93c8bb3a8b03
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-943d-45b72bd42e25
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-26d2-668e9d7c3cf6
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-d228-f5b3e9b92fc6
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-972c-ac920b2d9d1e
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5976-a3bd-eeea5925c65c	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-87c6-b0a73b2d4fef
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-caed-5cefcd1caf65
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-021b-c06b4ea17496
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-6fd9-183fa5b1757c
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-81b5-dbf38aa36c78
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-3453-e122ce0e85c1
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-c991-157141bf2451
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-a236-221663bcace1
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-7eee-c5b240634c3d
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-b5a4-0a2aaa9a8495
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-8e52-fa4640a2ad3e
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-5f8a-b57f3fbb9127
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-7c65-8a2d345334a1
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5976-c4c4-13b7b465a079	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-e135-87172614ba4c
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-b1c5-55583f2eb110
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-c991-157141bf2451
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-a236-221663bcace1
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-8e52-fa4640a2ad3e
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5976-0b4f-fdbaea2993fe	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-c991-157141bf2451
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-a236-221663bcace1
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-2672-047a996ca63d
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-0b8f-08ace49d92dd
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-8e52-fa4640a2ad3e
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5976-dbeb-128aabf904d7	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4049-5335e35ff225
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-9e17-f8537b505a20
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-0b8f-08ace49d92dd
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3499-ce03396eac75
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-0127-b8f28fe2db22
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-308f-9b67e4346b4f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e135-87172614ba4c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-87c6-b0a73b2d4fef
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-b1c5-55583f2eb110
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-52b7-19f7c9dbb1bd
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-caed-5cefcd1caf65
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-021b-c06b4ea17496
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f615-763326e4a369
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6fd9-183fa5b1757c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-1115-92eed8bacc96
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-1a86-5d31b92dbc85
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-5338-5af7b329adc3
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-640d-d3413e2ee376
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e9a7-f1f344656394
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-40d8-7c313941e786
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-75b1-1299c899b5f9
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-81b5-dbf38aa36c78
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-208a-2b3bcbcdb4b7
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-42e4-83e172b5163f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-df85-d2b6b9250b1f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-2bfd-921f6a1f4b1a
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-0ef8-3ac129dcdc53
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3453-e122ce0e85c1
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3556-957ddea804f3
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-40d9-257782f059e9
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-0a2f-babb7e49f517
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-66ef-382169e16aea
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-c0f1-4162d744bf05
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-c991-157141bf2451
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6cac-4df0726e1433
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a236-221663bcace1
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4a36-fe5555b236b0
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7eee-c5b240634c3d
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-fc61-baafec3de880
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e830-cdf96e7c0c5f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3154-815e95c31bf1
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e1b6-f6f41ec59adb
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-eb77-31ea2edbb02e
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-557f-4204fecf63cf
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7fc2-c3de90d81cc0
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f2f6-1df1ec533542
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a723-a7c97d02a7ef
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7bbb-db94f70b10de
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-efae-47044e594893
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6121-36bbbc3d1000
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-96dd-b4dcc41fb411
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-1750-297f532ba3cd
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-9a06-55a6ef173243
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-16d8-cebedc25dbcd
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e606-18868dba20fa
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-18ee-b5d467f9e072
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-643c-c3f5c985298b
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f454-b4ca753e56c9
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7067-8277dd4bf4e0
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-b5a4-0a2aaa9a8495
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6afb-637e5e966649
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-81d1-f6ebffcd35c2
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-aef2-3f341b695bfe
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4ef5-9095feb0e0a7
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7da0-036ab76f2751
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4102-b19261451d5f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-8639-613475ef32d9
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-241a-f4a84f903b09
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-242d-8baec0e3c700
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a99a-0af835579c6a
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-61f1-7d86583738a3
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-c418-999666d82854
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a7dd-ffb1d22f920b
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-beb2-ec67892f3653
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4331-d052d6cc099f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7d8e-f48bf301ed8a
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-2103-7c46390a45a2
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-09bc-e7ab919606f1
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-2eb5-4b1f79c366e8
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-9ec7-b1c0a9823e60
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6535-db1e271e80da
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-0fe2-54f2d5a0672c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a18d-f96f941e5493
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6381-fc0b5911093f
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-bf79-ce6d032f8907
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a5e7-e438a2938e80
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-eaa4-932d5259f218
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e1ef-75535cd9336b
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3d95-474a2af57748
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-faaf-c6459f41cfca
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-52c5-bbd5f0dff3e0
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-69fb-7f51ec808194
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-461e-8517f2e5d043
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-70f0-d9b0a606db0e
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-401c-e505676cf8fb
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-3dae-54b158c10a58
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6a29-13eb292502b0
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e074-4c4e253d6670
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-421e-a254c3e78fcf
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-ac56-d92c97e7403d
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-37f4-421c9789b717
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-78c6-0cd0eb59e5c8
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f18e-36d7227c0594
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-ce5e-415ce3447e33
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-b2d5-e18f347bc7d8
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6ce8-c56489096c8d
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f5e4-9c1c903cf8fd
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-707f-ab6061cbf184
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6ca4-93c8bb3a8b03
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-2672-047a996ca63d
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4016-342b18baf433
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-8e52-fa4640a2ad3e
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4a9d-c086d3d9c85c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-4d54-094dddb8247d
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-dd7f-b679091fa365
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-943d-45b72bd42e25
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-26d2-668e9d7c3cf6
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-2048-276cfc207684
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e253-7fdc959387a2
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-5f8a-b57f3fbb9127
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-539f-649d6796dea9
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-f2f1-3ebed4d730b8
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-e35f-4261d5167619
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-d228-f5b3e9b92fc6
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-972c-ac920b2d9d1e
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-7c65-8a2d345334a1
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-bb2f-1bef31a7b8e6
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-9943-67f48ca93a45
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-d9ee-83de8cef1901
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-a9f4-6458b3fff92c
00020000-5591-5978-7ab3-a40ed6457676	00030000-5591-5976-6103-f74e1f10a697
\.


--
-- TOC entry 2881 (class 0 OID 8444815)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8444846)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8444978)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5591-5978-c3bf-09fd3d9f76eb	00090000-5591-5978-01c4-8b87ac4da886	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8444580)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5591-5977-9374-4b42c9e87d45	00040000-5591-5975-d276-eabb22d094f1	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5977-d448-7a7c9b254b55	00040000-5591-5975-d276-eabb22d094f1	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5977-7aa6-1f89621367c6	00040000-5591-5975-d276-eabb22d094f1	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5977-ff5c-74bfc3ff2124	00040000-5591-5975-d276-eabb22d094f1	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5977-a2a8-be3ec78f48fe	00040000-5591-5975-d276-eabb22d094f1	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-5978-9be5-af65a5de8ba0	00040000-5591-5975-8c43-f420836fe8ab	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8444615)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5591-5976-6401-a0a1ca35c7b1	8341	Adlešiči
00050000-5591-5976-8bc1-f5e83ad4a15f	5270	Ajdovščina
00050000-5591-5976-a472-d3b1d22e9e24	6280	Ankaran/Ancarano
00050000-5591-5976-156a-795a278523df	9253	Apače
00050000-5591-5976-90ae-757ee374af58	8253	Artiče
00050000-5591-5976-edd8-4ec691b5f985	4275	Begunje na Gorenjskem
00050000-5591-5976-8641-92d3a0aa512c	1382	Begunje pri Cerknici
00050000-5591-5976-e942-7a774e6fc43d	9231	Beltinci
00050000-5591-5976-18f4-2fa26fe57904	2234	Benedikt
00050000-5591-5976-c04b-c9ccc0b36250	2345	Bistrica ob Dravi
00050000-5591-5976-6692-39e88eb4c163	3256	Bistrica ob Sotli
00050000-5591-5976-d77a-b3bcb06ca77c	8259	Bizeljsko
00050000-5591-5976-703b-d3bf29e1098e	1223	Blagovica
00050000-5591-5976-bee5-2b567b5076f2	8283	Blanca
00050000-5591-5976-9abd-5ee1cab6354c	4260	Bled
00050000-5591-5976-c5ec-154860440d2d	4273	Blejska Dobrava
00050000-5591-5976-88c2-a6c8aab6fb86	9265	Bodonci
00050000-5591-5976-f510-defae38f389c	9222	Bogojina
00050000-5591-5976-6b44-911ae97086aa	4263	Bohinjska Bela
00050000-5591-5976-6234-4adddd9c162c	4264	Bohinjska Bistrica
00050000-5591-5976-7070-1eb5e15296bf	4265	Bohinjsko jezero
00050000-5591-5976-c9b4-a5075bcec28a	1353	Borovnica
00050000-5591-5976-4d67-1f651b90aa47	8294	Boštanj
00050000-5591-5976-e950-5c63816066ca	5230	Bovec
00050000-5591-5976-0fc1-6c51e4f3c075	5295	Branik
00050000-5591-5976-3a19-6741fcdc622d	3314	Braslovče
00050000-5591-5976-d154-8a069f2cd475	5223	Breginj
00050000-5591-5976-f06d-70217d252143	8280	Brestanica
00050000-5591-5976-3f5d-c31ec4579a87	2354	Bresternica
00050000-5591-5976-bddf-e9d4871060cc	4243	Brezje
00050000-5591-5976-d2fc-2c2c91d2743f	1351	Brezovica pri Ljubljani
00050000-5591-5976-506f-83a638161de2	8250	Brežice
00050000-5591-5976-d7d6-b52ce0c0707f	4210	Brnik - Aerodrom
00050000-5591-5976-5c54-66fa0ec0b900	8321	Brusnice
00050000-5591-5976-e44c-21a6d55ea5bd	3255	Buče
00050000-5591-5976-cff3-4593f554ffbd	8276	Bučka 
00050000-5591-5976-30d7-a61ac486abd0	9261	Cankova
00050000-5591-5976-fd21-af4b63ca43a8	3000	Celje 
00050000-5591-5976-ceb6-a8c04403fda3	3001	Celje - poštni predali
00050000-5591-5976-6db5-7fb5227c1175	4207	Cerklje na Gorenjskem
00050000-5591-5976-ed90-070266720129	8263	Cerklje ob Krki
00050000-5591-5976-5336-4304b035e260	1380	Cerknica
00050000-5591-5976-3e97-42671113bcc7	5282	Cerkno
00050000-5591-5976-48ff-951c3090d15b	2236	Cerkvenjak
00050000-5591-5976-3b85-15e39b15b002	2215	Ceršak
00050000-5591-5976-3dc3-1f404ab15932	2326	Cirkovce
00050000-5591-5976-fa1f-f97a2bc9d08b	2282	Cirkulane
00050000-5591-5976-7edc-750bdc6782a0	5273	Col
00050000-5591-5976-04f4-e90a0406ff4e	8251	Čatež ob Savi
00050000-5591-5976-f3ff-fbd9c37e7abd	1413	Čemšenik
00050000-5591-5976-4ba6-bb086f0624a0	5253	Čepovan
00050000-5591-5976-8c1b-cb136c5219e4	9232	Črenšovci
00050000-5591-5976-96b6-6694687eaa40	2393	Črna na Koroškem
00050000-5591-5976-eb07-65fcd4a9587e	6275	Črni Kal
00050000-5591-5976-041d-ba0f9b2bce7c	5274	Črni Vrh nad Idrijo
00050000-5591-5976-4b1a-84f90e1f0418	5262	Črniče
00050000-5591-5976-7fd9-247b793c6a18	8340	Črnomelj
00050000-5591-5976-1e56-05e4f820ec03	6271	Dekani
00050000-5591-5976-d932-179bbe03367d	5210	Deskle
00050000-5591-5976-4bb6-26ef47a06421	2253	Destrnik
00050000-5591-5976-1b07-4d2369501798	6215	Divača
00050000-5591-5976-2df2-0d5c0f567a15	1233	Dob
00050000-5591-5976-740e-9644d7a01285	3224	Dobje pri Planini
00050000-5591-5976-4404-0c966155615d	8257	Dobova
00050000-5591-5976-9a9f-dc99e15e42e3	1423	Dobovec
00050000-5591-5976-e5e9-95bdd5f81932	5263	Dobravlje
00050000-5591-5976-4682-1e961cded399	3204	Dobrna
00050000-5591-5976-2ed9-1f58b1bc185b	8211	Dobrnič
00050000-5591-5976-b869-b7a636d9a3e4	1356	Dobrova
00050000-5591-5976-fb59-0ec1fb16b81b	9223	Dobrovnik/Dobronak 
00050000-5591-5976-94ef-adf221900aba	5212	Dobrovo v Brdih
00050000-5591-5976-284e-98e82836e1f2	1431	Dol pri Hrastniku
00050000-5591-5976-5732-25528fab32cd	1262	Dol pri Ljubljani
00050000-5591-5976-22fa-cb2099217abe	1273	Dole pri Litiji
00050000-5591-5976-94f3-f2bb540ed1be	1331	Dolenja vas
00050000-5591-5976-8f8c-ba4c63ee4f0c	8350	Dolenjske Toplice
00050000-5591-5976-d76d-f9ff531ff63a	1230	Domžale
00050000-5591-5976-f7ee-bedfa9b07594	2252	Dornava
00050000-5591-5976-ee3a-9785113b5e3a	5294	Dornberk
00050000-5591-5976-302b-ec23c6f45ae9	1319	Draga
00050000-5591-5976-0a4b-79e36f9dd8d1	8343	Dragatuš
00050000-5591-5976-b5cc-195345353901	3222	Dramlje
00050000-5591-5976-02b1-329e80a6b90f	2370	Dravograd
00050000-5591-5976-b564-8ffd3a66328c	4203	Duplje
00050000-5591-5976-4256-4f4777fd900e	6221	Dutovlje
00050000-5591-5976-210c-d3b98d044bc8	8361	Dvor
00050000-5591-5976-0430-64fa08da4bba	2343	Fala
00050000-5591-5976-73c8-40787797aa33	9208	Fokovci
00050000-5591-5976-b4ae-1b4290df5f49	2313	Fram
00050000-5591-5976-0c4e-e91bbdd8b8f5	3213	Frankolovo
00050000-5591-5976-330f-c7ff97808cf1	1274	Gabrovka
00050000-5591-5976-d40f-2e464cb7d0fd	8254	Globoko
00050000-5591-5976-77dc-5ed5df7a2f36	5275	Godovič
00050000-5591-5976-7250-b88a26b58059	4204	Golnik
00050000-5591-5976-e042-9c27892423c3	3303	Gomilsko
00050000-5591-5976-324a-0c5c4bdc851d	4224	Gorenja vas
00050000-5591-5976-e385-620a111e6b11	3263	Gorica pri Slivnici
00050000-5591-5976-c4be-f04b1559ba2a	2272	Gorišnica
00050000-5591-5976-091e-17c14c9471fa	9250	Gornja Radgona
00050000-5591-5976-c757-498c7d4405eb	3342	Gornji Grad
00050000-5591-5976-e055-f5533c9cf705	4282	Gozd Martuljek
00050000-5591-5976-58c3-2b11ee214c59	6272	Gračišče
00050000-5591-5976-6b80-36db70fe6826	9264	Grad
00050000-5591-5976-e259-7f420ff9518a	8332	Gradac
00050000-5591-5976-dc2c-38f16c1110ec	1384	Grahovo
00050000-5591-5976-369e-855fe66000d4	5242	Grahovo ob Bači
00050000-5591-5976-d55c-b95059ae5122	5251	Grgar
00050000-5591-5976-65b8-f023787fb5f0	3302	Griže
00050000-5591-5976-813c-6ddadd860f36	3231	Grobelno
00050000-5591-5976-fa83-4e26ca7eccb3	1290	Grosuplje
00050000-5591-5976-5d06-ff2faa02188e	2288	Hajdina
00050000-5591-5976-63da-476612c21045	8362	Hinje
00050000-5591-5976-d80f-0cb05361271a	2311	Hoče
00050000-5591-5976-42ca-9554b0b0cc6a	9205	Hodoš/Hodos
00050000-5591-5976-8ef9-2f069fbb3659	1354	Horjul
00050000-5591-5976-87ee-75c4718c3e13	1372	Hotedršica
00050000-5591-5976-1f2a-3cd62d052eeb	1430	Hrastnik
00050000-5591-5976-2acf-40da27c1520f	6225	Hruševje
00050000-5591-5976-b381-dea4ff474755	4276	Hrušica
00050000-5591-5976-6671-5bac6d2ec43b	5280	Idrija
00050000-5591-5976-0ce5-048e1a2590d9	1292	Ig
00050000-5591-5976-7a17-45d37f191f26	6250	Ilirska Bistrica
00050000-5591-5976-76d6-388d831f8a32	6251	Ilirska Bistrica-Trnovo
00050000-5591-5976-ee20-4e95d04956a4	1295	Ivančna Gorica
00050000-5591-5976-5dc3-fbe94e120008	2259	Ivanjkovci
00050000-5591-5976-088d-a6a351ac400d	1411	Izlake
00050000-5591-5976-00ea-818e30dfd7cc	6310	Izola/Isola
00050000-5591-5976-44ca-cc5c989a0e15	2222	Jakobski Dol
00050000-5591-5976-d426-4ecaa2622c59	2221	Jarenina
00050000-5591-5976-984e-d583001d14da	6254	Jelšane
00050000-5591-5976-06b8-7b70da78c16d	4270	Jesenice
00050000-5591-5976-f257-e15d09f776e8	8261	Jesenice na Dolenjskem
00050000-5591-5976-f90a-bb5f9fd86660	3273	Jurklošter
00050000-5591-5976-e34a-be18ae354208	2223	Jurovski Dol
00050000-5591-5976-292a-c58a43de63d5	2256	Juršinci
00050000-5591-5976-825a-a12b1047734f	5214	Kal nad Kanalom
00050000-5591-5976-bfbf-18f3e37bac4c	3233	Kalobje
00050000-5591-5976-a214-ab35d9284880	4246	Kamna Gorica
00050000-5591-5976-b915-7a3b40cc4448	2351	Kamnica
00050000-5591-5976-a7eb-70015bf4cffd	1241	Kamnik
00050000-5591-5976-f33e-573098e084df	5213	Kanal
00050000-5591-5976-cac5-78b8292963b8	8258	Kapele
00050000-5591-5976-5031-212624d18720	2362	Kapla
00050000-5591-5976-ca44-0142c4574b6c	2325	Kidričevo
00050000-5591-5976-e52a-e512e202b498	1412	Kisovec
00050000-5591-5976-d690-25c442218f0a	6253	Knežak
00050000-5591-5976-ee38-de021914e879	5222	Kobarid
00050000-5591-5976-95ce-1d2f905c50a9	9227	Kobilje
00050000-5591-5976-70d7-f023aeb333ca	1330	Kočevje
00050000-5591-5976-032d-eda190758911	1338	Kočevska Reka
00050000-5591-5976-81db-158d66c2972b	2276	Kog
00050000-5591-5976-ff50-350efa68d5f2	5211	Kojsko
00050000-5591-5976-3905-34ca657e9b7a	6223	Komen
00050000-5591-5976-c739-5a0fc689ede5	1218	Komenda
00050000-5591-5976-fd57-70f031111f7b	6000	Koper/Capodistria 
00050000-5591-5976-06c1-d863a99d633c	6001	Koper/Capodistria - poštni predali
00050000-5591-5976-e448-b865ead0877b	8282	Koprivnica
00050000-5591-5976-45cf-74ba63cb474b	5296	Kostanjevica na Krasu
00050000-5591-5976-f845-fdc9890ca9f6	8311	Kostanjevica na Krki
00050000-5591-5976-9d18-ba190f485f7d	1336	Kostel
00050000-5591-5976-fa73-2d6a11bc55c2	6256	Košana
00050000-5591-5976-55cf-549bb39fbab2	2394	Kotlje
00050000-5591-5976-135d-d112989dae9d	6240	Kozina
00050000-5591-5976-281a-aacc6fe9c9c6	3260	Kozje
00050000-5591-5976-65db-4b62d1ec295f	4000	Kranj 
00050000-5591-5976-49dd-a3e31a0e213b	4001	Kranj - poštni predali
00050000-5591-5976-5149-840f4a70c661	4280	Kranjska Gora
00050000-5591-5976-cb2e-f948f04429ad	1281	Kresnice
00050000-5591-5976-09bf-469c926e3f83	4294	Križe
00050000-5591-5976-22a4-d61abe96df6d	9206	Križevci
00050000-5591-5976-484b-8d8583813995	9242	Križevci pri Ljutomeru
00050000-5591-5976-03ce-4186193826b8	1301	Krka
00050000-5591-5976-8f54-4552e4904847	8296	Krmelj
00050000-5591-5976-d4e1-1ed296872be4	4245	Kropa
00050000-5591-5976-e2da-126edb25efad	8262	Krška vas
00050000-5591-5976-e72f-04fe20651acc	8270	Krško
00050000-5591-5976-a4da-c3f99c2545e9	9263	Kuzma
00050000-5591-5976-8d6a-95cea384da5b	2318	Laporje
00050000-5591-5976-2d28-1a0c55597b51	3270	Laško
00050000-5591-5976-7512-169dc5c87e56	1219	Laze v Tuhinju
00050000-5591-5976-cf86-5920b66e3bdd	2230	Lenart v Slovenskih goricah
00050000-5591-5976-8fd6-252d1f571f3d	9220	Lendava/Lendva
00050000-5591-5976-210b-0c9ce74600e6	4248	Lesce
00050000-5591-5976-b864-0203784d4923	3261	Lesično
00050000-5591-5976-1fcd-7f982a9a9a49	8273	Leskovec pri Krškem
00050000-5591-5976-23c4-559bb82f862d	2372	Libeliče
00050000-5591-5976-07f0-256ddd86595f	2341	Limbuš
00050000-5591-5976-a34e-c5f96cbce0a6	1270	Litija
00050000-5591-5976-c1de-436cc03de31f	3202	Ljubečna
00050000-5591-5976-9dba-8c54e2e1ed1b	1000	Ljubljana 
00050000-5591-5976-b0fe-20a31be0b9f6	1001	Ljubljana - poštni predali
00050000-5591-5976-32df-1ca9011eca03	1231	Ljubljana - Črnuče
00050000-5591-5976-540e-f1b191064580	1261	Ljubljana - Dobrunje
00050000-5591-5976-a3f4-6f1531299f85	1260	Ljubljana - Polje
00050000-5591-5976-ccf7-1919a534607a	1210	Ljubljana - Šentvid
00050000-5591-5976-01a1-1e5fc48c1e65	1211	Ljubljana - Šmartno
00050000-5591-5976-30f4-4a0bc5359129	3333	Ljubno ob Savinji
00050000-5591-5976-78ca-626990cc3d1a	9240	Ljutomer
00050000-5591-5976-ee0c-d2620846538a	3215	Loče
00050000-5591-5976-e543-a286ed82d45f	5231	Log pod Mangartom
00050000-5591-5976-1c2f-26f44a052b84	1358	Log pri Brezovici
00050000-5591-5976-fd85-cbb0705d5fe9	1370	Logatec
00050000-5591-5976-03ac-7e73fc1ec357	1371	Logatec
00050000-5591-5976-3536-bca9b07f3c2f	1434	Loka pri Zidanem Mostu
00050000-5591-5976-dd0b-d34bf21e037d	3223	Loka pri Žusmu
00050000-5591-5976-2b91-225a80ce1caa	6219	Lokev
00050000-5591-5976-0863-5a3d449a7b5b	1318	Loški Potok
00050000-5591-5976-0dc8-c1832d5b9523	2324	Lovrenc na Dravskem polju
00050000-5591-5976-3b2b-cec6d0c783c6	2344	Lovrenc na Pohorju
00050000-5591-5976-927f-702351020cb6	3334	Luče
00050000-5591-5976-41b4-4950c30450c3	1225	Lukovica
00050000-5591-5976-db04-68511d9c7a83	9202	Mačkovci
00050000-5591-5976-eaa5-35c46d334490	2322	Majšperk
00050000-5591-5976-4960-38ca974d474e	2321	Makole
00050000-5591-5976-3904-bc36df9ffa76	9243	Mala Nedelja
00050000-5591-5976-969d-24df1005d63e	2229	Malečnik
00050000-5591-5976-b061-d0747cf9c7a5	6273	Marezige
00050000-5591-5976-cad5-10350faf4e6b	2000	Maribor 
00050000-5591-5976-7822-4ce80eb1af55	2001	Maribor - poštni predali
00050000-5591-5976-5428-ade17b20f9f6	2206	Marjeta na Dravskem polju
00050000-5591-5976-193a-23f515aacdb0	2281	Markovci
00050000-5591-5976-6436-87a3719d6ead	9221	Martjanci
00050000-5591-5976-ca12-2878ccc19c98	6242	Materija
00050000-5591-5976-ab88-ea4f354df2ef	4211	Mavčiče
00050000-5591-5976-1dcd-7e3ac0259db2	1215	Medvode
00050000-5591-5976-94c3-a78ff8fcf7e4	1234	Mengeš
00050000-5591-5976-a09c-651e8fe8bff9	8330	Metlika
00050000-5591-5976-03b4-b26aa3e093f4	2392	Mežica
00050000-5591-5976-18ad-f14980563032	2204	Miklavž na Dravskem polju
00050000-5591-5976-21ac-1c574995851c	2275	Miklavž pri Ormožu
00050000-5591-5976-8173-cfffac24e778	5291	Miren
00050000-5591-5976-dcd6-4efeebe50890	8233	Mirna
00050000-5591-5976-9ff3-0fd95687a8fa	8216	Mirna Peč
00050000-5591-5976-6bb4-e01ef33b6fa9	2382	Mislinja
00050000-5591-5976-7495-a193fec7cda5	4281	Mojstrana
00050000-5591-5976-739c-4957a3bd466d	8230	Mokronog
00050000-5591-5976-c301-5ae7936b18bf	1251	Moravče
00050000-5591-5976-b6b6-31084ca06c42	9226	Moravske Toplice
00050000-5591-5976-77cf-a09dcd3c69c4	5216	Most na Soči
00050000-5591-5976-37ea-0fd82cc120f8	1221	Motnik
00050000-5591-5976-6030-2f3bc8cf3af9	3330	Mozirje
00050000-5591-5976-1cf5-c6ac0615e950	9000	Murska Sobota 
00050000-5591-5976-26df-544dc5c51bfe	9001	Murska Sobota - poštni predali
00050000-5591-5976-e19b-a5e24afa8216	2366	Muta
00050000-5591-5976-dbfd-99c5d446e11f	4202	Naklo
00050000-5591-5976-7dae-0d45fcd0db9c	3331	Nazarje
00050000-5591-5976-81e7-881c4206e437	1357	Notranje Gorice
00050000-5591-5976-7334-5cead14973bd	3203	Nova Cerkev
00050000-5591-5976-5832-e05d8a299ad9	5000	Nova Gorica 
00050000-5591-5976-b94e-ec1cbf8d86ea	5001	Nova Gorica - poštni predali
00050000-5591-5976-4f97-c4b95e4e1ae5	1385	Nova vas
00050000-5591-5976-da15-40432dc10109	8000	Novo mesto
00050000-5591-5976-5f78-730ea63698d6	8001	Novo mesto - poštni predali
00050000-5591-5976-71d7-cf5b9220a316	6243	Obrov
00050000-5591-5976-95a2-c044ec2abe20	9233	Odranci
00050000-5591-5976-4c81-f9a776289ab2	2317	Oplotnica
00050000-5591-5976-fb45-0540b523cc75	2312	Orehova vas
00050000-5591-5976-afa6-ae52731fd411	2270	Ormož
00050000-5591-5976-fd69-83e0d911c691	1316	Ortnek
00050000-5591-5976-5de5-d866d1a26c0e	1337	Osilnica
00050000-5591-5976-865a-4393abcf91c9	8222	Otočec
00050000-5591-5976-702d-87e2a835042b	2361	Ožbalt
00050000-5591-5976-5ef3-67149f654da4	2231	Pernica
00050000-5591-5976-02b6-e5f8683da494	2211	Pesnica pri Mariboru
00050000-5591-5976-2f2a-0d61b0d209b2	9203	Petrovci
00050000-5591-5976-e588-8ca417a90e74	3301	Petrovče
00050000-5591-5976-8d86-d6f05f4a5163	6330	Piran/Pirano
00050000-5591-5976-4467-b767ef910f5d	8255	Pišece
00050000-5591-5976-0e4c-9961bdb6d41d	6257	Pivka
00050000-5591-5976-6c5a-6094002512db	6232	Planina
00050000-5591-5976-0380-e5ef3f797146	3225	Planina pri Sevnici
00050000-5591-5976-f56a-817eb79b89c8	6276	Pobegi
00050000-5591-5976-06c0-ef401b8ea3bd	8312	Podbočje
00050000-5591-5976-2737-8636041a8c5b	5243	Podbrdo
00050000-5591-5976-c001-ea4bf92b5db5	3254	Podčetrtek
00050000-5591-5976-7dc1-dfbfce45cd3f	2273	Podgorci
00050000-5591-5976-f8a2-90c9f87a0d5d	6216	Podgorje
00050000-5591-5976-2b54-8bc1620db9b4	2381	Podgorje pri Slovenj Gradcu
00050000-5591-5976-7322-79aae69d88d0	6244	Podgrad
00050000-5591-5976-6331-07aaf50ceba6	1414	Podkum
00050000-5591-5976-3cc4-455cf987b683	2286	Podlehnik
00050000-5591-5976-4933-275217128d67	5272	Podnanos
00050000-5591-5976-cbed-550be7150771	4244	Podnart
00050000-5591-5976-c1fd-7bd9984249d9	3241	Podplat
00050000-5591-5976-24a8-85b9766edf52	3257	Podsreda
00050000-5591-5976-9725-cce641981bfc	2363	Podvelka
00050000-5591-5976-d3a3-940849a56ba8	2208	Pohorje
00050000-5591-5976-2bb8-fe3d0467e693	2257	Polenšak
00050000-5591-5976-941f-c70996654cbf	1355	Polhov Gradec
00050000-5591-5976-49e4-87080a70a5c8	4223	Poljane nad Škofjo Loko
00050000-5591-5976-2daa-44f2a09f096c	2319	Poljčane
00050000-5591-5976-df79-a7673af9e0bc	1272	Polšnik
00050000-5591-5976-4d99-efc953a4c34a	3313	Polzela
00050000-5591-5976-b507-e222c9aabc4e	3232	Ponikva
00050000-5591-5976-e8e0-d115566fb4ba	6320	Portorož/Portorose
00050000-5591-5976-41bb-7e3c708a4bd6	6230	Postojna
00050000-5591-5976-473f-0048ebbfda8d	2331	Pragersko
00050000-5591-5976-eb3f-60085bda8ef5	3312	Prebold
00050000-5591-5976-eaf0-d36a75d74667	4205	Preddvor
00050000-5591-5976-58eb-c82dc669f3e2	6255	Prem
00050000-5591-5976-3621-027d5679e0bc	1352	Preserje
00050000-5591-5976-d3cb-63a200455c63	6258	Prestranek
00050000-5591-5976-b404-a96429b43065	2391	Prevalje
00050000-5591-5976-ba69-299435ee1f8d	3262	Prevorje
00050000-5591-5976-6881-5469f0a44c56	1276	Primskovo 
00050000-5591-5976-b7f6-99bdeb05a3ce	3253	Pristava pri Mestinju
00050000-5591-5976-7c6a-8249f37ddfc7	9207	Prosenjakovci/Partosfalva
00050000-5591-5976-60df-a386d755a15b	5297	Prvačina
00050000-5591-5976-49a0-7b6627f57b8b	2250	Ptuj
00050000-5591-5976-cdbd-a859e156cfbc	2323	Ptujska Gora
00050000-5591-5976-24c2-f149934daa11	9201	Puconci
00050000-5591-5976-7f25-43b2e16df3da	2327	Rače
00050000-5591-5976-7a05-f6001a3c2d63	1433	Radeče
00050000-5591-5976-d833-102d6fba011f	9252	Radenci
00050000-5591-5976-a3b7-abc90ecaa6b6	2360	Radlje ob Dravi
00050000-5591-5976-c4c4-f99f2320f8c4	1235	Radomlje
00050000-5591-5976-ba85-2812787d269e	4240	Radovljica
00050000-5591-5976-ce8f-b0ae89246ddd	8274	Raka
00050000-5591-5976-599b-f4df1d0b7e5b	1381	Rakek
00050000-5591-5976-cafb-dcc803749f45	4283	Rateče - Planica
00050000-5591-5976-fe1f-f295c2b631a9	2390	Ravne na Koroškem
00050000-5591-5976-ec9b-11186e38ca7b	9246	Razkrižje
00050000-5591-5976-ab35-0dda67dc4dac	3332	Rečica ob Savinji
00050000-5591-5976-4292-1659d5ec7266	5292	Renče
00050000-5591-5976-6a46-6f7da32e0d2e	1310	Ribnica
00050000-5591-5976-333e-98157c6ff931	2364	Ribnica na Pohorju
00050000-5591-5976-ce59-1e1e0e0ff0b4	3272	Rimske Toplice
00050000-5591-5976-90bc-ef51d218a6bd	1314	Rob
00050000-5591-5976-749d-6a631c31dfaa	5215	Ročinj
00050000-5591-5976-ac0a-d4a51cc75989	3250	Rogaška Slatina
00050000-5591-5976-91f0-3509d777fd64	9262	Rogašovci
00050000-5591-5976-0716-eec359f8c25b	3252	Rogatec
00050000-5591-5976-1fa5-ae5491ec650b	1373	Rovte
00050000-5591-5976-8aac-8f9a89db3ee9	2342	Ruše
00050000-5591-5976-26ac-625a0b9865ec	1282	Sava
00050000-5591-5976-ab43-feb944c4e3b4	6333	Sečovlje/Sicciole
00050000-5591-5976-2b3f-38baa994e87e	4227	Selca
00050000-5591-5976-1434-e4368f2a68bc	2352	Selnica ob Dravi
00050000-5591-5976-0469-5044fe4c83b3	8333	Semič
00050000-5591-5976-dc0f-8372bc36aead	8281	Senovo
00050000-5591-5976-ccc0-9c10f620971e	6224	Senožeče
00050000-5591-5976-fedb-9b7039e17116	8290	Sevnica
00050000-5591-5976-f010-33ac2dff05ae	6210	Sežana
00050000-5591-5976-7bc5-b415f4fc4f4d	2214	Sladki Vrh
00050000-5591-5976-fcf3-fd1ae2251597	5283	Slap ob Idrijci
00050000-5591-5976-d154-e41f4b831632	2380	Slovenj Gradec
00050000-5591-5976-63ed-7e2d53ca7a83	2310	Slovenska Bistrica
00050000-5591-5976-210b-25ab404778fb	3210	Slovenske Konjice
00050000-5591-5976-707f-4f3013aeacc8	1216	Smlednik
00050000-5591-5976-8b78-f467a4642262	5232	Soča
00050000-5591-5976-50a3-6a69ae94c058	1317	Sodražica
00050000-5591-5976-b76e-c9a1fface09b	3335	Solčava
00050000-5591-5976-29c9-54bac0658f9e	5250	Solkan
00050000-5591-5976-7e9e-0c1dced7dcb7	4229	Sorica
00050000-5591-5976-e05f-625b270d05af	4225	Sovodenj
00050000-5591-5976-4368-8024d2c6924d	5281	Spodnja Idrija
00050000-5591-5976-47c1-cb2ee5c1e1ea	2241	Spodnji Duplek
00050000-5591-5976-d6e3-0f232ca7f083	9245	Spodnji Ivanjci
00050000-5591-5976-53b6-8d8564c0da37	2277	Središče ob Dravi
00050000-5591-5976-c0a8-6a3538be2ce3	4267	Srednja vas v Bohinju
00050000-5591-5976-8e56-3938daf44b17	8256	Sromlje 
00050000-5591-5976-3265-272b032d45a2	5224	Srpenica
00050000-5591-5976-395c-d7b72bc1778e	1242	Stahovica
00050000-5591-5976-2cde-262aaed4cef4	1332	Stara Cerkev
00050000-5591-5976-76c2-1fb256304773	8342	Stari trg ob Kolpi
00050000-5591-5976-06b9-8022ae97b6f7	1386	Stari trg pri Ložu
00050000-5591-5976-0f0e-b082f3996e7c	2205	Starše
00050000-5591-5976-1c1c-b8cb717cbbc4	2289	Stoperce
00050000-5591-5976-4b90-32cf8735cbaa	8322	Stopiče
00050000-5591-5976-c219-b435a9e1ea1b	3206	Stranice
00050000-5591-5976-abcf-cf4b6da2b3fb	8351	Straža
00050000-5591-5976-28ae-8d7f8a0328bc	1313	Struge
00050000-5591-5976-68e3-e3dad9bbe55b	8293	Studenec
00050000-5591-5976-3c31-93c21fff0ee1	8331	Suhor
00050000-5591-5976-17fa-2d3027acf443	2233	Sv. Ana v Slovenskih goricah
00050000-5591-5976-a94e-22b2c263e210	2235	Sv. Trojica v Slovenskih goricah
00050000-5591-5976-691d-449cf4a22a08	2353	Sveti Duh na Ostrem Vrhu
00050000-5591-5976-952f-b2d634145e28	9244	Sveti Jurij ob Ščavnici
00050000-5591-5976-cbc0-9879f3dc8598	3264	Sveti Štefan
00050000-5591-5976-4130-5afe58d14af6	2258	Sveti Tomaž
00050000-5591-5976-6a54-e1bb66f099ba	9204	Šalovci
00050000-5591-5976-0f04-61b0145d45a0	5261	Šempas
00050000-5591-5976-c359-dee71dea1fee	5290	Šempeter pri Gorici
00050000-5591-5976-0ecb-65c1306b9aec	3311	Šempeter v Savinjski dolini
00050000-5591-5976-abd1-a3739f697eaf	4208	Šenčur
00050000-5591-5976-f807-d643640b7e3d	2212	Šentilj v Slovenskih goricah
00050000-5591-5976-8738-06fc07da77a7	8297	Šentjanž
00050000-5591-5976-6b98-5a3587a2cc73	2373	Šentjanž pri Dravogradu
00050000-5591-5976-115b-c75373019ac9	8310	Šentjernej
00050000-5591-5976-42c4-e0505af83f7d	3230	Šentjur
00050000-5591-5976-3c5b-b8525318087e	3271	Šentrupert
00050000-5591-5976-8a15-e91b9bfe0a5e	8232	Šentrupert
00050000-5591-5976-43a4-a10df9167ef0	1296	Šentvid pri Stični
00050000-5591-5976-d5cf-b2ab77737064	8275	Škocjan
00050000-5591-5976-fd8c-9b265b2e60b8	6281	Škofije
00050000-5591-5976-b220-49b268c82aba	4220	Škofja Loka
00050000-5591-5976-7878-896fe10dc54e	3211	Škofja vas
00050000-5591-5976-8c2e-6912883a008a	1291	Škofljica
00050000-5591-5976-17e3-b681217a1657	6274	Šmarje
00050000-5591-5976-5d50-b885773d95c0	1293	Šmarje - Sap
00050000-5591-5976-9651-2dc741ceb55d	3240	Šmarje pri Jelšah
00050000-5591-5976-449d-57c132671526	8220	Šmarješke Toplice
00050000-5591-5976-1a78-6ed12da20bcb	2315	Šmartno na Pohorju
00050000-5591-5976-cddf-458a0976239f	3341	Šmartno ob Dreti
00050000-5591-5976-8c89-acb34618159b	3327	Šmartno ob Paki
00050000-5591-5976-31d3-2eee261a5ac8	1275	Šmartno pri Litiji
00050000-5591-5976-595d-cdc8161ee528	2383	Šmartno pri Slovenj Gradcu
00050000-5591-5976-4b08-96712606e3e3	3201	Šmartno v Rožni dolini
00050000-5591-5976-ad11-b8167d8be010	3325	Šoštanj
00050000-5591-5976-8df8-70156d66dbf7	6222	Štanjel
00050000-5591-5976-56ac-a958bfffc109	3220	Štore
00050000-5591-5976-f6de-328b480ac860	3304	Tabor
00050000-5591-5976-6bdf-fc0b64d53044	3221	Teharje
00050000-5591-5976-ba09-61a6fdc9128b	9251	Tišina
00050000-5591-5976-8c92-de927398c9e7	5220	Tolmin
00050000-5591-5976-a6a4-2aeb7eb3c58b	3326	Topolšica
00050000-5591-5976-0b8f-79d7dcd62ad1	2371	Trbonje
00050000-5591-5976-77f6-279534533c49	1420	Trbovlje
00050000-5591-5976-b95d-4164b0e54961	8231	Trebelno 
00050000-5591-5976-10ae-1b2d069e68e7	8210	Trebnje
00050000-5591-5976-a093-f4ff90034708	5252	Trnovo pri Gorici
00050000-5591-5976-cea1-b5b86a0ab8dd	2254	Trnovska vas
00050000-5591-5976-45eb-d92859aac2e8	1222	Trojane
00050000-5591-5976-5f05-9fb38914f50d	1236	Trzin
00050000-5591-5976-fa54-af060885bb62	4290	Tržič
00050000-5591-5976-1a05-1a2f50db117c	8295	Tržišče
00050000-5591-5976-1ed0-e02b2a5b84fb	1311	Turjak
00050000-5591-5976-faa0-1b7ebeaccf1c	9224	Turnišče
00050000-5591-5976-0442-92a720d5706a	8323	Uršna sela
00050000-5591-5976-0b8d-ee0579d5960d	1252	Vače
00050000-5591-5976-8419-a3f0066f970b	3320	Velenje 
00050000-5591-5976-4247-8df48d5fa8a9	3322	Velenje - poštni predali
00050000-5591-5976-2fc8-7a5419a02960	8212	Velika Loka
00050000-5591-5976-17e8-09e48111adf0	2274	Velika Nedelja
00050000-5591-5976-8e88-6f32133b1ce0	9225	Velika Polana
00050000-5591-5976-076f-2043eddfa8e2	1315	Velike Lašče
00050000-5591-5976-9a8e-46b078a5d3a4	8213	Veliki Gaber
00050000-5591-5976-0b59-49feb2f3202e	9241	Veržej
00050000-5591-5976-655f-37ba9c4c50c6	1312	Videm - Dobrepolje
00050000-5591-5976-f922-8affacbfb204	2284	Videm pri Ptuju
00050000-5591-5976-4261-da39a2f71d92	8344	Vinica
00050000-5591-5976-cd29-68a6ce806f9d	5271	Vipava
00050000-5591-5976-70c8-ceaa287ea610	4212	Visoko
00050000-5591-5976-34d1-d266ad759ea8	1294	Višnja Gora
00050000-5591-5976-223c-350c097f8b96	3205	Vitanje
00050000-5591-5976-4710-83d11f70dd15	2255	Vitomarci
00050000-5591-5976-e0c4-1e60f3d30e41	1217	Vodice
00050000-5591-5976-1ff5-1a1f70f76bc2	3212	Vojnik\t
00050000-5591-5976-89c1-59ad1d9e0ce4	5293	Volčja Draga
00050000-5591-5976-c5cb-0aee0b49a136	2232	Voličina
00050000-5591-5976-c540-6932032b5503	3305	Vransko
00050000-5591-5976-6552-f74876384468	6217	Vremski Britof
00050000-5591-5976-8c05-427cc355df72	1360	Vrhnika
00050000-5591-5976-62be-1b132ec68178	2365	Vuhred
00050000-5591-5976-dae4-a906f4cbc6a9	2367	Vuzenica
00050000-5591-5976-90fd-c9adb028cc88	8292	Zabukovje 
00050000-5591-5976-a016-d65866b26663	1410	Zagorje ob Savi
00050000-5591-5976-63dc-dba06bab0046	1303	Zagradec
00050000-5591-5976-2bf8-fe3e0395db0f	2283	Zavrč
00050000-5591-5976-3236-37d6c1b5a6c0	8272	Zdole 
00050000-5591-5976-ecca-99bafff4b69e	4201	Zgornja Besnica
00050000-5591-5976-8d7e-3522a9afd878	2242	Zgornja Korena
00050000-5591-5976-2593-b7549491431e	2201	Zgornja Kungota
00050000-5591-5976-0fed-172383f9c202	2316	Zgornja Ložnica
00050000-5591-5976-4539-b03a2dd92e42	2314	Zgornja Polskava
00050000-5591-5976-d8ce-29d71efed0c3	2213	Zgornja Velka
00050000-5591-5976-0478-c58ec168c468	4247	Zgornje Gorje
00050000-5591-5976-a73c-be08d816b2e6	4206	Zgornje Jezersko
00050000-5591-5976-2d83-c8d29e945e6a	2285	Zgornji Leskovec
00050000-5591-5976-c01d-29fb45bebe12	1432	Zidani Most
00050000-5591-5976-db11-2d416bfeaf91	3214	Zreče
00050000-5591-5976-1b44-76aeeddc2f30	4209	Žabnica
00050000-5591-5976-b705-f936ab785308	3310	Žalec
00050000-5591-5976-55b7-5d9ebdb2299d	4228	Železniki
00050000-5591-5976-91e2-e11a41d68be9	2287	Žetale
00050000-5591-5976-561a-7ff561f59217	4226	Žiri
00050000-5591-5976-ee87-5e48416cae47	4274	Žirovnica
00050000-5591-5976-65e8-c5ba4ffd6b73	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8444789)
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
-- TOC entry 2859 (class 0 OID 8444600)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8444678)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8444801)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8444921)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8444970)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5591-5978-e4e3-3eabda221122	00080000-5591-5978-9be5-af65a5de8ba0	0900	AK
00190000-5591-5978-cb5e-0d46f965c8a3	00080000-5591-5977-7aa6-1f89621367c6	0987	A
00190000-5591-5978-f0ee-066c69de77ed	00080000-5591-5977-d448-7a7c9b254b55	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8445104)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stponprem, stprej, stgostuj, stostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
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
-- TOC entry 2883 (class 0 OID 8444830)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5591-5977-e6a8-16922f7568be	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5591-5977-54e2-be83dc31578d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5591-5977-1e5c-9aa67a8b1e96	0003	Kazinska	t	84	Kazinska dvorana
00220000-5591-5977-7d78-7cfd4a05ccda	0004	Mali oder	t	24	Mali oder 
00220000-5591-5977-1cb8-028e45cd595f	0005	Komorni oder	t	15	Komorni oder
00220000-5591-5977-ce6c-afb371c72712	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5591-5977-d53b-98c282795b52	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8444774)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8444764)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8444959)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8444898)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8444472)
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
-- TOC entry 2884 (class 0 OID 8444840)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8444510)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5591-5976-20d9-fb2a1fe6a4b0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5591-5976-0015-b440ed6caa32	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5591-5976-2a9d-f36854227414	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5591-5976-865b-79c915fb15ee	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5591-5976-375c-5ca1b622a619	planer	Planer dogodkov v koledarju	t
00020000-5591-5976-a3bd-eeea5925c65c	kadrovska	Kadrovska služba	t
00020000-5591-5976-c4c4-13b7b465a079	arhivar	Ažuriranje arhivalij	t
00020000-5591-5976-0b4f-fdbaea2993fe	igralec	Igralec	t
00020000-5591-5976-dbeb-128aabf904d7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5591-5978-7ab3-a40ed6457676	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8444494)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5591-5976-6c53-f0f22e9ee7cc	00020000-5591-5976-2a9d-f36854227414
00010000-5591-5976-fa3b-8be819e5bfa3	00020000-5591-5976-2a9d-f36854227414
00010000-5591-5978-cf06-f035716d1022	00020000-5591-5978-7ab3-a40ed6457676
\.


--
-- TOC entry 2886 (class 0 OID 8444854)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8444795)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8444745)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8445154)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5591-5977-584c-945f8bcf6940	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5591-5977-1eee-36ec2ca3d240	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5591-5977-df80-0dcb56b5431f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5591-5977-6c36-b53eccdc94e7	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5591-5977-8920-4875d2dbb693	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8445146)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5591-5977-ea2b-811b35588059	00230000-5591-5977-6c36-b53eccdc94e7	popa
00240000-5591-5977-b628-5ba5119172c9	00230000-5591-5977-6c36-b53eccdc94e7	oseba
00240000-5591-5977-e1d9-c2ff74cb47d4	00230000-5591-5977-1eee-36ec2ca3d240	prostor
00240000-5591-5977-5d11-a6aead831e9b	00230000-5591-5977-6c36-b53eccdc94e7	besedilo
00240000-5591-5977-d759-188c39ff6c5b	00230000-5591-5977-6c36-b53eccdc94e7	uprizoritev
00240000-5591-5977-726d-a0e91557c119	00230000-5591-5977-6c36-b53eccdc94e7	funkcija
00240000-5591-5977-c2b5-380296928678	00230000-5591-5977-6c36-b53eccdc94e7	tipfunkcije
00240000-5591-5977-e1a2-ef7257d25e09	00230000-5591-5977-6c36-b53eccdc94e7	alternacija
00240000-5591-5977-bbc8-7895b759f1ea	00230000-5591-5977-584c-945f8bcf6940	pogodba
00240000-5591-5977-0855-004e7659688f	00230000-5591-5977-6c36-b53eccdc94e7	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8445141)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8444908)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5591-5978-799d-4afe3b825496	000e0000-5591-5978-8eb4-2bb17e90f778	00080000-5591-5977-9374-4b42c9e87d45	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5591-5978-dff4-cd880ef4463a	000e0000-5591-5978-8eb4-2bb17e90f778	00080000-5591-5977-9374-4b42c9e87d45	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5591-5978-bccc-1303b23d8a6e	000e0000-5591-5978-8eb4-2bb17e90f778	00080000-5591-5977-a2a8-be3ec78f48fe	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8444572)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8444751)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5591-5978-fd0a-1246029d91a1	00180000-5591-5978-829e-8d147ddb7888	000c0000-5591-5978-75b6-21b6e30a4b3f	00090000-5591-5978-d6ed-d55f868f3f7c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5978-2112-7bdec04e3394	00180000-5591-5978-829e-8d147ddb7888	000c0000-5591-5978-6c62-ce47c2d86682	00090000-5591-5978-d0f5-679c2498daa2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5978-df8f-a67af2e2b5ac	00180000-5591-5978-829e-8d147ddb7888	000c0000-5591-5978-606a-660d40668c8e	00090000-5591-5978-33b2-30a45ab539a4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5978-f225-8f6efb1af48e	00180000-5591-5978-829e-8d147ddb7888	000c0000-5591-5978-10c4-d4c2c7720a33	00090000-5591-5978-4c4b-93df40243e82	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5978-773a-40237b963fac	00180000-5591-5978-829e-8d147ddb7888	000c0000-5591-5978-7bb1-36eabfa7f98a	00090000-5591-5978-04bd-08d1438a7569	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-5978-9196-f92a8756e4f4	00180000-5591-5978-9db7-dcbc6fa3b342	\N	00090000-5591-5978-04bd-08d1438a7569	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8444948)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5591-5977-311d-d19ace978dda	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5591-5977-d4b1-f13c2511661b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5591-5977-7d27-fd632f7a00ee	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5591-5977-1f29-f5b63760d8b8	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5591-5977-c28a-908cbd032431	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5591-5977-cab6-23ab0ed592b8	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5591-5977-77b4-e5021090fc24	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5591-5977-1866-d2ac6f545680	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5591-5977-a63f-f15a0724b8fc	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5591-5977-327b-d4c719928f63	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5591-5977-e841-971cbbe31b8b	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5591-5977-7755-5e60cee9249f	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5591-5977-0d73-9e3c7684c5b2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5591-5977-9b00-2ad0844bcaab	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5591-5977-be22-ae7298ee0d4c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5591-5977-442c-776a4396bf72	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8445123)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5591-5977-e16a-b0e73e4449e6	01	Velika predstava	f	1.00	1.00
002b0000-5591-5977-9407-2763dc90c805	02	Mala predstava	f	0.50	0.50
002b0000-5591-5977-c426-168f933bfe5e	03	Mala koprodukcija	t	0.40	1.00
002b0000-5591-5977-c852-d6b28d16b503	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5591-5977-5ce4-0a28cad22832	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8444635)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8444481)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5591-5976-fa3b-8be819e5bfa3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRORnOSDtI3yuiDxIqGvwyWrarQY4lv1Ty	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5591-5978-9e45-397bd1f45f62	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5591-5978-57c3-29c3bbdd4e87	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5591-5978-ab91-4c63b0d3b585	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5591-5978-f0e8-d345d7b70ae8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5591-5978-5b50-28fe7f1a7104	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5591-5978-5b59-705c9ada6eb1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5591-5978-a260-91e0bb6d6a5b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5591-5978-716b-ba53ac975f02	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5591-5978-ac76-8cd477b32a53	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5591-5978-cf06-f035716d1022	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5591-5976-6c53-f0f22e9ee7cc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8445005)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5591-5978-500d-c5b08d5d897e	00160000-5591-5977-d925-c7be6fd3299b	00150000-5591-5977-4700-f9d6ff779918	00140000-5591-5975-0227-542419297462	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5591-5977-1cb8-028e45cd595f
000e0000-5591-5978-8eb4-2bb17e90f778	00160000-5591-5977-8bec-0aabd7fa504c	00150000-5591-5977-ac2c-2161975c1359	00140000-5591-5975-e05d-d6260e421e90	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5591-5977-ce6c-afb371c72712
000e0000-5591-5978-e741-bce2862954e6	\N	00150000-5591-5977-ac2c-2161975c1359	00140000-5591-5975-e05d-d6260e421e90	00190000-5591-5978-cb5e-0d46f965c8a3	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5591-5977-1cb8-028e45cd595f
000e0000-5591-5978-ff51-fc93f28448d4	\N	00150000-5591-5977-ac2c-2161975c1359	00140000-5591-5975-e05d-d6260e421e90	00190000-5591-5978-cb5e-0d46f965c8a3	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5591-5977-1cb8-028e45cd595f
\.


--
-- TOC entry 2867 (class 0 OID 8444697)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5591-5978-48e7-5684a5620dc6	000e0000-5591-5978-8eb4-2bb17e90f778	1	
00200000-5591-5978-8bca-15e92e1e6897	000e0000-5591-5978-8eb4-2bb17e90f778	2	
\.


--
-- TOC entry 2882 (class 0 OID 8444822)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8444891)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8444729)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8444995)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5591-5975-0227-542419297462	01	Drama	drama (SURS 01)
00140000-5591-5975-ee8d-c4a4c76d0c0e	02	Opera	opera (SURS 02)
00140000-5591-5975-cde4-54fc5e16bb95	03	Balet	balet (SURS 03)
00140000-5591-5975-d77f-ade457753444	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5591-5975-3709-c71eefd3d43e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5591-5975-e05d-d6260e421e90	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5591-5975-570c-4534d443ee11	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8444881)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5591-5977-9575-817acb392eec	01	Opera	opera
00150000-5591-5977-1980-255fa8b9693d	02	Opereta	opereta
00150000-5591-5977-df1b-8ee1fe22ad2f	03	Balet	balet
00150000-5591-5977-db9e-6de3311921c3	04	Plesne prireditve	plesne prireditve
00150000-5591-5977-f635-9b991236c77d	05	Lutkovno gledališče	lutkovno gledališče
00150000-5591-5977-3721-f55036d6cf4f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5591-5977-abe2-efbd4a644b1c	07	Biografska drama	biografska drama
00150000-5591-5977-4700-f9d6ff779918	08	Komedija	komedija
00150000-5591-5977-e2f0-c7d29890cb73	09	Črna komedija	črna komedija
00150000-5591-5977-7037-a01070d8d0b7	10	E-igra	E-igra
00150000-5591-5977-ac2c-2161975c1359	11	Kriminalka	kriminalka
00150000-5591-5977-9695-7a0d31b4b12e	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8444535)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8445052)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8445042)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8444947)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8444719)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8444744)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8445139)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8444661)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8445099)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8444877)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8444695)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8444738)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8444675)
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
-- TOC entry 2533 (class 2606 OID 8444787)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8444814)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8444633)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8444544)
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
-- TOC entry 2448 (class 2606 OID 8444568)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8444524)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8444509)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8444820)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8444853)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8444990)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8444597)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8444621)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8444793)
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
-- TOC entry 2463 (class 2606 OID 8444611)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8444682)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8444805)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8444929)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8444975)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8445121)
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
-- TOC entry 2553 (class 2606 OID 8444837)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8444778)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8444769)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8444969)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8444905)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8444480)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8444844)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8444498)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8444518)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8444862)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8444800)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8444750)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8445163)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8445151)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8445145)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8444918)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8444577)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8444760)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8444958)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8445133)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8444646)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8444493)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8445021)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8444704)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8444828)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8444896)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8444733)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8445003)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8444889)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8444726)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8444919)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8444920)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8444599)
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
-- TOC entry 2546 (class 1259 OID 8444821)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8444807)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8444806)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8444705)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8444878)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8444880)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8444879)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8444677)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8444676)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8444992)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8444993)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8444994)
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
-- TOC entry 2608 (class 1259 OID 8445026)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8445023)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8445027)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8445025)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8445024)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8444648)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8444647)
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
-- TOC entry 2446 (class 1259 OID 8444571)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8444845)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8444739)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8444525)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8444526)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8444865)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8444864)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8444863)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8444683)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8444685)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8444684)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8445153)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8444773)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8444771)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8444770)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8444772)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8444499)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8444500)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8444829)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8444794)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8444906)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8444907)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8445103)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8445100)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8445101)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8445102)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8444613)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8444612)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8444614)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8444930)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8444931)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8445056)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8445057)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8445054)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8445055)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8444897)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8444782)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8444781)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8444779)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8444780)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8445044)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8445043)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8445122)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8444696)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8445140)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8444546)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8444545)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8444578)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8444579)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8444763)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8444762)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8444761)
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
-- TOC entry 2498 (class 1259 OID 8444728)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8444724)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8444721)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8444722)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8444720)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8444725)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8444723)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8444598)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8444662)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8444664)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8444663)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8444665)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8444788)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8444991)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8445022)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8444569)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8444570)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8444890)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8445164)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8444634)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8445152)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8444839)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8444838)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8445053)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8444622)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8445004)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8444976)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8444977)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8444519)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8444727)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8445300)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8445285)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8445290)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8445310)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8445280)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8445305)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8445295)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8445455)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8445460)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8445215)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8445395)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8445390)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8445385)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8445275)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8445425)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8445435)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8445430)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8445250)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8445245)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8445375)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8445480)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8445485)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8445490)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8445510)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8445495)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8445515)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8445505)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8445500)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8445240)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8445235)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8445200)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8445195)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8445405)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8445315)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8445175)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8445180)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8445420)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8445415)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8445410)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8445255)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8445265)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8445260)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8445580)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8445350)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8445340)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8445335)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8445345)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8445165)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8445170)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8445400)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8445380)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8445445)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8445450)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8445565)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8445550)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8445555)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8445560)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8445225)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8445220)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8445230)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8445465)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8445470)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8445540)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8445545)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8445530)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8445535)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8445440)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8445370)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8445365)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8445355)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8445360)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8445525)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8445520)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8445570)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8445270)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8445475)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8445575)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8445190)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8445185)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8445205)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8445210)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8445330)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8445325)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8445320)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 16:43:05 CEST

--
-- PostgreSQL database dump complete
--

