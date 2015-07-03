--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-03 14:51:25 CEST

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
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 9000841)
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
-- TOC entry 228 (class 1259 OID 9001340)
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
-- TOC entry 227 (class 1259 OID 9001323)
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
-- TOC entry 221 (class 1259 OID 9001235)
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
-- TOC entry 197 (class 1259 OID 9001020)
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
-- TOC entry 200 (class 1259 OID 9001054)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9001450)
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
-- TOC entry 192 (class 1259 OID 9000963)
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
-- TOC entry 229 (class 1259 OID 9001353)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
-- TOC entry 216 (class 1259 OID 9001180)
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
-- TOC entry 195 (class 1259 OID 9001000)
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
-- TOC entry 199 (class 1259 OID 9001048)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9000980)
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
-- TOC entry 205 (class 1259 OID 9001097)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9001122)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9000937)
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
-- TOC entry 184 (class 1259 OID 9000850)
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
-- TOC entry 185 (class 1259 OID 9000861)
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
-- TOC entry 180 (class 1259 OID 9000815)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9000834)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9001129)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9001160)
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
-- TOC entry 224 (class 1259 OID 9001273)
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
-- TOC entry 187 (class 1259 OID 9000894)
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
-- TOC entry 189 (class 1259 OID 9000929)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9001103)
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
-- TOC entry 188 (class 1259 OID 9000914)
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
-- TOC entry 194 (class 1259 OID 9000992)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9001115)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9001420)
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
-- TOC entry 232 (class 1259 OID 9001431)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9001401)
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
-- TOC entry 212 (class 1259 OID 9001144)
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
-- TOC entry 204 (class 1259 OID 9001088)
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
-- TOC entry 203 (class 1259 OID 9001078)
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
-- TOC entry 223 (class 1259 OID 9001262)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9001212)
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
-- TOC entry 177 (class 1259 OID 9000786)
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
-- TOC entry 176 (class 1259 OID 9000784)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 9001154)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9000824)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9000808)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9001168)
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
-- TOC entry 207 (class 1259 OID 9001109)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9001059)
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
-- TOC entry 237 (class 1259 OID 9001470)
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
-- TOC entry 236 (class 1259 OID 9001462)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9001457)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9001222)
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
-- TOC entry 186 (class 1259 OID 9000886)
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
-- TOC entry 202 (class 1259 OID 9001065)
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
-- TOC entry 222 (class 1259 OID 9001251)
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
-- TOC entry 233 (class 1259 OID 9001439)
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
-- TOC entry 191 (class 1259 OID 9000949)
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
-- TOC entry 178 (class 1259 OID 9000795)
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
-- TOC entry 226 (class 1259 OID 9001300)
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
-- TOC entry 196 (class 1259 OID 9001011)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9001136)
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
-- TOC entry 218 (class 1259 OID 9001205)
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
-- TOC entry 198 (class 1259 OID 9001043)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9001290)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9001195)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9000789)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2856 (class 0 OID 9000841)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 9001340)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5596-854c-6be1-b93e01fea572	000d0000-5596-854c-6232-6a62ca070306	\N	00090000-5596-854c-b92e-afd234e66436	000b0000-5596-854c-dd84-baaee61340bf	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-854c-98c3-1ed51ec00848	000d0000-5596-854c-e5b7-1f79b8e080c2	\N	00090000-5596-854c-0a11-30ce28f8ed46	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-854c-e205-e476c72e89bd	000d0000-5596-854c-4af1-8943794beede	\N	00090000-5596-854c-c245-80298cebf707	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-854c-115b-d05b62298795	000d0000-5596-854c-a274-055647815607	\N	00090000-5596-854c-d387-3bbeab78d4aa	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-854c-d1a2-435c7decfb9f	000d0000-5596-854c-f301-570e36d8f335	\N	00090000-5596-854c-2afd-0135ba1c67d5	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-854c-3eb0-ae1a54802ecd	000d0000-5596-854c-604c-5b568c4f0d40	\N	00090000-5596-854c-0a11-30ce28f8ed46	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 9001323)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9001235)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5596-854c-2614-e030adbe344d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5596-854c-dac7-31b70efeb303	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5596-854c-5f0e-6cbb5ef73700	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2870 (class 0 OID 9001020)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5596-854c-bb72-23f33bb047a4	\N	\N	00200000-5596-854c-8c9f-b0f363e6fc56	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5596-854c-0a08-2e414ffce142	\N	\N	00200000-5596-854c-5cd5-12acb3103d36	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5596-854c-43b8-c776a43e3ebd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5596-854c-c864-1f8e24179366	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5596-854c-d2c9-68338665f943	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2873 (class 0 OID 9001054)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9001450)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9000963)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5596-854a-8744-780965e22e31	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5596-854a-86ac-2437f5a3800b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5596-854a-2e67-3ec1adfa85ec	AL	ALB	008	Albania 	Albanija	\N
00040000-5596-854a-6bd2-b45dc69be34d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5596-854a-cc57-dd2e8e34ae53	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5596-854a-b14f-59a4bd3264b1	AD	AND	020	Andorra 	Andora	\N
00040000-5596-854a-3341-f599c876f7a8	AO	AGO	024	Angola 	Angola	\N
00040000-5596-854a-aeaf-21359d942bbd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5596-854a-f833-c3eab3a2c629	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5596-854a-f8c2-a0d6cf55ad98	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-854a-5aee-b9384521d4cc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5596-854a-466e-b7fc45884c8e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5596-854a-060b-af744012a71c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5596-854a-52a7-141d1bc63eed	AU	AUS	036	Australia 	Avstralija	\N
00040000-5596-854a-dd08-1e3004d94936	AT	AUT	040	Austria 	Avstrija	\N
00040000-5596-854a-200e-62ea0b270c1d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5596-854a-7d7f-3a84999791c6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5596-854a-9800-3a858d7c90f9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5596-854a-2b48-8f4938ebd22f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5596-854a-b714-037374ce8b1b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5596-854a-faaf-7f0b05532b77	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5596-854a-b4fb-19f2a5cdb3b5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5596-854a-ec6d-22c67ba52226	BZ	BLZ	084	Belize 	Belize	\N
00040000-5596-854a-08c3-0a8f90641c65	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5596-854a-ffe6-4313f665913f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5596-854a-1e9e-fd1befd4aab1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5596-854a-b0a7-c7ea4213fba4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5596-854a-51b9-63ee3a4a6adc	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5596-854a-979c-160247258b6a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5596-854a-70f7-681bc34173bf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5596-854a-b052-2f9c84eea735	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5596-854a-27dc-118c18d63784	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5596-854a-71b2-d387a861596f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5596-854a-d225-70dbad34d212	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5596-854a-bbcb-6ec6bed3ac29	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5596-854a-5310-f92b1aab8723	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5596-854a-7b4a-5ac633feb35a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5596-854a-a9ff-d6bafa2f4b19	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5596-854a-fc59-b1db4b0fa9ce	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5596-854a-e525-1e5de8ec3912	CA	CAN	124	Canada 	Kanada	\N
00040000-5596-854a-9247-8c5fb8252667	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5596-854a-3b4f-730bb171c604	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5596-854a-d516-52be86b6f6fb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5596-854a-e4e9-cfc16c079440	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5596-854a-03dd-32088fc0023b	CL	CHL	152	Chile 	Čile	\N
00040000-5596-854a-8c48-7c094dd60546	CN	CHN	156	China 	Kitajska	\N
00040000-5596-854a-d91c-896e49523317	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5596-854a-e65b-b302da59a218	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5596-854a-aaee-4a0ddd789505	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5596-854a-2fa8-49d7da5afac3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5596-854a-3bae-a922ae3f47f7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5596-854a-1a79-083bd32e8f3c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5596-854a-ed2b-17a499ef456a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5596-854a-5518-2977734c025c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5596-854a-b0a9-248eb3c20cfe	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5596-854a-5178-a356e968d444	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5596-854a-3cb3-c13a5719daca	CU	CUB	192	Cuba 	Kuba	\N
00040000-5596-854a-723a-a572df3d1e1c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5596-854a-4bcc-063b22de7610	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5596-854a-4545-877b89799a09	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5596-854a-80a9-d3da27fc9ec2	DK	DNK	208	Denmark 	Danska	\N
00040000-5596-854a-b55e-5218e93e1209	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5596-854a-914b-cb03fa37fe54	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-854a-2699-907287c3aa01	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5596-854a-fc95-6ea0cdf1b120	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5596-854a-ee7b-05f1faaf3b83	EG	EGY	818	Egypt 	Egipt	\N
00040000-5596-854a-b9b5-ecb82c9f5fec	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5596-854a-be48-f83682140418	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5596-854a-72fd-c92054006e82	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5596-854a-b5f9-b04247e81438	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5596-854a-3408-a61db082c48a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5596-854a-0578-2913f123d4ce	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5596-854a-3008-6385afc8bada	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5596-854a-25f1-deb5d53eba09	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5596-854a-1249-dacf36b0ce43	FI	FIN	246	Finland 	Finska	\N
00040000-5596-854a-e18d-138e161b03ee	FR	FRA	250	France 	Francija	\N
00040000-5596-854a-60f5-59ed856c3e0a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5596-854b-168b-8683acfa1806	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5596-854a-73ea-df98fb1be633	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5596-854a-850b-b904214171da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5596-854a-9d4d-3b911aa3f136	GA	GAB	266	Gabon 	Gabon	\N
00040000-5596-854a-ca63-19512e36bb7b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5596-854a-e713-b0241a79a781	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5596-854a-6cc5-ab36a38178b9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5596-854a-da6c-5ee56e341a72	GH	GHA	288	Ghana 	Gana	\N
00040000-5596-854a-6d54-9d847eb42819	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5596-854a-4f34-71e868e275bc	GR	GRC	300	Greece 	Grčija	\N
00040000-5596-854a-f246-d3dc9b75e54a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5596-854a-d6a8-6304ad75ab3f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5596-854a-d66a-d3ec40dffd09	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5596-854a-08e7-048c573824c5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5596-854a-2cc8-850ce1acfad3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5596-854a-1a2c-313c15e86aff	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5596-854a-364a-2a1bc5286350	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5596-854a-ed10-e673ea9923e9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5596-854a-d9b4-01f712af61cc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5596-854a-1eb1-592111a9157d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5596-854a-dca8-b1ba47cafd40	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5596-854a-5971-86412f366f61	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5596-854a-fb3c-24deeb67a9da	HN	HND	340	Honduras 	Honduras	\N
00040000-5596-854a-dbe9-e1936ae94870	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5596-854a-87a8-cf71a4467f7f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5596-854a-0b84-5f081e0ab1d6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5596-854a-e4ad-d4863a67474e	IN	IND	356	India 	Indija	\N
00040000-5596-854a-b27a-beca247c29bf	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5596-854a-5fc7-9b56d1c3e926	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5596-854a-7386-fd125fd49627	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5596-854a-f1eb-3854fa59f3e5	IE	IRL	372	Ireland 	Irska	\N
00040000-5596-854a-afcb-eeb85aa00fe1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5596-854a-e8e5-3613547acde3	IL	ISR	376	Israel 	Izrael	\N
00040000-5596-854a-616f-a3805a188818	IT	ITA	380	Italy 	Italija	\N
00040000-5596-854a-b8d9-90a8c3213371	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5596-854a-56f3-7f695f8886da	JP	JPN	392	Japan 	Japonska	\N
00040000-5596-854a-94e1-8cf1d11fdea6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5596-854a-77b2-4e0b225e3ec6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5596-854a-e422-e10fa4211423	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5596-854a-357e-3b60ce6c05bd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5596-854a-2c88-c0926ca9e8ba	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5596-854a-74fc-587748314b4e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5596-854a-9941-bac1acae5028	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5596-854a-2c1d-767da5a2b0bc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5596-854a-c70e-fbd7ddbe1525	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5596-854a-5719-990a2bb64333	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5596-854a-2b4f-9d0892becb0b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5596-854a-fe33-7162e9c00fe0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5596-854a-c123-8c646a211ec1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5596-854a-c3b5-72c750177576	LR	LBR	430	Liberia 	Liberija	\N
00040000-5596-854a-9322-21f757f6876e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5596-854a-3529-d3a0c31a638b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5596-854a-54ac-2936134a0aba	LT	LTU	440	Lithuania 	Litva	\N
00040000-5596-854a-9334-2ab67ec2501c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5596-854a-0e84-13fdbcee9a84	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5596-854a-b5e4-0178cfa1c651	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5596-854a-8f31-83817534106d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5596-854a-8b9b-56e638d862d5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5596-854a-fda5-a0a4570501a3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5596-854a-4af6-de84f639ad04	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5596-854a-cc86-fe1dc7f7031b	ML	MLI	466	Mali 	Mali	\N
00040000-5596-854a-029d-38d739429ddb	MT	MLT	470	Malta 	Malta	\N
00040000-5596-854b-2153-2ca8e2e1607f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5596-854b-16d4-b268ebc4d3e0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5596-854b-6c14-024cb45a8e01	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5596-854b-c106-35132d1f0e5f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5596-854b-088d-1cc3ed0817c7	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5596-854b-02c7-4dfd5dfbb548	MX	MEX	484	Mexico 	Mehika	\N
00040000-5596-854b-3cf8-f5b4bdbb80d3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5596-854b-3339-14c8275610e4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5596-854b-dda7-278502761d43	MC	MCO	492	Monaco 	Monako	\N
00040000-5596-854b-4b47-10f28d51a568	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5596-854b-e3af-52e12d05cf1a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5596-854b-7e90-f0c67af517af	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5596-854b-65cc-daa9d58371b5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5596-854b-61fd-e4bf651779ca	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5596-854b-8f2f-4236c28f9952	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5596-854b-ccdf-6a97cebe59a4	NA	NAM	516	Namibia 	Namibija	\N
00040000-5596-854b-796b-6cb8b908be74	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5596-854b-cbc2-7327d3daafbb	NP	NPL	524	Nepal 	Nepal	\N
00040000-5596-854b-023d-5a391cb19f5e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5596-854b-9cbc-9e1671cf853c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5596-854b-f9a1-30528359c049	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5596-854b-7dbf-2e8530f9598d	NE	NER	562	Niger 	Niger 	\N
00040000-5596-854b-6da7-f16b7b0f92eb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5596-854b-98a5-022f929ca5c0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5596-854b-a0aa-024076016ab6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5596-854b-d840-82ba174e0af6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5596-854b-f961-6064fb334de3	NO	NOR	578	Norway 	Norveška	\N
00040000-5596-854b-7c88-56b9945e58d1	OM	OMN	512	Oman 	Oman	\N
00040000-5596-854b-86f4-207d4f45211b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5596-854b-0bad-566afdbe3b5d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5596-854b-66cf-4e7d2a8f07b2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5596-854b-9c38-143bc109b94f	PA	PAN	591	Panama 	Panama	\N
00040000-5596-854b-9f9e-1a1e889880af	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5596-854b-c6ca-9cad58449b9c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5596-854b-b8ee-d1fbf5fda668	PE	PER	604	Peru 	Peru	\N
00040000-5596-854b-13e0-ebbe2febe388	PH	PHL	608	Philippines 	Filipini	\N
00040000-5596-854b-d320-6f87b803b725	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5596-854b-e292-dcbc540c4ca7	PL	POL	616	Poland 	Poljska	\N
00040000-5596-854b-2978-b1e8793c947b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5596-854b-3f7c-d5d6eb6076c4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5596-854b-d4a1-7c79a1bc52b9	QA	QAT	634	Qatar 	Katar	\N
00040000-5596-854b-23dd-8d94b37837a2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5596-854b-01ff-b8b2c942e047	RO	ROU	642	Romania 	Romunija	\N
00040000-5596-854b-e2d4-53e0f16fcb9f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5596-854b-1312-e911f55d8a14	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5596-854b-f57d-77b96b9e33d1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5596-854b-9247-6a257d396ab7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5596-854b-2f52-def9349f6ece	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5596-854b-1d0e-18bcc844764b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5596-854b-9722-97a9296c1391	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5596-854b-e934-245c3b0fb9e1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5596-854b-01e4-cc077920c479	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5596-854b-5ba8-dcbbfb3af2c7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5596-854b-cb1d-d2bc686e990e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5596-854b-1f9b-e08ffe59ff31	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5596-854b-7e5c-91e907902922	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5596-854b-c424-d936d9b762cd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5596-854b-dcd1-312220d54a11	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5596-854b-1968-a995bb24c880	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5596-854b-de70-9be6c0fd05b1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5596-854b-cc08-2598be4230bb	SG	SGP	702	Singapore 	Singapur	\N
00040000-5596-854b-702c-7df874912b49	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5596-854b-92f9-e674fe90ffa8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5596-854b-dbb5-c965a5da87ee	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5596-854b-c04d-13251e85c7c7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5596-854b-16b5-a85e4feda93a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5596-854b-6132-2f986ee6c5af	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5596-854b-3743-6e0d06559b56	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5596-854b-a7a6-a3ba7386f2b9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5596-854b-b4f8-775d0b0eb346	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5596-854b-963f-709ef70808eb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5596-854b-5b02-c1f930941331	SD	SDN	729	Sudan 	Sudan	\N
00040000-5596-854b-672f-53ab925117cf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5596-854b-8524-96626c9320a0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5596-854b-329a-cfe02d31b36b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5596-854b-1199-1a87c70420e1	SE	SWE	752	Sweden 	Švedska	\N
00040000-5596-854b-41cb-2cb19cf08828	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5596-854b-b139-bad1f9836616	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5596-854b-b126-818cf9c7ad1b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5596-854b-9677-d9e95cfce5f8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5596-854b-6f6b-6827352a2abe	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5596-854b-dc26-d1f999db31b0	TH	THA	764	Thailand 	Tajska	\N
00040000-5596-854b-1ff8-c5f72865ae52	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5596-854b-a466-eb83baa7243f	TG	TGO	768	Togo 	Togo	\N
00040000-5596-854b-0673-1df2c6487c25	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5596-854b-9def-b7694f659f79	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5596-854b-ed66-0627aff89ac7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5596-854b-99ca-dddc07d7c2a8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5596-854b-da1b-a15c92a59e6b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5596-854b-bb26-7888d16c723b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5596-854b-d348-b4c2ea2ec73c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-854b-02e9-fe4d01ad6cff	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5596-854b-7cdc-295094e8b447	UG	UGA	800	Uganda 	Uganda	\N
00040000-5596-854b-5d70-d67336c855d1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5596-854b-6e47-cef3ba5542a6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5596-854b-8e3b-a4a617d438b4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5596-854b-2122-a4da9addd097	US	USA	840	United States 	Združene države Amerike	\N
00040000-5596-854b-6230-d05e7e289aaa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5596-854b-9d39-7711dd89816c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5596-854b-e1f8-9b627440cdb5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5596-854b-64d1-a2d5a58fcc59	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5596-854b-fa5e-e94d9b7cfbf4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5596-854b-7ae7-552f30f8207b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5596-854b-89a2-a3a47415e160	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-854b-9e22-0942d6d34ef2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5596-854b-2934-44f6cac89b66	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5596-854b-da3b-6def64c5f7a4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5596-854b-c950-972a4ecae2a5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5596-854b-609a-939f9b23789d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5596-854b-b31c-ac8e739a8b0c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 9001353)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5596-854c-2a42-e0120fd4186e	000e0000-5596-854c-d91c-c5cda8ec95c7	\N	\N	10000.80	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5596-854b-bdd0-f663f0f33330	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5596-854c-7f7f-6a3929f0bcd2	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	\N	5000.00	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5596-854b-9739-eb3678260abc	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2889 (class 0 OID 9001180)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5596-854c-d26e-ca6539e8a6f8	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5596-854b-10ce-74954bd264e3
000d0000-5596-854c-6232-6a62ca070306	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-854b-10ce-74954bd264e3
000d0000-5596-854c-e5b7-1f79b8e080c2	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5596-854b-8b5b-bee921b0f5ec
000d0000-5596-854c-4af1-8943794beede	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5596-854b-c123-96e98c262e20
000d0000-5596-854c-a274-055647815607	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5596-854b-c123-96e98c262e20
000d0000-5596-854c-f301-570e36d8f335	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5596-854b-c123-96e98c262e20
000d0000-5596-854c-604c-5b568c4f0d40	000e0000-5596-854c-a3fb-8ec49c74a01a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-854b-10ce-74954bd264e3
\.


