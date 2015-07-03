--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-03 12:15:03 CEST

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
-- TOC entry 183 (class 1259 OID 8967502)
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
-- TOC entry 228 (class 1259 OID 8968001)
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
-- TOC entry 227 (class 1259 OID 8967984)
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
-- TOC entry 221 (class 1259 OID 8967896)
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
-- TOC entry 197 (class 1259 OID 8967681)
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
-- TOC entry 200 (class 1259 OID 8967715)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8968109)
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
-- TOC entry 192 (class 1259 OID 8967624)
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
-- TOC entry 229 (class 1259 OID 8968014)
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
-- TOC entry 216 (class 1259 OID 8967841)
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
-- TOC entry 195 (class 1259 OID 8967661)
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
-- TOC entry 199 (class 1259 OID 8967709)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8967641)
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
-- TOC entry 205 (class 1259 OID 8967758)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8967783)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8967598)
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
-- TOC entry 184 (class 1259 OID 8967511)
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
-- TOC entry 185 (class 1259 OID 8967522)
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
-- TOC entry 180 (class 1259 OID 8967476)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8967495)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8967790)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8967821)
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
-- TOC entry 224 (class 1259 OID 8967934)
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
-- TOC entry 187 (class 1259 OID 8967555)
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
-- TOC entry 189 (class 1259 OID 8967590)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8967764)
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
-- TOC entry 188 (class 1259 OID 8967575)
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
-- TOC entry 194 (class 1259 OID 8967653)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8967776)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 8968079)
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
-- TOC entry 232 (class 1259 OID 8968090)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 8968060)
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
-- TOC entry 212 (class 1259 OID 8967805)
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
-- TOC entry 204 (class 1259 OID 8967749)
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
-- TOC entry 203 (class 1259 OID 8967739)
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
-- TOC entry 223 (class 1259 OID 8967923)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8967873)
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
-- TOC entry 177 (class 1259 OID 8967447)
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
-- TOC entry 176 (class 1259 OID 8967445)
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
-- TOC entry 213 (class 1259 OID 8967815)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8967485)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8967469)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8967829)
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
-- TOC entry 207 (class 1259 OID 8967770)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8967720)
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
-- TOC entry 237 (class 1259 OID 8968129)
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
-- TOC entry 236 (class 1259 OID 8968121)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8968116)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8967883)
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
-- TOC entry 186 (class 1259 OID 8967547)
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
-- TOC entry 202 (class 1259 OID 8967726)
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
-- TOC entry 222 (class 1259 OID 8967912)
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
-- TOC entry 233 (class 1259 OID 8968098)
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
-- TOC entry 191 (class 1259 OID 8967610)
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
-- TOC entry 178 (class 1259 OID 8967456)
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
-- TOC entry 226 (class 1259 OID 8967961)
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
-- TOC entry 196 (class 1259 OID 8967672)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8967797)
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
-- TOC entry 218 (class 1259 OID 8967866)
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
-- TOC entry 198 (class 1259 OID 8967704)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 8967951)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8967856)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8967450)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8967502)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8968001)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5596-60a6-d6b6-a99a6ec03990	000d0000-5596-60a6-3eb2-c835e65b0b20	\N	00090000-5596-60a6-026d-cf57fc3d8dec	000b0000-5596-60a6-2725-7441d135334d	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-60a6-17fb-022b5b6d6eba	000d0000-5596-60a6-8389-a2a770988198	\N	00090000-5596-60a6-16c3-ee40fd27ce8e	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-60a6-a41a-3ac61e66a134	000d0000-5596-60a6-847d-fae0b92d51c1	\N	00090000-5596-60a6-b97b-622cc03dcc5b	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-60a6-bebf-c945ef5c87c2	000d0000-5596-60a6-b9bb-42b14d0b158d	\N	00090000-5596-60a6-4c35-bf1ef1cea7cb	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-60a6-94f7-d7cacefe41cd	000d0000-5596-60a6-0557-4cf19cbee0e4	\N	00090000-5596-60a6-3ba8-a06cf81dcc77	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-60a6-a1a3-52d3edcf6391	000d0000-5596-60a6-b47d-449938cf4732	\N	00090000-5596-60a6-16c3-ee40fd27ce8e	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 8967984)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8967896)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5596-60a6-cc60-b1e76b9007eb	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5596-60a6-1a86-a93712ea3c35	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5596-60a6-96fc-34e23f9cff41	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8967681)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5596-60a6-0469-a13176e3f21b	\N	\N	00200000-5596-60a6-9b3e-62b048cc3f91	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5596-60a6-e99c-6858a35c841f	\N	\N	00200000-5596-60a6-3279-ae6f6f67985b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5596-60a6-1b27-522cfe0f26e4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5596-60a6-7e4d-b6cad953b535	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5596-60a6-fa29-8562fe302662	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8967715)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8968109)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8967624)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5596-60a4-5825-cf0093bb18c7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5596-60a4-6775-ee3519ed2d3a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5596-60a4-27b9-f30fc1764142	AL	ALB	008	Albania 	Albanija	\N
00040000-5596-60a4-b0bc-17c60bb592b9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5596-60a4-2a83-f14ceba4d8d0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5596-60a4-dab2-9d3b4024b00d	AD	AND	020	Andorra 	Andora	\N
00040000-5596-60a4-deea-1869640cec70	AO	AGO	024	Angola 	Angola	\N
00040000-5596-60a4-5f08-e99d7cf6a9f4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5596-60a4-62df-47b5c9385300	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5596-60a4-37c4-cebbbc5b4647	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-60a4-2dd6-00f748eb2e45	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5596-60a4-a587-c45381b9efdf	AM	ARM	051	Armenia 	Armenija	\N
00040000-5596-60a4-d6bb-29e9ec949c46	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5596-60a4-362b-80d74da4afbd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5596-60a4-4204-2cf9f8a8f98f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5596-60a4-8fa9-977fda4a0039	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5596-60a4-da93-c6fc20ee72d3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5596-60a4-16ae-afde7212acd9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5596-60a4-30b1-581ad0ae25cf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5596-60a4-9265-57d7f9dbbc61	BB	BRB	052	Barbados 	Barbados	\N
00040000-5596-60a4-c194-65d3d6c7ab2f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5596-60a4-a360-e95fc968e247	BE	BEL	056	Belgium 	Belgija	\N
00040000-5596-60a4-457a-951468b82e59	BZ	BLZ	084	Belize 	Belize	\N
00040000-5596-60a4-b869-819dbf42327d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5596-60a4-43a8-386604026942	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5596-60a4-abab-57e0942b34d5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5596-60a4-33ed-d7e961aa825e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5596-60a4-158c-e3f75e54638b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5596-60a4-d7e6-1e67f9cb5f4d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5596-60a4-f994-682d03301e23	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5596-60a4-578e-bf7a3626a045	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5596-60a4-3f2f-bdf9a3c23e25	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5596-60a4-217d-403029e87091	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5596-60a4-1465-a9cc6e7f1e21	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5596-60a4-b67f-cedd64f11514	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5596-60a4-0264-9269a585cea8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5596-60a4-6f90-530bf014b165	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5596-60a4-45a0-5e42392912c2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5596-60a4-702a-cb40ca28c1b1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5596-60a4-a783-f108288844d6	CA	CAN	124	Canada 	Kanada	\N
00040000-5596-60a4-f163-f43da7a575d6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5596-60a4-ed34-94ce1c6c6a5e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5596-60a4-9af0-ac131c27b823	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5596-60a4-e54a-88e1ccdbe8ba	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5596-60a4-2086-f6f6752d70ea	CL	CHL	152	Chile 	Čile	\N
00040000-5596-60a4-a898-afe78226e7f8	CN	CHN	156	China 	Kitajska	\N
00040000-5596-60a4-1b8a-b1977a8ef38b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5596-60a4-303b-2ef929cc4df5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5596-60a4-28a6-0631fa11352e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5596-60a4-011b-b435163a5c1c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5596-60a4-d9a5-a2204ba73fa9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5596-60a4-f345-55c0ed3c704a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5596-60a4-2561-87ef15fd2fab	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5596-60a4-f764-f8688fbe5d63	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5596-60a4-6d3b-2469082cb8f6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5596-60a4-38f5-42a8af78519e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5596-60a4-c876-950b87083611	CU	CUB	192	Cuba 	Kuba	\N
00040000-5596-60a4-9e4f-fbeed3632cec	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5596-60a4-a971-d126d321d3fc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5596-60a4-0a9b-e92842ca8cd5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5596-60a4-382d-3dd0b079b6bb	DK	DNK	208	Denmark 	Danska	\N
00040000-5596-60a4-5c92-2123ab2f532a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5596-60a4-6c46-21f687e2fb38	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-60a4-562b-ca478aca8771	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5596-60a4-104d-c5d0da6e7ba5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5596-60a4-2780-63e2a74cbac9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5596-60a4-18d7-26368d742f82	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5596-60a4-1424-64d1fd812fc9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5596-60a4-5729-7d46a72007a7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5596-60a4-1397-7a8f72a5c063	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5596-60a4-8626-ee552347a6cb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5596-60a4-af3a-92427ebc8674	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5596-60a4-ed95-15abfa9cec68	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5596-60a4-7090-13822328dd84	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5596-60a4-70b0-6bf10783fecb	FI	FIN	246	Finland 	Finska	\N
00040000-5596-60a4-370d-649ab6668f3e	FR	FRA	250	France 	Francija	\N
00040000-5596-60a4-4c60-99a8de32a9a5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5596-60a4-7ec6-6bf494816cfa	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5596-60a4-1711-904b06ce9634	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5596-60a4-c50f-86b188ce9883	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5596-60a4-73d5-dba6d1bb0755	GA	GAB	266	Gabon 	Gabon	\N
00040000-5596-60a4-ac19-a6a1131fef36	GM	GMB	270	Gambia 	Gambija	\N
00040000-5596-60a4-a676-096fbfb6709c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5596-60a4-8f35-219d462ead7f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5596-60a4-79a1-c791f2ce79a3	GH	GHA	288	Ghana 	Gana	\N
00040000-5596-60a4-c087-e6c255d9c0f6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5596-60a4-c108-ee5d058c990b	GR	GRC	300	Greece 	Grčija	\N
00040000-5596-60a4-10c7-e49ecbe81843	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5596-60a4-23d4-a5e47d8c5efe	GD	GRD	308	Grenada 	Grenada	\N
00040000-5596-60a4-a5d7-df7a090b4a56	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5596-60a4-2f5c-9505f4578d47	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5596-60a4-8334-a2e5f72d832e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5596-60a4-08a1-6b2f5d581186	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5596-60a4-be99-45c95e3c1e80	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5596-60a4-7ccd-207487d1addb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5596-60a4-6718-75e54aa7ef7a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5596-60a4-154d-2a7231564d66	HT	HTI	332	Haiti 	Haiti	\N
00040000-5596-60a4-396a-e113ae71908d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5596-60a4-32cb-7887f2e96d8c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5596-60a4-1ae3-2537966b8abe	HN	HND	340	Honduras 	Honduras	\N
00040000-5596-60a4-1d5b-7557e6af350e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5596-60a4-ef93-ef56bf009961	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5596-60a4-9797-19ec92c8a65f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5596-60a4-2353-7f24772f00cf	IN	IND	356	India 	Indija	\N
00040000-5596-60a4-a4fa-08a9f2a3703a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5596-60a4-535b-e3127b6e1638	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5596-60a4-d91d-9513129ca854	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5596-60a4-853e-355193ce6d8d	IE	IRL	372	Ireland 	Irska	\N
00040000-5596-60a4-9e79-a852c2efaa28	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5596-60a4-02e9-8ecae8ade158	IL	ISR	376	Israel 	Izrael	\N
00040000-5596-60a4-47e9-4386736fa77e	IT	ITA	380	Italy 	Italija	\N
00040000-5596-60a4-0e77-36736d0b326f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5596-60a4-0f74-864f33b2d045	JP	JPN	392	Japan 	Japonska	\N
00040000-5596-60a4-f51e-388a49013389	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5596-60a4-b808-806c831eaa1d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5596-60a4-31bb-fb72175c30b6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5596-60a4-8e65-f50a7cef15fb	KE	KEN	404	Kenya 	Kenija	\N
00040000-5596-60a4-78e6-2df8bf52d905	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5596-60a4-ae9f-3c87d71dbbe3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5596-60a4-2be6-e895528557b4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5596-60a4-b7e4-70dabc7d0ccf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5596-60a4-d700-dc267e680d9a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5596-60a4-b18f-f60288b258ed	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5596-60a4-2e27-61b4458fcd76	LV	LVA	428	Latvia 	Latvija	\N
00040000-5596-60a4-46c9-25329a13666f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5596-60a4-01c0-0812559c202b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5596-60a4-cb11-e5d6e2d81583	LR	LBR	430	Liberia 	Liberija	\N
00040000-5596-60a4-6d7d-b711b8ecd915	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5596-60a4-edb0-4ffd2314f062	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5596-60a4-7a35-d8e0177e0c92	LT	LTU	440	Lithuania 	Litva	\N
00040000-5596-60a4-4d39-39053ea62690	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5596-60a4-b6d8-4b1d9f8c75d9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5596-60a4-ca45-983507256556	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5596-60a4-856e-7d0228da0e48	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5596-60a4-77d2-e84292d69f68	MW	MWI	454	Malawi 	Malavi	\N
00040000-5596-60a4-1855-212223c9a9df	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5596-60a4-4faa-cd517289c27f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5596-60a4-6863-40386c91625c	ML	MLI	466	Mali 	Mali	\N
00040000-5596-60a4-5b19-faae027d1d88	MT	MLT	470	Malta 	Malta	\N
00040000-5596-60a4-157a-a5ebcab734e0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5596-60a4-b3c3-e1dcfe534ebb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5596-60a4-d696-b15ba2cf81af	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5596-60a4-835b-2059729e7ac5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5596-60a4-6c51-3f48e28ab357	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5596-60a4-4eef-33dea70664b8	MX	MEX	484	Mexico 	Mehika	\N
00040000-5596-60a4-c71a-073782492d21	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5596-60a4-becc-4987a40ffa05	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5596-60a4-4618-659479ac7e73	MC	MCO	492	Monaco 	Monako	\N
00040000-5596-60a4-3395-f0acbeb18ce9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5596-60a4-005c-6b378a5cf1d3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5596-60a4-fc59-f8a47b0118b1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5596-60a4-3525-f7cb4872bbdb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5596-60a4-27a2-764a281923f1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5596-60a4-fb62-fb43e65f7ebd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5596-60a4-2034-9dd0dfdcc811	NA	NAM	516	Namibia 	Namibija	\N
00040000-5596-60a4-8600-534b845bb287	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5596-60a4-899b-9d188d207dfd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5596-60a4-6867-12a4148d299e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5596-60a4-49c6-e4a1487adc88	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5596-60a4-7bb3-e845dac9fdbd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5596-60a4-7f09-aeac28bad495	NE	NER	562	Niger 	Niger 	\N
00040000-5596-60a4-84ce-d6f8bb89ff35	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5596-60a4-a848-070ad52ac079	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5596-60a4-a070-9d159409026c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5596-60a4-ea03-da7455334aa6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5596-60a4-fe31-1a01abec2163	NO	NOR	578	Norway 	Norveška	\N
00040000-5596-60a4-3b13-e8c81b833879	OM	OMN	512	Oman 	Oman	\N
00040000-5596-60a4-9a52-0c10b6b1f6d9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5596-60a4-004b-5633c0ed7d12	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5596-60a4-97e3-bd2f11a9da9c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5596-60a4-fce5-35e6eb171f32	PA	PAN	591	Panama 	Panama	\N
00040000-5596-60a4-5f3c-0eeccf6b3bef	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5596-60a4-86b9-fe0965db0fea	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5596-60a4-a43f-86fca441b692	PE	PER	604	Peru 	Peru	\N
00040000-5596-60a4-873b-01a961c6893f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5596-60a4-1fbe-567af96fcdb4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5596-60a4-5229-5425abc4e30f	PL	POL	616	Poland 	Poljska	\N
00040000-5596-60a4-6a3a-75899682113d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5596-60a4-5105-3cb17e4cb7f7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5596-60a4-b6cf-f73f325b8c13	QA	QAT	634	Qatar 	Katar	\N
00040000-5596-60a4-8f57-248bf4933e91	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5596-60a4-dea9-fccec077e721	RO	ROU	642	Romania 	Romunija	\N
00040000-5596-60a4-134f-0d69e0526f8a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5596-60a4-a4f8-2ed0bb03f511	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5596-60a4-1c3c-d841ba5c7a60	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5596-60a4-7a72-a89866ecade1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5596-60a4-77de-f5f870cb22b5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5596-60a4-bef1-3025752fa8c0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5596-60a4-b3f3-bb1c557e6ab2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5596-60a4-d5f3-cdfd7fa46063	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5596-60a4-9db4-b4badbb1b0a2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5596-60a4-0ea6-9f55a5fd3e2c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5596-60a4-49fe-cc11e54b2fdf	SM	SMR	674	San Marino 	San Marino	\N
00040000-5596-60a4-cae5-4fb15b8dfe13	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5596-60a4-573c-58cdfee7f000	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5596-60a4-7439-d4777102d1d3	SN	SEN	686	Senegal 	Senegal	\N
00040000-5596-60a4-01e5-a0fe5a639726	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5596-60a4-0caf-abaddd57be8b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5596-60a4-306e-30ddb1772ce5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5596-60a4-4c27-16a778f2f55d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5596-60a4-5788-2acbf2f9e763	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5596-60a4-0ce6-6fdc5e585e4f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5596-60a4-d5e6-34510382a043	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5596-60a4-f8e7-1437179bd962	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5596-60a4-a559-46de1a3234fc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5596-60a4-3495-dbc42db0de6d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5596-60a4-caaf-0819f8d14528	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5596-60a4-fffa-8c626b4f85d9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5596-60a4-b15c-1ba5d8d9e5fc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5596-60a4-afa9-dfe2afbcc2f8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5596-60a4-fd75-37fc11768369	SD	SDN	729	Sudan 	Sudan	\N
00040000-5596-60a4-2b64-58d017eacea7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5596-60a4-0ea1-78c9d05818db	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5596-60a4-64c0-c68c01868d17	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5596-60a4-2262-d14743f957ae	SE	SWE	752	Sweden 	Švedska	\N
00040000-5596-60a4-8726-81a6a859c3e0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5596-60a4-a4c7-daed76d9a5ca	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5596-60a4-32a1-c8b49b91c8df	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5596-60a4-cc38-b98b10efd00d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5596-60a4-9773-f9d8ce607e2e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5596-60a4-6203-2c01a1ce37f7	TH	THA	764	Thailand 	Tajska	\N
00040000-5596-60a4-e226-351a164a25f5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5596-60a4-074f-4a9a32101903	TG	TGO	768	Togo 	Togo	\N
00040000-5596-60a4-f33c-67be950dde83	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5596-60a4-43da-660098cf4ef5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5596-60a4-a662-845bb34747fd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5596-60a4-a151-ca09a65df2e6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5596-60a4-b0d5-29d16e02380c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5596-60a4-bc9d-f68e5e694c23	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5596-60a4-ad3a-7c3baaf65433	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-60a4-17b4-f628b690f735	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5596-60a4-5314-48878c8bb4cc	UG	UGA	800	Uganda 	Uganda	\N
00040000-5596-60a4-4707-ec3355b54fcd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5596-60a4-e880-ba38d88bcf89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5596-60a4-7d14-f69d9ce67417	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5596-60a4-5c6d-18898e180cdd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5596-60a4-9594-66af2042dc20	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5596-60a4-452a-174dbe668975	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5596-60a4-dcb0-3960ef694dd6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5596-60a4-9bd2-1e74ca222d11	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5596-60a4-2e8e-b158493446c0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5596-60a4-8bc6-831b826cfbd9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5596-60a4-43c6-b79af61ec8db	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-60a4-edb0-290bf6ca5c77	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5596-60a4-46df-96a93c2f4398	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5596-60a4-0068-0dd8bb9f5f72	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5596-60a4-fffa-e8bd6e8fec83	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5596-60a4-0a1a-e2db3b2257b4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5596-60a4-b595-e7789417c4c6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2900 (class 0 OID 8968014)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5596-60a6-3e6d-8c256a8261ba	000e0000-5596-60a6-2462-c1b763e48c70	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5596-60a5-efd9-69b1ace0ccc8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5596-60a6-1f79-6ac159f479bd	000e0000-5596-60a6-c765-2c965d86427d	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5596-60a5-a4f3-6d0ae79de024	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8967841)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5596-60a6-f19b-1f5ac80a5f03	000e0000-5596-60a6-c765-2c965d86427d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5596-60a5-7529-f72e814ca89e
000d0000-5596-60a6-3eb2-c835e65b0b20	000e0000-5596-60a6-c765-2c965d86427d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-60a5-7529-f72e814ca89e
000d0000-5596-60a6-8389-a2a770988198	000e0000-5596-60a6-c765-2c965d86427d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5596-60a5-510e-ce09e871d218
000d0000-5596-60a6-847d-fae0b92d51c1	000e0000-5596-60a6-c765-2c965d86427d	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5596-60a5-5696-8404be39dcaf
000d0000-5596-60a6-b9bb-42b14d0b158d	000e0000-5596-60a6-c765-2c965d86427d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5596-60a5-5696-8404be39dcaf
000d0000-5596-60a6-0557-4cf19cbee0e4	000e0000-5596-60a6-c765-2c965d86427d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5596-60a5-5696-8404be39dcaf
000d0000-5596-60a6-b47d-449938cf4732	000e0000-5596-60a6-c765-2c965d86427d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-60a5-7529-f72e814ca89e
\.


