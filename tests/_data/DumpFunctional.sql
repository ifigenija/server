--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-07 10:49:23 CEST

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
-- TOC entry 183 (class 1259 OID 9249085)
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
-- TOC entry 228 (class 1259 OID 9249584)
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
-- TOC entry 227 (class 1259 OID 9249567)
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
-- TOC entry 221 (class 1259 OID 9249479)
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
-- TOC entry 197 (class 1259 OID 9249264)
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
-- TOC entry 200 (class 1259 OID 9249298)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 9249696)
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
-- TOC entry 192 (class 1259 OID 9249207)
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
-- TOC entry 229 (class 1259 OID 9249597)
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
-- TOC entry 216 (class 1259 OID 9249424)
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
-- TOC entry 195 (class 1259 OID 9249244)
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
-- TOC entry 199 (class 1259 OID 9249292)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 9249224)
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
-- TOC entry 205 (class 1259 OID 9249341)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 9249366)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 9249181)
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
-- TOC entry 184 (class 1259 OID 9249094)
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
-- TOC entry 185 (class 1259 OID 9249105)
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
-- TOC entry 180 (class 1259 OID 9249059)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 9249078)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 9249373)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 9249404)
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
-- TOC entry 224 (class 1259 OID 9249517)
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
-- TOC entry 187 (class 1259 OID 9249138)
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
-- TOC entry 189 (class 1259 OID 9249173)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 9249347)
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
-- TOC entry 188 (class 1259 OID 9249158)
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
-- TOC entry 194 (class 1259 OID 9249236)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 9249359)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 9249666)
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
-- TOC entry 232 (class 1259 OID 9249677)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 9249647)
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
-- TOC entry 212 (class 1259 OID 9249388)
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
-- TOC entry 204 (class 1259 OID 9249332)
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
-- TOC entry 203 (class 1259 OID 9249322)
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
-- TOC entry 223 (class 1259 OID 9249506)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 9249456)
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
-- TOC entry 177 (class 1259 OID 9249030)
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
-- TOC entry 176 (class 1259 OID 9249028)
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
-- TOC entry 213 (class 1259 OID 9249398)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 9249068)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 9249052)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 9249412)
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
-- TOC entry 207 (class 1259 OID 9249353)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 9249303)
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
-- TOC entry 237 (class 1259 OID 9249716)
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
-- TOC entry 236 (class 1259 OID 9249708)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 9249703)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 9249466)
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
-- TOC entry 186 (class 1259 OID 9249130)
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
-- TOC entry 202 (class 1259 OID 9249309)
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
-- TOC entry 222 (class 1259 OID 9249495)
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
-- TOC entry 233 (class 1259 OID 9249685)
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
-- TOC entry 191 (class 1259 OID 9249193)
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
-- TOC entry 178 (class 1259 OID 9249039)
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
-- TOC entry 226 (class 1259 OID 9249544)
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
-- TOC entry 196 (class 1259 OID 9249255)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 9249380)
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
-- TOC entry 218 (class 1259 OID 9249449)
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
-- TOC entry 198 (class 1259 OID 9249287)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 9249534)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 9249439)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 9249033)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2858 (class 0 OID 9249085)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 9249584)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-559b-9293-8a06-1749ea68cea4	000d0000-559b-9293-f406-04b51d977ffe	\N	00090000-559b-9293-f103-289a3922cfda	000b0000-559b-9293-d487-1fe33960bca0	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-559b-9293-93df-b84dc30302fe	000d0000-559b-9293-6302-af7e90b9ed20	\N	00090000-559b-9293-354f-6f41ee2c6e4f	\N	0002	t	\N	\N	\N	8	\N	\N	f	f
000c0000-559b-9293-93d0-117453bfc8fe	000d0000-559b-9293-605a-0da51363ccb8	\N	00090000-559b-9293-1ec8-b636a7a8bacf	\N	0003	t	\N	\N	\N	2	\N	\N	f	f
000c0000-559b-9293-f629-f0864d02fafb	000d0000-559b-9293-3b37-bc1a5073958c	\N	00090000-559b-9293-5dbf-579c22d80c09	\N	0004	t	\N	\N	\N	26	\N	\N	f	f
000c0000-559b-9293-200f-c8918b35552b	000d0000-559b-9293-2b8b-077ec09b0afb	\N	00090000-559b-9293-264b-999b3b0b1187	\N	0005	t	\N	\N	\N	7	\N	\N	f	f
000c0000-559b-9293-92e2-3c6bb0b2750f	000d0000-559b-9293-6156-46f170683294	\N	00090000-559b-9293-42a6-605da8b2a116	000b0000-559b-9293-dd09-fda004cd5fd3	0006	f	\N	\N	\N	1	\N	\N	t	t
000c0000-559b-9293-1b81-76ee6c9fc97d	000d0000-559b-9293-857b-ef590668a25c	\N	00090000-559b-9293-3071-c11df20d901d	\N	0007	t	\N	\N	\N	14	\N	\N	f	t
000c0000-559b-9293-c52a-35d32b6db911	000d0000-559b-9293-766b-2b2502add125	\N	00090000-559b-9293-8774-ca065f38233f	000b0000-559b-9293-83ac-fe0746524bde	0008	f	\N	\N	\N	12	\N	\N	t	t
\.