--
-- TOC entry 2868 (class 0 OID 9001000)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 9001048)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 9000980)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5596-854c-9566-bab32ab3c15a	00080000-5596-854c-54ed-9960e742b51d	00090000-5596-854c-b92e-afd234e66436	AK		
\.


--
-- TOC entry 2843 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9001097)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9001122)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 9000937)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5596-854b-d264-587fe1eb434f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5596-854b-6cf4-aeb07b05d2e3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5596-854b-d36f-fa287947970a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5596-854b-cc1d-4efe61d28068	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5596-854b-56f2-79551474bb63	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5596-854b-bd04-75f0a243b52e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5596-854b-3113-c97e13ea7e58	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5596-854b-c92b-e5f784e44aa1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-854b-b4de-17965066fcf6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-854b-3e2c-da5ac7d44c22	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5596-854b-0b92-00d78e4ea7b8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5596-854b-043b-1d37157aedfb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5596-854b-4cc1-4c317ceb9e69	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5596-854c-a375-7319e82c533e	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5596-854c-8ffe-f3c9d360f96f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5596-854c-a4e5-6bc1eb76249f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5596-854c-5060-26eab9e4a99b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5596-854c-556e-ae10126f0584	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5596-854c-1a2f-f8b3cd1a7316	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2857 (class 0 OID 9000850)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5596-854c-ce25-319b8e1f0432	00000000-5596-854c-8ffe-f3c9d360f96f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5596-854c-6c12-0f0aeaa47698	00000000-5596-854c-8ffe-f3c9d360f96f	00010000-5596-854b-dae9-cf797994adb2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5596-854c-0fbc-f94262210ba9	00000000-5596-854c-a4e5-6bc1eb76249f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2858 (class 0 OID 9000861)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5596-854c-94c6-a109e716cbb2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5596-854c-d387-3bbeab78d4aa	00010000-5596-854c-6eca-95486e948211	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5596-854c-c245-80298cebf707	00010000-5596-854c-1da2-81cb4074eb21	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5596-854c-3c2e-af219bb3ea66	00010000-5596-854c-3eab-9e18163816d5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5596-854c-7df9-d5f64a4d7361	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5596-854c-fd74-ba0a61fe2130	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5596-854c-bdd0-ba0cae9560bd	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5596-854c-c85f-aa2262488296	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5596-854c-b92e-afd234e66436	00010000-5596-854c-a479-bf1f8569fbac	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5596-854c-0a11-30ce28f8ed46	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5596-854c-e0a9-1889435efb3b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5596-854c-2afd-0135ba1c67d5	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5596-854c-89b1-5f91ef61df4e	00010000-5596-854c-4258-d3c6220d926f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9000815)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5596-854b-263f-feac60b32a6c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5596-854b-cbb2-d8b33b57b922	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5596-854b-0038-af5edcccea0d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5596-854b-1e19-d23c16433f7f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5596-854b-6bd1-9abb84a27ccc	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5596-854b-6f81-f25bf69f5c06	Abonma-read	Abonma - branje	f
00030000-5596-854b-da9e-f2e567fc5c8a	Abonma-write	Abonma - spreminjanje	f
00030000-5596-854b-511f-9eb7590d8e21	Alternacija-read	Alternacija - branje	f
00030000-5596-854b-1e64-ace69ca73def	Alternacija-write	Alternacija - spreminjanje	f
00030000-5596-854b-31d5-0dad3e4cf508	Arhivalija-read	Arhivalija - branje	f
00030000-5596-854b-07f7-57497db54cdf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5596-854b-77da-78b68eb7feff	Besedilo-read	Besedilo - branje	f
00030000-5596-854b-63b6-b88fff9f0889	Besedilo-write	Besedilo - spreminjanje	f
00030000-5596-854b-b35b-9c9ffb420be3	DogodekIzven-read	DogodekIzven - branje	f
00030000-5596-854b-ab03-bd26db18822d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5596-854b-ea09-20f264ae228f	Dogodek-read	Dogodek - branje	f
00030000-5596-854b-734e-18777056cb9d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5596-854b-e194-213d2bb0b4a4	DrugiVir-read	DrugiVir - branje	f
00030000-5596-854b-ec05-c4e4a689e176	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5596-854b-bf40-348b4cc87733	Drzava-read	Drzava - branje	f
00030000-5596-854b-df3c-b227b5a47363	Drzava-write	Drzava - spreminjanje	f
00030000-5596-854b-fcdc-6fb56af9dc62	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5596-854b-07de-cb184d4e9be5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5596-854b-515a-a83ddbe6f6b2	Funkcija-read	Funkcija - branje	f
00030000-5596-854b-e2fa-ddd10eb829c8	Funkcija-write	Funkcija - spreminjanje	f
00030000-5596-854b-29e0-f80d9796381e	Gostovanje-read	Gostovanje - branje	f
00030000-5596-854b-fbcd-513ba2b3dace	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5596-854b-e69e-4983c948b885	Gostujoca-read	Gostujoca - branje	f
00030000-5596-854b-351d-b5643a64f3f2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5596-854b-fa18-218d7f07cc59	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5596-854b-fd6d-8a5101824f4c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5596-854b-3493-2f0f9235e8c3	Kupec-read	Kupec - branje	f
00030000-5596-854b-a0db-a12f5a427889	Kupec-write	Kupec - spreminjanje	f
00030000-5596-854b-787b-3522ad0a735b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5596-854b-427c-72b73203e15a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5596-854b-b7e9-015ddc2fc501	Option-read	Option - branje	f
00030000-5596-854b-2441-a71ce99ca967	Option-write	Option - spreminjanje	f
00030000-5596-854b-a642-a5276e8f61c6	OptionValue-read	OptionValue - branje	f
00030000-5596-854b-416e-2a8fc8ea3b37	OptionValue-write	OptionValue - spreminjanje	f
00030000-5596-854b-80d0-810c548a3496	Oseba-read	Oseba - branje	f
00030000-5596-854b-8ea1-6899620e31ec	Oseba-write	Oseba - spreminjanje	f
00030000-5596-854b-ed30-abf6eb41da82	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5596-854b-ead6-f61c9ff09212	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5596-854b-11d6-cdc6dece5e5b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5596-854b-bcfd-d37154aff42f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5596-854b-c12c-dd9595a1c444	Pogodba-read	Pogodba - branje	f
00030000-5596-854b-c0eb-0da6d08ece5e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5596-854b-7107-38f3b937cab0	Popa-read	Popa - branje	f
00030000-5596-854b-5466-88f0e13b89c5	Popa-write	Popa - spreminjanje	f
00030000-5596-854b-ba8a-4797163972f8	Posta-read	Posta - branje	f
00030000-5596-854b-752b-974082d17d0e	Posta-write	Posta - spreminjanje	f
00030000-5596-854b-4697-28eaa1e174ed	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5596-854b-02f2-738c48481c9e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5596-854b-e3e8-d1cdf535fd96	PostniNaslov-read	PostniNaslov - branje	f
00030000-5596-854b-7418-c892d11fa500	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5596-854b-4d51-2f2b5a8b40d1	Predstava-read	Predstava - branje	f
00030000-5596-854b-b7eb-cd4ea5ca1996	Predstava-write	Predstava - spreminjanje	f
00030000-5596-854b-1502-c49bc757de40	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5596-854b-764d-b30060fe75a3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5596-854b-413a-380be84e854f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5596-854b-1a53-50986bc3fca1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5596-854b-8b58-bbef11125c3d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5596-854b-4b02-e23fe50d86ca	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5596-854b-bb90-142b3d2d01ad	ProgramDela-read	ProgramDela - branje	f
00030000-5596-854b-e445-98a8df83477d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5596-854b-ef74-6f6250c3752f	ProgramFestival-read	ProgramFestival - branje	f
00030000-5596-854b-6b77-7b304a5c7ac0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5596-854b-8615-1d4653307d1f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5596-854b-3bfa-48a32db775d2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5596-854b-bb84-5da53ff812ff	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5596-854b-9fe5-2d6f629b69ec	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5596-854b-5eb4-e68c43da1f17	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5596-854b-376c-a2e196d53004	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5596-854b-fc8b-9ed00e216169	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5596-854b-9ef0-efc4079e6186	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5596-854b-06b5-28d0502ecc3f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5596-854b-1433-cda02763fd30	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5596-854b-87e3-1f3dc0c57a97	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5596-854b-302d-8d1f63a8708a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5596-854b-399c-0c5d4cf77513	ProgramRazno-read	ProgramRazno - branje	f
00030000-5596-854b-7e19-40fabf7ac5e1	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5596-854b-c97b-f8e89094f305	Prostor-read	Prostor - branje	f
00030000-5596-854b-c50f-f605eb5fd663	Prostor-write	Prostor - spreminjanje	f
00030000-5596-854b-b6a7-07233f3d998c	Racun-read	Racun - branje	f
00030000-5596-854b-70d1-0c8ef8b0606b	Racun-write	Racun - spreminjanje	f
00030000-5596-854b-739d-b95035a5a237	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5596-854b-698a-a4834394369a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5596-854b-bc17-c1f1e0b93b63	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5596-854b-c7d5-f6ed074f8561	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5596-854b-a037-e96515d1ea0d	Rekvizit-read	Rekvizit - branje	f
00030000-5596-854b-df80-5f3004dc55a1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5596-854b-3ceb-fa367756da35	Revizija-read	Revizija - branje	f
00030000-5596-854b-9b9c-81687fdc17e9	Revizija-write	Revizija - spreminjanje	f
00030000-5596-854b-cf34-f1acf19a4fff	Rezervacija-read	Rezervacija - branje	f
00030000-5596-854b-c2bb-1a5187705035	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5596-854b-d112-b64058d4698d	SedezniRed-read	SedezniRed - branje	f
00030000-5596-854b-b922-e248069f83e1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5596-854b-40b0-26299d8bc80c	Sedez-read	Sedez - branje	f
00030000-5596-854b-985f-03aa7ba16a76	Sedez-write	Sedez - spreminjanje	f
00030000-5596-854b-ab5b-43fc767d5fec	Sezona-read	Sezona - branje	f
00030000-5596-854b-2572-b1fa7d1d47c5	Sezona-write	Sezona - spreminjanje	f
00030000-5596-854b-8b03-a1007032c888	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5596-854b-056c-b717d9a0c5bd	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5596-854b-bd6c-97f7e6cac080	Stevilcenje-read	Stevilcenje - branje	f
00030000-5596-854b-a825-908bec3c30bd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5596-854b-0c3d-d55d0ddfe40b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5596-854b-416d-7889b55b325d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5596-854b-5f8b-7a90a67516af	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5596-854b-2ac3-25c968144cee	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5596-854b-68cd-eab13c6fa504	Telefonska-read	Telefonska - branje	f
00030000-5596-854b-a70e-f5b7cce2cdf9	Telefonska-write	Telefonska - spreminjanje	f
00030000-5596-854b-2fc4-4eb93fb3390a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5596-854b-bf4c-219e71069583	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5596-854b-8bb9-bc63813adaec	TipFunkcije-read	TipFunkcije - branje	f
00030000-5596-854b-5da0-086380737e9e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5596-854b-9606-047b9633077e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5596-854b-b1ca-e735d4924568	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5596-854b-15f2-6562ac16a1b4	Trr-read	Trr - branje	f
00030000-5596-854b-2f20-da0983ca7dc9	Trr-write	Trr - spreminjanje	f
00030000-5596-854b-beca-7395dd4c1754	Uprizoritev-read	Uprizoritev - branje	f
00030000-5596-854b-5f85-65f4b9edc813	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5596-854b-67af-f99aa0d0e5d4	Vaja-read	Vaja - branje	f
00030000-5596-854b-e4d3-77563c21d036	Vaja-write	Vaja - spreminjanje	f
00030000-5596-854b-0c92-520e97e0ec36	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5596-854b-6924-dd5a6bafc9db	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5596-854b-0718-d49d28549f23	Zaposlitev-read	Zaposlitev - branje	f
00030000-5596-854b-84a4-b8b6a9f09616	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5596-854b-301c-2cde7bb5827c	Zasedenost-read	Zasedenost - branje	f
00030000-5596-854b-d47b-609bee1fbef7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5596-854b-74bc-ebf57c8050d7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5596-854b-4bc7-2347c2c65378	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5596-854b-8fb2-be00b343b3d1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5596-854b-60aa-ba2d7b7ae7fe	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2855 (class 0 OID 9000834)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5596-854b-0e11-84fb997c3655	00030000-5596-854b-cbb2-d8b33b57b922
00020000-5596-854b-ae0b-c742ea8b9f6c	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-da9e-f2e567fc5c8a
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-511f-9eb7590d8e21
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-1e64-ace69ca73def
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-1e19-d23c16433f7f
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-734e-18777056cb9d
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-df3c-b227b5a47363
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-515a-a83ddbe6f6b2
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-e2fa-ddd10eb829c8
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-fbcd-513ba2b3dace
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-351d-b5643a64f3f2
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-fa18-218d7f07cc59
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-fd6d-8a5101824f4c
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-80d0-810c548a3496
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-8ea1-6899620e31ec
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-5466-88f0e13b89c5
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-752b-974082d17d0e
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-e3e8-d1cdf535fd96
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-7418-c892d11fa500
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-b7eb-cd4ea5ca1996
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-8b58-bbef11125c3d
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-4b02-e23fe50d86ca
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-c50f-f605eb5fd663
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-c7d5-f6ed074f8561
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-df80-5f3004dc55a1
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-2572-b1fa7d1d47c5
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-8bb9-bc63813adaec
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-beca-7395dd4c1754
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-5f85-65f4b9edc813
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-67af-f99aa0d0e5d4
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-e4d3-77563c21d036
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-301c-2cde7bb5827c
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-d47b-609bee1fbef7
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854b-0443-e05a9af8a0ab	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-fa18-218d7f07cc59
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-fd6d-8a5101824f4c
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-80d0-810c548a3496
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-8ea1-6899620e31ec
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-e3e8-d1cdf535fd96
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-7418-c892d11fa500
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-68cd-eab13c6fa504
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-a70e-f5b7cce2cdf9
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-15f2-6562ac16a1b4
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-2f20-da0983ca7dc9
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-0718-d49d28549f23
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-84a4-b8b6a9f09616
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854b-7859-9c02342ccc00	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-511f-9eb7590d8e21
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-07f7-57497db54cdf
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-77da-78b68eb7feff
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-b35b-9c9ffb420be3
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-515a-a83ddbe6f6b2
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-fa18-218d7f07cc59
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-80d0-810c548a3496
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-8b58-bbef11125c3d
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-8bb9-bc63813adaec
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-67af-f99aa0d0e5d4
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-301c-2cde7bb5827c
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854b-e178-1fc4d064059a	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-da9e-f2e567fc5c8a
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-1e64-ace69ca73def
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-8bb9-bc63813adaec
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854b-a8b2-356f815db52f	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-2fc4-4eb93fb3390a
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-0038-af5edcccea0d
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-8bb9-bc63813adaec
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854b-3fba-6687a9636a82	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-263f-feac60b32a6c
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-cbb2-d8b33b57b922
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-0038-af5edcccea0d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-1e19-d23c16433f7f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-6bd1-9abb84a27ccc
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-6f81-f25bf69f5c06
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-da9e-f2e567fc5c8a
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-511f-9eb7590d8e21
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-1e64-ace69ca73def
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-31d5-0dad3e4cf508
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-07f7-57497db54cdf
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-77da-78b68eb7feff
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-63b6-b88fff9f0889
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b35b-9c9ffb420be3
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ab03-bd26db18822d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ea09-20f264ae228f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-734e-18777056cb9d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bf40-348b4cc87733
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-df3c-b227b5a47363
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-fcdc-6fb56af9dc62
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-07de-cb184d4e9be5
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-515a-a83ddbe6f6b2
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-e2fa-ddd10eb829c8
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-29e0-f80d9796381e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-fbcd-513ba2b3dace
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-e69e-4983c948b885
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-351d-b5643a64f3f2
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-fa18-218d7f07cc59
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-fd6d-8a5101824f4c
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-3493-2f0f9235e8c3
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-a0db-a12f5a427889
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-787b-3522ad0a735b
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-427c-72b73203e15a
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b7e9-015ddc2fc501
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-2441-a71ce99ca967
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-a642-a5276e8f61c6
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-416e-2a8fc8ea3b37
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-80d0-810c548a3496
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8ea1-6899620e31ec
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ed30-abf6eb41da82
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ead6-f61c9ff09212
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-11d6-cdc6dece5e5b
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bcfd-d37154aff42f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c12c-dd9595a1c444
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c0eb-0da6d08ece5e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-7107-38f3b937cab0
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-5466-88f0e13b89c5
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ba8a-4797163972f8
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-752b-974082d17d0e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-4697-28eaa1e174ed
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-02f2-738c48481c9e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-e3e8-d1cdf535fd96
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-7418-c892d11fa500
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-4d51-2f2b5a8b40d1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b7eb-cd4ea5ca1996
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-1502-c49bc757de40
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-764d-b30060fe75a3
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-413a-380be84e854f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-1a53-50986bc3fca1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8b58-bbef11125c3d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-4b02-e23fe50d86ca
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bb90-142b3d2d01ad
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-e445-98a8df83477d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ef74-6f6250c3752f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-6b77-7b304a5c7ac0
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8615-1d4653307d1f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-3bfa-48a32db775d2
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bb84-5da53ff812ff
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-9fe5-2d6f629b69ec
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-5eb4-e68c43da1f17
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-376c-a2e196d53004
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-fc8b-9ed00e216169
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-9ef0-efc4079e6186
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-06b5-28d0502ecc3f
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-1433-cda02763fd30
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-87e3-1f3dc0c57a97
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-302d-8d1f63a8708a
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-399c-0c5d4cf77513
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-7e19-40fabf7ac5e1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c97b-f8e89094f305
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c50f-f605eb5fd663
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b6a7-07233f3d998c
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-70d1-0c8ef8b0606b
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-739d-b95035a5a237
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-698a-a4834394369a
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bc17-c1f1e0b93b63
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c7d5-f6ed074f8561
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-a037-e96515d1ea0d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-df80-5f3004dc55a1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-3ceb-fa367756da35
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-9b9c-81687fdc17e9
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-cf34-f1acf19a4fff
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-c2bb-1a5187705035
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-d112-b64058d4698d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b922-e248069f83e1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-40b0-26299d8bc80c
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-985f-03aa7ba16a76
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-ab5b-43fc767d5fec
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-2572-b1fa7d1d47c5
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8b03-a1007032c888
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-056c-b717d9a0c5bd
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bd6c-97f7e6cac080
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-a825-908bec3c30bd
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-0c3d-d55d0ddfe40b
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-416d-7889b55b325d
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-5f8b-7a90a67516af
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-2ac3-25c968144cee
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-68cd-eab13c6fa504
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-a70e-f5b7cce2cdf9
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-2fc4-4eb93fb3390a
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-bf4c-219e71069583
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8bb9-bc63813adaec
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-5da0-086380737e9e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-9606-047b9633077e
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-b1ca-e735d4924568
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-15f2-6562ac16a1b4
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-2f20-da0983ca7dc9
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-beca-7395dd4c1754
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-5f85-65f4b9edc813
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-67af-f99aa0d0e5d4
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-e4d3-77563c21d036
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-0c92-520e97e0ec36
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-6924-dd5a6bafc9db
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-0718-d49d28549f23
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-84a4-b8b6a9f09616
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-301c-2cde7bb5827c
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-d47b-609bee1fbef7
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-74bc-ebf57c8050d7
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-4bc7-2347c2c65378
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-8fb2-be00b343b3d1
00020000-5596-854c-bb65-6c10dee9bb7a	00030000-5596-854b-60aa-ba2d7b7ae7fe
\.