--
-- TOC entry 2866 (class 0 OID 8967661)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8967709)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8967641)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5596-60a6-8123-40d4bad263a5	00080000-5596-60a6-db68-5e3a90e0a813	00090000-5596-60a6-026d-cf57fc3d8dec	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8967758)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8967783)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8967598)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5596-60a4-0f68-0a0e94c7ee22	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5596-60a4-e580-1f891f13fd7c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5596-60a4-c8c0-3d70aa693e78	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5596-60a4-75fa-06018b5b997b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5596-60a4-f738-8f0a43a445bc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5596-60a4-9cf8-637b87493726	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5596-60a4-cf63-04a96ae4d82f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5596-60a4-e32e-9da8f133c8c3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-60a4-143a-0ab0f53033ca	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-60a4-5d8f-1faf79e4ec5f	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5596-60a4-06ba-6e7ea784eec3	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5596-60a4-fb1e-2e542b06917d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5596-60a4-893a-d7e918d5dbfe	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5596-60a6-c096-c38d5bc9551f	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5596-60a6-e03c-31c308951008	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5596-60a6-a128-a6b1124ec9a3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5596-60a6-b03a-980b9b653dad	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5596-60a6-799f-1a44909f53fc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5596-60a6-54b2-575aa4bc2295	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8967511)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5596-60a6-39ed-9df96b383009	00000000-5596-60a6-e03c-31c308951008	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5596-60a6-5d69-0bf65c1c6139	00000000-5596-60a6-e03c-31c308951008	00010000-5596-60a4-18ae-b3a7da011c6c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5596-60a6-3a70-4aae9d293f79	00000000-5596-60a6-a128-a6b1124ec9a3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8967522)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5596-60a6-bd50-3d9ae6b5366f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5596-60a6-4c35-bf1ef1cea7cb	00010000-5596-60a6-528d-ac4e8548bcbe	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5596-60a6-b97b-622cc03dcc5b	00010000-5596-60a6-0650-b149c2913ee0	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5596-60a6-d1b0-1e0f329d86d2	00010000-5596-60a6-259c-8651e8bfbff9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5596-60a6-4492-479c33ce037e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5596-60a6-e556-12a350232e9a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5596-60a6-229f-5f6355cb5c3e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5596-60a6-7ebd-58c6d60bbf9c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5596-60a6-026d-cf57fc3d8dec	00010000-5596-60a6-ca57-f727e3755f54	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5596-60a6-16c3-ee40fd27ce8e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5596-60a6-0ce6-6d471a13ced2	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5596-60a6-3ba8-a06cf81dcc77	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5596-60a6-b225-82dd625480a4	00010000-5596-60a6-a556-a53c4f9009c8	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8967476)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5596-60a4-9da4-e2e318f1cc05	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5596-60a4-9321-0f2f44e309e0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5596-60a4-41f6-9818eca2a08a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5596-60a4-5d8d-5f5c13ea8936	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5596-60a4-3b50-76069f1bc71c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5596-60a4-b463-35301ab56163	Abonma-read	Abonma - branje	f
00030000-5596-60a4-449e-095db33e0643	Abonma-write	Abonma - spreminjanje	f
00030000-5596-60a4-0e5d-232581c9296b	Alternacija-read	Alternacija - branje	f
00030000-5596-60a4-7d32-8dbb6b26f611	Alternacija-write	Alternacija - spreminjanje	f
00030000-5596-60a4-474d-0fa593c3ba3f	Arhivalija-read	Arhivalija - branje	f
00030000-5596-60a4-6d59-a9a3003bd6ba	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5596-60a4-6111-a7d2969edcb9	Besedilo-read	Besedilo - branje	f
00030000-5596-60a4-55c6-7538c0f0fadf	Besedilo-write	Besedilo - spreminjanje	f
00030000-5596-60a4-636d-1ead544676ba	DogodekIzven-read	DogodekIzven - branje	f
00030000-5596-60a4-88a5-3d49695485fb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5596-60a4-ca08-766d4aa35276	Dogodek-read	Dogodek - branje	f
00030000-5596-60a4-9131-729577be67bc	Dogodek-write	Dogodek - spreminjanje	f
00030000-5596-60a4-f6e2-f4291f1d2623	DrugiVir-read	DrugiVir - branje	f
00030000-5596-60a4-3a45-ea7c3f968e86	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5596-60a4-c262-5782bc459c2b	Drzava-read	Drzava - branje	f
00030000-5596-60a4-c89c-2abe0f7010cf	Drzava-write	Drzava - spreminjanje	f
00030000-5596-60a4-05f6-bbdb9928ca49	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5596-60a4-bc3f-47beab11e5ae	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5596-60a4-5b84-04e588dc3591	Funkcija-read	Funkcija - branje	f
00030000-5596-60a4-a3bb-3cbddee4544c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5596-60a4-3187-60d9d2d55604	Gostovanje-read	Gostovanje - branje	f
00030000-5596-60a4-e5aa-99d781323ce0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5596-60a4-9058-b0f8e2fed33f	Gostujoca-read	Gostujoca - branje	f
00030000-5596-60a4-4f44-8ad8aeadeb3e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5596-60a4-7e95-1703e97bd034	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5596-60a4-b3d1-6e3eb5aed640	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5596-60a4-b6a4-c4c31a5457ef	Kupec-read	Kupec - branje	f
00030000-5596-60a4-c139-1ad922e5cfa4	Kupec-write	Kupec - spreminjanje	f
00030000-5596-60a4-aa84-96feeb471d70	NacinPlacina-read	NacinPlacina - branje	f
00030000-5596-60a4-bdb2-7c2a6632c556	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5596-60a4-87e5-5e9c4ab99693	Option-read	Option - branje	f
00030000-5596-60a4-865d-00d211a82bf0	Option-write	Option - spreminjanje	f
00030000-5596-60a4-340d-94fbfff74ec2	OptionValue-read	OptionValue - branje	f
00030000-5596-60a4-6f12-66982c371a94	OptionValue-write	OptionValue - spreminjanje	f
00030000-5596-60a4-173f-18a247813d6a	Oseba-read	Oseba - branje	f
00030000-5596-60a4-0806-d33510738a94	Oseba-write	Oseba - spreminjanje	f
00030000-5596-60a4-0119-1410ccf19d99	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5596-60a4-6322-62a5a8754a88	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5596-60a4-bea0-6690b4accf2d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5596-60a4-00ba-1cca51bcb84d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5596-60a4-7b3e-ccccf3f22dad	Pogodba-read	Pogodba - branje	f
00030000-5596-60a4-794c-fb0957d2f4b1	Pogodba-write	Pogodba - spreminjanje	f
00030000-5596-60a4-4d66-bbac8da96784	Popa-read	Popa - branje	f
00030000-5596-60a4-4a63-f559ac945abe	Popa-write	Popa - spreminjanje	f
00030000-5596-60a4-2634-9535071d6f50	Posta-read	Posta - branje	f
00030000-5596-60a4-4864-f11f51900827	Posta-write	Posta - spreminjanje	f
00030000-5596-60a4-aafd-4b732dfd185d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5596-60a4-4037-be11480b1768	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5596-60a4-f41e-7b127a9f2554	PostniNaslov-read	PostniNaslov - branje	f
00030000-5596-60a4-5991-815dab59869c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5596-60a4-e19c-0ef79056cb09	Predstava-read	Predstava - branje	f
00030000-5596-60a4-d800-6e673538e010	Predstava-write	Predstava - spreminjanje	f
00030000-5596-60a4-b3d2-4fa6879e98b8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5596-60a4-99fe-5df8373e5176	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5596-60a4-43b2-cd9165e0836b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5596-60a4-259b-d396241162bd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5596-60a4-0c37-8c8802c573bc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5596-60a4-44dd-cdadc7cb75f2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5596-60a4-20f8-95171bba2f67	ProgramDela-read	ProgramDela - branje	f
00030000-5596-60a4-b08c-5893173b8d95	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5596-60a4-6e64-8261d7acb5e5	ProgramFestival-read	ProgramFestival - branje	f
00030000-5596-60a4-b20b-8cc8bea7418a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5596-60a4-aa8d-dc5aeb6231ff	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5596-60a4-8808-a22985fed19b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5596-60a4-8310-1a7825354268	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5596-60a4-4ee7-77a498db8f39	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5596-60a4-e561-c3a835d7e636	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5596-60a4-fe5f-b5d8308dfa46	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5596-60a4-06a2-e12dfb55b495	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5596-60a4-fa1f-d185f6a385a3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5596-60a4-3088-aaf46cd9de3e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5596-60a4-0b9e-9ed7913ce4aa	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5596-60a4-836f-5ba6446aabd4	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5596-60a4-b226-314ede7aaf3a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5596-60a4-8b5f-3f29ceb79499	ProgramRazno-read	ProgramRazno - branje	f
00030000-5596-60a4-25d2-acc0479f24fd	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5596-60a4-56d3-0a4d346cbd3b	Prostor-read	Prostor - branje	f
00030000-5596-60a4-6730-019986479602	Prostor-write	Prostor - spreminjanje	f
00030000-5596-60a4-bb72-f31b5adfb9a2	Racun-read	Racun - branje	f
00030000-5596-60a4-05df-a02e30c468aa	Racun-write	Racun - spreminjanje	f
00030000-5596-60a4-b03e-ebb35b055c83	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5596-60a4-5136-edb4cc177772	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5596-60a4-ff2c-f0e3dc9e5ca4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5596-60a4-ef94-722aeeb20486	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5596-60a4-7561-878a43c2fef0	Rekvizit-read	Rekvizit - branje	f
00030000-5596-60a4-1dfd-eb3ae84be9ed	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5596-60a4-0a59-2fb581c898e5	Revizija-read	Revizija - branje	f
00030000-5596-60a4-57f7-36949660d61e	Revizija-write	Revizija - spreminjanje	f
00030000-5596-60a4-dcff-c0cdd2112357	Rezervacija-read	Rezervacija - branje	f
00030000-5596-60a4-6275-1e91ef350fb1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5596-60a4-e306-4bbe6f8c9508	SedezniRed-read	SedezniRed - branje	f
00030000-5596-60a4-e9f4-7a5bc1f3c934	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5596-60a4-ed32-b0df85789838	Sedez-read	Sedez - branje	f
00030000-5596-60a4-4a72-b79175768a0d	Sedez-write	Sedez - spreminjanje	f
00030000-5596-60a4-d2ed-f746663fe2f8	Sezona-read	Sezona - branje	f
00030000-5596-60a4-d755-0811189cb0e7	Sezona-write	Sezona - spreminjanje	f
00030000-5596-60a4-bf7c-e7367ec37cab	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5596-60a4-ad51-566e9e4da999	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5596-60a4-61e3-3c0618a60bf3	Stevilcenje-read	Stevilcenje - branje	f
00030000-5596-60a4-f829-94343a079db7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5596-60a4-ded1-7a605c3672fb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5596-60a4-db3f-d71a85529124	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5596-60a4-250a-9984b67f6686	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5596-60a4-39bd-0ece0fc4c632	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5596-60a4-702c-1d124d28fb0d	Telefonska-read	Telefonska - branje	f
00030000-5596-60a4-e88e-ac3a84340a52	Telefonska-write	Telefonska - spreminjanje	f
00030000-5596-60a4-1df5-900a1bd0736c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5596-60a4-c1b4-5dc5cc495f9f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5596-60a4-aec9-143bee1b097f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5596-60a4-7c82-9839eea8c67f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5596-60a4-318d-0f1837888fa5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5596-60a4-7531-f99ed4e0421b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5596-60a4-964d-12dd3395c46c	Trr-read	Trr - branje	f
00030000-5596-60a4-9517-6f2ab5c9531b	Trr-write	Trr - spreminjanje	f
00030000-5596-60a4-be1b-792319457b8f	Uprizoritev-read	Uprizoritev - branje	f
00030000-5596-60a4-90b2-e75b9291fef4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5596-60a4-5d99-6bc552ab0bac	Vaja-read	Vaja - branje	f
00030000-5596-60a4-47b2-e5f1221eae57	Vaja-write	Vaja - spreminjanje	f
00030000-5596-60a4-7378-e3315895589f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5596-60a4-6461-765040e5c9b1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5596-60a4-5f6b-59e794ac91f3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5596-60a4-1779-a9f3a7c7d25e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5596-60a4-75c5-8cfce2c0d327	Zasedenost-read	Zasedenost - branje	f
00030000-5596-60a4-77f5-5ff79b830ee1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5596-60a4-e456-5d5a7a8e36a2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5596-60a4-3b36-0853cef52dca	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5596-60a4-a61a-644db5935134	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5596-60a4-80b1-a7d1b6e4331d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8967495)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5596-60a4-88b6-76c37e86d2eb	00030000-5596-60a4-9321-0f2f44e309e0
00020000-5596-60a4-7ee4-0dfa8832abfb	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-449e-095db33e0643
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-0e5d-232581c9296b
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-7d32-8dbb6b26f611
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-5d8d-5f5c13ea8936
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-9131-729577be67bc
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-c89c-2abe0f7010cf
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-5b84-04e588dc3591
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-a3bb-3cbddee4544c
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-e5aa-99d781323ce0
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-4f44-8ad8aeadeb3e
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-7e95-1703e97bd034
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-b3d1-6e3eb5aed640
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-173f-18a247813d6a
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-0806-d33510738a94
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-4a63-f559ac945abe
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-4864-f11f51900827
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-f41e-7b127a9f2554
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-5991-815dab59869c
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-d800-6e673538e010
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-0c37-8c8802c573bc
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-44dd-cdadc7cb75f2
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-6730-019986479602
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-ef94-722aeeb20486
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-1dfd-eb3ae84be9ed
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-d755-0811189cb0e7
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-aec9-143bee1b097f
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-be1b-792319457b8f
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-90b2-e75b9291fef4
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-5d99-6bc552ab0bac
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-47b2-e5f1221eae57
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-75c5-8cfce2c0d327
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-77f5-5ff79b830ee1
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a4-89d1-79b056616d66	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-7e95-1703e97bd034
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-b3d1-6e3eb5aed640
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-173f-18a247813d6a
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-0806-d33510738a94
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-f41e-7b127a9f2554
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-5991-815dab59869c
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-702c-1d124d28fb0d
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-e88e-ac3a84340a52
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-964d-12dd3395c46c
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-9517-6f2ab5c9531b
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-5f6b-59e794ac91f3
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-1779-a9f3a7c7d25e
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a4-130b-6f18ca9654f2	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-0e5d-232581c9296b
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-6d59-a9a3003bd6ba
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-6111-a7d2969edcb9
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-636d-1ead544676ba
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-5b84-04e588dc3591
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-7e95-1703e97bd034
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-173f-18a247813d6a
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-0c37-8c8802c573bc
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-aec9-143bee1b097f
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-5d99-6bc552ab0bac
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-75c5-8cfce2c0d327
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a4-3e62-e4110b540700	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-449e-095db33e0643
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-7d32-8dbb6b26f611
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-aec9-143bee1b097f
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a4-1880-5ccebc62682d	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-1df5-900a1bd0736c
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-41f6-9818eca2a08a
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-aec9-143bee1b097f
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a4-cc27-f966938241a8	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-9da4-e2e318f1cc05
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-9321-0f2f44e309e0
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-41f6-9818eca2a08a
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5d8d-5f5c13ea8936
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-3b50-76069f1bc71c
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b463-35301ab56163
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-449e-095db33e0643
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0e5d-232581c9296b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7d32-8dbb6b26f611
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-474d-0fa593c3ba3f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6d59-a9a3003bd6ba
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6111-a7d2969edcb9
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-55c6-7538c0f0fadf
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-636d-1ead544676ba
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-88a5-3d49695485fb
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ca08-766d4aa35276
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-9131-729577be67bc
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-c262-5782bc459c2b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-c89c-2abe0f7010cf
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-05f6-bbdb9928ca49
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-bc3f-47beab11e5ae
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5b84-04e588dc3591
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-a3bb-3cbddee4544c
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-3187-60d9d2d55604
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e5aa-99d781323ce0
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-9058-b0f8e2fed33f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4f44-8ad8aeadeb3e
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7e95-1703e97bd034
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b3d1-6e3eb5aed640
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b6a4-c4c31a5457ef
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-c139-1ad922e5cfa4
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-aa84-96feeb471d70
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-bdb2-7c2a6632c556
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-87e5-5e9c4ab99693
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-865d-00d211a82bf0
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-340d-94fbfff74ec2
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6f12-66982c371a94
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-173f-18a247813d6a
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0806-d33510738a94
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0119-1410ccf19d99
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6322-62a5a8754a88
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-bea0-6690b4accf2d
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-00ba-1cca51bcb84d
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7b3e-ccccf3f22dad
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-794c-fb0957d2f4b1
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4d66-bbac8da96784
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4a63-f559ac945abe
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-2634-9535071d6f50
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4864-f11f51900827
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-aafd-4b732dfd185d
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4037-be11480b1768
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-f41e-7b127a9f2554
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5991-815dab59869c
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e19c-0ef79056cb09
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-d800-6e673538e010
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b3d2-4fa6879e98b8
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-99fe-5df8373e5176
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-43b2-cd9165e0836b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-259b-d396241162bd
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0c37-8c8802c573bc
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-44dd-cdadc7cb75f2
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-20f8-95171bba2f67
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b08c-5893173b8d95
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6e64-8261d7acb5e5
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b20b-8cc8bea7418a
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-aa8d-dc5aeb6231ff
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-8808-a22985fed19b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-8310-1a7825354268
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4ee7-77a498db8f39
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e561-c3a835d7e636
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-fe5f-b5d8308dfa46
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-06a2-e12dfb55b495
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-fa1f-d185f6a385a3
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-3088-aaf46cd9de3e
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0b9e-9ed7913ce4aa
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-836f-5ba6446aabd4
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b226-314ede7aaf3a
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-8b5f-3f29ceb79499
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-25d2-acc0479f24fd
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-56d3-0a4d346cbd3b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6730-019986479602
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-bb72-f31b5adfb9a2
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-05df-a02e30c468aa
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-b03e-ebb35b055c83
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5136-edb4cc177772
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ff2c-f0e3dc9e5ca4
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ef94-722aeeb20486
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7561-878a43c2fef0
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-1dfd-eb3ae84be9ed
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-0a59-2fb581c898e5
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-57f7-36949660d61e
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-dcff-c0cdd2112357
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6275-1e91ef350fb1
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e306-4bbe6f8c9508
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e9f4-7a5bc1f3c934
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ed32-b0df85789838
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-4a72-b79175768a0d
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-d2ed-f746663fe2f8
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-d755-0811189cb0e7
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-bf7c-e7367ec37cab
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ad51-566e9e4da999
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-61e3-3c0618a60bf3
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-f829-94343a079db7
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-ded1-7a605c3672fb
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-db3f-d71a85529124
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-250a-9984b67f6686
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-39bd-0ece0fc4c632
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-702c-1d124d28fb0d
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e88e-ac3a84340a52
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-1df5-900a1bd0736c
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-c1b4-5dc5cc495f9f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-aec9-143bee1b097f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7c82-9839eea8c67f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-318d-0f1837888fa5
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7531-f99ed4e0421b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-964d-12dd3395c46c
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-9517-6f2ab5c9531b
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-be1b-792319457b8f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-90b2-e75b9291fef4
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5d99-6bc552ab0bac
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-47b2-e5f1221eae57
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-7378-e3315895589f
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-6461-765040e5c9b1
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-5f6b-59e794ac91f3
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-1779-a9f3a7c7d25e
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-75c5-8cfce2c0d327
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-77f5-5ff79b830ee1
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-e456-5d5a7a8e36a2
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-3b36-0853cef52dca
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-a61a-644db5935134
00020000-5596-60a6-338f-46cedf583275	00030000-5596-60a4-80b1-a7d1b6e4331d
\.


