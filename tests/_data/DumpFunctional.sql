--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-03 11:15:24 CEST

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
-- TOC entry 183 (class 1259 OID 8944625)
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
-- TOC entry 228 (class 1259 OID 8945124)
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
-- TOC entry 227 (class 1259 OID 8945107)
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
-- TOC entry 221 (class 1259 OID 8945019)
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
-- TOC entry 197 (class 1259 OID 8944804)
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
-- TOC entry 200 (class 1259 OID 8944838)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8945232)
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
-- TOC entry 192 (class 1259 OID 8944747)
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
-- TOC entry 229 (class 1259 OID 8945137)
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
-- TOC entry 216 (class 1259 OID 8944964)
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
-- TOC entry 195 (class 1259 OID 8944784)
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
-- TOC entry 199 (class 1259 OID 8944832)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8944764)
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
-- TOC entry 205 (class 1259 OID 8944881)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8944906)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8944721)
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
-- TOC entry 184 (class 1259 OID 8944634)
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
-- TOC entry 185 (class 1259 OID 8944645)
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
-- TOC entry 180 (class 1259 OID 8944599)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8944618)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8944913)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8944944)
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
-- TOC entry 224 (class 1259 OID 8945057)
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
-- TOC entry 187 (class 1259 OID 8944678)
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
-- TOC entry 189 (class 1259 OID 8944713)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8944887)
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
-- TOC entry 188 (class 1259 OID 8944698)
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
-- TOC entry 194 (class 1259 OID 8944776)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8944899)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 8945202)
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
-- TOC entry 232 (class 1259 OID 8945213)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 8945183)
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
-- TOC entry 212 (class 1259 OID 8944928)
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
-- TOC entry 204 (class 1259 OID 8944872)
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
-- TOC entry 203 (class 1259 OID 8944862)
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
-- TOC entry 223 (class 1259 OID 8945046)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8944996)
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
-- TOC entry 177 (class 1259 OID 8944570)
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
-- TOC entry 176 (class 1259 OID 8944568)
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
-- TOC entry 213 (class 1259 OID 8944938)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8944608)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8944592)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8944952)
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
-- TOC entry 207 (class 1259 OID 8944893)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8944843)
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
-- TOC entry 237 (class 1259 OID 8945252)
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
-- TOC entry 236 (class 1259 OID 8945244)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8945239)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8945006)
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
-- TOC entry 186 (class 1259 OID 8944670)
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
-- TOC entry 202 (class 1259 OID 8944849)
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
-- TOC entry 222 (class 1259 OID 8945035)
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
-- TOC entry 233 (class 1259 OID 8945221)
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
-- TOC entry 191 (class 1259 OID 8944733)
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
-- TOC entry 178 (class 1259 OID 8944579)
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
-- TOC entry 226 (class 1259 OID 8945084)
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
-- TOC entry 196 (class 1259 OID 8944795)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8944920)
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
-- TOC entry 218 (class 1259 OID 8944989)
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
-- TOC entry 198 (class 1259 OID 8944827)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 8945074)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8944979)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8944573)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8944625)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8945124)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5596-52ab-900c-cab5ae3af0a4	000d0000-5596-52ab-0b06-f2cef5e05b49	\N	00090000-5596-52ab-b9dd-bf81ce31995f	000b0000-5596-52ab-197d-6d75ca676f16	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-52ab-6101-92af3c257384	000d0000-5596-52ab-2275-6bb4276a618d	\N	00090000-5596-52ab-96c1-aa4e9777156c	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-52ab-5d34-e6957cf2d967	000d0000-5596-52ab-dfe4-9a2a22d24471	\N	00090000-5596-52ab-0c27-78d230880acc	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-52ab-da33-62f95806b7ab	000d0000-5596-52ab-98aa-c97c0de77cb7	\N	00090000-5596-52ab-ae92-c67de6bfcaab	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-52ab-dc18-b88e15899e16	000d0000-5596-52ab-db21-56fc6c4691a4	\N	00090000-5596-52ab-04a5-83992ff65532	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-52ab-9555-31d563f8f9b6	000d0000-5596-52ab-45d3-e3ba6ddb5e5e	\N	00090000-5596-52ab-96c1-aa4e9777156c	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 8945107)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8945019)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5596-52ab-12ba-eace8ff7e70f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5596-52ab-914d-fdf6b505f4d5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5596-52ab-c227-1c68e9b05174	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8944804)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5596-52ab-2365-c2d9e54024c6	\N	\N	00200000-5596-52ab-3e69-5354f1faf1f2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5596-52ab-3404-aef4cc69144c	\N	\N	00200000-5596-52ab-b0cf-9b5a2b5c735e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5596-52ab-03e3-9417b9ee72b8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5596-52ab-104c-acd4d1caaa60	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5596-52ab-c0d8-36f6d7f31cb7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8944838)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8945232)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8944747)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5596-52a9-9ed0-9ec915b82129	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5596-52a9-a2cb-8d88f1320925	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5596-52a9-9210-cd911c8d64be	AL	ALB	008	Albania 	Albanija	\N
00040000-5596-52a9-5922-18c2508c34cd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5596-52a9-660d-bdba6eb7255e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5596-52a9-4243-a93d6dcb47ab	AD	AND	020	Andorra 	Andora	\N
00040000-5596-52a9-92ac-7e34b05ab2bc	AO	AGO	024	Angola 	Angola	\N
00040000-5596-52a9-6297-0162e63e5bfb	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5596-52a9-a11a-4fbe4cf5a249	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5596-52a9-e601-d9629553a3a9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-52a9-8c30-f0aeebe89af5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5596-52a9-4384-09101678faef	AM	ARM	051	Armenia 	Armenija	\N
00040000-5596-52a9-319f-c9d5b25592f6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5596-52a9-f13c-41db2aeef13b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5596-52a9-8245-a244f8a81d07	AT	AUT	040	Austria 	Avstrija	\N
00040000-5596-52a9-101f-9487aec3947f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5596-52a9-1c65-3ab7cecad822	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5596-52a9-555a-fa7541a6b1e3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5596-52a9-8014-808d19a1aae5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5596-52a9-fc0d-b4f424b2e0a6	BB	BRB	052	Barbados 	Barbados	\N
00040000-5596-52a9-27bc-76d1406ce678	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5596-52a9-b0c2-d58080b55fd1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5596-52a9-d500-3a32e64cae98	BZ	BLZ	084	Belize 	Belize	\N
00040000-5596-52a9-d7f2-98fc2ee79b23	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5596-52a9-cbac-a088ed7b1722	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5596-52a9-c2d5-e7135c1b160f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5596-52a9-44d4-3a4b92ce05ec	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5596-52a9-c676-e438cf2f1442	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5596-52a9-3581-c3337cc937bd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5596-52a9-f9a4-9cc8393a007f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5596-52a9-49c8-0d4f2851f368	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5596-52a9-b2b0-a7797c64041d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5596-52a9-fb40-0f7d8c3d2773	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5596-52a9-1142-63ca481a93de	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5596-52a9-de34-4c4d29afdfab	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5596-52a9-af74-703ddf1dd552	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5596-52a9-0897-4bb1a5f53b12	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5596-52a9-3eb4-5e3cb85e04ad	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5596-52a9-217c-6404094edd12	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5596-52a9-3742-d25d640e8826	CA	CAN	124	Canada 	Kanada	\N
00040000-5596-52a9-9ef7-f80ed6f7c770	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5596-52a9-fc9b-6f1f829f019b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5596-52a9-249a-568e0fc74376	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5596-52a9-d422-b550d73d60e0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5596-52a9-3ce4-b8661cdb2887	CL	CHL	152	Chile 	Čile	\N
00040000-5596-52a9-e8d7-6f459ce639f8	CN	CHN	156	China 	Kitajska	\N
00040000-5596-52a9-84ee-8c7b49e744bb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5596-52a9-cb7e-50285c18db93	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5596-52a9-0d63-7c9bbb20732d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5596-52a9-bfde-a7cb613a62bc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5596-52a9-10b5-5b25c3135318	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5596-52a9-4aa4-e237bedcca4b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5596-52a9-8a0a-ab3fbbf9643c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5596-52a9-238d-a501f10d114f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5596-52a9-0fdc-bedbdb88eb86	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5596-52a9-6603-0091f1412eff	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5596-52a9-87ca-d850e3e82098	CU	CUB	192	Cuba 	Kuba	\N
00040000-5596-52a9-1445-168e012339e4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5596-52a9-1052-a34c886faa60	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5596-52a9-62ac-1772012b9098	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5596-52a9-406b-cd117b6ce2c8	DK	DNK	208	Denmark 	Danska	\N
00040000-5596-52a9-b450-8130be90a7bc	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5596-52a9-796e-3c2fb5044c6e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-52a9-437d-7e97d7533816	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5596-52a9-fabd-33bfe442dee9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5596-52a9-5300-1c12d3826d37	EG	EGY	818	Egypt 	Egipt	\N
00040000-5596-52a9-dd6c-23d5224d485d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5596-52a9-e453-846aab367f0c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5596-52a9-b27a-73319b6b3f92	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5596-52a9-a88c-f549eb187681	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5596-52a9-4f2d-025b430f3476	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5596-52a9-601c-7a81c45364ec	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5596-52a9-38d6-54bb76fb50d9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5596-52a9-3f47-20748e55f860	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5596-52a9-cdb7-c6236e851def	FI	FIN	246	Finland 	Finska	\N
00040000-5596-52a9-2684-117ef5764ea1	FR	FRA	250	France 	Francija	\N
00040000-5596-52a9-cb43-7c36a545c914	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5596-52a9-9709-7b0faf27cd35	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5596-52a9-89d2-940395609663	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5596-52a9-b6c2-77001b6ef3f0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5596-52a9-0869-bda94e847183	GA	GAB	266	Gabon 	Gabon	\N
00040000-5596-52a9-0bf3-b051e69a00f9	GM	GMB	270	Gambia 	Gambija	\N
00040000-5596-52a9-5e0e-efb68efda3dc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5596-52a9-5b00-97c5013292fa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5596-52a9-810f-d688e81c4e7e	GH	GHA	288	Ghana 	Gana	\N
00040000-5596-52a9-d6dc-298dc42f6dec	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5596-52a9-009e-8f9970aedb13	GR	GRC	300	Greece 	Grčija	\N
00040000-5596-52a9-2f28-5fc744f60008	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5596-52a9-93aa-23fa35eaba7d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5596-52a9-98ce-aeedd07d032e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5596-52a9-6b8e-de13db3a4922	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5596-52a9-ca4c-02c7e63e2709	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5596-52a9-344b-edefc2a5deef	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5596-52a9-bcf1-60d613319023	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5596-52a9-6e26-ad93c3dda41c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5596-52a9-3450-9bf22d3a75d1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5596-52a9-7fd3-61b7a0825199	HT	HTI	332	Haiti 	Haiti	\N
00040000-5596-52a9-2e60-1785b12c1e84	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5596-52a9-ee2d-ccc36c4f2065	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5596-52a9-91eb-3b42e6316b6d	HN	HND	340	Honduras 	Honduras	\N
00040000-5596-52a9-7c3b-006f4596cbae	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5596-52a9-3b43-9aea04fb5820	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5596-52a9-1694-01f90833eab0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5596-52a9-3517-08a9fa3dfcfe	IN	IND	356	India 	Indija	\N
00040000-5596-52a9-3bd4-4eb2fb5f6b6f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5596-52a9-6654-1387aa7c95ec	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5596-52a9-08d2-0540e862b5b2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5596-52a9-db19-0abca413eec3	IE	IRL	372	Ireland 	Irska	\N
00040000-5596-52a9-265d-48843fcd82ed	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5596-52a9-0c34-6e2b6c293760	IL	ISR	376	Israel 	Izrael	\N
00040000-5596-52a9-7d78-e5f5952117a7	IT	ITA	380	Italy 	Italija	\N
00040000-5596-52a9-e4c1-c61cd4e2a2b6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5596-52a9-2338-b3c7d59841e1	JP	JPN	392	Japan 	Japonska	\N
00040000-5596-52a9-402e-7b804fd3d501	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5596-52a9-295b-89e3186c186f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5596-52a9-3839-4c111f3c1f8f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5596-52a9-6d8b-95beb0564dee	KE	KEN	404	Kenya 	Kenija	\N
00040000-5596-52a9-f1fa-17c6303a7192	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5596-52a9-6036-287f7ecbffc8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5596-52a9-28e8-a31466ccfdf4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5596-52a9-5984-50763c57a205	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5596-52a9-e551-ef34401b860e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5596-52a9-08ac-064e379836aa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5596-52a9-6cfa-8f14b25f11fd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5596-52a9-dcd4-0ec6a1aba5d2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5596-52a9-b007-408a2126380b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5596-52a9-df7b-3e8cf351b9d3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5596-52a9-b847-6fb65590aefe	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5596-52a9-51fd-b8b660522c0f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5596-52a9-ae8d-b26fa86cdd10	LT	LTU	440	Lithuania 	Litva	\N
00040000-5596-52a9-02a5-1c47f6fa58f0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5596-52a9-5f1e-c0c8e86e7b4e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5596-52a9-7c7a-f451efc97174	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5596-52a9-7875-a1afda7f24da	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5596-52a9-bd2b-300e43938d7c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5596-52a9-4806-eb012e0904a5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5596-52a9-d42c-d9c0f29bf0ee	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5596-52a9-1218-9a09e159fe6a	ML	MLI	466	Mali 	Mali	\N
00040000-5596-52a9-37c5-3ae41184d44d	MT	MLT	470	Malta 	Malta	\N
00040000-5596-52a9-8413-b3118a748dd2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5596-52a9-ea3f-364103f7d118	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5596-52a9-363f-0dd827437f68	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5596-52a9-7d31-e014d6f6f42b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5596-52a9-31ac-a80ad5405017	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5596-52a9-0b40-9edf6efc206b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5596-52a9-ae06-9f1311dc2481	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5596-52a9-e74f-08501fade670	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5596-52a9-b8f2-96076f60d3b4	MC	MCO	492	Monaco 	Monako	\N
00040000-5596-52a9-64b8-dbf5081b2537	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5596-52a9-9a30-42241e9173e0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5596-52a9-12ad-c4a68c8e4b1c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5596-52a9-5d1a-76a198564e0b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5596-52a9-ccaa-6e505127a910	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5596-52a9-8ccd-59334176d1ce	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5596-52a9-023f-80c16794c66a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5596-52a9-d240-03e1378557c1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5596-52a9-b51f-1a7d429ae3b6	NP	NPL	524	Nepal 	Nepal	\N
00040000-5596-52a9-4164-4090fc4d07c6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5596-52a9-b2c2-2800eaa1ae97	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5596-52a9-cce0-ecbb1ecf3dbf	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5596-52a9-959a-295293bf2b5b	NE	NER	562	Niger 	Niger 	\N
00040000-5596-52a9-54b2-026da590782e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5596-52a9-85e0-e535879e2060	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5596-52a9-2888-5bf7d8fe77a9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5596-52a9-5f36-721cdef0cfe5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5596-52a9-814f-9eaec8ecd6d4	NO	NOR	578	Norway 	Norveška	\N
00040000-5596-52a9-c8c4-2a42f3811f52	OM	OMN	512	Oman 	Oman	\N
00040000-5596-52a9-d636-30418a02c81f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5596-52a9-b874-defb9232607e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5596-52a9-a5a5-c31d59e262af	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5596-52a9-60cc-102590ba0193	PA	PAN	591	Panama 	Panama	\N
00040000-5596-52a9-af4b-d65410a84152	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5596-52a9-d62b-9bd6205a5fe6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5596-52a9-516a-b94b37b7b390	PE	PER	604	Peru 	Peru	\N
00040000-5596-52a9-8bdb-e3ea2ae1a1e6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5596-52a9-5bb8-389b61cf71c0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5596-52a9-b8e9-f1a5ebd99411	PL	POL	616	Poland 	Poljska	\N
00040000-5596-52a9-db33-6f5f2ca2f874	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5596-52a9-2e11-89e7391cec00	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5596-52a9-5d09-b11487c219f9	QA	QAT	634	Qatar 	Katar	\N
00040000-5596-52a9-8528-70dbf5f9139c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5596-52a9-e899-814b28df744a	RO	ROU	642	Romania 	Romunija	\N
00040000-5596-52a9-93ec-238c1608ca80	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5596-52a9-2ad2-1b96eb0bfd17	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5596-52a9-643a-570727125f3f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5596-52a9-db82-687520c08f09	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5596-52a9-4572-05cf70659258	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5596-52a9-f6b9-4ddf8e4a3656	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5596-52a9-8d0f-ceaff1aea579	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5596-52a9-c8a3-3b803b44a699	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5596-52a9-8906-c20e33790f8a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5596-52a9-8d9e-5aaa2c19bb88	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5596-52a9-5478-6e598b37b05a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5596-52a9-fb7b-1aaa69633a39	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5596-52a9-2296-84d6739707de	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5596-52a9-50c6-33a72314c109	SN	SEN	686	Senegal 	Senegal	\N
00040000-5596-52a9-469e-35f95a042b94	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5596-52a9-1235-2af4ab37b032	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5596-52a9-dfe0-ed4d3c624f92	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5596-52a9-f636-9ebdedd0c060	SG	SGP	702	Singapore 	Singapur	\N
00040000-5596-52a9-c00e-8daca43628d0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5596-52a9-aea8-9108ebba8e22	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5596-52a9-f67a-b6cd09f99c24	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5596-52a9-220f-b9f1dce50f65	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5596-52a9-12e3-541bec85ffd9	SO	SOM	706	Somalia 	Somalija	\N
00040000-5596-52a9-4ef8-fad41f1f6b27	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5596-52a9-3bed-89e71b4a4c8e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5596-52a9-285e-f52756a1e79f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5596-52a9-7977-6018a986b61f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5596-52a9-e9aa-1594df2529e5	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5596-52a9-c392-8e458ba74bb0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5596-52a9-3739-b833b0040c2c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5596-52a9-1f30-a2db8d4b6e45	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5596-52a9-1337-4d334d9ab59d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5596-52a9-3fc1-fce8deee05c9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5596-52a9-7eee-1d6fdb0cd6ee	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5596-52a9-d315-daf3db6c3743	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5596-52a9-f384-3a74592ccb7c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5596-52a9-3595-0993328b60e9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5596-52a9-50d1-b5a009295a7e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5596-52a9-4d6b-931d6daaa359	TH	THA	764	Thailand 	Tajska	\N
00040000-5596-52a9-19aa-50e933477721	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5596-52a9-14f1-8216c92590f6	TG	TGO	768	Togo 	Togo	\N
00040000-5596-52a9-7a2a-5389ffb19c7b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5596-52a9-faf5-00bc2ac17961	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5596-52a9-9bc4-3c9a007012ad	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5596-52a9-f5f0-629af0c1a1b7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5596-52a9-ffdd-139df02fe2f4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5596-52a9-dd47-551e7bfa784d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5596-52a9-4646-3c7201d36e30	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-52a9-9f7c-991cfd199b5a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5596-52a9-ec0c-7491c6105461	UG	UGA	800	Uganda 	Uganda	\N
00040000-5596-52a9-db80-1600a0ee9107	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5596-52a9-3e9b-b8526a6d5c5b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5596-52a9-67bd-f72d8c8af0d9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5596-52a9-dc80-5279120577cf	US	USA	840	United States 	Združene države Amerike	\N
00040000-5596-52a9-add6-0310ddb0fc32	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5596-52a9-70b8-51763079be43	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5596-52a9-664a-793ec9f09724	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5596-52a9-620e-ea05c757984f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5596-52a9-e896-4e8977213596	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5596-52a9-1523-6d60c0e3b971	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5596-52a9-47ea-d922fd24042a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-52a9-64d4-5efee980eb32	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5596-52a9-a524-0d950ff7acc6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5596-52a9-ee48-34ec4b2538dc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5596-52a9-99ab-00c3d3de815f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5596-52a9-c912-82eb7b5e7d59	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5596-52a9-dbcc-aea091e7adfe	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2900 (class 0 OID 8945137)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5596-52ab-1342-c381d799bbd4	000e0000-5596-52ab-86ce-24ace1b63da6	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5596-52aa-74a6-02b1041eb82f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5596-52ab-ec44-9edd95d7a014	000e0000-5596-52ab-0434-3c2882fe9561	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5596-52aa-0d42-f2816956d5c4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8944964)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5596-52ab-79ab-097ae653768d	000e0000-5596-52ab-0434-3c2882fe9561	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5596-52aa-7ed9-6dbd0ca8ac01
000d0000-5596-52ab-0b06-f2cef5e05b49	000e0000-5596-52ab-0434-3c2882fe9561	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-52aa-7ed9-6dbd0ca8ac01
000d0000-5596-52ab-2275-6bb4276a618d	000e0000-5596-52ab-0434-3c2882fe9561	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5596-52aa-9574-d8ee2c0537e3
000d0000-5596-52ab-dfe4-9a2a22d24471	000e0000-5596-52ab-0434-3c2882fe9561	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5596-52aa-aacd-07f5ce6c27e9
000d0000-5596-52ab-98aa-c97c0de77cb7	000e0000-5596-52ab-0434-3c2882fe9561	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5596-52aa-aacd-07f5ce6c27e9
000d0000-5596-52ab-db21-56fc6c4691a4	000e0000-5596-52ab-0434-3c2882fe9561	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5596-52aa-aacd-07f5ce6c27e9
000d0000-5596-52ab-45d3-e3ba6ddb5e5e	000e0000-5596-52ab-0434-3c2882fe9561	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-52aa-7ed9-6dbd0ca8ac01
\.


