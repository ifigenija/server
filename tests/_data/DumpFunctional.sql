--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-02 16:39:16 CEST

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
-- TOC entry 183 (class 1259 OID 8911141)
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
-- TOC entry 230 (class 1259 OID 8911659)
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
-- TOC entry 229 (class 1259 OID 8911642)
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
-- TOC entry 222 (class 1259 OID 8911546)
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
-- TOC entry 197 (class 1259 OID 8911320)
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
-- TOC entry 200 (class 1259 OID 8911354)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8911748)
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
-- TOC entry 192 (class 1259 OID 8911263)
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
-- TOC entry 231 (class 1259 OID 8911672)
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
-- TOC entry 216 (class 1259 OID 8911480)
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
-- TOC entry 195 (class 1259 OID 8911300)
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
-- TOC entry 199 (class 1259 OID 8911348)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8911280)
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
-- TOC entry 205 (class 1259 OID 8911397)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8911422)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8911237)
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
-- TOC entry 184 (class 1259 OID 8911150)
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
-- TOC entry 185 (class 1259 OID 8911161)
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
-- TOC entry 180 (class 1259 OID 8911115)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8911134)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8911429)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8911460)
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
-- TOC entry 226 (class 1259 OID 8911592)
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
-- TOC entry 187 (class 1259 OID 8911194)
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
-- TOC entry 189 (class 1259 OID 8911229)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8911403)
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
-- TOC entry 188 (class 1259 OID 8911214)
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
-- TOC entry 194 (class 1259 OID 8911292)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8911415)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8911535)
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
-- TOC entry 225 (class 1259 OID 8911584)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8911718)
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
-- TOC entry 212 (class 1259 OID 8911444)
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
-- TOC entry 204 (class 1259 OID 8911388)
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
-- TOC entry 203 (class 1259 OID 8911378)
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
-- TOC entry 224 (class 1259 OID 8911573)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8911512)
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
-- TOC entry 177 (class 1259 OID 8911086)
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
-- TOC entry 176 (class 1259 OID 8911084)
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
-- TOC entry 213 (class 1259 OID 8911454)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8911124)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8911108)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8911468)
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
-- TOC entry 207 (class 1259 OID 8911409)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8911359)
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
-- TOC entry 237 (class 1259 OID 8911768)
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
-- TOC entry 236 (class 1259 OID 8911760)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8911755)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8911522)
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
-- TOC entry 186 (class 1259 OID 8911186)
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
-- TOC entry 202 (class 1259 OID 8911365)
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
-- TOC entry 223 (class 1259 OID 8911562)
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
-- TOC entry 233 (class 1259 OID 8911737)
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
-- TOC entry 191 (class 1259 OID 8911249)
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
-- TOC entry 178 (class 1259 OID 8911095)
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
-- TOC entry 228 (class 1259 OID 8911619)
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
-- TOC entry 196 (class 1259 OID 8911311)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8911436)
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
-- TOC entry 218 (class 1259 OID 8911505)
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
-- TOC entry 198 (class 1259 OID 8911343)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8911609)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8911495)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8911089)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8911141)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8911659)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5595-4d14-346a-4661810319fe	000d0000-5595-4d14-7d59-da02008f92ce	\N	00090000-5595-4d13-f328-e521b14a0cf7	000b0000-5595-4d13-1f32-95e85e5d861a	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4d14-ed22-7660f42b3433	000d0000-5595-4d14-4b6c-9fd981d09bef	\N	00090000-5595-4d13-ce26-7b14cb3b628c	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4d14-36fc-252509bf2f3e	000d0000-5595-4d14-e5fa-ddfbcaac897d	\N	00090000-5595-4d13-423f-a41543a71b70	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4d14-49a2-a4ec63bee310	000d0000-5595-4d14-5ce5-0a8d2a82ef3e	\N	00090000-5595-4d13-ab4f-cdb4bff2bf2a	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4d14-c3f7-224c8ac3c0e3	000d0000-5595-4d14-285d-b3fbf6ff1cce	\N	00090000-5595-4d13-ea67-0e182eeb8636	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4d14-ca7a-f363659b4380	000d0000-5595-4d14-7985-e8ef573ab4f5	\N	00090000-5595-4d13-ce26-7b14cb3b628c	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8911642)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8911546)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5595-4d13-5787-6978eebc26c1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5595-4d13-fe55-de44c6bf3461	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5595-4d13-56d2-7fc87213f1b9	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8911320)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5595-4d14-6228-1e284cbd748c	\N	\N	00200000-5595-4d14-15ec-48a13d5ebb0c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5595-4d14-19de-d18800e9c1f5	\N	\N	00200000-5595-4d14-35d8-faac8f1dfc7e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5595-4d14-ab2c-1b79cd77662e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5595-4d14-42d6-be59e5baac96	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5595-4d14-3b45-ef6f2376d7de	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8911354)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8911748)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8911263)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5595-4d11-0bcd-9c706b5d6541	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5595-4d11-b384-c4bc48120ea3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5595-4d11-2219-063dd4528ac4	AL	ALB	008	Albania 	Albanija	\N
00040000-5595-4d11-5fad-d61bce9a8dbe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5595-4d11-76e0-7a47c6f4f67f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5595-4d11-73e8-616e1cccf255	AD	AND	020	Andorra 	Andora	\N
00040000-5595-4d11-41f6-9800fb7e9482	AO	AGO	024	Angola 	Angola	\N
00040000-5595-4d11-3404-ab8a61c75714	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5595-4d11-8982-0bd47ccfbda5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5595-4d11-e5b7-08a452838615	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-4d11-291f-2b0ac2e74edb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5595-4d11-2823-75e9fce54a26	AM	ARM	051	Armenia 	Armenija	\N
00040000-5595-4d11-3189-1957a094ac05	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5595-4d11-98ab-d08183c3120c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5595-4d11-ef94-ec3ba792ceea	AT	AUT	040	Austria 	Avstrija	\N
00040000-5595-4d11-b9f0-d0c9697335da	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5595-4d11-ada1-7b70d4dcf730	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5595-4d11-7938-190813a68155	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5595-4d11-92b1-7896121dccba	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5595-4d11-7412-78e75d9d7e1b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5595-4d11-82bf-6a319b1bff03	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5595-4d11-3dd2-b9342cf6c8c4	BE	BEL	056	Belgium 	Belgija	\N
00040000-5595-4d11-c8d6-504fedff761d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5595-4d11-bd98-1a513b352388	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5595-4d11-f22b-4f1c0b441ca6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5595-4d11-5735-3f9d9b2aff60	BT	BTN	064	Bhutan 	Butan	\N
00040000-5595-4d11-464b-c0399cba702d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5595-4d11-22ff-aed5dd771d86	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5595-4d11-3fe7-3263b9a64bad	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5595-4d11-08b9-5700d9f6f7dc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5595-4d11-c3b0-b781db078af6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5595-4d11-f6d3-44b83dcb02ae	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5595-4d11-f082-37eef592e28f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5595-4d11-a797-1ce8e09af915	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5595-4d11-e8e6-49d92e8eff8f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5595-4d11-9b6e-ea1ed24d6d75	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5595-4d11-631d-5e23082764cf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5595-4d11-3b62-a7a1006adac4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5595-4d11-c1ba-3cebb860d8a4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5595-4d11-7430-725c710ab855	CA	CAN	124	Canada 	Kanada	\N
00040000-5595-4d11-bff9-ff50b6ee4a40	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5595-4d11-1fe7-694b53af34d0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5595-4d11-0c6d-60062a3f9e1a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5595-4d11-6b8f-fddd7b19ddc5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5595-4d11-f10f-c1002792e060	CL	CHL	152	Chile 	Čile	\N
00040000-5595-4d11-0db3-ac342ff6a22d	CN	CHN	156	China 	Kitajska	\N
00040000-5595-4d11-d927-d4d8e3f73afc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5595-4d11-d536-edaa97b6cce8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5595-4d11-5571-3840a2523121	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5595-4d11-9fb5-7261a58cb7cc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5595-4d11-9b97-e603e51af139	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5595-4d11-c708-f41c8e939e10	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5595-4d11-ccf5-ef51011c0c9a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5595-4d11-0f37-bca47b5b3792	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5595-4d11-9998-331b8b7f459d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5595-4d11-7d8a-51c8aa25afca	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5595-4d11-7a7c-3e635a30a834	CU	CUB	192	Cuba 	Kuba	\N
00040000-5595-4d11-d440-7325b3b3e806	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5595-4d11-82d1-e02cd21f4059	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5595-4d11-8c18-3ceebb1713c0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5595-4d11-5d2c-134e7e3811d6	DK	DNK	208	Denmark 	Danska	\N
00040000-5595-4d11-9983-da61c6576ae7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5595-4d11-1f1d-2ec4357e86e8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-4d11-c519-4cf6397b499d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5595-4d11-8ee6-ed0b4df424a6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5595-4d11-f973-9301e02fd08b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5595-4d11-f1a0-6e0417eb0f74	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5595-4d11-3534-ed9b632fe7c1	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5595-4d11-eb1f-284ef9934a59	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5595-4d11-03a0-ec498c224b48	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5595-4d11-7f8a-d89b701ee9a6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5595-4d12-2e8c-23be3cba057a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5595-4d12-c96c-99b711cc989e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5595-4d12-1137-7c38878727b6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5595-4d12-e7ef-42287a70f49f	FI	FIN	246	Finland 	Finska	\N
00040000-5595-4d12-379a-bd4364f700fe	FR	FRA	250	France 	Francija	\N
00040000-5595-4d12-5948-3d148da89f6e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5595-4d12-8a6a-076b733ddb80	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5595-4d12-98ef-e8f0f084d95a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5595-4d12-aa58-1da8b83031b8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5595-4d12-c4bf-228a91c06d0b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5595-4d12-a3bd-76b300f91c6b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5595-4d12-911f-b83a2f8dce64	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5595-4d12-5187-db27ec47a62b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5595-4d12-97da-4ef685b1d0cb	GH	GHA	288	Ghana 	Gana	\N
00040000-5595-4d12-409c-492f0bcb12ee	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5595-4d12-7a81-9b3c706a6846	GR	GRC	300	Greece 	Grčija	\N
00040000-5595-4d12-75ed-4b4756553791	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5595-4d12-fce9-76ad91721120	GD	GRD	308	Grenada 	Grenada	\N
00040000-5595-4d12-1c6d-90e20f5d3596	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5595-4d12-9f04-d8906df6825f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5595-4d12-0ee3-889cc9416649	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5595-4d12-0bfa-a1239f102a44	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5595-4d12-0ccf-919b76e7185f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5595-4d12-190c-d491770c8a43	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5595-4d12-a825-96c6dab2f3be	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5595-4d12-1490-77b139bbaee8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5595-4d12-4580-3eea5145bbab	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5595-4d12-d79a-8dece288079d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5595-4d12-f5b8-52a6944155b8	HN	HND	340	Honduras 	Honduras	\N
00040000-5595-4d12-a2d8-a7dde7b8c9d2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5595-4d12-72f0-03eae4f5b81e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5595-4d12-2ba2-a40838b73ede	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5595-4d12-ada6-55e134e97345	IN	IND	356	India 	Indija	\N
00040000-5595-4d12-24f9-1eea6fdc7218	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5595-4d12-616f-534aba4531d2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5595-4d12-1dbd-32cfa836d25d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5595-4d12-f218-9d018faf0f0d	IE	IRL	372	Ireland 	Irska	\N
00040000-5595-4d12-001a-6cc2ea8d3e01	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5595-4d12-9aff-346d89e533c2	IL	ISR	376	Israel 	Izrael	\N
00040000-5595-4d12-0d67-0bff252e604b	IT	ITA	380	Italy 	Italija	\N
00040000-5595-4d12-5fa7-d108d2cab37b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5595-4d12-b2b9-d725e48c85cc	JP	JPN	392	Japan 	Japonska	\N
00040000-5595-4d12-0b33-8e87b11c6fc1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5595-4d12-8e7e-bf3f61584f1d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5595-4d12-2727-424f32a021bc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5595-4d12-8892-8576749bd081	KE	KEN	404	Kenya 	Kenija	\N
00040000-5595-4d12-18e9-3e1cad33bb79	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5595-4d12-bf7a-bd90a62fe720	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5595-4d12-266a-01da406db8b6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5595-4d12-5238-8c7ec01f5ee6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5595-4d12-3acf-83c7c69cb7b6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5595-4d12-96c6-b2ab1d5e4955	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5595-4d12-f3c8-9293d91cdcaa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5595-4d12-24ac-8d7bf11d9158	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5595-4d12-6cc8-e8e3283590fa	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5595-4d12-e24e-d630e82fce43	LR	LBR	430	Liberia 	Liberija	\N
00040000-5595-4d12-85fb-111db4f4bb5b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5595-4d12-3375-144b23a55851	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5595-4d12-9733-7d7dc0ff1f62	LT	LTU	440	Lithuania 	Litva	\N
00040000-5595-4d12-afb5-ecebe4c9b8d6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5595-4d12-8edf-bfe21eb47b0b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5595-4d12-336c-9e9d1104c2f0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5595-4d12-523a-f3bbbccb3d24	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5595-4d12-58cd-f0d6d37b2216	MW	MWI	454	Malawi 	Malavi	\N
00040000-5595-4d12-7339-8f39ebd9e5fa	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5595-4d12-9ffc-1d110b819bc4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5595-4d12-0639-92af573acfcb	ML	MLI	466	Mali 	Mali	\N
00040000-5595-4d12-eb0c-5b7f2813ab83	MT	MLT	470	Malta 	Malta	\N
00040000-5595-4d12-2219-154f5f5e6c4d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5595-4d12-d82a-0d6fbd501bad	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5595-4d12-1d66-4c608597ffb7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5595-4d12-3fe9-3691a0625a6b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5595-4d12-3dca-5e8b7873c4be	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5595-4d12-c785-e5dd4b5439dd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5595-4d12-f96f-d9bec8bb7b00	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5595-4d12-ca28-2c5377e9cb2e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5595-4d12-2859-ff04ae214e29	MC	MCO	492	Monaco 	Monako	\N
00040000-5595-4d12-aca5-6c39b4711180	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5595-4d12-ad41-54b98525889f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5595-4d12-fe5e-4ee421e74bd5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5595-4d12-6eda-1c06147a90e1	MA	MAR	504	Morocco 	Maroko	\N
00040000-5595-4d12-48b2-454f5bc24d4f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5595-4d12-b567-7a120129284d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5595-4d12-2a0d-53016786770c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5595-4d12-7de0-cdb209f54f20	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5595-4d12-c9cb-132b914d1e38	NP	NPL	524	Nepal 	Nepal	\N
00040000-5595-4d12-410b-a4e369c870f5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5595-4d12-77ee-18c538dc4b9e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5595-4d12-4de2-85eb57512de5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5595-4d12-bd0b-450d95e8981d	NE	NER	562	Niger 	Niger 	\N
00040000-5595-4d12-11f2-5ebc7480e5cf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5595-4d12-cba5-29abab269161	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5595-4d12-a16c-3c8ca07fe94d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5595-4d12-4365-abf477cdd285	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5595-4d12-4ca2-5a694fbb2ddf	NO	NOR	578	Norway 	Norveška	\N
00040000-5595-4d12-7b55-31f9c3c103ce	OM	OMN	512	Oman 	Oman	\N
00040000-5595-4d12-30f2-6fe28bc130a6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5595-4d12-6db2-82f672b88312	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5595-4d12-be16-0ceaf0d7643c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5595-4d12-a6af-adeca911b1f2	PA	PAN	591	Panama 	Panama	\N
00040000-5595-4d12-8890-fcf96fbda3b8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5595-4d12-dcbb-243f131ee92b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5595-4d12-d872-cbc773e728a8	PE	PER	604	Peru 	Peru	\N
00040000-5595-4d12-937b-a1279b873af3	PH	PHL	608	Philippines 	Filipini	\N
00040000-5595-4d12-3a96-ad3778454793	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5595-4d12-3b0d-17acbcf1bb28	PL	POL	616	Poland 	Poljska	\N
00040000-5595-4d12-13db-c90efb320442	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5595-4d12-d17d-5fab46d4f38a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5595-4d12-518e-c072c91540df	QA	QAT	634	Qatar 	Katar	\N
00040000-5595-4d12-3fd2-c7a7662033e5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5595-4d12-e660-3f884564ca88	RO	ROU	642	Romania 	Romunija	\N
00040000-5595-4d12-54d9-5fd2d524609d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5595-4d12-aeea-28f22a2bf65f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5595-4d12-5339-4665b8c61b3f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5595-4d12-f993-93397e729bb0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5595-4d12-9b87-50f523255277	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5595-4d12-5079-44903bd02953	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5595-4d12-7891-e8f7fdd8dfe9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5595-4d12-46f2-395c8614159f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5595-4d12-31e2-e06e53907983	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5595-4d12-1aac-cd33de10f6e3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5595-4d12-d8f8-91f913e68974	SM	SMR	674	San Marino 	San Marino	\N
00040000-5595-4d12-a9b0-633931fca49a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5595-4d12-02f3-eedad025bba8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5595-4d12-b9f5-bd987af1ca74	SN	SEN	686	Senegal 	Senegal	\N
00040000-5595-4d12-2896-42be3f7d8e2f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5595-4d12-319a-418eb6d07150	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5595-4d12-5bc3-d282b1f59d90	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5595-4d12-8e9f-c5da6b1d3bbd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5595-4d12-722d-2f32e067b601	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5595-4d12-ad3e-f05de78004ae	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5595-4d12-2c16-d699b2c5751e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5595-4d12-0da2-762685f269ab	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5595-4d12-fee4-e63e8d585544	SO	SOM	706	Somalia 	Somalija	\N
00040000-5595-4d12-ccd1-3df0413a0bbe	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5595-4d12-0ff1-5bee848c1f99	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5595-4d12-d374-08a0789ae012	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5595-4d12-1ad8-be9e6ef53a4a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5595-4d12-f10f-00d9adcc522b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5595-4d12-93ff-62a2a2d3ab26	SD	SDN	729	Sudan 	Sudan	\N
00040000-5595-4d12-6bc9-541ad52c6530	SR	SUR	740	Suriname 	Surinam	\N
00040000-5595-4d12-51bf-188bcdc17717	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5595-4d12-8e35-c877e7446fab	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5595-4d12-4290-98920168228a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5595-4d12-f4bd-c4f7b0cb675c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5595-4d12-a908-124ccb17655d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5595-4d12-e33e-63bd838054f6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5595-4d12-9175-338ab463b5d9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5595-4d12-8a24-f37d79a9a98d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5595-4d12-79aa-5fc9c54546ef	TH	THA	764	Thailand 	Tajska	\N
00040000-5595-4d12-e046-c5a49f5035b2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5595-4d12-19d4-cdcf4b8dba6c	TG	TGO	768	Togo 	Togo	\N
00040000-5595-4d12-d792-125ea349abc7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5595-4d12-d637-d508afd96695	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5595-4d12-2316-33b64c83d129	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5595-4d12-8f73-6449cc9ec4f3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5595-4d12-58cc-00278392d466	TR	TUR	792	Turkey 	Turčija	\N
00040000-5595-4d12-2fc0-f19d0d439d89	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5595-4d12-df86-83aa66f8b09e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-4d12-cd9a-04e8ddb91c81	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5595-4d12-bea3-f01818645fb9	UG	UGA	800	Uganda 	Uganda	\N
00040000-5595-4d12-ebf2-1412b6778584	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5595-4d12-9b9a-4e634c6f1f9c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5595-4d12-9d9a-27bb76f05471	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5595-4d12-8132-f33192f7ae27	US	USA	840	United States 	Združene države Amerike	\N
00040000-5595-4d12-5240-16f2d26bc8bc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5595-4d12-273c-e4b452f2695a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5595-4d12-e6cc-6f526e169f40	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5595-4d12-c235-09a5cd47d7dc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5595-4d12-9d11-72fa48eaf8be	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5595-4d12-5606-9eae8917114a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5595-4d12-2ece-676af6214287	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-4d12-1997-30515ab20afe	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5595-4d12-8532-dd46561357ad	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5595-4d12-96cc-7bf22cee070d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5595-4d12-95e6-19a238211818	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5595-4d12-5e26-df10ad9c8f6c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5595-4d12-3bef-d79761ef89bb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8911672)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5595-4d14-7b73-ec71871620f8	000e0000-5595-4d14-dda2-8f69010fb91d	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5595-4d12-e535-b4e16476785d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5595-4d14-d4dd-6322413bd3d8	000e0000-5595-4d14-1dd1-b7c358d82745	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5595-4d12-4b85-25df2777688e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8911480)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5595-4d14-9b3f-cd3c2c16bdc3	000e0000-5595-4d14-1dd1-b7c358d82745	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5595-4d12-8879-fdad6d8c4a99
000d0000-5595-4d14-7d59-da02008f92ce	000e0000-5595-4d14-1dd1-b7c358d82745	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-4d12-8879-fdad6d8c4a99
000d0000-5595-4d14-4b6c-9fd981d09bef	000e0000-5595-4d14-1dd1-b7c358d82745	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5595-4d12-3c43-7c7fa8d53ceb
000d0000-5595-4d14-e5fa-ddfbcaac897d	000e0000-5595-4d14-1dd1-b7c358d82745	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5595-4d12-d247-9bdc8ae157a5
000d0000-5595-4d14-5ce5-0a8d2a82ef3e	000e0000-5595-4d14-1dd1-b7c358d82745	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5595-4d12-d247-9bdc8ae157a5
000d0000-5595-4d14-285d-b3fbf6ff1cce	000e0000-5595-4d14-1dd1-b7c358d82745	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5595-4d12-d247-9bdc8ae157a5
000d0000-5595-4d14-7985-e8ef573ab4f5	000e0000-5595-4d14-1dd1-b7c358d82745	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-4d12-8879-fdad6d8c4a99
\.