--
-- TOC entry 2883 (class 0 OID 9001129)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 9001160)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 9001273)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5596-854c-dd84-baaee61340bf	00090000-5596-854c-94c6-a109e716cbb2	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2860 (class 0 OID 9000894)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5596-854c-54ed-9960e742b51d	00040000-5596-854b-dbb5-c965a5da87ee	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-b17a-6db7c70afadb	00040000-5596-854b-dbb5-c965a5da87ee	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5596-854c-794a-cd7373aef2d6	00040000-5596-854b-dbb5-c965a5da87ee	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-c08a-8ad708473223	00040000-5596-854b-dbb5-c965a5da87ee	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-8c89-9cc1e07708e8	00040000-5596-854b-dbb5-c965a5da87ee	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-3de3-d152b4b4b67f	00040000-5596-854a-5aee-b9384521d4cc	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-feb0-7bd455e90c99	00040000-5596-854a-5178-a356e968d444	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-5948-14c276ec4d68	00040000-5596-854a-dd08-1e3004d94936	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-854c-3303-42511fcfda19	00040000-5596-854b-dbb5-c965a5da87ee	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2862 (class 0 OID 9000929)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5596-854b-b5f6-801dbe7a2dec	8341	Adlešiči
00050000-5596-854b-d047-b5e38f5433be	5270	Ajdovščina
00050000-5596-854b-49b0-4019c184d056	6280	Ankaran/Ancarano
00050000-5596-854b-fae8-f754235cf155	9253	Apače
00050000-5596-854b-fca0-5ca1240b4219	8253	Artiče
00050000-5596-854b-7620-021ccce66dab	4275	Begunje na Gorenjskem
00050000-5596-854b-624f-4f977a35ba1b	1382	Begunje pri Cerknici
00050000-5596-854b-2790-68d733820ba8	9231	Beltinci
00050000-5596-854b-80bd-57852c95afae	2234	Benedikt
00050000-5596-854b-06a5-f7bb9a99f875	2345	Bistrica ob Dravi
00050000-5596-854b-0738-39ecd8f903f1	3256	Bistrica ob Sotli
00050000-5596-854b-2c62-6ff642de17e2	8259	Bizeljsko
00050000-5596-854b-2973-3dde471e0c5c	1223	Blagovica
00050000-5596-854b-3127-834c51d57bf1	8283	Blanca
00050000-5596-854b-2678-8e67aec3dfa4	4260	Bled
00050000-5596-854b-5510-2eb33abde92a	4273	Blejska Dobrava
00050000-5596-854b-1550-51db2ed4b9f5	9265	Bodonci
00050000-5596-854b-ab22-163f7a109887	9222	Bogojina
00050000-5596-854b-947a-626845a3b3bf	4263	Bohinjska Bela
00050000-5596-854b-1f02-b07d3a675e4b	4264	Bohinjska Bistrica
00050000-5596-854b-3914-860970d8822d	4265	Bohinjsko jezero
00050000-5596-854b-4233-76d50653ff80	1353	Borovnica
00050000-5596-854b-d51b-6baf992fa562	8294	Boštanj
00050000-5596-854b-406f-3697377a0263	5230	Bovec
00050000-5596-854b-8f98-a544b7b6db9a	5295	Branik
00050000-5596-854b-3b0a-28366e03e58f	3314	Braslovče
00050000-5596-854b-1fdb-0c2983d5c199	5223	Breginj
00050000-5596-854b-ad98-223b0579db3e	8280	Brestanica
00050000-5596-854b-bae1-bf1015154b02	2354	Bresternica
00050000-5596-854b-d129-de9aef01e52f	4243	Brezje
00050000-5596-854b-b3ca-5a5c63aae16d	1351	Brezovica pri Ljubljani
00050000-5596-854b-b929-e2b543bcdba6	8250	Brežice
00050000-5596-854b-57e6-d18ecab493fd	4210	Brnik - Aerodrom
00050000-5596-854b-80a7-ea23a30634b5	8321	Brusnice
00050000-5596-854b-b91a-02a5650c73f9	3255	Buče
00050000-5596-854b-961f-88734dd20302	8276	Bučka 
00050000-5596-854b-dc8c-6b4e309a57dc	9261	Cankova
00050000-5596-854b-c42f-d38abc53229b	3000	Celje 
00050000-5596-854b-e8f8-2b5cdbf1f911	3001	Celje - poštni predali
00050000-5596-854b-70be-9534631199ea	4207	Cerklje na Gorenjskem
00050000-5596-854b-d4a4-64b4b2134d08	8263	Cerklje ob Krki
00050000-5596-854b-561b-2e874aa27cea	1380	Cerknica
00050000-5596-854b-e289-8793067fdc63	5282	Cerkno
00050000-5596-854b-7fb6-df8addc13ab9	2236	Cerkvenjak
00050000-5596-854b-dd94-d12b03d109ad	2215	Ceršak
00050000-5596-854b-26b4-4d7c6e797ee9	2326	Cirkovce
00050000-5596-854b-e24b-4a806a41703f	2282	Cirkulane
00050000-5596-854b-b93c-aadbb7dc0cd7	5273	Col
00050000-5596-854b-8c52-83c80bbbd24b	8251	Čatež ob Savi
00050000-5596-854b-0245-c358343a8f25	1413	Čemšenik
00050000-5596-854b-4f35-430e4d1f4df6	5253	Čepovan
00050000-5596-854b-4301-d11a033b26dc	9232	Črenšovci
00050000-5596-854b-64e2-0433fece044e	2393	Črna na Koroškem
00050000-5596-854b-cbe6-09070b5ab91c	6275	Črni Kal
00050000-5596-854b-76c0-21d11e293e60	5274	Črni Vrh nad Idrijo
00050000-5596-854b-26a7-c501517179e3	5262	Črniče
00050000-5596-854b-1b27-4f7756073262	8340	Črnomelj
00050000-5596-854b-8f8b-e905eb83ca12	6271	Dekani
00050000-5596-854b-0a68-b01e3c58746c	5210	Deskle
00050000-5596-854b-b3f2-e6f122a7b52a	2253	Destrnik
00050000-5596-854b-32f3-0ca7cbca0c2f	6215	Divača
00050000-5596-854b-39fb-fa18a93fbf05	1233	Dob
00050000-5596-854b-7a0d-65e95ed12d2b	3224	Dobje pri Planini
00050000-5596-854b-9d8d-ea0211ff0503	8257	Dobova
00050000-5596-854b-5ef7-a7ce3eb4037b	1423	Dobovec
00050000-5596-854b-8c76-04554f51c827	5263	Dobravlje
00050000-5596-854b-8915-a72f6d277ff7	3204	Dobrna
00050000-5596-854b-66a5-32e5e8c2c545	8211	Dobrnič
00050000-5596-854b-16af-4c9e63cd2d88	1356	Dobrova
00050000-5596-854b-b157-3d2eeed57f61	9223	Dobrovnik/Dobronak 
00050000-5596-854b-1cc9-851fd6c80bd6	5212	Dobrovo v Brdih
00050000-5596-854b-6b77-e14094179b65	1431	Dol pri Hrastniku
00050000-5596-854b-bf08-12de23acab70	1262	Dol pri Ljubljani
00050000-5596-854b-32dc-0a27c2fe910e	1273	Dole pri Litiji
00050000-5596-854b-0c02-b065a26d0e2f	1331	Dolenja vas
00050000-5596-854b-3ac4-6c2937f6c01a	8350	Dolenjske Toplice
00050000-5596-854b-ac6e-d78135bb1ae1	1230	Domžale
00050000-5596-854b-c778-3524348d8abb	2252	Dornava
00050000-5596-854b-1ea9-3e2039119130	5294	Dornberk
00050000-5596-854b-4d5e-14a138950bca	1319	Draga
00050000-5596-854b-8312-f0d7f807f21c	8343	Dragatuš
00050000-5596-854b-ef79-56f5beb7a3b6	3222	Dramlje
00050000-5596-854b-2a5d-cee78dce79e2	2370	Dravograd
00050000-5596-854b-5d81-17fa454bdd50	4203	Duplje
00050000-5596-854b-2c46-d832521273c6	6221	Dutovlje
00050000-5596-854b-b277-7818fab23db3	8361	Dvor
00050000-5596-854b-3187-9ad5da86d7d3	2343	Fala
00050000-5596-854b-fc97-d040bd87dac1	9208	Fokovci
00050000-5596-854b-41f3-921595ee7448	2313	Fram
00050000-5596-854b-bf08-e29563175500	3213	Frankolovo
00050000-5596-854b-4be2-9913fb83c79b	1274	Gabrovka
00050000-5596-854b-310a-b22f4bd1578a	8254	Globoko
00050000-5596-854b-7ee3-10bebba8d6e9	5275	Godovič
00050000-5596-854b-73d8-e43c1bda1de2	4204	Golnik
00050000-5596-854b-9112-d2895752d3ac	3303	Gomilsko
00050000-5596-854b-457d-88b4b98c6a2c	4224	Gorenja vas
00050000-5596-854b-2152-a67c6cdc672d	3263	Gorica pri Slivnici
00050000-5596-854b-64c1-7fe1f6e7d648	2272	Gorišnica
00050000-5596-854b-cdd9-682a20bb4f69	9250	Gornja Radgona
00050000-5596-854b-2ea3-ff48faad721b	3342	Gornji Grad
00050000-5596-854b-dd59-3404a85906cd	4282	Gozd Martuljek
00050000-5596-854b-8428-a3f266481a4d	6272	Gračišče
00050000-5596-854b-edde-d7c33bd95bf8	9264	Grad
00050000-5596-854b-4ebb-842dc9dbe9de	8332	Gradac
00050000-5596-854b-3752-3bb79e08553e	1384	Grahovo
00050000-5596-854b-d9d6-12af47ac2d7e	5242	Grahovo ob Bači
00050000-5596-854b-2b82-7e0d52163213	5251	Grgar
00050000-5596-854b-586a-08430ec2a9e6	3302	Griže
00050000-5596-854b-4c6a-eea716523f01	3231	Grobelno
00050000-5596-854b-1567-4abf1b4448e7	1290	Grosuplje
00050000-5596-854b-20b4-a1a96b85bff6	2288	Hajdina
00050000-5596-854b-ce38-c82daff172f7	8362	Hinje
00050000-5596-854b-5012-ce34d2235f01	2311	Hoče
00050000-5596-854b-cd39-2f15e30def76	9205	Hodoš/Hodos
00050000-5596-854b-a046-61073b73363e	1354	Horjul
00050000-5596-854b-6375-a57b1b96cb65	1372	Hotedršica
00050000-5596-854b-e3fb-81708107f3f0	1430	Hrastnik
00050000-5596-854b-dba1-fec7490408ee	6225	Hruševje
00050000-5596-854b-47bc-adb0a43946d7	4276	Hrušica
00050000-5596-854b-81c8-6cf6f4aa9a7f	5280	Idrija
00050000-5596-854b-05ae-0fe994784d03	1292	Ig
00050000-5596-854b-8746-55bd89b0dd2d	6250	Ilirska Bistrica
00050000-5596-854b-ea6d-2c396c84527e	6251	Ilirska Bistrica-Trnovo
00050000-5596-854b-4863-1693ac68e458	1295	Ivančna Gorica
00050000-5596-854b-d4c2-c62dad5f6d22	2259	Ivanjkovci
00050000-5596-854b-550c-cba95c931061	1411	Izlake
00050000-5596-854b-d710-04f06544d9d5	6310	Izola/Isola
00050000-5596-854b-f306-8cc1af3fabd3	2222	Jakobski Dol
00050000-5596-854b-1c7a-ca15531a8684	2221	Jarenina
00050000-5596-854b-83ab-e9d51515f68a	6254	Jelšane
00050000-5596-854b-f8b2-e0c825ed6906	4270	Jesenice
00050000-5596-854b-6290-edef9ee042e1	8261	Jesenice na Dolenjskem
00050000-5596-854b-8cd1-b5199f26f48a	3273	Jurklošter
00050000-5596-854b-0334-917d27b25f0a	2223	Jurovski Dol
00050000-5596-854b-4e8d-d05211558f12	2256	Juršinci
00050000-5596-854b-d700-c0342637c5e5	5214	Kal nad Kanalom
00050000-5596-854b-f4fd-53117a422a9f	3233	Kalobje
00050000-5596-854b-92d1-979f03aa5916	4246	Kamna Gorica
00050000-5596-854b-cdff-7d33a5e34f71	2351	Kamnica
00050000-5596-854b-7ab0-95c6aaf1e222	1241	Kamnik
00050000-5596-854b-357d-5bbb5c810669	5213	Kanal
00050000-5596-854b-73dc-e1411cdcd321	8258	Kapele
00050000-5596-854b-510d-c82910ceac0a	2362	Kapla
00050000-5596-854b-68c7-baf24e85fad4	2325	Kidričevo
00050000-5596-854b-457f-c7affb348c1a	1412	Kisovec
00050000-5596-854b-2f18-a7bf6653e19f	6253	Knežak
00050000-5596-854b-d5e5-e1cee8e57758	5222	Kobarid
00050000-5596-854b-fe63-ad59828f2d66	9227	Kobilje
00050000-5596-854b-6593-7fb015b3516d	1330	Kočevje
00050000-5596-854b-d95a-81cb0abb5846	1338	Kočevska Reka
00050000-5596-854b-8670-41dc93ea4477	2276	Kog
00050000-5596-854b-e17e-47a1ed196084	5211	Kojsko
00050000-5596-854b-f221-107c4f3aa882	6223	Komen
00050000-5596-854b-4676-9858e0153e55	1218	Komenda
00050000-5596-854b-30e1-17f3cab95d5b	6000	Koper/Capodistria 
00050000-5596-854b-71a9-040b6424fc2d	6001	Koper/Capodistria - poštni predali
00050000-5596-854b-c2a7-e5cc7141c2a0	8282	Koprivnica
00050000-5596-854b-0713-82b18108dbfd	5296	Kostanjevica na Krasu
00050000-5596-854b-2e2f-2b157062f919	8311	Kostanjevica na Krki
00050000-5596-854b-a64e-c14985b02ffb	1336	Kostel
00050000-5596-854b-450a-de8df3a9d59e	6256	Košana
00050000-5596-854b-2f57-67a54c307349	2394	Kotlje
00050000-5596-854b-39d9-9bf785ea8cfe	6240	Kozina
00050000-5596-854b-3539-e89e5f8218fc	3260	Kozje
00050000-5596-854b-fbe6-afeafc11b6fb	4000	Kranj 
00050000-5596-854b-5bda-398e4c6569d9	4001	Kranj - poštni predali
00050000-5596-854b-4ae1-b67e50c3bc72	4280	Kranjska Gora
00050000-5596-854b-a8ee-8fba280c849f	1281	Kresnice
00050000-5596-854b-66ca-99620908f551	4294	Križe
00050000-5596-854b-3714-d01506c32da8	9206	Križevci
00050000-5596-854b-3b06-3e2e62e293f2	9242	Križevci pri Ljutomeru
00050000-5596-854b-cf18-17027abfce11	1301	Krka
00050000-5596-854b-34fd-da6f1508cfed	8296	Krmelj
00050000-5596-854b-e2d6-64537a58cc72	4245	Kropa
00050000-5596-854b-cf63-a14fdc50e3dd	8262	Krška vas
00050000-5596-854b-d8a1-3721eb1f149a	8270	Krško
00050000-5596-854b-34d9-5c6e0bced39c	9263	Kuzma
00050000-5596-854b-905c-422dc7470517	2318	Laporje
00050000-5596-854b-05ef-f62f4fc633f3	3270	Laško
00050000-5596-854b-de17-fed16c84f8a0	1219	Laze v Tuhinju
00050000-5596-854b-a01c-b90b1948324c	2230	Lenart v Slovenskih goricah
00050000-5596-854b-aa56-606bbcc00582	9220	Lendava/Lendva
00050000-5596-854b-d2cf-254b544fe3e3	4248	Lesce
00050000-5596-854b-d757-a6602eb89cd8	3261	Lesično
00050000-5596-854b-40d2-fd75fe81bed1	8273	Leskovec pri Krškem
00050000-5596-854b-d4d9-1431242c55e8	2372	Libeliče
00050000-5596-854b-f508-59e8a2ad6f9c	2341	Limbuš
00050000-5596-854b-2f49-2dc920ac8157	1270	Litija
00050000-5596-854b-bb83-abd062fa5d9e	3202	Ljubečna
00050000-5596-854b-583e-57233db38a51	1000	Ljubljana 
00050000-5596-854b-849b-eb8861e23136	1001	Ljubljana - poštni predali
00050000-5596-854b-40d6-13796a14d366	1231	Ljubljana - Črnuče
00050000-5596-854b-dd24-5d111974dc4a	1261	Ljubljana - Dobrunje
00050000-5596-854b-1102-5bba3b2e292f	1260	Ljubljana - Polje
00050000-5596-854b-7093-79f5d2a14ff2	1210	Ljubljana - Šentvid
00050000-5596-854b-a312-8e348797f2e2	1211	Ljubljana - Šmartno
00050000-5596-854b-bb76-94f6e3a9fa7b	3333	Ljubno ob Savinji
00050000-5596-854b-3dbf-7360705bc7c0	9240	Ljutomer
00050000-5596-854b-7dea-00ad1bdf38d7	3215	Loče
00050000-5596-854b-9627-1793b9935ff2	5231	Log pod Mangartom
00050000-5596-854b-1d6f-b9e337c044a5	1358	Log pri Brezovici
00050000-5596-854b-58e4-8e4eaa14c853	1370	Logatec
00050000-5596-854b-e27f-d02c4800f414	1371	Logatec
00050000-5596-854b-1603-7af7f3071b1d	1434	Loka pri Zidanem Mostu
00050000-5596-854b-403a-46286ea8ca9f	3223	Loka pri Žusmu
00050000-5596-854b-b1a5-a6fa02f079de	6219	Lokev
00050000-5596-854b-52ec-bfa418a1c0cb	1318	Loški Potok
00050000-5596-854b-df79-935e7e5b1247	2324	Lovrenc na Dravskem polju
00050000-5596-854b-93c2-a2f4297a4bb6	2344	Lovrenc na Pohorju
00050000-5596-854b-f61b-e1631739bf76	3334	Luče
00050000-5596-854b-328e-95ed50744531	1225	Lukovica
00050000-5596-854b-de49-e68d4e35d31e	9202	Mačkovci
00050000-5596-854b-fa46-7b412b323606	2322	Majšperk
00050000-5596-854b-80e3-e6abd9f04f43	2321	Makole
00050000-5596-854b-1b4f-47a151a02613	9243	Mala Nedelja
00050000-5596-854b-79c2-1383ca13b1de	2229	Malečnik
00050000-5596-854b-7364-3c9a17a4ad8f	6273	Marezige
00050000-5596-854b-17d1-524496ef5973	2000	Maribor 
00050000-5596-854b-310e-4acb67d85f92	2001	Maribor - poštni predali
00050000-5596-854b-478c-c815760f6d54	2206	Marjeta na Dravskem polju
00050000-5596-854b-cf27-b56361253465	2281	Markovci
00050000-5596-854b-5151-fc991bc6a05e	9221	Martjanci
00050000-5596-854b-5512-edd18b68aade	6242	Materija
00050000-5596-854b-0db7-afd2d3a1962f	4211	Mavčiče
00050000-5596-854b-9ff1-e3856dbbb202	1215	Medvode
00050000-5596-854b-ba68-27423e0c6576	1234	Mengeš
00050000-5596-854b-31eb-fa8bfc43c53a	8330	Metlika
00050000-5596-854b-c2cf-c33cc5bc36ef	2392	Mežica
00050000-5596-854b-e627-e063aceb25c9	2204	Miklavž na Dravskem polju
00050000-5596-854b-e78b-3ddd3355d002	2275	Miklavž pri Ormožu
00050000-5596-854b-c16c-8b44735f0091	5291	Miren
00050000-5596-854b-1edc-2dd950fbe10a	8233	Mirna
00050000-5596-854b-1ba2-3a594516f85d	8216	Mirna Peč
00050000-5596-854b-e476-7dcae25d8eeb	2382	Mislinja
00050000-5596-854b-d5b7-ee1ee11e06d7	4281	Mojstrana
00050000-5596-854b-2ceb-590a8ee74c4e	8230	Mokronog
00050000-5596-854b-9de9-1300ef0a32ce	1251	Moravče
00050000-5596-854b-6d58-d23000d51380	9226	Moravske Toplice
00050000-5596-854b-5e83-3a23f352b799	5216	Most na Soči
00050000-5596-854b-ebcc-05f95c51af74	1221	Motnik
00050000-5596-854b-0ac1-b2703f885483	3330	Mozirje
00050000-5596-854b-6605-b3de3de8018b	9000	Murska Sobota 
00050000-5596-854b-8d9e-3c03a8b1b396	9001	Murska Sobota - poštni predali
00050000-5596-854b-a3db-2768723d9535	2366	Muta
00050000-5596-854b-78f5-b896327307b5	4202	Naklo
00050000-5596-854b-3635-eb3ffb8a75c5	3331	Nazarje
00050000-5596-854b-23a0-1f1398a44d42	1357	Notranje Gorice
00050000-5596-854b-b930-e1fb563bbbbb	3203	Nova Cerkev
00050000-5596-854b-7d17-695b23e12988	5000	Nova Gorica 
00050000-5596-854b-2e63-46699b4dc89e	5001	Nova Gorica - poštni predali
00050000-5596-854b-b2f9-9902f7ad66c8	1385	Nova vas
00050000-5596-854b-a6ec-6c172df714b0	8000	Novo mesto
00050000-5596-854b-6260-13e7edf055ef	8001	Novo mesto - poštni predali
00050000-5596-854b-0499-af6c1a5b0f57	6243	Obrov
00050000-5596-854b-e836-987b72ad5c03	9233	Odranci
00050000-5596-854b-1b69-17ecaebc0620	2317	Oplotnica
00050000-5596-854b-7317-a31da6d0575f	2312	Orehova vas
00050000-5596-854b-4aaf-6951174182c6	2270	Ormož
00050000-5596-854b-9f0e-f60c2bc770f1	1316	Ortnek
00050000-5596-854b-2f53-cf37f3c17b55	1337	Osilnica
00050000-5596-854b-3073-228c18282960	8222	Otočec
00050000-5596-854b-ebef-4303cf8b6314	2361	Ožbalt
00050000-5596-854b-6dd1-43a16ce4d803	2231	Pernica
00050000-5596-854b-e312-315d10abf3ef	2211	Pesnica pri Mariboru
00050000-5596-854b-b075-3e164bf847d5	9203	Petrovci
00050000-5596-854b-8a72-00e01f0b082f	3301	Petrovče
00050000-5596-854b-3c0d-af9debbaabc2	6330	Piran/Pirano
00050000-5596-854b-f3e8-0140b326ea12	8255	Pišece
00050000-5596-854b-2abd-2873036e352f	6257	Pivka
00050000-5596-854b-e4a3-07e15ed813a2	6232	Planina
00050000-5596-854b-af70-5e997144af3f	3225	Planina pri Sevnici
00050000-5596-854b-8e56-87a882379ce1	6276	Pobegi
00050000-5596-854b-9013-6887194d5dd4	8312	Podbočje
00050000-5596-854b-23b3-cdc946d163c2	5243	Podbrdo
00050000-5596-854b-6a9c-95d80a1b888e	3254	Podčetrtek
00050000-5596-854b-2014-0d13c737f31d	2273	Podgorci
00050000-5596-854b-5a40-4fec19173d4f	6216	Podgorje
00050000-5596-854b-bed4-20857c07dae4	2381	Podgorje pri Slovenj Gradcu
00050000-5596-854b-df57-a729ef67b6d4	6244	Podgrad
00050000-5596-854b-5ebe-f1e39b6b79ae	1414	Podkum
00050000-5596-854b-cba3-cbb1dc266f8b	2286	Podlehnik
00050000-5596-854b-9951-6173b0f30cf3	5272	Podnanos
00050000-5596-854b-000e-7b06b88a09dd	4244	Podnart
00050000-5596-854b-e418-f64c628a8cf8	3241	Podplat
00050000-5596-854b-396a-be804646d039	3257	Podsreda
00050000-5596-854b-92e9-06841e8dee9c	2363	Podvelka
00050000-5596-854b-7cc3-57cb7e7a0cb2	2208	Pohorje
00050000-5596-854b-7dac-5fe4d73cd5e6	2257	Polenšak
00050000-5596-854b-f64d-9bfaa5018d90	1355	Polhov Gradec
00050000-5596-854b-4311-f6b1a4df8b63	4223	Poljane nad Škofjo Loko
00050000-5596-854b-c19e-42e2b7213907	2319	Poljčane
00050000-5596-854b-ada4-092f90051aa9	1272	Polšnik
00050000-5596-854b-a355-84c1ec64daff	3313	Polzela
00050000-5596-854b-2020-cc29a68b84f5	3232	Ponikva
00050000-5596-854b-68ee-5ff79fca5de9	6320	Portorož/Portorose
00050000-5596-854b-afa1-91b702d25311	6230	Postojna
00050000-5596-854b-00b7-f92b3d8ca708	2331	Pragersko
00050000-5596-854b-569a-55993b5d4d40	3312	Prebold
00050000-5596-854b-aa13-7c605ba34d86	4205	Preddvor
00050000-5596-854b-82ff-69bcce471582	6255	Prem
00050000-5596-854b-18cb-00cb6ac02f19	1352	Preserje
00050000-5596-854b-bc09-c5d64e465365	6258	Prestranek
00050000-5596-854b-0a76-33edf10e3556	2391	Prevalje
00050000-5596-854b-f626-a332704fdbda	3262	Prevorje
00050000-5596-854b-9da6-b1264f908d0e	1276	Primskovo 
00050000-5596-854b-a104-815685dd9751	3253	Pristava pri Mestinju
00050000-5596-854b-31cc-10f66ee49f34	9207	Prosenjakovci/Partosfalva
00050000-5596-854b-f559-cd53ccffaf39	5297	Prvačina
00050000-5596-854b-6147-f5ecfbeb060a	2250	Ptuj
00050000-5596-854b-2e2b-329c4046cf8c	2323	Ptujska Gora
00050000-5596-854b-5446-e0d31c934626	9201	Puconci
00050000-5596-854b-8a59-f68bad947462	2327	Rače
00050000-5596-854b-e98d-3434fc7ba129	1433	Radeče
00050000-5596-854b-04e6-1559767f7337	9252	Radenci
00050000-5596-854b-48db-95ed72206a57	2360	Radlje ob Dravi
00050000-5596-854b-9577-ce04d34b0e53	1235	Radomlje
00050000-5596-854b-33a3-42dbba0fa1ef	4240	Radovljica
00050000-5596-854b-9f73-0476da5a6e78	8274	Raka
00050000-5596-854b-8661-4a8a9b6021c7	1381	Rakek
00050000-5596-854b-b83d-c64eb6e2d5bf	4283	Rateče - Planica
00050000-5596-854b-c381-9fe0ac9a6a5f	2390	Ravne na Koroškem
00050000-5596-854b-346f-43f456ae6e9e	9246	Razkrižje
00050000-5596-854b-e46b-7cfa7e1ec3fa	3332	Rečica ob Savinji
00050000-5596-854b-d1d9-0c9445ba1860	5292	Renče
00050000-5596-854b-086f-745984cfef78	1310	Ribnica
00050000-5596-854b-df5d-d1edb428c8a3	2364	Ribnica na Pohorju
00050000-5596-854b-76fe-8243c4a55cc0	3272	Rimske Toplice
00050000-5596-854b-7885-906aaf2619dd	1314	Rob
00050000-5596-854b-e84b-9b1478b48c9f	5215	Ročinj
00050000-5596-854b-5393-8f4b152de694	3250	Rogaška Slatina
00050000-5596-854b-54a1-2f576a6d4f0e	9262	Rogašovci
00050000-5596-854b-6ec3-514aad4eb9a7	3252	Rogatec
00050000-5596-854b-59f9-5e73810a6ae8	1373	Rovte
00050000-5596-854b-dc77-a71c2bac929a	2342	Ruše
00050000-5596-854b-1b3f-c77773d76e2d	1282	Sava
00050000-5596-854b-28d3-38c16f0257f6	6333	Sečovlje/Sicciole
00050000-5596-854b-dc52-372a875551b0	4227	Selca
00050000-5596-854b-3d2e-14d620a888b6	2352	Selnica ob Dravi
00050000-5596-854b-2ddc-04e3a2e29bab	8333	Semič
00050000-5596-854b-01f0-bb674843db11	8281	Senovo
00050000-5596-854b-f13d-e5d527650caa	6224	Senožeče
00050000-5596-854b-502e-141dc7989007	8290	Sevnica
00050000-5596-854b-f66c-f3db0ded0f2e	6210	Sežana
00050000-5596-854b-6515-be5713cacb0a	2214	Sladki Vrh
00050000-5596-854b-dfe7-6b2de10b32bc	5283	Slap ob Idrijci
00050000-5596-854b-2761-50521db0ab50	2380	Slovenj Gradec
00050000-5596-854b-91ed-271a86323a65	2310	Slovenska Bistrica
00050000-5596-854b-209e-a39bf235e5fe	3210	Slovenske Konjice
00050000-5596-854b-918b-4e4f6d012c89	1216	Smlednik
00050000-5596-854b-1b74-5d1911c3bd68	5232	Soča
00050000-5596-854b-001b-d156c1900fa2	1317	Sodražica
00050000-5596-854b-9ffb-5bfe1315ef99	3335	Solčava
00050000-5596-854b-fc98-cf21c0dd47c1	5250	Solkan
00050000-5596-854b-eab3-3dcdc6cc3f61	4229	Sorica
00050000-5596-854b-637d-1a115f6e7807	4225	Sovodenj
00050000-5596-854b-ff48-52d9b526c236	5281	Spodnja Idrija
00050000-5596-854b-53ca-cd420a7fb74c	2241	Spodnji Duplek
00050000-5596-854b-1a1f-06a87711c20f	9245	Spodnji Ivanjci
00050000-5596-854b-218c-3b5b010f07dd	2277	Središče ob Dravi
00050000-5596-854b-556a-d10e110d3e1e	4267	Srednja vas v Bohinju
00050000-5596-854b-b434-d3df10a66d4a	8256	Sromlje 
00050000-5596-854b-2648-1d1f37efa169	5224	Srpenica
00050000-5596-854b-3045-e513a2fc985e	1242	Stahovica
00050000-5596-854b-bfae-f114e3053ae1	1332	Stara Cerkev
00050000-5596-854b-e071-35489746950a	8342	Stari trg ob Kolpi
00050000-5596-854b-fcd0-1b1477d25a82	1386	Stari trg pri Ložu
00050000-5596-854b-7f7b-9c0d4bb05cac	2205	Starše
00050000-5596-854b-8d36-9aa727ac6ad9	2289	Stoperce
00050000-5596-854b-966c-3bd7255730d0	8322	Stopiče
00050000-5596-854b-1654-300cf691c38f	3206	Stranice
00050000-5596-854b-f281-422ba741c53e	8351	Straža
00050000-5596-854b-cd24-6038ff13eef6	1313	Struge
00050000-5596-854b-58af-2b2a33729b8b	8293	Studenec
00050000-5596-854b-49ce-aa6f1cdfce24	8331	Suhor
00050000-5596-854b-2b4f-934327d56def	2233	Sv. Ana v Slovenskih goricah
00050000-5596-854b-459f-f619ddb7cf28	2235	Sv. Trojica v Slovenskih goricah
00050000-5596-854b-2327-4792fa43e298	2353	Sveti Duh na Ostrem Vrhu
00050000-5596-854b-2f73-24072339c9cb	9244	Sveti Jurij ob Ščavnici
00050000-5596-854b-4f89-eed192b5401b	3264	Sveti Štefan
00050000-5596-854b-e762-c791a6f76b5e	2258	Sveti Tomaž
00050000-5596-854b-ac83-3c14cb0605b2	9204	Šalovci
00050000-5596-854b-7c24-521c32a265a6	5261	Šempas
00050000-5596-854b-5b51-7d1a735757f5	5290	Šempeter pri Gorici
00050000-5596-854b-b648-8048e6ddbc5c	3311	Šempeter v Savinjski dolini
00050000-5596-854b-b537-e557c67566a3	4208	Šenčur
00050000-5596-854b-22d9-ad843cacdb5d	2212	Šentilj v Slovenskih goricah
00050000-5596-854b-bdd1-320de18cdbbd	8297	Šentjanž
00050000-5596-854b-e146-8dd844fbec4b	2373	Šentjanž pri Dravogradu
00050000-5596-854b-d3d3-f59405f47eeb	8310	Šentjernej
00050000-5596-854b-b20f-0ae5a988d26e	3230	Šentjur
00050000-5596-854b-b19b-3f6a30aefe1b	3271	Šentrupert
00050000-5596-854b-b50c-7aab814415bf	8232	Šentrupert
00050000-5596-854b-6e5f-81e3327f1e18	1296	Šentvid pri Stični
00050000-5596-854b-7871-052fbfbefe33	8275	Škocjan
00050000-5596-854b-6c00-776f4f1b2450	6281	Škofije
00050000-5596-854b-373e-2f3d7bed6756	4220	Škofja Loka
00050000-5596-854b-06bb-1d2fa660d574	3211	Škofja vas
00050000-5596-854b-ed40-47faa52f9156	1291	Škofljica
00050000-5596-854b-8b19-eba3aa495e52	6274	Šmarje
00050000-5596-854b-0e9c-1ef2f11686ec	1293	Šmarje - Sap
00050000-5596-854b-2003-dba0b8d9828a	3240	Šmarje pri Jelšah
00050000-5596-854b-1622-53288afbe5e4	8220	Šmarješke Toplice
00050000-5596-854b-29cc-402bb81e5501	2315	Šmartno na Pohorju
00050000-5596-854b-8678-e84c71c09c71	3341	Šmartno ob Dreti
00050000-5596-854b-a116-ee464fdd59b1	3327	Šmartno ob Paki
00050000-5596-854b-a224-68847212430e	1275	Šmartno pri Litiji
00050000-5596-854b-a8a2-8db36eb95cca	2383	Šmartno pri Slovenj Gradcu
00050000-5596-854b-faca-a02dee9c18c4	3201	Šmartno v Rožni dolini
00050000-5596-854b-93c8-bf33f46f2f11	3325	Šoštanj
00050000-5596-854b-beb1-6f02f670a586	6222	Štanjel
00050000-5596-854b-f2ad-4e38b7eb18fe	3220	Štore
00050000-5596-854b-8e27-c401d91fcadc	3304	Tabor
00050000-5596-854b-c18b-bda8b2f77e66	3221	Teharje
00050000-5596-854b-3223-a9be9680d3ae	9251	Tišina
00050000-5596-854b-a107-d3ef31b49c8b	5220	Tolmin
00050000-5596-854b-54f2-59644c0806b3	3326	Topolšica
00050000-5596-854b-df51-6074524705dd	2371	Trbonje
00050000-5596-854b-62e2-2886c78451f9	1420	Trbovlje
00050000-5596-854b-43e2-7f338ff6b2f6	8231	Trebelno 
00050000-5596-854b-e9cc-012964c1dfbb	8210	Trebnje
00050000-5596-854b-5cae-5f8915f355ca	5252	Trnovo pri Gorici
00050000-5596-854b-0008-0ad6fe490f27	2254	Trnovska vas
00050000-5596-854b-20a2-54f7b51e7ce2	1222	Trojane
00050000-5596-854b-c49d-685ef68b6f67	1236	Trzin
00050000-5596-854b-1939-5bfbf04e0fe3	4290	Tržič
00050000-5596-854b-36b2-863f8bd4b42c	8295	Tržišče
00050000-5596-854b-64dd-f6d55a82c0e8	1311	Turjak
00050000-5596-854b-6493-1ecc8d489326	9224	Turnišče
00050000-5596-854b-35e0-a675bf286b72	8323	Uršna sela
00050000-5596-854b-8ef3-64450101d50a	1252	Vače
00050000-5596-854b-a3e1-48ddfebe9209	3320	Velenje 
00050000-5596-854b-0aa6-d8920cf9498e	3322	Velenje - poštni predali
00050000-5596-854b-1112-6cfe0548a567	8212	Velika Loka
00050000-5596-854b-320f-6f600bc59067	2274	Velika Nedelja
00050000-5596-854b-fce2-2f3f43485b02	9225	Velika Polana
00050000-5596-854b-3ec8-0fc3f1041a1e	1315	Velike Lašče
00050000-5596-854b-4a68-ce51879d76c7	8213	Veliki Gaber
00050000-5596-854b-b21f-229883f6eec0	9241	Veržej
00050000-5596-854b-df2e-2e950c0b70ab	1312	Videm - Dobrepolje
00050000-5596-854b-a59d-82c34b2ba97f	2284	Videm pri Ptuju
00050000-5596-854b-80e0-0596bc62e63f	8344	Vinica
00050000-5596-854b-0334-3ee77d1bc71d	5271	Vipava
00050000-5596-854b-555e-7c4e6482838d	4212	Visoko
00050000-5596-854b-cc78-d377572f18a2	1294	Višnja Gora
00050000-5596-854b-cf62-23cd14116c1d	3205	Vitanje
00050000-5596-854b-034f-7359622523e5	2255	Vitomarci
00050000-5596-854b-3a96-d39fc7ab5fa5	1217	Vodice
00050000-5596-854b-08fa-477e29a34652	3212	Vojnik\t
00050000-5596-854b-dafe-fd161d5eae25	5293	Volčja Draga
00050000-5596-854b-409f-2ac27f5fffcf	2232	Voličina
00050000-5596-854b-6a10-607aafbf4f23	3305	Vransko
00050000-5596-854b-6f4d-18e3684d908f	6217	Vremski Britof
00050000-5596-854b-7366-0793ccdff504	1360	Vrhnika
00050000-5596-854b-4a84-b4ecf31c9592	2365	Vuhred
00050000-5596-854b-104b-26ab86172b9d	2367	Vuzenica
00050000-5596-854b-917a-b271badf5151	8292	Zabukovje 
00050000-5596-854b-c02a-b4581e5255d9	1410	Zagorje ob Savi
00050000-5596-854b-1d22-4ab99635fe94	1303	Zagradec
00050000-5596-854b-ec60-1e9cdf6f7347	2283	Zavrč
00050000-5596-854b-0309-af6c40bff9bf	8272	Zdole 
00050000-5596-854b-c610-cbc8ad826b0b	4201	Zgornja Besnica
00050000-5596-854b-06da-58284ebdb8e8	2242	Zgornja Korena
00050000-5596-854b-b82e-19afcb676c9f	2201	Zgornja Kungota
00050000-5596-854b-782f-fc9afdd6cc40	2316	Zgornja Ložnica
00050000-5596-854b-c3b8-c9f0b2ee8742	2314	Zgornja Polskava
00050000-5596-854b-9209-3a6a9bcce459	2213	Zgornja Velka
00050000-5596-854b-ab40-ec9e75773fe7	4247	Zgornje Gorje
00050000-5596-854b-267e-2e9ccf2e54bb	4206	Zgornje Jezersko
00050000-5596-854b-55a7-b8ecedadce21	2285	Zgornji Leskovec
00050000-5596-854b-da1e-e7fb3158c916	1432	Zidani Most
00050000-5596-854b-d5d6-c13f6aece915	3214	Zreče
00050000-5596-854b-4802-b4f5b7c4cede	4209	Žabnica
00050000-5596-854b-784a-5196971e4d08	3310	Žalec
00050000-5596-854b-d320-877d52ae0d00	4228	Železniki
00050000-5596-854b-868e-2ac2c1bbc9a4	2287	Žetale
00050000-5596-854b-881f-183adde4ba53	4226	Žiri
00050000-5596-854b-ed36-4397c2710622	4274	Žirovnica
00050000-5596-854b-c10b-0146bb6113bf	8360	Žužemberk
\.