--
-- TOC entry 2866 (class 0 OID 8944784)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8944832)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8944764)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5596-52ab-b7b1-688127c42ffa	00080000-5596-52ab-fbcd-bd279bf0c0c8	00090000-5596-52ab-b9dd-bf81ce31995f	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8944881)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8944906)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8944721)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5596-52aa-2122-d7f95ba5c1e5	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5596-52aa-e1ad-6fb1c85d9da6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5596-52aa-e8c8-f64ab7679d0c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5596-52aa-79da-f3b02327c377	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5596-52aa-592a-26ec8c49c03c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5596-52aa-a6b4-711e51a8617e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5596-52aa-26fc-35119dde9e98	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5596-52aa-9722-f164312c8729	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-52aa-fdf2-01fa3f13aed6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-52aa-7b27-d57081004a94	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5596-52aa-d50f-cf6d2209d88a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5596-52aa-a52b-382a0e9e6dfd	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5596-52aa-703a-163d344ef495	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5596-52ab-aa63-3cbe4fc8f2d5	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5596-52ab-0559-d642fdd2df96	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5596-52ab-b382-d16ec45ab35f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5596-52ab-b473-26ba4324969b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5596-52ab-20ba-854b6e4f633f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5596-52ab-4989-2d9d748a1aca	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8944634)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5596-52ab-efa7-c771ed198051	00000000-5596-52ab-0559-d642fdd2df96	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5596-52ab-a4f7-958d9b563b35	00000000-5596-52ab-0559-d642fdd2df96	00010000-5596-52aa-bf01-57a93970b41b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5596-52ab-f3a8-525a4f066792	00000000-5596-52ab-b382-d16ec45ab35f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8944645)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5596-52ab-f93f-6994140cca32	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5596-52ab-ae92-c67de6bfcaab	00010000-5596-52ab-60ca-be9a01eb6dc1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5596-52ab-0c27-78d230880acc	00010000-5596-52ab-8b56-2850ae379141	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5596-52ab-8c02-8f91c8247c03	00010000-5596-52ab-4924-cfe8a8db0ff2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5596-52ab-14b7-b043b15fb56f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5596-52ab-54b9-b16458bf1268	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5596-52ab-0b43-c47a2fab7b84	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5596-52ab-396c-e9b97b80c510	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5596-52ab-b9dd-bf81ce31995f	00010000-5596-52ab-1122-359022903ae2	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5596-52ab-96c1-aa4e9777156c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5596-52ab-c17b-cf9355b3b81b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5596-52ab-04a5-83992ff65532	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5596-52ab-1ab6-f77bb9bcbb18	00010000-5596-52ab-7aa4-ef5488909adb	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8944599)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5596-52a9-2f52-ed4a1dfe6b79	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5596-52a9-ca54-d09266850be6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5596-52a9-d8ac-695302292e71	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5596-52a9-c9b6-4174159d8072	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5596-52a9-796c-12df7bb08c43	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5596-52a9-795d-04720662a653	Abonma-read	Abonma - branje	f
00030000-5596-52a9-1bbd-fb49aaca8d1c	Abonma-write	Abonma - spreminjanje	f
00030000-5596-52a9-b129-2983b73688e7	Alternacija-read	Alternacija - branje	f
00030000-5596-52a9-14c7-f5b92e442d2b	Alternacija-write	Alternacija - spreminjanje	f
00030000-5596-52a9-f1ad-d8e418e346df	Arhivalija-read	Arhivalija - branje	f
00030000-5596-52a9-27bb-ce01f2d9265d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5596-52a9-6074-56271959663a	Besedilo-read	Besedilo - branje	f
00030000-5596-52a9-4aaa-0127777ff080	Besedilo-write	Besedilo - spreminjanje	f
00030000-5596-52a9-364f-2006c01cbbcc	DogodekIzven-read	DogodekIzven - branje	f
00030000-5596-52a9-bad2-a5193c661c96	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5596-52a9-1f5a-6ca0075a671a	Dogodek-read	Dogodek - branje	f
00030000-5596-52a9-fade-d518705331e5	Dogodek-write	Dogodek - spreminjanje	f
00030000-5596-52a9-6091-8d47c0133f70	DrugiVir-read	DrugiVir - branje	f
00030000-5596-52a9-324f-8ef13ee3a9e2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5596-52a9-ff50-343330c423ee	Drzava-read	Drzava - branje	f
00030000-5596-52a9-a3a0-2c5930b6eefc	Drzava-write	Drzava - spreminjanje	f
00030000-5596-52a9-dcb2-fa7eaed0148a	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5596-52a9-f426-0fceab90e1f5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5596-52a9-b5f2-6aaedac6e088	Funkcija-read	Funkcija - branje	f
00030000-5596-52a9-98a8-4d1df8393a02	Funkcija-write	Funkcija - spreminjanje	f
00030000-5596-52a9-b533-f58599ccee0b	Gostovanje-read	Gostovanje - branje	f
00030000-5596-52a9-085a-19158e0fced8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5596-52a9-a32b-fb8d014f92da	Gostujoca-read	Gostujoca - branje	f
00030000-5596-52a9-9144-6fd8eb6e02bf	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5596-52a9-348a-52a2fd4ee2db	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5596-52a9-234c-5ad1364f0ff0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5596-52a9-f942-4ed785aec226	Kupec-read	Kupec - branje	f
00030000-5596-52a9-1bbf-273a689049b3	Kupec-write	Kupec - spreminjanje	f
00030000-5596-52a9-4007-1c712dfdaefe	NacinPlacina-read	NacinPlacina - branje	f
00030000-5596-52a9-5d9a-0ca4c62a95a4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5596-52a9-9ef8-ae29b310ad68	Option-read	Option - branje	f
00030000-5596-52a9-1ed3-d4e518f61e15	Option-write	Option - spreminjanje	f
00030000-5596-52a9-4830-d47267e3fcd1	OptionValue-read	OptionValue - branje	f
00030000-5596-52a9-cc06-e541220d16b4	OptionValue-write	OptionValue - spreminjanje	f
00030000-5596-52a9-0341-ca34c463fef0	Oseba-read	Oseba - branje	f
00030000-5596-52a9-196f-9571e502a86a	Oseba-write	Oseba - spreminjanje	f
00030000-5596-52a9-bc65-bb96558f2b62	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5596-52a9-cc8c-28ea54bbaf14	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5596-52a9-1d43-83fa22563d30	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5596-52a9-36a9-c9170d71fd5a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5596-52a9-5515-0fc500c5ef91	Pogodba-read	Pogodba - branje	f
00030000-5596-52a9-1023-a2d4cf2379bc	Pogodba-write	Pogodba - spreminjanje	f
00030000-5596-52a9-2ba9-172b373682c0	Popa-read	Popa - branje	f
00030000-5596-52a9-a68a-1784dea00d24	Popa-write	Popa - spreminjanje	f
00030000-5596-52a9-68dd-ce59272b7b53	Posta-read	Posta - branje	f
00030000-5596-52a9-32fc-4ce2cb535dfa	Posta-write	Posta - spreminjanje	f
00030000-5596-52a9-b745-ad40c5e209cf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5596-52a9-2208-79204e13e009	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5596-52a9-6680-741d5dcffc27	PostniNaslov-read	PostniNaslov - branje	f
00030000-5596-52a9-9811-e226140b0a55	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5596-52a9-d368-a1418422ceab	Predstava-read	Predstava - branje	f
00030000-5596-52a9-854d-6c0f71ba105e	Predstava-write	Predstava - spreminjanje	f
00030000-5596-52a9-73d2-e6602ba1f20b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5596-52a9-f233-667ad6d67066	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5596-52a9-1609-0ecd221af1e6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5596-52a9-fd35-7436cc918089	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5596-52a9-d3cb-59b246f9d17e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5596-52a9-4d5b-28b05d864cc6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5596-52a9-427a-701980034dd4	ProgramDela-read	ProgramDela - branje	f
00030000-5596-52a9-c9eb-af79d891963b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5596-52a9-36d8-469fd84e8b75	ProgramFestival-read	ProgramFestival - branje	f
00030000-5596-52a9-f1a2-ccd9cc3c1a24	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5596-52a9-4591-ea5fedd52947	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5596-52a9-4afb-40b9e878ffbe	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5596-52a9-ced9-39cae6b883a2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5596-52a9-ee04-033ca93dc1b2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5596-52a9-d82f-2664371c0ef4	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5596-52a9-6eb7-0b792f5ce9f8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5596-52a9-02a5-e7ba11986fc2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5596-52a9-6dc3-4ff45b3234f5	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5596-52a9-71c5-81ca0060c48a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5596-52a9-f03e-5bb1fa9fd124	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5596-52a9-6e13-04728eadba94	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5596-52a9-3211-b2fd5e05bfb9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5596-52a9-e05e-26442b2df2e6	ProgramRazno-read	ProgramRazno - branje	f
00030000-5596-52a9-390a-bbe06c03264d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5596-52a9-8f6f-a1937c83f2f8	Prostor-read	Prostor - branje	f
00030000-5596-52a9-314e-d3b9a854b75d	Prostor-write	Prostor - spreminjanje	f
00030000-5596-52a9-6fbb-1f4ab449bd1b	Racun-read	Racun - branje	f
00030000-5596-52a9-6a8e-f62fbaaa42e5	Racun-write	Racun - spreminjanje	f
00030000-5596-52a9-86e0-866c8cefba18	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5596-52a9-f80e-8205e67c4628	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5596-52a9-7361-1bea4aeab2b1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5596-52a9-4855-3fd3d383832d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5596-52a9-1aa8-a17c551da731	Rekvizit-read	Rekvizit - branje	f
00030000-5596-52a9-1fad-666aaa95b751	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5596-52a9-c71c-f22ae73bd45f	Revizija-read	Revizija - branje	f
00030000-5596-52aa-453b-4d69639206b9	Revizija-write	Revizija - spreminjanje	f
00030000-5596-52aa-b63d-7ed7a7f9de6e	Rezervacija-read	Rezervacija - branje	f
00030000-5596-52aa-3e11-db38ce891adc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5596-52aa-381a-a4b4a9c586e2	SedezniRed-read	SedezniRed - branje	f
00030000-5596-52aa-40d6-ea163ea11e38	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5596-52aa-2ce1-4c9150d0ac2e	Sedez-read	Sedez - branje	f
00030000-5596-52aa-4ac2-289b2a022956	Sedez-write	Sedez - spreminjanje	f
00030000-5596-52aa-51c7-3c7e4b96d277	Sezona-read	Sezona - branje	f
00030000-5596-52aa-db62-e1858f0f02a2	Sezona-write	Sezona - spreminjanje	f
00030000-5596-52aa-0462-a7e592a6cb0d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5596-52aa-eab5-ade9426743f2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5596-52aa-6368-3f52ce658780	Stevilcenje-read	Stevilcenje - branje	f
00030000-5596-52aa-0798-b4581ee4c1b2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5596-52aa-9400-e92085aec1aa	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5596-52aa-09f4-9e8e8c4f8f78	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5596-52aa-6980-0b67256e15d8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5596-52aa-1929-709f6665c104	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5596-52aa-9bb1-949c6e80f9fc	Telefonska-read	Telefonska - branje	f
00030000-5596-52aa-2754-72e1b9a0af6a	Telefonska-write	Telefonska - spreminjanje	f
00030000-5596-52aa-f70d-781f4316b136	TerminStoritve-read	TerminStoritve - branje	f
00030000-5596-52aa-a3d9-8ba109ecee04	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5596-52aa-9b7b-a30eaa50568d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5596-52aa-653c-026fe620b223	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5596-52aa-8eac-5041d3c0f6d6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5596-52aa-87fd-6fd691ea9125	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5596-52aa-4ca2-2d70de75c279	Trr-read	Trr - branje	f
00030000-5596-52aa-06fb-1f3cf7c86197	Trr-write	Trr - spreminjanje	f
00030000-5596-52aa-b9c9-ce9bcf32435b	Uprizoritev-read	Uprizoritev - branje	f
00030000-5596-52aa-ff88-a4370ddac424	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5596-52aa-c7d5-6cfc59ad29e6	Vaja-read	Vaja - branje	f
00030000-5596-52aa-d216-867743ad5e0a	Vaja-write	Vaja - spreminjanje	f
00030000-5596-52aa-d40c-5f318cd215d3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5596-52aa-d50d-f74ad89138a2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5596-52aa-54fa-515e290765bd	Zaposlitev-read	Zaposlitev - branje	f
00030000-5596-52aa-b71d-62f37ec930d3	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5596-52aa-4565-f13589d5e530	Zasedenost-read	Zasedenost - branje	f
00030000-5596-52aa-6861-3d6d2e1cff3e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5596-52aa-0c73-42d0f3d2151b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5596-52aa-3026-85f13edb8c93	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5596-52aa-9c6a-43b8f2350574	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5596-52aa-152b-c7e27dbd1278	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8944618)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5596-52aa-b522-1577a4dd82de	00030000-5596-52a9-ca54-d09266850be6
00020000-5596-52aa-32fa-9b4ad1db6685	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-795d-04720662a653
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-1bbd-fb49aaca8d1c
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-b129-2983b73688e7
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-14c7-f5b92e442d2b
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-c9b6-4174159d8072
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-fade-d518705331e5
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-a3a0-2c5930b6eefc
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-b5f2-6aaedac6e088
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-98a8-4d1df8393a02
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-085a-19158e0fced8
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-9144-6fd8eb6e02bf
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-348a-52a2fd4ee2db
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-234c-5ad1364f0ff0
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-0341-ca34c463fef0
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-196f-9571e502a86a
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-a68a-1784dea00d24
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-32fc-4ce2cb535dfa
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-6680-741d5dcffc27
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-9811-e226140b0a55
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-854d-6c0f71ba105e
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-d3cb-59b246f9d17e
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-4d5b-28b05d864cc6
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-314e-d3b9a854b75d
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-4855-3fd3d383832d
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52a9-1fad-666aaa95b751
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-db62-e1858f0f02a2
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-9b7b-a30eaa50568d
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-b9c9-ce9bcf32435b
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-ff88-a4370ddac424
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-c7d5-6cfc59ad29e6
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-d216-867743ad5e0a
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-4565-f13589d5e530
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-6861-3d6d2e1cff3e
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52aa-138d-7e998dd6edd8	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-795d-04720662a653
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-348a-52a2fd4ee2db
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-234c-5ad1364f0ff0
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-0341-ca34c463fef0
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-196f-9571e502a86a
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-6680-741d5dcffc27
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-9811-e226140b0a55
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-9bb1-949c6e80f9fc
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-2754-72e1b9a0af6a
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-4ca2-2d70de75c279
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-06fb-1f3cf7c86197
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-54fa-515e290765bd
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-b71d-62f37ec930d3
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52aa-61da-841b07b82256	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-795d-04720662a653
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-b129-2983b73688e7
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-27bb-ce01f2d9265d
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-6074-56271959663a
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-364f-2006c01cbbcc
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-b5f2-6aaedac6e088
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-348a-52a2fd4ee2db
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-0341-ca34c463fef0
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-d3cb-59b246f9d17e
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-9b7b-a30eaa50568d
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-c7d5-6cfc59ad29e6
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-4565-f13589d5e530
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52aa-01c5-2deced16bbbe	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-795d-04720662a653
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-1bbd-fb49aaca8d1c
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-14c7-f5b92e442d2b
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52aa-9b7b-a30eaa50568d
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52aa-ed8d-5ed4bc0564e1	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-795d-04720662a653
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52aa-f70d-781f4316b136
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52a9-d8ac-695302292e71
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52aa-9b7b-a30eaa50568d
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52aa-09d3-512b9e7f6cce	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-2f52-ed4a1dfe6b79
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-ca54-d09266850be6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-d8ac-695302292e71
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-c9b6-4174159d8072
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-796c-12df7bb08c43
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-795d-04720662a653
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1bbd-fb49aaca8d1c
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-b129-2983b73688e7
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-14c7-f5b92e442d2b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f1ad-d8e418e346df
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-27bb-ce01f2d9265d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6074-56271959663a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4aaa-0127777ff080
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-364f-2006c01cbbcc
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-bad2-a5193c661c96
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1f5a-6ca0075a671a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-fade-d518705331e5
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-ff50-343330c423ee
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-a3a0-2c5930b6eefc
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-dcb2-fa7eaed0148a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f426-0fceab90e1f5
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-b5f2-6aaedac6e088
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-98a8-4d1df8393a02
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-b533-f58599ccee0b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-085a-19158e0fced8
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-a32b-fb8d014f92da
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-9144-6fd8eb6e02bf
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-348a-52a2fd4ee2db
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-234c-5ad1364f0ff0
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f942-4ed785aec226
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1bbf-273a689049b3
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4007-1c712dfdaefe
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-5d9a-0ca4c62a95a4
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-9ef8-ae29b310ad68
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1ed3-d4e518f61e15
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4830-d47267e3fcd1
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-cc06-e541220d16b4
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-0341-ca34c463fef0
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-196f-9571e502a86a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-bc65-bb96558f2b62
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-cc8c-28ea54bbaf14
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1d43-83fa22563d30
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-36a9-c9170d71fd5a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-5515-0fc500c5ef91
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1023-a2d4cf2379bc
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-2ba9-172b373682c0
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-a68a-1784dea00d24
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-68dd-ce59272b7b53
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-32fc-4ce2cb535dfa
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-b745-ad40c5e209cf
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-2208-79204e13e009
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6680-741d5dcffc27
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-9811-e226140b0a55
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-d368-a1418422ceab
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-854d-6c0f71ba105e
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-73d2-e6602ba1f20b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f233-667ad6d67066
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1609-0ecd221af1e6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-fd35-7436cc918089
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-d3cb-59b246f9d17e
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4d5b-28b05d864cc6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-427a-701980034dd4
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-c9eb-af79d891963b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-36d8-469fd84e8b75
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f1a2-ccd9cc3c1a24
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4591-ea5fedd52947
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4afb-40b9e878ffbe
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-ced9-39cae6b883a2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-ee04-033ca93dc1b2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-d82f-2664371c0ef4
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6eb7-0b792f5ce9f8
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-02a5-e7ba11986fc2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6dc3-4ff45b3234f5
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-71c5-81ca0060c48a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f03e-5bb1fa9fd124
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6e13-04728eadba94
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-3211-b2fd5e05bfb9
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-e05e-26442b2df2e6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-390a-bbe06c03264d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-8f6f-a1937c83f2f8
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-314e-d3b9a854b75d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6fbb-1f4ab449bd1b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-6a8e-f62fbaaa42e5
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-86e0-866c8cefba18
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-f80e-8205e67c4628
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-7361-1bea4aeab2b1
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-4855-3fd3d383832d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1aa8-a17c551da731
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-1fad-666aaa95b751
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52a9-c71c-f22ae73bd45f
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-453b-4d69639206b9
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-b63d-7ed7a7f9de6e
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-3e11-db38ce891adc
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-381a-a4b4a9c586e2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-40d6-ea163ea11e38
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-2ce1-4c9150d0ac2e
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-4ac2-289b2a022956
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-51c7-3c7e4b96d277
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-db62-e1858f0f02a2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-0462-a7e592a6cb0d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-eab5-ade9426743f2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-6368-3f52ce658780
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-0798-b4581ee4c1b2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-9400-e92085aec1aa
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-09f4-9e8e8c4f8f78
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-6980-0b67256e15d8
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-1929-709f6665c104
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-9bb1-949c6e80f9fc
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-2754-72e1b9a0af6a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-f70d-781f4316b136
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-a3d9-8ba109ecee04
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-9b7b-a30eaa50568d
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-653c-026fe620b223
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-8eac-5041d3c0f6d6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-87fd-6fd691ea9125
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-4ca2-2d70de75c279
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-06fb-1f3cf7c86197
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-b9c9-ce9bcf32435b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-ff88-a4370ddac424
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-c7d5-6cfc59ad29e6
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-d216-867743ad5e0a
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-d40c-5f318cd215d3
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-d50d-f74ad89138a2
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-54fa-515e290765bd
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-b71d-62f37ec930d3
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-4565-f13589d5e530
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-6861-3d6d2e1cff3e
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-0c73-42d0f3d2151b
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-3026-85f13edb8c93
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-9c6a-43b8f2350574
00020000-5596-52ab-deef-6726bef5f270	00030000-5596-52aa-152b-c7e27dbd1278
\.


