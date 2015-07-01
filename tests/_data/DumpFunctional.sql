--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-01 09:05:14 CEST

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
-- TOC entry 183 (class 1259 OID 8614056)
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
-- TOC entry 230 (class 1259 OID 8614574)
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
-- TOC entry 229 (class 1259 OID 8614557)
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
-- TOC entry 222 (class 1259 OID 8614461)
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
-- TOC entry 197 (class 1259 OID 8614235)
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
-- TOC entry 200 (class 1259 OID 8614269)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8614663)
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
-- TOC entry 192 (class 1259 OID 8614178)
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
-- TOC entry 231 (class 1259 OID 8614587)
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
-- TOC entry 216 (class 1259 OID 8614395)
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
-- TOC entry 195 (class 1259 OID 8614215)
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
-- TOC entry 199 (class 1259 OID 8614263)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8614195)
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
-- TOC entry 205 (class 1259 OID 8614312)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8614337)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8614152)
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
-- TOC entry 184 (class 1259 OID 8614065)
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
-- TOC entry 185 (class 1259 OID 8614076)
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
-- TOC entry 180 (class 1259 OID 8614030)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8614049)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8614344)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8614375)
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
-- TOC entry 226 (class 1259 OID 8614507)
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
-- TOC entry 187 (class 1259 OID 8614109)
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
-- TOC entry 189 (class 1259 OID 8614144)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8614318)
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
-- TOC entry 188 (class 1259 OID 8614129)
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
-- TOC entry 194 (class 1259 OID 8614207)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8614330)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8614450)
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
-- TOC entry 225 (class 1259 OID 8614499)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8614633)
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
-- TOC entry 212 (class 1259 OID 8614359)
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
-- TOC entry 204 (class 1259 OID 8614303)
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
-- TOC entry 203 (class 1259 OID 8614293)
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
-- TOC entry 224 (class 1259 OID 8614488)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8614427)
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
-- TOC entry 177 (class 1259 OID 8614001)
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
-- TOC entry 176 (class 1259 OID 8613999)
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
-- TOC entry 213 (class 1259 OID 8614369)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8614039)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8614023)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8614383)
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
-- TOC entry 207 (class 1259 OID 8614324)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8614274)
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
-- TOC entry 237 (class 1259 OID 8614683)
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
-- TOC entry 236 (class 1259 OID 8614675)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8614670)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8614437)
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
-- TOC entry 186 (class 1259 OID 8614101)
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
-- TOC entry 202 (class 1259 OID 8614280)
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
-- TOC entry 223 (class 1259 OID 8614477)
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
-- TOC entry 233 (class 1259 OID 8614652)
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
-- TOC entry 191 (class 1259 OID 8614164)
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
-- TOC entry 178 (class 1259 OID 8614010)
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
-- TOC entry 228 (class 1259 OID 8614534)
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
-- TOC entry 196 (class 1259 OID 8614226)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8614351)
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
-- TOC entry 218 (class 1259 OID 8614420)
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
-- TOC entry 198 (class 1259 OID 8614258)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8614524)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8614410)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8614004)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8614056)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8614574)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5593-912a-5df2-af867ba6da9f	000d0000-5593-912a-3217-cf3500a43756	\N	00090000-5593-9129-1c83-df1dd2834390	000b0000-5593-9129-14df-d86fd4a167e0	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-912a-73b9-d64b069c5e95	000d0000-5593-912a-83d3-98c9dc8adaa9	\N	00090000-5593-9129-7eb0-7d9cd8505896	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-912a-ad84-c1849d1e185b	000d0000-5593-912a-339b-d2a739b7513f	\N	00090000-5593-9129-35bd-4633e0ce5246	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-912a-2086-38b7456332cf	000d0000-5593-912a-fd3f-9991c1756d21	\N	00090000-5593-9129-a654-217fe8b0ee15	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-912a-cbfc-2cb174a985ef	000d0000-5593-912a-1399-5b5338d213d6	\N	00090000-5593-9129-d1a2-0afbb017e5fe	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-912a-7225-f8cfd2c99493	000d0000-5593-912a-5734-b6c4d3d2e92f	\N	00090000-5593-9129-7eb0-7d9cd8505896	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8614557)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8614461)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5593-9129-ab93-996ba32f1bf9	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5593-9129-8b58-31c0bfb354a4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5593-9129-ff12-06eab611fce0	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8614235)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5593-912a-74be-66c7526bd8e5	\N	\N	00200000-5593-912a-0709-9ec041e96dd1	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5593-912a-d2f1-8d8910fab3c8	\N	\N	00200000-5593-912a-8906-b4e06fa757a8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5593-912a-db1d-5f830190013a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5593-912a-8bed-04f2a86dd419	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5593-912a-22f3-eed8b89fb08d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8614269)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8614663)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8614178)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5593-9127-f3f5-b80fab1724c1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5593-9127-9620-5c625e5645ef	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5593-9127-9c5c-1a7bb7a04def	AL	ALB	008	Albania 	Albanija	\N
00040000-5593-9127-0af9-4d10480c7427	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5593-9127-5501-9add051c275a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5593-9127-4bbb-e0ace4e763f0	AD	AND	020	Andorra 	Andora	\N
00040000-5593-9127-b899-6409f81d9aa4	AO	AGO	024	Angola 	Angola	\N
00040000-5593-9127-bf93-1939fbc2a489	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5593-9127-da76-3b67142eb8e2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5593-9127-3177-afd27b465920	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-9127-5018-9f7e6b69c939	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5593-9127-f2f5-30dd47357bf7	AM	ARM	051	Armenia 	Armenija	\N
00040000-5593-9127-b9c2-a86f193ab002	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5593-9127-9074-129edabb62c5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5593-9127-49b2-fe16ce79dec0	AT	AUT	040	Austria 	Avstrija	\N
00040000-5593-9127-3e74-086fc7e3dfc1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5593-9127-e2d2-de89fa50d8a5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5593-9127-f565-d10d8410fa01	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5593-9127-51f3-34f3b68fb8ab	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5593-9127-ec0a-ad3d0d4bbbd0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5593-9127-637a-3848da015ac2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5593-9127-8c3b-2529f747bf07	BE	BEL	056	Belgium 	Belgija	\N
00040000-5593-9127-6985-6da67c44a0b5	BZ	BLZ	084	Belize 	Belize	\N
00040000-5593-9127-2e0c-b197372e1647	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5593-9127-5530-529844971f61	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5593-9127-3bba-0e5e36c8c744	BT	BTN	064	Bhutan 	Butan	\N
00040000-5593-9127-8934-fe540ab42377	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5593-9127-0044-cac2477454e6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5593-9127-3049-83e7cf45d7c4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5593-9127-f31c-2dffe2fe9d56	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5593-9127-8293-e0fd005b87a0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5593-9127-cb5e-1bf70501b662	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5593-9127-07a4-70892d471b6d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5593-9127-4d5f-5f435f8aaca4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5593-9127-9c89-c802b131003b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5593-9127-d4d6-34e0947f2ffb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5593-9127-bd98-a464b555118e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5593-9127-289b-692bfb44fa6a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5593-9127-dc54-7b87213182ab	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5593-9127-b9f4-e816add0ceb2	CA	CAN	124	Canada 	Kanada	\N
00040000-5593-9127-ac9e-22442c50ea45	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5593-9127-70fd-9b307b5f7b3d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5593-9127-9fb5-3dd398a16d17	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5593-9127-46cb-8449a3eb3990	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5593-9127-c466-a9c829ff7a71	CL	CHL	152	Chile 	Čile	\N
00040000-5593-9127-2fe5-52693d4c3354	CN	CHN	156	China 	Kitajska	\N
00040000-5593-9127-6d54-2ab5ae2efe13	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5593-9127-1b36-c73fc4f4d1d5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5593-9127-de20-d6316bbde3ff	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5593-9127-53a1-f69a57244123	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5593-9127-0b64-995c66757c3e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5593-9127-b6b7-6e324630f9fe	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5593-9127-daf9-98f768d9da19	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5593-9127-a9e5-1093b91ae97c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5593-9127-d148-3a5d0d38895a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5593-9127-09b1-7960400a1fa2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5593-9127-1bd4-f53108e982b8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5593-9127-30de-d310cff99625	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5593-9127-4778-1784aa310645	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5593-9127-eb10-5e13bac0282a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5593-9127-51a8-9aaa8eb2eea1	DK	DNK	208	Denmark 	Danska	\N
00040000-5593-9127-b4d9-c5e1784a66de	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5593-9127-ff1e-675e3277853c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-9127-ae3e-a0949c558064	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5593-9127-4bce-f8b5f8117233	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5593-9127-92a5-ee8a51a0569b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5593-9127-30fc-4f7c32122c83	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5593-9127-04b6-fba75fb3ab20	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5593-9128-78b7-0e5936386212	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5593-9128-5c7b-c8a1a333f708	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5593-9128-c8fe-ad84a5b33320	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5593-9128-9bae-5c90ee68ce8b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5593-9128-8e98-92cea4bae763	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5593-9128-ca16-93e2a2e4a948	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5593-9128-da1a-5817c2046abc	FI	FIN	246	Finland 	Finska	\N
00040000-5593-9128-3459-16db195ff356	FR	FRA	250	France 	Francija	\N
00040000-5593-9128-8bd9-814f8349e43c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5593-9128-2b93-7b2a05717774	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5593-9128-faa9-3084d35e1f20	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5593-9128-0896-9e44584c4795	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5593-9128-df28-e8e212a3f7f5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5593-9128-e46e-f218aab4fde7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5593-9128-1591-5f37a1e24dfb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5593-9128-b121-9fe8ed8da324	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5593-9128-0be9-d9a10532313f	GH	GHA	288	Ghana 	Gana	\N
00040000-5593-9128-9601-b3b1c0188eb2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5593-9128-db19-7d195f054927	GR	GRC	300	Greece 	Grčija	\N
00040000-5593-9128-3d95-f448486cf824	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5593-9128-1a5d-86a4823edd52	GD	GRD	308	Grenada 	Grenada	\N
00040000-5593-9128-b502-9cd25353ecdd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5593-9128-e492-70d753bee39b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5593-9128-69a7-05cf7d0f2658	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5593-9128-1aa6-61a29384e4c8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5593-9128-9f86-08578ff9e1a5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5593-9128-52db-06fec5bc8228	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5593-9128-082d-589f0a94e41f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5593-9128-767e-4a0cb0b757e6	HT	HTI	332	Haiti 	Haiti	\N
00040000-5593-9128-3318-95f76993abf4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5593-9128-f939-d426cf4ed5a9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5593-9128-d724-652335e66f7e	HN	HND	340	Honduras 	Honduras	\N
00040000-5593-9128-a99e-4084df930400	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5593-9128-6012-00ca39c8841b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5593-9128-950b-5ea158425fd7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5593-9128-5783-08c80394193d	IN	IND	356	India 	Indija	\N
00040000-5593-9128-16cd-a4d0a24958d4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5593-9128-a02d-40600e8492e3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5593-9128-1baa-53013f038e40	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5593-9128-c1a5-c0afefe0b9e0	IE	IRL	372	Ireland 	Irska	\N
00040000-5593-9128-7cf9-08ec98dda848	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5593-9128-8c4d-e025dc3e955b	IL	ISR	376	Israel 	Izrael	\N
00040000-5593-9128-271e-ce07f26d090d	IT	ITA	380	Italy 	Italija	\N
00040000-5593-9128-b2f2-4983ccced02c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5593-9128-94dd-63ece4467580	JP	JPN	392	Japan 	Japonska	\N
00040000-5593-9128-5a66-43f3405350b1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5593-9128-b508-81c7b7143a46	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5593-9128-41c1-4d16183ea36d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5593-9128-1579-9da263e03f74	KE	KEN	404	Kenya 	Kenija	\N
00040000-5593-9128-f37a-cb765e4fafa5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5593-9128-855f-c0961efe2e3f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5593-9128-06de-1f3a851b44a5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5593-9128-af35-cd9a2f5090ee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5593-9128-6850-9f3408e35411	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5593-9128-c03c-a8b3db2b397d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5593-9128-f08d-beb27d180678	LV	LVA	428	Latvia 	Latvija	\N
00040000-5593-9128-4dfe-e240a1b29006	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5593-9128-98c4-5cd81de8e647	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5593-9128-1725-9d4bdf90eb1b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5593-9128-e915-3eb9ac56c4ee	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5593-9128-7f0b-fc7065aea215	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5593-9128-92e0-a3b3fd2d21b8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5593-9128-21cb-03a08313fc24	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5593-9128-9975-a11c0aaff558	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5593-9128-e49c-14eb0c214e94	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5593-9128-8ce7-ddec502e6e81	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5593-9128-ee78-2d06875c5318	MW	MWI	454	Malawi 	Malavi	\N
00040000-5593-9128-d7fb-b1df293e9a56	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5593-9128-cb3c-a558b0dc43b7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5593-9128-b2ec-8dee797d0601	ML	MLI	466	Mali 	Mali	\N
00040000-5593-9128-a346-09794423b57d	MT	MLT	470	Malta 	Malta	\N
00040000-5593-9128-ac05-faeb2e5b6e76	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5593-9128-b50f-5d390153aa1e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5593-9128-484a-8c84e58a1397	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5593-9128-d7e7-dd16f6434b1c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5593-9128-c6cb-7d24e7cf5975	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5593-9128-ccd4-a2cdbfcdd48f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5593-9128-f344-2fc761849f6e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5593-9128-c1e5-4b4d2a5a1fd2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5593-9128-f517-87afe20d2814	MC	MCO	492	Monaco 	Monako	\N
00040000-5593-9128-0ca0-52f7a61fc343	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5593-9128-94da-748cb250cd49	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5593-9128-33ef-218b6096508e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5593-9128-3a42-cdbd79704f59	MA	MAR	504	Morocco 	Maroko	\N
00040000-5593-9128-b165-caf2c8e621e7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5593-9128-b5a7-9d43e9efcbe2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5593-9128-700a-d2f25c163e3f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5593-9128-fa54-9c6e87cfe863	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5593-9128-1d8f-9d8b930b1c7d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5593-9128-67aa-41584f2f29b3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5593-9128-fca7-959afaee8c6e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5593-9128-2803-546a1c075428	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5593-9128-e0e6-98c22e724e42	NE	NER	562	Niger 	Niger 	\N
00040000-5593-9128-5f0e-fbc57e281896	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5593-9128-b149-c239ebb86b96	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5593-9128-2703-bf5cfc4fc049	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5593-9128-7340-219dcaa0c52e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5593-9128-98f5-53fb85c61efc	NO	NOR	578	Norway 	Norveška	\N
00040000-5593-9128-19de-8c5ba4293db5	OM	OMN	512	Oman 	Oman	\N
00040000-5593-9128-c4f4-2631f20dc26d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5593-9128-43aa-952ef6fbc489	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5593-9128-7e1a-878fc79ef61e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5593-9128-88be-2e798bdbe49a	PA	PAN	591	Panama 	Panama	\N
00040000-5593-9128-6331-f6688536c6fc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5593-9128-f571-f6deb355a270	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5593-9128-bdc3-6bc24c25e242	PE	PER	604	Peru 	Peru	\N
00040000-5593-9128-d00b-3f9298a17024	PH	PHL	608	Philippines 	Filipini	\N
00040000-5593-9128-0a3e-87ecf727b42f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5593-9128-94de-44e8093c0879	PL	POL	616	Poland 	Poljska	\N
00040000-5593-9128-177a-096d14041a17	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5593-9128-42de-f8c685ca7f47	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5593-9128-6555-4fb6c3ee0e42	QA	QAT	634	Qatar 	Katar	\N
00040000-5593-9128-91f6-8245087fa0a1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5593-9128-94df-5acf5109e48b	RO	ROU	642	Romania 	Romunija	\N
00040000-5593-9128-55a2-cfa8d1981714	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5593-9128-8181-f33b0f6f89f2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5593-9128-bdd3-dd39769a9f82	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5593-9128-00e8-fc7b91415bb7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5593-9128-c8ac-75f4e5a0977f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5593-9128-2f97-c505497d6dcf	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5593-9128-24b9-50920aeeb214	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5593-9128-1a6b-b3c5f571a7a4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5593-9128-d132-ff84ea0943cf	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5593-9128-aaea-ac32167568f6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5593-9128-f99f-30ff5357d55e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5593-9128-7a5c-4cd01e7b40c4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5593-9128-91ad-8732d042526f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5593-9128-c0b0-f6162a5ae50b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5593-9128-2a9c-df6e12a04fd9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5593-9128-93fd-d9c47660f19a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5593-9128-ccba-fdb12cdc45ff	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5593-9128-153c-96e272823056	SG	SGP	702	Singapore 	Singapur	\N
00040000-5593-9128-2b96-959178d2d009	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5593-9128-a519-4fa548378c9c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5593-9128-408b-6e8a7c4e39d8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5593-9128-4159-cc1368243a3f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5593-9128-8f02-cc6976e1cdb3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5593-9128-4567-c19551da611f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5593-9128-9bb1-7fa9beeb337a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5593-9128-37d1-c97cd2018077	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5593-9128-fe47-03cc277715e1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5593-9128-66fd-b46eacf446f9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5593-9128-4af8-78464110586d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5593-9128-c4db-68ae4dd3b41d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5593-9128-b076-433deca5b739	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5593-9128-636c-91f51b6bf1eb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5593-9128-d128-cf7cd5313fe2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5593-9128-2a6e-063b567d598d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5593-9128-842c-8045d2f62dd2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5593-9128-2f87-ba6d2fcf2382	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5593-9128-58cf-f393ae01ee63	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5593-9128-88ca-65449edb8083	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5593-9128-5583-48ab00f86c8d	TH	THA	764	Thailand 	Tajska	\N
00040000-5593-9128-7229-4880cba69854	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5593-9128-a1aa-32af0905fd60	TG	TGO	768	Togo 	Togo	\N
00040000-5593-9128-df5f-c014b532960b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5593-9128-510f-c542c12c8bae	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5593-9128-ab77-e60d7bbcb176	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5593-9128-b98b-4f14d77e0e70	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5593-9128-8ef1-051ec54a80ce	TR	TUR	792	Turkey 	Turčija	\N
00040000-5593-9128-4477-5af00d1001c6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5593-9128-8290-a1f1551f50c2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-9128-34be-8e4820c0a4bc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5593-9128-dc8f-07fbdb8f6706	UG	UGA	800	Uganda 	Uganda	\N
00040000-5593-9128-0460-92f899c577fa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5593-9128-81c0-e8854a4796f2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5593-9128-6388-d0e4b18775e5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5593-9128-be4f-7cade5da1738	US	USA	840	United States 	Združene države Amerike	\N
00040000-5593-9128-4feb-973f8418f81e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5593-9128-b229-0a3b3e1cc0d5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5593-9128-4afc-a10cd70ad617	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5593-9128-c7c4-8846f620fd4b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5593-9128-7245-43c0b4b131c2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5593-9128-4c77-f68b1a6ecb30	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5593-9128-9c07-3185f15514e4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-9128-1f7d-a0c8bdaaf7e6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5593-9128-6908-f61965346cf2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5593-9128-9c6f-e9ad4e5df311	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5593-9128-aa73-7f9434483376	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5593-9128-4b9b-b82f8d7bc2bb	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5593-9128-a1c3-3ad0f17c2c42	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8614587)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5593-912a-1175-f4b213e47dbc	000e0000-5593-9129-547a-af0d3e9c12b4	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5593-9128-441e-f311c5835df8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5593-912a-6f7b-15a5f1b033c9	000e0000-5593-9129-28e5-078adbc98fbc	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5593-9128-618d-20ef23932ae3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8614395)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5593-912a-3306-7e21d8acb413	000e0000-5593-9129-28e5-078adbc98fbc	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5593-9128-3bb5-344be1c35ac0
000d0000-5593-912a-3217-cf3500a43756	000e0000-5593-9129-28e5-078adbc98fbc	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-9128-3bb5-344be1c35ac0
000d0000-5593-912a-83d3-98c9dc8adaa9	000e0000-5593-9129-28e5-078adbc98fbc	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5593-9128-47fc-154146d28cd1
000d0000-5593-912a-339b-d2a739b7513f	000e0000-5593-9129-28e5-078adbc98fbc	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5593-9128-6224-228891c29b04
000d0000-5593-912a-fd3f-9991c1756d21	000e0000-5593-9129-28e5-078adbc98fbc	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5593-9128-6224-228891c29b04
000d0000-5593-912a-1399-5b5338d213d6	000e0000-5593-9129-28e5-078adbc98fbc	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5593-9128-6224-228891c29b04
000d0000-5593-912a-5734-b6c4d3d2e92f	000e0000-5593-9129-28e5-078adbc98fbc	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-9128-3bb5-344be1c35ac0
\.