--
-- TOC entry 2902 (class 0 OID 9249567)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 9249479)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-559b-9292-d97a-b2824dce11fb	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-559b-9292-e438-f18c89390844	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-559b-9292-461d-f8e61a2c4ace	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 9249264)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-559b-9293-abe8-a196164aba83	\N	\N	00200000-559b-9293-ad8f-714b4a09a988	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-559b-9293-02e1-c44a49504d0c	\N	\N	00200000-559b-9293-68a4-fe5195414604	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-559b-9293-f9eb-d888f283d9c3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-559b-9293-fcba-72e1794d0829	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-559b-9293-9bbd-726f312de859	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2875 (class 0 OID 9249298)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 9249696)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 9249207)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-559b-9291-bec0-0dc0f47b433e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-559b-9291-fd04-fca0303e3fc4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-559b-9291-44b6-2c236db67f60	AL	ALB	008	Albania 	Albanija	\N
00040000-559b-9291-e68f-0351afa2f0ae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-559b-9291-9630-19414d9c0366	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-559b-9291-0971-197e99fffff5	AD	AND	020	Andorra 	Andora	\N
00040000-559b-9291-8e36-c138ee1678c3	AO	AGO	024	Angola 	Angola	\N
00040000-559b-9291-6c35-ac93204c5049	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-559b-9291-6c8e-ff5e59dc505b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-559b-9291-1253-84465d2d82e9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-559b-9291-d04f-2c88651045f4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-559b-9291-9570-8af44edaf575	AM	ARM	051	Armenia 	Armenija	\N
00040000-559b-9291-7fde-df1da89bc878	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-559b-9291-2ca8-36042fd056d8	AU	AUS	036	Australia 	Avstralija	\N
00040000-559b-9291-fd83-004b33ddcb9a	AT	AUT	040	Austria 	Avstrija	\N
00040000-559b-9291-c7c6-cbc4b2cfaaa0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-559b-9291-68e6-75adfadead78	BS	BHS	044	Bahamas 	Bahami	\N
00040000-559b-9291-4f10-2ed9b07c85c9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-559b-9291-97e2-d534111004ba	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-559b-9291-79af-7e42b4281838	BB	BRB	052	Barbados 	Barbados	\N
00040000-559b-9291-a41f-b740ae2dbbb8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-559b-9291-aa3b-f1308aad4164	BE	BEL	056	Belgium 	Belgija	\N
00040000-559b-9291-07e4-3b9ed0a99620	BZ	BLZ	084	Belize 	Belize	\N
00040000-559b-9291-d63d-995a662c2c9f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-559b-9291-2373-2e8c7c64aeb6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-559b-9291-2126-1cfa08d74577	BT	BTN	064	Bhutan 	Butan	\N
00040000-559b-9291-1a0b-5278efcd28b3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-559b-9291-5bad-dea1cc4fd1f7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-559b-9291-7635-beebf8eaa589	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-559b-9291-186a-e8eff6c4add2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-559b-9291-6afa-22d10b78afaf	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-559b-9291-9440-3714e43f03c8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-559b-9291-f727-51a0193c9a03	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-559b-9291-78ef-d01af7d9d82d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-559b-9291-a8c7-19b94fb5db9f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-559b-9291-4053-10a16a9ce36a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-559b-9291-d1b1-de6632f8c7ac	BI	BDI	108	Burundi 	Burundi 	\N
00040000-559b-9291-f817-c3f7a68d7b31	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-559b-9291-980c-c9b7cb6bf942	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-559b-9291-8874-5529fb4c20e5	CA	CAN	124	Canada 	Kanada	\N
00040000-559b-9291-caab-520327f46de5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-559b-9291-ff8b-c08ad5aa66c5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-559b-9291-9907-4225a9bfdb9d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-559b-9291-7370-7b3df90f88cd	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-559b-9291-e8bb-74d99236ddda	CL	CHL	152	Chile 	Čile	\N
00040000-559b-9291-7065-000c3c6b544f	CN	CHN	156	China 	Kitajska	\N
00040000-559b-9291-ea39-14590c02a542	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-559b-9291-8fde-540be4f1f3e9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-559b-9291-cf85-abd71d2c3c5a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-559b-9291-61a3-263c546cd2e1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-559b-9291-0ea4-f048d67891fb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-559b-9291-cfe3-4b8cf31f4332	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-559b-9291-1921-13b9e245e1a4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-559b-9291-328a-c7a25c1fccc1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-559b-9291-0e37-8ce4165db5dc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-559b-9291-f070-a087504b0b00	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-559b-9291-000f-216f252915a9	CU	CUB	192	Cuba 	Kuba	\N
00040000-559b-9291-54c7-ac9da44c82d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-559b-9291-9ef2-b4575b8453f5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-559b-9291-1f08-f582c8d56c54	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-559b-9291-4a55-3b93a612a4d6	DK	DNK	208	Denmark 	Danska	\N
00040000-559b-9291-f2ba-e082b511e77e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-559b-9291-78a9-5528a4db2f52	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-559b-9291-3c54-7a4df8412717	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-559b-9291-70a1-6330d894d38f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-559b-9291-3c3a-512bee664358	EG	EGY	818	Egypt 	Egipt	\N
00040000-559b-9291-cc02-5a7cd29f66c5	SV	SLV	222	El Salvador 	Salvador	\N
00040000-559b-9291-16ed-511fe9e9dc86	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-559b-9291-351c-6cd5537d5234	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-559b-9291-25fc-fa85b02cb9b1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-559b-9291-dac4-8da8fe23a148	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-559b-9291-b4ec-a4f8dce024d2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-559b-9291-651b-43e669cab6b3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-559b-9291-a64e-3f00338aade5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-559b-9291-8b26-66c4239d0b6f	FI	FIN	246	Finland 	Finska	\N
00040000-559b-9291-6e54-165bcbe5e403	FR	FRA	250	France 	Francija	\N
00040000-559b-9291-c978-f3ed08decb55	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-559b-9291-aff4-c4e068a357ad	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-559b-9291-5f7e-813ba24115e8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-559b-9291-aa9a-88aef3674a88	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-559b-9291-2fe0-45628a15ebc6	GA	GAB	266	Gabon 	Gabon	\N
00040000-559b-9291-c26c-b3c82a8c634e	GM	GMB	270	Gambia 	Gambija	\N
00040000-559b-9291-51b3-b9e3fc4824e9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-559b-9291-c4c2-715c888e077a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-559b-9291-9151-b9a6bfc1c470	GH	GHA	288	Ghana 	Gana	\N
00040000-559b-9291-32bb-79a1e679133b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-559b-9291-10ef-2f7921279aa5	GR	GRC	300	Greece 	Grčija	\N
00040000-559b-9291-d3bb-f327fbf2712d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-559b-9291-18d0-ee9ddd735dfd	GD	GRD	308	Grenada 	Grenada	\N
00040000-559b-9291-2b46-076ce4481dc2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-559b-9291-a61e-712ca3470a68	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-559b-9291-e4da-def5e8c9de2d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-559b-9291-f1be-f68e8854891d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-559b-9291-6c9d-6109919e7069	GN	GIN	324	Guinea 	Gvineja	\N
00040000-559b-9291-728c-e347e9c56ae8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-559b-9291-c0f6-4248944d8530	GY	GUY	328	Guyana 	Gvajana	\N
00040000-559b-9291-e2d6-e520dbbf4de2	HT	HTI	332	Haiti 	Haiti	\N
00040000-559b-9291-6d20-1236b8bad7e1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-559b-9291-2b6d-052558cbfa2b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-559b-9291-1c15-eeb89f8fc5a6	HN	HND	340	Honduras 	Honduras	\N
00040000-559b-9291-211f-bd76682c7bd0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-559b-9291-3d9c-bec107c5cd79	HU	HUN	348	Hungary 	Madžarska	\N
00040000-559b-9291-cb1a-18ed02fd241c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-559b-9291-59a1-5beb9bc25964	IN	IND	356	India 	Indija	\N
00040000-559b-9291-19ba-de6f7906404b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-559b-9291-8dd9-fc78b2b2e805	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-559b-9291-0c72-b1414ded0e50	IQ	IRQ	368	Iraq 	Irak	\N
00040000-559b-9291-14d8-514d2afb1a8c	IE	IRL	372	Ireland 	Irska	\N
00040000-559b-9291-01ad-12e7d59136e2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-559b-9291-a714-9426a3b11029	IL	ISR	376	Israel 	Izrael	\N
00040000-559b-9291-c023-e0d3de49b847	IT	ITA	380	Italy 	Italija	\N
00040000-559b-9291-a7fb-690a3be84122	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-559b-9291-41cc-92ac0db3d5be	JP	JPN	392	Japan 	Japonska	\N
00040000-559b-9291-2743-5cee87734546	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-559b-9291-26a5-ce1e4f540bb2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-559b-9291-7422-8038f4db80ea	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-559b-9291-7dd9-d837a76ba5f4	KE	KEN	404	Kenya 	Kenija	\N
00040000-559b-9291-2494-098735ac4ef7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-559b-9291-05ac-b48885d10a39	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-559b-9291-43f6-d3ae6d33ad1b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-559b-9291-6cf2-4c7fd191bdd1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-559b-9291-e992-3b60bc34d698	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-559b-9291-7320-0062e5f11111	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-559b-9291-b120-5b926d896fc4	LV	LVA	428	Latvia 	Latvija	\N
00040000-559b-9291-c560-78df2e4acef7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-559b-9291-0bf4-9680a08ae3ef	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-559b-9291-fe30-ce93b685ba2b	LR	LBR	430	Liberia 	Liberija	\N
00040000-559b-9291-bd5a-5db4ebef5e2e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-559b-9291-f788-74d89cab96e7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-559b-9291-6eb0-293683c417ee	LT	LTU	440	Lithuania 	Litva	\N
00040000-559b-9291-1098-59bc1d4589ad	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-559b-9291-32a4-b6aa4a8976c0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-559b-9291-9229-687f7bc09bb9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-559b-9291-b9a6-febfb98c3bc1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-559b-9291-4907-d8fb1d9d6cf4	MW	MWI	454	Malawi 	Malavi	\N
00040000-559b-9291-f251-5bd906e12e9c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-559b-9291-8dc6-748a6be1c536	MV	MDV	462	Maldives 	Maldivi	\N
00040000-559b-9291-3cb3-fd63de041461	ML	MLI	466	Mali 	Mali	\N
00040000-559b-9291-88c2-e63dcc922661	MT	MLT	470	Malta 	Malta	\N
00040000-559b-9291-7cdd-5532f3f2c9c3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-559b-9291-15db-ca39a48d09e6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-559b-9291-ed86-485ed804d8ce	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-559b-9291-cf16-67e027c32346	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-559b-9291-ee45-98cb5abc4fac	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-559b-9291-53c1-7b553898e54d	MX	MEX	484	Mexico 	Mehika	\N
00040000-559b-9291-4649-6eca55c044ce	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-559b-9291-7cf0-5937a3d0ee93	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-559b-9291-3d78-114aacfadb94	MC	MCO	492	Monaco 	Monako	\N
00040000-559b-9291-d3d1-aede91ff2916	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-559b-9291-d84e-c8adbab194ef	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-559b-9291-8d0f-155bc345af45	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-559b-9291-697a-0d3cbb4a9013	MA	MAR	504	Morocco 	Maroko	\N
00040000-559b-9291-8501-bf086bbf8b51	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-559b-9291-a784-e54c96823cc0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-559b-9291-c7c4-5af1efcd0778	NA	NAM	516	Namibia 	Namibija	\N
00040000-559b-9291-710b-d9f2119ce385	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-559b-9291-60bb-bb41398f5390	NP	NPL	524	Nepal 	Nepal	\N
00040000-559b-9291-4efa-89b50c6742fe	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-559b-9291-97a8-f7c577804cee	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-559b-9291-58c0-b31009515876	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-559b-9291-ec4a-d558af8e01ce	NE	NER	562	Niger 	Niger 	\N
00040000-559b-9291-154e-4b109125e422	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-559b-9291-8842-87dfd9c5dde8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-559b-9291-d112-22b795fdfe29	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-559b-9291-af5d-8860964e70c7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-559b-9291-9176-e97d5e8904ff	NO	NOR	578	Norway 	Norveška	\N
00040000-559b-9291-5d2d-d4f677c27e7e	OM	OMN	512	Oman 	Oman	\N
00040000-559b-9291-89ef-c603acbd323e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-559b-9291-c064-c904ddfb2b62	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-559b-9291-8871-6b5d0b41ee6e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-559b-9291-ee16-00733102d7fb	PA	PAN	591	Panama 	Panama	\N
00040000-559b-9291-77d4-9f04e0acabb9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-559b-9291-510e-542dce522c34	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-559b-9291-a47b-9573f26ebd49	PE	PER	604	Peru 	Peru	\N
00040000-559b-9291-f418-593a4b4c6c21	PH	PHL	608	Philippines 	Filipini	\N
00040000-559b-9291-61f5-b105c9cda89a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-559b-9291-57d7-f6f66ba96da3	PL	POL	616	Poland 	Poljska	\N
00040000-559b-9291-4d7f-943efbae5002	PT	PRT	620	Portugal 	Portugalska	\N
00040000-559b-9291-60e5-20522c171970	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-559b-9291-2320-2a0bbb5375c6	QA	QAT	634	Qatar 	Katar	\N
00040000-559b-9291-b03e-6bffb4d206ba	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-559b-9291-663d-7fe4e58a8d8d	RO	ROU	642	Romania 	Romunija	\N
00040000-559b-9291-968f-b460ddda6009	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-559b-9291-dbbc-88427c36b78a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-559b-9291-c90c-ee917c42aeb2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-559b-9291-bca9-4cdafe1174fa	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-559b-9291-3d4f-24e61b0b94bf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-559b-9291-7a57-43ffaa2d0ad3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-559b-9291-481c-ad99b7783827	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-559b-9291-a5a1-de8080cff33b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-559b-9291-8f0f-431ea10732aa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-559b-9291-7cf7-20a60bf28513	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-559b-9291-3f54-a5a37b3aad31	SM	SMR	674	San Marino 	San Marino	\N
00040000-559b-9291-affe-4f8ffaf223dd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-559b-9291-c6ea-f4592d262dac	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-559b-9291-77af-a06664426b01	SN	SEN	686	Senegal 	Senegal	\N
00040000-559b-9291-e8e6-c9cad563eb97	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-559b-9291-c5c0-628b5d7b5559	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-559b-9291-05f1-e503159dab54	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-559b-9291-2a8b-c33bde77e511	SG	SGP	702	Singapore 	Singapur	\N
00040000-559b-9291-01f7-c3c493aba16a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-559b-9291-591f-eef87591714d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-559b-9291-f8bd-794fd7c40dcf	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-559b-9291-0ebb-8c682e096ed2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-559b-9291-c043-9cf2b77d5cb9	SO	SOM	706	Somalia 	Somalija	\N
00040000-559b-9291-3773-7cdf68a6a10c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-559b-9291-30a8-c425e91b054f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-559b-9291-f843-29789ee430b4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-559b-9291-e63e-2fc64d2db7ce	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-559b-9291-e309-547eeb9311a1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-559b-9291-518a-e36b86ba962f	SD	SDN	729	Sudan 	Sudan	\N
00040000-559b-9291-e0a8-fbe1fa5d1b74	SR	SUR	740	Suriname 	Surinam	\N
00040000-559b-9291-2eb2-85731e0b2c9b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-559b-9291-3a2f-6de73c6c0cbb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-559b-9291-fec3-e82e1f550975	SE	SWE	752	Sweden 	Švedska	\N
00040000-559b-9291-2fe7-a2733dcf061d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-559b-9291-d1e9-1524925135d6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-559b-9291-c4ca-0fd44d81c9d6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-559b-9291-8504-5e0cd17c6a87	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-559b-9291-3e6d-32b648ddb7d5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-559b-9291-2543-0571c8641963	TH	THA	764	Thailand 	Tajska	\N
00040000-559b-9291-c054-5b74fb6dcf07	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-559b-9291-96cc-2ee6bbf0df4d	TG	TGO	768	Togo 	Togo	\N
00040000-559b-9291-c456-549076470527	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-559b-9291-43e6-41f483b2bd5e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-559b-9291-acb0-9223e2bd2e6b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-559b-9291-5f94-0de64dfebaf8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-559b-9291-cf76-a097dc38b48c	TR	TUR	792	Turkey 	Turčija	\N
00040000-559b-9291-5ec0-c4af20e021dc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-559b-9291-ec3d-59a2d0486f69	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559b-9291-01b6-e1289e7f4c10	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-559b-9291-5b03-6c8d34c8b3da	UG	UGA	800	Uganda 	Uganda	\N
00040000-559b-9291-f7e3-b8c31f896b39	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-559b-9291-eb62-18620a96441f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-559b-9291-fc3b-a048aa778bd0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-559b-9291-5e9f-945ee9694641	US	USA	840	United States 	Združene države Amerike	\N
00040000-559b-9291-4028-7e03466df580	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-559b-9291-87ee-eda60985db68	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-559b-9291-66b0-f73cad929315	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-559b-9291-eb6e-67ffc7d43c76	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-559b-9291-e8a2-d20962c8b29c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-559b-9291-b36b-a3f2873ee855	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-559b-9291-bdcc-d669991b407f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-559b-9291-07d1-696186a07060	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-559b-9291-fba9-d208aeed5f99	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-559b-9291-00ac-e41275da422f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-559b-9291-3c2f-7b99b50c94d4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-559b-9291-7250-d2ebcabaad18	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-559b-9291-e650-6ea9c3d178d4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2904 (class 0 OID 9249597)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-559b-9293-0cb5-fb36935368d8	000e0000-559b-9293-297a-d3049d9bdf80	\N	\N	10000.80	9000.30	0.00	0.00	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	0	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-559b-9292-8c57-3d40603a23ce	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-559b-9293-2134-d09fd7f98c7a	000e0000-559b-9293-b2b5-0626f6a3889f	\N	\N	5000.00	4900.20	0.00	0.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	0	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-559b-9292-a75e-dd6dce36e172	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 9249424)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-559b-9293-857b-ef590668a25c	000e0000-559b-9293-b2b5-0626f6a3889f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-559b-9292-f1e5-26185bd7321c
000d0000-559b-9293-f406-04b51d977ffe	000e0000-559b-9293-b2b5-0626f6a3889f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-559b-9292-f1e5-26185bd7321c
000d0000-559b-9293-6302-af7e90b9ed20	000e0000-559b-9293-b2b5-0626f6a3889f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-559b-9292-3dd4-536515533f6c
000d0000-559b-9293-605a-0da51363ccb8	000e0000-559b-9293-b2b5-0626f6a3889f	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-559b-9292-7be8-25f92d7bef6b
000d0000-559b-9293-3b37-bc1a5073958c	000e0000-559b-9293-b2b5-0626f6a3889f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-559b-9292-7be8-25f92d7bef6b
000d0000-559b-9293-2b8b-077ec09b0afb	000e0000-559b-9293-b2b5-0626f6a3889f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-559b-9292-7be8-25f92d7bef6b
000d0000-559b-9293-6156-46f170683294	000e0000-559b-9293-b2b5-0626f6a3889f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-559b-9292-f1e5-26185bd7321c
000d0000-559b-9293-766b-2b2502add125	000e0000-559b-9293-b2b5-0626f6a3889f	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-559b-9292-fcd5-4b56e8dfd1c5
\.


--
-- TOC entry 2870 (class 0 OID 9249244)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 9249292)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 9249224)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-559b-9293-1fbd-4c1f707da1c8	00080000-559b-9292-6616-7f100c82e09b	00090000-559b-9293-f103-289a3922cfda	AK		
\.