--
-- TOC entry 2881 (class 0 OID 8967790)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8967821)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8967934)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5596-60a6-2725-7441d135334d	00090000-5596-60a6-bd50-3d9ae6b5366f	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8967555)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5596-60a6-db68-5e3a90e0a813	00040000-5596-60a4-d5e6-34510382a043	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-db6b-b0d53f36713a	00040000-5596-60a4-d5e6-34510382a043	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5596-60a6-72ca-2488b6085c35	00040000-5596-60a4-d5e6-34510382a043	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-3072-b72d0011e5af	00040000-5596-60a4-d5e6-34510382a043	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-f4b1-49c23767fa34	00040000-5596-60a4-d5e6-34510382a043	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-a4ad-9713502f7a15	00040000-5596-60a4-2dd6-00f748eb2e45	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-ed26-fd4a9e3ddbe9	00040000-5596-60a4-38f5-42a8af78519e	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-fcd8-0fa2b0115d0d	00040000-5596-60a4-4204-2cf9f8a8f98f	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-60a6-7b29-77aeab8ade09	00040000-5596-60a4-d5e6-34510382a043	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8967590)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5596-60a4-2a11-a9f6a751d083	8341	Adlešiči
00050000-5596-60a4-7607-c3be70bb8680	5270	Ajdovščina
00050000-5596-60a4-b363-16787a1aaebd	6280	Ankaran/Ancarano
00050000-5596-60a4-5508-2fb289a7e343	9253	Apače
00050000-5596-60a4-847f-9f10cbc8aeff	8253	Artiče
00050000-5596-60a4-9c0a-1c2114cada54	4275	Begunje na Gorenjskem
00050000-5596-60a4-5782-c40c2bc4cea8	1382	Begunje pri Cerknici
00050000-5596-60a4-d092-95c66be04c60	9231	Beltinci
00050000-5596-60a4-3ee5-4cd0506db188	2234	Benedikt
00050000-5596-60a4-2041-12fe18a296d5	2345	Bistrica ob Dravi
00050000-5596-60a4-5f01-445eb878582f	3256	Bistrica ob Sotli
00050000-5596-60a4-ac5b-bfb8db44a372	8259	Bizeljsko
00050000-5596-60a4-e8c0-6f3fb7d011e0	1223	Blagovica
00050000-5596-60a5-de07-a8ba8c2e6512	8283	Blanca
00050000-5596-60a5-322c-494d9f3800a6	4260	Bled
00050000-5596-60a5-31ca-3d3c6d4b9e02	4273	Blejska Dobrava
00050000-5596-60a5-5e6c-3b8f2dc6db6c	9265	Bodonci
00050000-5596-60a5-e8dc-af4c56795b32	9222	Bogojina
00050000-5596-60a5-e603-2e5325c9875a	4263	Bohinjska Bela
00050000-5596-60a5-17aa-408970cba97d	4264	Bohinjska Bistrica
00050000-5596-60a5-020d-5601c9dc4c44	4265	Bohinjsko jezero
00050000-5596-60a5-44c0-0e32c2c5fc0b	1353	Borovnica
00050000-5596-60a5-b7d6-28b839831065	8294	Boštanj
00050000-5596-60a5-5def-407f03007c07	5230	Bovec
00050000-5596-60a5-d7f0-16370efbc7f3	5295	Branik
00050000-5596-60a5-83ca-fc4eb61c31e3	3314	Braslovče
00050000-5596-60a5-6dbe-9a170e1e0775	5223	Breginj
00050000-5596-60a5-c9d9-1a9b66da8238	8280	Brestanica
00050000-5596-60a5-3be3-b05aa4a4f6e7	2354	Bresternica
00050000-5596-60a5-53aa-35a207624fb2	4243	Brezje
00050000-5596-60a5-340e-4469a70b6e2c	1351	Brezovica pri Ljubljani
00050000-5596-60a5-4820-6642b1f30ae2	8250	Brežice
00050000-5596-60a5-7986-604562b54c54	4210	Brnik - Aerodrom
00050000-5596-60a5-7eba-f71d11910c80	8321	Brusnice
00050000-5596-60a5-db90-591b8bdbc941	3255	Buče
00050000-5596-60a5-8983-584907743966	8276	Bučka 
00050000-5596-60a5-41af-df54aac2e67e	9261	Cankova
00050000-5596-60a5-72f5-b507009a8726	3000	Celje 
00050000-5596-60a5-7792-2ed36386dadc	3001	Celje - poštni predali
00050000-5596-60a5-8afb-47cdccf35d37	4207	Cerklje na Gorenjskem
00050000-5596-60a5-835a-ac75f6f51025	8263	Cerklje ob Krki
00050000-5596-60a5-a790-6f22ab788cfd	1380	Cerknica
00050000-5596-60a5-9891-314d42b233da	5282	Cerkno
00050000-5596-60a5-1303-421e9807905d	2236	Cerkvenjak
00050000-5596-60a5-2a92-7efe5a28f07b	2215	Ceršak
00050000-5596-60a5-3bac-9b31ea180e66	2326	Cirkovce
00050000-5596-60a5-b171-db9984068479	2282	Cirkulane
00050000-5596-60a5-a22b-a2e251593211	5273	Col
00050000-5596-60a5-6e80-912a6ae7a0c3	8251	Čatež ob Savi
00050000-5596-60a5-bbec-1441c56b82a8	1413	Čemšenik
00050000-5596-60a5-63dc-be93f0c5797e	5253	Čepovan
00050000-5596-60a5-d80b-537d9dbe9b4a	9232	Črenšovci
00050000-5596-60a5-7303-45f2b8a47ee2	2393	Črna na Koroškem
00050000-5596-60a5-0649-ab34412c5f5e	6275	Črni Kal
00050000-5596-60a5-619d-80d561d893a5	5274	Črni Vrh nad Idrijo
00050000-5596-60a5-5304-773ddcadfd63	5262	Črniče
00050000-5596-60a5-2f45-4bf784678478	8340	Črnomelj
00050000-5596-60a5-d1fd-831c011453ea	6271	Dekani
00050000-5596-60a5-e4ac-520a78490871	5210	Deskle
00050000-5596-60a5-5198-2cf47bb77fae	2253	Destrnik
00050000-5596-60a5-8454-f737feaccf0c	6215	Divača
00050000-5596-60a5-09cb-7de3c8629957	1233	Dob
00050000-5596-60a5-77c5-e4a3bf80e7fd	3224	Dobje pri Planini
00050000-5596-60a5-2fca-04763c387b57	8257	Dobova
00050000-5596-60a5-aa2b-d9784defaf75	1423	Dobovec
00050000-5596-60a5-5e2d-da5cb29baa2a	5263	Dobravlje
00050000-5596-60a5-56c2-5210b130fc90	3204	Dobrna
00050000-5596-60a5-781a-f65d0bad306f	8211	Dobrnič
00050000-5596-60a5-f12a-d6e920c67436	1356	Dobrova
00050000-5596-60a5-9841-42e85fd8e291	9223	Dobrovnik/Dobronak 
00050000-5596-60a5-22e1-ea5b6ab2b288	5212	Dobrovo v Brdih
00050000-5596-60a5-9db7-046f7e00d1fc	1431	Dol pri Hrastniku
00050000-5596-60a5-1789-f8538e6ceb95	1262	Dol pri Ljubljani
00050000-5596-60a5-1d6b-2c354e569cc0	1273	Dole pri Litiji
00050000-5596-60a5-f43f-00fc815806c7	1331	Dolenja vas
00050000-5596-60a5-2c37-1f4f18813cbd	8350	Dolenjske Toplice
00050000-5596-60a5-a20a-a51a7c666cac	1230	Domžale
00050000-5596-60a5-13f1-57fab241fb14	2252	Dornava
00050000-5596-60a5-4652-69205edd1430	5294	Dornberk
00050000-5596-60a5-448f-6a44080ce3de	1319	Draga
00050000-5596-60a5-d888-fb58ab9844b0	8343	Dragatuš
00050000-5596-60a5-ea2e-a83ed05b3715	3222	Dramlje
00050000-5596-60a5-f825-b95826611e62	2370	Dravograd
00050000-5596-60a5-cafa-efc21625c6d6	4203	Duplje
00050000-5596-60a5-4b69-f61b6a51c4f6	6221	Dutovlje
00050000-5596-60a5-d166-ef02877b6bc7	8361	Dvor
00050000-5596-60a5-b2e3-7e2efd374f23	2343	Fala
00050000-5596-60a5-2540-816d60b45c1b	9208	Fokovci
00050000-5596-60a5-b444-3afb938b3836	2313	Fram
00050000-5596-60a5-d5d5-742b4bf3f6a6	3213	Frankolovo
00050000-5596-60a5-06c7-cfc8be578497	1274	Gabrovka
00050000-5596-60a5-33de-7865335a20d3	8254	Globoko
00050000-5596-60a5-8cdb-17e2a95e42d7	5275	Godovič
00050000-5596-60a5-bf44-df5865f6d77b	4204	Golnik
00050000-5596-60a5-f66a-2dd3adbbc646	3303	Gomilsko
00050000-5596-60a5-5b67-289a8b0c1d57	4224	Gorenja vas
00050000-5596-60a5-6601-4c280dece7b5	3263	Gorica pri Slivnici
00050000-5596-60a5-3405-cbdf58060ac7	2272	Gorišnica
00050000-5596-60a5-eb87-7299a8085729	9250	Gornja Radgona
00050000-5596-60a5-6a87-1f3fc81971ae	3342	Gornji Grad
00050000-5596-60a5-b219-7c0dee3fa4fd	4282	Gozd Martuljek
00050000-5596-60a5-b907-6e6bc8901427	6272	Gračišče
00050000-5596-60a5-14a9-53405d0f9969	9264	Grad
00050000-5596-60a5-46ff-e6b11bf6db20	8332	Gradac
00050000-5596-60a5-403c-34fd69ea9292	1384	Grahovo
00050000-5596-60a5-5271-2f5540230fb4	5242	Grahovo ob Bači
00050000-5596-60a5-a3fb-2e4b621b5554	5251	Grgar
00050000-5596-60a5-96b4-1eeff1a5ffdc	3302	Griže
00050000-5596-60a5-4314-6cf022487005	3231	Grobelno
00050000-5596-60a5-7ca3-2f98ed39673f	1290	Grosuplje
00050000-5596-60a5-259b-496be32836e2	2288	Hajdina
00050000-5596-60a5-6030-aecc35605066	8362	Hinje
00050000-5596-60a5-f9dc-65d05e89c3ca	2311	Hoče
00050000-5596-60a5-aace-7700c319b04d	9205	Hodoš/Hodos
00050000-5596-60a5-b55a-adec3d8938cc	1354	Horjul
00050000-5596-60a5-77ca-c7404a86f042	1372	Hotedršica
00050000-5596-60a5-fd75-5348cb88746d	1430	Hrastnik
00050000-5596-60a5-30b4-c93380f94d0a	6225	Hruševje
00050000-5596-60a5-84d3-2603d44b2f61	4276	Hrušica
00050000-5596-60a5-6e54-aa1a03901c51	5280	Idrija
00050000-5596-60a5-db8e-6be4757df365	1292	Ig
00050000-5596-60a5-0d39-086af06149d0	6250	Ilirska Bistrica
00050000-5596-60a5-45d5-6e20b4fa6216	6251	Ilirska Bistrica-Trnovo
00050000-5596-60a5-b4f3-ffcd63f78b33	1295	Ivančna Gorica
00050000-5596-60a5-fd31-e8626bf34ca3	2259	Ivanjkovci
00050000-5596-60a5-d375-8c340c9176d8	1411	Izlake
00050000-5596-60a5-05e7-38c8c9164d07	6310	Izola/Isola
00050000-5596-60a5-380a-1d3659797fc6	2222	Jakobski Dol
00050000-5596-60a5-cc49-8c581809bba9	2221	Jarenina
00050000-5596-60a5-8e88-e11e3a608fd6	6254	Jelšane
00050000-5596-60a5-15db-28e4a6f1969e	4270	Jesenice
00050000-5596-60a5-dc10-bb7e38832387	8261	Jesenice na Dolenjskem
00050000-5596-60a5-380b-3cdf22b5e276	3273	Jurklošter
00050000-5596-60a5-0775-8b4b17d79c6d	2223	Jurovski Dol
00050000-5596-60a5-f0a7-85fc6fec1652	2256	Juršinci
00050000-5596-60a5-e1f1-b0ff055376f9	5214	Kal nad Kanalom
00050000-5596-60a5-a1c5-161840fa5f4b	3233	Kalobje
00050000-5596-60a5-8e1b-d1cb369965c5	4246	Kamna Gorica
00050000-5596-60a5-e6a5-a09c6572efb6	2351	Kamnica
00050000-5596-60a5-9177-e7091e6e5050	1241	Kamnik
00050000-5596-60a5-6fb6-5e5236ef0460	5213	Kanal
00050000-5596-60a5-34ff-daa5e09df168	8258	Kapele
00050000-5596-60a5-a69b-7ff1ccfcdb39	2362	Kapla
00050000-5596-60a5-6eec-0b1b1a9f60bd	2325	Kidričevo
00050000-5596-60a5-07b3-ac275d0d1dd9	1412	Kisovec
00050000-5596-60a5-e9eb-8543ecd56b03	6253	Knežak
00050000-5596-60a5-da6e-08f85a57e3ba	5222	Kobarid
00050000-5596-60a5-1a84-252f358898c9	9227	Kobilje
00050000-5596-60a5-871f-2fae5eb114a8	1330	Kočevje
00050000-5596-60a5-ef79-36becf3bb8b0	1338	Kočevska Reka
00050000-5596-60a5-5701-d989d49ce0ea	2276	Kog
00050000-5596-60a5-7efd-1a7d18d8b659	5211	Kojsko
00050000-5596-60a5-6e29-6b45ce3a6983	6223	Komen
00050000-5596-60a5-d516-314cbefbffce	1218	Komenda
00050000-5596-60a5-1356-814f8ae2de38	6000	Koper/Capodistria 
00050000-5596-60a5-80cf-f40636af1f14	6001	Koper/Capodistria - poštni predali
00050000-5596-60a5-813f-54b9d02db550	8282	Koprivnica
00050000-5596-60a5-d6ed-bbf3340b7dfa	5296	Kostanjevica na Krasu
00050000-5596-60a5-da09-7ae63c70ada9	8311	Kostanjevica na Krki
00050000-5596-60a5-07c0-bd06bed2869d	1336	Kostel
00050000-5596-60a5-2562-41e3bd9cd729	6256	Košana
00050000-5596-60a5-014f-a5d61c6da557	2394	Kotlje
00050000-5596-60a5-52b3-ff80983b4102	6240	Kozina
00050000-5596-60a5-83f4-26358e6ebfba	3260	Kozje
00050000-5596-60a5-991f-3d84fb57fbd7	4000	Kranj 
00050000-5596-60a5-1f95-2aa1ff235efa	4001	Kranj - poštni predali
00050000-5596-60a5-6c85-aa66a30bc7b4	4280	Kranjska Gora
00050000-5596-60a5-2f1c-2ccd216ab9a8	1281	Kresnice
00050000-5596-60a5-0f4f-8c431f74dc58	4294	Križe
00050000-5596-60a5-0200-8bec84f43411	9206	Križevci
00050000-5596-60a5-2d3e-9192257a1f15	9242	Križevci pri Ljutomeru
00050000-5596-60a5-c640-101bb1d10e2e	1301	Krka
00050000-5596-60a5-0bc3-d6364dfb51bb	8296	Krmelj
00050000-5596-60a5-c802-45d2e7b1143e	4245	Kropa
00050000-5596-60a5-dd98-1d8cc82af22b	8262	Krška vas
00050000-5596-60a5-4cac-e742bb542ccf	8270	Krško
00050000-5596-60a5-c65f-c05ba0a2bd4d	9263	Kuzma
00050000-5596-60a5-369e-abcc3e0e4323	2318	Laporje
00050000-5596-60a5-07db-6dacb4839d66	3270	Laško
00050000-5596-60a5-879e-65d1a31e7990	1219	Laze v Tuhinju
00050000-5596-60a5-d79a-df3fe8455757	2230	Lenart v Slovenskih goricah
00050000-5596-60a5-9944-3e2fec12d09d	9220	Lendava/Lendva
00050000-5596-60a5-2f6a-15f83b041a1c	4248	Lesce
00050000-5596-60a5-f3b0-fc9f1e2e4483	3261	Lesično
00050000-5596-60a5-659b-21ce0d27e2d5	8273	Leskovec pri Krškem
00050000-5596-60a5-d7e9-2ee8ef8baa9f	2372	Libeliče
00050000-5596-60a5-1de1-d7a5dfaebc58	2341	Limbuš
00050000-5596-60a5-e01e-a673685f6710	1270	Litija
00050000-5596-60a5-3746-d300575b952c	3202	Ljubečna
00050000-5596-60a5-6d74-17c8ba76a714	1000	Ljubljana 
00050000-5596-60a5-a59e-111d64dfa8e2	1001	Ljubljana - poštni predali
00050000-5596-60a5-09fc-fa4995469ca8	1231	Ljubljana - Črnuče
00050000-5596-60a5-f19f-c0d93e012b1f	1261	Ljubljana - Dobrunje
00050000-5596-60a5-6e97-60d409286df4	1260	Ljubljana - Polje
00050000-5596-60a5-e78e-cdd28f09b6c5	1210	Ljubljana - Šentvid
00050000-5596-60a5-b633-c376d218e95b	1211	Ljubljana - Šmartno
00050000-5596-60a5-f000-f4b1249088ff	3333	Ljubno ob Savinji
00050000-5596-60a5-d234-ef6b689a542f	9240	Ljutomer
00050000-5596-60a5-015f-3dac944e0c0b	3215	Loče
00050000-5596-60a5-cd2c-c3a474d2379e	5231	Log pod Mangartom
00050000-5596-60a5-fb04-0f5f027d5f49	1358	Log pri Brezovici
00050000-5596-60a5-fde8-d2b26c3a95db	1370	Logatec
00050000-5596-60a5-e168-4e457ba156d8	1371	Logatec
00050000-5596-60a5-a4be-a7225b86be00	1434	Loka pri Zidanem Mostu
00050000-5596-60a5-b9b6-2f15f3991af0	3223	Loka pri Žusmu
00050000-5596-60a5-4980-9b84059eccd3	6219	Lokev
00050000-5596-60a5-1652-75dde947a8a4	1318	Loški Potok
00050000-5596-60a5-e1de-286f7a418dce	2324	Lovrenc na Dravskem polju
00050000-5596-60a5-d826-b695c6fd2060	2344	Lovrenc na Pohorju
00050000-5596-60a5-066b-d7058e474fe7	3334	Luče
00050000-5596-60a5-0d8d-8a29a6cc007c	1225	Lukovica
00050000-5596-60a5-6a91-32ec7d9ad0f3	9202	Mačkovci
00050000-5596-60a5-ee64-b2c325168d17	2322	Majšperk
00050000-5596-60a5-2dad-068609a8b551	2321	Makole
00050000-5596-60a5-6f0b-41f331ed9e2b	9243	Mala Nedelja
00050000-5596-60a5-dcae-f713ceb2e850	2229	Malečnik
00050000-5596-60a5-4ba6-ab795a0da80d	6273	Marezige
00050000-5596-60a5-4b73-9d1d1c5e0639	2000	Maribor 
00050000-5596-60a5-9e6c-bc5976adf0c5	2001	Maribor - poštni predali
00050000-5596-60a5-2cfd-944bb3a11f8c	2206	Marjeta na Dravskem polju
00050000-5596-60a5-027a-154b1b14d59e	2281	Markovci
00050000-5596-60a5-72f5-ced388d369d3	9221	Martjanci
00050000-5596-60a5-2a2d-daa3db49cb8d	6242	Materija
00050000-5596-60a5-7482-bace42d7de6e	4211	Mavčiče
00050000-5596-60a5-a31c-b64dc410a2a5	1215	Medvode
00050000-5596-60a5-6cd8-7281bd2a045e	1234	Mengeš
00050000-5596-60a5-3e32-1ee5554e9f65	8330	Metlika
00050000-5596-60a5-874a-e55d31d0634d	2392	Mežica
00050000-5596-60a5-854c-2cd5c4b9b481	2204	Miklavž na Dravskem polju
00050000-5596-60a5-797b-2b9e13f2bf26	2275	Miklavž pri Ormožu
00050000-5596-60a5-3af9-b4c978ec7bbc	5291	Miren
00050000-5596-60a5-561b-d3c050ddaa3a	8233	Mirna
00050000-5596-60a5-322f-a5c3c23703de	8216	Mirna Peč
00050000-5596-60a5-20b3-0174db4d1996	2382	Mislinja
00050000-5596-60a5-d9ad-e4c4b9e2d027	4281	Mojstrana
00050000-5596-60a5-c9d3-9d053e85cccc	8230	Mokronog
00050000-5596-60a5-f0cc-79b9a99150f0	1251	Moravče
00050000-5596-60a5-ad29-c02008899168	9226	Moravske Toplice
00050000-5596-60a5-6f50-a6c5e21ad6f3	5216	Most na Soči
00050000-5596-60a5-b115-e7cf1fa1c0a9	1221	Motnik
00050000-5596-60a5-f30b-365013998dc8	3330	Mozirje
00050000-5596-60a5-9164-cd19f74b623d	9000	Murska Sobota 
00050000-5596-60a5-9334-eb4be4a2864c	9001	Murska Sobota - poštni predali
00050000-5596-60a5-56c0-e6eec040f909	2366	Muta
00050000-5596-60a5-d4b0-fb54be5cf034	4202	Naklo
00050000-5596-60a5-6a1d-8f2b62b9f332	3331	Nazarje
00050000-5596-60a5-8115-c9851151d10f	1357	Notranje Gorice
00050000-5596-60a5-0571-1ea500215c41	3203	Nova Cerkev
00050000-5596-60a5-42f3-502fc76bd75f	5000	Nova Gorica 
00050000-5596-60a5-3839-39a60c80f41d	5001	Nova Gorica - poštni predali
00050000-5596-60a5-024d-d27703f6f96b	1385	Nova vas
00050000-5596-60a5-47f5-87af4e4dd625	8000	Novo mesto
00050000-5596-60a5-c17b-a66fee217c4f	8001	Novo mesto - poštni predali
00050000-5596-60a5-d52d-f9260bfa9674	6243	Obrov
00050000-5596-60a5-ceae-288b43339010	9233	Odranci
00050000-5596-60a5-f865-23989525017a	2317	Oplotnica
00050000-5596-60a5-ef6e-eb2f38d6bffb	2312	Orehova vas
00050000-5596-60a5-6c5c-e38ec3ad9939	2270	Ormož
00050000-5596-60a5-5395-a54f6ed7b74c	1316	Ortnek
00050000-5596-60a5-e595-698c85b3d9e5	1337	Osilnica
00050000-5596-60a5-6447-0cd4e9eeff1f	8222	Otočec
00050000-5596-60a5-36ce-823a036dff6a	2361	Ožbalt
00050000-5596-60a5-dc2c-57d4a490e968	2231	Pernica
00050000-5596-60a5-5264-65c4c1d83614	2211	Pesnica pri Mariboru
00050000-5596-60a5-ebc2-f11028e7d01c	9203	Petrovci
00050000-5596-60a5-90ce-14986a475b8b	3301	Petrovče
00050000-5596-60a5-2f9a-ad5742100342	6330	Piran/Pirano
00050000-5596-60a5-7bfd-0acee54a29b0	8255	Pišece
00050000-5596-60a5-3582-c9fd74b2b5cb	6257	Pivka
00050000-5596-60a5-ab44-fdd95cd233de	6232	Planina
00050000-5596-60a5-6ee5-107ba1be849c	3225	Planina pri Sevnici
00050000-5596-60a5-f76d-93295e0e83bc	6276	Pobegi
00050000-5596-60a5-23d9-6aa0e0c6432f	8312	Podbočje
00050000-5596-60a5-cd6c-601a3119f31a	5243	Podbrdo
00050000-5596-60a5-f78f-cb46be73b4c5	3254	Podčetrtek
00050000-5596-60a5-24f3-1d30f431c976	2273	Podgorci
00050000-5596-60a5-f202-f6e82b25710e	6216	Podgorje
00050000-5596-60a5-c225-f98ce13ef70e	2381	Podgorje pri Slovenj Gradcu
00050000-5596-60a5-b7a6-d46e713977ea	6244	Podgrad
00050000-5596-60a5-b4d7-4fdc56318d89	1414	Podkum
00050000-5596-60a5-ee57-c2f1b99a0505	2286	Podlehnik
00050000-5596-60a5-1613-e5f2bcdcfd2e	5272	Podnanos
00050000-5596-60a5-6d41-47e064547ec5	4244	Podnart
00050000-5596-60a5-ab03-71730a6786ff	3241	Podplat
00050000-5596-60a5-dcdf-8be328ae9e4a	3257	Podsreda
00050000-5596-60a5-fa4e-330bea198997	2363	Podvelka
00050000-5596-60a5-c495-992bb0f61389	2208	Pohorje
00050000-5596-60a5-bdbf-be7c1d3bfb9e	2257	Polenšak
00050000-5596-60a5-9284-ed9ebebbb6ca	1355	Polhov Gradec
00050000-5596-60a5-8c39-4b7e913d25ca	4223	Poljane nad Škofjo Loko
00050000-5596-60a5-1dde-5300a5bfc842	2319	Poljčane
00050000-5596-60a5-0509-76c5fa24512b	1272	Polšnik
00050000-5596-60a5-148a-8fbbb43a55ce	3313	Polzela
00050000-5596-60a5-b3f4-daf1d4ca5a6d	3232	Ponikva
00050000-5596-60a5-1b6b-ed40033adb43	6320	Portorož/Portorose
00050000-5596-60a5-0790-028d9ce6e817	6230	Postojna
00050000-5596-60a5-1c26-e725f056475a	2331	Pragersko
00050000-5596-60a5-8b81-fe71a3ef055e	3312	Prebold
00050000-5596-60a5-9658-aae8c587d7fe	4205	Preddvor
00050000-5596-60a5-9139-7039aff57c70	6255	Prem
00050000-5596-60a5-8e08-9fad09613d34	1352	Preserje
00050000-5596-60a5-937d-d7c270b76349	6258	Prestranek
00050000-5596-60a5-50fe-82a652f78a91	2391	Prevalje
00050000-5596-60a5-702a-caa500dbbe73	3262	Prevorje
00050000-5596-60a5-eda8-43887a735035	1276	Primskovo 
00050000-5596-60a5-cbc1-2caa27e35eee	3253	Pristava pri Mestinju
00050000-5596-60a5-0db1-4c7c689fddea	9207	Prosenjakovci/Partosfalva
00050000-5596-60a5-0b75-e51214c53f5a	5297	Prvačina
00050000-5596-60a5-1528-f98a8694ce5d	2250	Ptuj
00050000-5596-60a5-55c4-c378d13f2b7c	2323	Ptujska Gora
00050000-5596-60a5-748b-885118831aab	9201	Puconci
00050000-5596-60a5-a106-bed54b91874d	2327	Rače
00050000-5596-60a5-edae-92d990ed9cd6	1433	Radeče
00050000-5596-60a5-aa77-61bf14a3f5ec	9252	Radenci
00050000-5596-60a5-5c78-0839e53ae543	2360	Radlje ob Dravi
00050000-5596-60a5-289d-336fc548775d	1235	Radomlje
00050000-5596-60a5-c734-516ed77e0ab3	4240	Radovljica
00050000-5596-60a5-0aad-07fa55ce6080	8274	Raka
00050000-5596-60a5-9700-7db9dbeedf86	1381	Rakek
00050000-5596-60a5-3cdd-07e262efa2da	4283	Rateče - Planica
00050000-5596-60a5-e013-1783291b16b8	2390	Ravne na Koroškem
00050000-5596-60a5-6035-75595d85dbee	9246	Razkrižje
00050000-5596-60a5-6eba-60ea27b26695	3332	Rečica ob Savinji
00050000-5596-60a5-fb6a-d12c1996d899	5292	Renče
00050000-5596-60a5-f350-dc0adebc9b63	1310	Ribnica
00050000-5596-60a5-e4c7-700db6aaae9b	2364	Ribnica na Pohorju
00050000-5596-60a5-db00-d87be3a08f6b	3272	Rimske Toplice
00050000-5596-60a5-a7ca-e11d988cacf8	1314	Rob
00050000-5596-60a5-ca86-433ce40fad5e	5215	Ročinj
00050000-5596-60a5-6ab4-fdbf120d101d	3250	Rogaška Slatina
00050000-5596-60a5-4508-a45409bca1c2	9262	Rogašovci
00050000-5596-60a5-b984-548fd51576a5	3252	Rogatec
00050000-5596-60a5-5939-61813914abdb	1373	Rovte
00050000-5596-60a5-07cb-89d68704f4b1	2342	Ruše
00050000-5596-60a5-f21b-79cf984a28f6	1282	Sava
00050000-5596-60a5-b641-3259a53e3ee6	6333	Sečovlje/Sicciole
00050000-5596-60a5-837a-8352dc513ddc	4227	Selca
00050000-5596-60a5-b958-0cd83d5bcb56	2352	Selnica ob Dravi
00050000-5596-60a5-dccb-e043cb789d95	8333	Semič
00050000-5596-60a5-2fd4-9117029dce1a	8281	Senovo
00050000-5596-60a5-a591-dcb74db7d8fd	6224	Senožeče
00050000-5596-60a5-24f0-228ee8af5bb5	8290	Sevnica
00050000-5596-60a5-17a5-6ea2ddb46e25	6210	Sežana
00050000-5596-60a5-7bbc-a571769dce4e	2214	Sladki Vrh
00050000-5596-60a5-7c30-e52421ef51de	5283	Slap ob Idrijci
00050000-5596-60a5-0b6d-0383289cc76b	2380	Slovenj Gradec
00050000-5596-60a5-417a-c532efa3ba60	2310	Slovenska Bistrica
00050000-5596-60a5-5354-0e490434a7a4	3210	Slovenske Konjice
00050000-5596-60a5-8549-6e0c1deacf19	1216	Smlednik
00050000-5596-60a5-269b-c55dc07ae5d1	5232	Soča
00050000-5596-60a5-e33c-c0d202be230a	1317	Sodražica
00050000-5596-60a5-1c84-0389893d4f28	3335	Solčava
00050000-5596-60a5-1cd2-2ae62e980538	5250	Solkan
00050000-5596-60a5-0b7d-86855db1d32f	4229	Sorica
00050000-5596-60a5-4154-891795227b56	4225	Sovodenj
00050000-5596-60a5-9b7e-c963958a902e	5281	Spodnja Idrija
00050000-5596-60a5-0b13-e57a592d7955	2241	Spodnji Duplek
00050000-5596-60a5-a823-20f8287ea04f	9245	Spodnji Ivanjci
00050000-5596-60a5-f364-1418d03fe834	2277	Središče ob Dravi
00050000-5596-60a5-2a86-b83f83237c80	4267	Srednja vas v Bohinju
00050000-5596-60a5-3222-133af5c29e25	8256	Sromlje 
00050000-5596-60a5-e9be-02fea306969f	5224	Srpenica
00050000-5596-60a5-f2fc-a5e8c445db0a	1242	Stahovica
00050000-5596-60a5-9413-0900d0f45b68	1332	Stara Cerkev
00050000-5596-60a5-d4ac-e3408394c455	8342	Stari trg ob Kolpi
00050000-5596-60a5-d279-affc5645ae99	1386	Stari trg pri Ložu
00050000-5596-60a5-a1c9-869515423e56	2205	Starše
00050000-5596-60a5-1464-0d1824c04c68	2289	Stoperce
00050000-5596-60a5-b98b-8437098f3be6	8322	Stopiče
00050000-5596-60a5-23af-da85c44d7881	3206	Stranice
00050000-5596-60a5-1f62-589ca10a501d	8351	Straža
00050000-5596-60a5-2f87-0982c821a4b8	1313	Struge
00050000-5596-60a5-d094-69379f84fef5	8293	Studenec
00050000-5596-60a5-6d60-30d282b52b46	8331	Suhor
00050000-5596-60a5-dbb8-57fcb51b1e65	2233	Sv. Ana v Slovenskih goricah
00050000-5596-60a5-fb6b-9bdc4d9f29c2	2235	Sv. Trojica v Slovenskih goricah
00050000-5596-60a5-2335-e1a762adc83e	2353	Sveti Duh na Ostrem Vrhu
00050000-5596-60a5-09ff-a4af59e99e2c	9244	Sveti Jurij ob Ščavnici
00050000-5596-60a5-ca16-4fdd61541d17	3264	Sveti Štefan
00050000-5596-60a5-0650-12e71c480b3d	2258	Sveti Tomaž
00050000-5596-60a5-ff7a-4cc5b76aa73a	9204	Šalovci
00050000-5596-60a5-f4e4-5533ce8eaf4e	5261	Šempas
00050000-5596-60a5-00e8-0197a86b41e1	5290	Šempeter pri Gorici
00050000-5596-60a5-58a6-8f67e1d573a0	3311	Šempeter v Savinjski dolini
00050000-5596-60a5-b8ab-7d3f1fb3efe0	4208	Šenčur
00050000-5596-60a5-e8c9-34d45ef62770	2212	Šentilj v Slovenskih goricah
00050000-5596-60a5-6304-be90b3e2d737	8297	Šentjanž
00050000-5596-60a5-1980-1abfcda7ea56	2373	Šentjanž pri Dravogradu
00050000-5596-60a5-2e0c-22fcf4f01b5a	8310	Šentjernej
00050000-5596-60a5-9d3c-dfabd70c74ff	3230	Šentjur
00050000-5596-60a5-cf8d-ee7b3b9c6cda	3271	Šentrupert
00050000-5596-60a5-631e-c431dcb96e48	8232	Šentrupert
00050000-5596-60a5-e186-38b09ff879e8	1296	Šentvid pri Stični
00050000-5596-60a5-becb-dbf5f15bb2e1	8275	Škocjan
00050000-5596-60a5-817a-13e4cfeb8bd0	6281	Škofije
00050000-5596-60a5-ebb9-fbe4c86d76fb	4220	Škofja Loka
00050000-5596-60a5-d1e1-41dd65149426	3211	Škofja vas
00050000-5596-60a5-9b07-358a296fcefa	1291	Škofljica
00050000-5596-60a5-6f76-f2d806cb8d30	6274	Šmarje
00050000-5596-60a5-9cac-ef371249ccd0	1293	Šmarje - Sap
00050000-5596-60a5-8373-7496ced30b8e	3240	Šmarje pri Jelšah
00050000-5596-60a5-f95a-1376d483e683	8220	Šmarješke Toplice
00050000-5596-60a5-9178-60abc9a2f2fd	2315	Šmartno na Pohorju
00050000-5596-60a5-785d-09a9f81d52ca	3341	Šmartno ob Dreti
00050000-5596-60a5-2426-c0b758eb6e92	3327	Šmartno ob Paki
00050000-5596-60a5-1838-6a1e82bc8c0d	1275	Šmartno pri Litiji
00050000-5596-60a5-f7ac-4c5e94f6de0e	2383	Šmartno pri Slovenj Gradcu
00050000-5596-60a5-3e13-05b9dfd02a28	3201	Šmartno v Rožni dolini
00050000-5596-60a5-60b5-2022af7e68db	3325	Šoštanj
00050000-5596-60a5-2d4c-13c47a5f99e4	6222	Štanjel
00050000-5596-60a5-630e-ee8704e83441	3220	Štore
00050000-5596-60a5-43c1-2f9cbcfd044f	3304	Tabor
00050000-5596-60a5-c053-0bf0840ffa5c	3221	Teharje
00050000-5596-60a5-b389-f2c1a4f47c03	9251	Tišina
00050000-5596-60a5-26fa-27eabace2c47	5220	Tolmin
00050000-5596-60a5-9713-0562853c93fc	3326	Topolšica
00050000-5596-60a5-49bc-eb34d0e3c38b	2371	Trbonje
00050000-5596-60a5-78a2-d6c9c646fba7	1420	Trbovlje
00050000-5596-60a5-7de5-ad2920d120d1	8231	Trebelno 
00050000-5596-60a5-b9cc-118a31486a27	8210	Trebnje
00050000-5596-60a5-5941-a91f94dec18a	5252	Trnovo pri Gorici
00050000-5596-60a5-b9c0-e6580bea633f	2254	Trnovska vas
00050000-5596-60a5-11c0-3ca84ca800e7	1222	Trojane
00050000-5596-60a5-1cd8-426cab82f61d	1236	Trzin
00050000-5596-60a5-d1db-b90dade7cae7	4290	Tržič
00050000-5596-60a5-cb97-392a532282c1	8295	Tržišče
00050000-5596-60a5-cc65-fa23ab4acfe1	1311	Turjak
00050000-5596-60a5-c913-e21a013c1347	9224	Turnišče
00050000-5596-60a5-52da-98c0786f2649	8323	Uršna sela
00050000-5596-60a5-9fb6-123d62d07674	1252	Vače
00050000-5596-60a5-8579-a3f64d72e667	3320	Velenje 
00050000-5596-60a5-124c-1e30debee39f	3322	Velenje - poštni predali
00050000-5596-60a5-7978-2d3035013f73	8212	Velika Loka
00050000-5596-60a5-4c4f-0821033023da	2274	Velika Nedelja
00050000-5596-60a5-a4f2-ac1d9e7e208e	9225	Velika Polana
00050000-5596-60a5-d6a5-021b811b8c09	1315	Velike Lašče
00050000-5596-60a5-70cc-cc0c2554c309	8213	Veliki Gaber
00050000-5596-60a5-1cb4-b457c71ad527	9241	Veržej
00050000-5596-60a5-3a73-ec8de4944467	1312	Videm - Dobrepolje
00050000-5596-60a5-868b-0b461cc6c6c6	2284	Videm pri Ptuju
00050000-5596-60a5-5c7a-58758cfe7c3d	8344	Vinica
00050000-5596-60a5-c2ab-6d9491fd6d7f	5271	Vipava
00050000-5596-60a5-9757-85652db4c5f3	4212	Visoko
00050000-5596-60a5-901b-372801568dd6	1294	Višnja Gora
00050000-5596-60a5-c15b-d3bb9538b959	3205	Vitanje
00050000-5596-60a5-7a8f-085ca35a8367	2255	Vitomarci
00050000-5596-60a5-a88d-00a5b4fa39ac	1217	Vodice
00050000-5596-60a5-0bb2-40ef7e5f480b	3212	Vojnik\t
00050000-5596-60a5-e67a-a18f08d99e67	5293	Volčja Draga
00050000-5596-60a5-a78e-03014bfa4421	2232	Voličina
00050000-5596-60a5-17df-601df7c087fc	3305	Vransko
00050000-5596-60a5-683b-76a327022187	6217	Vremski Britof
00050000-5596-60a5-3cc0-0bfd11b7f941	1360	Vrhnika
00050000-5596-60a5-1386-0c0a5f1bab85	2365	Vuhred
00050000-5596-60a5-59f5-3d9fd4eda1c2	2367	Vuzenica
00050000-5596-60a5-5fe9-907d4cd15eb3	8292	Zabukovje 
00050000-5596-60a5-1225-34d55fef5eec	1410	Zagorje ob Savi
00050000-5596-60a5-728f-f4c274023f51	1303	Zagradec
00050000-5596-60a5-fe94-95ecf4d2be85	2283	Zavrč
00050000-5596-60a5-bfe2-61eb2b226c3d	8272	Zdole 
00050000-5596-60a5-1e4a-a8671c1a7bf6	4201	Zgornja Besnica
00050000-5596-60a5-5c89-a826adf4a099	2242	Zgornja Korena
00050000-5596-60a5-0866-b6993d750079	2201	Zgornja Kungota
00050000-5596-60a5-7c69-06ce1e5d5349	2316	Zgornja Ložnica
00050000-5596-60a5-8d65-5d2f307aceaa	2314	Zgornja Polskava
00050000-5596-60a5-4dc6-ef51f2e1a8c5	2213	Zgornja Velka
00050000-5596-60a5-f669-025355a7f4fd	4247	Zgornje Gorje
00050000-5596-60a5-a21c-96af7a8f8abb	4206	Zgornje Jezersko
00050000-5596-60a5-35ac-d1591ff38db7	2285	Zgornji Leskovec
00050000-5596-60a5-3feb-40df4a1560cf	1432	Zidani Most
00050000-5596-60a5-1b36-a571f0fa7939	3214	Zreče
00050000-5596-60a5-45d4-c5ed4a290ecc	4209	Žabnica
00050000-5596-60a5-b786-562ae0569717	3310	Žalec
00050000-5596-60a5-72ac-37814994f065	4228	Železniki
00050000-5596-60a5-05c4-2370d14f83a1	2287	Žetale
00050000-5596-60a5-57a8-a3ae40b29fc3	4226	Žiri
00050000-5596-60a5-7251-58bb57f77853	4274	Žirovnica
00050000-5596-60a5-202c-0d294719077d	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8967764)
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
-- TOC entry 2859 (class 0 OID 8967575)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8967653)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8967776)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8968079)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 8968090)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5596-60a6-39f5-e4f12d308904	00080000-5596-60a6-7b29-77aeab8ade09	0900	AK
00190000-5596-60a6-795f-98e8901ed52f	00080000-5596-60a6-72ca-2488b6085c35	0987	A
00190000-5596-60a6-21ba-425f320855ed	00080000-5596-60a6-db6b-b0d53f36713a	0989	A
00190000-5596-60a6-7702-63bd324443f4	00080000-5596-60a6-3072-b72d0011e5af	0986	A
00190000-5596-60a6-bdea-54cb04b516df	00080000-5596-60a6-a4ad-9713502f7a15	0984	A
00190000-5596-60a6-4edf-7b06811b5d07	00080000-5596-60a6-ed26-fd4a9e3ddbe9	0983	A
00190000-5596-60a6-512d-d0089b557ade	00080000-5596-60a6-fcd8-0fa2b0115d0d	0982	A
\.