--
-- TOC entry 2879 (class 0 OID 9001103)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 9000914)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9000992)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 9001115)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 9001420)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 9001431)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5596-854c-3c93-9beeccc80e75	00080000-5596-854c-3303-42511fcfda19	0900	AK
00190000-5596-854c-43e9-1ae843ea4696	00080000-5596-854c-794a-cd7373aef2d6	0987	A
00190000-5596-854c-fe0f-613702e6503f	00080000-5596-854c-b17a-6db7c70afadb	0989	A
00190000-5596-854c-b710-d735c61df096	00080000-5596-854c-c08a-8ad708473223	0986	A
00190000-5596-854c-4ea5-b3c2a4f9a684	00080000-5596-854c-3de3-d152b4b4b67f	0984	A
00190000-5596-854c-fc1c-f1fdeaf2dcd4	00080000-5596-854c-feb0-7bd455e90c99	0983	A
00190000-5596-854c-96d2-ffb45bc6db3d	00080000-5596-854c-5948-14c276ec4d68	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 9001401)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 9001144)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5596-854c-bfb9-101406180512	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5596-854c-8b18-4a809aaa48bb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5596-854c-56a7-16f80ec4950c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5596-854c-c8ac-90fb6fdd2774	0004	Mali oder	t	24	Mali oder 
00220000-5596-854c-1e28-f53048c4e107	0005	Komorni oder	t	15	Komorni oder
00220000-5596-854c-74b3-66c0424186f9	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5596-854c-dfc9-6c8423713767	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2877 (class 0 OID 9001088)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9001078)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9001262)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 9001212)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 9000786)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2886 (class 0 OID 9001154)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 9000824)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5596-854b-0e11-84fb997c3655	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5596-854b-ae0b-c742ea8b9f6c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5596-854b-08a7-c10e8667e166	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5596-854b-e80e-e0ec6ec60d91	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5596-854b-0443-e05a9af8a0ab	planer	Planer dogodkov v koledarju	t
00020000-5596-854b-7859-9c02342ccc00	kadrovska	Kadrovska služba	t
00020000-5596-854b-e178-1fc4d064059a	arhivar	Ažuriranje arhivalij	t
00020000-5596-854b-a8b2-356f815db52f	igralec	Igralec	t
00020000-5596-854b-3fba-6687a9636a82	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5596-854c-bb65-6c10dee9bb7a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2852 (class 0 OID 9000808)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5596-854b-dae9-cf797994adb2	00020000-5596-854b-08a7-c10e8667e166
00010000-5596-854b-3225-67d631c0219b	00020000-5596-854b-08a7-c10e8667e166
00010000-5596-854c-7790-b711e1004c54	00020000-5596-854c-bb65-6c10dee9bb7a
\.