--
-- TOC entry 2881 (class 0 OID 8944913)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8944944)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8945057)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5596-52ab-197d-6d75ca676f16	00090000-5596-52ab-f93f-6994140cca32	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8944678)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5596-52ab-fbcd-bd279bf0c0c8	00040000-5596-52a9-f67a-b6cd09f99c24	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-de82-36c182d3472c	00040000-5596-52a9-f67a-b6cd09f99c24	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5596-52ab-e297-405dc4a495a4	00040000-5596-52a9-f67a-b6cd09f99c24	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-f2e9-dade98b7f480	00040000-5596-52a9-f67a-b6cd09f99c24	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-939f-83a6337ad666	00040000-5596-52a9-f67a-b6cd09f99c24	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-fbf5-62b9dd849a64	00040000-5596-52a9-8c30-f0aeebe89af5	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-ab0c-fe514fa0056a	00040000-5596-52a9-6603-0091f1412eff	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-34aa-7fa3342e91a2	00040000-5596-52a9-8245-a244f8a81d07	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-52ab-e15c-82e59e890e33	00040000-5596-52a9-f67a-b6cd09f99c24	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8944713)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5596-52aa-06e0-0dc9edecc3ff	8341	Adlešiči
00050000-5596-52aa-3057-5dfcd56a82fd	5270	Ajdovščina
00050000-5596-52aa-3f25-ef3cdf27ca29	6280	Ankaran/Ancarano
00050000-5596-52aa-c766-a217d5f4073f	9253	Apače
00050000-5596-52aa-cf51-b1be12fd7409	8253	Artiče
00050000-5596-52aa-6336-e84b9c086cd7	4275	Begunje na Gorenjskem
00050000-5596-52aa-a767-14448319e3f2	1382	Begunje pri Cerknici
00050000-5596-52aa-b4a1-32776aeaab21	9231	Beltinci
00050000-5596-52aa-19c4-3700e7194d2b	2234	Benedikt
00050000-5596-52aa-a7d8-a0b877bccf0f	2345	Bistrica ob Dravi
00050000-5596-52aa-42ca-a9427ede2f36	3256	Bistrica ob Sotli
00050000-5596-52aa-0612-0cae0202a4a1	8259	Bizeljsko
00050000-5596-52aa-93fe-07652332c17f	1223	Blagovica
00050000-5596-52aa-ab1a-f17eaee12393	8283	Blanca
00050000-5596-52aa-2dd5-8e20070ae609	4260	Bled
00050000-5596-52aa-388b-9eb84eebc51f	4273	Blejska Dobrava
00050000-5596-52aa-0b83-32f6ac4fdcd7	9265	Bodonci
00050000-5596-52aa-3144-908d0cbee536	9222	Bogojina
00050000-5596-52aa-20d5-0a8fe19ed022	4263	Bohinjska Bela
00050000-5596-52aa-ac2c-f9afab36e1d3	4264	Bohinjska Bistrica
00050000-5596-52aa-d9f7-e0c39ffa4a11	4265	Bohinjsko jezero
00050000-5596-52aa-709a-141f8b50b299	1353	Borovnica
00050000-5596-52aa-c9f8-63b250fe9132	8294	Boštanj
00050000-5596-52aa-7650-c46d2fb517d3	5230	Bovec
00050000-5596-52aa-9b2c-9a94232be4d7	5295	Branik
00050000-5596-52aa-5479-7a2851d4d2e8	3314	Braslovče
00050000-5596-52aa-be0d-5b77dde6d5f3	5223	Breginj
00050000-5596-52aa-1552-22c7cdfbafda	8280	Brestanica
00050000-5596-52aa-4743-3afc799c187a	2354	Bresternica
00050000-5596-52aa-8909-9c66382b1a4c	4243	Brezje
00050000-5596-52aa-24e5-5bb48d69719c	1351	Brezovica pri Ljubljani
00050000-5596-52aa-b926-e871a0bddf6b	8250	Brežice
00050000-5596-52aa-3f7b-1c0f8a4c5da4	4210	Brnik - Aerodrom
00050000-5596-52aa-41d6-72f91072f48f	8321	Brusnice
00050000-5596-52aa-602f-966767fcec08	3255	Buče
00050000-5596-52aa-3d7c-fddfe4f1e167	8276	Bučka 
00050000-5596-52aa-0e53-d3502cdf6a74	9261	Cankova
00050000-5596-52aa-4661-efced7481ef2	3000	Celje 
00050000-5596-52aa-fa04-8047a51a797c	3001	Celje - poštni predali
00050000-5596-52aa-59de-d0fda746164d	4207	Cerklje na Gorenjskem
00050000-5596-52aa-9a22-618db9eefc90	8263	Cerklje ob Krki
00050000-5596-52aa-7329-49c7a6c8abd1	1380	Cerknica
00050000-5596-52aa-306d-9671d4cd8a4f	5282	Cerkno
00050000-5596-52aa-a157-e8d84042754e	2236	Cerkvenjak
00050000-5596-52aa-59ce-bcebf901ff05	2215	Ceršak
00050000-5596-52aa-bafe-930b64883c8b	2326	Cirkovce
00050000-5596-52aa-756e-232f15cb44b2	2282	Cirkulane
00050000-5596-52aa-78fe-2a7d352a9670	5273	Col
00050000-5596-52aa-084c-845f01910aca	8251	Čatež ob Savi
00050000-5596-52aa-802e-51c86c12295f	1413	Čemšenik
00050000-5596-52aa-ec81-b9d822bb62c6	5253	Čepovan
00050000-5596-52aa-13bf-2e03ac6de09c	9232	Črenšovci
00050000-5596-52aa-6e10-90c3a3643ef3	2393	Črna na Koroškem
00050000-5596-52aa-1f20-88c70f2cfa7b	6275	Črni Kal
00050000-5596-52aa-be8e-868490155872	5274	Črni Vrh nad Idrijo
00050000-5596-52aa-8091-fbb5fe9df7d1	5262	Črniče
00050000-5596-52aa-583e-2ee7f21a225e	8340	Črnomelj
00050000-5596-52aa-0a8e-2ce9f6cdb501	6271	Dekani
00050000-5596-52aa-b1cb-901271ad8985	5210	Deskle
00050000-5596-52aa-2151-498e4c3ee683	2253	Destrnik
00050000-5596-52aa-491e-a0ee2f99f9a0	6215	Divača
00050000-5596-52aa-2153-0209eeba9c9b	1233	Dob
00050000-5596-52aa-da02-172bce738caa	3224	Dobje pri Planini
00050000-5596-52aa-010a-b38f2224af37	8257	Dobova
00050000-5596-52aa-5ba2-dfb4ea0ceb1e	1423	Dobovec
00050000-5596-52aa-d26c-07164e380ed5	5263	Dobravlje
00050000-5596-52aa-52d7-7e80f69506c1	3204	Dobrna
00050000-5596-52aa-6a5b-90c5614c58c9	8211	Dobrnič
00050000-5596-52aa-52b1-b3a7af9a39c5	1356	Dobrova
00050000-5596-52aa-3c62-462582a76b89	9223	Dobrovnik/Dobronak 
00050000-5596-52aa-c14e-1346e558c30c	5212	Dobrovo v Brdih
00050000-5596-52aa-9b73-422309afd110	1431	Dol pri Hrastniku
00050000-5596-52aa-3f66-707654949acf	1262	Dol pri Ljubljani
00050000-5596-52aa-22a4-ea175ab61662	1273	Dole pri Litiji
00050000-5596-52aa-8e11-856c13864d38	1331	Dolenja vas
00050000-5596-52aa-646f-daf9fdf6122d	8350	Dolenjske Toplice
00050000-5596-52aa-cd3e-e3fc685deec4	1230	Domžale
00050000-5596-52aa-55a2-f1003c065c3b	2252	Dornava
00050000-5596-52aa-b320-96be92f17206	5294	Dornberk
00050000-5596-52aa-9dcf-e62c8c3e32f2	1319	Draga
00050000-5596-52aa-d05c-05e4be987419	8343	Dragatuš
00050000-5596-52aa-7634-ed31c28db603	3222	Dramlje
00050000-5596-52aa-59b2-247725d98af1	2370	Dravograd
00050000-5596-52aa-5545-f8d34a079bc4	4203	Duplje
00050000-5596-52aa-5e26-d08beaa56898	6221	Dutovlje
00050000-5596-52aa-ad9b-3bb2470a2549	8361	Dvor
00050000-5596-52aa-0c59-8e6a35588e8d	2343	Fala
00050000-5596-52aa-ec23-2d687714eafc	9208	Fokovci
00050000-5596-52aa-2925-2c6fd820f89a	2313	Fram
00050000-5596-52aa-bd21-cd71b179d635	3213	Frankolovo
00050000-5596-52aa-bd31-fb66ffe719fe	1274	Gabrovka
00050000-5596-52aa-d70a-8ef7ee0c9ff8	8254	Globoko
00050000-5596-52aa-c81e-03e3ff8dca1b	5275	Godovič
00050000-5596-52aa-5a48-956661641a7d	4204	Golnik
00050000-5596-52aa-ea42-535c43bfe87f	3303	Gomilsko
00050000-5596-52aa-448a-181dfad6feef	4224	Gorenja vas
00050000-5596-52aa-b21a-c3ef5927687d	3263	Gorica pri Slivnici
00050000-5596-52aa-418a-39832d5278c5	2272	Gorišnica
00050000-5596-52aa-6367-f1e1dd589a17	9250	Gornja Radgona
00050000-5596-52aa-e37a-c24fe111a379	3342	Gornji Grad
00050000-5596-52aa-de05-6e0887ae3309	4282	Gozd Martuljek
00050000-5596-52aa-7850-85882b79e47a	6272	Gračišče
00050000-5596-52aa-b20c-2fb34806d435	9264	Grad
00050000-5596-52aa-d215-d48664a80069	8332	Gradac
00050000-5596-52aa-209a-2436df7dd5ae	1384	Grahovo
00050000-5596-52aa-5665-51b38a25b1d3	5242	Grahovo ob Bači
00050000-5596-52aa-e538-9c7305a88438	5251	Grgar
00050000-5596-52aa-857e-a5a0da280b8b	3302	Griže
00050000-5596-52aa-c72d-d064b159effb	3231	Grobelno
00050000-5596-52aa-ed12-aa7b035891b9	1290	Grosuplje
00050000-5596-52aa-cb0e-02b7f629476f	2288	Hajdina
00050000-5596-52aa-2e34-eb9c6290b15e	8362	Hinje
00050000-5596-52aa-34c8-864022c5b87b	2311	Hoče
00050000-5596-52aa-e6c6-00ad8eac41cf	9205	Hodoš/Hodos
00050000-5596-52aa-da53-28f3eafe1606	1354	Horjul
00050000-5596-52aa-512f-a580f94c693a	1372	Hotedršica
00050000-5596-52aa-9f01-377efd0c3c7e	1430	Hrastnik
00050000-5596-52aa-502c-ec8ebf36566b	6225	Hruševje
00050000-5596-52aa-ebc7-3c0b3715a5d7	4276	Hrušica
00050000-5596-52aa-17f1-6314bd6dfde8	5280	Idrija
00050000-5596-52aa-b86f-cc2ccd2b2454	1292	Ig
00050000-5596-52aa-b753-7f26f9a180ea	6250	Ilirska Bistrica
00050000-5596-52aa-6f25-e3447704648a	6251	Ilirska Bistrica-Trnovo
00050000-5596-52aa-5795-3dc425fb05de	1295	Ivančna Gorica
00050000-5596-52aa-1078-3651ed8d3685	2259	Ivanjkovci
00050000-5596-52aa-75ab-d76362fcf2cc	1411	Izlake
00050000-5596-52aa-f970-abdfad1f0114	6310	Izola/Isola
00050000-5596-52aa-8c55-b6e8d60b9aac	2222	Jakobski Dol
00050000-5596-52aa-166c-aa31a02ac8dd	2221	Jarenina
00050000-5596-52aa-5142-177a1990d65b	6254	Jelšane
00050000-5596-52aa-fed3-0a81bdd69e68	4270	Jesenice
00050000-5596-52aa-beb0-2fc5862c2160	8261	Jesenice na Dolenjskem
00050000-5596-52aa-378f-da829937205b	3273	Jurklošter
00050000-5596-52aa-6f6b-742a112771ae	2223	Jurovski Dol
00050000-5596-52aa-457f-5650fdc2ddf1	2256	Juršinci
00050000-5596-52aa-9640-a30341ce4900	5214	Kal nad Kanalom
00050000-5596-52aa-7eb1-b696d1892194	3233	Kalobje
00050000-5596-52aa-6a30-1ce701fb6a9d	4246	Kamna Gorica
00050000-5596-52aa-b692-2075a52fffd6	2351	Kamnica
00050000-5596-52aa-a3ae-bbf6672ed414	1241	Kamnik
00050000-5596-52aa-0733-04c1057da6a8	5213	Kanal
00050000-5596-52aa-f4cd-c1b9077570ef	8258	Kapele
00050000-5596-52aa-846e-4ced40a138a2	2362	Kapla
00050000-5596-52aa-af5e-b0cb1accdf4a	2325	Kidričevo
00050000-5596-52aa-3590-0c4da78e796f	1412	Kisovec
00050000-5596-52aa-ae81-c9ca2f252aae	6253	Knežak
00050000-5596-52aa-f858-51c976fb7d35	5222	Kobarid
00050000-5596-52aa-b907-2fe50bbe936e	9227	Kobilje
00050000-5596-52aa-4f1b-38c402358911	1330	Kočevje
00050000-5596-52aa-36ab-b31bb371ce87	1338	Kočevska Reka
00050000-5596-52aa-4ef9-4b6e90354ef1	2276	Kog
00050000-5596-52aa-7a77-49a999666893	5211	Kojsko
00050000-5596-52aa-36b1-0e97da5bba66	6223	Komen
00050000-5596-52aa-2966-f943c57ce0bd	1218	Komenda
00050000-5596-52aa-3b2f-06db02d25eb1	6000	Koper/Capodistria 
00050000-5596-52aa-cef6-e864dbb1ef0c	6001	Koper/Capodistria - poštni predali
00050000-5596-52aa-c2f2-0b8a5b8dde01	8282	Koprivnica
00050000-5596-52aa-bd74-31b7dda2f902	5296	Kostanjevica na Krasu
00050000-5596-52aa-8f27-bec255762fb4	8311	Kostanjevica na Krki
00050000-5596-52aa-2c68-843575f67cd3	1336	Kostel
00050000-5596-52aa-8a79-dadbedde3234	6256	Košana
00050000-5596-52aa-d575-7ca417c7e874	2394	Kotlje
00050000-5596-52aa-aa16-3e00b320441e	6240	Kozina
00050000-5596-52aa-3bc6-2316b749e12e	3260	Kozje
00050000-5596-52aa-97f0-e99ea3ec64bb	4000	Kranj 
00050000-5596-52aa-3f5a-f6a9f65fa3aa	4001	Kranj - poštni predali
00050000-5596-52aa-300f-c3da0e6bc356	4280	Kranjska Gora
00050000-5596-52aa-5b72-fd47322fd9ca	1281	Kresnice
00050000-5596-52aa-1b6e-1a0fab3ca0da	4294	Križe
00050000-5596-52aa-1099-6949fdb20340	9206	Križevci
00050000-5596-52aa-9c65-ccd8b46cc4b8	9242	Križevci pri Ljutomeru
00050000-5596-52aa-645d-bc24d770588f	1301	Krka
00050000-5596-52aa-ce1b-4cf2d3ae0d89	8296	Krmelj
00050000-5596-52aa-7f23-cfafaf01d737	4245	Kropa
00050000-5596-52aa-5ec8-fe1efd5f63dc	8262	Krška vas
00050000-5596-52aa-79ec-0377794c52bb	8270	Krško
00050000-5596-52aa-4132-019b95b51468	9263	Kuzma
00050000-5596-52aa-48c3-8ce9193d8375	2318	Laporje
00050000-5596-52aa-477f-f192904d3137	3270	Laško
00050000-5596-52aa-e6fd-6d6fa8368a5f	1219	Laze v Tuhinju
00050000-5596-52aa-363d-1419c0ad91ed	2230	Lenart v Slovenskih goricah
00050000-5596-52aa-38b2-ae250e3c83dd	9220	Lendava/Lendva
00050000-5596-52aa-c549-271cfdaad514	4248	Lesce
00050000-5596-52aa-2772-eee38d2b0ef8	3261	Lesično
00050000-5596-52aa-9727-76346677fed8	8273	Leskovec pri Krškem
00050000-5596-52aa-a2a0-d0db51ac60f1	2372	Libeliče
00050000-5596-52aa-d983-b2f706cddb60	2341	Limbuš
00050000-5596-52aa-1ba8-fafe1c9946a8	1270	Litija
00050000-5596-52aa-57f5-7416a994558e	3202	Ljubečna
00050000-5596-52aa-5e51-ea5d6ed43424	1000	Ljubljana 
00050000-5596-52aa-9118-a04ad87be701	1001	Ljubljana - poštni predali
00050000-5596-52aa-1ee8-dcbb8fbea96f	1231	Ljubljana - Črnuče
00050000-5596-52aa-9890-6290c21ccf4e	1261	Ljubljana - Dobrunje
00050000-5596-52aa-b53d-a1fec614a833	1260	Ljubljana - Polje
00050000-5596-52aa-ced5-9206c3bedc75	1210	Ljubljana - Šentvid
00050000-5596-52aa-df87-490334b97d9f	1211	Ljubljana - Šmartno
00050000-5596-52aa-f927-99e5c9b17f4c	3333	Ljubno ob Savinji
00050000-5596-52aa-a8a6-e183ebce064c	9240	Ljutomer
00050000-5596-52aa-c04e-307af557cf10	3215	Loče
00050000-5596-52aa-ebf6-5be44a1220f6	5231	Log pod Mangartom
00050000-5596-52aa-36f0-92caa29e148b	1358	Log pri Brezovici
00050000-5596-52aa-cd48-841360263f0c	1370	Logatec
00050000-5596-52aa-15e8-197e75ae6b9b	1371	Logatec
00050000-5596-52aa-467b-d69b9e8995d1	1434	Loka pri Zidanem Mostu
00050000-5596-52aa-aa14-e86f159befde	3223	Loka pri Žusmu
00050000-5596-52aa-dcc2-3e33153aac20	6219	Lokev
00050000-5596-52aa-1de0-25af806a6967	1318	Loški Potok
00050000-5596-52aa-bd31-5ac23cd3f16c	2324	Lovrenc na Dravskem polju
00050000-5596-52aa-cbe0-cdeb493af82f	2344	Lovrenc na Pohorju
00050000-5596-52aa-252a-98c946dd3171	3334	Luče
00050000-5596-52aa-955d-e505638b75ee	1225	Lukovica
00050000-5596-52aa-14fc-43537968a293	9202	Mačkovci
00050000-5596-52aa-55d4-ac438a5467b5	2322	Majšperk
00050000-5596-52aa-3d4d-a5ee3b2f5b6c	2321	Makole
00050000-5596-52aa-eea8-257d4d2c73f5	9243	Mala Nedelja
00050000-5596-52aa-4483-1237f28d1304	2229	Malečnik
00050000-5596-52aa-909f-3c6b00bbaf64	6273	Marezige
00050000-5596-52aa-12e7-9bb124d74744	2000	Maribor 
00050000-5596-52aa-1f1b-c345de7c6a57	2001	Maribor - poštni predali
00050000-5596-52aa-013b-ac62348efd3a	2206	Marjeta na Dravskem polju
00050000-5596-52aa-612f-bd89070a6c3b	2281	Markovci
00050000-5596-52aa-6961-d5d56f3cf09e	9221	Martjanci
00050000-5596-52aa-9320-ff249261e70f	6242	Materija
00050000-5596-52aa-e286-c3e3b3fe1c19	4211	Mavčiče
00050000-5596-52aa-bdc2-7f5983760db3	1215	Medvode
00050000-5596-52aa-2817-cf8c499b71fc	1234	Mengeš
00050000-5596-52aa-51f3-1f14ad049307	8330	Metlika
00050000-5596-52aa-78b4-7f2b8e3a1513	2392	Mežica
00050000-5596-52aa-8a77-3f860bc4185a	2204	Miklavž na Dravskem polju
00050000-5596-52aa-47bc-e0f5e8d0cf01	2275	Miklavž pri Ormožu
00050000-5596-52aa-b118-96c522f1dcc5	5291	Miren
00050000-5596-52aa-6f65-79399eb33379	8233	Mirna
00050000-5596-52aa-098b-4cfae72818f8	8216	Mirna Peč
00050000-5596-52aa-b6dd-badfab33bc58	2382	Mislinja
00050000-5596-52aa-f347-2c7cb3aed420	4281	Mojstrana
00050000-5596-52aa-8609-ebcf55db13db	8230	Mokronog
00050000-5596-52aa-9055-957d41a1ec0a	1251	Moravče
00050000-5596-52aa-a979-758d70ad52b3	9226	Moravske Toplice
00050000-5596-52aa-9744-821cad0967ff	5216	Most na Soči
00050000-5596-52aa-aaba-1b7bb9d4e12a	1221	Motnik
00050000-5596-52aa-a10a-854c7316df9e	3330	Mozirje
00050000-5596-52aa-0b21-ae04ba047603	9000	Murska Sobota 
00050000-5596-52aa-add3-bf6b93e3eb5b	9001	Murska Sobota - poštni predali
00050000-5596-52aa-b999-ef24836b7441	2366	Muta
00050000-5596-52aa-7f1c-3bd2deb3504d	4202	Naklo
00050000-5596-52aa-33f2-67735dbff72c	3331	Nazarje
00050000-5596-52aa-d848-fc4875ddcfbc	1357	Notranje Gorice
00050000-5596-52aa-9f0b-42a334e0e38a	3203	Nova Cerkev
00050000-5596-52aa-47af-edd33f6312ea	5000	Nova Gorica 
00050000-5596-52aa-0586-623980339ab3	5001	Nova Gorica - poštni predali
00050000-5596-52aa-9ec4-63f0226c6f1d	1385	Nova vas
00050000-5596-52aa-a916-0817b1632637	8000	Novo mesto
00050000-5596-52aa-bf52-35d66ed7d98c	8001	Novo mesto - poštni predali
00050000-5596-52aa-7076-144cb45ecce1	6243	Obrov
00050000-5596-52aa-9f68-70c3948539b9	9233	Odranci
00050000-5596-52aa-e989-bdf864efa24b	2317	Oplotnica
00050000-5596-52aa-8abc-bd4e6e805cca	2312	Orehova vas
00050000-5596-52aa-b436-dc03c76cb2ec	2270	Ormož
00050000-5596-52aa-9245-c3fb3a05c562	1316	Ortnek
00050000-5596-52aa-41db-76d59cbf28e8	1337	Osilnica
00050000-5596-52aa-6710-91a8396a67d2	8222	Otočec
00050000-5596-52aa-f101-606ace2d0e8c	2361	Ožbalt
00050000-5596-52aa-3203-9c10f1a77708	2231	Pernica
00050000-5596-52aa-a4aa-b5d47bb546f6	2211	Pesnica pri Mariboru
00050000-5596-52aa-a1c5-d4ffc3f20d70	9203	Petrovci
00050000-5596-52aa-e8d5-ac2706aca1d7	3301	Petrovče
00050000-5596-52aa-52ed-322534456b2e	6330	Piran/Pirano
00050000-5596-52aa-4470-ff3959a9e4c2	8255	Pišece
00050000-5596-52aa-8d31-7188e37a8f83	6257	Pivka
00050000-5596-52aa-c371-591e280ec1be	6232	Planina
00050000-5596-52aa-ccc0-2ade185b87a2	3225	Planina pri Sevnici
00050000-5596-52aa-7f09-d79944fcd0c5	6276	Pobegi
00050000-5596-52aa-825d-876c305c3251	8312	Podbočje
00050000-5596-52aa-e260-373887101fd1	5243	Podbrdo
00050000-5596-52aa-6e71-b6dc46cd4b1e	3254	Podčetrtek
00050000-5596-52aa-7ed0-b42ebb5a2288	2273	Podgorci
00050000-5596-52aa-5c73-69dbe253835a	6216	Podgorje
00050000-5596-52aa-1a34-a8501e41c42c	2381	Podgorje pri Slovenj Gradcu
00050000-5596-52aa-19f1-cf01c4e0d733	6244	Podgrad
00050000-5596-52aa-a2bc-ef230ffadf68	1414	Podkum
00050000-5596-52aa-1dd4-d898e2bff4e6	2286	Podlehnik
00050000-5596-52aa-c2f6-df148d2949b5	5272	Podnanos
00050000-5596-52aa-3543-4e3a9e118f75	4244	Podnart
00050000-5596-52aa-2d2b-12768299e18e	3241	Podplat
00050000-5596-52aa-c98c-3ae33022baca	3257	Podsreda
00050000-5596-52aa-40ef-24df75e9fabf	2363	Podvelka
00050000-5596-52aa-56f0-0f64af0ddf42	2208	Pohorje
00050000-5596-52aa-3782-09a58ad7c045	2257	Polenšak
00050000-5596-52aa-5aea-ba6c95aecf6c	1355	Polhov Gradec
00050000-5596-52aa-3967-4169f1e76790	4223	Poljane nad Škofjo Loko
00050000-5596-52aa-2a39-f8f8d21de6cb	2319	Poljčane
00050000-5596-52aa-0dbd-ece90d6100e0	1272	Polšnik
00050000-5596-52aa-3783-c38c4782e471	3313	Polzela
00050000-5596-52aa-b529-06f4ca2dc220	3232	Ponikva
00050000-5596-52aa-f9e8-1f8817f3afec	6320	Portorož/Portorose
00050000-5596-52aa-28c0-a104b3437075	6230	Postojna
00050000-5596-52aa-b80b-2340432601ba	2331	Pragersko
00050000-5596-52aa-a64e-c7b2fc510673	3312	Prebold
00050000-5596-52aa-8f77-93a8bc8eb318	4205	Preddvor
00050000-5596-52aa-5f98-5e4fec157b90	6255	Prem
00050000-5596-52aa-adbd-7c0b002c635b	1352	Preserje
00050000-5596-52aa-f771-49b565609834	6258	Prestranek
00050000-5596-52aa-d1d4-f0ed04258630	2391	Prevalje
00050000-5596-52aa-aaf5-518de5a46c29	3262	Prevorje
00050000-5596-52aa-4bbe-433adb1d737d	1276	Primskovo 
00050000-5596-52aa-28d2-c17596891120	3253	Pristava pri Mestinju
00050000-5596-52aa-3164-233ac209f478	9207	Prosenjakovci/Partosfalva
00050000-5596-52aa-1462-ab67f4f48c5e	5297	Prvačina
00050000-5596-52aa-411c-0549f05a233e	2250	Ptuj
00050000-5596-52aa-bcb8-ccfcf020dd78	2323	Ptujska Gora
00050000-5596-52aa-0d75-5856142032cf	9201	Puconci
00050000-5596-52aa-ca78-a2f1de7aa9ef	2327	Rače
00050000-5596-52aa-a3ef-d5488ccb54b7	1433	Radeče
00050000-5596-52aa-bc91-e71c4d93977b	9252	Radenci
00050000-5596-52aa-e591-7e3b96303669	2360	Radlje ob Dravi
00050000-5596-52aa-2bbd-990f8782dbc5	1235	Radomlje
00050000-5596-52aa-04ce-d07e9189a764	4240	Radovljica
00050000-5596-52aa-dee2-a8bc2b055a0c	8274	Raka
00050000-5596-52aa-bb87-5558c266177e	1381	Rakek
00050000-5596-52aa-5502-76ab2d2e4cc3	4283	Rateče - Planica
00050000-5596-52aa-cb02-705a68e2e0c9	2390	Ravne na Koroškem
00050000-5596-52aa-549c-6ebbf078d2a9	9246	Razkrižje
00050000-5596-52aa-973a-65622cb7af2e	3332	Rečica ob Savinji
00050000-5596-52aa-394d-2241d59518d6	5292	Renče
00050000-5596-52aa-72b0-3a387bbebc7c	1310	Ribnica
00050000-5596-52aa-f56a-768dff3cfdce	2364	Ribnica na Pohorju
00050000-5596-52aa-df1d-1fd648108854	3272	Rimske Toplice
00050000-5596-52aa-519a-ec2fc07d8f3b	1314	Rob
00050000-5596-52aa-c22b-296292521ce4	5215	Ročinj
00050000-5596-52aa-8641-33ba104fd45a	3250	Rogaška Slatina
00050000-5596-52aa-f766-f8699c21a71e	9262	Rogašovci
00050000-5596-52aa-16a5-89e509f976d6	3252	Rogatec
00050000-5596-52aa-9fbe-5b3ae3ca611f	1373	Rovte
00050000-5596-52aa-4e5d-e45dd9d6f12f	2342	Ruše
00050000-5596-52aa-1240-b5297c5fcf8c	1282	Sava
00050000-5596-52aa-6eac-44574c745150	6333	Sečovlje/Sicciole
00050000-5596-52aa-eb20-4071b7c33692	4227	Selca
00050000-5596-52aa-b7b6-4165ea5fb101	2352	Selnica ob Dravi
00050000-5596-52aa-90bc-a95568f222cd	8333	Semič
00050000-5596-52aa-a2e4-bad4a9e71f41	8281	Senovo
00050000-5596-52aa-632e-606062e0b865	6224	Senožeče
00050000-5596-52aa-9fe1-5ac7998abb85	8290	Sevnica
00050000-5596-52aa-025f-9805b99086a7	6210	Sežana
00050000-5596-52aa-3dcc-d79ecd5fa0c6	2214	Sladki Vrh
00050000-5596-52aa-fd4e-c69f15535456	5283	Slap ob Idrijci
00050000-5596-52aa-7481-74026dd105e9	2380	Slovenj Gradec
00050000-5596-52aa-509b-49a5b1af2437	2310	Slovenska Bistrica
00050000-5596-52aa-30f0-c9c603062266	3210	Slovenske Konjice
00050000-5596-52aa-741d-e71510e10b51	1216	Smlednik
00050000-5596-52aa-86d6-08cc00250dca	5232	Soča
00050000-5596-52aa-88ae-ed1e11c67408	1317	Sodražica
00050000-5596-52aa-a4d2-7d40d10ac1a1	3335	Solčava
00050000-5596-52aa-0c11-a5a6688da8f7	5250	Solkan
00050000-5596-52aa-b056-a07714599f3f	4229	Sorica
00050000-5596-52aa-a8c8-0ab9a85605e0	4225	Sovodenj
00050000-5596-52aa-9171-925ade1d39ba	5281	Spodnja Idrija
00050000-5596-52aa-d03a-8da5a6570d0f	2241	Spodnji Duplek
00050000-5596-52aa-0418-801c46baa4b4	9245	Spodnji Ivanjci
00050000-5596-52aa-2207-6fd5683294cb	2277	Središče ob Dravi
00050000-5596-52aa-735a-030686f5ac24	4267	Srednja vas v Bohinju
00050000-5596-52aa-0b6e-5348a9e42cd1	8256	Sromlje 
00050000-5596-52aa-a2f8-5a22284aaece	5224	Srpenica
00050000-5596-52aa-636f-a53ab7edb666	1242	Stahovica
00050000-5596-52aa-c955-c51d29337920	1332	Stara Cerkev
00050000-5596-52aa-b37d-f47093cbb973	8342	Stari trg ob Kolpi
00050000-5596-52aa-c93d-d7ce70b04d4d	1386	Stari trg pri Ložu
00050000-5596-52aa-6e14-f8a608aeb5fa	2205	Starše
00050000-5596-52aa-7e32-636dada68f61	2289	Stoperce
00050000-5596-52aa-2397-3618fbc05c8a	8322	Stopiče
00050000-5596-52aa-06b1-f88e1941ea08	3206	Stranice
00050000-5596-52aa-5a14-db2b72ee2331	8351	Straža
00050000-5596-52aa-9784-8f07568ab0c4	1313	Struge
00050000-5596-52aa-5b97-eb0f9cd1e2f0	8293	Studenec
00050000-5596-52aa-97d4-b430dfe5a0ad	8331	Suhor
00050000-5596-52aa-44fd-69cb8a9edbcb	2233	Sv. Ana v Slovenskih goricah
00050000-5596-52aa-6227-1fd2e5413100	2235	Sv. Trojica v Slovenskih goricah
00050000-5596-52aa-680a-5dc0f9f5b35e	2353	Sveti Duh na Ostrem Vrhu
00050000-5596-52aa-2563-02b7b0ecab18	9244	Sveti Jurij ob Ščavnici
00050000-5596-52aa-2a1f-1a906fcd519a	3264	Sveti Štefan
00050000-5596-52aa-55da-e0516c9b21be	2258	Sveti Tomaž
00050000-5596-52aa-1fac-26eb12284e10	9204	Šalovci
00050000-5596-52aa-6d80-e1d44f3fe168	5261	Šempas
00050000-5596-52aa-5625-f1566d807422	5290	Šempeter pri Gorici
00050000-5596-52aa-021d-25db4ebafc01	3311	Šempeter v Savinjski dolini
00050000-5596-52aa-e2e0-666adf7af28a	4208	Šenčur
00050000-5596-52aa-c88f-d1261d455ed0	2212	Šentilj v Slovenskih goricah
00050000-5596-52aa-3d89-99815daa2a4c	8297	Šentjanž
00050000-5596-52aa-37ca-4789e5cf789b	2373	Šentjanž pri Dravogradu
00050000-5596-52aa-feed-aee2f9111be3	8310	Šentjernej
00050000-5596-52aa-06f1-3efca6550044	3230	Šentjur
00050000-5596-52aa-bcab-478bb3a6f809	3271	Šentrupert
00050000-5596-52aa-ce64-1da279778cc8	8232	Šentrupert
00050000-5596-52aa-c8aa-a6a4fede56c9	1296	Šentvid pri Stični
00050000-5596-52aa-6266-d2ef436141d1	8275	Škocjan
00050000-5596-52aa-e663-df53a21e94b6	6281	Škofije
00050000-5596-52aa-5b4e-73e0866befd5	4220	Škofja Loka
00050000-5596-52aa-377f-45d689346161	3211	Škofja vas
00050000-5596-52aa-763e-167f4fe822d3	1291	Škofljica
00050000-5596-52aa-339a-427d39406d14	6274	Šmarje
00050000-5596-52aa-de67-a7727afcf7cc	1293	Šmarje - Sap
00050000-5596-52aa-6156-8a97aae49d6c	3240	Šmarje pri Jelšah
00050000-5596-52aa-0aea-699d0664997b	8220	Šmarješke Toplice
00050000-5596-52aa-bfc2-5ec8be887488	2315	Šmartno na Pohorju
00050000-5596-52aa-93db-4730e5ae4bbd	3341	Šmartno ob Dreti
00050000-5596-52aa-3d1d-b2c19895a613	3327	Šmartno ob Paki
00050000-5596-52aa-4878-ee917216c8df	1275	Šmartno pri Litiji
00050000-5596-52aa-7bd4-60a6f1820f63	2383	Šmartno pri Slovenj Gradcu
00050000-5596-52aa-86ef-c53f0a54bc04	3201	Šmartno v Rožni dolini
00050000-5596-52aa-5cea-58f08be68738	3325	Šoštanj
00050000-5596-52aa-594e-ccddf9b65fce	6222	Štanjel
00050000-5596-52aa-0e92-bdc540534aea	3220	Štore
00050000-5596-52aa-83d1-4c7df5a0bf85	3304	Tabor
00050000-5596-52aa-7fc1-e16dcd812d88	3221	Teharje
00050000-5596-52aa-5699-7e6a4b8de649	9251	Tišina
00050000-5596-52aa-53eb-e21741f1936c	5220	Tolmin
00050000-5596-52aa-d7ba-a4affc910b82	3326	Topolšica
00050000-5596-52aa-f8bc-dc009c7192e8	2371	Trbonje
00050000-5596-52aa-cdfa-4205145fc49e	1420	Trbovlje
00050000-5596-52aa-f1ec-a6b8e2a7cdd3	8231	Trebelno 
00050000-5596-52aa-448c-a87d8040d671	8210	Trebnje
00050000-5596-52aa-f84c-09bc139891e1	5252	Trnovo pri Gorici
00050000-5596-52aa-ca49-2ffc273c88d8	2254	Trnovska vas
00050000-5596-52aa-946c-f6f817d6184d	1222	Trojane
00050000-5596-52aa-96bc-394772742b50	1236	Trzin
00050000-5596-52aa-f2b3-d5b9e43bad45	4290	Tržič
00050000-5596-52aa-f042-be4a9b12bee7	8295	Tržišče
00050000-5596-52aa-9d1f-30f21763ff79	1311	Turjak
00050000-5596-52aa-4fad-b06395f0fe6f	9224	Turnišče
00050000-5596-52aa-58b3-02d5d32a4955	8323	Uršna sela
00050000-5596-52aa-e824-f0702925f6ed	1252	Vače
00050000-5596-52aa-10be-b4fa2273af24	3320	Velenje 
00050000-5596-52aa-ff5f-e99ece570312	3322	Velenje - poštni predali
00050000-5596-52aa-c76a-ccbf659076b1	8212	Velika Loka
00050000-5596-52aa-0dfb-955007267fb1	2274	Velika Nedelja
00050000-5596-52aa-ccf8-09660da12d40	9225	Velika Polana
00050000-5596-52aa-8080-d72df90aa11c	1315	Velike Lašče
00050000-5596-52aa-c170-5b92e8be90ed	8213	Veliki Gaber
00050000-5596-52aa-8600-3156d8727e8a	9241	Veržej
00050000-5596-52aa-6f06-9bd7fddb2dcf	1312	Videm - Dobrepolje
00050000-5596-52aa-5709-4178ed9c849f	2284	Videm pri Ptuju
00050000-5596-52aa-0be3-7d95809b1018	8344	Vinica
00050000-5596-52aa-086b-8955d9ef749a	5271	Vipava
00050000-5596-52aa-7815-ebc7e94fd189	4212	Visoko
00050000-5596-52aa-65ef-2e12f5195888	1294	Višnja Gora
00050000-5596-52aa-45bc-7b57c539cab1	3205	Vitanje
00050000-5596-52aa-5df7-7c781eb2e588	2255	Vitomarci
00050000-5596-52aa-68c2-751a9ed6ecd4	1217	Vodice
00050000-5596-52aa-f1cd-1b9f0b206717	3212	Vojnik\t
00050000-5596-52aa-9a73-5db5fd3e94fb	5293	Volčja Draga
00050000-5596-52aa-62e7-d70008f57f11	2232	Voličina
00050000-5596-52aa-625a-8f50e469e2b0	3305	Vransko
00050000-5596-52aa-e37c-55a5788bfcfc	6217	Vremski Britof
00050000-5596-52aa-738e-e9478ee32b11	1360	Vrhnika
00050000-5596-52aa-b537-89998db35223	2365	Vuhred
00050000-5596-52aa-436c-61804365a5a8	2367	Vuzenica
00050000-5596-52aa-133b-3a6e2ffd0a68	8292	Zabukovje 
00050000-5596-52aa-7948-709fe30b5a8c	1410	Zagorje ob Savi
00050000-5596-52aa-71b9-f49011442c82	1303	Zagradec
00050000-5596-52aa-134c-c1e60aef1a0f	2283	Zavrč
00050000-5596-52aa-0e1f-3486d4ffae50	8272	Zdole 
00050000-5596-52aa-cd37-d33ca04bf8f1	4201	Zgornja Besnica
00050000-5596-52aa-2cc8-4b1fe7380330	2242	Zgornja Korena
00050000-5596-52aa-fe3e-3efbf7e52b87	2201	Zgornja Kungota
00050000-5596-52aa-38bf-6529618356ca	2316	Zgornja Ložnica
00050000-5596-52aa-26e9-7b4a3d15c601	2314	Zgornja Polskava
00050000-5596-52aa-5910-8b2590d64f75	2213	Zgornja Velka
00050000-5596-52aa-5c02-ef16e2b762ac	4247	Zgornje Gorje
00050000-5596-52aa-0b8c-5ba4c1d35e91	4206	Zgornje Jezersko
00050000-5596-52aa-fa56-dc5308f0a54e	2285	Zgornji Leskovec
00050000-5596-52aa-84cf-559002b6e424	1432	Zidani Most
00050000-5596-52aa-f45c-5bd71326d011	3214	Zreče
00050000-5596-52aa-51c7-299482ac1e17	4209	Žabnica
00050000-5596-52aa-beaa-d8a869056017	3310	Žalec
00050000-5596-52aa-1aa2-cf525c128716	4228	Železniki
00050000-5596-52aa-b873-00e823ef96e1	2287	Žetale
00050000-5596-52aa-8dbb-88bf5af2a342	4226	Žiri
00050000-5596-52aa-c15c-d3fc7e080df2	4274	Žirovnica
00050000-5596-52aa-bd47-b4e46df94ace	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8944887)
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
-- TOC entry 2859 (class 0 OID 8944698)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8944776)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8944899)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8945202)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 8945213)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5596-52ab-b073-5a5f7885963d	00080000-5596-52ab-e15c-82e59e890e33	0900	AK
00190000-5596-52ab-2445-e9d8dce8559b	00080000-5596-52ab-e297-405dc4a495a4	0987	A
00190000-5596-52ab-0d6e-971b1791711c	00080000-5596-52ab-de82-36c182d3472c	0989	A
00190000-5596-52ab-7d4d-c2e1dc8f0e57	00080000-5596-52ab-f2e9-dade98b7f480	0986	A
00190000-5596-52ab-f18f-34eddf7de4ab	00080000-5596-52ab-fbf5-62b9dd849a64	0984	A
00190000-5596-52ab-d2ba-bfe12e765420	00080000-5596-52ab-ab0c-fe514fa0056a	0983	A
00190000-5596-52ab-1aeb-25d5beafe088	00080000-5596-52ab-34aa-7fa3342e91a2	0982	A
\.