--
-- TOC entry 2845 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 9249341)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 9249366)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 9249181)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-559b-9291-3b19-768a44f1bed0	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-559b-9291-442e-24c8c13fc73e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-559b-9291-1a30-977f0d00ff59	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-559b-9291-6569-fe14260a3dd3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-559b-9291-e147-ddb74557d11a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-559b-9291-c6f1-95189ae06884	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-559b-9291-f378-f96b69112f38	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-559b-9291-f4c7-860446bd6fc6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559b-9291-cb42-e31f14b94a62	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-559b-9291-b114-cb638dd3c113	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-559b-9291-4aa1-6c20cb6212d3	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-559b-9291-a6e6-f94348b20410	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-559b-9291-ddb7-f449332d65b5	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-559b-9292-b169-e3b44258bb1d	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-559b-9292-b1ad-063ac8d1e1f8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-559b-9292-0140-89806d971c1f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-559b-9292-53ff-ca2812c730fd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-559b-9292-5e20-0dbe190f366a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-559b-9292-a6e1-6ccbddc56d02	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2859 (class 0 OID 9249094)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-559b-9292-21d8-2d9a9fb8f61d	00000000-559b-9292-b1ad-063ac8d1e1f8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-559b-9292-c530-f1cba2652e98	00000000-559b-9292-b1ad-063ac8d1e1f8	00010000-559b-9291-214d-c9367912e8c9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-559b-9292-40b8-b9bf32aa435c	00000000-559b-9292-0140-89806d971c1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2860 (class 0 OID 9249105)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-559b-9293-f8fe-d34b6c63365a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-559b-9293-5dbf-579c22d80c09	00010000-559b-9292-f759-e9aa36edfbf5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-559b-9293-1ec8-b636a7a8bacf	00010000-559b-9292-22f1-e2134722cac8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-559b-9293-bc98-680ba76821bd	00010000-559b-9292-105e-8fb75d1e9044	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-559b-9293-e8f6-2f8fbc4a4034	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-559b-9293-42a6-605da8b2a116	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-559b-9293-3696-88f32c3a7932	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-559b-9293-3071-c11df20d901d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-559b-9293-f103-289a3922cfda	00010000-559b-9292-6479-013c8db0e8bd	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-559b-9293-354f-6f41ee2c6e4f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-559b-9293-428a-17ad2f83b127	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-559b-9293-264b-999b3b0b1187	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-559b-9293-8774-ca065f38233f	00010000-559b-9292-be8e-1eeda010231f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2847 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 9249059)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-559b-9291-0d6a-3c809771f470	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-559b-9291-480b-4bc87308c063	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-559b-9291-9030-fab7e8fdd60f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-559b-9291-cc79-f53edf54f487	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-559b-9291-eb17-e8dec5408736	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-559b-9291-0066-36e96db4cf46	Abonma-read	Abonma - branje	f
00030000-559b-9291-da65-b4d10336060a	Abonma-write	Abonma - spreminjanje	f
00030000-559b-9291-1e35-8e2300d42652	Alternacija-read	Alternacija - branje	f
00030000-559b-9291-995f-473d449c5627	Alternacija-write	Alternacija - spreminjanje	f
00030000-559b-9291-68b7-a7c57cd027c4	Arhivalija-read	Arhivalija - branje	f
00030000-559b-9291-d0f7-affd8ea50464	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-559b-9291-118e-427c82fb75fa	Besedilo-read	Besedilo - branje	f
00030000-559b-9291-95f6-c892dbef51b1	Besedilo-write	Besedilo - spreminjanje	f
00030000-559b-9291-8f93-1e49240010ca	DogodekIzven-read	DogodekIzven - branje	f
00030000-559b-9291-0a46-6634bab66ae5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-559b-9291-ae88-205c4557919b	Dogodek-read	Dogodek - branje	f
00030000-559b-9291-14f7-8b6c23c1618e	Dogodek-write	Dogodek - spreminjanje	f
00030000-559b-9291-6192-eafaadde7653	DrugiVir-read	DrugiVir - branje	f
00030000-559b-9291-2149-acac5048f7e7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-559b-9291-9742-6cd1994af4d5	Drzava-read	Drzava - branje	f
00030000-559b-9291-e057-221e11dfbb40	Drzava-write	Drzava - spreminjanje	f
00030000-559b-9291-421c-ceedc1440c32	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-559b-9291-d692-3456d14a6555	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-559b-9291-026b-eecf898fe79b	Funkcija-read	Funkcija - branje	f
00030000-559b-9291-478d-a93a71288b5f	Funkcija-write	Funkcija - spreminjanje	f
00030000-559b-9291-382e-b8afa236f277	Gostovanje-read	Gostovanje - branje	f
00030000-559b-9291-d280-c1c60abb405d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-559b-9291-a4dd-02552e883f73	Gostujoca-read	Gostujoca - branje	f
00030000-559b-9291-cfc7-a5161504bf07	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-559b-9291-3cda-7fdc278480da	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-559b-9291-1917-1f987a29bbc3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-559b-9291-f294-1aaf7c175363	Kupec-read	Kupec - branje	f
00030000-559b-9291-21d9-5855e80415bf	Kupec-write	Kupec - spreminjanje	f
00030000-559b-9291-fe32-1b864c031bff	NacinPlacina-read	NacinPlacina - branje	f
00030000-559b-9291-e526-39a955b97081	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-559b-9291-9337-d6ed840fba36	Option-read	Option - branje	f
00030000-559b-9291-ece6-4f533017fa41	Option-write	Option - spreminjanje	f
00030000-559b-9291-d29a-96c6e5998cd2	OptionValue-read	OptionValue - branje	f
00030000-559b-9291-d3ea-d1cdcdbb81d2	OptionValue-write	OptionValue - spreminjanje	f
00030000-559b-9291-db90-6c2db99c7e29	Oseba-read	Oseba - branje	f
00030000-559b-9291-62d9-46abfd8c3579	Oseba-write	Oseba - spreminjanje	f
00030000-559b-9291-948f-5209c1e740cc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-559b-9291-7fae-2c38715f5b62	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-559b-9291-a022-0b81761babef	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-559b-9291-0993-af73c6046b37	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-559b-9291-076f-6430b6dfc0b0	Pogodba-read	Pogodba - branje	f
00030000-559b-9291-7934-bd6335262dec	Pogodba-write	Pogodba - spreminjanje	f
00030000-559b-9291-179d-4a2e8310cf4e	Popa-read	Popa - branje	f
00030000-559b-9291-cb71-0ad6378dcf61	Popa-write	Popa - spreminjanje	f
00030000-559b-9291-2143-75468f08971b	Posta-read	Posta - branje	f
00030000-559b-9291-7e15-22684a3fb4b5	Posta-write	Posta - spreminjanje	f
00030000-559b-9291-f906-7e4f1fadb108	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-559b-9291-8abf-ddb60889efc1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-559b-9291-42df-2a95f53d4d2b	PostniNaslov-read	PostniNaslov - branje	f
00030000-559b-9291-fd07-f9abc3c654fa	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-559b-9291-2aef-f646964248da	Predstava-read	Predstava - branje	f
00030000-559b-9291-090a-1e7661a3cfa5	Predstava-write	Predstava - spreminjanje	f
00030000-559b-9291-f6a8-79bd2ad17a31	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-559b-9291-d479-9635218567aa	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-559b-9291-95ee-91177611c655	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-559b-9291-3f9b-95407843ad59	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-559b-9291-3a79-fdcefb4d1b9f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-559b-9291-3d8e-fcbaddbaaefb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-559b-9291-36a3-02e9af197cd9	ProgramDela-read	ProgramDela - branje	f
00030000-559b-9291-afef-0b7efb64053c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-559b-9291-d65c-51111478ecd7	ProgramFestival-read	ProgramFestival - branje	f
00030000-559b-9291-d0c0-0f8f122e90d7	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-559b-9291-60ac-6eeb030ab69a	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-559b-9291-1771-619243e2dd75	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-559b-9291-e6c5-19c5cc7b3418	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-559b-9291-6229-74cb659e9ee1	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-559b-9291-b205-1f7f58a61cfe	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-559b-9291-c5b0-433df8a5e247	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-559b-9291-cf95-d95385869532	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-559b-9291-1d7e-579a41fb5db5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-559b-9291-526a-0cd4cc4545a0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-559b-9291-3293-6a3ee111a6f9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-559b-9291-5e97-cdf1f5117c8a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-559b-9291-3689-8332224baa1b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-559b-9291-e77a-1a83829097c4	ProgramRazno-read	ProgramRazno - branje	f
00030000-559b-9291-0f3e-78a0b5e7ca56	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-559b-9291-58c5-3caf1c4f5e8f	Prostor-read	Prostor - branje	f
00030000-559b-9291-6e94-756f09a8bfd4	Prostor-write	Prostor - spreminjanje	f
00030000-559b-9291-0620-097a2f199d35	Racun-read	Racun - branje	f
00030000-559b-9291-2b7c-601a1a955b7a	Racun-write	Racun - spreminjanje	f
00030000-559b-9291-4510-abc6a8ec6a95	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-559b-9291-41cb-085a1110b08c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-559b-9291-2906-318aa91339ca	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-559b-9291-21c2-55a07bb7394e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-559b-9291-7483-1b26b50ad912	Rekvizit-read	Rekvizit - branje	f
00030000-559b-9291-ffcf-d2b60e8c2648	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-559b-9291-de41-d947dcfb22e2	Revizija-read	Revizija - branje	f
00030000-559b-9291-c03c-5c8a93600cc4	Revizija-write	Revizija - spreminjanje	f
00030000-559b-9291-19d4-e4831b567d32	Rezervacija-read	Rezervacija - branje	f
00030000-559b-9291-85d5-f3548c789b1e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-559b-9291-edff-de5998fa382c	SedezniRed-read	SedezniRed - branje	f
00030000-559b-9291-0982-077a78c43a87	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-559b-9291-a8a3-408f61ba2d4d	Sedez-read	Sedez - branje	f
00030000-559b-9291-a0f2-32c42f1344e7	Sedez-write	Sedez - spreminjanje	f
00030000-559b-9291-575f-1ebc741535f7	Sezona-read	Sezona - branje	f
00030000-559b-9291-a7a5-0475ccdc751d	Sezona-write	Sezona - spreminjanje	f
00030000-559b-9291-fdd9-1c2ceb33e21d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-559b-9291-ddf0-6507ffa4bacf	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-559b-9291-ad0e-9123cfdcb17d	Stevilcenje-read	Stevilcenje - branje	f
00030000-559b-9291-8a69-e21e0d8bd8f1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-559b-9291-3114-0f07c9c23007	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-559b-9291-3d36-ef1d124978e8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-559b-9291-5ab8-25922bb26b00	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-559b-9291-6034-338d31ef2c16	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-559b-9291-3031-7d29e52e965c	Telefonska-read	Telefonska - branje	f
00030000-559b-9291-ca55-b038adabb824	Telefonska-write	Telefonska - spreminjanje	f
00030000-559b-9291-7c19-18199166df4d	TerminStoritve-read	TerminStoritve - branje	f
00030000-559b-9291-c589-abd6ff08affd	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-559b-9291-4be2-4e1e81f666b5	TipFunkcije-read	TipFunkcije - branje	f
00030000-559b-9291-68ba-b3da6b8ac591	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-559b-9291-adc6-7928599ca835	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-559b-9291-236a-e7ed8c11d65f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-559b-9291-a261-8ee8649c48ea	Trr-read	Trr - branje	f
00030000-559b-9291-4d3f-1b698ab65bc5	Trr-write	Trr - spreminjanje	f
00030000-559b-9291-de65-3f4de886cbbb	Uprizoritev-read	Uprizoritev - branje	f
00030000-559b-9291-902e-974ac1c68ab8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-559b-9291-c86b-e2f520c9eaff	Vaja-read	Vaja - branje	f
00030000-559b-9291-b0f8-47f8c762afeb	Vaja-write	Vaja - spreminjanje	f
00030000-559b-9291-b419-ffaa50e0afec	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-559b-9291-dbf5-5550bea3698e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-559b-9291-2023-29944587f53c	Zaposlitev-read	Zaposlitev - branje	f
00030000-559b-9291-5584-1707765cbf3c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-559b-9291-1915-acd1ed7c2e64	Zasedenost-read	Zasedenost - branje	f
00030000-559b-9291-ad8d-859b6ded898f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-559b-9291-3908-81c3ca6d76be	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-559b-9291-be00-cad513c80a08	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-559b-9291-966b-f7518d8cfb35	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-559b-9291-cb49-6ee6b5e5704c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2857 (class 0 OID 9249078)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-559b-9291-0500-6d36e5ece76c	00030000-559b-9291-480b-4bc87308c063
00020000-559b-9291-b596-e6ae2e5ecf20	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-da65-b4d10336060a
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-1e35-8e2300d42652
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-995f-473d449c5627
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-cc79-f53edf54f487
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-14f7-8b6c23c1618e
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-e057-221e11dfbb40
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-026b-eecf898fe79b
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-478d-a93a71288b5f
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-d280-c1c60abb405d
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-cfc7-a5161504bf07
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-3cda-7fdc278480da
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-1917-1f987a29bbc3
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-db90-6c2db99c7e29
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-62d9-46abfd8c3579
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-cb71-0ad6378dcf61
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-2143-75468f08971b
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-7e15-22684a3fb4b5
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-42df-2a95f53d4d2b
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-fd07-f9abc3c654fa
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-2aef-f646964248da
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-090a-1e7661a3cfa5
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-3a79-fdcefb4d1b9f
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-3d8e-fcbaddbaaefb
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-6e94-756f09a8bfd4
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-21c2-55a07bb7394e
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-ffcf-d2b60e8c2648
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-a7a5-0475ccdc751d
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-4be2-4e1e81f666b5
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-de65-3f4de886cbbb
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-902e-974ac1c68ab8
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-c86b-e2f520c9eaff
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-b0f8-47f8c762afeb
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-1915-acd1ed7c2e64
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-ad8d-859b6ded898f
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9291-5fd4-e35eb8098dd9	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-3cda-7fdc278480da
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-1917-1f987a29bbc3
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-db90-6c2db99c7e29
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-62d9-46abfd8c3579
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-2143-75468f08971b
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-42df-2a95f53d4d2b
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-fd07-f9abc3c654fa
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-2aef-f646964248da
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-3031-7d29e52e965c
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-ca55-b038adabb824
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-a261-8ee8649c48ea
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-4d3f-1b698ab65bc5
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-2023-29944587f53c
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-5584-1707765cbf3c
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9291-4bbe-ce099e060edf	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-1e35-8e2300d42652
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-d0f7-affd8ea50464
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-118e-427c82fb75fa
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-8f93-1e49240010ca
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-026b-eecf898fe79b
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-3cda-7fdc278480da
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-db90-6c2db99c7e29
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-2143-75468f08971b
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-2aef-f646964248da
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-3a79-fdcefb4d1b9f
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-4be2-4e1e81f666b5
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-c86b-e2f520c9eaff
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-1915-acd1ed7c2e64
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9291-1232-4e4cc1c1f1a5	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-da65-b4d10336060a
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-995f-473d449c5627
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-2143-75468f08971b
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-2aef-f646964248da
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-4be2-4e1e81f666b5
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9291-f863-a35e41604e87	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-2143-75468f08971b
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-2aef-f646964248da
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-7c19-18199166df4d
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-9030-fab7e8fdd60f
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-4be2-4e1e81f666b5
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9291-5fdf-15085bd98117	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0d6a-3c809771f470
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-480b-4bc87308c063
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-9030-fab7e8fdd60f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-cc79-f53edf54f487
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-eb17-e8dec5408736
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0066-36e96db4cf46
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-da65-b4d10336060a
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-1e35-8e2300d42652
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-995f-473d449c5627
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-68b7-a7c57cd027c4
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d0f7-affd8ea50464
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-118e-427c82fb75fa
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-95f6-c892dbef51b1
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-8f93-1e49240010ca
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0a46-6634bab66ae5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ae88-205c4557919b
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-14f7-8b6c23c1618e
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-9742-6cd1994af4d5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-e057-221e11dfbb40
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-421c-ceedc1440c32
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d692-3456d14a6555
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-026b-eecf898fe79b
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-478d-a93a71288b5f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-382e-b8afa236f277
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d280-c1c60abb405d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a4dd-02552e883f73
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-cfc7-a5161504bf07
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3cda-7fdc278480da
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-1917-1f987a29bbc3
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-f294-1aaf7c175363
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-21d9-5855e80415bf
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-fe32-1b864c031bff
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-e526-39a955b97081
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-9337-d6ed840fba36
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ece6-4f533017fa41
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d29a-96c6e5998cd2
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d3ea-d1cdcdbb81d2
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-db90-6c2db99c7e29
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-62d9-46abfd8c3579
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-948f-5209c1e740cc
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-7fae-2c38715f5b62
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a022-0b81761babef
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0993-af73c6046b37
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-076f-6430b6dfc0b0
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-7934-bd6335262dec
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-179d-4a2e8310cf4e
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-cb71-0ad6378dcf61
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-2143-75468f08971b
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-7e15-22684a3fb4b5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-f906-7e4f1fadb108
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-8abf-ddb60889efc1
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-42df-2a95f53d4d2b
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-fd07-f9abc3c654fa
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-2aef-f646964248da
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-090a-1e7661a3cfa5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-f6a8-79bd2ad17a31
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d479-9635218567aa
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-95ee-91177611c655
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3f9b-95407843ad59
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3a79-fdcefb4d1b9f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3d8e-fcbaddbaaefb
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-36a3-02e9af197cd9
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-afef-0b7efb64053c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d65c-51111478ecd7
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-d0c0-0f8f122e90d7
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-60ac-6eeb030ab69a
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-1771-619243e2dd75
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-e6c5-19c5cc7b3418
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-6229-74cb659e9ee1
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-b205-1f7f58a61cfe
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-c5b0-433df8a5e247
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-cf95-d95385869532
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-1d7e-579a41fb5db5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-526a-0cd4cc4545a0
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3293-6a3ee111a6f9
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-5e97-cdf1f5117c8a
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3689-8332224baa1b
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-e77a-1a83829097c4
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0f3e-78a0b5e7ca56
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-58c5-3caf1c4f5e8f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-6e94-756f09a8bfd4
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0620-097a2f199d35
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-2b7c-601a1a955b7a
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-4510-abc6a8ec6a95
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-41cb-085a1110b08c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-2906-318aa91339ca
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-21c2-55a07bb7394e
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-7483-1b26b50ad912
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ffcf-d2b60e8c2648
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-de41-d947dcfb22e2
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-c03c-5c8a93600cc4
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-19d4-e4831b567d32
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-85d5-f3548c789b1e
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-edff-de5998fa382c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-0982-077a78c43a87
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a8a3-408f61ba2d4d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a0f2-32c42f1344e7
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-575f-1ebc741535f7
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a7a5-0475ccdc751d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-fdd9-1c2ceb33e21d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ddf0-6507ffa4bacf
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ad0e-9123cfdcb17d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-8a69-e21e0d8bd8f1
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3114-0f07c9c23007
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3d36-ef1d124978e8
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-5ab8-25922bb26b00
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-6034-338d31ef2c16
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3031-7d29e52e965c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ca55-b038adabb824
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-7c19-18199166df4d
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-c589-abd6ff08affd
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-4be2-4e1e81f666b5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-68ba-b3da6b8ac591
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-adc6-7928599ca835
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-236a-e7ed8c11d65f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-a261-8ee8649c48ea
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-4d3f-1b698ab65bc5
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-de65-3f4de886cbbb
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-902e-974ac1c68ab8
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-c86b-e2f520c9eaff
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-b0f8-47f8c762afeb
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-b419-ffaa50e0afec
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-dbf5-5550bea3698e
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-2023-29944587f53c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-5584-1707765cbf3c
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-1915-acd1ed7c2e64
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-ad8d-859b6ded898f
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-3908-81c3ca6d76be
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-be00-cad513c80a08
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-966b-f7518d8cfb35
00020000-559b-9292-aebb-29971a7dc178	00030000-559b-9291-cb49-6ee6b5e5704c
\.