--
-- TOC entry 2901 (class 0 OID 8968060)
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
-- TOC entry 2883 (class 0 OID 8967805)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5596-60a6-da9f-44940bbf6482	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5596-60a6-46c3-41d9be25f034	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5596-60a6-ceed-283ce4a4e6d4	0003	Kazinska	t	84	Kazinska dvorana
00220000-5596-60a6-40a5-a7d8162ccc28	0004	Mali oder	t	24	Mali oder 
00220000-5596-60a6-35f5-d1c60506edc6	0005	Komorni oder	t	15	Komorni oder
00220000-5596-60a6-58b9-0cf534eca940	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5596-60a6-12b0-35fc473ac957	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8967749)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8967739)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 8967923)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8967873)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8967447)
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
-- TOC entry 2884 (class 0 OID 8967815)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8967485)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5596-60a4-88b6-76c37e86d2eb	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5596-60a4-7ee4-0dfa8832abfb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5596-60a4-4ddd-a54fd2b07b80	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5596-60a4-c84a-91cbb4a4ca8f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5596-60a4-89d1-79b056616d66	planer	Planer dogodkov v koledarju	t
00020000-5596-60a4-130b-6f18ca9654f2	kadrovska	Kadrovska služba	t
00020000-5596-60a4-3e62-e4110b540700	arhivar	Ažuriranje arhivalij	t
00020000-5596-60a4-1880-5ccebc62682d	igralec	Igralec	t
00020000-5596-60a4-cc27-f966938241a8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5596-60a6-338f-46cedf583275	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8967469)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5596-60a4-18ae-b3a7da011c6c	00020000-5596-60a4-4ddd-a54fd2b07b80
00010000-5596-60a4-7580-f127c188c5aa	00020000-5596-60a4-4ddd-a54fd2b07b80
00010000-5596-60a6-5063-060256f7eec2	00020000-5596-60a6-338f-46cedf583275
\.