--
-- TOC entry 2901 (class 0 OID 8945183)
-- Dependencies: 230
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
-- TOC entry 2883 (class 0 OID 8944928)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5596-52ab-120d-93e49d3d9df1	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5596-52ab-6eba-0afc9e7712e9	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5596-52ab-0185-8047f1597c09	0003	Kazinska	t	84	Kazinska dvorana
00220000-5596-52ab-06af-5b6250c93ef0	0004	Mali oder	t	24	Mali oder 
00220000-5596-52ab-c513-d6e9158bb263	0005	Komorni oder	t	15	Komorni oder
00220000-5596-52ab-1243-c80d67ea6390	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5596-52ab-3b7b-3d6749ea08d6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8944872)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8944862)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 8945046)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8944996)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8944570)
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
-- TOC entry 2884 (class 0 OID 8944938)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8944608)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5596-52aa-b522-1577a4dd82de	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5596-52aa-32fa-9b4ad1db6685	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5596-52aa-bf61-d10afc6cd3c5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5596-52aa-c6af-78184e2cdcc1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5596-52aa-138d-7e998dd6edd8	planer	Planer dogodkov v koledarju	t
00020000-5596-52aa-61da-841b07b82256	kadrovska	Kadrovska služba	t
00020000-5596-52aa-01c5-2deced16bbbe	arhivar	Ažuriranje arhivalij	t
00020000-5596-52aa-ed8d-5ed4bc0564e1	igralec	Igralec	t
00020000-5596-52aa-09d3-512b9e7f6cce	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5596-52ab-deef-6726bef5f270	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8944592)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5596-52aa-bf01-57a93970b41b	00020000-5596-52aa-bf61-d10afc6cd3c5
00010000-5596-52aa-c146-d71467cc15d1	00020000-5596-52aa-bf61-d10afc6cd3c5
00010000-5596-52ab-be0e-cbd19b35af07	00020000-5596-52ab-deef-6726bef5f270
\.