--
-- TOC entry 2888 (class 0 OID 9001168)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9001109)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9001059)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 9001470)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5596-854b-fb95-686304143e5d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5596-854b-8762-3e2033d36f04	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5596-854b-4b35-8407c3b4db03	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5596-854b-f269-25f7d415923b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5596-854b-e301-3d6936948469	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2909 (class 0 OID 9001462)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5596-854b-c28c-bc5724dd7d5d	00230000-5596-854b-f269-25f7d415923b	popa
00240000-5596-854b-4347-10bbf4aad68c	00230000-5596-854b-f269-25f7d415923b	oseba
00240000-5596-854b-e92b-7d1fe826544c	00230000-5596-854b-8762-3e2033d36f04	prostor
00240000-5596-854b-51f3-a9b343d6a36a	00230000-5596-854b-f269-25f7d415923b	besedilo
00240000-5596-854b-4bc6-0a242b9aa766	00230000-5596-854b-f269-25f7d415923b	uprizoritev
00240000-5596-854b-4ba6-1b4d0aa23dc9	00230000-5596-854b-f269-25f7d415923b	funkcija
00240000-5596-854b-d00a-2c8d9c526bba	00230000-5596-854b-f269-25f7d415923b	tipfunkcije
00240000-5596-854b-cda3-e223c4c35d2e	00230000-5596-854b-f269-25f7d415923b	alternacija
00240000-5596-854b-fd35-22cb46834bc6	00230000-5596-854b-fb95-686304143e5d	pogodba
00240000-5596-854b-f31b-f9f13d2b19f4	00230000-5596-854b-f269-25f7d415923b	zaposlitev
\.