--
-- TOC entry 2885 (class 0 OID 9249373)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 9249404)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 9249517)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-559b-9293-d487-1fe33960bca0	00090000-559b-9293-f8fe-d34b6c63365a	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
000b0000-559b-9293-dd09-fda004cd5fd3	00090000-559b-9293-42a6-605da8b2a116	\N	\N	0002	401.00	\N	\N	11.00	31.00	11.00	401.00	t	f	Pogodba za vlogo Helena
000b0000-559b-9293-83ac-fe0746524bde	00090000-559b-9293-8774-ca065f38233f	\N	\N	0003	402.00	\N	\N	12.00	32.00	12.00	402.00	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2862 (class 0 OID 9249138)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-559b-9292-6616-7f100c82e09b	00040000-559b-9291-f8bd-794fd7c40dcf	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-547e-f4a5b9d3ff9c	00040000-559b-9291-f8bd-794fd7c40dcf	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-559b-9292-c957-536ecafab0ed	00040000-559b-9291-f8bd-794fd7c40dcf	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-e311-6d3bebfd5fec	00040000-559b-9291-f8bd-794fd7c40dcf	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-1844-0e30542eaed2	00040000-559b-9291-f8bd-794fd7c40dcf	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-46b3-ad0968a71da6	00040000-559b-9291-d04f-2c88651045f4	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-f818-0c3938300cb3	00040000-559b-9291-f070-a087504b0b00	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9292-d051-432c675cdbf5	00040000-559b-9291-fd83-004b33ddcb9a	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-559b-9293-ee00-3daa46b2b623	00040000-559b-9291-f8bd-794fd7c40dcf	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2864 (class 0 OID 9249173)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-559b-9291-f493-51f12d47d678	8341	Adlešiči
00050000-559b-9291-7bb3-c0a04a27d94f	5270	Ajdovščina
00050000-559b-9291-4a7f-d0b20c83ebe0	6280	Ankaran/Ancarano
00050000-559b-9291-2164-1580d5bf434e	9253	Apače
00050000-559b-9291-e969-09ea835de6b7	8253	Artiče
00050000-559b-9291-f397-c385f3de7354	4275	Begunje na Gorenjskem
00050000-559b-9291-135a-c43b740525af	1382	Begunje pri Cerknici
00050000-559b-9291-522c-9108b3f0f0f8	9231	Beltinci
00050000-559b-9291-94de-88365700df1c	2234	Benedikt
00050000-559b-9291-000a-f6d7a9c03faf	2345	Bistrica ob Dravi
00050000-559b-9291-fa7d-19d004f8fc5f	3256	Bistrica ob Sotli
00050000-559b-9291-1644-d0fa9c6a36a8	8259	Bizeljsko
00050000-559b-9291-cc22-da7e6a640ab0	1223	Blagovica
00050000-559b-9291-738f-6a7568692eb3	8283	Blanca
00050000-559b-9291-d63d-8b7d498ec0e3	4260	Bled
00050000-559b-9291-7d5b-a45be4f9b548	4273	Blejska Dobrava
00050000-559b-9291-edb0-3942662c28fb	9265	Bodonci
00050000-559b-9291-1a28-56c508ce3730	9222	Bogojina
00050000-559b-9291-b7b6-b5e4f5475529	4263	Bohinjska Bela
00050000-559b-9291-41a0-532f384e118b	4264	Bohinjska Bistrica
00050000-559b-9291-63d2-1cb4f3ef70c7	4265	Bohinjsko jezero
00050000-559b-9291-3f78-391031e5af6d	1353	Borovnica
00050000-559b-9291-fa17-1df7328a33e6	8294	Boštanj
00050000-559b-9291-a912-e863c72bd11f	5230	Bovec
00050000-559b-9291-f379-364e82016213	5295	Branik
00050000-559b-9291-3b91-af85e03831cc	3314	Braslovče
00050000-559b-9291-b57e-3bc256579959	5223	Breginj
00050000-559b-9291-56c0-a15822370487	8280	Brestanica
00050000-559b-9291-f68c-ef49abce7ef6	2354	Bresternica
00050000-559b-9291-e283-7853ac94a7c5	4243	Brezje
00050000-559b-9291-2492-90ee7d04ad43	1351	Brezovica pri Ljubljani
00050000-559b-9291-79b6-26908dc6036c	8250	Brežice
00050000-559b-9291-89d2-77ac508a6e82	4210	Brnik - Aerodrom
00050000-559b-9291-72f6-af08cee22907	8321	Brusnice
00050000-559b-9291-c43e-ea87d4047094	3255	Buče
00050000-559b-9291-dbd1-278134c2e4ad	8276	Bučka 
00050000-559b-9291-582a-305f678a450e	9261	Cankova
00050000-559b-9291-9ba5-b34a2efe016a	3000	Celje 
00050000-559b-9291-4cf0-695d664bacd8	3001	Celje - poštni predali
00050000-559b-9291-65f2-e51290ffed5f	4207	Cerklje na Gorenjskem
00050000-559b-9291-0d54-d98e8df3ad13	8263	Cerklje ob Krki
00050000-559b-9291-8ba8-41ef8b50db3b	1380	Cerknica
00050000-559b-9291-c17b-5994e40b9ae7	5282	Cerkno
00050000-559b-9291-c53e-d80d1549aa9b	2236	Cerkvenjak
00050000-559b-9291-dc21-605181292e3c	2215	Ceršak
00050000-559b-9291-1be0-afccc756303c	2326	Cirkovce
00050000-559b-9291-b5a5-9b3ced818f71	2282	Cirkulane
00050000-559b-9291-38f4-105b5df26096	5273	Col
00050000-559b-9291-0b53-714fc5b30769	8251	Čatež ob Savi
00050000-559b-9291-963f-4e12c46c8751	1413	Čemšenik
00050000-559b-9291-37e8-5a506088b456	5253	Čepovan
00050000-559b-9291-ae67-903016dc98f5	9232	Črenšovci
00050000-559b-9291-298e-ec431ccc8044	2393	Črna na Koroškem
00050000-559b-9291-ecca-b04f4da21c14	6275	Črni Kal
00050000-559b-9291-b205-07fae63fe64f	5274	Črni Vrh nad Idrijo
00050000-559b-9291-5c98-8ec4b56ffaf9	5262	Črniče
00050000-559b-9291-026f-a3994cf3f87a	8340	Črnomelj
00050000-559b-9291-1450-aacaaa0a922b	6271	Dekani
00050000-559b-9291-e4ae-2a1c3727f065	5210	Deskle
00050000-559b-9291-f24f-5988434b78b8	2253	Destrnik
00050000-559b-9291-7783-7df9e70df7ae	6215	Divača
00050000-559b-9291-0951-a52505cff41c	1233	Dob
00050000-559b-9291-0abf-068bb6806ef4	3224	Dobje pri Planini
00050000-559b-9291-e7e3-6ae5f60ea42d	8257	Dobova
00050000-559b-9291-71bf-725adcab5c2a	1423	Dobovec
00050000-559b-9291-d662-cc134485d795	5263	Dobravlje
00050000-559b-9291-32f1-8a2fa1277d8d	3204	Dobrna
00050000-559b-9291-3929-97a6fad567ac	8211	Dobrnič
00050000-559b-9291-d912-351edd1c0375	1356	Dobrova
00050000-559b-9291-759e-b45370c61852	9223	Dobrovnik/Dobronak 
00050000-559b-9291-c904-64e50f589f33	5212	Dobrovo v Brdih
00050000-559b-9291-692f-42bf95358276	1431	Dol pri Hrastniku
00050000-559b-9291-22ff-6433868c55c6	1262	Dol pri Ljubljani
00050000-559b-9291-5faa-9f72b368d922	1273	Dole pri Litiji
00050000-559b-9291-bf60-f00e2d9cfab7	1331	Dolenja vas
00050000-559b-9291-27ee-a8737ad47111	8350	Dolenjske Toplice
00050000-559b-9291-33c5-df1122dbc3ab	1230	Domžale
00050000-559b-9291-0940-5b822be10b64	2252	Dornava
00050000-559b-9291-c52d-8217510c8862	5294	Dornberk
00050000-559b-9291-01b0-9e1132632d2d	1319	Draga
00050000-559b-9291-6ed8-806167787b70	8343	Dragatuš
00050000-559b-9291-5b8e-3f561ef1c51f	3222	Dramlje
00050000-559b-9291-e4ba-9972e16ea1e1	2370	Dravograd
00050000-559b-9291-9d9a-5e314478e378	4203	Duplje
00050000-559b-9291-30f0-c27bd003d5c2	6221	Dutovlje
00050000-559b-9291-5e35-60c1dcfa439a	8361	Dvor
00050000-559b-9291-7910-d887ef9fc6ff	2343	Fala
00050000-559b-9291-3ee6-cd665bb8dbfa	9208	Fokovci
00050000-559b-9291-dde5-8754d43d9218	2313	Fram
00050000-559b-9291-1195-047a2762a4bb	3213	Frankolovo
00050000-559b-9291-59c1-cae2e8f3f2e2	1274	Gabrovka
00050000-559b-9291-561c-6a9520268703	8254	Globoko
00050000-559b-9291-044d-0c521e98a28f	5275	Godovič
00050000-559b-9291-3e43-5a14dbf54d36	4204	Golnik
00050000-559b-9291-6649-41f2935b886e	3303	Gomilsko
00050000-559b-9291-76bc-78c1d5ddbb88	4224	Gorenja vas
00050000-559b-9291-c753-f2dfaffb5f90	3263	Gorica pri Slivnici
00050000-559b-9291-f3e9-2c83b4f13139	2272	Gorišnica
00050000-559b-9291-6451-bd176e6d44ee	9250	Gornja Radgona
00050000-559b-9291-48a8-3d75219f8dcf	3342	Gornji Grad
00050000-559b-9291-ad27-9ed3fb4f5237	4282	Gozd Martuljek
00050000-559b-9291-5540-b1336a69985b	6272	Gračišče
00050000-559b-9291-ef82-636951c73d18	9264	Grad
00050000-559b-9291-bae4-204d88337374	8332	Gradac
00050000-559b-9291-0667-79402d4192e2	1384	Grahovo
00050000-559b-9291-a139-9240937537f6	5242	Grahovo ob Bači
00050000-559b-9291-a0dc-06004faa7721	5251	Grgar
00050000-559b-9291-6656-d533db0feaaf	3302	Griže
00050000-559b-9291-4dc0-46d47b81a7b3	3231	Grobelno
00050000-559b-9291-d9d0-ff5533d770d7	1290	Grosuplje
00050000-559b-9291-986c-44b96b75797d	2288	Hajdina
00050000-559b-9291-78db-512714ba29c5	8362	Hinje
00050000-559b-9291-929f-18acdc61e84d	2311	Hoče
00050000-559b-9291-dedc-795e96215873	9205	Hodoš/Hodos
00050000-559b-9291-8655-312e3e83756a	1354	Horjul
00050000-559b-9291-8bde-7a8b5810fd14	1372	Hotedršica
00050000-559b-9291-9cc9-c88d02184d06	1430	Hrastnik
00050000-559b-9291-2709-7d504cb9b77b	6225	Hruševje
00050000-559b-9291-e213-e161a0022ba3	4276	Hrušica
00050000-559b-9291-97af-fca9f782985a	5280	Idrija
00050000-559b-9291-2f3c-02a57f05bbc8	1292	Ig
00050000-559b-9291-9934-c731adcca2c4	6250	Ilirska Bistrica
00050000-559b-9291-f481-75b2bc9e1a8c	6251	Ilirska Bistrica-Trnovo
00050000-559b-9291-10ba-a7b37c5ea1a4	1295	Ivančna Gorica
00050000-559b-9291-f63b-c861dca9000d	2259	Ivanjkovci
00050000-559b-9291-9a42-18e8c08d4c31	1411	Izlake
00050000-559b-9291-151d-0bbd276476ae	6310	Izola/Isola
00050000-559b-9291-9ef4-3d99f55de135	2222	Jakobski Dol
00050000-559b-9291-1cdf-548e0c96c5b1	2221	Jarenina
00050000-559b-9291-db3b-6cbd726547db	6254	Jelšane
00050000-559b-9291-c4e2-2ce50cf40f3f	4270	Jesenice
00050000-559b-9291-c304-7ef51f2fe12a	8261	Jesenice na Dolenjskem
00050000-559b-9291-94c9-4b4030afd8c2	3273	Jurklošter
00050000-559b-9291-43b9-78a6643deaf3	2223	Jurovski Dol
00050000-559b-9291-6ccc-807adf255fd2	2256	Juršinci
00050000-559b-9291-39f1-5f5e924b2139	5214	Kal nad Kanalom
00050000-559b-9291-e06c-df322ad686a6	3233	Kalobje
00050000-559b-9291-e69f-a62fe2eac9a8	4246	Kamna Gorica
00050000-559b-9291-5ddd-2a3914162d65	2351	Kamnica
00050000-559b-9291-3f43-a683010d5320	1241	Kamnik
00050000-559b-9291-e7a5-e1e88b324513	5213	Kanal
00050000-559b-9291-bd5e-2a551f9949fb	8258	Kapele
00050000-559b-9291-1cec-ee857cd6f3d6	2362	Kapla
00050000-559b-9291-e08c-0a5b67865d03	2325	Kidričevo
00050000-559b-9291-f3a6-e7575b2165e2	1412	Kisovec
00050000-559b-9291-0961-7eeb30d10fdb	6253	Knežak
00050000-559b-9291-ef25-352f052a4549	5222	Kobarid
00050000-559b-9291-afaf-aa761f54c652	9227	Kobilje
00050000-559b-9291-c566-729b56a96311	1330	Kočevje
00050000-559b-9291-1a1c-0455e4a623bb	1338	Kočevska Reka
00050000-559b-9291-b09f-252c7acf32bf	2276	Kog
00050000-559b-9291-0556-091b8cca3b08	5211	Kojsko
00050000-559b-9291-91f5-964d99f031b0	6223	Komen
00050000-559b-9291-3b6c-52791a094b35	1218	Komenda
00050000-559b-9291-af95-6ac8b236a69a	6000	Koper/Capodistria 
00050000-559b-9291-a12e-4619b6702f79	6001	Koper/Capodistria - poštni predali
00050000-559b-9291-8cae-5276d7dcd14b	8282	Koprivnica
00050000-559b-9291-e803-18b69f65c813	5296	Kostanjevica na Krasu
00050000-559b-9291-5bff-30b2ee3a8b31	8311	Kostanjevica na Krki
00050000-559b-9291-8f2f-355952626ceb	1336	Kostel
00050000-559b-9291-2c9a-af1f82a35364	6256	Košana
00050000-559b-9291-e265-c6d1c0694d16	2394	Kotlje
00050000-559b-9291-3b09-7d2a00bb37e9	6240	Kozina
00050000-559b-9291-044e-d256cc4341f2	3260	Kozje
00050000-559b-9291-dd62-ec1fb5b13c13	4000	Kranj 
00050000-559b-9291-011d-1ad250d64a24	4001	Kranj - poštni predali
00050000-559b-9291-e334-ff27d8ab178b	4280	Kranjska Gora
00050000-559b-9291-ab47-1726d93a52fc	1281	Kresnice
00050000-559b-9291-e893-abba4a9dfb90	4294	Križe
00050000-559b-9291-fbaa-d1d79c0659fd	9206	Križevci
00050000-559b-9291-38db-ac75103d77dd	9242	Križevci pri Ljutomeru
00050000-559b-9291-61a1-f8e974f35e46	1301	Krka
00050000-559b-9291-073c-511003b1b124	8296	Krmelj
00050000-559b-9291-4e15-f0d7ddb53d2a	4245	Kropa
00050000-559b-9291-72e1-b2b872df2f4a	8262	Krška vas
00050000-559b-9291-6669-e7a2d44ac89d	8270	Krško
00050000-559b-9291-946f-d68689d89c36	9263	Kuzma
00050000-559b-9291-9fbe-c3752bce2d1c	2318	Laporje
00050000-559b-9291-403f-f684e9d103df	3270	Laško
00050000-559b-9291-bf86-1711abf44144	1219	Laze v Tuhinju
00050000-559b-9291-2672-1ef7213e42a0	2230	Lenart v Slovenskih goricah
00050000-559b-9291-29f8-1935cf242dca	9220	Lendava/Lendva
00050000-559b-9291-aca8-ae733d6af767	4248	Lesce
00050000-559b-9291-8e16-abe94916c1dc	3261	Lesično
00050000-559b-9291-a1b2-2ef36ac6f4f5	8273	Leskovec pri Krškem
00050000-559b-9291-6782-14a1afbd9456	2372	Libeliče
00050000-559b-9291-6a84-0024ec589abd	2341	Limbuš
00050000-559b-9291-ece7-a79f8f16c543	1270	Litija
00050000-559b-9291-004a-2e5788296fa4	3202	Ljubečna
00050000-559b-9291-d9bc-1686fb72b705	1000	Ljubljana 
00050000-559b-9291-1ea5-52309b92db65	1001	Ljubljana - poštni predali
00050000-559b-9291-f897-31a853098c09	1231	Ljubljana - Črnuče
00050000-559b-9291-37f3-825cfae9c91e	1261	Ljubljana - Dobrunje
00050000-559b-9291-9cdd-7e2a250c4e2c	1260	Ljubljana - Polje
00050000-559b-9291-c266-72d128147246	1210	Ljubljana - Šentvid
00050000-559b-9291-12d0-57416ba7e8dd	1211	Ljubljana - Šmartno
00050000-559b-9291-8e14-bff922f21634	3333	Ljubno ob Savinji
00050000-559b-9291-beb6-5a40b14fdd63	9240	Ljutomer
00050000-559b-9291-93bc-c21a9009ef07	3215	Loče
00050000-559b-9291-2088-ca9e6ff439d1	5231	Log pod Mangartom
00050000-559b-9291-31b0-9805f6216020	1358	Log pri Brezovici
00050000-559b-9291-4492-85992e8d48c3	1370	Logatec
00050000-559b-9291-577b-e07455f326d2	1371	Logatec
00050000-559b-9291-7f46-179d23ead818	1434	Loka pri Zidanem Mostu
00050000-559b-9291-700a-ecd8550076d7	3223	Loka pri Žusmu
00050000-559b-9291-15af-0c2868c2fa83	6219	Lokev
00050000-559b-9291-32a2-5f440d890fbe	1318	Loški Potok
00050000-559b-9291-05a6-b27d1eb05723	2324	Lovrenc na Dravskem polju
00050000-559b-9291-9b3e-8fa73147b74f	2344	Lovrenc na Pohorju
00050000-559b-9291-66b3-fb49350882ab	3334	Luče
00050000-559b-9291-6af0-ad372cfc05f5	1225	Lukovica
00050000-559b-9291-db98-f736d3e229cc	9202	Mačkovci
00050000-559b-9291-0b71-c3598ae37c11	2322	Majšperk
00050000-559b-9291-e683-312421f9491f	2321	Makole
00050000-559b-9291-acb8-2b8583323394	9243	Mala Nedelja
00050000-559b-9291-f6ae-6a46f32f75d1	2229	Malečnik
00050000-559b-9291-e333-20a14955288f	6273	Marezige
00050000-559b-9291-804b-9d5e07334058	2000	Maribor 
00050000-559b-9291-78d6-475cca5a9524	2001	Maribor - poštni predali
00050000-559b-9291-8b95-a7f8ee8d7db0	2206	Marjeta na Dravskem polju
00050000-559b-9291-2f27-88698f4bd8e9	2281	Markovci
00050000-559b-9291-ae40-bae3db1dc7e5	9221	Martjanci
00050000-559b-9291-b139-599e6a3c77f7	6242	Materija
00050000-559b-9291-2012-ed0bd3681e64	4211	Mavčiče
00050000-559b-9291-1858-c0565099eda2	1215	Medvode
00050000-559b-9291-19bd-3b6c85cbb82c	1234	Mengeš
00050000-559b-9291-ef6d-841686057c3f	8330	Metlika
00050000-559b-9291-18c2-ed639c4796e2	2392	Mežica
00050000-559b-9291-a1ff-af9a28bfe4ff	2204	Miklavž na Dravskem polju
00050000-559b-9291-dcd6-a83dcb656c43	2275	Miklavž pri Ormožu
00050000-559b-9291-3fa0-115655d898e6	5291	Miren
00050000-559b-9291-3b65-248a15dfaa38	8233	Mirna
00050000-559b-9291-f636-d10b6d4799e3	8216	Mirna Peč
00050000-559b-9291-6bce-0ae2f47b61c5	2382	Mislinja
00050000-559b-9291-211e-e0533c157e7e	4281	Mojstrana
00050000-559b-9291-32e4-872c37651f7e	8230	Mokronog
00050000-559b-9291-32aa-c7d731e52b59	1251	Moravče
00050000-559b-9291-524a-a6fc28044472	9226	Moravske Toplice
00050000-559b-9291-d0ea-ab7ca85cd568	5216	Most na Soči
00050000-559b-9291-8500-a18d745d53df	1221	Motnik
00050000-559b-9291-d574-051d46ab4fbe	3330	Mozirje
00050000-559b-9291-38c0-8d3ba4f97738	9000	Murska Sobota 
00050000-559b-9291-2a85-20c660baddd0	9001	Murska Sobota - poštni predali
00050000-559b-9291-8aa4-e2ef6278b753	2366	Muta
00050000-559b-9291-b031-17800fe6e483	4202	Naklo
00050000-559b-9291-2f86-35b50e90ebe0	3331	Nazarje
00050000-559b-9291-c89c-2d725da2b8cf	1357	Notranje Gorice
00050000-559b-9291-d695-dd54fea3f268	3203	Nova Cerkev
00050000-559b-9291-c755-894535424038	5000	Nova Gorica 
00050000-559b-9291-11ee-7e24eccd05ef	5001	Nova Gorica - poštni predali
00050000-559b-9291-264c-e3773bed4229	1385	Nova vas
00050000-559b-9291-cae6-ea513b4abb72	8000	Novo mesto
00050000-559b-9291-6b70-d482fafaa1d3	8001	Novo mesto - poštni predali
00050000-559b-9291-0ccb-28987f12b8fb	6243	Obrov
00050000-559b-9291-6b49-576ce5d0a0ea	9233	Odranci
00050000-559b-9291-9a9e-6f0b52412e29	2317	Oplotnica
00050000-559b-9291-609d-095bc2ce0fe4	2312	Orehova vas
00050000-559b-9291-02ff-a9d865bebea7	2270	Ormož
00050000-559b-9291-a697-76f7ef0dfbf4	1316	Ortnek
00050000-559b-9291-5194-1d7fbb71dddd	1337	Osilnica
00050000-559b-9291-7d5c-5030fe35853b	8222	Otočec
00050000-559b-9291-a22b-bc522c9f6ed5	2361	Ožbalt
00050000-559b-9291-655d-c723d865fcbd	2231	Pernica
00050000-559b-9291-f192-4cd0d6ae857c	2211	Pesnica pri Mariboru
00050000-559b-9291-a836-090f8a8604f4	9203	Petrovci
00050000-559b-9291-d0e9-f7ed80ab150a	3301	Petrovče
00050000-559b-9291-a36e-ff05151372e3	6330	Piran/Pirano
00050000-559b-9291-34cc-f6148ebe1a2a	8255	Pišece
00050000-559b-9291-daa5-799e6c899602	6257	Pivka
00050000-559b-9291-0646-de7379976a79	6232	Planina
00050000-559b-9291-bd8d-efc95241d4f4	3225	Planina pri Sevnici
00050000-559b-9291-9bc3-fb79951ada48	6276	Pobegi
00050000-559b-9291-e13e-2684349104bd	8312	Podbočje
00050000-559b-9291-3708-85734b3f007a	5243	Podbrdo
00050000-559b-9291-9b8c-a10ac6c9931f	3254	Podčetrtek
00050000-559b-9291-806b-e93ac0f27140	2273	Podgorci
00050000-559b-9291-0956-14d90ea833bc	6216	Podgorje
00050000-559b-9291-a532-48163af9cc6e	2381	Podgorje pri Slovenj Gradcu
00050000-559b-9291-da47-8499669e00ee	6244	Podgrad
00050000-559b-9291-cedf-e7a35240cc35	1414	Podkum
00050000-559b-9291-64fa-429c4dce016d	2286	Podlehnik
00050000-559b-9291-901a-8a3c6b15279d	5272	Podnanos
00050000-559b-9291-9291-773341cb6d64	4244	Podnart
00050000-559b-9291-b489-2d9c271a742f	3241	Podplat
00050000-559b-9291-d374-db5bdb8502fc	3257	Podsreda
00050000-559b-9291-4b66-f53d1f4a9ed8	2363	Podvelka
00050000-559b-9291-2a83-deebd2220bf2	2208	Pohorje
00050000-559b-9291-7c21-32250ebd9767	2257	Polenšak
00050000-559b-9291-e5af-32244eeb73b9	1355	Polhov Gradec
00050000-559b-9291-3d0e-06cd3da759ca	4223	Poljane nad Škofjo Loko
00050000-559b-9291-79a1-c51cb2e66587	2319	Poljčane
00050000-559b-9291-b9d9-c57dbb87de04	1272	Polšnik
00050000-559b-9291-4c83-5bcac9e884b5	3313	Polzela
00050000-559b-9291-1dbb-4bd9c77fb83f	3232	Ponikva
00050000-559b-9291-7966-c88b403eac81	6320	Portorož/Portorose
00050000-559b-9291-3a8f-9bc9facb850b	6230	Postojna
00050000-559b-9291-4639-c5a3db07d672	2331	Pragersko
00050000-559b-9291-f4d4-fcbd450f02da	3312	Prebold
00050000-559b-9291-9f0c-423b937d0ac4	4205	Preddvor
00050000-559b-9291-3fbc-6f1f6dca2431	6255	Prem
00050000-559b-9291-fef9-900bbb8170b6	1352	Preserje
00050000-559b-9291-e761-dbe1e714f098	6258	Prestranek
00050000-559b-9291-d16d-ea1e39e17482	2391	Prevalje
00050000-559b-9291-f7e4-fd5932910805	3262	Prevorje
00050000-559b-9291-68fc-0169f0d3b9e9	1276	Primskovo 
00050000-559b-9291-061f-58155e5c3d2f	3253	Pristava pri Mestinju
00050000-559b-9291-123a-0034a1a2f2e5	9207	Prosenjakovci/Partosfalva
00050000-559b-9291-5708-a79665b70bae	5297	Prvačina
00050000-559b-9291-eb53-9428ec0a5823	2250	Ptuj
00050000-559b-9291-95f2-da15261facaa	2323	Ptujska Gora
00050000-559b-9291-2c2e-347da58cda1e	9201	Puconci
00050000-559b-9291-9513-4d3002ea5a80	2327	Rače
00050000-559b-9291-a90a-f5f2c3527ab5	1433	Radeče
00050000-559b-9291-5506-0680f8e9e737	9252	Radenci
00050000-559b-9291-7f76-e88d542273d9	2360	Radlje ob Dravi
00050000-559b-9291-455a-119911e0bc42	1235	Radomlje
00050000-559b-9291-1b2c-5207e3e538ad	4240	Radovljica
00050000-559b-9291-1e86-14300abfae32	8274	Raka
00050000-559b-9291-6dec-9f7a83c2c678	1381	Rakek
00050000-559b-9291-45a5-d9b89d33931d	4283	Rateče - Planica
00050000-559b-9291-36d3-e2c38cdbed9d	2390	Ravne na Koroškem
00050000-559b-9291-5ca0-549369269f8e	9246	Razkrižje
00050000-559b-9291-05e3-4a64986d157e	3332	Rečica ob Savinji
00050000-559b-9291-8d70-51fb842d8f34	5292	Renče
00050000-559b-9291-f4f5-5fec751b148f	1310	Ribnica
00050000-559b-9291-e5fa-0c3e6726e172	2364	Ribnica na Pohorju
00050000-559b-9291-5216-9f3f74fe405d	3272	Rimske Toplice
00050000-559b-9291-8b51-3d8cf7f4f4a1	1314	Rob
00050000-559b-9291-d780-f3ea66c475f9	5215	Ročinj
00050000-559b-9291-8b76-164a6e1df51c	3250	Rogaška Slatina
00050000-559b-9291-3471-9d40a644589c	9262	Rogašovci
00050000-559b-9291-38b0-7f69e80bf3d3	3252	Rogatec
00050000-559b-9291-229a-d792c17f4563	1373	Rovte
00050000-559b-9291-06ec-a252530b6438	2342	Ruše
00050000-559b-9291-646b-595b8f3795ec	1282	Sava
00050000-559b-9291-38bf-e68bd1e2efcf	6333	Sečovlje/Sicciole
00050000-559b-9291-066e-016a9624dc3e	4227	Selca
00050000-559b-9291-71d4-1fdea82fec98	2352	Selnica ob Dravi
00050000-559b-9291-ca2c-30b6f00422ee	8333	Semič
00050000-559b-9291-76b2-eb0a9d7eb403	8281	Senovo
00050000-559b-9291-7c6a-ed6f304604cd	6224	Senožeče
00050000-559b-9291-10ad-b69623071ef9	8290	Sevnica
00050000-559b-9291-e531-91643bc7939a	6210	Sežana
00050000-559b-9291-66f7-ad4faa0e8e78	2214	Sladki Vrh
00050000-559b-9291-aeeb-d91a6e11a550	5283	Slap ob Idrijci
00050000-559b-9291-76b3-50f62924afc9	2380	Slovenj Gradec
00050000-559b-9291-039c-258565dbac56	2310	Slovenska Bistrica
00050000-559b-9291-a02f-8d2aa01ce890	3210	Slovenske Konjice
00050000-559b-9291-7d86-881d70858f23	1216	Smlednik
00050000-559b-9291-bcc5-ec93b349287d	5232	Soča
00050000-559b-9291-7fa8-fac32be999f7	1317	Sodražica
00050000-559b-9291-3652-da3834a71f5e	3335	Solčava
00050000-559b-9291-12aa-5aa5c0075361	5250	Solkan
00050000-559b-9291-e80c-453daf488f2b	4229	Sorica
00050000-559b-9291-686b-51a22c4f55e2	4225	Sovodenj
00050000-559b-9291-7a2b-aeb40c46e2b4	5281	Spodnja Idrija
00050000-559b-9291-6dad-d1fcc35da96b	2241	Spodnji Duplek
00050000-559b-9291-039f-7787c3ede0eb	9245	Spodnji Ivanjci
00050000-559b-9291-0743-276c16e20ece	2277	Središče ob Dravi
00050000-559b-9291-9a11-510edf18abaf	4267	Srednja vas v Bohinju
00050000-559b-9291-cb6e-963992d60f56	8256	Sromlje 
00050000-559b-9291-8845-17c7504d2614	5224	Srpenica
00050000-559b-9291-9eeb-a385cca84616	1242	Stahovica
00050000-559b-9291-78e0-5a9c507e57a1	1332	Stara Cerkev
00050000-559b-9291-bc04-3fffaad5fac5	8342	Stari trg ob Kolpi
00050000-559b-9291-26f4-5e7d18ae0003	1386	Stari trg pri Ložu
00050000-559b-9291-3dcf-dfbce2787589	2205	Starše
00050000-559b-9291-2d6a-c7f4bc672a2e	2289	Stoperce
00050000-559b-9291-9a81-8778d46d2bd1	8322	Stopiče
00050000-559b-9291-07f5-6923bfb4cde6	3206	Stranice
00050000-559b-9291-c794-75a47f1b9500	8351	Straža
00050000-559b-9291-4b60-cc9850c0aa12	1313	Struge
00050000-559b-9291-4fb0-1018e0b9af28	8293	Studenec
00050000-559b-9291-e87e-d6378522035f	8331	Suhor
00050000-559b-9291-d6d9-c724a0b5951f	2233	Sv. Ana v Slovenskih goricah
00050000-559b-9291-00d2-d1f531865cee	2235	Sv. Trojica v Slovenskih goricah
00050000-559b-9291-6841-eeddea6b8405	2353	Sveti Duh na Ostrem Vrhu
00050000-559b-9291-7d14-933914b7125d	9244	Sveti Jurij ob Ščavnici
00050000-559b-9291-7cf8-e42005ded1c2	3264	Sveti Štefan
00050000-559b-9291-eaad-1d893df8dc50	2258	Sveti Tomaž
00050000-559b-9291-34f1-51c544d400c5	9204	Šalovci
00050000-559b-9291-9253-bc4adf493690	5261	Šempas
00050000-559b-9291-04d3-916436949221	5290	Šempeter pri Gorici
00050000-559b-9291-814e-bc5fc2e6eb58	3311	Šempeter v Savinjski dolini
00050000-559b-9291-302e-6b46d37155ad	4208	Šenčur
00050000-559b-9291-8b7f-cac1d3c2ec6d	2212	Šentilj v Slovenskih goricah
00050000-559b-9291-a02f-a0249806cc9a	8297	Šentjanž
00050000-559b-9291-0a6c-7b58ef9ca747	2373	Šentjanž pri Dravogradu
00050000-559b-9291-d79f-1ccd05211549	8310	Šentjernej
00050000-559b-9291-183a-10e7ff74e494	3230	Šentjur
00050000-559b-9291-4c80-03f72b2543aa	3271	Šentrupert
00050000-559b-9291-f7b6-7ab0ee75b4dd	8232	Šentrupert
00050000-559b-9291-1e9f-767815cbd536	1296	Šentvid pri Stični
00050000-559b-9291-2b51-41cf704a7513	8275	Škocjan
00050000-559b-9291-2c9e-42b37a4b71cf	6281	Škofije
00050000-559b-9291-5269-d4ea0065a3d3	4220	Škofja Loka
00050000-559b-9291-b50a-abee7a3783fd	3211	Škofja vas
00050000-559b-9291-6ae7-da7e77849edf	1291	Škofljica
00050000-559b-9291-d3ad-2de30b7c58cf	6274	Šmarje
00050000-559b-9291-455e-90677076d4bb	1293	Šmarje - Sap
00050000-559b-9291-072a-cb3bc61970ea	3240	Šmarje pri Jelšah
00050000-559b-9291-9a42-9e4274673225	8220	Šmarješke Toplice
00050000-559b-9291-9edc-4e5ea39f192a	2315	Šmartno na Pohorju
00050000-559b-9291-6c35-9f0ec45cf960	3341	Šmartno ob Dreti
00050000-559b-9291-7d54-a0f6ba815d4e	3327	Šmartno ob Paki
00050000-559b-9291-2aa2-fd8d08997806	1275	Šmartno pri Litiji
00050000-559b-9291-7cc8-7358e670141d	2383	Šmartno pri Slovenj Gradcu
00050000-559b-9291-5ec9-1055749e9d50	3201	Šmartno v Rožni dolini
00050000-559b-9291-e18e-c4110e9df26a	3325	Šoštanj
00050000-559b-9291-77c8-41d048717aa3	6222	Štanjel
00050000-559b-9291-09fe-2698886c3254	3220	Štore
00050000-559b-9291-ee6c-9dadec31f3d7	3304	Tabor
00050000-559b-9291-5340-31b763e139e8	3221	Teharje
00050000-559b-9291-6609-829bde4f5ae7	9251	Tišina
00050000-559b-9291-e77d-f1c75e2a1e7d	5220	Tolmin
00050000-559b-9291-3a24-50274227ce8b	3326	Topolšica
00050000-559b-9291-a2a4-b5cc36f79f10	2371	Trbonje
00050000-559b-9291-74d4-cb702d6c3f1c	1420	Trbovlje
00050000-559b-9291-b27e-0b9be4ebbef4	8231	Trebelno 
00050000-559b-9291-45c0-128207778962	8210	Trebnje
00050000-559b-9291-5294-d6fda3435d50	5252	Trnovo pri Gorici
00050000-559b-9291-d9fe-b6a2662a33ce	2254	Trnovska vas
00050000-559b-9291-7383-e367e4038486	1222	Trojane
00050000-559b-9291-782f-242bcf227b21	1236	Trzin
00050000-559b-9291-012f-a8cfb7d27f82	4290	Tržič
00050000-559b-9291-b7c0-65122ea8e0e7	8295	Tržišče
00050000-559b-9291-844a-93d4afd4e293	1311	Turjak
00050000-559b-9291-4c25-05641a52b732	9224	Turnišče
00050000-559b-9291-d5e4-0822868d742c	8323	Uršna sela
00050000-559b-9291-56c9-5c1c53e3e056	1252	Vače
00050000-559b-9291-e511-0abf68a4bf51	3320	Velenje 
00050000-559b-9291-8b4b-50a4b4c5d857	3322	Velenje - poštni predali
00050000-559b-9291-3339-81a745210287	8212	Velika Loka
00050000-559b-9291-2a8f-5b129647aa2f	2274	Velika Nedelja
00050000-559b-9291-6d66-d85a1aed699c	9225	Velika Polana
00050000-559b-9291-62c6-1c10621df4b4	1315	Velike Lašče
00050000-559b-9291-57db-cc44f02ef94c	8213	Veliki Gaber
00050000-559b-9291-d04e-e9763ea80dcb	9241	Veržej
00050000-559b-9291-26e1-55f1d210e19c	1312	Videm - Dobrepolje
00050000-559b-9291-df04-92e821fb4eda	2284	Videm pri Ptuju
00050000-559b-9291-cac5-34f826674a10	8344	Vinica
00050000-559b-9291-5162-b5aff1868d6b	5271	Vipava
00050000-559b-9291-dc71-75f837a2488b	4212	Visoko
00050000-559b-9291-e707-9e3dd2545ae5	1294	Višnja Gora
00050000-559b-9291-0337-78fb081b3c10	3205	Vitanje
00050000-559b-9291-fcb8-aad775a66e6b	2255	Vitomarci
00050000-559b-9291-91df-82ec9c671231	1217	Vodice
00050000-559b-9291-ba96-5b99a3f53bfd	3212	Vojnik\t
00050000-559b-9291-b2fa-2145a1f8f538	5293	Volčja Draga
00050000-559b-9291-81d0-0d2ec5e0dc49	2232	Voličina
00050000-559b-9291-e649-04d2a4c8280b	3305	Vransko
00050000-559b-9291-64b8-6e11c5057441	6217	Vremski Britof
00050000-559b-9291-e56d-8b32d97cf95c	1360	Vrhnika
00050000-559b-9291-7086-a5201eeee10d	2365	Vuhred
00050000-559b-9291-99e6-2d6b61ddcd26	2367	Vuzenica
00050000-559b-9291-a79e-c9137e9ce3bb	8292	Zabukovje 
00050000-559b-9291-33fa-7a5da7d42d97	1410	Zagorje ob Savi
00050000-559b-9291-e9da-09fa0a3db159	1303	Zagradec
00050000-559b-9291-7565-77da63c31ffa	2283	Zavrč
00050000-559b-9291-f093-7feaac6e388a	8272	Zdole 
00050000-559b-9291-f5d6-c84a10090880	4201	Zgornja Besnica
00050000-559b-9291-22e5-4450f461a5f2	2242	Zgornja Korena
00050000-559b-9291-294f-17c8e1599688	2201	Zgornja Kungota
00050000-559b-9291-2729-721787f7e47e	2316	Zgornja Ložnica
00050000-559b-9291-6924-39823975f32f	2314	Zgornja Polskava
00050000-559b-9291-4267-381b7b8cdeba	2213	Zgornja Velka
00050000-559b-9291-ef40-0a89aaba547b	4247	Zgornje Gorje
00050000-559b-9291-d6e5-81ecd55be7c0	4206	Zgornje Jezersko
00050000-559b-9291-3a63-b4c30abbabd1	2285	Zgornji Leskovec
00050000-559b-9291-5aa4-81d93c6cdcd9	1432	Zidani Most
00050000-559b-9291-b326-207cfe62fe85	3214	Zreče
00050000-559b-9291-6ef2-43f288cfd3dd	4209	Žabnica
00050000-559b-9291-f148-1c0fd05707a2	3310	Žalec
00050000-559b-9291-576e-835ff446fd5b	4228	Železniki
00050000-559b-9291-46b2-ea6dff2aec78	2287	Žetale
00050000-559b-9291-d40d-ad6cfaed71ff	4226	Žiri
00050000-559b-9291-628b-de7d2fc51bfc	4274	Žirovnica
00050000-559b-9291-4daa-ef3351a0d90e	8360	Žužemberk
\.