--
-- TOC entry 2866 (class 0 OID 8614215)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8614263)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8614195)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5593-9129-b29c-271d97cf0a41	00080000-5593-9129-7da9-37ad6b2400c1	00090000-5593-9129-1c83-df1dd2834390	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8614312)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8614337)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8614152)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5593-9128-7bc2-1f3610ecd35a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5593-9128-dbea-7922cb189a0a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5593-9128-fdae-31856690250d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5593-9128-2ff0-c808fa70a744	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5593-9128-ca35-684d189c9d9c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5593-9128-988d-b7ac692108e6	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5593-9128-237c-c54061ae2390	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5593-9128-1441-212bebc247a2	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-9128-47a1-003267743743	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-9128-f0ba-facc57c8586a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5593-9128-c672-b91ac4dd9d23	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5593-9128-e126-a0b1259272b3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5593-9128-3554-db41d286f547	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5593-9129-7027-819b8cfcc3ed	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5593-9129-f404-626a3a6952f2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5593-9129-0016-6f2127ab8865	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5593-9129-8125-2daca42107b4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5593-9129-7dfb-03cfd328a285	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5593-9129-e9e5-e3844afa66c4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8614065)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5593-9129-80ff-2dd6161c5fd0	00000000-5593-9129-f404-626a3a6952f2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5593-9129-b2b9-bba0311564d3	00000000-5593-9129-f404-626a3a6952f2	00010000-5593-9128-3f83-dbacb882940a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5593-9129-bc46-f43411d7a8a7	00000000-5593-9129-0016-6f2127ab8865	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8614076)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5593-9129-f0a3-22850bb3d04b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5593-9129-a654-217fe8b0ee15	00010000-5593-9129-9d6b-97b5fcff2270	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5593-9129-35bd-4633e0ce5246	00010000-5593-9129-5fa4-30c12639fe8b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5593-9129-c414-cb909a318f15	00010000-5593-9129-9e3d-ea8252298aee	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5593-9129-40e3-f8cc22257b9c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5593-9129-8007-0703a41244e3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5593-9129-1f67-a1bb1d50dd3a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5593-9129-5dbf-f7a7ee542966	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5593-9129-1c83-df1dd2834390	00010000-5593-9129-2e14-3b66750e6387	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5593-9129-7eb0-7d9cd8505896	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5593-9129-6e2c-55c242a9ace1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5593-9129-d1a2-0afbb017e5fe	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5593-9129-10c8-40bb53967787	00010000-5593-9129-fb9b-40d13b814791	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8614030)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5593-9128-c892-0e95e2b5d855	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5593-9128-a8ae-b4b5bb967fe1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5593-9128-3518-454b43b73c86	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5593-9128-4c25-d7dba8cfeafe	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5593-9128-9da8-6fc75441d799	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5593-9128-b208-dc80e1d0fafd	Abonma-read	Abonma - branje	f
00030000-5593-9128-227a-1d8d4e7786f0	Abonma-write	Abonma - spreminjanje	f
00030000-5593-9128-6356-23f5a137a9da	Alternacija-read	Alternacija - branje	f
00030000-5593-9128-9d85-72827fa0e2c2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5593-9128-edc2-ad41954ee997	Arhivalija-read	Arhivalija - branje	f
00030000-5593-9128-dc8d-cd7b0ee0c17c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5593-9128-2399-386d1583c903	Besedilo-read	Besedilo - branje	f
00030000-5593-9128-494f-c3bf5027eb4e	Besedilo-write	Besedilo - spreminjanje	f
00030000-5593-9128-6059-c6a84dcebddb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5593-9128-23da-c7ebf79b7135	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5593-9128-d19d-17a868f04417	Dogodek-read	Dogodek - branje	f
00030000-5593-9128-fce8-07eb2e96509c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5593-9128-0441-0f99733d7789	DrugiVir-read	DrugiVir - branje	f
00030000-5593-9128-feda-5ae6fc72ab86	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5593-9128-03fd-240e3596e0b3	Drzava-read	Drzava - branje	f
00030000-5593-9128-ee06-a19e3b91d078	Drzava-write	Drzava - spreminjanje	f
00030000-5593-9128-96bd-004dcc68e221	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5593-9128-9892-0b56b46f57a0	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5593-9128-bbe5-24b90b77a038	Funkcija-read	Funkcija - branje	f
00030000-5593-9128-a6f5-3bf7d42b8596	Funkcija-write	Funkcija - spreminjanje	f
00030000-5593-9128-4a6d-0bf45a8165b2	Gostovanje-read	Gostovanje - branje	f
00030000-5593-9128-23b0-eaec1dc370cc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5593-9128-090f-c55a673eebc2	Gostujoca-read	Gostujoca - branje	f
00030000-5593-9128-4ef3-2dd75aee030a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5593-9128-e5cb-26775a8917aa	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5593-9128-66c1-2d15bc3f148c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5593-9128-cc09-59e89e724184	Kupec-read	Kupec - branje	f
00030000-5593-9128-0d92-1177cd6bbdc7	Kupec-write	Kupec - spreminjanje	f
00030000-5593-9128-6312-80dbb509655b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5593-9128-09fb-388df93fb39d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5593-9128-23d6-4a0dfc03713b	Option-read	Option - branje	f
00030000-5593-9128-a80c-0339be6a07ce	Option-write	Option - spreminjanje	f
00030000-5593-9128-58a4-f7d3912c3f4b	OptionValue-read	OptionValue - branje	f
00030000-5593-9128-828e-b659c6086b33	OptionValue-write	OptionValue - spreminjanje	f
00030000-5593-9128-07aa-4082dfb7f7c6	Oseba-read	Oseba - branje	f
00030000-5593-9128-3cda-51cab5136017	Oseba-write	Oseba - spreminjanje	f
00030000-5593-9128-e7d2-0f45ca9afe5f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5593-9128-ade5-d37a7f03d0b9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5593-9128-a743-c9d63ce60f30	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5593-9128-81b7-2b40e5ffa7a2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5593-9128-f52c-79487e0a1577	Pogodba-read	Pogodba - branje	f
00030000-5593-9128-78b6-4b7e77a99c39	Pogodba-write	Pogodba - spreminjanje	f
00030000-5593-9128-1709-fced8664b15e	Popa-read	Popa - branje	f
00030000-5593-9128-312d-d36a1f56f379	Popa-write	Popa - spreminjanje	f
00030000-5593-9128-1109-1431f765ce5a	Posta-read	Posta - branje	f
00030000-5593-9128-26a7-72b1ab503696	Posta-write	Posta - spreminjanje	f
00030000-5593-9128-24da-c1a5532e2f68	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5593-9128-b431-3976babff7d4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5593-9128-8a1b-b8cb048207d5	PostniNaslov-read	PostniNaslov - branje	f
00030000-5593-9128-f77f-4ff2b5e211c4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5593-9128-58c8-38330bdef692	Predstava-read	Predstava - branje	f
00030000-5593-9128-cfb0-319a2e46170f	Predstava-write	Predstava - spreminjanje	f
00030000-5593-9128-45c5-fd70c7608475	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5593-9128-e8e8-3038167b0e3b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5593-9128-c843-3f99657173fe	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5593-9128-7f9c-75b3e2166cce	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5593-9128-5973-f0c036f3ba1d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5593-9128-60b5-a1bb70316960	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5593-9128-ca47-0ab7a1309d7a	ProgramDela-read	ProgramDela - branje	f
00030000-5593-9128-dd1e-733c3bb15517	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5593-9128-c3b7-1e96af4504b8	ProgramFestival-read	ProgramFestival - branje	f
00030000-5593-9128-4e15-619a7083309c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5593-9128-f07d-40bfd5de3a8b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5593-9128-31ee-149e7912c85d	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5593-9128-a553-4b3ec4de1bcd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5593-9128-b00d-6445fbb4fc76	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5593-9128-a0da-2ffb136faead	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5593-9128-933d-0353494771ce	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5593-9128-0302-e101bf1c423f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5593-9128-6a5d-a2e20a08ec54	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5593-9128-e676-883fc318a5f1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5593-9128-fd79-e16f5bae704d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5593-9128-27f0-61da621a85bd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5593-9128-9929-066f3475fb3d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5593-9128-9009-c19a71a72211	ProgramRazno-read	ProgramRazno - branje	f
00030000-5593-9128-2c8b-69b5c52c5a0f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5593-9128-6741-7b6463805914	Prostor-read	Prostor - branje	f
00030000-5593-9128-2866-6fccf7a57d16	Prostor-write	Prostor - spreminjanje	f
00030000-5593-9128-38a2-deec649184b7	Racun-read	Racun - branje	f
00030000-5593-9128-8417-f03fb334d28b	Racun-write	Racun - spreminjanje	f
00030000-5593-9128-6628-e36830300919	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5593-9128-4cd5-5c7e2b53148c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5593-9128-9f48-065e435aef45	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5593-9128-bc5e-74c9a87856b3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5593-9128-638a-f934bf195cba	Rekvizit-read	Rekvizit - branje	f
00030000-5593-9128-1f9a-fe201e5b9d96	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5593-9128-d9c1-46e3fb07912f	Revizija-read	Revizija - branje	f
00030000-5593-9128-cb47-cf7641dea457	Revizija-write	Revizija - spreminjanje	f
00030000-5593-9128-8d51-912c2377fd6b	Rezervacija-read	Rezervacija - branje	f
00030000-5593-9128-7ee5-0ca8f71edfd0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5593-9128-95f0-01df0ea14f65	SedezniRed-read	SedezniRed - branje	f
00030000-5593-9128-61b6-7e21216da372	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5593-9128-2506-2c2215489ef3	Sedez-read	Sedez - branje	f
00030000-5593-9128-877a-3a75894e282f	Sedez-write	Sedez - spreminjanje	f
00030000-5593-9128-64bb-e60b1df743c7	Sezona-read	Sezona - branje	f
00030000-5593-9128-28d5-460732f37853	Sezona-write	Sezona - spreminjanje	f
00030000-5593-9128-5839-baf85eee4477	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5593-9128-aa23-7250655000f3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5593-9128-09c5-1724923508c5	Stevilcenje-read	Stevilcenje - branje	f
00030000-5593-9128-12d9-95632e7dfd89	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5593-9128-7aa7-dc2a5f5d0685	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5593-9128-66c2-8e238d891826	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5593-9128-5bb0-759de1d0aed9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5593-9128-3b93-2bee44a27d99	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5593-9128-71a4-68420b64b679	Telefonska-read	Telefonska - branje	f
00030000-5593-9128-f26e-87f372243fd0	Telefonska-write	Telefonska - spreminjanje	f
00030000-5593-9128-609e-02a4432e9e55	TerminStoritve-read	TerminStoritve - branje	f
00030000-5593-9128-5df7-2e26a9132f37	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5593-9128-cb38-4d1f13110c06	TipFunkcije-read	TipFunkcije - branje	f
00030000-5593-9128-b4b2-419c91b2d9c9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5593-9128-b2b5-d6f7eaf9c8f3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5593-9128-c4a4-6cd0e9afda7a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5593-9128-14b0-9442bf04f0e7	Trr-read	Trr - branje	f
00030000-5593-9128-8187-a84af24050a8	Trr-write	Trr - spreminjanje	f
00030000-5593-9128-9dcb-3762edd69679	Uprizoritev-read	Uprizoritev - branje	f
00030000-5593-9128-5d97-34b873f9529b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5593-9128-91c2-f2cba02a2a3e	Vaja-read	Vaja - branje	f
00030000-5593-9128-00e4-87925334696a	Vaja-write	Vaja - spreminjanje	f
00030000-5593-9128-e8fc-9b27cd9521e7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5593-9128-b009-4a960edb4225	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5593-9128-4fef-1eaf59567950	Zaposlitev-read	Zaposlitev - branje	f
00030000-5593-9128-940a-42bf0d293dec	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5593-9128-5664-039a1886f6f0	Zasedenost-read	Zasedenost - branje	f
00030000-5593-9128-43d4-9b0c50630bbc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5593-9128-3498-895d94f14692	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5593-9128-840e-8301973c0e9d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5593-9128-1041-6fe96d5e2233	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5593-9128-6f8a-0e1b15fcc657	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8614049)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5593-9128-e641-66c190f40e26	00030000-5593-9128-a8ae-b4b5bb967fe1
00020000-5593-9128-fa62-cc65d3fcea10	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-227a-1d8d4e7786f0
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-6356-23f5a137a9da
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-9d85-72827fa0e2c2
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-4c25-d7dba8cfeafe
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-fce8-07eb2e96509c
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-ee06-a19e3b91d078
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-bbe5-24b90b77a038
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-a6f5-3bf7d42b8596
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-23b0-eaec1dc370cc
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-4ef3-2dd75aee030a
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-e5cb-26775a8917aa
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-66c1-2d15bc3f148c
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-07aa-4082dfb7f7c6
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-3cda-51cab5136017
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-312d-d36a1f56f379
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-26a7-72b1ab503696
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-8a1b-b8cb048207d5
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-f77f-4ff2b5e211c4
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-cfb0-319a2e46170f
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-5973-f0c036f3ba1d
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-60b5-a1bb70316960
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-6741-7b6463805914
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-2866-6fccf7a57d16
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-bc5e-74c9a87856b3
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-1f9a-fe201e5b9d96
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-28d5-460732f37853
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-cb38-4d1f13110c06
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-9dcb-3762edd69679
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-5d97-34b873f9529b
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-91c2-f2cba02a2a3e
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-00e4-87925334696a
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-5664-039a1886f6f0
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-43d4-9b0c50630bbc
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-3498-895d94f14692
00020000-5593-9128-1e1c-09b6212e6e99	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-e5cb-26775a8917aa
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-66c1-2d15bc3f148c
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-07aa-4082dfb7f7c6
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-3cda-51cab5136017
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-8a1b-b8cb048207d5
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-f77f-4ff2b5e211c4
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-6741-7b6463805914
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-71a4-68420b64b679
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-f26e-87f372243fd0
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-14b0-9442bf04f0e7
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-8187-a84af24050a8
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-4fef-1eaf59567950
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-940a-42bf0d293dec
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-3498-895d94f14692
00020000-5593-9128-1544-7b9555171d99	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-6356-23f5a137a9da
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-dc8d-cd7b0ee0c17c
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-2399-386d1583c903
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-6059-c6a84dcebddb
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-bbe5-24b90b77a038
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-e5cb-26775a8917aa
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-07aa-4082dfb7f7c6
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-5973-f0c036f3ba1d
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-6741-7b6463805914
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-cb38-4d1f13110c06
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-91c2-f2cba02a2a3e
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-5664-039a1886f6f0
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-3498-895d94f14692
00020000-5593-9128-ee8d-9d3ffd32de59	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-227a-1d8d4e7786f0
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-9d85-72827fa0e2c2
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-6741-7b6463805914
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-cb38-4d1f13110c06
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-3498-895d94f14692
00020000-5593-9128-7252-16088331b33a	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-6741-7b6463805914
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-609e-02a4432e9e55
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-3518-454b43b73c86
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-cb38-4d1f13110c06
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-3498-895d94f14692
00020000-5593-9128-e690-901a84eab791	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-c892-0e95e2b5d855
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a8ae-b4b5bb967fe1
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-3518-454b43b73c86
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4c25-d7dba8cfeafe
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9da8-6fc75441d799
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b208-dc80e1d0fafd
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-227a-1d8d4e7786f0
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6356-23f5a137a9da
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9d85-72827fa0e2c2
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-edc2-ad41954ee997
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-dc8d-cd7b0ee0c17c
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-2399-386d1583c903
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-494f-c3bf5027eb4e
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6059-c6a84dcebddb
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-23da-c7ebf79b7135
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-d19d-17a868f04417
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-fce8-07eb2e96509c
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-03fd-240e3596e0b3
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-ee06-a19e3b91d078
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-96bd-004dcc68e221
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9892-0b56b46f57a0
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-bbe5-24b90b77a038
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a6f5-3bf7d42b8596
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4a6d-0bf45a8165b2
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-23b0-eaec1dc370cc
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-090f-c55a673eebc2
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4ef3-2dd75aee030a
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-e5cb-26775a8917aa
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-66c1-2d15bc3f148c
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-cc09-59e89e724184
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-0d92-1177cd6bbdc7
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6312-80dbb509655b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-09fb-388df93fb39d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-23d6-4a0dfc03713b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a80c-0339be6a07ce
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-58a4-f7d3912c3f4b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-828e-b659c6086b33
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-07aa-4082dfb7f7c6
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-3cda-51cab5136017
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-e7d2-0f45ca9afe5f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-ade5-d37a7f03d0b9
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a743-c9d63ce60f30
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-81b7-2b40e5ffa7a2
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-f52c-79487e0a1577
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-78b6-4b7e77a99c39
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-1709-fced8664b15e
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-312d-d36a1f56f379
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-1109-1431f765ce5a
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-26a7-72b1ab503696
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-24da-c1a5532e2f68
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b431-3976babff7d4
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-8a1b-b8cb048207d5
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-f77f-4ff2b5e211c4
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-58c8-38330bdef692
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-cfb0-319a2e46170f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-45c5-fd70c7608475
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-e8e8-3038167b0e3b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-c843-3f99657173fe
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-7f9c-75b3e2166cce
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5973-f0c036f3ba1d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-60b5-a1bb70316960
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-ca47-0ab7a1309d7a
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-dd1e-733c3bb15517
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-c3b7-1e96af4504b8
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4e15-619a7083309c
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-f07d-40bfd5de3a8b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-31ee-149e7912c85d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a553-4b3ec4de1bcd
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b00d-6445fbb4fc76
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-a0da-2ffb136faead
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-933d-0353494771ce
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-0302-e101bf1c423f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6a5d-a2e20a08ec54
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-e676-883fc318a5f1
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-fd79-e16f5bae704d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-27f0-61da621a85bd
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9929-066f3475fb3d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9009-c19a71a72211
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-2c8b-69b5c52c5a0f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6741-7b6463805914
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-2866-6fccf7a57d16
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-38a2-deec649184b7
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-8417-f03fb334d28b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6628-e36830300919
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4cd5-5c7e2b53148c
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9f48-065e435aef45
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-bc5e-74c9a87856b3
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-638a-f934bf195cba
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-1f9a-fe201e5b9d96
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-d9c1-46e3fb07912f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-cb47-cf7641dea457
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-8d51-912c2377fd6b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-7ee5-0ca8f71edfd0
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-95f0-01df0ea14f65
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-61b6-7e21216da372
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-2506-2c2215489ef3
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-877a-3a75894e282f
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-64bb-e60b1df743c7
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-28d5-460732f37853
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5839-baf85eee4477
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-aa23-7250655000f3
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-09c5-1724923508c5
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-12d9-95632e7dfd89
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-7aa7-dc2a5f5d0685
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-66c2-8e238d891826
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5bb0-759de1d0aed9
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-3b93-2bee44a27d99
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-71a4-68420b64b679
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-f26e-87f372243fd0
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-609e-02a4432e9e55
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5df7-2e26a9132f37
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-cb38-4d1f13110c06
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b4b2-419c91b2d9c9
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b2b5-d6f7eaf9c8f3
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-c4a4-6cd0e9afda7a
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-14b0-9442bf04f0e7
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-8187-a84af24050a8
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-9dcb-3762edd69679
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5d97-34b873f9529b
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-91c2-f2cba02a2a3e
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-00e4-87925334696a
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-e8fc-9b27cd9521e7
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-b009-4a960edb4225
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-4fef-1eaf59567950
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-940a-42bf0d293dec
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-5664-039a1886f6f0
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-43d4-9b0c50630bbc
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-3498-895d94f14692
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-840e-8301973c0e9d
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-1041-6fe96d5e2233
00020000-5593-9129-178d-fa0407a79a70	00030000-5593-9128-6f8a-0e1b15fcc657
\.