--
-- TOC entry 2908 (class 0 OID 9001457)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9001222)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5596-854c-b893-246476a35d53	000e0000-5596-854c-a3fb-8ec49c74a01a	00080000-5596-854c-54ed-9960e742b51d	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5596-854c-5d0c-18b90184da60	000e0000-5596-854c-a3fb-8ec49c74a01a	00080000-5596-854c-54ed-9960e742b51d	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5596-854c-45cb-6ac37150ed8b	000e0000-5596-854c-a3fb-8ec49c74a01a	00080000-5596-854c-8c89-9cc1e07708e8	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2859 (class 0 OID 9000886)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 9001065)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5596-854c-c041-a3efe8e1bf51	00180000-5596-854c-bb72-23f33bb047a4	000c0000-5596-854c-6be1-b93e01fea572	00090000-5596-854c-b92e-afd234e66436	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-854c-1081-3c285a5f85cc	00180000-5596-854c-bb72-23f33bb047a4	000c0000-5596-854c-98c3-1ed51ec00848	00090000-5596-854c-0a11-30ce28f8ed46	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-854c-263e-0d43aec5f4a7	00180000-5596-854c-bb72-23f33bb047a4	000c0000-5596-854c-e205-e476c72e89bd	00090000-5596-854c-c245-80298cebf707	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-854c-a975-400777a8d31d	00180000-5596-854c-bb72-23f33bb047a4	000c0000-5596-854c-115b-d05b62298795	00090000-5596-854c-d387-3bbeab78d4aa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-854c-bad8-3328385dd531	00180000-5596-854c-bb72-23f33bb047a4	000c0000-5596-854c-d1a2-435c7decfb9f	00090000-5596-854c-2afd-0135ba1c67d5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-854c-c2ec-f96ed48a76b9	00180000-5596-854c-43b8-c776a43e3ebd	\N	00090000-5596-854c-2afd-0135ba1c67d5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2895 (class 0 OID 9001251)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5596-854b-10ce-74954bd264e3	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5596-854b-1647-ab3dae23dc22	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5596-854b-c2fc-42860eb5d466	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5596-854b-8b5b-bee921b0f5ec	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5596-854b-52e1-546a3eff24bf	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5596-854b-6520-f89f9e6011b7	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5596-854b-5ef6-20863cda34bf	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5596-854b-e963-6dd3e4fffd06	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5596-854b-f92f-600d5b838120	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5596-854b-3dfd-7738744d2931	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5596-854b-98ac-8cde266787d3	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5596-854b-bcbc-87b82a127d08	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5596-854b-5a9c-2a70a5747aa1	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5596-854b-ad6a-d2bf63a90855	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5596-854b-e2e8-94255f79fdfb	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5596-854b-c123-96e98c262e20	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2906 (class 0 OID 9001439)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5596-854b-bdd0-f663f0f33330	01	Velika predstava	f	1.00	1.00
002b0000-5596-854b-9739-eb3678260abc	02	Mala predstava	f	0.50	0.50
002b0000-5596-854b-75d4-389c49bb2a0d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5596-854b-e93f-cd97e4c64add	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5596-854b-ca1d-be56764094bc	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2864 (class 0 OID 9000949)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 9000795)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5596-854b-3225-67d631c0219b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROI664kOuYjTiq5MrNESbiqQFaznTN6nu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5596-854c-1da2-81cb4074eb21	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5596-854c-6eca-95486e948211	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5596-854c-a479-bf1f8569fbac	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5596-854c-4258-d3c6220d926f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5596-854c-3eab-9e18163816d5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5596-854c-e019-92c1a0e348b6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5596-854c-1e94-ea14818d9f57	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5596-854c-498a-31dc8c2d68c9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5596-854c-8591-7ecee914e869	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5596-854c-7790-b711e1004c54	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5596-854b-dae9-cf797994adb2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 9001300)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5596-854c-d91c-c5cda8ec95c7	00160000-5596-854c-2614-e030adbe344d	00150000-5596-854b-8913-893fec02a0af	00140000-5596-854a-42b8-7aa30d43f901	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5596-854c-1e28-f53048c4e107
000e0000-5596-854c-a3fb-8ec49c74a01a	00160000-5596-854c-5f0e-6cbb5ef73700	00150000-5596-854b-6370-503dabe30805	00140000-5596-854a-353c-24d6f8d03457	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5596-854c-74b3-66c0424186f9
000e0000-5596-854c-825b-253647ad5409	\N	00150000-5596-854b-6370-503dabe30805	00140000-5596-854a-353c-24d6f8d03457	00190000-5596-854c-43e9-1ae843ea4696	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5596-854c-1e28-f53048c4e107
000e0000-5596-854c-dca1-6b35e8c6ad12	\N	00150000-5596-854b-6370-503dabe30805	00140000-5596-854a-353c-24d6f8d03457	00190000-5596-854c-43e9-1ae843ea4696	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5596-854c-1e28-f53048c4e107
000e0000-5596-854c-274d-706b7f0cd2a9	\N	00150000-5596-854b-6370-503dabe30805	00140000-5596-854a-353c-24d6f8d03457	00190000-5596-854c-43e9-1ae843ea4696	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5596-854c-bfb9-101406180512
\.