--
-- TOC entry 2881 (class 0 OID 9249347)
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
-- TOC entry 2863 (class 0 OID 9249158)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 9249236)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 9249359)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 9249666)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 9249677)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-559b-9293-ed9d-3091385da4c3	00080000-559b-9293-ee00-3daa46b2b623	0900	AK
00190000-559b-9293-e89a-511235c2d259	00080000-559b-9292-c957-536ecafab0ed	0987	A
00190000-559b-9293-3ebb-da41c3d6cb20	00080000-559b-9292-547e-f4a5b9d3ff9c	0989	A
00190000-559b-9293-b11f-92286f64bc49	00080000-559b-9292-e311-6d3bebfd5fec	0986	A
00190000-559b-9293-62fa-6a4a7104d3c1	00080000-559b-9292-46b3-ad0968a71da6	0984	A
00190000-559b-9293-b639-0fde87b24991	00080000-559b-9292-f818-0c3938300cb3	0983	A
00190000-559b-9293-c244-c1c69e7cd913	00080000-559b-9292-d051-432c675cdbf5	0982	A
\.


--
-- TOC entry 2905 (class 0 OID 9249647)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
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
-- TOC entry 2887 (class 0 OID 9249388)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-559b-9292-c7e0-4a65cc650b9c	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-559b-9292-a414-1611e53a0947	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-559b-9292-a4c2-228be0df1fb9	0003	Kazinska	t	84	Kazinska dvorana
00220000-559b-9292-869d-c0250cdf7e22	0004	Mali oder	t	24	Mali oder 
00220000-559b-9292-4fed-448f3badcec4	0005	Komorni oder	t	15	Komorni oder
00220000-559b-9292-433d-d3bc6fdd2930	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-559b-9292-f27e-2635a894a5c5	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2879 (class 0 OID 9249332)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 9249322)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 9249506)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 9249456)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 9249030)
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
-- TOC entry 2888 (class 0 OID 9249398)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 9249068)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-559b-9291-0500-6d36e5ece76c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-559b-9291-b596-e6ae2e5ecf20	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-559b-9291-307b-e7ff6cbe7db3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-559b-9291-90b1-3726fc3dfc1e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-559b-9291-5fd4-e35eb8098dd9	planer	Planer dogodkov v koledarju	t
00020000-559b-9291-4bbe-ce099e060edf	kadrovska	Kadrovska služba	t
00020000-559b-9291-1232-4e4cc1c1f1a5	arhivar	Ažuriranje arhivalij	t
00020000-559b-9291-f863-a35e41604e87	igralec	Igralec	t
00020000-559b-9291-5fdf-15085bd98117	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-559b-9292-aebb-29971a7dc178	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2854 (class 0 OID 9249052)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-559b-9291-214d-c9367912e8c9	00020000-559b-9291-307b-e7ff6cbe7db3
00010000-559b-9291-782c-3b5e10e011bc	00020000-559b-9291-307b-e7ff6cbe7db3
00010000-559b-9293-286f-d87b59993d2b	00020000-559b-9292-aebb-29971a7dc178
\.