--
-- TOC entry 2886 (class 0 OID 8967829)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8967770)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8967720)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8968129)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5596-60a5-b3ae-c37311e1bca0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5596-60a5-ac0d-14f3789ed215	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5596-60a5-522e-a95cba9128de	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5596-60a5-6cb0-53818606d0bf	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5596-60a5-610f-819b8127594e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8968121)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5596-60a5-2ac9-ca8fe67ecafa	00230000-5596-60a5-6cb0-53818606d0bf	popa
00240000-5596-60a5-dbf6-37134eea7947	00230000-5596-60a5-6cb0-53818606d0bf	oseba
00240000-5596-60a5-6d19-3c291e89fdfe	00230000-5596-60a5-ac0d-14f3789ed215	prostor
00240000-5596-60a5-3170-ecc51e285b95	00230000-5596-60a5-6cb0-53818606d0bf	besedilo
00240000-5596-60a5-114d-bdf52abb1a22	00230000-5596-60a5-6cb0-53818606d0bf	uprizoritev
00240000-5596-60a5-bb3d-80a6030650dd	00230000-5596-60a5-6cb0-53818606d0bf	funkcija
00240000-5596-60a5-19e5-bd29cac2e2b6	00230000-5596-60a5-6cb0-53818606d0bf	tipfunkcije
00240000-5596-60a5-37ff-c2c36588b0b9	00230000-5596-60a5-6cb0-53818606d0bf	alternacija
00240000-5596-60a5-5cb4-9b7e0c133480	00230000-5596-60a5-b3ae-c37311e1bca0	pogodba
00240000-5596-60a5-058e-92c4dac83aac	00230000-5596-60a5-6cb0-53818606d0bf	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8968116)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8967883)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5596-60a6-0d43-395d6f8c4610	000e0000-5596-60a6-c765-2c965d86427d	00080000-5596-60a6-db68-5e3a90e0a813	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5596-60a6-160d-72d3c0401b41	000e0000-5596-60a6-c765-2c965d86427d	00080000-5596-60a6-db68-5e3a90e0a813	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5596-60a6-2e08-8d91defd65b2	000e0000-5596-60a6-c765-2c965d86427d	00080000-5596-60a6-f4b1-49c23767fa34	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8967547)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8967726)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5596-60a6-fc9a-c59835922dbc	00180000-5596-60a6-0469-a13176e3f21b	000c0000-5596-60a6-d6b6-a99a6ec03990	00090000-5596-60a6-026d-cf57fc3d8dec	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-60a6-3302-839fcdcc94eb	00180000-5596-60a6-0469-a13176e3f21b	000c0000-5596-60a6-17fb-022b5b6d6eba	00090000-5596-60a6-16c3-ee40fd27ce8e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-60a6-41c5-e14932ff5d2d	00180000-5596-60a6-0469-a13176e3f21b	000c0000-5596-60a6-a41a-3ac61e66a134	00090000-5596-60a6-b97b-622cc03dcc5b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-60a6-7e0f-2a43719113bc	00180000-5596-60a6-0469-a13176e3f21b	000c0000-5596-60a6-bebf-c945ef5c87c2	00090000-5596-60a6-4c35-bf1ef1cea7cb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-60a6-5396-12fe79eba125	00180000-5596-60a6-0469-a13176e3f21b	000c0000-5596-60a6-94f7-d7cacefe41cd	00090000-5596-60a6-3ba8-a06cf81dcc77	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-60a6-79f5-417be069a19e	00180000-5596-60a6-1b27-522cfe0f26e4	\N	00090000-5596-60a6-3ba8-a06cf81dcc77	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2893 (class 0 OID 8967912)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5596-60a5-7529-f72e814ca89e	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5596-60a5-96b3-89b362b973ea	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5596-60a5-b85d-133aa6672a32	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5596-60a5-510e-ce09e871d218	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5596-60a5-e70b-7faad56f8f39	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5596-60a5-85ef-4dce7b1d80e1	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5596-60a5-fca3-737d3cf52407	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5596-60a5-ae91-5c18f6146c12	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5596-60a5-1701-0ab5399d62a3	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5596-60a5-6aa3-30bc954f6b87	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5596-60a5-be78-a5895485e18f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5596-60a5-258f-1e27d30028da	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5596-60a5-a138-b301a6d2e8fa	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5596-60a5-59fa-459b8c438a84	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5596-60a5-8eb2-aa9b7d9b3405	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5596-60a5-5696-8404be39dcaf	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8968098)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5596-60a5-efd9-69b1ace0ccc8	01	Velika predstava	f	1.00	1.00
002b0000-5596-60a5-a4f3-6d0ae79de024	02	Mala predstava	f	0.50	0.50
002b0000-5596-60a5-48ed-1cc216735af5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5596-60a5-3d8d-c1d832db3d33	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5596-60a5-8933-6d40cb809363	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8967610)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8967456)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5596-60a4-7580-f127c188c5aa	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROp8eiUoXwSb0VcC0SsTNzJgxZmdiC7AK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5596-60a6-0650-b149c2913ee0	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5596-60a6-528d-ac4e8548bcbe	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5596-60a6-ca57-f727e3755f54	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5596-60a6-a556-a53c4f9009c8	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5596-60a6-259c-8651e8bfbff9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5596-60a6-ee2e-940a4d3c5643	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5596-60a6-669e-a288fa9ce23f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5596-60a6-a058-c1b9d252e89c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5596-60a6-86f5-72603190035a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5596-60a6-5063-060256f7eec2	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5596-60a4-18ae-b3a7da011c6c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2897 (class 0 OID 8967961)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5596-60a6-2462-c1b763e48c70	00160000-5596-60a6-cc60-b1e76b9007eb	00150000-5596-60a5-8ad4-87dc8f014df3	00140000-5596-60a4-d976-fdad5b6b9a07	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5596-60a6-35f5-d1c60506edc6
000e0000-5596-60a6-c765-2c965d86427d	00160000-5596-60a6-96fc-34e23f9cff41	00150000-5596-60a5-2827-1f3f57171100	00140000-5596-60a4-7786-9e7123757121	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5596-60a6-58b9-0cf534eca940
000e0000-5596-60a6-fcf1-fe1cb650d16a	\N	00150000-5596-60a5-2827-1f3f57171100	00140000-5596-60a4-7786-9e7123757121	00190000-5596-60a6-795f-98e8901ed52f	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5596-60a6-35f5-d1c60506edc6
000e0000-5596-60a6-62bb-77f6410b4b85	\N	00150000-5596-60a5-2827-1f3f57171100	00140000-5596-60a4-7786-9e7123757121	00190000-5596-60a6-795f-98e8901ed52f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5596-60a6-35f5-d1c60506edc6
000e0000-5596-60a6-b627-119533f37cf0	\N	00150000-5596-60a5-2827-1f3f57171100	00140000-5596-60a4-7786-9e7123757121	00190000-5596-60a6-795f-98e8901ed52f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5596-60a6-da9f-44940bbf6482
\.