--
-- TOC entry 2869 (class 0 OID 9001011)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5596-854c-8c9f-b0f363e6fc56	000e0000-5596-854c-a3fb-8ec49c74a01a	1	
00200000-5596-854c-5cd5-12acb3103d36	000e0000-5596-854c-a3fb-8ec49c74a01a	2	
\.


--
-- TOC entry 2884 (class 0 OID 9001136)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 9001205)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 9001043)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9001290)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5596-854a-42b8-7aa30d43f901	01	Drama	drama (SURS 01)
00140000-5596-854a-529f-2177eb59d4e3	02	Opera	opera (SURS 02)
00140000-5596-854a-3e09-b77f168a4dad	03	Balet	balet (SURS 03)
00140000-5596-854a-ed9e-85b545445426	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5596-854a-752e-0e405a80ffc7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5596-854a-353c-24d6f8d03457	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5596-854a-cb44-0c9f566e16cb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2890 (class 0 OID 9001195)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5596-854b-118b-c3b9db547860	01	Opera	opera
00150000-5596-854b-8a8e-9874d6fddf9c	02	Opereta	opereta
00150000-5596-854b-baa7-3dbae70831e2	03	Balet	balet
00150000-5596-854b-5226-2d4e81574fda	04	Plesne prireditve	plesne prireditve
00150000-5596-854b-0068-37ef68d91de5	05	Lutkovno gledališče	lutkovno gledališče
00150000-5596-854b-ac15-134abaca0920	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5596-854b-d416-6d6f2dbc037b	07	Biografska drama	biografska drama
00150000-5596-854b-8913-893fec02a0af	08	Komedija	komedija
00150000-5596-854b-6814-8d5e82ac244e	09	Črna komedija	črna komedija
00150000-5596-854b-7ce2-3ed394b4b98d	10	E-igra	E-igra
00150000-5596-854b-6370-503dabe30805	11	Kriminalka	kriminalka
00150000-5596-854b-1609-d386a8b22474	12	Musical	musical
\.