--
-- TOC entry 2890 (class 0 OID 9249412)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 9249353)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 9249303)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 9249716)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-559b-9292-22ac-27d37a302640	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-559b-9292-5b40-76a19fd31e82	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-559b-9292-2b44-813aa42afc80	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-559b-9292-8416-f47108b8599d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-559b-9292-a5e5-2868932c10a9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2911 (class 0 OID 9249708)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-559b-9292-3171-ce63b5f54fbc	00230000-559b-9292-8416-f47108b8599d	popa
00240000-559b-9292-b7e3-6aef3ba20a85	00230000-559b-9292-8416-f47108b8599d	oseba
00240000-559b-9292-57cb-52fc6804f993	00230000-559b-9292-5b40-76a19fd31e82	prostor
00240000-559b-9292-5cdc-64c5dce2b1ef	00230000-559b-9292-8416-f47108b8599d	besedilo
00240000-559b-9292-c5a9-415fea403c33	00230000-559b-9292-8416-f47108b8599d	uprizoritev
00240000-559b-9292-cbc4-05f8ff62aaef	00230000-559b-9292-8416-f47108b8599d	funkcija
00240000-559b-9292-84d9-6d5081dab431	00230000-559b-9292-8416-f47108b8599d	tipfunkcije
00240000-559b-9292-90ab-a9149e2541f7	00230000-559b-9292-8416-f47108b8599d	alternacija
00240000-559b-9292-5f14-21362b4bf8d6	00230000-559b-9292-22ac-27d37a302640	pogodba
00240000-559b-9292-8681-430adef15fc0	00230000-559b-9292-8416-f47108b8599d	zaposlitev
00240000-559b-9292-0c1f-ec88d4edace3	00230000-559b-9292-22ac-27d37a302640	programdela
\.