--
-- TOC entry 2866 (class 0 OID 8911300)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8911348)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8911280)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5595-4d14-c284-178aa13f2e95	00080000-5595-4d13-09b0-7df57ecbb6cd	00090000-5595-4d13-f328-e521b14a0cf7	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8911397)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8911422)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8911237)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5595-4d12-5338-8bf0427b60c5	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5595-4d12-3964-8497088e2022	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5595-4d12-e649-e73ec69b22c7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5595-4d12-dae6-3f5cf108d1e1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5595-4d12-7b82-4ca36ddc5d4f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5595-4d12-4737-1828093cfbd4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5595-4d12-e53b-c04488b5bada	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5595-4d12-2e9c-349ad8e23e51	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-4d12-2fa3-4429178c12f5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-4d12-1d2d-f59c5abadf84	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5595-4d12-5b8c-fed63d46f5be	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5595-4d12-4a93-af40a739b9cb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5595-4d12-0cca-ec7f587a6105	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5595-4d13-34fc-572c4e00884f	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5595-4d13-2fba-a11fbcaa814b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5595-4d13-06e4-50302f3363dd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5595-4d13-efbd-87992eae0aac	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5595-4d13-3bc5-fc64f0dd8165	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5595-4d13-4246-50f33a25f9b2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8911150)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5595-4d13-3c84-8d98d794d555	00000000-5595-4d13-2fba-a11fbcaa814b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5595-4d13-9549-829c0495e3ca	00000000-5595-4d13-2fba-a11fbcaa814b	00010000-5595-4d12-2830-23ee846288f0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5595-4d13-e970-0fc3c764d5f6	00000000-5595-4d13-06e4-50302f3363dd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8911161)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5595-4d13-c577-09629d2cd9cc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5595-4d13-ab4f-cdb4bff2bf2a	00010000-5595-4d13-a2e4-a92eedd73912	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5595-4d13-423f-a41543a71b70	00010000-5595-4d13-59cd-82dd64508bea	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5595-4d13-c70d-9af23ac78414	00010000-5595-4d13-e88e-eeae15f498a6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5595-4d13-8ebf-3ad857f72c1b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5595-4d13-460b-3fc224610d5a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5595-4d13-fe82-39fe4d40497f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5595-4d13-7d01-60032a816f15	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5595-4d13-f328-e521b14a0cf7	00010000-5595-4d13-457c-d1e7b5715118	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5595-4d13-ce26-7b14cb3b628c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5595-4d13-8c0f-8c297a8863a2	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5595-4d13-ea67-0e182eeb8636	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5595-4d13-68b5-b36aa9f3f165	00010000-5595-4d13-0afe-60a33faf6f10	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8911115)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5595-4d12-1174-9847a89a5ac5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5595-4d12-b0df-15172acd489d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5595-4d12-f6b8-532d657c3305	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5595-4d12-50fc-512f89cc7507	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5595-4d12-57ae-4238558d7151	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5595-4d12-49a0-97fd89ada2eb	Abonma-read	Abonma - branje	f
00030000-5595-4d12-8117-aa8df3b02caf	Abonma-write	Abonma - spreminjanje	f
00030000-5595-4d12-23f7-1c454739007e	Alternacija-read	Alternacija - branje	f
00030000-5595-4d12-243e-c6eacc7abecd	Alternacija-write	Alternacija - spreminjanje	f
00030000-5595-4d12-cce6-6d1f0b900232	Arhivalija-read	Arhivalija - branje	f
00030000-5595-4d12-a0cd-7bdcf814fda5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5595-4d12-524a-2d20534efbc4	Besedilo-read	Besedilo - branje	f
00030000-5595-4d12-1ad8-244428c364e2	Besedilo-write	Besedilo - spreminjanje	f
00030000-5595-4d12-be96-e32016933f91	DogodekIzven-read	DogodekIzven - branje	f
00030000-5595-4d12-7a33-01f4264e43c7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5595-4d12-2e98-ad6d7143047a	Dogodek-read	Dogodek - branje	f
00030000-5595-4d12-8b52-7b80c76d2e19	Dogodek-write	Dogodek - spreminjanje	f
00030000-5595-4d12-bcc9-ef85f941159f	DrugiVir-read	DrugiVir - branje	f
00030000-5595-4d12-77e9-8c8dfe504638	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5595-4d12-4e95-5105ea1272b0	Drzava-read	Drzava - branje	f
00030000-5595-4d12-350d-69390560abcb	Drzava-write	Drzava - spreminjanje	f
00030000-5595-4d12-1d61-bd8722181017	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5595-4d12-1a19-9e3c53f0ab03	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5595-4d12-4e0b-1613b5a1bc59	Funkcija-read	Funkcija - branje	f
00030000-5595-4d12-65a7-e477cf71b816	Funkcija-write	Funkcija - spreminjanje	f
00030000-5595-4d12-4b88-d3da581fee10	Gostovanje-read	Gostovanje - branje	f
00030000-5595-4d12-450c-8141f21347e9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5595-4d12-6d36-3babb2c9c3cc	Gostujoca-read	Gostujoca - branje	f
00030000-5595-4d12-07e9-bc30832212da	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5595-4d12-b94f-0f48da58ad14	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5595-4d12-536a-028c0efa9f39	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5595-4d12-7e0c-4709f9561f97	Kupec-read	Kupec - branje	f
00030000-5595-4d12-88a8-9870954380b8	Kupec-write	Kupec - spreminjanje	f
00030000-5595-4d12-9239-ab78077d718c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5595-4d12-f4d8-d461e0021a98	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5595-4d12-41da-aa6ea0bd738e	Option-read	Option - branje	f
00030000-5595-4d12-3793-77fea867ffdf	Option-write	Option - spreminjanje	f
00030000-5595-4d12-5f5c-38783f59bf5f	OptionValue-read	OptionValue - branje	f
00030000-5595-4d12-5213-32ab7cfc40ed	OptionValue-write	OptionValue - spreminjanje	f
00030000-5595-4d12-f74d-4de388e5b228	Oseba-read	Oseba - branje	f
00030000-5595-4d12-07ef-1bd2005c4f84	Oseba-write	Oseba - spreminjanje	f
00030000-5595-4d12-7152-5bc9d6f5fd65	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5595-4d12-8c21-fd276ef131ec	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5595-4d12-f136-4121839eab32	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5595-4d12-ea51-8e0634c422b0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5595-4d12-3ba7-3643fa5f1919	Pogodba-read	Pogodba - branje	f
00030000-5595-4d12-db75-2eec1abfe9a1	Pogodba-write	Pogodba - spreminjanje	f
00030000-5595-4d12-c65e-d90495db586d	Popa-read	Popa - branje	f
00030000-5595-4d12-dda5-506d46b26dee	Popa-write	Popa - spreminjanje	f
00030000-5595-4d12-8d09-4f85be109c43	Posta-read	Posta - branje	f
00030000-5595-4d12-5abb-ca5a233f08b2	Posta-write	Posta - spreminjanje	f
00030000-5595-4d12-96d0-cf061aaa510a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5595-4d12-0c37-2427b7b254b3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5595-4d12-30b5-06108fd5caac	PostniNaslov-read	PostniNaslov - branje	f
00030000-5595-4d12-dabb-8454c8b57faa	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5595-4d12-3d99-2174843aba04	Predstava-read	Predstava - branje	f
00030000-5595-4d12-f7ec-47c5daae54b7	Predstava-write	Predstava - spreminjanje	f
00030000-5595-4d12-33e6-de4e8c062e2f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5595-4d12-7fe1-0d7d9124df99	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5595-4d12-426a-7a55af34d8c6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5595-4d12-4bd0-5db331d0cee9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5595-4d12-6c3b-a90085e52a03	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5595-4d12-2194-2afce8a21ef8	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5595-4d12-4adb-97b33e4e779f	ProgramDela-read	ProgramDela - branje	f
00030000-5595-4d12-02a4-4dbbfecc5688	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5595-4d12-13ec-e4ae4df54297	ProgramFestival-read	ProgramFestival - branje	f
00030000-5595-4d12-8bbf-036b6e0b46e8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5595-4d12-79bd-452dde5859c2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5595-4d12-83b9-c524e80c2298	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5595-4d12-4de1-740a83bfe7f1	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5595-4d12-e7ae-4668726ff47f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5595-4d12-bce9-27dd060d39ea	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5595-4d12-ebb3-7dc6e51abfe1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5595-4d12-8587-7ccdbb623e1d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5595-4d12-aa57-0a35e36c432d	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5595-4d12-86ca-67205a076457	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5595-4d12-a855-43b9685b928f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5595-4d12-f3a3-3c2749847207	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5595-4d12-4f46-f70ce9f8f3b1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5595-4d12-68fc-563971e41093	ProgramRazno-read	ProgramRazno - branje	f
00030000-5595-4d12-f189-b8a06d8496b6	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5595-4d12-54a5-72348c5c6427	Prostor-read	Prostor - branje	f
00030000-5595-4d12-2959-d42dacaa7fe0	Prostor-write	Prostor - spreminjanje	f
00030000-5595-4d12-7140-55e7b48170ab	Racun-read	Racun - branje	f
00030000-5595-4d12-e60f-9298b0b4a969	Racun-write	Racun - spreminjanje	f
00030000-5595-4d12-7aef-02b56e2edc5e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5595-4d12-323d-a18e06bf1751	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5595-4d12-6d6a-3de07517aed7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5595-4d12-41c2-e5a1251748d4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5595-4d12-7c9f-c449312bd958	Rekvizit-read	Rekvizit - branje	f
00030000-5595-4d12-6ac2-3049a0398ae1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5595-4d12-b65a-46728a434e53	Revizija-read	Revizija - branje	f
00030000-5595-4d12-3ac8-ae8dc2775bf7	Revizija-write	Revizija - spreminjanje	f
00030000-5595-4d12-28ad-a77050a5d1c6	Rezervacija-read	Rezervacija - branje	f
00030000-5595-4d12-91a0-23f4f2de0b2a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5595-4d12-b69f-cd1e732feecf	SedezniRed-read	SedezniRed - branje	f
00030000-5595-4d12-b8b6-c75bff65e4fa	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5595-4d12-89be-fecf5858200c	Sedez-read	Sedez - branje	f
00030000-5595-4d12-d9cd-6aed3538eeea	Sedez-write	Sedez - spreminjanje	f
00030000-5595-4d12-ae48-b0ce8eb4ed9b	Sezona-read	Sezona - branje	f
00030000-5595-4d12-af06-c75ff40a0ff6	Sezona-write	Sezona - spreminjanje	f
00030000-5595-4d12-3030-0f9aa8da832c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5595-4d12-1a3d-66f637185ac8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5595-4d12-ef0e-fbc333324c56	Stevilcenje-read	Stevilcenje - branje	f
00030000-5595-4d12-9ae5-e32881eb86e2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5595-4d12-fb7e-130941d7e95a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5595-4d12-de2c-7a5f07ae5389	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5595-4d12-aa65-76bfbb55b97a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5595-4d12-3674-d3dad2f1288f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5595-4d12-ccdf-58638cff6c0f	Telefonska-read	Telefonska - branje	f
00030000-5595-4d12-d8ce-45457fb0dc7e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5595-4d12-e568-92ff709bd986	TerminStoritve-read	TerminStoritve - branje	f
00030000-5595-4d12-409a-42ce9b0a5348	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5595-4d12-b964-6a21d7f8666a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5595-4d12-a10d-0332eb436388	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5595-4d12-1039-e607fc87cf43	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5595-4d12-2e3e-00ba4ea61bc7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5595-4d12-4538-60a3647f0110	Trr-read	Trr - branje	f
00030000-5595-4d12-dae8-2e3cd6ebbf5b	Trr-write	Trr - spreminjanje	f
00030000-5595-4d12-4217-d4be81d8c957	Uprizoritev-read	Uprizoritev - branje	f
00030000-5595-4d12-4345-c93821d13183	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5595-4d12-c018-78010f261276	Vaja-read	Vaja - branje	f
00030000-5595-4d12-8270-35dd1732c628	Vaja-write	Vaja - spreminjanje	f
00030000-5595-4d12-2672-667611828527	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5595-4d12-58f3-5e57212e02cd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5595-4d12-439c-f27bf1a18025	Zaposlitev-read	Zaposlitev - branje	f
00030000-5595-4d12-9bfc-a3251b7efc67	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5595-4d12-447d-401d1a63b719	Zasedenost-read	Zasedenost - branje	f
00030000-5595-4d12-1da2-d32a4ce30384	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5595-4d12-1406-3986b8c0058f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5595-4d12-7de3-ba82e44b4ff3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5595-4d12-f3e5-e756a2c2f227	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5595-4d12-1042-61920da14665	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8911134)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5595-4d12-e0b6-4049e6149072	00030000-5595-4d12-b0df-15172acd489d
00020000-5595-4d12-eee9-2b282b8d9b8f	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-8117-aa8df3b02caf
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-23f7-1c454739007e
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-243e-c6eacc7abecd
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-50fc-512f89cc7507
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-8b52-7b80c76d2e19
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-350d-69390560abcb
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-4e0b-1613b5a1bc59
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-65a7-e477cf71b816
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-450c-8141f21347e9
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-07e9-bc30832212da
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-b94f-0f48da58ad14
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-536a-028c0efa9f39
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-f74d-4de388e5b228
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-07ef-1bd2005c4f84
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-dda5-506d46b26dee
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-5abb-ca5a233f08b2
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-30b5-06108fd5caac
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-dabb-8454c8b57faa
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-f7ec-47c5daae54b7
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-6c3b-a90085e52a03
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-2194-2afce8a21ef8
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-2959-d42dacaa7fe0
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-41c2-e5a1251748d4
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-6ac2-3049a0398ae1
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-af06-c75ff40a0ff6
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-b964-6a21d7f8666a
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-4217-d4be81d8c957
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-4345-c93821d13183
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-c018-78010f261276
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-8270-35dd1732c628
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-447d-401d1a63b719
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-1da2-d32a4ce30384
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d12-68ef-669b7d49e00c	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-b94f-0f48da58ad14
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-536a-028c0efa9f39
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-f74d-4de388e5b228
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-07ef-1bd2005c4f84
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-30b5-06108fd5caac
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-dabb-8454c8b57faa
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-ccdf-58638cff6c0f
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-d8ce-45457fb0dc7e
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-4538-60a3647f0110
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-dae8-2e3cd6ebbf5b
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-439c-f27bf1a18025
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-9bfc-a3251b7efc67
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d12-9fa3-a04bfb0bbd51	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-23f7-1c454739007e
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-a0cd-7bdcf814fda5
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-524a-2d20534efbc4
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-be96-e32016933f91
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-4e0b-1613b5a1bc59
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-b94f-0f48da58ad14
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-f74d-4de388e5b228
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-6c3b-a90085e52a03
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-b964-6a21d7f8666a
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-c018-78010f261276
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-447d-401d1a63b719
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d12-9380-21e7e66eacc9	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-8117-aa8df3b02caf
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-243e-c6eacc7abecd
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-b964-6a21d7f8666a
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d12-6ab0-3161c37428c5	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-e568-92ff709bd986
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-f6b8-532d657c3305
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-b964-6a21d7f8666a
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d12-ea84-180a3853c7d8	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1174-9847a89a5ac5
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b0df-15172acd489d
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f6b8-532d657c3305
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-50fc-512f89cc7507
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-57ae-4238558d7151
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-49a0-97fd89ada2eb
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8117-aa8df3b02caf
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-23f7-1c454739007e
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-243e-c6eacc7abecd
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-cce6-6d1f0b900232
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-a0cd-7bdcf814fda5
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-524a-2d20534efbc4
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1ad8-244428c364e2
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-be96-e32016933f91
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7a33-01f4264e43c7
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-2e98-ad6d7143047a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8b52-7b80c76d2e19
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4e95-5105ea1272b0
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-350d-69390560abcb
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1d61-bd8722181017
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1a19-9e3c53f0ab03
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4e0b-1613b5a1bc59
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-65a7-e477cf71b816
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4b88-d3da581fee10
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-450c-8141f21347e9
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-6d36-3babb2c9c3cc
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-07e9-bc30832212da
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b94f-0f48da58ad14
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-536a-028c0efa9f39
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7e0c-4709f9561f97
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-88a8-9870954380b8
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-9239-ab78077d718c
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f4d8-d461e0021a98
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-41da-aa6ea0bd738e
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3793-77fea867ffdf
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-5f5c-38783f59bf5f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-5213-32ab7cfc40ed
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f74d-4de388e5b228
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-07ef-1bd2005c4f84
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7152-5bc9d6f5fd65
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8c21-fd276ef131ec
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f136-4121839eab32
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-ea51-8e0634c422b0
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3ba7-3643fa5f1919
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-db75-2eec1abfe9a1
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-c65e-d90495db586d
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-dda5-506d46b26dee
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8d09-4f85be109c43
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-5abb-ca5a233f08b2
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-96d0-cf061aaa510a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-0c37-2427b7b254b3
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-30b5-06108fd5caac
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-dabb-8454c8b57faa
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3d99-2174843aba04
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f7ec-47c5daae54b7
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-33e6-de4e8c062e2f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7fe1-0d7d9124df99
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-426a-7a55af34d8c6
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4bd0-5db331d0cee9
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-6c3b-a90085e52a03
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-2194-2afce8a21ef8
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4adb-97b33e4e779f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-02a4-4dbbfecc5688
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-13ec-e4ae4df54297
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8bbf-036b6e0b46e8
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-79bd-452dde5859c2
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-83b9-c524e80c2298
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4de1-740a83bfe7f1
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-e7ae-4668726ff47f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-bce9-27dd060d39ea
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-ebb3-7dc6e51abfe1
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8587-7ccdbb623e1d
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-aa57-0a35e36c432d
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-86ca-67205a076457
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-a855-43b9685b928f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f3a3-3c2749847207
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4f46-f70ce9f8f3b1
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-68fc-563971e41093
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f189-b8a06d8496b6
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-54a5-72348c5c6427
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-2959-d42dacaa7fe0
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7140-55e7b48170ab
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-e60f-9298b0b4a969
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7aef-02b56e2edc5e
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-323d-a18e06bf1751
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-6d6a-3de07517aed7
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-41c2-e5a1251748d4
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7c9f-c449312bd958
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-6ac2-3049a0398ae1
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b65a-46728a434e53
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3ac8-ae8dc2775bf7
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-28ad-a77050a5d1c6
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-91a0-23f4f2de0b2a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b69f-cd1e732feecf
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b8b6-c75bff65e4fa
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-89be-fecf5858200c
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-d9cd-6aed3538eeea
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-ae48-b0ce8eb4ed9b
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-af06-c75ff40a0ff6
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3030-0f9aa8da832c
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1a3d-66f637185ac8
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-ef0e-fbc333324c56
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-9ae5-e32881eb86e2
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-fb7e-130941d7e95a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-de2c-7a5f07ae5389
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-aa65-76bfbb55b97a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-3674-d3dad2f1288f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-ccdf-58638cff6c0f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-d8ce-45457fb0dc7e
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-e568-92ff709bd986
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-409a-42ce9b0a5348
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-b964-6a21d7f8666a
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-a10d-0332eb436388
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1039-e607fc87cf43
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-2e3e-00ba4ea61bc7
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4538-60a3647f0110
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-dae8-2e3cd6ebbf5b
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4217-d4be81d8c957
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-4345-c93821d13183
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-c018-78010f261276
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-8270-35dd1732c628
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-2672-667611828527
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-58f3-5e57212e02cd
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-439c-f27bf1a18025
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-9bfc-a3251b7efc67
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-447d-401d1a63b719
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1da2-d32a4ce30384
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1406-3986b8c0058f
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-7de3-ba82e44b4ff3
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-f3e5-e756a2c2f227
00020000-5595-4d13-498f-ea8d30fc4ab9	00030000-5595-4d12-1042-61920da14665
\.