--
-- TOC entry 2443 (class 2606 OID 9000849)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 9001347)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9001337)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9001250)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9001033)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 9001058)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9001455)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9000975)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 9001396)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9001191)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9001009)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9001052)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 9000989)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9001101)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9001128)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 9000947)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 9000858)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2450 (class 2606 OID 9000882)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 9000838)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2434 (class 2606 OID 9000823)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 9001134)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9001167)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 9001285)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 9000911)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 9000935)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 9001107)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 9000925)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 9000996)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 9001119)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 9001428)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9001436)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 9001418)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9001151)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 9001092)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 9001083)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9001272)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 9001219)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 9000794)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 9001158)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 9000812)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2436 (class 2606 OID 9000832)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 9001176)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9001114)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9001064)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 9001479)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 9001467)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 9001461)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 9001232)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 9000891)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 9001074)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9001261)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 9001449)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 9000960)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9000807)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 9001316)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 9001018)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 9001142)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 9001210)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 9001047)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 9001298)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 9001203)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 1259 OID 9001040)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2583 (class 1259 OID 9001233)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 9001234)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2457 (class 1259 OID 9000913)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2405 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2406 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2548 (class 1259 OID 9001135)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 9001121)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2543 (class 1259 OID 9001120)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 9001019)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2570 (class 1259 OID 9001192)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2571 (class 1259 OID 9001194)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2572 (class 1259 OID 9001193)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2482 (class 1259 OID 9000991)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2483 (class 1259 OID 9000990)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 9001287)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 9001288)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9001289)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2418 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2419 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2602 (class 1259 OID 9001321)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 9001318)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 9001322)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 9001320)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 9001319)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2472 (class 1259 OID 9000962)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 9000961)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2409 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2410 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2448 (class 1259 OID 9000885)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2558 (class 1259 OID 9001159)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2512 (class 1259 OID 9001053)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2438 (class 1259 OID 9000839)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2439 (class 1259 OID 9000840)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2563 (class 1259 OID 9001179)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2564 (class 1259 OID 9001178)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2565 (class 1259 OID 9001177)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2486 (class 1259 OID 9000997)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 9000999)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2488 (class 1259 OID 9000998)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2645 (class 1259 OID 9001469)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2522 (class 1259 OID 9001087)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2523 (class 1259 OID 9001085)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2524 (class 1259 OID 9001084)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2525 (class 1259 OID 9001086)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2429 (class 1259 OID 9000813)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2430 (class 1259 OID 9000814)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2551 (class 1259 OID 9001143)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2537 (class 1259 OID 9001108)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2579 (class 1259 OID 9001220)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2580 (class 1259 OID 9001221)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 9001400)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 9001397)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9001398)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 9001399)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2461 (class 1259 OID 9000927)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2462 (class 1259 OID 9000926)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2463 (class 1259 OID 9000928)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2422 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 9001429)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2631 (class 1259 OID 9001430)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 9001351)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 9001352)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 9001349)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 9001350)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2576 (class 1259 OID 9001211)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2528 (class 1259 OID 9001096)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2529 (class 1259 OID 9001095)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2530 (class 1259 OID 9001093)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2531 (class 1259 OID 9001094)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2400 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 9001339)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 9001338)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 9001419)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2493 (class 1259 OID 9001010)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2642 (class 1259 OID 9001456)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2444 (class 1259 OID 9000860)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2445 (class 1259 OID 9000859)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2453 (class 1259 OID 9000892)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 9000893)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2517 (class 1259 OID 9001077)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 9001076)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2519 (class 1259 OID 9001075)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2414 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2500 (class 1259 OID 9001042)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2501 (class 1259 OID 9001038)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2502 (class 1259 OID 9001035)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2503 (class 1259 OID 9001036)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2504 (class 1259 OID 9001034)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2505 (class 1259 OID 9001039)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2506 (class 1259 OID 9001037)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2460 (class 1259 OID 9000912)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 9000976)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 9000978)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2480 (class 1259 OID 9000977)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2481 (class 1259 OID 9000979)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2536 (class 1259 OID 9001102)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 9001286)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 9001317)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 9000883)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2452 (class 1259 OID 9000884)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 9001204)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 9001480)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 9000948)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2648 (class 1259 OID 9001468)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2556 (class 1259 OID 9001153)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2557 (class 1259 OID 9001152)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 9001348)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2403 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2468 (class 1259 OID 9000936)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 9001299)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 9001437)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 9001438)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2437 (class 1259 OID 9000833)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2507 (class 1259 OID 9001041)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2679 (class 2606 OID 9001616)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2676 (class 2606 OID 9001601)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 9001606)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2681 (class 2606 OID 9001626)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9001596)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2680 (class 2606 OID 9001621)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2678 (class 2606 OID 9001611)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2710 (class 2606 OID 9001771)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 9001776)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 9001531)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2698 (class 2606 OID 9001711)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2697 (class 2606 OID 9001706)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2696 (class 2606 OID 9001701)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2674 (class 2606 OID 9001591)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 9001741)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9001751)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2705 (class 2606 OID 9001746)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2669 (class 2606 OID 9001566)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 9001561)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2694 (class 2606 OID 9001691)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 9001781)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 9001786)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9001791)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2718 (class 2606 OID 9001811)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2715 (class 2606 OID 9001796)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 9001816)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 9001806)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2716 (class 2606 OID 9001801)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2667 (class 2606 OID 9001556)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 9001551)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 9001516)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2658 (class 2606 OID 9001511)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 9001721)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2682 (class 2606 OID 9001631)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 9001491)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2655 (class 2606 OID 9001496)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2703 (class 2606 OID 9001736)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2702 (class 2606 OID 9001731)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 9001726)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 9001571)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 9001581)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2671 (class 2606 OID 9001576)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2735 (class 2606 OID 9001897)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2689 (class 2606 OID 9001666)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2687 (class 2606 OID 9001656)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 9001651)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2688 (class 2606 OID 9001661)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2652 (class 2606 OID 9001481)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2653 (class 2606 OID 9001486)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2699 (class 2606 OID 9001716)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2695 (class 2606 OID 9001696)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2708 (class 2606 OID 9001761)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2709 (class 2606 OID 9001766)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 9001867)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 9001852)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 9001857)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 9001862)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2664 (class 2606 OID 9001541)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 9001536)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 9001546)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2731 (class 2606 OID 9001877)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2732 (class 2606 OID 9001882)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 9001841)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 9001847)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2722 (class 2606 OID 9001831)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 9001836)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2707 (class 2606 OID 9001756)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 9001686)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2692 (class 2606 OID 9001681)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 9001671)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2691 (class 2606 OID 9001676)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 9001826)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2720 (class 2606 OID 9001821)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2730 (class 2606 OID 9001872)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 9001586)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2733 (class 2606 OID 9001887)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 9001892)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2657 (class 2606 OID 9001506)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2656 (class 2606 OID 9001501)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2660 (class 2606 OID 9001521)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 9001526)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 9001646)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2684 (class 2606 OID 9001641)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 9001636)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-03 14:51:25 CEST

--
-- PostgreSQL database dump complete
--