--
-- TOC entry 2910 (class 0 OID 9249703)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 9249466)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-559b-9293-d7be-5f7ed11f87d3	000e0000-559b-9293-b2b5-0626f6a3889f	00080000-559b-9292-6616-7f100c82e09b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-559b-9293-6ffc-69745d417531	000e0000-559b-9293-b2b5-0626f6a3889f	00080000-559b-9292-6616-7f100c82e09b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-559b-9293-f55a-914a5747f1bc	000e0000-559b-9293-b2b5-0626f6a3889f	00080000-559b-9292-1844-0e30542eaed2	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2861 (class 0 OID 9249130)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 9249309)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-559b-9293-cad3-a8dba7a36cf5	00180000-559b-9293-abe8-a196164aba83	000c0000-559b-9293-8a06-1749ea68cea4	00090000-559b-9293-f103-289a3922cfda	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-9293-f8b6-5294c4dd58fe	00180000-559b-9293-abe8-a196164aba83	000c0000-559b-9293-93df-b84dc30302fe	00090000-559b-9293-354f-6f41ee2c6e4f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-9293-f5f4-710b6fc1ef2f	00180000-559b-9293-abe8-a196164aba83	000c0000-559b-9293-93d0-117453bfc8fe	00090000-559b-9293-1ec8-b636a7a8bacf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-9293-2f3b-a601648fc3ac	00180000-559b-9293-abe8-a196164aba83	000c0000-559b-9293-f629-f0864d02fafb	00090000-559b-9293-5dbf-579c22d80c09	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-9293-a2d9-26cab1699cbe	00180000-559b-9293-abe8-a196164aba83	000c0000-559b-9293-200f-c8918b35552b	00090000-559b-9293-264b-999b3b0b1187	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-559b-9293-8ac8-22afbb0bbc47	00180000-559b-9293-f9eb-d888f283d9c3	\N	00090000-559b-9293-264b-999b3b0b1187	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2897 (class 0 OID 9249495)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-559b-9292-f1e5-26185bd7321c	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-559b-9292-b8eb-1eedf47bcd3c	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-559b-9292-1aa3-09e5f7d01a29	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-559b-9292-3dd4-536515533f6c	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-559b-9292-f509-d07595854c03	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-559b-9292-f026-042259ad69e5	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-559b-9292-28cc-25dff78fb42d	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-559b-9292-4ee8-a40ce105b665	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-559b-9292-0d22-a720ed7d8423	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-559b-9292-8ddb-d5cac7d2dbb3	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-559b-9292-a71c-423ba187ad4b	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-559b-9292-fcd5-4b56e8dfd1c5	Lektor	Lektorji	t	Lektorica	umetnik
000f0000-559b-9292-e636-82199bc6eb4c	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-559b-9292-055c-d54414dc5d35	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-559b-9292-1562-22fdcd7f471d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-559b-9292-7be8-25f92d7bef6b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2908 (class 0 OID 9249685)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-559b-9292-8c57-3d40603a23ce	01	Velika predstava	f	1.00	1.00
002b0000-559b-9292-a75e-dd6dce36e172	02	Mala predstava	f	0.50	0.50
002b0000-559b-9292-ab51-21539e480adc	03	Mala koprodukcija	t	0.40	1.00
002b0000-559b-9292-7ec5-702701f83252	04	Srednja koprodukcija	t	0.70	2.00
002b0000-559b-9292-2856-0dd5e8a55b39	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2866 (class 0 OID 9249193)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 9249039)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-559b-9291-782c-3b5e10e011bc	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO3V/CQvs3i.4dcBPaKZDUWnRtyPqMnUK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-559b-9292-22f1-e2134722cac8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-559b-9292-f759-e9aa36edfbf5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-559b-9292-6479-013c8db0e8bd	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-559b-9292-be8e-1eeda010231f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-559b-9292-105e-8fb75d1e9044	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-559b-9292-2499-14a7e9a8ceba	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-559b-9292-af8e-bb0d6a085e0a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-559b-9293-586b-6af49851e937	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-559b-9293-cba2-87d0e78451d3	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-559b-9293-286f-d87b59993d2b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-559b-9291-214d-c9367912e8c9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2901 (class 0 OID 9249544)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-559b-9293-297a-d3049d9bdf80	00160000-559b-9292-d97a-b2824dce11fb	00150000-559b-9292-1ecf-3dba6d5f8ffe	00140000-559b-9291-daa4-9772ac71ebb2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-559b-9292-4fed-448f3badcec4
000e0000-559b-9293-b2b5-0626f6a3889f	00160000-559b-9292-461d-f8e61a2c4ace	00150000-559b-9292-2191-a8cd09ec7a7a	00140000-559b-9291-4790-a4639bddb453	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-559b-9292-433d-d3bc6fdd2930
000e0000-559b-9293-a040-d9ce0cd0d7bc	\N	00150000-559b-9292-2191-a8cd09ec7a7a	00140000-559b-9291-4790-a4639bddb453	00190000-559b-9293-e89a-511235c2d259	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-559b-9292-4fed-448f3badcec4
000e0000-559b-9293-5d3f-b9cd7dcd808f	\N	00150000-559b-9292-2191-a8cd09ec7a7a	00140000-559b-9291-4790-a4639bddb453	00190000-559b-9293-e89a-511235c2d259	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-559b-9292-4fed-448f3badcec4
000e0000-559b-9293-559a-b3a465989950	\N	00150000-559b-9292-2191-a8cd09ec7a7a	00140000-559b-9291-4790-a4639bddb453	00190000-559b-9293-e89a-511235c2d259	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-559b-9292-c7e0-4a65cc650b9c
\.