--
-- TOC entry 2881 (class 0 OID 8911429)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8911460)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8911592)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5595-4d13-1f32-95e85e5d861a	00090000-5595-4d13-c577-09629d2cd9cc	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8911194)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5595-4d13-09b0-7df57ecbb6cd	00040000-5595-4d12-2c16-d699b2c5751e	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-32cb-e2a39bdd5060	00040000-5595-4d12-2c16-d699b2c5751e	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5595-4d13-6634-e544438b9f5b	00040000-5595-4d12-2c16-d699b2c5751e	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-892b-733fdab4ed0a	00040000-5595-4d12-2c16-d699b2c5751e	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-158e-506a9a790e0e	00040000-5595-4d12-2c16-d699b2c5751e	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-80e0-c8c1aca9f9ee	00040000-5595-4d11-291f-2b0ac2e74edb	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-44f0-cdcb4de289ec	00040000-5595-4d11-7d8a-51c8aa25afca	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-6933-83652043570a	00040000-5595-4d11-ef94-ec3ba792ceea	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4d13-d986-3605e3185ede	00040000-5595-4d12-2c16-d699b2c5751e	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8911229)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5595-4d12-d773-133e48f189fc	8341	Adlešiči
00050000-5595-4d12-2f84-f70bdeef3dc8	5270	Ajdovščina
00050000-5595-4d12-1720-e055a76de80a	6280	Ankaran/Ancarano
00050000-5595-4d12-ecc0-f3f598d0161b	9253	Apače
00050000-5595-4d12-a904-c9c4a4a2d57e	8253	Artiče
00050000-5595-4d12-bafc-a1904db1c11d	4275	Begunje na Gorenjskem
00050000-5595-4d12-cf0a-e2e4ac20255c	1382	Begunje pri Cerknici
00050000-5595-4d12-14c2-3ee5b1e0a017	9231	Beltinci
00050000-5595-4d12-b5e4-e6d60d80132b	2234	Benedikt
00050000-5595-4d12-7dba-1f9b968a78c6	2345	Bistrica ob Dravi
00050000-5595-4d12-1d41-f9b7366da66a	3256	Bistrica ob Sotli
00050000-5595-4d12-bf8e-65d76cc70310	8259	Bizeljsko
00050000-5595-4d12-5acf-873420c5513a	1223	Blagovica
00050000-5595-4d12-2f99-26e036236a52	8283	Blanca
00050000-5595-4d12-3198-6a9f1a8bc18c	4260	Bled
00050000-5595-4d12-5630-657aca99db10	4273	Blejska Dobrava
00050000-5595-4d12-0e7a-cd17225c14ac	9265	Bodonci
00050000-5595-4d12-3eff-479bbe3d3bc9	9222	Bogojina
00050000-5595-4d12-1073-697a7e625fab	4263	Bohinjska Bela
00050000-5595-4d12-dd79-b1cbae88dfae	4264	Bohinjska Bistrica
00050000-5595-4d12-8abc-44aacf529a36	4265	Bohinjsko jezero
00050000-5595-4d12-9164-f816676111b6	1353	Borovnica
00050000-5595-4d12-a0b4-42a4a1b6fa6a	8294	Boštanj
00050000-5595-4d12-ca96-baacf7bb5725	5230	Bovec
00050000-5595-4d12-5bd4-a9babfe08a1f	5295	Branik
00050000-5595-4d12-db28-f1988b310089	3314	Braslovče
00050000-5595-4d12-113a-9f9a632ae1fb	5223	Breginj
00050000-5595-4d12-53c4-31fe6e1d4d28	8280	Brestanica
00050000-5595-4d12-1368-8948292b1e60	2354	Bresternica
00050000-5595-4d12-b815-8f8ae754864c	4243	Brezje
00050000-5595-4d12-a1e1-6d776964eb1d	1351	Brezovica pri Ljubljani
00050000-5595-4d12-cc8f-378e01a6e939	8250	Brežice
00050000-5595-4d12-2d5b-083c855dbfcb	4210	Brnik - Aerodrom
00050000-5595-4d12-c755-dafaeb557db8	8321	Brusnice
00050000-5595-4d12-671d-0db9e503423a	3255	Buče
00050000-5595-4d12-7ca5-542b5e1d5248	8276	Bučka 
00050000-5595-4d12-5247-368849aa6864	9261	Cankova
00050000-5595-4d12-d77d-85d7d62f0e11	3000	Celje 
00050000-5595-4d12-cb0f-62fb4a71dfe2	3001	Celje - poštni predali
00050000-5595-4d12-c613-4bfb8d0f6166	4207	Cerklje na Gorenjskem
00050000-5595-4d12-027c-fca3d50327d9	8263	Cerklje ob Krki
00050000-5595-4d12-9921-d1b979651a63	1380	Cerknica
00050000-5595-4d12-394b-80422ff752ad	5282	Cerkno
00050000-5595-4d12-97c2-ed3c77cf435a	2236	Cerkvenjak
00050000-5595-4d12-8115-df8d0f1940ac	2215	Ceršak
00050000-5595-4d12-4642-32c85e737b3d	2326	Cirkovce
00050000-5595-4d12-3eb1-1de1491978a2	2282	Cirkulane
00050000-5595-4d12-1766-6a487896411a	5273	Col
00050000-5595-4d12-86cd-c46fc4529e9d	8251	Čatež ob Savi
00050000-5595-4d12-16f3-788da8b74e4f	1413	Čemšenik
00050000-5595-4d12-6e93-eea61c123081	5253	Čepovan
00050000-5595-4d12-9b9a-633808fa75b8	9232	Črenšovci
00050000-5595-4d12-f73c-5a4e2534cd11	2393	Črna na Koroškem
00050000-5595-4d12-f3ac-1dce71fa5611	6275	Črni Kal
00050000-5595-4d12-b52e-240ebf307f85	5274	Črni Vrh nad Idrijo
00050000-5595-4d12-a9d2-1359548195a8	5262	Črniče
00050000-5595-4d12-db1f-4bd36b00a82d	8340	Črnomelj
00050000-5595-4d12-36e5-6bff01a34aef	6271	Dekani
00050000-5595-4d12-cbff-7ac3059c0f61	5210	Deskle
00050000-5595-4d12-638b-af7f2500da63	2253	Destrnik
00050000-5595-4d12-761a-6e1de1f7a4a8	6215	Divača
00050000-5595-4d12-1efe-c42053a7c041	1233	Dob
00050000-5595-4d12-166b-f34589ef9717	3224	Dobje pri Planini
00050000-5595-4d12-66fb-e5161d16e735	8257	Dobova
00050000-5595-4d12-c5d3-ae132fefeba3	1423	Dobovec
00050000-5595-4d12-1fe9-1d3767d78472	5263	Dobravlje
00050000-5595-4d12-ac7d-f8c59a2c8fb6	3204	Dobrna
00050000-5595-4d12-3238-f09e8f3cc6cc	8211	Dobrnič
00050000-5595-4d12-6e9f-9e83e89a2961	1356	Dobrova
00050000-5595-4d12-1cfe-339a4ea96fb0	9223	Dobrovnik/Dobronak 
00050000-5595-4d12-6fd2-464f5609f1b4	5212	Dobrovo v Brdih
00050000-5595-4d12-6a65-79e41e1f9cac	1431	Dol pri Hrastniku
00050000-5595-4d12-f2de-ece4f3934976	1262	Dol pri Ljubljani
00050000-5595-4d12-f7da-bb113fd021c6	1273	Dole pri Litiji
00050000-5595-4d12-5568-ea813dda20a2	1331	Dolenja vas
00050000-5595-4d12-aa21-f5b22a3734c1	8350	Dolenjske Toplice
00050000-5595-4d12-68dc-9c467646b171	1230	Domžale
00050000-5595-4d12-36a1-75143214048e	2252	Dornava
00050000-5595-4d12-40b3-da725a469b8e	5294	Dornberk
00050000-5595-4d12-4d15-ee4309e072af	1319	Draga
00050000-5595-4d12-0e3e-471845b94d49	8343	Dragatuš
00050000-5595-4d12-8531-77aa77441e65	3222	Dramlje
00050000-5595-4d12-1d05-39457ff6234e	2370	Dravograd
00050000-5595-4d12-a77b-1354931b6532	4203	Duplje
00050000-5595-4d12-42bf-85e2841fb8f6	6221	Dutovlje
00050000-5595-4d12-b988-1644bf26c35c	8361	Dvor
00050000-5595-4d12-c5c0-9071a2867ab8	2343	Fala
00050000-5595-4d12-d666-d8d5564c23f4	9208	Fokovci
00050000-5595-4d12-8937-f17b2aa7d720	2313	Fram
00050000-5595-4d12-af3e-033ccd0b9b3f	3213	Frankolovo
00050000-5595-4d12-cc17-67511cd07dc9	1274	Gabrovka
00050000-5595-4d12-c022-6d88e29953b6	8254	Globoko
00050000-5595-4d12-f15b-a8c76c29cb9c	5275	Godovič
00050000-5595-4d12-e8e3-d2c4e0068521	4204	Golnik
00050000-5595-4d12-8522-4244ce2ed0ff	3303	Gomilsko
00050000-5595-4d12-6391-6c59b88cd35b	4224	Gorenja vas
00050000-5595-4d12-64c5-fdb824802939	3263	Gorica pri Slivnici
00050000-5595-4d12-4a67-ba3c67779218	2272	Gorišnica
00050000-5595-4d12-5b77-63367f8723d3	9250	Gornja Radgona
00050000-5595-4d12-8752-ecc3b9fd0907	3342	Gornji Grad
00050000-5595-4d12-bc1a-ba1d4388c4b0	4282	Gozd Martuljek
00050000-5595-4d12-c20b-36011206dd08	6272	Gračišče
00050000-5595-4d12-9145-bed7f92f503f	9264	Grad
00050000-5595-4d12-b3c0-e9aa29c4572f	8332	Gradac
00050000-5595-4d12-a19a-8cf2737c84be	1384	Grahovo
00050000-5595-4d12-d154-8b5a3cb80a10	5242	Grahovo ob Bači
00050000-5595-4d12-ff26-c512dbd849ea	5251	Grgar
00050000-5595-4d12-77f5-e4285d290a88	3302	Griže
00050000-5595-4d12-f819-2fac845c6a0b	3231	Grobelno
00050000-5595-4d12-6a72-c020a9f2d488	1290	Grosuplje
00050000-5595-4d12-b263-a4bfbdc17e89	2288	Hajdina
00050000-5595-4d12-a33d-8dea42ec32fd	8362	Hinje
00050000-5595-4d12-5471-42554f2a2e34	2311	Hoče
00050000-5595-4d12-ba6f-d03e149d400a	9205	Hodoš/Hodos
00050000-5595-4d12-1332-bbcb489e524c	1354	Horjul
00050000-5595-4d12-372d-80d25f365e1b	1372	Hotedršica
00050000-5595-4d12-9faf-e16f395e2d6c	1430	Hrastnik
00050000-5595-4d12-0ade-e7c277bbfe2c	6225	Hruševje
00050000-5595-4d12-16e5-aeb6ecd69697	4276	Hrušica
00050000-5595-4d12-b377-1af8e6ffba95	5280	Idrija
00050000-5595-4d12-6c2e-53ebc47f5c61	1292	Ig
00050000-5595-4d12-38c1-e52e3d6675b5	6250	Ilirska Bistrica
00050000-5595-4d12-1a06-7bec2e6a79eb	6251	Ilirska Bistrica-Trnovo
00050000-5595-4d12-adbd-c863443e00dd	1295	Ivančna Gorica
00050000-5595-4d12-641b-18e6d01b8fb5	2259	Ivanjkovci
00050000-5595-4d12-9d9c-71a0ad555a8b	1411	Izlake
00050000-5595-4d12-c93c-62bd31b1a0ca	6310	Izola/Isola
00050000-5595-4d12-1628-c5d5f41da041	2222	Jakobski Dol
00050000-5595-4d12-70f6-3e4623f4437b	2221	Jarenina
00050000-5595-4d12-cde2-9e40d647e5c0	6254	Jelšane
00050000-5595-4d12-9e9a-58647b407f5a	4270	Jesenice
00050000-5595-4d12-866b-d927092e4a88	8261	Jesenice na Dolenjskem
00050000-5595-4d12-3052-26fe740cc87d	3273	Jurklošter
00050000-5595-4d12-cf49-fc0e6d8b7aec	2223	Jurovski Dol
00050000-5595-4d12-b320-3fff099a7fb8	2256	Juršinci
00050000-5595-4d12-b476-926a70dfab5e	5214	Kal nad Kanalom
00050000-5595-4d12-a619-e4168f62d0ec	3233	Kalobje
00050000-5595-4d12-9acc-fadc83959df8	4246	Kamna Gorica
00050000-5595-4d12-0788-24e7269973f9	2351	Kamnica
00050000-5595-4d12-41a6-030e4b4c927e	1241	Kamnik
00050000-5595-4d12-1317-8ee890edced1	5213	Kanal
00050000-5595-4d12-d895-2581962274ba	8258	Kapele
00050000-5595-4d12-413d-45121576ccbb	2362	Kapla
00050000-5595-4d12-1230-788a6a0c3151	2325	Kidričevo
00050000-5595-4d12-88fa-3a584fcf59fd	1412	Kisovec
00050000-5595-4d12-a7ae-8729e568aacb	6253	Knežak
00050000-5595-4d12-f793-a6281a01f064	5222	Kobarid
00050000-5595-4d12-29b5-e1820ad611f2	9227	Kobilje
00050000-5595-4d12-2f41-d05a5ea102dd	1330	Kočevje
00050000-5595-4d12-a640-bf3153a5397b	1338	Kočevska Reka
00050000-5595-4d12-3929-46134acbd662	2276	Kog
00050000-5595-4d12-a92b-8e1ab01cd901	5211	Kojsko
00050000-5595-4d12-7e89-8ac827381467	6223	Komen
00050000-5595-4d12-64c7-f72d19ddd274	1218	Komenda
00050000-5595-4d12-beea-184241b10c2f	6000	Koper/Capodistria 
00050000-5595-4d12-c8bb-1e25d00708bf	6001	Koper/Capodistria - poštni predali
00050000-5595-4d12-3555-c44d6aeacb5f	8282	Koprivnica
00050000-5595-4d12-87f9-136abd68dd6a	5296	Kostanjevica na Krasu
00050000-5595-4d12-b1a7-02951786edb6	8311	Kostanjevica na Krki
00050000-5595-4d12-2bd1-50f93d796c2e	1336	Kostel
00050000-5595-4d12-991f-7f17bfbb98b9	6256	Košana
00050000-5595-4d12-3da1-fbfc36d4f42b	2394	Kotlje
00050000-5595-4d12-fe2d-a16e583b79ed	6240	Kozina
00050000-5595-4d12-f814-58dd23c51f5e	3260	Kozje
00050000-5595-4d12-0701-17e44314b403	4000	Kranj 
00050000-5595-4d12-d7da-87a014bfa40d	4001	Kranj - poštni predali
00050000-5595-4d12-259b-4920fc11b2ae	4280	Kranjska Gora
00050000-5595-4d12-9cf9-f3e36c06c036	1281	Kresnice
00050000-5595-4d12-b329-6b391c6e49ac	4294	Križe
00050000-5595-4d12-7822-b9919a6f790f	9206	Križevci
00050000-5595-4d12-9447-f4dcab7826d0	9242	Križevci pri Ljutomeru
00050000-5595-4d12-4ab6-52cc90d41f35	1301	Krka
00050000-5595-4d12-7f1f-4153027942e8	8296	Krmelj
00050000-5595-4d12-2195-5da35d4bf12d	4245	Kropa
00050000-5595-4d12-bbbe-0ce3d98aa82d	8262	Krška vas
00050000-5595-4d12-548f-e27ab9ddc595	8270	Krško
00050000-5595-4d12-4404-fd4128cb38ec	9263	Kuzma
00050000-5595-4d12-a7ed-02aedac33763	2318	Laporje
00050000-5595-4d12-d3ac-7ab7fa9fae0d	3270	Laško
00050000-5595-4d12-d3be-87cb5cbc83d4	1219	Laze v Tuhinju
00050000-5595-4d12-a4b3-43746e0fa88a	2230	Lenart v Slovenskih goricah
00050000-5595-4d12-0574-ddbe4a2e8ebb	9220	Lendava/Lendva
00050000-5595-4d12-8e09-29eef998b0c1	4248	Lesce
00050000-5595-4d12-b599-d38e52bcb085	3261	Lesično
00050000-5595-4d12-6f70-1b9bda8aa091	8273	Leskovec pri Krškem
00050000-5595-4d12-d60a-8c2d299bae6e	2372	Libeliče
00050000-5595-4d12-126a-a5c61cef6560	2341	Limbuš
00050000-5595-4d12-99b8-308f5228bb9c	1270	Litija
00050000-5595-4d12-1cf3-3d6481e897b8	3202	Ljubečna
00050000-5595-4d12-1ba3-408341c80c99	1000	Ljubljana 
00050000-5595-4d12-cee3-cf9045fc9182	1001	Ljubljana - poštni predali
00050000-5595-4d12-d502-45b8accdf49b	1231	Ljubljana - Črnuče
00050000-5595-4d12-fa37-55a733c090e8	1261	Ljubljana - Dobrunje
00050000-5595-4d12-cedc-7f7948efddc5	1260	Ljubljana - Polje
00050000-5595-4d12-5335-e66c9dee5269	1210	Ljubljana - Šentvid
00050000-5595-4d12-51a8-c41fdcf097da	1211	Ljubljana - Šmartno
00050000-5595-4d12-51a7-792d1b070ed8	3333	Ljubno ob Savinji
00050000-5595-4d12-2600-593062a6d0ec	9240	Ljutomer
00050000-5595-4d12-c5fd-5dccd72a7181	3215	Loče
00050000-5595-4d12-2d18-330be9829287	5231	Log pod Mangartom
00050000-5595-4d12-9e82-a8f85a9ef53a	1358	Log pri Brezovici
00050000-5595-4d12-06ea-bdf3528cca46	1370	Logatec
00050000-5595-4d12-30f6-178dbffcc698	1371	Logatec
00050000-5595-4d12-5692-201c3cd02f22	1434	Loka pri Zidanem Mostu
00050000-5595-4d12-6338-6b27b912f6fc	3223	Loka pri Žusmu
00050000-5595-4d12-7f97-1d43bbc788c0	6219	Lokev
00050000-5595-4d12-63fb-aad75c82fdc7	1318	Loški Potok
00050000-5595-4d12-65d0-8af55becea33	2324	Lovrenc na Dravskem polju
00050000-5595-4d12-ff68-3b0097b10745	2344	Lovrenc na Pohorju
00050000-5595-4d12-8537-6cb299424777	3334	Luče
00050000-5595-4d12-120e-eaa31304d7c1	1225	Lukovica
00050000-5595-4d12-06dc-bb8d2f032f20	9202	Mačkovci
00050000-5595-4d12-0ac9-e4af9f94d8c4	2322	Majšperk
00050000-5595-4d12-fa14-f63e954fa5b2	2321	Makole
00050000-5595-4d12-87fa-690e46074a71	9243	Mala Nedelja
00050000-5595-4d12-3e68-933a59a961d2	2229	Malečnik
00050000-5595-4d12-3d07-812e3c250603	6273	Marezige
00050000-5595-4d12-5dff-b7436b46f3cf	2000	Maribor 
00050000-5595-4d12-bc51-78dfbea6bc73	2001	Maribor - poštni predali
00050000-5595-4d12-d13d-50243738f02a	2206	Marjeta na Dravskem polju
00050000-5595-4d12-046e-4f4cfde9e2a7	2281	Markovci
00050000-5595-4d12-1afa-6921cb4bf052	9221	Martjanci
00050000-5595-4d12-4d8d-54f8e8f1de9e	6242	Materija
00050000-5595-4d12-da05-c4137fbe7c13	4211	Mavčiče
00050000-5595-4d12-47b2-6dd532408758	1215	Medvode
00050000-5595-4d12-daab-80ac64a82681	1234	Mengeš
00050000-5595-4d12-f0b2-65b8af12cbf9	8330	Metlika
00050000-5595-4d12-6103-2316937786e0	2392	Mežica
00050000-5595-4d12-ffa9-269ad692b980	2204	Miklavž na Dravskem polju
00050000-5595-4d12-fb83-ec7b55d144de	2275	Miklavž pri Ormožu
00050000-5595-4d12-8a5b-cabd601440e1	5291	Miren
00050000-5595-4d12-5cb7-a41f263ca8c0	8233	Mirna
00050000-5595-4d12-b328-d8b4b771b274	8216	Mirna Peč
00050000-5595-4d12-8208-36d2152ae089	2382	Mislinja
00050000-5595-4d12-585b-3aea1587215f	4281	Mojstrana
00050000-5595-4d12-f568-0c2e2dcf0ff3	8230	Mokronog
00050000-5595-4d12-8691-89ff798f309c	1251	Moravče
00050000-5595-4d12-e81e-bffe7db3ea66	9226	Moravske Toplice
00050000-5595-4d12-a833-a5789a2356ec	5216	Most na Soči
00050000-5595-4d12-72d5-8b563534e6d4	1221	Motnik
00050000-5595-4d12-046a-61a81ea87a1b	3330	Mozirje
00050000-5595-4d12-5378-048dd663f32c	9000	Murska Sobota 
00050000-5595-4d12-efda-344b43f6395b	9001	Murska Sobota - poštni predali
00050000-5595-4d12-d5d9-d93da849aa8a	2366	Muta
00050000-5595-4d12-6f51-65a2b21e9838	4202	Naklo
00050000-5595-4d12-6e50-44b61c5b909f	3331	Nazarje
00050000-5595-4d12-a5ab-5b558563b0c2	1357	Notranje Gorice
00050000-5595-4d12-29cd-78e73c432014	3203	Nova Cerkev
00050000-5595-4d12-078e-5786fc4b3257	5000	Nova Gorica 
00050000-5595-4d12-8ed0-408fd78e5d2d	5001	Nova Gorica - poštni predali
00050000-5595-4d12-92e3-2b0e94e8f48e	1385	Nova vas
00050000-5595-4d12-e66a-4accf26d4961	8000	Novo mesto
00050000-5595-4d12-4cc7-5976d32c3b8f	8001	Novo mesto - poštni predali
00050000-5595-4d12-32eb-fdf98b50164e	6243	Obrov
00050000-5595-4d12-3f93-8590c55ee349	9233	Odranci
00050000-5595-4d12-5905-2d6e1a767aeb	2317	Oplotnica
00050000-5595-4d12-ac53-0ff1105e400f	2312	Orehova vas
00050000-5595-4d12-066c-66dffa8241df	2270	Ormož
00050000-5595-4d12-34af-a854ae9bc0b8	1316	Ortnek
00050000-5595-4d12-3e5a-3c6f8421034a	1337	Osilnica
00050000-5595-4d12-1555-dca239df30d7	8222	Otočec
00050000-5595-4d12-18b5-75f4bdb120a9	2361	Ožbalt
00050000-5595-4d12-cdb2-46c54b27cc31	2231	Pernica
00050000-5595-4d12-7d38-9ecedb8c7cc1	2211	Pesnica pri Mariboru
00050000-5595-4d12-1bef-635ebdecfe71	9203	Petrovci
00050000-5595-4d12-68ff-45d3674166bd	3301	Petrovče
00050000-5595-4d12-174b-240ec68c78f9	6330	Piran/Pirano
00050000-5595-4d12-6623-996ef36fc2c4	8255	Pišece
00050000-5595-4d12-76f8-da114f2c1357	6257	Pivka
00050000-5595-4d12-0779-15de479e5c22	6232	Planina
00050000-5595-4d12-bb7c-26c15fb3d7c4	3225	Planina pri Sevnici
00050000-5595-4d12-3f67-d6f7bb7ccc1a	6276	Pobegi
00050000-5595-4d12-beca-7e1893441c17	8312	Podbočje
00050000-5595-4d12-d28e-d81213aaf6cc	5243	Podbrdo
00050000-5595-4d12-0ebc-fb97167f1892	3254	Podčetrtek
00050000-5595-4d12-df59-20d30885f96c	2273	Podgorci
00050000-5595-4d12-dcb0-9bcee4861a05	6216	Podgorje
00050000-5595-4d12-964e-d4a933b2e696	2381	Podgorje pri Slovenj Gradcu
00050000-5595-4d12-053f-bd5bbc603a33	6244	Podgrad
00050000-5595-4d12-62ae-e30d4d237dfa	1414	Podkum
00050000-5595-4d12-407e-25c2a32b1457	2286	Podlehnik
00050000-5595-4d12-a556-ce3962ee3f1d	5272	Podnanos
00050000-5595-4d12-437e-cf942fc7d528	4244	Podnart
00050000-5595-4d12-f655-63383042d026	3241	Podplat
00050000-5595-4d12-fd2c-0635203835d1	3257	Podsreda
00050000-5595-4d12-28bf-e689b576764c	2363	Podvelka
00050000-5595-4d12-9d74-15f0d7b18b5e	2208	Pohorje
00050000-5595-4d12-09ea-d18225da1573	2257	Polenšak
00050000-5595-4d12-fef4-e9ea26d526ea	1355	Polhov Gradec
00050000-5595-4d12-f697-9659a584062c	4223	Poljane nad Škofjo Loko
00050000-5595-4d12-7db1-49e744e31795	2319	Poljčane
00050000-5595-4d12-550a-822c0ee8b019	1272	Polšnik
00050000-5595-4d12-7773-004a0c6e91f5	3313	Polzela
00050000-5595-4d12-961a-69376c86810f	3232	Ponikva
00050000-5595-4d12-f4e4-793ac856b7bd	6320	Portorož/Portorose
00050000-5595-4d12-7473-7a883f7aa0b8	6230	Postojna
00050000-5595-4d12-2376-a9706e96a7b6	2331	Pragersko
00050000-5595-4d12-fa87-5f19bb6eb0c0	3312	Prebold
00050000-5595-4d12-6148-bf6d13ac8c0f	4205	Preddvor
00050000-5595-4d12-638d-15c48d48f18e	6255	Prem
00050000-5595-4d12-eae2-f981bba1513c	1352	Preserje
00050000-5595-4d12-4fb1-1faec5a00a50	6258	Prestranek
00050000-5595-4d12-2279-a45f010a9c3c	2391	Prevalje
00050000-5595-4d12-9b29-3fb083bf2640	3262	Prevorje
00050000-5595-4d12-484e-be003e66aac0	1276	Primskovo 
00050000-5595-4d12-9acd-736c8a8c90fd	3253	Pristava pri Mestinju
00050000-5595-4d12-8228-fdc5f79f5c93	9207	Prosenjakovci/Partosfalva
00050000-5595-4d12-598d-43318575beaf	5297	Prvačina
00050000-5595-4d12-89c0-0b5422453c5c	2250	Ptuj
00050000-5595-4d12-f678-a22e8fd87565	2323	Ptujska Gora
00050000-5595-4d12-3a19-8d421e3b3a46	9201	Puconci
00050000-5595-4d12-0128-f11f5de7c90a	2327	Rače
00050000-5595-4d12-f129-c106cf8dac67	1433	Radeče
00050000-5595-4d12-69a6-5ec3a1988171	9252	Radenci
00050000-5595-4d12-b0ba-391b0b8a5696	2360	Radlje ob Dravi
00050000-5595-4d12-bf94-d3daebb9ba3e	1235	Radomlje
00050000-5595-4d12-3c83-8350d7c2989f	4240	Radovljica
00050000-5595-4d12-69b2-3cc1e4326cdc	8274	Raka
00050000-5595-4d12-3f08-26e26e7b75ee	1381	Rakek
00050000-5595-4d12-90ee-970ba4eec532	4283	Rateče - Planica
00050000-5595-4d12-76ba-f53ee7858302	2390	Ravne na Koroškem
00050000-5595-4d12-e65c-551105d98b10	9246	Razkrižje
00050000-5595-4d12-e323-dda1f60158ef	3332	Rečica ob Savinji
00050000-5595-4d12-e064-a27b454d1f81	5292	Renče
00050000-5595-4d12-eee4-aed5f9d11dd3	1310	Ribnica
00050000-5595-4d12-1c59-856337a441d7	2364	Ribnica na Pohorju
00050000-5595-4d12-88f8-21be2d1761a9	3272	Rimske Toplice
00050000-5595-4d12-466f-5f46bfc471b2	1314	Rob
00050000-5595-4d12-f84c-28585727bb47	5215	Ročinj
00050000-5595-4d12-9e7c-776ea75043d1	3250	Rogaška Slatina
00050000-5595-4d12-712f-87c5cf180ce6	9262	Rogašovci
00050000-5595-4d12-7062-6b3cdb5c6748	3252	Rogatec
00050000-5595-4d12-e054-6df54b6a3f26	1373	Rovte
00050000-5595-4d12-d8be-7ad180dbc17d	2342	Ruše
00050000-5595-4d12-8dd8-2d84aa1602a4	1282	Sava
00050000-5595-4d12-21c4-8ae2373491a9	6333	Sečovlje/Sicciole
00050000-5595-4d12-9b84-cd9647bf85c5	4227	Selca
00050000-5595-4d12-5481-7bd4d1b13540	2352	Selnica ob Dravi
00050000-5595-4d12-5d63-4adc55983657	8333	Semič
00050000-5595-4d12-3559-f3cfd4917d0d	8281	Senovo
00050000-5595-4d12-e7df-aa9af8eba051	6224	Senožeče
00050000-5595-4d12-d0e7-50430a5ad9d3	8290	Sevnica
00050000-5595-4d12-2c1d-2326cf0d831f	6210	Sežana
00050000-5595-4d12-3274-632d75d28229	2214	Sladki Vrh
00050000-5595-4d12-becb-f0be21401671	5283	Slap ob Idrijci
00050000-5595-4d12-0785-a7c8df6b299c	2380	Slovenj Gradec
00050000-5595-4d12-3442-a9ebaf0e93b6	2310	Slovenska Bistrica
00050000-5595-4d12-21ad-087f8d1a293e	3210	Slovenske Konjice
00050000-5595-4d12-3e7e-4065d7497d4c	1216	Smlednik
00050000-5595-4d12-292d-d48fa3947233	5232	Soča
00050000-5595-4d12-f3f5-3ccc595fbd71	1317	Sodražica
00050000-5595-4d12-e266-56e1f8bbac93	3335	Solčava
00050000-5595-4d12-a590-76fcede0200e	5250	Solkan
00050000-5595-4d12-202a-d39b41d12e1a	4229	Sorica
00050000-5595-4d12-806e-9788f5b10ac9	4225	Sovodenj
00050000-5595-4d12-91f9-14a8387afc98	5281	Spodnja Idrija
00050000-5595-4d12-329b-493546d04cad	2241	Spodnji Duplek
00050000-5595-4d12-82fe-dd9ac0758104	9245	Spodnji Ivanjci
00050000-5595-4d12-8cab-bde77b76e726	2277	Središče ob Dravi
00050000-5595-4d12-8130-cae6bc77ed56	4267	Srednja vas v Bohinju
00050000-5595-4d12-8023-10e06d8cba35	8256	Sromlje 
00050000-5595-4d12-92c3-a2378800ec0d	5224	Srpenica
00050000-5595-4d12-0fea-6428fe38fb8d	1242	Stahovica
00050000-5595-4d12-7f33-d8f9f29d1a84	1332	Stara Cerkev
00050000-5595-4d12-28ab-e74588013de8	8342	Stari trg ob Kolpi
00050000-5595-4d12-853b-c7bfaab8839b	1386	Stari trg pri Ložu
00050000-5595-4d12-375d-3ef3e8658189	2205	Starše
00050000-5595-4d12-a740-f10122ac367f	2289	Stoperce
00050000-5595-4d12-f580-1c267a791c7d	8322	Stopiče
00050000-5595-4d12-a72b-1dcd09d08dc4	3206	Stranice
00050000-5595-4d12-c13a-a0297e27bd5a	8351	Straža
00050000-5595-4d12-1ad8-9a27d0d013f8	1313	Struge
00050000-5595-4d12-e398-a446fd740fed	8293	Studenec
00050000-5595-4d12-12c2-32202a625938	8331	Suhor
00050000-5595-4d12-8cd2-a07009828cfd	2233	Sv. Ana v Slovenskih goricah
00050000-5595-4d12-6123-4aa02dd7d9a5	2235	Sv. Trojica v Slovenskih goricah
00050000-5595-4d12-6b9a-dfa7b24e6436	2353	Sveti Duh na Ostrem Vrhu
00050000-5595-4d12-b999-99ea6f7f0eb7	9244	Sveti Jurij ob Ščavnici
00050000-5595-4d12-81b2-6a1f088a7992	3264	Sveti Štefan
00050000-5595-4d12-c124-2e272fc8eb78	2258	Sveti Tomaž
00050000-5595-4d12-8552-c3325a741cb0	9204	Šalovci
00050000-5595-4d12-f74a-e0b0cb7098d9	5261	Šempas
00050000-5595-4d12-7251-a44496e9d44c	5290	Šempeter pri Gorici
00050000-5595-4d12-38ab-25f78b6342b1	3311	Šempeter v Savinjski dolini
00050000-5595-4d12-aae3-6c7ba8ffaebc	4208	Šenčur
00050000-5595-4d12-fc2f-ba269c479ca3	2212	Šentilj v Slovenskih goricah
00050000-5595-4d12-a8af-98e355d8465c	8297	Šentjanž
00050000-5595-4d12-5276-3398625c7485	2373	Šentjanž pri Dravogradu
00050000-5595-4d12-abb4-57d0da64cf57	8310	Šentjernej
00050000-5595-4d12-7c59-9ae86b1a32bd	3230	Šentjur
00050000-5595-4d12-b2c6-dc4b13e6e47a	3271	Šentrupert
00050000-5595-4d12-3f2f-e7a8b6f635a7	8232	Šentrupert
00050000-5595-4d12-f8c5-420d9a9e037d	1296	Šentvid pri Stični
00050000-5595-4d12-7202-7487bda940dc	8275	Škocjan
00050000-5595-4d12-b353-91032a74aeb1	6281	Škofije
00050000-5595-4d12-7eb3-2daf59892364	4220	Škofja Loka
00050000-5595-4d12-d05f-5c6babfe3865	3211	Škofja vas
00050000-5595-4d12-82d3-a9767d4e0d67	1291	Škofljica
00050000-5595-4d12-e484-6afb056e4741	6274	Šmarje
00050000-5595-4d12-dfc2-0a6afd33b3ae	1293	Šmarje - Sap
00050000-5595-4d12-0183-32205564ab55	3240	Šmarje pri Jelšah
00050000-5595-4d12-5e85-6c489e7c9605	8220	Šmarješke Toplice
00050000-5595-4d12-d82f-0a02d84beff3	2315	Šmartno na Pohorju
00050000-5595-4d12-92dc-e891d94f88f7	3341	Šmartno ob Dreti
00050000-5595-4d12-5e82-40534f238762	3327	Šmartno ob Paki
00050000-5595-4d12-e7ae-0aee6ee382c4	1275	Šmartno pri Litiji
00050000-5595-4d12-92ba-398ab0000236	2383	Šmartno pri Slovenj Gradcu
00050000-5595-4d12-3d32-e9fddf007beb	3201	Šmartno v Rožni dolini
00050000-5595-4d12-82f7-7349fe495c18	3325	Šoštanj
00050000-5595-4d12-1f09-4b255693efea	6222	Štanjel
00050000-5595-4d12-d259-fb7410ff5c67	3220	Štore
00050000-5595-4d12-4582-27ca7d01d048	3304	Tabor
00050000-5595-4d12-560a-175a63c64357	3221	Teharje
00050000-5595-4d12-9134-03676dc3950a	9251	Tišina
00050000-5595-4d12-8e55-e35cf275e30d	5220	Tolmin
00050000-5595-4d12-df8b-88db8f16f31e	3326	Topolšica
00050000-5595-4d12-9849-41cf701a9ad3	2371	Trbonje
00050000-5595-4d12-7a1c-dd1db0a1d927	1420	Trbovlje
00050000-5595-4d12-8d8c-18c655894493	8231	Trebelno 
00050000-5595-4d12-a75a-51b1157aad3d	8210	Trebnje
00050000-5595-4d12-dfa3-4ac90564a0d0	5252	Trnovo pri Gorici
00050000-5595-4d12-f583-bf8991ce51b9	2254	Trnovska vas
00050000-5595-4d12-20b7-223326683c55	1222	Trojane
00050000-5595-4d12-a8d8-055e610be692	1236	Trzin
00050000-5595-4d12-f2e6-44eaed871d83	4290	Tržič
00050000-5595-4d12-ade4-26bf504918c1	8295	Tržišče
00050000-5595-4d12-2d2d-f9241adfeca8	1311	Turjak
00050000-5595-4d12-e4fa-7a0d425fbce7	9224	Turnišče
00050000-5595-4d12-f0a3-a972b601d080	8323	Uršna sela
00050000-5595-4d12-36bd-c8c591f7a58d	1252	Vače
00050000-5595-4d12-1294-edbebf2e54d2	3320	Velenje 
00050000-5595-4d12-81c5-c3f3cbd8c286	3322	Velenje - poštni predali
00050000-5595-4d12-09d9-2d7660b78374	8212	Velika Loka
00050000-5595-4d12-8715-ed1f7f05f549	2274	Velika Nedelja
00050000-5595-4d12-f736-2e6519b6d6be	9225	Velika Polana
00050000-5595-4d12-0ceb-9b514c4ab6d8	1315	Velike Lašče
00050000-5595-4d12-340a-153e65c95ef3	8213	Veliki Gaber
00050000-5595-4d12-46dd-371a8c2a6379	9241	Veržej
00050000-5595-4d12-d0b0-b778587ebfda	1312	Videm - Dobrepolje
00050000-5595-4d12-53b5-a5851b0894a5	2284	Videm pri Ptuju
00050000-5595-4d12-6372-7c5c993ba907	8344	Vinica
00050000-5595-4d12-80b1-c3eb113ea182	5271	Vipava
00050000-5595-4d12-5f80-44e82914e87d	4212	Visoko
00050000-5595-4d12-2538-50bd5aae513c	1294	Višnja Gora
00050000-5595-4d12-10bb-d2338cb7cb6e	3205	Vitanje
00050000-5595-4d12-8197-06506b979f66	2255	Vitomarci
00050000-5595-4d12-c9c8-d7c40aaf7f7f	1217	Vodice
00050000-5595-4d12-912f-195ed1b14340	3212	Vojnik\t
00050000-5595-4d12-0cb1-64e599fd14a2	5293	Volčja Draga
00050000-5595-4d12-557d-8d52ed888092	2232	Voličina
00050000-5595-4d12-51e1-b01073401c5f	3305	Vransko
00050000-5595-4d12-ae20-1b7c0a44a240	6217	Vremski Britof
00050000-5595-4d12-e194-3fe4fe481154	1360	Vrhnika
00050000-5595-4d12-07d0-785480382e9b	2365	Vuhred
00050000-5595-4d12-701f-dac8518bb258	2367	Vuzenica
00050000-5595-4d12-b5fd-0f46424fcdce	8292	Zabukovje 
00050000-5595-4d12-b1f6-4cac6df2dd36	1410	Zagorje ob Savi
00050000-5595-4d12-c782-e33a158cc7c1	1303	Zagradec
00050000-5595-4d12-8cda-f38d2ea02e88	2283	Zavrč
00050000-5595-4d12-5d2b-24807ee2b43c	8272	Zdole 
00050000-5595-4d12-78e3-2825398be940	4201	Zgornja Besnica
00050000-5595-4d12-a429-de2c905d72ac	2242	Zgornja Korena
00050000-5595-4d12-b89f-bccd2e53bc7e	2201	Zgornja Kungota
00050000-5595-4d12-3ad5-501eda10ea62	2316	Zgornja Ložnica
00050000-5595-4d12-87f0-e9f1d3b8051f	2314	Zgornja Polskava
00050000-5595-4d12-4f50-41c5bebc9aec	2213	Zgornja Velka
00050000-5595-4d12-d31b-a36972483636	4247	Zgornje Gorje
00050000-5595-4d12-033b-183f805aaa56	4206	Zgornje Jezersko
00050000-5595-4d12-ea3e-a82222b3840f	2285	Zgornji Leskovec
00050000-5595-4d12-cf62-59112b1c1662	1432	Zidani Most
00050000-5595-4d12-c5f2-ecb9285b262c	3214	Zreče
00050000-5595-4d12-1264-51535cc70db5	4209	Žabnica
00050000-5595-4d12-57f6-a4a8fe77ef1f	3310	Žalec
00050000-5595-4d12-7e4d-a808725c24bb	4228	Železniki
00050000-5595-4d12-be49-3f405154dbc5	2287	Žetale
00050000-5595-4d12-1140-93346e209c7e	4226	Žiri
00050000-5595-4d12-9cf7-bdbacc39218e	4274	Žirovnica
00050000-5595-4d12-9b68-3e146500e780	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8911403)
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
-- TOC entry 2859 (class 0 OID 8911214)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8911292)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8911415)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8911535)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8911584)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5595-4d13-967d-0840e9bf83a2	00080000-5595-4d13-d986-3605e3185ede	0900	AK
00190000-5595-4d14-31d8-c90eb80e2568	00080000-5595-4d13-6634-e544438b9f5b	0987	A
00190000-5595-4d14-2176-4b997a77a1ca	00080000-5595-4d13-32cb-e2a39bdd5060	0989	A
00190000-5595-4d14-a120-7eac3fb945c7	00080000-5595-4d13-892b-733fdab4ed0a	0986	A
00190000-5595-4d14-c7ed-860453f447c3	00080000-5595-4d13-80e0-c8c1aca9f9ee	0984	A
00190000-5595-4d14-8585-efd57e4afe0a	00080000-5595-4d13-44f0-cdcb4de289ec	0983	A
00190000-5595-4d14-ff33-8776eb9d84b3	00080000-5595-4d13-6933-83652043570a	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8911718)
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
-- TOC entry 2883 (class 0 OID 8911444)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5595-4d13-feaf-fbd56796c045	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5595-4d13-280b-e58cc932967d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5595-4d13-de49-68bcdf3bbf75	0003	Kazinska	t	84	Kazinska dvorana
00220000-5595-4d13-fdc8-a086d081f786	0004	Mali oder	t	24	Mali oder 
00220000-5595-4d13-7fe4-ab07538f9cdb	0005	Komorni oder	t	15	Komorni oder
00220000-5595-4d13-773c-9c13e058ebf1	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5595-4d13-5fd5-ab33abeeb71d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8911388)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8911378)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8911573)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8911512)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8911086)
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
-- TOC entry 2884 (class 0 OID 8911454)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8911124)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5595-4d12-e0b6-4049e6149072	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5595-4d12-eee9-2b282b8d9b8f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5595-4d12-4de8-e75e6ef742f0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5595-4d12-9baa-3832e5cacce3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5595-4d12-68ef-669b7d49e00c	planer	Planer dogodkov v koledarju	t
00020000-5595-4d12-9fa3-a04bfb0bbd51	kadrovska	Kadrovska služba	t
00020000-5595-4d12-9380-21e7e66eacc9	arhivar	Ažuriranje arhivalij	t
00020000-5595-4d12-6ab0-3161c37428c5	igralec	Igralec	t
00020000-5595-4d12-ea84-180a3853c7d8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5595-4d13-498f-ea8d30fc4ab9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8911108)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5595-4d12-2830-23ee846288f0	00020000-5595-4d12-4de8-e75e6ef742f0
00010000-5595-4d12-ae9d-84a3b7aa5f64	00020000-5595-4d12-4de8-e75e6ef742f0
00010000-5595-4d13-5900-47dc0c63ebba	00020000-5595-4d13-498f-ea8d30fc4ab9
\.