--
-- TOC entry 2881 (class 0 OID 8614344)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8614375)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8614507)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5593-9129-14df-d86fd4a167e0	00090000-5593-9129-f0a3-22850bb3d04b	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8614109)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5593-9129-7da9-37ad6b2400c1	00040000-5593-9127-f3f5-b80fab1724c1	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-9129-a113-ac27298e65c6	00040000-5593-9127-f3f5-b80fab1724c1	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-9129-74ba-3dcfbaeb9154	00040000-5593-9127-f3f5-b80fab1724c1	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-9129-a371-6621749a9006	00040000-5593-9127-f3f5-b80fab1724c1	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-9129-8fe7-5d5c0692918c	00040000-5593-9127-f3f5-b80fab1724c1	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-9129-0150-07cd2400ddfa	00040000-5593-9128-408b-6e8a7c4e39d8	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8614144)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5593-9128-e968-f9088c34e8cb	8341	Adlešiči
00050000-5593-9128-71a0-5e754947d6f8	5270	Ajdovščina
00050000-5593-9128-4409-5487717f13ce	6280	Ankaran/Ancarano
00050000-5593-9128-ea3c-d64749f0340d	9253	Apače
00050000-5593-9128-f335-fdbd3b28b328	8253	Artiče
00050000-5593-9128-dc5f-daeddaa280b0	4275	Begunje na Gorenjskem
00050000-5593-9128-9155-e8b0c3cb7c8e	1382	Begunje pri Cerknici
00050000-5593-9128-c7e0-ed8c1de3cf7b	9231	Beltinci
00050000-5593-9128-d06b-ac8af7140d25	2234	Benedikt
00050000-5593-9128-f67b-4777a8e0e656	2345	Bistrica ob Dravi
00050000-5593-9128-e97e-0e6ffac7b020	3256	Bistrica ob Sotli
00050000-5593-9128-f3bc-9f5764db9e31	8259	Bizeljsko
00050000-5593-9128-2c87-d896533c28e1	1223	Blagovica
00050000-5593-9128-7174-26d9f87b6d21	8283	Blanca
00050000-5593-9128-4f97-5be670028699	4260	Bled
00050000-5593-9128-9cdc-e2a2de11ca96	4273	Blejska Dobrava
00050000-5593-9128-5c02-137eed772f7f	9265	Bodonci
00050000-5593-9128-b8b4-d6eae6a00c55	9222	Bogojina
00050000-5593-9128-5d06-c06197289719	4263	Bohinjska Bela
00050000-5593-9128-d9b1-e9fa7b81eb5e	4264	Bohinjska Bistrica
00050000-5593-9128-992a-3c6add11e3db	4265	Bohinjsko jezero
00050000-5593-9128-0633-e587af79c7c3	1353	Borovnica
00050000-5593-9128-4478-2f753bd0913b	8294	Boštanj
00050000-5593-9128-fedf-385a78aeea4f	5230	Bovec
00050000-5593-9128-9358-e3d0b3f63410	5295	Branik
00050000-5593-9128-0115-234184c37003	3314	Braslovče
00050000-5593-9128-288a-17bafddcc84a	5223	Breginj
00050000-5593-9128-6184-637e5b10f2b0	8280	Brestanica
00050000-5593-9128-ed67-fde577599af6	2354	Bresternica
00050000-5593-9128-999c-c6093978d44b	4243	Brezje
00050000-5593-9128-5f51-cdfe297dce12	1351	Brezovica pri Ljubljani
00050000-5593-9128-3792-2acdbe3c6965	8250	Brežice
00050000-5593-9128-236c-52b19b23b719	4210	Brnik - Aerodrom
00050000-5593-9128-2919-b1909678a523	8321	Brusnice
00050000-5593-9128-bb9d-4d3af34f55a7	3255	Buče
00050000-5593-9128-5e46-1b2627eef722	8276	Bučka 
00050000-5593-9128-6d13-3d76d34f42a0	9261	Cankova
00050000-5593-9128-f4c2-2633cb733d6f	3000	Celje 
00050000-5593-9128-15e1-30d9aff05eb3	3001	Celje - poštni predali
00050000-5593-9128-feb4-d6292d2a0664	4207	Cerklje na Gorenjskem
00050000-5593-9128-ab5b-80b77aa0581a	8263	Cerklje ob Krki
00050000-5593-9128-997f-197d0eaa881c	1380	Cerknica
00050000-5593-9128-d851-37872ecee38b	5282	Cerkno
00050000-5593-9128-cc7c-50b8442ee28e	2236	Cerkvenjak
00050000-5593-9128-9ef3-7784786ea08e	2215	Ceršak
00050000-5593-9128-0308-7a97297d2b55	2326	Cirkovce
00050000-5593-9128-761c-a9131021eca2	2282	Cirkulane
00050000-5593-9128-0333-cf52e8c0c335	5273	Col
00050000-5593-9128-a2a2-2a917f0f00f7	8251	Čatež ob Savi
00050000-5593-9128-a89d-0dc61fc6d07c	1413	Čemšenik
00050000-5593-9128-0441-fd8ecc01b575	5253	Čepovan
00050000-5593-9128-3286-a97aead0e4ba	9232	Črenšovci
00050000-5593-9128-5e1f-7b1fbfa00657	2393	Črna na Koroškem
00050000-5593-9128-2b69-eca7d87825cd	6275	Črni Kal
00050000-5593-9128-b573-79751efc0794	5274	Črni Vrh nad Idrijo
00050000-5593-9128-26ce-f2bfadf2c6e7	5262	Črniče
00050000-5593-9128-a844-824608411f5f	8340	Črnomelj
00050000-5593-9128-3373-02bc879fdb9c	6271	Dekani
00050000-5593-9128-86a5-c9e955eb9da8	5210	Deskle
00050000-5593-9128-a1fe-e0c09cd5100c	2253	Destrnik
00050000-5593-9128-4613-4af17f40c645	6215	Divača
00050000-5593-9128-214f-163326eda1c6	1233	Dob
00050000-5593-9128-c2ac-194d9d2caf22	3224	Dobje pri Planini
00050000-5593-9128-6f04-8a3f5c0e9e0e	8257	Dobova
00050000-5593-9128-2d7a-cf1d39834a6a	1423	Dobovec
00050000-5593-9128-2eb8-f8326b4e875a	5263	Dobravlje
00050000-5593-9128-37a4-d9c2500cfdd3	3204	Dobrna
00050000-5593-9128-e35d-0d1263616c92	8211	Dobrnič
00050000-5593-9128-b03e-deaaefada30f	1356	Dobrova
00050000-5593-9128-d774-8166f2dadc2a	9223	Dobrovnik/Dobronak 
00050000-5593-9128-f514-1ccefa8e9ba4	5212	Dobrovo v Brdih
00050000-5593-9128-b4be-73fc0ec0f806	1431	Dol pri Hrastniku
00050000-5593-9128-2f85-e79118bb1ccc	1262	Dol pri Ljubljani
00050000-5593-9128-cdf6-010ccc620ab6	1273	Dole pri Litiji
00050000-5593-9128-2442-fffbcc8b6bc7	1331	Dolenja vas
00050000-5593-9128-c2c5-a5f67eafcec3	8350	Dolenjske Toplice
00050000-5593-9128-b851-24c859c7691e	1230	Domžale
00050000-5593-9128-0d61-27151d6cff09	2252	Dornava
00050000-5593-9128-4921-b356d8a10bdc	5294	Dornberk
00050000-5593-9128-121e-5a7453c3c142	1319	Draga
00050000-5593-9128-eaf2-3c696dd232c2	8343	Dragatuš
00050000-5593-9128-b4f2-5d4b76d4c9a0	3222	Dramlje
00050000-5593-9128-e3cb-65240ad5aa88	2370	Dravograd
00050000-5593-9128-8ce4-305dfd708cd1	4203	Duplje
00050000-5593-9128-29c0-e30b7c32a2f0	6221	Dutovlje
00050000-5593-9128-40e5-94c72d01c00e	8361	Dvor
00050000-5593-9128-45be-e913b1210f9e	2343	Fala
00050000-5593-9128-880d-4989ab5fc657	9208	Fokovci
00050000-5593-9128-9fff-fcea63795981	2313	Fram
00050000-5593-9128-01d7-fa880a4739bc	3213	Frankolovo
00050000-5593-9128-85cb-09c421b2eaf4	1274	Gabrovka
00050000-5593-9128-a4f5-6f107e1af1a5	8254	Globoko
00050000-5593-9128-07b8-fe1ecbf9adc0	5275	Godovič
00050000-5593-9128-a07e-9e151d07a5c2	4204	Golnik
00050000-5593-9128-09d7-a23fcd324a64	3303	Gomilsko
00050000-5593-9128-9364-5030d0734b40	4224	Gorenja vas
00050000-5593-9128-c475-64ce9d9fe458	3263	Gorica pri Slivnici
00050000-5593-9128-ade7-0bdc556ba7ed	2272	Gorišnica
00050000-5593-9128-e4a9-ca6113830050	9250	Gornja Radgona
00050000-5593-9128-825c-787e7e140be6	3342	Gornji Grad
00050000-5593-9128-9c54-4ddf45b70ac4	4282	Gozd Martuljek
00050000-5593-9128-d170-bc73b3ab7d09	6272	Gračišče
00050000-5593-9128-38df-db6693784875	9264	Grad
00050000-5593-9128-f6e0-721e32ea7a14	8332	Gradac
00050000-5593-9128-8d46-0c1e51e86717	1384	Grahovo
00050000-5593-9128-01bd-b3d7789f1c16	5242	Grahovo ob Bači
00050000-5593-9128-6c7b-b4f1d9dd0784	5251	Grgar
00050000-5593-9128-6f1d-751351e87d2b	3302	Griže
00050000-5593-9128-7625-3c618ed7eee9	3231	Grobelno
00050000-5593-9128-bd9b-a01c32389969	1290	Grosuplje
00050000-5593-9128-dbc4-71976a635ed3	2288	Hajdina
00050000-5593-9128-c339-5c3a6483a268	8362	Hinje
00050000-5593-9128-436b-20620cd5e238	2311	Hoče
00050000-5593-9128-5784-d2262e9b8ba4	9205	Hodoš/Hodos
00050000-5593-9128-2a4a-092d0909e791	1354	Horjul
00050000-5593-9128-68b5-a21efc30fecf	1372	Hotedršica
00050000-5593-9128-3630-3a5feb34343f	1430	Hrastnik
00050000-5593-9128-dcd9-45f066cf16cd	6225	Hruševje
00050000-5593-9128-c6ca-94d34ca7282b	4276	Hrušica
00050000-5593-9128-cfc0-0527537117ee	5280	Idrija
00050000-5593-9128-c481-048f7a8b35b3	1292	Ig
00050000-5593-9128-6492-c7036f917b2c	6250	Ilirska Bistrica
00050000-5593-9128-7cae-c4a2e12c4360	6251	Ilirska Bistrica-Trnovo
00050000-5593-9128-5628-88940a3dc0c9	1295	Ivančna Gorica
00050000-5593-9128-5e95-3377ec41ebaf	2259	Ivanjkovci
00050000-5593-9128-d493-01ac07b23d56	1411	Izlake
00050000-5593-9128-633f-06e208f34d29	6310	Izola/Isola
00050000-5593-9128-e461-6c86e2b27684	2222	Jakobski Dol
00050000-5593-9128-8464-248fe813f1ef	2221	Jarenina
00050000-5593-9128-e2b8-6062fbecd864	6254	Jelšane
00050000-5593-9128-4cf6-7e906989931f	4270	Jesenice
00050000-5593-9128-ad22-f5f2e7652283	8261	Jesenice na Dolenjskem
00050000-5593-9128-b42a-a0f08d968b36	3273	Jurklošter
00050000-5593-9128-5a09-162912de1d89	2223	Jurovski Dol
00050000-5593-9128-f129-2bea76dd53dc	2256	Juršinci
00050000-5593-9128-3443-26a27c7c5994	5214	Kal nad Kanalom
00050000-5593-9128-31fe-abfab6ef74a4	3233	Kalobje
00050000-5593-9128-cc08-07ec63325430	4246	Kamna Gorica
00050000-5593-9128-cf83-834f8f046a47	2351	Kamnica
00050000-5593-9128-c83f-38bc3aba227d	1241	Kamnik
00050000-5593-9128-fe24-6ff05b6a7b16	5213	Kanal
00050000-5593-9128-da6f-0215aac90fa2	8258	Kapele
00050000-5593-9128-dd4b-ac68a7578e99	2362	Kapla
00050000-5593-9128-247f-c81ae16414dc	2325	Kidričevo
00050000-5593-9128-5503-7fd78a64eeca	1412	Kisovec
00050000-5593-9128-0610-bb99d29e1a6d	6253	Knežak
00050000-5593-9128-e0ef-44ccbd7d52a0	5222	Kobarid
00050000-5593-9128-8173-2d1786eeffaa	9227	Kobilje
00050000-5593-9128-71bc-0d90edef1620	1330	Kočevje
00050000-5593-9128-bee1-273cdbafe9ab	1338	Kočevska Reka
00050000-5593-9128-bbed-bb0758f43e53	2276	Kog
00050000-5593-9128-5bbf-55c49492abdb	5211	Kojsko
00050000-5593-9128-85b3-845770eb4132	6223	Komen
00050000-5593-9128-bb6f-6a59edc2e4c5	1218	Komenda
00050000-5593-9128-b4ad-02d93d783121	6000	Koper/Capodistria 
00050000-5593-9128-b100-4a56c378f5fa	6001	Koper/Capodistria - poštni predali
00050000-5593-9128-087a-6d095c0132fa	8282	Koprivnica
00050000-5593-9128-a282-7fa76387cd9d	5296	Kostanjevica na Krasu
00050000-5593-9128-4c9c-d6b11b36a949	8311	Kostanjevica na Krki
00050000-5593-9128-6668-9e75f8b14bbb	1336	Kostel
00050000-5593-9128-0ee2-734b9163fad2	6256	Košana
00050000-5593-9128-e7d5-25da886115da	2394	Kotlje
00050000-5593-9128-b709-9ed6ac76b8bc	6240	Kozina
00050000-5593-9128-9703-a44391bd5f17	3260	Kozje
00050000-5593-9128-d073-7856e64e63e9	4000	Kranj 
00050000-5593-9128-63a8-d907594f4948	4001	Kranj - poštni predali
00050000-5593-9128-c49d-27d509a8b777	4280	Kranjska Gora
00050000-5593-9128-1c31-7317776df125	1281	Kresnice
00050000-5593-9128-f7c1-372a594980bf	4294	Križe
00050000-5593-9128-3731-d9c68379046d	9206	Križevci
00050000-5593-9128-5147-c83c085d6235	9242	Križevci pri Ljutomeru
00050000-5593-9128-6e79-8c17358e511a	1301	Krka
00050000-5593-9128-d057-7c3d5601eb7d	8296	Krmelj
00050000-5593-9128-34da-313c2bcc99c0	4245	Kropa
00050000-5593-9128-7858-267d32fa69b0	8262	Krška vas
00050000-5593-9128-b922-34c5164f5c45	8270	Krško
00050000-5593-9128-55df-31a2ff4bc647	9263	Kuzma
00050000-5593-9128-7df9-fa052e6db519	2318	Laporje
00050000-5593-9128-cf05-ddf56a4814d7	3270	Laško
00050000-5593-9128-4239-2e6e093f54be	1219	Laze v Tuhinju
00050000-5593-9128-9248-86f95c5b161d	2230	Lenart v Slovenskih goricah
00050000-5593-9128-f9dd-29e29f26df2d	9220	Lendava/Lendva
00050000-5593-9128-d786-97d1015bf19a	4248	Lesce
00050000-5593-9128-4170-55db08dfbd91	3261	Lesično
00050000-5593-9128-3093-d825f427a2ce	8273	Leskovec pri Krškem
00050000-5593-9128-92e8-869508cb7cc8	2372	Libeliče
00050000-5593-9128-f93a-6ea8a4429523	2341	Limbuš
00050000-5593-9128-58e9-4aaf4be0c187	1270	Litija
00050000-5593-9128-0bb4-b008ef1850e3	3202	Ljubečna
00050000-5593-9128-364e-6407baefb36b	1000	Ljubljana 
00050000-5593-9128-8b5f-e5903996f37f	1001	Ljubljana - poštni predali
00050000-5593-9128-4d50-a4df4983cadf	1231	Ljubljana - Črnuče
00050000-5593-9128-fb40-aa262a2b8f65	1261	Ljubljana - Dobrunje
00050000-5593-9128-b623-592b9cf2215e	1260	Ljubljana - Polje
00050000-5593-9128-4702-4d6cdbf68ae2	1210	Ljubljana - Šentvid
00050000-5593-9128-334e-49513d200623	1211	Ljubljana - Šmartno
00050000-5593-9128-bc5c-e409270ca472	3333	Ljubno ob Savinji
00050000-5593-9128-61f4-fd17f9d1ce95	9240	Ljutomer
00050000-5593-9128-6ac2-b412e9f8e17f	3215	Loče
00050000-5593-9128-cddc-039824485bae	5231	Log pod Mangartom
00050000-5593-9128-5133-8bdc9db36acd	1358	Log pri Brezovici
00050000-5593-9128-bcc6-031e35cd5481	1370	Logatec
00050000-5593-9128-30bf-0f7cbcb96baa	1371	Logatec
00050000-5593-9128-0b25-b3726abcaf21	1434	Loka pri Zidanem Mostu
00050000-5593-9128-0996-20aa256be1f6	3223	Loka pri Žusmu
00050000-5593-9128-b3bb-0887c1203839	6219	Lokev
00050000-5593-9128-d81f-29ff74620908	1318	Loški Potok
00050000-5593-9128-6810-6c22a89c2464	2324	Lovrenc na Dravskem polju
00050000-5593-9128-64cd-e9ef505cc0b3	2344	Lovrenc na Pohorju
00050000-5593-9128-36e5-b5365a0b68ab	3334	Luče
00050000-5593-9128-02c5-bc97fa8d457e	1225	Lukovica
00050000-5593-9128-5d2d-d9d66b3f3efd	9202	Mačkovci
00050000-5593-9128-1463-f4dc0621a7b0	2322	Majšperk
00050000-5593-9128-c02d-8a6f29fc0d84	2321	Makole
00050000-5593-9128-5b7d-8b5d85e263f8	9243	Mala Nedelja
00050000-5593-9128-4ccb-b74d022e80e1	2229	Malečnik
00050000-5593-9128-8622-449b16fab340	6273	Marezige
00050000-5593-9128-f218-11bdbd254c52	2000	Maribor 
00050000-5593-9128-b078-105ea4358939	2001	Maribor - poštni predali
00050000-5593-9128-2fc4-a3657d9d12dd	2206	Marjeta na Dravskem polju
00050000-5593-9128-a1bb-218dca540446	2281	Markovci
00050000-5593-9128-50de-a4627b4be7bd	9221	Martjanci
00050000-5593-9128-7e37-0fd8e33d2091	6242	Materija
00050000-5593-9128-bfb6-7a253b36729a	4211	Mavčiče
00050000-5593-9128-9012-5ebcfa9fefa5	1215	Medvode
00050000-5593-9128-2c45-e90ee3f05370	1234	Mengeš
00050000-5593-9128-38d1-656d8ab71cfc	8330	Metlika
00050000-5593-9128-4f5a-8eb80aaab831	2392	Mežica
00050000-5593-9128-71e3-1dcb52be04aa	2204	Miklavž na Dravskem polju
00050000-5593-9128-c542-9e1efb3fdb59	2275	Miklavž pri Ormožu
00050000-5593-9128-9c11-56ed4672b72c	5291	Miren
00050000-5593-9128-d6ae-28666738f54c	8233	Mirna
00050000-5593-9128-b1cb-48881b0aa564	8216	Mirna Peč
00050000-5593-9128-9561-5f4541805cf9	2382	Mislinja
00050000-5593-9128-11ac-17814f13f598	4281	Mojstrana
00050000-5593-9128-f0c1-6c2bfe99984e	8230	Mokronog
00050000-5593-9128-3cad-d8500e864c46	1251	Moravče
00050000-5593-9128-f0bb-9a2b2f62cb6a	9226	Moravske Toplice
00050000-5593-9128-5a1b-5798bda167ba	5216	Most na Soči
00050000-5593-9128-ad32-185766e9588e	1221	Motnik
00050000-5593-9128-149c-165cde928800	3330	Mozirje
00050000-5593-9128-d16a-914b1cb9095c	9000	Murska Sobota 
00050000-5593-9128-c521-f69ceb726693	9001	Murska Sobota - poštni predali
00050000-5593-9128-595e-a8208ac89ec0	2366	Muta
00050000-5593-9128-8060-1216882ad545	4202	Naklo
00050000-5593-9128-7db0-22c04f1acd2e	3331	Nazarje
00050000-5593-9128-625d-4480e881ee36	1357	Notranje Gorice
00050000-5593-9128-c6d5-a9db102c0f26	3203	Nova Cerkev
00050000-5593-9128-22a3-a7ec83b5ae96	5000	Nova Gorica 
00050000-5593-9128-2c89-4307aa008f97	5001	Nova Gorica - poštni predali
00050000-5593-9128-5049-ae9e391de79e	1385	Nova vas
00050000-5593-9128-c466-8cfd1369e15a	8000	Novo mesto
00050000-5593-9128-66df-c988c8b4b824	8001	Novo mesto - poštni predali
00050000-5593-9128-204f-0b12d6235252	6243	Obrov
00050000-5593-9128-c472-7a3d98b05373	9233	Odranci
00050000-5593-9128-bcd2-1c70f4555448	2317	Oplotnica
00050000-5593-9128-9d81-83e2978fd593	2312	Orehova vas
00050000-5593-9128-b9cc-65995f389287	2270	Ormož
00050000-5593-9128-7a20-a1bac9638422	1316	Ortnek
00050000-5593-9128-1ddc-100c77ba716a	1337	Osilnica
00050000-5593-9128-5482-cc7309b9c50d	8222	Otočec
00050000-5593-9128-54a0-4d8749095613	2361	Ožbalt
00050000-5593-9128-86cd-aeeb71e94e19	2231	Pernica
00050000-5593-9128-6c0a-1a36f6621ef6	2211	Pesnica pri Mariboru
00050000-5593-9128-d2e3-b7990da5f38c	9203	Petrovci
00050000-5593-9128-bfb2-fdc65a98d292	3301	Petrovče
00050000-5593-9128-c265-390b9828007d	6330	Piran/Pirano
00050000-5593-9128-d6aa-1a46b854233f	8255	Pišece
00050000-5593-9128-8107-8ab0cf25210b	6257	Pivka
00050000-5593-9128-38c2-b1bc4f82e119	6232	Planina
00050000-5593-9128-9f38-0798d0aa5300	3225	Planina pri Sevnici
00050000-5593-9128-779e-fa9a17617fa1	6276	Pobegi
00050000-5593-9128-da40-e340558577f1	8312	Podbočje
00050000-5593-9128-7e28-c489649e00de	5243	Podbrdo
00050000-5593-9128-ed8b-da9f6dc74838	3254	Podčetrtek
00050000-5593-9128-e142-6091ad577679	2273	Podgorci
00050000-5593-9128-83b9-c4d5536aecdd	6216	Podgorje
00050000-5593-9128-67fa-429c4660ab32	2381	Podgorje pri Slovenj Gradcu
00050000-5593-9128-7000-461373bdc39e	6244	Podgrad
00050000-5593-9128-b3df-86f475db4e02	1414	Podkum
00050000-5593-9128-4acf-7bd7e4e43c69	2286	Podlehnik
00050000-5593-9128-756c-8ca00cdfd029	5272	Podnanos
00050000-5593-9128-1dcf-e97a769e85fc	4244	Podnart
00050000-5593-9128-2b66-5028a7fffdff	3241	Podplat
00050000-5593-9128-eeb1-dee0c8734e39	3257	Podsreda
00050000-5593-9128-83ad-3b2d22f0325f	2363	Podvelka
00050000-5593-9128-b457-96bd59f1ed49	2208	Pohorje
00050000-5593-9128-33d1-88ccc0fb685d	2257	Polenšak
00050000-5593-9128-3d0c-59fa3a71f527	1355	Polhov Gradec
00050000-5593-9128-168e-d4c2a89676a3	4223	Poljane nad Škofjo Loko
00050000-5593-9128-f2aa-b562cbf10f0f	2319	Poljčane
00050000-5593-9128-e196-86f59f08adb7	1272	Polšnik
00050000-5593-9128-636c-2381d4772662	3313	Polzela
00050000-5593-9128-ad54-b6fa94de6e8c	3232	Ponikva
00050000-5593-9128-b7da-a98212716190	6320	Portorož/Portorose
00050000-5593-9128-d53c-fa7f88e6949e	6230	Postojna
00050000-5593-9128-4d6b-828e4fb0ab2e	2331	Pragersko
00050000-5593-9128-bf04-fb596a74502f	3312	Prebold
00050000-5593-9128-8b03-a5d201f66ccc	4205	Preddvor
00050000-5593-9128-9b05-898dda3ea859	6255	Prem
00050000-5593-9128-3bbc-90645f5af249	1352	Preserje
00050000-5593-9128-2a71-1e289843dafe	6258	Prestranek
00050000-5593-9128-0be2-45fcde10ec45	2391	Prevalje
00050000-5593-9128-1296-9d37bd14926e	3262	Prevorje
00050000-5593-9128-457e-0f45f807d47d	1276	Primskovo 
00050000-5593-9128-89ba-d945cfaa0d75	3253	Pristava pri Mestinju
00050000-5593-9128-6044-619c96ef3511	9207	Prosenjakovci/Partosfalva
00050000-5593-9128-788a-09badde644ae	5297	Prvačina
00050000-5593-9128-cc3b-6f22a7a6c0db	2250	Ptuj
00050000-5593-9128-94bb-5541beaa5865	2323	Ptujska Gora
00050000-5593-9128-7aef-1b11a8b0cd33	9201	Puconci
00050000-5593-9128-d40d-b5d33a1aa243	2327	Rače
00050000-5593-9128-33ae-d58b6c26f370	1433	Radeče
00050000-5593-9128-362e-e35714742702	9252	Radenci
00050000-5593-9128-5849-225e5a7ce335	2360	Radlje ob Dravi
00050000-5593-9128-3449-859e228a14b9	1235	Radomlje
00050000-5593-9128-81b6-2f95e2981aae	4240	Radovljica
00050000-5593-9128-140c-f822ee33713f	8274	Raka
00050000-5593-9128-5ef3-cfd50338aef6	1381	Rakek
00050000-5593-9128-addd-4ebf03254375	4283	Rateče - Planica
00050000-5593-9128-58ab-4fa43b821bab	2390	Ravne na Koroškem
00050000-5593-9128-c63a-6e6877d79d2f	9246	Razkrižje
00050000-5593-9128-03a8-4269d7d73965	3332	Rečica ob Savinji
00050000-5593-9128-5f32-00bc1e6f90e8	5292	Renče
00050000-5593-9128-3137-3b956ed60792	1310	Ribnica
00050000-5593-9128-4ce4-6fc83ddaca4e	2364	Ribnica na Pohorju
00050000-5593-9128-2964-f17523444957	3272	Rimske Toplice
00050000-5593-9128-8b71-2ac527a5dc72	1314	Rob
00050000-5593-9128-2f6b-30a5d12ac604	5215	Ročinj
00050000-5593-9128-1b27-1f16430ed433	3250	Rogaška Slatina
00050000-5593-9128-e23d-1e55f0d93819	9262	Rogašovci
00050000-5593-9128-0d7e-669a2075d248	3252	Rogatec
00050000-5593-9128-c985-81ba97f6a732	1373	Rovte
00050000-5593-9128-b6f5-b6bcc94e657b	2342	Ruše
00050000-5593-9128-271e-eab7a08c15bc	1282	Sava
00050000-5593-9128-0ed6-27e0a0eca88b	6333	Sečovlje/Sicciole
00050000-5593-9128-4855-c30ebf5dded2	4227	Selca
00050000-5593-9128-84e6-f46d02255855	2352	Selnica ob Dravi
00050000-5593-9128-3a0c-2f6f7fd808f2	8333	Semič
00050000-5593-9128-9b09-f6e2a98489cd	8281	Senovo
00050000-5593-9128-f79d-a284800f6f5d	6224	Senožeče
00050000-5593-9128-2a50-f70414afe908	8290	Sevnica
00050000-5593-9128-88d5-d4246fe95fe2	6210	Sežana
00050000-5593-9128-ac84-18c52eaf4d72	2214	Sladki Vrh
00050000-5593-9128-cb4b-1f89c92dbf94	5283	Slap ob Idrijci
00050000-5593-9128-9dc7-78caa63119eb	2380	Slovenj Gradec
00050000-5593-9128-9f7c-836907c5cb24	2310	Slovenska Bistrica
00050000-5593-9128-b965-1050db4e3c40	3210	Slovenske Konjice
00050000-5593-9128-aad8-d674c13d1fd1	1216	Smlednik
00050000-5593-9128-e762-010b88c71ac9	5232	Soča
00050000-5593-9128-5246-46f1fff610d7	1317	Sodražica
00050000-5593-9128-02ed-a7324e68ed80	3335	Solčava
00050000-5593-9128-a1ec-665251c4eabb	5250	Solkan
00050000-5593-9128-45a9-32d62e8632e6	4229	Sorica
00050000-5593-9128-647f-434474600bf7	4225	Sovodenj
00050000-5593-9128-cbfc-a6b838dd0f1f	5281	Spodnja Idrija
00050000-5593-9128-0470-60601520fcd7	2241	Spodnji Duplek
00050000-5593-9128-c3a8-6568a2188dfe	9245	Spodnji Ivanjci
00050000-5593-9128-a806-59e61e1e3df6	2277	Središče ob Dravi
00050000-5593-9128-f4d4-94d5644c067f	4267	Srednja vas v Bohinju
00050000-5593-9128-e97b-bc785b51a4cc	8256	Sromlje 
00050000-5593-9128-7d7d-ee0a8b92c756	5224	Srpenica
00050000-5593-9128-1495-23be6ddeb718	1242	Stahovica
00050000-5593-9128-33a0-9057febe29ad	1332	Stara Cerkev
00050000-5593-9128-eb86-e9c27f8b6f6d	8342	Stari trg ob Kolpi
00050000-5593-9128-ff91-1b51a42f8cfc	1386	Stari trg pri Ložu
00050000-5593-9128-e7cd-fdc75696ff2b	2205	Starše
00050000-5593-9128-daec-6c65cbbc81e0	2289	Stoperce
00050000-5593-9128-6b3a-91fdee853063	8322	Stopiče
00050000-5593-9128-f390-d40b1f229c3e	3206	Stranice
00050000-5593-9128-5dd7-4234bd9c750b	8351	Straža
00050000-5593-9128-f04d-28732d457457	1313	Struge
00050000-5593-9128-3022-df7be21b41ec	8293	Studenec
00050000-5593-9128-be38-0ec31e72a70a	8331	Suhor
00050000-5593-9128-5226-ff2a8fe8b092	2233	Sv. Ana v Slovenskih goricah
00050000-5593-9128-39e6-965f251804b2	2235	Sv. Trojica v Slovenskih goricah
00050000-5593-9128-911a-dbf3c16d223a	2353	Sveti Duh na Ostrem Vrhu
00050000-5593-9128-6801-5eb7b842dd62	9244	Sveti Jurij ob Ščavnici
00050000-5593-9128-1bc5-311791d292df	3264	Sveti Štefan
00050000-5593-9128-1b22-bfd50b04cae6	2258	Sveti Tomaž
00050000-5593-9128-542d-091ad24f8f45	9204	Šalovci
00050000-5593-9128-3823-a47b0e0c39fa	5261	Šempas
00050000-5593-9128-eb9c-53e876a9ed70	5290	Šempeter pri Gorici
00050000-5593-9128-d9ee-66c1eaeb23c1	3311	Šempeter v Savinjski dolini
00050000-5593-9128-6240-5a3b811e6eb6	4208	Šenčur
00050000-5593-9128-df15-798681aa6059	2212	Šentilj v Slovenskih goricah
00050000-5593-9128-0f53-6b1d9b869f02	8297	Šentjanž
00050000-5593-9128-7d38-2bef36a8e3b8	2373	Šentjanž pri Dravogradu
00050000-5593-9128-3270-78033adc9f16	8310	Šentjernej
00050000-5593-9128-683f-bff2c7d6e66e	3230	Šentjur
00050000-5593-9128-34ee-0103cd859987	3271	Šentrupert
00050000-5593-9128-7c50-dc77d35df8f6	8232	Šentrupert
00050000-5593-9128-3d35-fbbc87ed969f	1296	Šentvid pri Stični
00050000-5593-9128-1859-ad2ac245d252	8275	Škocjan
00050000-5593-9128-2ff3-b8f0f9f915e4	6281	Škofije
00050000-5593-9128-b2be-abf35429017a	4220	Škofja Loka
00050000-5593-9128-c5e5-29357bab6876	3211	Škofja vas
00050000-5593-9128-3bb2-6934c3e2372a	1291	Škofljica
00050000-5593-9128-a777-3e549c532be1	6274	Šmarje
00050000-5593-9128-e186-3b8cec4ee971	1293	Šmarje - Sap
00050000-5593-9128-192e-4c6b41d66f55	3240	Šmarje pri Jelšah
00050000-5593-9128-c4d0-e375b1f9e709	8220	Šmarješke Toplice
00050000-5593-9128-99e7-5538ebee5ec4	2315	Šmartno na Pohorju
00050000-5593-9128-11f8-52b13d5a645a	3341	Šmartno ob Dreti
00050000-5593-9128-8df0-8ef20f977a05	3327	Šmartno ob Paki
00050000-5593-9128-bf44-33b7e68cf0b4	1275	Šmartno pri Litiji
00050000-5593-9128-4ea0-fc9f3c398cc3	2383	Šmartno pri Slovenj Gradcu
00050000-5593-9128-8013-d4b4f755b8b7	3201	Šmartno v Rožni dolini
00050000-5593-9128-ec81-666d1a7e7a9f	3325	Šoštanj
00050000-5593-9128-4514-e8b69c7bfff9	6222	Štanjel
00050000-5593-9128-6267-5ee7f4f570fa	3220	Štore
00050000-5593-9128-e7f7-c8d823910dea	3304	Tabor
00050000-5593-9128-d829-4ea19179fe13	3221	Teharje
00050000-5593-9128-fd48-9d69184891a3	9251	Tišina
00050000-5593-9128-df51-0e5932137913	5220	Tolmin
00050000-5593-9128-640e-f6db83d5bbce	3326	Topolšica
00050000-5593-9128-beba-99b6a5162bc6	2371	Trbonje
00050000-5593-9128-ff83-6e9c51c5ea5e	1420	Trbovlje
00050000-5593-9128-ff83-598b907af3cb	8231	Trebelno 
00050000-5593-9128-3fc9-81933e6fead9	8210	Trebnje
00050000-5593-9128-0e32-5141c403857f	5252	Trnovo pri Gorici
00050000-5593-9128-0858-3d9e29104529	2254	Trnovska vas
00050000-5593-9128-2909-2797c577b81c	1222	Trojane
00050000-5593-9128-cdf7-4959a9838dce	1236	Trzin
00050000-5593-9128-3a55-f821eb71dc63	4290	Tržič
00050000-5593-9128-b3f2-048f8f847bbf	8295	Tržišče
00050000-5593-9128-be6d-ad1fc5d94225	1311	Turjak
00050000-5593-9128-1dfd-0bc295e6f28b	9224	Turnišče
00050000-5593-9128-a33d-8c974280923a	8323	Uršna sela
00050000-5593-9128-da6e-d1b4441f1122	1252	Vače
00050000-5593-9128-4b0e-c4679f7e28e5	3320	Velenje 
00050000-5593-9128-23e9-dce03201ec78	3322	Velenje - poštni predali
00050000-5593-9128-9cb9-ea634fc75e36	8212	Velika Loka
00050000-5593-9128-60d5-af1c6589e23b	2274	Velika Nedelja
00050000-5593-9128-14c1-094c907e1533	9225	Velika Polana
00050000-5593-9128-0a0a-48023f3fbcad	1315	Velike Lašče
00050000-5593-9128-e08c-910180e5596b	8213	Veliki Gaber
00050000-5593-9128-b271-a19d1f5ac2ca	9241	Veržej
00050000-5593-9128-b8db-de6ae28ca40d	1312	Videm - Dobrepolje
00050000-5593-9128-e09e-c5add909c91e	2284	Videm pri Ptuju
00050000-5593-9128-dbc9-9c83d6d9c766	8344	Vinica
00050000-5593-9128-8885-6efc5f83df4b	5271	Vipava
00050000-5593-9128-9cec-c5621e53fb6e	4212	Visoko
00050000-5593-9128-dfc7-3d5536c11078	1294	Višnja Gora
00050000-5593-9128-bb8b-8d9fb36a65bc	3205	Vitanje
00050000-5593-9128-6940-500ff0ea4fb3	2255	Vitomarci
00050000-5593-9128-3ffb-44fdb30dd664	1217	Vodice
00050000-5593-9128-2068-01156ff0aa89	3212	Vojnik\t
00050000-5593-9128-4e84-7e795d3734a4	5293	Volčja Draga
00050000-5593-9128-092e-9ba44af8b28f	2232	Voličina
00050000-5593-9128-4c10-4610f70212d1	3305	Vransko
00050000-5593-9128-5e07-984c2487f7a8	6217	Vremski Britof
00050000-5593-9128-bfda-298062b4a6e5	1360	Vrhnika
00050000-5593-9128-f2e1-5f88d299a888	2365	Vuhred
00050000-5593-9128-319a-0548fb00bed1	2367	Vuzenica
00050000-5593-9128-4131-f4dcfe7964d5	8292	Zabukovje 
00050000-5593-9128-14ff-05e8cbe592e6	1410	Zagorje ob Savi
00050000-5593-9128-33b6-174229d28921	1303	Zagradec
00050000-5593-9128-9242-1a9efd2eb6a9	2283	Zavrč
00050000-5593-9128-49a8-49308e6389fc	8272	Zdole 
00050000-5593-9128-8fef-16d87d5a9d37	4201	Zgornja Besnica
00050000-5593-9128-6aaf-0402d6b7f2e1	2242	Zgornja Korena
00050000-5593-9128-3a24-90f9a6a643cd	2201	Zgornja Kungota
00050000-5593-9128-ba09-61298f9aa05f	2316	Zgornja Ložnica
00050000-5593-9128-44b8-9533dcaa20e1	2314	Zgornja Polskava
00050000-5593-9128-ee7d-9d3d794e18a7	2213	Zgornja Velka
00050000-5593-9128-4315-40fa7faa245f	4247	Zgornje Gorje
00050000-5593-9128-c310-cac2253126b2	4206	Zgornje Jezersko
00050000-5593-9128-d242-9fe0153066e0	2285	Zgornji Leskovec
00050000-5593-9128-a212-4cb3b9e5cd70	1432	Zidani Most
00050000-5593-9128-f444-5de074d5de94	3214	Zreče
00050000-5593-9128-276d-8a3fc476ea38	4209	Žabnica
00050000-5593-9128-d52d-ef6310271b7b	3310	Žalec
00050000-5593-9128-d893-17b13079ee5a	4228	Železniki
00050000-5593-9128-ab41-d1b120eee62e	2287	Žetale
00050000-5593-9128-2367-8f8881785047	4226	Žiri
00050000-5593-9128-8a4b-6146fe653a6f	4274	Žirovnica
00050000-5593-9128-7810-d887f8cbddbd	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8614318)
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
-- TOC entry 2859 (class 0 OID 8614129)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8614207)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8614330)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8614450)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8614499)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5593-9129-97a2-05e4ec38a0a3	00080000-5593-9129-0150-07cd2400ddfa	0900	AK
00190000-5593-9129-fd76-974f416a0952	00080000-5593-9129-74ba-3dcfbaeb9154	0987	A
00190000-5593-9129-5291-9a75548e759a	00080000-5593-9129-a113-ac27298e65c6	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8614633)
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
-- TOC entry 2883 (class 0 OID 8614359)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5593-9129-a8ed-6c6ee54044e4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5593-9129-0bc4-17e160fee6f3	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5593-9129-1aea-3c0622e49db6	0003	Kazinska	t	84	Kazinska dvorana
00220000-5593-9129-4e25-43ce3cd977d0	0004	Mali oder	t	24	Mali oder 
00220000-5593-9129-18f7-105657448e77	0005	Komorni oder	t	15	Komorni oder
00220000-5593-9129-e636-8a0925fccf68	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5593-9129-63c1-411b35439b4d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8614303)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8614293)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8614488)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8614427)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8614001)
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
-- TOC entry 2884 (class 0 OID 8614369)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8614039)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5593-9128-e641-66c190f40e26	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5593-9128-fa62-cc65d3fcea10	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5593-9128-f1ca-cee867cc4c18	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5593-9128-4fc2-cd8a1a2c4533	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5593-9128-1e1c-09b6212e6e99	planer	Planer dogodkov v koledarju	t
00020000-5593-9128-1544-7b9555171d99	kadrovska	Kadrovska služba	t
00020000-5593-9128-ee8d-9d3ffd32de59	arhivar	Ažuriranje arhivalij	t
00020000-5593-9128-7252-16088331b33a	igralec	Igralec	t
00020000-5593-9128-e690-901a84eab791	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5593-9129-178d-fa0407a79a70	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8614023)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5593-9128-3f83-dbacb882940a	00020000-5593-9128-f1ca-cee867cc4c18
00010000-5593-9128-ec76-32d9f5226bfd	00020000-5593-9128-f1ca-cee867cc4c18
00010000-5593-9129-a5b8-a48914b4e5ba	00020000-5593-9129-178d-fa0407a79a70
\.