--
-- TOC entry 2886 (class 0 OID 8944952)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8944893)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8944843)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8945252)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5596-52aa-bcd3-e9103524f294	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5596-52aa-e89e-cee2764339cd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5596-52aa-cd10-b74c1a58a63a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5596-52aa-55a8-12d8494ebac4	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5596-52aa-2dfb-2b883b3d40a8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8945244)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5596-52aa-ed8c-06f4eab244bf	00230000-5596-52aa-55a8-12d8494ebac4	popa
00240000-5596-52aa-5a93-f23a1e0fd232	00230000-5596-52aa-55a8-12d8494ebac4	oseba
00240000-5596-52aa-3279-222dafb56eb9	00230000-5596-52aa-e89e-cee2764339cd	prostor
00240000-5596-52aa-ac6c-abb5b74b70b6	00230000-5596-52aa-55a8-12d8494ebac4	besedilo
00240000-5596-52aa-f407-064e5b05c239	00230000-5596-52aa-55a8-12d8494ebac4	uprizoritev
00240000-5596-52aa-55e9-c15b45a7f0e6	00230000-5596-52aa-55a8-12d8494ebac4	funkcija
00240000-5596-52aa-15a2-76672236cbb6	00230000-5596-52aa-55a8-12d8494ebac4	tipfunkcije
00240000-5596-52aa-26e5-2345d61abb9e	00230000-5596-52aa-55a8-12d8494ebac4	alternacija
00240000-5596-52aa-2928-a5e89719e2e9	00230000-5596-52aa-bcd3-e9103524f294	pogodba
00240000-5596-52aa-5030-f82ab643b641	00230000-5596-52aa-55a8-12d8494ebac4	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8945239)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8945006)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5596-52ab-0a44-8e8cebd55635	000e0000-5596-52ab-0434-3c2882fe9561	00080000-5596-52ab-fbcd-bd279bf0c0c8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5596-52ab-7109-3dcbc0351721	000e0000-5596-52ab-0434-3c2882fe9561	00080000-5596-52ab-fbcd-bd279bf0c0c8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5596-52ab-d6d5-11c4c1d61e36	000e0000-5596-52ab-0434-3c2882fe9561	00080000-5596-52ab-939f-83a6337ad666	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8944670)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8944849)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5596-52ab-e139-157a3e803f7e	00180000-5596-52ab-2365-c2d9e54024c6	000c0000-5596-52ab-900c-cab5ae3af0a4	00090000-5596-52ab-b9dd-bf81ce31995f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-52ab-dd1b-f132f36a3b0b	00180000-5596-52ab-2365-c2d9e54024c6	000c0000-5596-52ab-6101-92af3c257384	00090000-5596-52ab-96c1-aa4e9777156c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-52ab-a078-e16b9e0c33a2	00180000-5596-52ab-2365-c2d9e54024c6	000c0000-5596-52ab-5d34-e6957cf2d967	00090000-5596-52ab-0c27-78d230880acc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-52ab-fbad-cf48af4d1f12	00180000-5596-52ab-2365-c2d9e54024c6	000c0000-5596-52ab-da33-62f95806b7ab	00090000-5596-52ab-ae92-c67de6bfcaab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-52ab-e23d-af354de5e3b0	00180000-5596-52ab-2365-c2d9e54024c6	000c0000-5596-52ab-dc18-b88e15899e16	00090000-5596-52ab-04a5-83992ff65532	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-52ab-97aa-e072f6625bad	00180000-5596-52ab-03e3-9417b9ee72b8	\N	00090000-5596-52ab-04a5-83992ff65532	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2893 (class 0 OID 8945035)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5596-52aa-7ed9-6dbd0ca8ac01	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5596-52aa-9735-4f95a37470c8	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5596-52aa-e9df-39806959d7d7	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5596-52aa-9574-d8ee2c0537e3	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5596-52aa-222b-d1ecf5505c54	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5596-52aa-9a60-d453f276e210	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5596-52aa-8b3e-d8ad54aad85c	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5596-52aa-bdd0-c346b3f3d62e	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5596-52aa-f1ec-34424b1afe13	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5596-52aa-898c-4e9fccc6ca7c	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5596-52aa-8738-36c596e54a83	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5596-52aa-8b4a-2f9686b7fc73	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5596-52aa-0cce-0ffa1d3f5eeb	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5596-52aa-047c-1f98f40ff098	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5596-52aa-a04b-e6c406328632	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5596-52aa-aacd-07f5ce6c27e9	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8945221)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5596-52aa-74a6-02b1041eb82f	01	Velika predstava	f	1.00	1.00
002b0000-5596-52aa-0d42-f2816956d5c4	02	Mala predstava	f	0.50	0.50
002b0000-5596-52aa-eeb3-a9fccd7752cc	03	Mala koprodukcija	t	0.40	1.00
002b0000-5596-52aa-9efd-a7b58853cec7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5596-52aa-7e98-300974a7f455	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8944733)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8944579)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5596-52aa-c146-d71467cc15d1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO3tJbPUiM6rhDw1NZYU9UZkWmEAOCEGa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5596-52ab-8b56-2850ae379141	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5596-52ab-60ca-be9a01eb6dc1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5596-52ab-1122-359022903ae2	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5596-52ab-7aa4-ef5488909adb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5596-52ab-4924-cfe8a8db0ff2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5596-52ab-1bfd-f31673670f7b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5596-52ab-8353-d03e5aab0705	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5596-52ab-2147-c3bbd27f26d0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5596-52ab-9df8-a3043fc01def	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5596-52ab-be0e-cbd19b35af07	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5596-52aa-bf01-57a93970b41b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2897 (class 0 OID 8945084)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5596-52ab-86ce-24ace1b63da6	00160000-5596-52ab-12ba-eace8ff7e70f	00150000-5596-52aa-1dd5-31e43b6d6980	00140000-5596-52a9-5787-5b448c789bb3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5596-52ab-c513-d6e9158bb263
000e0000-5596-52ab-0434-3c2882fe9561	00160000-5596-52ab-c227-1c68e9b05174	00150000-5596-52aa-5e69-a8521c59925a	00140000-5596-52a9-39be-28ccef0856cd	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5596-52ab-1243-c80d67ea6390
000e0000-5596-52ab-1f21-63bbc3506b5f	\N	00150000-5596-52aa-5e69-a8521c59925a	00140000-5596-52a9-39be-28ccef0856cd	00190000-5596-52ab-2445-e9d8dce8559b	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5596-52ab-c513-d6e9158bb263
000e0000-5596-52ab-d717-2a5423298c33	\N	00150000-5596-52aa-5e69-a8521c59925a	00140000-5596-52a9-39be-28ccef0856cd	00190000-5596-52ab-2445-e9d8dce8559b	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5596-52ab-c513-d6e9158bb263
000e0000-5596-52ab-d9ed-6dd0d934119e	\N	00150000-5596-52aa-5e69-a8521c59925a	00140000-5596-52a9-39be-28ccef0856cd	00190000-5596-52ab-2445-e9d8dce8559b	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5596-52ab-120d-93e49d3d9df1
\.