--
-- TOC entry 2886 (class 0 OID 8911468)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8911409)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8911359)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8911768)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5595-4d12-2930-ab5e763471cd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5595-4d12-647e-fa81c4825d0e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5595-4d12-3ced-a9b02512dfcd	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5595-4d12-104e-4b5547af49b6	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5595-4d12-3d84-86b710e7a179	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8911760)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5595-4d12-d83a-e88660226c15	00230000-5595-4d12-104e-4b5547af49b6	popa
00240000-5595-4d12-6e06-5d903bcaeaee	00230000-5595-4d12-104e-4b5547af49b6	oseba
00240000-5595-4d12-34b1-a1413d3fc2a8	00230000-5595-4d12-647e-fa81c4825d0e	prostor
00240000-5595-4d12-bd7f-c3e288fc94d6	00230000-5595-4d12-104e-4b5547af49b6	besedilo
00240000-5595-4d12-5742-8f55bb173465	00230000-5595-4d12-104e-4b5547af49b6	uprizoritev
00240000-5595-4d12-f8b5-467b0ecce31f	00230000-5595-4d12-104e-4b5547af49b6	funkcija
00240000-5595-4d12-2e39-8545468d5f52	00230000-5595-4d12-104e-4b5547af49b6	tipfunkcije
00240000-5595-4d12-d2f4-648f400d9c60	00230000-5595-4d12-104e-4b5547af49b6	alternacija
00240000-5595-4d12-3bda-958e7d515c1a	00230000-5595-4d12-2930-ab5e763471cd	pogodba
00240000-5595-4d12-73cd-45566e37b09f	00230000-5595-4d12-104e-4b5547af49b6	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8911755)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8911522)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5595-4d14-6f53-07047266d526	000e0000-5595-4d14-1dd1-b7c358d82745	00080000-5595-4d13-09b0-7df57ecbb6cd	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5595-4d14-2399-98661a443098	000e0000-5595-4d14-1dd1-b7c358d82745	00080000-5595-4d13-09b0-7df57ecbb6cd	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5595-4d14-1a3c-dedb391b2012	000e0000-5595-4d14-1dd1-b7c358d82745	00080000-5595-4d13-158e-506a9a790e0e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8911186)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8911365)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5595-4d14-d637-2c83b5feac45	00180000-5595-4d14-6228-1e284cbd748c	000c0000-5595-4d14-346a-4661810319fe	00090000-5595-4d13-f328-e521b14a0cf7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4d14-e9fb-2e0c71f4b121	00180000-5595-4d14-6228-1e284cbd748c	000c0000-5595-4d14-ed22-7660f42b3433	00090000-5595-4d13-ce26-7b14cb3b628c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4d14-4735-de7278fd585f	00180000-5595-4d14-6228-1e284cbd748c	000c0000-5595-4d14-36fc-252509bf2f3e	00090000-5595-4d13-423f-a41543a71b70	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4d14-b38e-6848e6745741	00180000-5595-4d14-6228-1e284cbd748c	000c0000-5595-4d14-49a2-a4ec63bee310	00090000-5595-4d13-ab4f-cdb4bff2bf2a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4d14-26f6-e9116f922d04	00180000-5595-4d14-6228-1e284cbd748c	000c0000-5595-4d14-c3f7-224c8ac3c0e3	00090000-5595-4d13-ea67-0e182eeb8636	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4d14-8697-fb896cc88b5a	00180000-5595-4d14-ab2c-1b79cd77662e	\N	00090000-5595-4d13-ea67-0e182eeb8636	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8911562)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5595-4d12-8879-fdad6d8c4a99	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5595-4d12-e2dc-b26b83718ddc	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5595-4d12-bd2c-c0de59468a47	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5595-4d12-3c43-7c7fa8d53ceb	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5595-4d12-d1f7-830a524e7290	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5595-4d12-9801-29512bea7b0a	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5595-4d12-eac5-7de1b8690693	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5595-4d12-7715-4eb23476a6b9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5595-4d12-5068-2270ba9fdb13	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5595-4d12-f7fb-2fa0c1b9f6d1	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5595-4d12-e10d-a08cdf23ff44	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5595-4d12-787c-4911fde2e9ec	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5595-4d12-24ab-664a1e7a43b3	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5595-4d12-7c12-0a8424ea382b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5595-4d12-693e-66930e0ae8d8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5595-4d12-d247-9bdc8ae157a5	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8911737)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5595-4d12-e535-b4e16476785d	01	Velika predstava	f	1.00	1.00
002b0000-5595-4d12-4b85-25df2777688e	02	Mala predstava	f	0.50	0.50
002b0000-5595-4d12-c2e2-229aabb0b0c8	03	Mala koprodukcija	t	0.40	1.00
002b0000-5595-4d12-59f2-c9aae7d77756	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5595-4d12-685c-04cd7ccd7e81	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8911249)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8911095)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5595-4d12-ae9d-84a3b7aa5f64	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfMmPBAf8ibsnbEiJBJd3UZMKEOXXWPG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5595-4d13-59cd-82dd64508bea	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5595-4d13-a2e4-a92eedd73912	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5595-4d13-457c-d1e7b5715118	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5595-4d13-0afe-60a33faf6f10	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5595-4d13-e88e-eeae15f498a6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5595-4d13-aba7-c4d4f90de1e3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5595-4d13-185d-be16f290e91b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5595-4d13-a693-84b7ca1c693e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5595-4d13-ef5f-aedfd4a205d0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5595-4d13-5900-47dc0c63ebba	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5595-4d12-2830-23ee846288f0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8911619)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5595-4d14-dda2-8f69010fb91d	00160000-5595-4d13-5787-6978eebc26c1	00150000-5595-4d12-4fef-05bff9089530	00140000-5595-4d11-98b3-fd7f128fca6d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5595-4d13-7fe4-ab07538f9cdb
000e0000-5595-4d14-1dd1-b7c358d82745	00160000-5595-4d13-56d2-7fc87213f1b9	00150000-5595-4d12-03da-16145806f886	00140000-5595-4d11-3331-55c10bae02bc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5595-4d13-773c-9c13e058ebf1
000e0000-5595-4d14-4892-5a436abba884	\N	00150000-5595-4d12-03da-16145806f886	00140000-5595-4d11-3331-55c10bae02bc	00190000-5595-4d14-31d8-c90eb80e2568	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5595-4d13-7fe4-ab07538f9cdb
000e0000-5595-4d14-a839-c1f580079148	\N	00150000-5595-4d12-03da-16145806f886	00140000-5595-4d11-3331-55c10bae02bc	00190000-5595-4d14-31d8-c90eb80e2568	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5595-4d13-7fe4-ab07538f9cdb
000e0000-5595-4d14-f70c-faf474540e78	\N	00150000-5595-4d12-03da-16145806f886	00140000-5595-4d11-3331-55c10bae02bc	00190000-5595-4d14-31d8-c90eb80e2568	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5595-4d13-feaf-fbd56796c045
\.