--
-- TOC entry 2867 (class 0 OID 8967672)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5596-60a6-9b3e-62b048cc3f91	000e0000-5596-60a6-c765-2c965d86427d	1	
00200000-5596-60a6-3279-ae6f6f67985b	000e0000-5596-60a6-c765-2c965d86427d	2	
\.


--
-- TOC entry 2882 (class 0 OID 8967797)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8967866)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8967704)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8967951)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5596-60a4-d976-fdad5b6b9a07	01	Drama	drama (SURS 01)
00140000-5596-60a4-ab8a-25dda017641d	02	Opera	opera (SURS 02)
00140000-5596-60a4-9a49-4186e6d6cc76	03	Balet	balet (SURS 03)
00140000-5596-60a4-406e-de32ccba0563	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5596-60a4-ea23-7ba2b56d0240	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5596-60a4-7786-9e7123757121	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5596-60a4-bfe1-4a7aefe01861	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8967856)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5596-60a5-6946-e6396bc45c9a	01	Opera	opera
00150000-5596-60a5-7af1-15982b1a7c20	02	Opereta	opereta
00150000-5596-60a5-4083-f8852561b27f	03	Balet	balet
00150000-5596-60a5-b585-0911722dc9d9	04	Plesne prireditve	plesne prireditve
00150000-5596-60a5-14e6-ac69fd2440fb	05	Lutkovno gledališče	lutkovno gledališče
00150000-5596-60a5-b1c5-99e5a4c19a61	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5596-60a5-59a0-712cf9775e02	07	Biografska drama	biografska drama
00150000-5596-60a5-8ad4-87dc8f014df3	08	Komedija	komedija
00150000-5596-60a5-d753-926d26a927b5	09	Črna komedija	črna komedija
00150000-5596-60a5-6cce-a737ad0c9917	10	E-igra	E-igra
00150000-5596-60a5-2827-1f3f57171100	11	Kriminalka	kriminalka
00150000-5596-60a5-cf9a-abe5b504e260	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8967510)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8968008)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8967998)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8967911)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8967694)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8967719)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8968114)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8967636)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 8968055)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8967852)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8967670)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8967713)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8967650)
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
-- TOC entry 2533 (class 2606 OID 8967762)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8967789)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8967608)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8967519)
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
-- TOC entry 2448 (class 2606 OID 8967543)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8967499)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8967484)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8967795)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8967828)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 8967946)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8967572)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8967596)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8967768)
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
-- TOC entry 2463 (class 2606 OID 8967586)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8967657)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8967780)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8968087)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8968095)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8968077)
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
-- TOC entry 2553 (class 2606 OID 8967812)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8967753)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8967744)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8967933)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8967880)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8967455)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8967819)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8967473)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8967493)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8967837)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8967775)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8967725)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8968138)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8968126)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8968120)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8967893)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8967552)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8967735)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8967922)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8968108)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8967621)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8967468)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8967977)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8967679)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8967803)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8967871)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8967708)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 8967959)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8967864)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8967701)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8967894)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8967895)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8967574)
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
-- TOC entry 2546 (class 1259 OID 8967796)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8967782)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8967781)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8967680)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8967853)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8967855)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8967854)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8967652)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8967651)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 8967948)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 8967949)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8967950)
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
-- TOC entry 2600 (class 1259 OID 8967982)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 8967979)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 8967983)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 8967981)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 8967980)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8967623)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8967622)
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
-- TOC entry 2446 (class 1259 OID 8967546)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8967820)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8967714)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8967500)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8967501)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8967840)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8967839)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8967838)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8967658)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8967660)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8967659)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8968128)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8967748)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8967746)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8967745)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8967747)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8967474)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8967475)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8967804)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8967769)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8967881)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8967882)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 8968059)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 8968056)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8968057)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2624 (class 1259 OID 8968058)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8967588)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8967587)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8967589)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2628 (class 1259 OID 8968088)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2629 (class 1259 OID 8968089)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 8968012)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 8968013)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 8968010)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 8968011)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8967872)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8967757)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8967756)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8967754)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8967755)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2610 (class 1259 OID 8968000)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 8967999)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2625 (class 1259 OID 8968078)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8967671)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8968115)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8967521)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8967520)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8967553)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8967554)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8967738)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8967737)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8967736)
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
-- TOC entry 2498 (class 1259 OID 8967703)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8967699)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8967696)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8967697)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8967695)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8967700)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8967698)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8967573)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8967637)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8967639)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8967638)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8967640)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8967763)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 8967947)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8967978)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8967544)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8967545)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8967865)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8968139)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8967609)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8968127)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8967814)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8967813)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 8968009)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8967597)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8967960)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 8968096)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 8968097)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8967494)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8967702)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2677 (class 2606 OID 8968275)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2674 (class 2606 OID 8968260)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2675 (class 2606 OID 8968265)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2679 (class 2606 OID 8968285)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8968255)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 8968280)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8968270)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8968430)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8968435)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8968190)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8968370)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 8968365)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8968360)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8968250)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8968400)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8968410)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8968405)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2667 (class 2606 OID 8968225)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8968220)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8968350)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 8968440)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 8968445)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8968450)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8968470)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2713 (class 2606 OID 8968455)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2717 (class 2606 OID 8968475)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2715 (class 2606 OID 8968465)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2714 (class 2606 OID 8968460)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2665 (class 2606 OID 8968215)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8968210)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2657 (class 2606 OID 8968175)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8968170)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8968380)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8968290)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8968150)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2653 (class 2606 OID 8968155)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2701 (class 2606 OID 8968395)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8968390)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2699 (class 2606 OID 8968385)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2668 (class 2606 OID 8968230)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2670 (class 2606 OID 8968240)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8968235)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8968555)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2687 (class 2606 OID 8968325)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8968315)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2684 (class 2606 OID 8968310)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2686 (class 2606 OID 8968320)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8968140)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2651 (class 2606 OID 8968145)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8968375)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8968355)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8968420)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2707 (class 2606 OID 8968425)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8968525)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8968510)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2725 (class 2606 OID 8968515)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2726 (class 2606 OID 8968520)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8968200)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8968195)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 8968205)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2729 (class 2606 OID 8968535)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2730 (class 2606 OID 8968540)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2722 (class 2606 OID 8968500)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8968505)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8968490)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2721 (class 2606 OID 8968495)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8968415)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 8968345)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2690 (class 2606 OID 8968340)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8968330)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8968335)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2719 (class 2606 OID 8968485)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2718 (class 2606 OID 8968480)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2728 (class 2606 OID 8968530)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8968245)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2731 (class 2606 OID 8968545)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8968550)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2655 (class 2606 OID 8968165)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8968160)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8968180)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8968185)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2683 (class 2606 OID 8968305)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8968300)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2681 (class 2606 OID 8968295)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-03 12:15:03 CEST

--
-- PostgreSQL database dump complete
--