--
-- TOC entry 2871 (class 0 OID 9249255)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-559b-9293-ad8f-714b4a09a988	000e0000-559b-9293-b2b5-0626f6a3889f	1	
00200000-559b-9293-68a4-fe5195414604	000e0000-559b-9293-b2b5-0626f6a3889f	2	
\.


--
-- TOC entry 2886 (class 0 OID 9249380)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 9249449)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 9249287)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 9249534)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-559b-9291-daa4-9772ac71ebb2	01	Drama	drama (SURS 01)
00140000-559b-9291-8c0b-e1de5b89cea8	02	Opera	opera (SURS 02)
00140000-559b-9291-450e-31cca35d9c5e	03	Balet	balet (SURS 03)
00140000-559b-9291-8638-e76aa48a18f4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-559b-9291-24a4-a43f8433fbab	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-559b-9291-4790-a4639bddb453	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-559b-9291-36b8-59e8b3683acb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2892 (class 0 OID 9249439)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-559b-9292-a674-89b85da66fa6	01	Opera	opera
00150000-559b-9292-584e-844cc85db21a	02	Opereta	opereta
00150000-559b-9292-7ffa-06e8fb0b8c88	03	Balet	balet
00150000-559b-9292-3aa1-cac69457cf91	04	Plesne prireditve	plesne prireditve
00150000-559b-9292-1a1a-85baf9c89419	05	Lutkovno gledališče	lutkovno gledališče
00150000-559b-9292-8e1a-e40b8664ecb1	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-559b-9292-cbb8-d7865bc49545	07	Biografska drama	biografska drama
00150000-559b-9292-1ecf-3dba6d5f8ffe	08	Komedija	komedija
00150000-559b-9292-a28d-95a0dafaf795	09	Črna komedija	črna komedija
00150000-559b-9292-2670-5a11ad12e812	10	E-igra	E-igra
00150000-559b-9292-2191-a8cd09ec7a7a	11	Kriminalka	kriminalka
00150000-559b-9292-1ef2-ba9cd13a2951	12	Musical	musical
\.


--
-- TOC entry 2445 (class 2606 OID 9249093)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 9249591)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 9249581)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 9249494)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 9249277)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 9249302)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 9249701)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 9249219)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 9249642)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 9249435)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 9249253)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 9249296)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 9249233)
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
-- TOC entry 2537 (class 2606 OID 9249345)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 9249372)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 9249191)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 9249102)
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
-- TOC entry 2452 (class 2606 OID 9249126)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 9249082)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2436 (class 2606 OID 9249067)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 9249378)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 9249411)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 9249529)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 9249155)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 9249179)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 9249351)
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
-- TOC entry 2467 (class 2606 OID 9249169)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 9249240)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 9249363)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 9249674)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 9249682)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 9249664)
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
-- TOC entry 2557 (class 2606 OID 9249395)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 9249336)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 9249327)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 9249516)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 9249463)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 9249038)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 9249402)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 9249056)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2438 (class 2606 OID 9249076)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 9249420)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 9249358)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 9249308)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 9249725)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 9249713)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 9249707)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 9249476)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 9249135)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 9249318)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 9249505)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 9249695)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 9249204)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 9249051)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 9249560)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 9249262)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 9249386)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 9249454)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 9249291)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 9249542)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 9249447)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 1259 OID 9249284)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2585 (class 1259 OID 9249477)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 9249478)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 9249157)
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
-- TOC entry 2550 (class 1259 OID 9249379)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2544 (class 1259 OID 9249365)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 9249364)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2496 (class 1259 OID 9249263)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 9249436)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 9249438)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2574 (class 1259 OID 9249437)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 9249235)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 9249234)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 9249531)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2596 (class 1259 OID 9249532)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 9249533)
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
-- TOC entry 2604 (class 1259 OID 9249565)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2605 (class 1259 OID 9249562)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2606 (class 1259 OID 9249566)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2607 (class 1259 OID 9249564)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2608 (class 1259 OID 9249563)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2474 (class 1259 OID 9249206)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 9249205)
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
-- TOC entry 2450 (class 1259 OID 9249129)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 9249403)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2514 (class 1259 OID 9249297)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 9249083)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2441 (class 1259 OID 9249084)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2565 (class 1259 OID 9249423)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2566 (class 1259 OID 9249422)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2567 (class 1259 OID 9249421)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2488 (class 1259 OID 9249241)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 9249243)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2490 (class 1259 OID 9249242)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 9249715)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2524 (class 1259 OID 9249331)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2525 (class 1259 OID 9249329)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2526 (class 1259 OID 9249328)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2527 (class 1259 OID 9249330)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2431 (class 1259 OID 9249057)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 9249058)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2553 (class 1259 OID 9249387)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2539 (class 1259 OID 9249352)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2581 (class 1259 OID 9249464)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2582 (class 1259 OID 9249465)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 9249646)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2626 (class 1259 OID 9249643)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 9249644)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2628 (class 1259 OID 9249645)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2463 (class 1259 OID 9249171)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 9249170)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2465 (class 1259 OID 9249172)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2424 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2632 (class 1259 OID 9249675)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2633 (class 1259 OID 9249676)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2618 (class 1259 OID 9249595)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2619 (class 1259 OID 9249596)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2620 (class 1259 OID 9249593)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2621 (class 1259 OID 9249594)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2578 (class 1259 OID 9249455)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 9249340)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2531 (class 1259 OID 9249339)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2532 (class 1259 OID 9249337)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2533 (class 1259 OID 9249338)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2614 (class 1259 OID 9249583)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2615 (class 1259 OID 9249582)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2629 (class 1259 OID 9249665)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2495 (class 1259 OID 9249254)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 9249702)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2446 (class 1259 OID 9249104)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2447 (class 1259 OID 9249103)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2455 (class 1259 OID 9249136)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 9249137)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2519 (class 1259 OID 9249321)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 9249320)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2521 (class 1259 OID 9249319)
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
-- TOC entry 2502 (class 1259 OID 9249286)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2503 (class 1259 OID 9249282)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2504 (class 1259 OID 9249279)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2505 (class 1259 OID 9249280)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2506 (class 1259 OID 9249278)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2507 (class 1259 OID 9249283)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2508 (class 1259 OID 9249281)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2462 (class 1259 OID 9249156)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 9249220)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 9249222)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2482 (class 1259 OID 9249221)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2483 (class 1259 OID 9249223)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2538 (class 1259 OID 9249346)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2600 (class 1259 OID 9249530)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 9249561)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2453 (class 1259 OID 9249127)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 9249128)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 9249448)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 9249726)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 9249192)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 9249714)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2558 (class 1259 OID 9249397)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2559 (class 1259 OID 9249396)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 9249592)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2470 (class 1259 OID 9249180)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 9249543)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 9249683)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 9249684)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2439 (class 1259 OID 9249077)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2509 (class 1259 OID 9249285)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2681 (class 2606 OID 9249862)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 9249847)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2679 (class 2606 OID 9249852)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2683 (class 2606 OID 9249872)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2677 (class 2606 OID 9249842)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2682 (class 2606 OID 9249867)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 9249857)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2712 (class 2606 OID 9250017)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 9250022)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 9249777)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 9249957)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2699 (class 2606 OID 9249952)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2698 (class 2606 OID 9249947)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 9249837)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 9249987)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 9249997)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2707 (class 2606 OID 9249992)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2671 (class 2606 OID 9249812)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2670 (class 2606 OID 9249807)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 9249937)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 9250027)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 9250032)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2716 (class 2606 OID 9250037)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2720 (class 2606 OID 9250057)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2717 (class 2606 OID 9250042)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 9250062)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2719 (class 2606 OID 9250052)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 9250047)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2669 (class 2606 OID 9249802)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 9249797)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 9249762)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2660 (class 2606 OID 9249757)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 9249967)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 9249877)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2656 (class 2606 OID 9249737)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2657 (class 2606 OID 9249742)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2705 (class 2606 OID 9249982)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2704 (class 2606 OID 9249977)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2703 (class 2606 OID 9249972)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2672 (class 2606 OID 9249817)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2674 (class 2606 OID 9249827)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2673 (class 2606 OID 9249822)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 9250142)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2691 (class 2606 OID 9249912)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2689 (class 2606 OID 9249902)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2688 (class 2606 OID 9249897)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2690 (class 2606 OID 9249907)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 9249727)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 9249732)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2701 (class 2606 OID 9249962)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2697 (class 2606 OID 9249942)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2710 (class 2606 OID 9250007)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2711 (class 2606 OID 9250012)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 9250112)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2728 (class 2606 OID 9250097)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 9250102)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2730 (class 2606 OID 9250107)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 9249787)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 9249782)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 9249792)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2733 (class 2606 OID 9250122)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2734 (class 2606 OID 9250127)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2726 (class 2606 OID 9250087)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 9250092)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2724 (class 2606 OID 9250077)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 9250082)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2709 (class 2606 OID 9250002)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 9249932)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2694 (class 2606 OID 9249927)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2692 (class 2606 OID 9249917)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2693 (class 2606 OID 9249922)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 9250072)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 9250067)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2732 (class 2606 OID 9250117)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2675 (class 2606 OID 9249832)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 9250132)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 9250137)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2659 (class 2606 OID 9249752)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2658 (class 2606 OID 9249747)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2662 (class 2606 OID 9249767)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 9249772)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2687 (class 2606 OID 9249892)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 9249887)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2685 (class 2606 OID 9249882)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-07 10:49:24 CEST

--
-- PostgreSQL database dump complete
--