--
-- TOC entry 2867 (class 0 OID 8911311)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5595-4d14-15ec-48a13d5ebb0c	000e0000-5595-4d14-1dd1-b7c358d82745	1	
00200000-5595-4d14-35d8-faac8f1dfc7e	000e0000-5595-4d14-1dd1-b7c358d82745	2	
\.


--
-- TOC entry 2882 (class 0 OID 8911436)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8911505)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8911343)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8911609)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5595-4d11-98b3-fd7f128fca6d	01	Drama	drama (SURS 01)
00140000-5595-4d11-e231-8e84cedd233d	02	Opera	opera (SURS 02)
00140000-5595-4d11-78e0-12e7999f3926	03	Balet	balet (SURS 03)
00140000-5595-4d11-6894-cdec966a3ef1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5595-4d11-1aa8-3252c6c90ad3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5595-4d11-3331-55c10bae02bc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5595-4d11-23a5-2dab1d817f58	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8911495)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5595-4d12-0a65-646b20d2e221	01	Opera	opera
00150000-5595-4d12-e45f-8da6c42662a2	02	Opereta	opereta
00150000-5595-4d12-17c7-26fd75c2ed95	03	Balet	balet
00150000-5595-4d12-1dd1-dc73474335ee	04	Plesne prireditve	plesne prireditve
00150000-5595-4d12-6113-87f0f9018370	05	Lutkovno gledališče	lutkovno gledališče
00150000-5595-4d12-5617-29e1a81bb977	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5595-4d12-ab7c-1c689e782d20	07	Biografska drama	biografska drama
00150000-5595-4d12-4fef-05bff9089530	08	Komedija	komedija
00150000-5595-4d12-f674-c760e9806e58	09	Črna komedija	črna komedija
00150000-5595-4d12-05cf-0ab2903bbe8e	10	E-igra	E-igra
00150000-5595-4d12-03da-16145806f886	11	Kriminalka	kriminalka
00150000-5595-4d12-47fa-d8c55a5abe7f	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8911149)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8911666)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8911656)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8911561)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8911333)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8911358)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8911753)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8911275)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8911713)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8911491)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8911309)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8911352)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8911289)
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
-- TOC entry 2533 (class 2606 OID 8911401)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8911428)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8911247)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8911158)
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
-- TOC entry 2448 (class 2606 OID 8911182)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8911138)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8911123)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8911434)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8911467)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8911604)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8911211)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8911235)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8911407)
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
-- TOC entry 2463 (class 2606 OID 8911225)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8911296)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8911419)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8911543)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8911589)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8911735)
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
-- TOC entry 2553 (class 2606 OID 8911451)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8911392)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8911383)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8911583)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8911519)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8911094)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8911458)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8911112)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8911132)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8911476)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8911414)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8911364)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8911777)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8911765)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8911759)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8911532)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8911191)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8911374)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8911572)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8911747)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8911260)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8911107)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8911635)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8911318)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8911442)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8911510)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8911347)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8911617)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8911503)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8911340)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8911533)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8911534)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8911213)
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
-- TOC entry 2546 (class 1259 OID 8911435)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8911421)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8911420)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8911319)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8911492)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8911494)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8911493)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8911291)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8911290)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8911606)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8911607)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8911608)
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
-- TOC entry 2608 (class 1259 OID 8911640)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8911637)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8911641)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8911639)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8911638)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8911262)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8911261)
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
-- TOC entry 2446 (class 1259 OID 8911185)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8911459)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8911353)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8911139)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8911140)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8911479)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8911478)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8911477)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8911297)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8911299)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8911298)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8911767)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8911387)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8911385)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8911384)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8911386)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8911113)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8911114)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8911443)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8911408)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8911520)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8911521)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8911717)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8911714)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8911715)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8911716)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8911227)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8911226)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8911228)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8911544)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8911545)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8911670)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8911671)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8911668)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8911669)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8911511)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8911396)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8911395)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8911393)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8911394)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8911658)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8911657)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8911736)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8911310)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8911754)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8911160)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8911159)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8911192)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8911193)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8911377)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8911376)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8911375)
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
-- TOC entry 2498 (class 1259 OID 8911342)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8911338)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8911335)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8911336)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8911334)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8911339)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8911337)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8911212)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8911276)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8911278)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8911277)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8911279)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8911402)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8911605)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8911636)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8911183)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8911184)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8911504)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8911778)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8911248)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8911766)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8911453)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8911452)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8911667)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8911236)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8911618)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8911590)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8911591)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8911133)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8911341)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8911914)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8911899)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8911904)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8911924)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8911894)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8911919)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8911909)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8912069)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8912074)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8911829)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8912009)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8912004)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8911999)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8911889)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8912039)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8912049)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8912044)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8911864)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8911859)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8911989)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8912094)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8912099)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8912104)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8912124)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8912109)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8912129)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8912119)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8912114)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8911854)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8911849)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8911814)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8911809)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8912019)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8911929)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8911789)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8911794)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8912034)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8912029)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8912024)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8911869)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8911879)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8911874)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8912194)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8911964)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8911954)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8911949)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8911959)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8911779)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8911784)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8912014)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8911994)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8912059)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8912064)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8912179)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8912164)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8912169)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8912174)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8911839)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8911834)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8911844)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8912079)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8912084)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8912154)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8912159)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8912144)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8912149)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8912054)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8911984)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8911979)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8911969)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8911974)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8912139)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8912134)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8912184)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8911884)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8912089)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8912189)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8911804)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8911799)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8911819)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8911824)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8911944)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8911939)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8911934)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-02 16:39:17 CEST

--
-- PostgreSQL database dump complete
--