--
-- TOC entry 2886 (class 0 OID 8614383)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8614324)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8614274)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8614683)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5593-9128-1a2c-df50108b17f1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5593-9128-4be7-caa40a21c973	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5593-9128-8d05-e671d6463da0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5593-9128-35a5-1308b641c0dc	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5593-9128-7e4a-3f241649e3ea	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8614675)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5593-9128-fab2-14acf8ff4879	00230000-5593-9128-35a5-1308b641c0dc	popa
00240000-5593-9128-3fb6-e8ac19edcc45	00230000-5593-9128-35a5-1308b641c0dc	oseba
00240000-5593-9128-5069-d9440b679ae0	00230000-5593-9128-4be7-caa40a21c973	prostor
00240000-5593-9128-edd8-c2d206ffb30f	00230000-5593-9128-35a5-1308b641c0dc	besedilo
00240000-5593-9128-d50c-95640ef0f2e3	00230000-5593-9128-35a5-1308b641c0dc	uprizoritev
00240000-5593-9128-6cda-e27f716ce2eb	00230000-5593-9128-35a5-1308b641c0dc	funkcija
00240000-5593-9128-c890-82ad6e0b983b	00230000-5593-9128-35a5-1308b641c0dc	tipfunkcije
00240000-5593-9128-6d2e-d8279c2bab63	00230000-5593-9128-35a5-1308b641c0dc	alternacija
00240000-5593-9128-9ee9-675e21dc21d8	00230000-5593-9128-1a2c-df50108b17f1	pogodba
00240000-5593-9128-18ae-dd89f307a156	00230000-5593-9128-35a5-1308b641c0dc	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8614670)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8614437)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5593-912a-986b-602e083c5305	000e0000-5593-9129-28e5-078adbc98fbc	00080000-5593-9129-7da9-37ad6b2400c1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5593-912a-58bb-6ee9c702cee2	000e0000-5593-9129-28e5-078adbc98fbc	00080000-5593-9129-7da9-37ad6b2400c1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5593-912a-80e8-58964ce5901d	000e0000-5593-9129-28e5-078adbc98fbc	00080000-5593-9129-8fe7-5d5c0692918c	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8614101)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8614280)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5593-912a-ba32-0b6baad0b7bf	00180000-5593-912a-74be-66c7526bd8e5	000c0000-5593-912a-5df2-af867ba6da9f	00090000-5593-9129-1c83-df1dd2834390	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-912a-1c91-00c4b39d871b	00180000-5593-912a-74be-66c7526bd8e5	000c0000-5593-912a-73b9-d64b069c5e95	00090000-5593-9129-7eb0-7d9cd8505896	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-912a-fb4d-e0dc6c4e67e8	00180000-5593-912a-74be-66c7526bd8e5	000c0000-5593-912a-ad84-c1849d1e185b	00090000-5593-9129-35bd-4633e0ce5246	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-912a-b6c6-4a253cc31d3e	00180000-5593-912a-74be-66c7526bd8e5	000c0000-5593-912a-2086-38b7456332cf	00090000-5593-9129-a654-217fe8b0ee15	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-912a-cee4-983a1e4a9b44	00180000-5593-912a-74be-66c7526bd8e5	000c0000-5593-912a-cbfc-2cb174a985ef	00090000-5593-9129-d1a2-0afbb017e5fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-912a-1fbb-ea0579c3cb30	00180000-5593-912a-db1d-5f830190013a	\N	00090000-5593-9129-d1a2-0afbb017e5fe	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8614477)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5593-9128-3bb5-344be1c35ac0	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5593-9128-b4e8-8d2703c4975b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5593-9128-53eb-7f86d3b663ac	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5593-9128-47fc-154146d28cd1	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5593-9128-cbce-f176d87cd435	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5593-9128-c96c-67027f8638ec	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5593-9128-8324-4a40080f4169	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5593-9128-a7fb-045adb3fe66d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5593-9128-6266-da21fa64069f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5593-9128-0fe4-d5558ac4623b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5593-9128-ce07-0eea404977f6	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5593-9128-f969-f4d10fe93b25	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5593-9128-d4cc-6ac2bef4cbf2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5593-9128-d848-1eb4fb2c3c73	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5593-9128-38bb-aeb6447193d0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5593-9128-6224-228891c29b04	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8614652)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5593-9128-441e-f311c5835df8	01	Velika predstava	f	1.00	1.00
002b0000-5593-9128-618d-20ef23932ae3	02	Mala predstava	f	0.50	0.50
002b0000-5593-9128-588e-4c8513f13c16	03	Mala koprodukcija	t	0.40	1.00
002b0000-5593-9128-dfeb-4e6be94739ff	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5593-9128-4c85-7058fa47088e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8614164)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8614010)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5593-9128-ec76-32d9f5226bfd	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROijcYl8B1dK.ZfoDUZA7HKZtMLtKK.yK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5593-9129-5fa4-30c12639fe8b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5593-9129-9d6b-97b5fcff2270	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5593-9129-2e14-3b66750e6387	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5593-9129-fb9b-40d13b814791	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5593-9129-9e3d-ea8252298aee	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5593-9129-2155-93af88ebcbd7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5593-9129-abee-52d6ab13c8c6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5593-9129-4490-f589ca6f1699	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5593-9129-3e47-0e3b9cdbf4f7	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5593-9129-a5b8-a48914b4e5ba	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5593-9128-3f83-dbacb882940a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8614534)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5593-9129-547a-af0d3e9c12b4	00160000-5593-9129-ab93-996ba32f1bf9	00150000-5593-9128-173f-beabbd40d659	00140000-5593-9127-7116-743d37e2e0ef	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5593-9129-18f7-105657448e77
000e0000-5593-9129-28e5-078adbc98fbc	00160000-5593-9129-ff12-06eab611fce0	00150000-5593-9128-5ca4-708eedaa770e	00140000-5593-9127-6c61-16129be9d243	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5593-9129-e636-8a0925fccf68
000e0000-5593-9129-4db8-d948a39cc285	\N	00150000-5593-9128-5ca4-708eedaa770e	00140000-5593-9127-6c61-16129be9d243	00190000-5593-9129-fd76-974f416a0952	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5593-9129-18f7-105657448e77
000e0000-5593-9129-a97e-60c2feb3773d	\N	00150000-5593-9128-5ca4-708eedaa770e	00140000-5593-9127-6c61-16129be9d243	00190000-5593-9129-fd76-974f416a0952	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5593-9129-18f7-105657448e77
000e0000-5593-9129-573b-edc6712b9275	\N	00150000-5593-9128-5ca4-708eedaa770e	00140000-5593-9127-6c61-16129be9d243	00190000-5593-9129-fd76-974f416a0952	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5593-9129-a8ed-6c6ee54044e4
\.