--
-- TOC entry 2867 (class 0 OID 8944795)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5596-52ab-3e69-5354f1faf1f2	000e0000-5596-52ab-0434-3c2882fe9561	1	
00200000-5596-52ab-b0cf-9b5a2b5c735e	000e0000-5596-52ab-0434-3c2882fe9561	2	
\.


--
-- TOC entry 2882 (class 0 OID 8944920)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8944989)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8944827)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8945074)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5596-52a9-5787-5b448c789bb3	01	Drama	drama (SURS 01)
00140000-5596-52a9-496a-259eb9bb22a5	02	Opera	opera (SURS 02)
00140000-5596-52a9-7a72-6c381f87231f	03	Balet	balet (SURS 03)
00140000-5596-52a9-4ae6-7c0de7e15115	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5596-52a9-f3ef-4b23fd73229d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5596-52a9-39be-28ccef0856cd	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5596-52a9-5fd8-3d5c998fb1d8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8944979)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5596-52aa-8ff5-f1a51f229062	01	Opera	opera
00150000-5596-52aa-f834-4b799917591e	02	Opereta	opereta
00150000-5596-52aa-df6a-3f848da3a226	03	Balet	balet
00150000-5596-52aa-7022-31f0e1e338a6	04	Plesne prireditve	plesne prireditve
00150000-5596-52aa-2769-6938739bc97f	05	Lutkovno gledališče	lutkovno gledališče
00150000-5596-52aa-781d-2b6c89b5ecd3	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5596-52aa-e5eb-9db091d2fb2f	07	Biografska drama	biografska drama
00150000-5596-52aa-1dd5-31e43b6d6980	08	Komedija	komedija
00150000-5596-52aa-7d95-726e4a8dd521	09	Črna komedija	črna komedija
00150000-5596-52aa-6dab-3f96350c57eb	10	E-igra	E-igra
00150000-5596-52aa-5e69-a8521c59925a	11	Kriminalka	kriminalka
00150000-5596-52aa-3532-537e6f1ef13c	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8944633)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8945131)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8945121)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8945034)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8944817)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8944842)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8945237)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8944759)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 8945178)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8944975)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8944793)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8944836)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8944773)
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
-- TOC entry 2533 (class 2606 OID 8944885)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8944912)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8944731)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8944642)
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
-- TOC entry 2448 (class 2606 OID 8944666)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8944622)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8944607)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8944918)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8944951)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 8945069)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8944695)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8944719)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8944891)
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
-- TOC entry 2463 (class 2606 OID 8944709)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8944780)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8944903)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8945210)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8945218)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8945200)
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
-- TOC entry 2553 (class 2606 OID 8944935)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8944876)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8944867)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8945056)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8945003)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8944578)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8944942)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8944596)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8944616)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8944960)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8944898)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8944848)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8945261)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8945249)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8945243)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8945016)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8944675)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8944858)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8945045)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8945231)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8944744)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8944591)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8945100)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8944802)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8944926)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8944994)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8944831)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 8945082)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8944987)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8944824)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8945017)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8945018)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8944697)
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
-- TOC entry 2546 (class 1259 OID 8944919)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8944905)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8944904)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8944803)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8944976)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8944978)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8944977)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8944775)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8944774)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 8945071)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 8945072)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8945073)
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
-- TOC entry 2600 (class 1259 OID 8945105)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 8945102)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 8945106)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 8945104)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 8945103)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8944746)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8944745)
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
-- TOC entry 2446 (class 1259 OID 8944669)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8944943)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8944837)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8944623)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8944624)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8944963)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8944962)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8944961)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8944781)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8944783)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8944782)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8945251)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8944871)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8944869)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8944868)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8944870)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8944597)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8944598)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8944927)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8944892)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8945004)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8945005)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 8945182)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 8945179)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8945180)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2624 (class 1259 OID 8945181)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8944711)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8944710)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8944712)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2628 (class 1259 OID 8945211)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2629 (class 1259 OID 8945212)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 8945135)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 8945136)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 8945133)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 8945134)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8944995)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8944880)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8944879)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8944877)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8944878)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2610 (class 1259 OID 8945123)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 8945122)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2625 (class 1259 OID 8945201)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8944794)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8945238)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8944644)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8944643)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8944676)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8944677)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8944861)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8944860)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8944859)
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
-- TOC entry 2498 (class 1259 OID 8944826)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8944822)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8944819)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8944820)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8944818)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8944823)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8944821)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8944696)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8944760)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8944762)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8944761)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8944763)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8944886)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 8945070)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8945101)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8944667)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8944668)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8944988)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8945262)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8944732)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8945250)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8944937)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8944936)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 8945132)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8944720)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8945083)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 8945219)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 8945220)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8944617)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8944825)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8945398)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8945383)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8945388)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8945408)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8945378)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8945403)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8945393)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8945553)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8945558)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8945313)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8945493)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8945488)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8945483)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8945373)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8945523)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8945533)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8945528)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8945348)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8945343)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8945473)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8945563)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 8945568)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 8945573)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2714 (class 2606 OID 8945593)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2717 (class 2606 OID 8945578)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2713 (class 2606 OID 8945598)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2715 (class 2606 OID 8945588)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2716 (class 2606 OID 8945583)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8945338)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8945333)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8945298)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8945293)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8945503)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8945413)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8945273)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8945278)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8945518)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8945513)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8945508)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8945353)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8945363)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8945358)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8945678)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8945448)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8945438)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8945433)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8945443)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8945263)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8945268)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8945498)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8945478)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8945543)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8945548)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2724 (class 2606 OID 8945648)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 8945633)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2726 (class 2606 OID 8945638)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2725 (class 2606 OID 8945643)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8945323)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8945318)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8945328)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2730 (class 2606 OID 8945658)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2729 (class 2606 OID 8945663)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2721 (class 2606 OID 8945623)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 8945628)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2723 (class 2606 OID 8945613)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2722 (class 2606 OID 8945618)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8945538)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8945468)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8945463)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8945453)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8945458)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2718 (class 2606 OID 8945608)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2719 (class 2606 OID 8945603)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2728 (class 2606 OID 8945653)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8945368)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2731 (class 2606 OID 8945668)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8945673)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8945288)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8945283)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8945303)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8945308)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8945428)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8945423)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8945418)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-03 11:15:24 CEST

--
-- PostgreSQL database dump complete
--