--
-- TOC entry 2867 (class 0 OID 8614226)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5593-912a-0709-9ec041e96dd1	000e0000-5593-9129-28e5-078adbc98fbc	1	
00200000-5593-912a-8906-b4e06fa757a8	000e0000-5593-9129-28e5-078adbc98fbc	2	
\.


--
-- TOC entry 2882 (class 0 OID 8614351)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8614420)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8614258)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8614524)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5593-9127-7116-743d37e2e0ef	01	Drama	drama (SURS 01)
00140000-5593-9127-ba97-bff96184e61f	02	Opera	opera (SURS 02)
00140000-5593-9127-90d4-f4dca4767c88	03	Balet	balet (SURS 03)
00140000-5593-9127-e869-b786ec24de25	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5593-9127-81ce-d203185fb806	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5593-9127-6c61-16129be9d243	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5593-9127-c383-a5ac244193cf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8614410)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5593-9128-d810-3011bb866f16	01	Opera	opera
00150000-5593-9128-9b34-582bd75df7ae	02	Opereta	opereta
00150000-5593-9128-d48e-d34e3a95d619	03	Balet	balet
00150000-5593-9128-2c7d-2ebb076d3f2a	04	Plesne prireditve	plesne prireditve
00150000-5593-9128-2517-41bdec70399e	05	Lutkovno gledališče	lutkovno gledališče
00150000-5593-9128-27b3-8663254c2452	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5593-9128-be3d-898ed02359bc	07	Biografska drama	biografska drama
00150000-5593-9128-173f-beabbd40d659	08	Komedija	komedija
00150000-5593-9128-4c88-3c361ac32126	09	Črna komedija	črna komedija
00150000-5593-9128-5eec-08aea8135e35	10	E-igra	E-igra
00150000-5593-9128-5ca4-708eedaa770e	11	Kriminalka	kriminalka
00150000-5593-9128-b380-62357fc8f96d	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8614064)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8614581)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8614571)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8614476)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8614248)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8614273)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8614668)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8614190)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8614628)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8614406)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8614224)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8614267)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8614204)
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
-- TOC entry 2533 (class 2606 OID 8614316)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8614343)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8614162)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8614073)
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
-- TOC entry 2448 (class 2606 OID 8614097)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8614053)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8614038)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8614349)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8614382)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8614519)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8614126)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8614150)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8614322)
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
-- TOC entry 2463 (class 2606 OID 8614140)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8614211)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8614334)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8614458)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8614504)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8614650)
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
-- TOC entry 2553 (class 2606 OID 8614366)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8614307)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8614298)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8614498)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8614434)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8614009)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8614373)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8614027)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8614047)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8614391)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8614329)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8614279)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8614692)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8614680)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8614674)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8614447)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8614106)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8614289)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8614487)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8614662)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8614175)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8614022)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8614550)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8614233)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8614357)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8614425)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8614262)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8614532)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8614418)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8614255)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8614448)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8614449)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8614128)
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
-- TOC entry 2546 (class 1259 OID 8614350)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8614336)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8614335)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8614234)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8614407)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8614409)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8614408)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8614206)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8614205)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8614521)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8614522)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8614523)
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
-- TOC entry 2608 (class 1259 OID 8614555)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8614552)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8614556)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8614554)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8614553)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8614177)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8614176)
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
-- TOC entry 2446 (class 1259 OID 8614100)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8614374)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8614268)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8614054)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8614055)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8614394)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8614393)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8614392)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8614212)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8614214)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8614213)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8614682)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8614302)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8614300)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8614299)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8614301)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8614028)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8614029)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8614358)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8614323)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8614435)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8614436)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8614632)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8614629)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8614630)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8614631)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8614142)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8614141)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8614143)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8614459)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8614460)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8614585)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8614586)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8614583)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8614584)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8614426)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8614311)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8614310)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8614308)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8614309)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8614573)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8614572)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8614651)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8614225)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8614669)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8614075)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8614074)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8614107)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8614108)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8614292)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8614291)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8614290)
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
-- TOC entry 2498 (class 1259 OID 8614257)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8614253)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8614250)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8614251)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8614249)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8614254)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8614252)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8614127)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8614191)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8614193)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8614192)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8614194)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8614317)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8614520)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8614551)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8614098)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8614099)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8614419)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8614693)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8614163)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8614681)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8614368)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8614367)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8614582)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8614151)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8614533)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8614505)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8614506)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8614048)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8614256)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8614829)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8614814)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8614819)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8614839)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8614809)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8614834)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8614824)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8614984)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8614989)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8614744)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8614924)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8614919)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8614914)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8614804)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8614954)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8614964)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8614959)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8614779)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8614774)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8614904)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8615009)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8615014)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8615019)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8615039)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8615024)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8615044)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8615034)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8615029)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8614769)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8614764)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8614729)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8614724)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8614934)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8614844)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8614704)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8614709)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8614949)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8614944)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8614939)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8614784)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8614794)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8614789)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8615109)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8614879)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8614869)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8614864)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8614874)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8614694)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8614699)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8614929)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8614909)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8614974)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8614979)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8615094)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8615079)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8615084)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8615089)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8614754)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8614749)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8614759)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8614994)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8614999)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8615069)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8615074)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8615059)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8615064)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8614969)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8614899)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8614894)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8614884)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8614889)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8615054)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8615049)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8615099)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8614799)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8615004)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8615104)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8614719)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8614714)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8614734)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8614739)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8614859)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8614854)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8614849)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-01 09:05:14 CEST

--
-- PostgreSQL database dump complete
--

