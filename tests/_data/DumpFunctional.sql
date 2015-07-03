--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-03 10:40:26 CEST

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
-- TOC entry 183 (class 1259 OID 8930488)
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
-- TOC entry 228 (class 1259 OID 8930987)
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
-- TOC entry 227 (class 1259 OID 8930970)
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
-- TOC entry 221 (class 1259 OID 8930882)
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
-- TOC entry 197 (class 1259 OID 8930667)
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
-- TOC entry 200 (class 1259 OID 8930701)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8931095)
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
-- TOC entry 192 (class 1259 OID 8930610)
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
-- TOC entry 229 (class 1259 OID 8931000)
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
-- TOC entry 216 (class 1259 OID 8930827)
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
-- TOC entry 195 (class 1259 OID 8930647)
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
-- TOC entry 199 (class 1259 OID 8930695)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8930627)
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
-- TOC entry 205 (class 1259 OID 8930744)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8930769)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8930584)
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
-- TOC entry 184 (class 1259 OID 8930497)
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
-- TOC entry 185 (class 1259 OID 8930508)
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
-- TOC entry 180 (class 1259 OID 8930462)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8930481)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8930776)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8930807)
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
-- TOC entry 224 (class 1259 OID 8930920)
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
-- TOC entry 187 (class 1259 OID 8930541)
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
-- TOC entry 189 (class 1259 OID 8930576)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8930750)
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
-- TOC entry 188 (class 1259 OID 8930561)
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
-- TOC entry 194 (class 1259 OID 8930639)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8930762)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 8931065)
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
-- TOC entry 232 (class 1259 OID 8931076)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 8931046)
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
-- TOC entry 212 (class 1259 OID 8930791)
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
-- TOC entry 204 (class 1259 OID 8930735)
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
-- TOC entry 203 (class 1259 OID 8930725)
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
-- TOC entry 223 (class 1259 OID 8930909)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8930859)
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
-- TOC entry 177 (class 1259 OID 8930433)
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
-- TOC entry 176 (class 1259 OID 8930431)
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
-- TOC entry 213 (class 1259 OID 8930801)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8930471)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8930455)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8930815)
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
-- TOC entry 207 (class 1259 OID 8930756)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8930706)
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
-- TOC entry 237 (class 1259 OID 8931115)
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
-- TOC entry 236 (class 1259 OID 8931107)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8931102)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8930869)
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
-- TOC entry 186 (class 1259 OID 8930533)
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
-- TOC entry 202 (class 1259 OID 8930712)
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
-- TOC entry 222 (class 1259 OID 8930898)
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
-- TOC entry 233 (class 1259 OID 8931084)
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
-- TOC entry 191 (class 1259 OID 8930596)
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
-- TOC entry 178 (class 1259 OID 8930442)
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
-- TOC entry 226 (class 1259 OID 8930947)
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
-- TOC entry 196 (class 1259 OID 8930658)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8930783)
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
-- TOC entry 218 (class 1259 OID 8930852)
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
-- TOC entry 198 (class 1259 OID 8930690)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 8930937)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8930842)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8930436)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8930488)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8930987)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5596-4a79-c26a-c96bcc48c7d3	000d0000-5596-4a79-59e4-6f1b3a850222	\N	00090000-5596-4a79-acc5-eb7edaea6032	000b0000-5596-4a79-d51a-5fddcf62d8d4	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-4a79-10f6-43a585cb1421	000d0000-5596-4a79-d255-dd076b7e18dd	\N	00090000-5596-4a79-cd75-ebb348bd9226	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-4a79-2790-16bffaa23ed4	000d0000-5596-4a79-f449-926bdce38e74	\N	00090000-5596-4a79-5493-00686ad5ede6	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-4a79-c0d0-58d3f3732611	000d0000-5596-4a79-6b40-e0dd7cd29bab	\N	00090000-5596-4a79-2935-7e78ad47ae99	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-4a79-181e-d67122b02b69	000d0000-5596-4a79-a5ec-8211fece217b	\N	00090000-5596-4a79-25cb-2051374080ff	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5596-4a79-6006-0bc0199edb91	000d0000-5596-4a79-48d1-5e380eb922b9	\N	00090000-5596-4a79-cd75-ebb348bd9226	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2898 (class 0 OID 8930970)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8930882)
-- Dependencies: 221
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5596-4a79-5351-08a6fb6a2d15	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5596-4a79-9838-099d556a9298	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5596-4a79-9c5d-e3c47a0de586	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8930667)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5596-4a79-5355-357fb280057d	\N	\N	00200000-5596-4a79-4654-8daca59f246a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5596-4a79-7e33-14e743e32389	\N	\N	00200000-5596-4a79-7421-828a4b98919e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5596-4a79-2bd8-ba7c5c2fee97	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5596-4a79-7b33-30ef8eeeef5a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5596-4a79-6002-c05c2e19b6bc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8930701)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8931095)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8930610)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5596-4a77-4111-b08def56ee5f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5596-4a77-748e-31aa6b091d7d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5596-4a77-f801-52debf7a8f01	AL	ALB	008	Albania 	Albanija	\N
00040000-5596-4a77-a773-ff5f6f1e6386	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5596-4a77-bdbc-94ecd8e0cf5d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5596-4a77-3e89-1567734a4697	AD	AND	020	Andorra 	Andora	\N
00040000-5596-4a77-dd3c-52ee0105caf7	AO	AGO	024	Angola 	Angola	\N
00040000-5596-4a77-3e85-c42d4174bd6a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5596-4a77-003f-140d8b8cbf42	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5596-4a77-fa06-36e1fa5a7523	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-4a77-9e86-f2387cda764b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5596-4a77-6163-723981c8c144	AM	ARM	051	Armenia 	Armenija	\N
00040000-5596-4a77-e47d-2ce5a6cd4a7d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5596-4a77-7bf8-a31e360fd6c4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5596-4a77-1d58-6fdb08be05da	AT	AUT	040	Austria 	Avstrija	\N
00040000-5596-4a77-89e0-b34343e35515	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5596-4a77-0a36-b65585db2c9c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5596-4a77-c0e1-ed02cddd283c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5596-4a77-999f-5b4bd42f716b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5596-4a77-70d2-55f564c0b3f9	BB	BRB	052	Barbados 	Barbados	\N
00040000-5596-4a77-06b5-17895c39af25	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5596-4a77-4209-36e99bec74b8	BE	BEL	056	Belgium 	Belgija	\N
00040000-5596-4a77-0622-80633d8e023c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5596-4a77-324b-582453338a7a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5596-4a77-6dfb-768c799a2a11	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5596-4a77-67dc-f91ebb0449ee	BT	BTN	064	Bhutan 	Butan	\N
00040000-5596-4a77-50fb-27857097fd51	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5596-4a77-9d87-64ef752f31aa	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5596-4a77-3082-c9fd94b6ddf6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5596-4a77-66fb-6d9899a8cdfb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5596-4a77-7147-fbb9d71121fa	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5596-4a77-07d7-3c96501adfef	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5596-4a77-9d78-366c1720b3ae	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5596-4a77-a3e4-5811cf234fcc	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5596-4a77-f7b1-42db19075603	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5596-4a77-baf1-af5c4e4abfce	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5596-4a77-b34f-15ec3df5e31c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5596-4a77-3c4a-fe412ed227ff	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5596-4a77-06dc-10f4697e920f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5596-4a77-120c-34cf7964ce1b	CA	CAN	124	Canada 	Kanada	\N
00040000-5596-4a77-125c-6db4df6c1d9a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5596-4a77-28cb-d2cb11627f30	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5596-4a77-1761-0b8f1d53a877	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5596-4a77-8df7-05f1ffa8adc0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5596-4a77-f175-9aff963a552a	CL	CHL	152	Chile 	Čile	\N
00040000-5596-4a77-1c32-b1de430ad449	CN	CHN	156	China 	Kitajska	\N
00040000-5596-4a77-e8e6-fddaeb5aca1f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5596-4a77-6b91-67ad7a84818c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5596-4a77-6319-4cb90b23ca59	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5596-4a77-d914-0c062f308c9b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5596-4a77-7018-917b4adfba9c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5596-4a77-7e05-f58c935a3de3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5596-4a77-47df-289b0fdbca95	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5596-4a77-9d13-bf4f1485265b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5596-4a77-5e6c-c30b38c887f7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5596-4a77-e441-6dde9916abfb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5596-4a77-e1e8-cb091304b5e8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5596-4a77-17eb-4ad17801a9c2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5596-4a77-480b-0c9851ce98ac	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5596-4a77-9110-da8a62cf3098	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5596-4a77-3576-ff766ad81422	DK	DNK	208	Denmark 	Danska	\N
00040000-5596-4a77-6e1c-9fdda2ac00f2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5596-4a77-e988-3422cce89269	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5596-4a77-ee0a-f7fb3782cbe9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5596-4a77-ee82-1af307fb1ce4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5596-4a77-2588-81c0eb5b45f3	EG	EGY	818	Egypt 	Egipt	\N
00040000-5596-4a77-9440-39c78a9e1371	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5596-4a77-953d-449dbf0505b2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5596-4a77-1d8e-c1aec7fe7deb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5596-4a77-5ba7-bfed57406434	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5596-4a77-f5aa-39517249117c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5596-4a77-8fda-524b92a09f31	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5596-4a77-9714-6e512d0a7530	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5596-4a77-238e-66936441bd04	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5596-4a77-f7fd-a19c3e691538	FI	FIN	246	Finland 	Finska	\N
00040000-5596-4a77-a839-903d92fe0b1c	FR	FRA	250	France 	Francija	\N
00040000-5596-4a77-0d48-0af63b625131	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5596-4a77-ba4d-d09d992ccde3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5596-4a77-5875-3c4b2367e9bc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5596-4a77-b92c-b2ed5f05478e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5596-4a77-1684-2a48b2dabbb5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5596-4a77-8790-7b4fafcc0e61	GM	GMB	270	Gambia 	Gambija	\N
00040000-5596-4a77-168e-7e7a8da88524	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5596-4a77-2a2f-7e0b12a76039	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5596-4a77-d1fb-aef64634e543	GH	GHA	288	Ghana 	Gana	\N
00040000-5596-4a77-0a87-c6ad08168be2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5596-4a77-48ea-20f590007998	GR	GRC	300	Greece 	Grčija	\N
00040000-5596-4a77-64ad-e540948e8e05	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5596-4a77-69e2-c9e7f47bf194	GD	GRD	308	Grenada 	Grenada	\N
00040000-5596-4a77-53f8-b44117a69d54	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5596-4a77-7be6-a797e2acc43b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5596-4a77-ba18-15ab9d91e458	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5596-4a77-9053-459feee8803b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5596-4a77-994c-09fdeac129d0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5596-4a77-f9bf-18d90bf1775a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5596-4a77-4506-6fe27de0a38f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5596-4a77-ddff-eeab519db6da	HT	HTI	332	Haiti 	Haiti	\N
00040000-5596-4a77-792e-7abcf6c67882	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5596-4a77-961c-ea3df4127a7c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5596-4a77-9104-262a9e93088b	HN	HND	340	Honduras 	Honduras	\N
00040000-5596-4a77-eeb1-4380d533a4fb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5596-4a77-bda2-b8d089c3daba	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5596-4a77-d360-b69adf077c61	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5596-4a77-c35e-df8dd9c054c1	IN	IND	356	India 	Indija	\N
00040000-5596-4a77-140a-10f60fa85736	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5596-4a77-3b66-fa3e6f0416af	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5596-4a77-3b5b-48b7bd78ea45	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5596-4a77-ca2f-fc8796e65fd3	IE	IRL	372	Ireland 	Irska	\N
00040000-5596-4a77-5c91-4deb45d11c98	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5596-4a77-36a5-c5a7b3468053	IL	ISR	376	Israel 	Izrael	\N
00040000-5596-4a77-156d-743997621443	IT	ITA	380	Italy 	Italija	\N
00040000-5596-4a77-dc92-2caaacf77562	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5596-4a77-d6c7-e2b1b399e7dc	JP	JPN	392	Japan 	Japonska	\N
00040000-5596-4a77-acc8-5ff80a94645e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5596-4a77-7dc3-a14e89365a29	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5596-4a77-9143-64888df28d77	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5596-4a77-9e38-48419037ff49	KE	KEN	404	Kenya 	Kenija	\N
00040000-5596-4a77-de65-37e8b9bdf955	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5596-4a77-1495-9d414b5ff3e2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5596-4a77-a78d-712943b0a2f6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5596-4a77-0db0-8b94eefc072c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5596-4a77-5683-8e56591d2f15	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5596-4a77-e4a2-adc3483467e0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5596-4a77-b9a9-bb11f88ef50b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5596-4a77-8827-3dc5efa8e6da	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5596-4a77-503e-a812a75dc1a0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5596-4a77-1db1-9b86b8f0df1f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5596-4a77-21fa-b4e88328113d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5596-4a77-a9bf-96218819e0d0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5596-4a77-33b9-61338fce58d2	LT	LTU	440	Lithuania 	Litva	\N
00040000-5596-4a77-c2cb-8c2a968315d2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5596-4a77-e57b-52b5e29b9ac9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5596-4a77-cb51-0d06539d7680	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5596-4a77-f968-13cacc78e1e5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5596-4a77-9951-8777998ee276	MW	MWI	454	Malawi 	Malavi	\N
00040000-5596-4a77-f235-a9d017a731d2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5596-4a77-49f0-742a82074ec5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5596-4a77-6497-abbdd519e0b2	ML	MLI	466	Mali 	Mali	\N
00040000-5596-4a77-ba92-a46fd14d704a	MT	MLT	470	Malta 	Malta	\N
00040000-5596-4a77-3f23-08e1446d4c0f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5596-4a77-e746-2561d460b280	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5596-4a77-d01e-1da99b99bfde	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5596-4a77-4458-6def17e00fb8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5596-4a77-0c61-4de2cc40c36c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5596-4a77-e595-6d17502dc563	MX	MEX	484	Mexico 	Mehika	\N
00040000-5596-4a77-ad5b-97b7df794ebd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5596-4a77-23c7-d5a9984f5014	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5596-4a77-12f1-bbf26b2c1f56	MC	MCO	492	Monaco 	Monako	\N
00040000-5596-4a77-b17b-e5de7702508c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5596-4a77-60b7-54c5b4b71733	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5596-4a77-3f07-67f1f3e33576	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5596-4a77-1675-526e2844754b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5596-4a77-8864-65450747785f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5596-4a77-5860-35faf7828059	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5596-4a77-5dba-313a41b2e845	NA	NAM	516	Namibia 	Namibija	\N
00040000-5596-4a77-8abd-820bc499a547	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5596-4a77-c0ed-2665e0f46a4f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5596-4a77-4035-740c3b591988	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5596-4a77-4a7f-629ac2ba330f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5596-4a77-6e6d-724b51326949	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5596-4a77-e782-261ed9102e51	NE	NER	562	Niger 	Niger 	\N
00040000-5596-4a77-43af-6de48405a663	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5596-4a77-e5d6-5d0d6878e534	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5596-4a77-e4f6-1ef238174e9e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5596-4a77-3093-748156e2c2cd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5596-4a77-1fbc-270af4cfc121	NO	NOR	578	Norway 	Norveška	\N
00040000-5596-4a77-0acf-0441afd602e9	OM	OMN	512	Oman 	Oman	\N
00040000-5596-4a77-6044-191fb8c4f406	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5596-4a77-a9c6-1520261010d0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5596-4a77-841b-a4290f7eb492	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5596-4a77-0194-5bf3f9857875	PA	PAN	591	Panama 	Panama	\N
00040000-5596-4a77-1301-161ade6cc91a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5596-4a77-3d2a-4e0d13984fd5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5596-4a77-1d4e-6e37ca1121e9	PE	PER	604	Peru 	Peru	\N
00040000-5596-4a77-9f7f-f6d4aaff57b1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5596-4a77-779d-db530fb269a5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5596-4a77-13d3-3c66959acef0	PL	POL	616	Poland 	Poljska	\N
00040000-5596-4a77-3abc-f8a41ea64df1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5596-4a77-f68b-a159377cb4ee	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5596-4a77-308b-5acff29ca539	QA	QAT	634	Qatar 	Katar	\N
00040000-5596-4a77-175a-8b053f87408d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5596-4a77-88d8-4dd4b136d8e2	RO	ROU	642	Romania 	Romunija	\N
00040000-5596-4a77-9340-0c034882c1b8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5596-4a77-b30b-45ce83a791b1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5596-4a77-bdfd-00df941b2d0b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5596-4a77-2190-2c6c80aba8d9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5596-4a77-cbb6-6dee509198ca	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5596-4a77-3912-1f45b4790aac	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5596-4a77-b707-57ab0419858b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5596-4a77-2e43-c593ff39eb1a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5596-4a77-ab19-871f44dfc8da	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5596-4a77-3941-c79788082722	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5596-4a77-c745-60259c220f1b	SM	SMR	674	San Marino 	San Marino	\N
00040000-5596-4a77-2140-d2aa69f7734c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5596-4a77-6d73-05438cf6da55	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5596-4a77-8cb2-7ee686a7fb46	SN	SEN	686	Senegal 	Senegal	\N
00040000-5596-4a77-a215-699fbaf306ab	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5596-4a77-bbab-982ffa21eff6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5596-4a77-c974-9c46a98e29f3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5596-4a77-a690-3e54a8fae669	SG	SGP	702	Singapore 	Singapur	\N
00040000-5596-4a77-752b-a91c7854cb1d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5596-4a77-9552-3fc25bc39312	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5596-4a77-6bd2-9396fc36a76d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5596-4a77-2d57-ebec59086060	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5596-4a77-b136-0cd15ad7381d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5596-4a77-6fd2-968d5a3a128b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5596-4a77-a8be-f51d542a6a99	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5596-4a77-1ffb-c7bf406a8b7e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5596-4a77-0b15-d1219921332b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5596-4a77-3fa9-a96ea6972fac	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5596-4a77-68e1-3a296c61d972	SD	SDN	729	Sudan 	Sudan	\N
00040000-5596-4a77-690d-b4e8a243d0d6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5596-4a77-b6b4-529dc0aba95d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5596-4a77-4ed5-cd4b3f9b0d6f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5596-4a77-8376-dc67de73b595	SE	SWE	752	Sweden 	Švedska	\N
00040000-5596-4a77-2253-c404887c812c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5596-4a77-c08d-2f800a3c8258	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5596-4a77-2823-4be63cb4e4e3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5596-4a77-5d38-d19a81db0950	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5596-4a77-b4e8-15dce81632d2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5596-4a77-e923-88e1635aa499	TH	THA	764	Thailand 	Tajska	\N
00040000-5596-4a77-a250-e7a1bf4ebf8b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5596-4a77-6822-8d8dd31928f2	TG	TGO	768	Togo 	Togo	\N
00040000-5596-4a77-cb1d-c78a5e69c41d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5596-4a77-a560-9320c436b326	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5596-4a77-414f-f230acf7431d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5596-4a77-99fd-6eadb827e44c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5596-4a77-54a4-33d0f8e32354	TR	TUR	792	Turkey 	Turčija	\N
00040000-5596-4a77-d25a-f9830efde1f3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5596-4a77-26b7-ed9d8d3d3b58	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-4a77-8496-b69bded0983e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5596-4a77-950b-72596bdc07c8	UG	UGA	800	Uganda 	Uganda	\N
00040000-5596-4a77-a57c-8d7fca3f9ec6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5596-4a77-a757-7edf332ee300	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5596-4a77-0ea6-5f08d7f90bc1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5596-4a77-1d4e-1f0bdcc9b99e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5596-4a77-9dc6-2b2fd1bfa1b4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5596-4a77-c5e4-e50724d7e91e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5596-4a77-a52a-498fe57f3101	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5596-4a77-1332-53794a1d7999	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5596-4a77-5163-95d0992c353b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5596-4a77-7df5-be36d5553329	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5596-4a77-4814-b92d6254a5e4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5596-4a77-069b-4f62f5bb5596	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5596-4a77-ada3-44cc9ecacbee	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5596-4a77-eefe-eb8819a42e5c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5596-4a77-9103-a9af0981974b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5596-4a77-ede0-6bfd8d2fbd9e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5596-4a77-96af-e08f4cf7b01a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2900 (class 0 OID 8931000)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5596-4a79-6e00-0151e1ee6eba	000e0000-5596-4a79-103d-fe5fbb6d56b4	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5596-4a78-358a-3d3cea94b1f9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5596-4a79-c0f8-049a072147b6	000e0000-5596-4a79-286d-4e1d142c97bc	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5596-4a78-6f4b-3343472f6e65	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8930827)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5596-4a79-5e00-4c921c90e959	000e0000-5596-4a79-286d-4e1d142c97bc	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5596-4a78-1620-eeb18c434858
000d0000-5596-4a79-59e4-6f1b3a850222	000e0000-5596-4a79-286d-4e1d142c97bc	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-4a78-1620-eeb18c434858
000d0000-5596-4a79-d255-dd076b7e18dd	000e0000-5596-4a79-286d-4e1d142c97bc	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5596-4a78-e63c-a5fdcfbe4f69
000d0000-5596-4a79-f449-926bdce38e74	000e0000-5596-4a79-286d-4e1d142c97bc	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5596-4a78-ecc7-0820d6fcba73
000d0000-5596-4a79-6b40-e0dd7cd29bab	000e0000-5596-4a79-286d-4e1d142c97bc	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5596-4a78-ecc7-0820d6fcba73
000d0000-5596-4a79-a5ec-8211fece217b	000e0000-5596-4a79-286d-4e1d142c97bc	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5596-4a78-ecc7-0820d6fcba73
000d0000-5596-4a79-48d1-5e380eb922b9	000e0000-5596-4a79-286d-4e1d142c97bc	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5596-4a78-1620-eeb18c434858
\.


--
-- TOC entry 2866 (class 0 OID 8930647)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8930695)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8930627)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5596-4a79-e226-45a367f1d129	00080000-5596-4a79-7c1c-2a197a01d7b0	00090000-5596-4a79-acc5-eb7edaea6032	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8930744)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8930769)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8930584)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5596-4a78-6a74-4f3273b18ef1	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5596-4a78-1922-d343b8ade690	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5596-4a78-0ead-edb2f19f3792	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5596-4a78-d4f0-88f46c549537	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5596-4a78-accd-6f7798bdc999	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5596-4a78-341f-3b125d8c44ba	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5596-4a78-4892-a67f37ad6f5d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5596-4a78-83fe-801c9a757a0f	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-4a78-d655-54695a6814af	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5596-4a78-2d2b-8b5adf01f8fd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5596-4a78-8e8c-b8e8adc59942	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5596-4a78-3b62-5b38c7fb8618	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5596-4a78-9ab0-e11634da7420	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5596-4a79-33ad-c9a37800584f	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5596-4a79-f2f2-4b9856cdc55d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5596-4a79-7d70-441beb8816f1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5596-4a79-dfbc-43900a46e673	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5596-4a79-484c-7e4e407e1123	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5596-4a79-c25f-6eaf7d54761f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8930497)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5596-4a79-d1a8-b3ef25e0e83f	00000000-5596-4a79-f2f2-4b9856cdc55d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5596-4a79-52d2-468c835dff37	00000000-5596-4a79-f2f2-4b9856cdc55d	00010000-5596-4a78-4cab-c8af3070f66c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5596-4a79-4564-6990097f8b4e	00000000-5596-4a79-7d70-441beb8816f1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8930508)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5596-4a79-aa89-d077394040c4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5596-4a79-2935-7e78ad47ae99	00010000-5596-4a79-0564-af3c280d94f3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5596-4a79-5493-00686ad5ede6	00010000-5596-4a79-21b2-19c9073b71fc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5596-4a79-8e16-e4dc32f934f8	00010000-5596-4a79-679e-71cd07dcf5ce	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5596-4a79-0afc-a0ee34593df5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5596-4a79-3ff9-813803e496c9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5596-4a79-0bda-14daab5a5607	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5596-4a79-5904-07f2931419e6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5596-4a79-acc5-eb7edaea6032	00010000-5596-4a79-f265-386dd39d7ca6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5596-4a79-cd75-ebb348bd9226	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5596-4a79-a016-f4aad697e3b7	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5596-4a79-25cb-2051374080ff	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5596-4a79-75f3-f1ae66ccd23f	00010000-5596-4a79-17f1-e3769e220804	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8930462)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5596-4a78-a1bd-90bf72e51db5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5596-4a78-8c10-4c7e510278eb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5596-4a78-d0fa-96b66403878b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5596-4a78-d4fd-c61da8259c7d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5596-4a78-f0e5-c3532bae3283	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5596-4a78-56d1-8b765164ecb1	Abonma-read	Abonma - branje	f
00030000-5596-4a78-f936-52b2f0f961bb	Abonma-write	Abonma - spreminjanje	f
00030000-5596-4a78-c9b4-47e3dd3853b4	Alternacija-read	Alternacija - branje	f
00030000-5596-4a78-e1b2-48be138a7081	Alternacija-write	Alternacija - spreminjanje	f
00030000-5596-4a78-d44f-0f64e85991e4	Arhivalija-read	Arhivalija - branje	f
00030000-5596-4a78-3844-fd984fc21d40	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5596-4a78-71fb-789728f00879	Besedilo-read	Besedilo - branje	f
00030000-5596-4a78-f9ed-40f770d926d8	Besedilo-write	Besedilo - spreminjanje	f
00030000-5596-4a78-beeb-9a4ce7d40ffb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5596-4a78-2927-a97afac5867e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5596-4a78-66a8-e48cf0b8cf69	Dogodek-read	Dogodek - branje	f
00030000-5596-4a78-81b0-d6dfcf473699	Dogodek-write	Dogodek - spreminjanje	f
00030000-5596-4a78-d0ab-12283ba2f4a3	DrugiVir-read	DrugiVir - branje	f
00030000-5596-4a78-da37-47e66d4b88ba	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5596-4a78-6422-72bb0a997d6c	Drzava-read	Drzava - branje	f
00030000-5596-4a78-1556-be104acf6f3c	Drzava-write	Drzava - spreminjanje	f
00030000-5596-4a78-feb7-e556953116eb	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5596-4a78-6f1e-190b63538141	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5596-4a78-d9d2-6b9aba00a617	Funkcija-read	Funkcija - branje	f
00030000-5596-4a78-38a5-572d2d0811fc	Funkcija-write	Funkcija - spreminjanje	f
00030000-5596-4a78-fbe9-4339e581adc0	Gostovanje-read	Gostovanje - branje	f
00030000-5596-4a78-4307-e8a99bdeea1b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5596-4a78-dfd4-689a5d67bf8d	Gostujoca-read	Gostujoca - branje	f
00030000-5596-4a78-015f-a5e5066f3b98	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5596-4a78-96db-45f6ed10c6af	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5596-4a78-e914-595e440c52cd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5596-4a78-f322-43d58fc8db2c	Kupec-read	Kupec - branje	f
00030000-5596-4a78-7928-bb7db5d8592e	Kupec-write	Kupec - spreminjanje	f
00030000-5596-4a78-8710-807f0ba87143	NacinPlacina-read	NacinPlacina - branje	f
00030000-5596-4a78-7c57-f1892b2c2d05	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5596-4a78-18cc-6e41d110b3e1	Option-read	Option - branje	f
00030000-5596-4a78-d1ed-1331d05cc8db	Option-write	Option - spreminjanje	f
00030000-5596-4a78-134b-2d4fd96b9e40	OptionValue-read	OptionValue - branje	f
00030000-5596-4a78-4ec6-92262fbe2d39	OptionValue-write	OptionValue - spreminjanje	f
00030000-5596-4a78-a832-4a7707749f0c	Oseba-read	Oseba - branje	f
00030000-5596-4a78-3d8c-5b7070ac6e05	Oseba-write	Oseba - spreminjanje	f
00030000-5596-4a78-d355-309e84aa3034	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5596-4a78-97e0-651b8bb1bcd2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5596-4a78-e252-49677adc87b9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5596-4a78-9db8-d22eb4742bae	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5596-4a78-9d15-9b300efbe9d3	Pogodba-read	Pogodba - branje	f
00030000-5596-4a78-faf6-7297a044782d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5596-4a78-8d68-9cd8eacea2c2	Popa-read	Popa - branje	f
00030000-5596-4a78-afa4-80d856c2c7a5	Popa-write	Popa - spreminjanje	f
00030000-5596-4a78-1cf7-c6c11faa891c	Posta-read	Posta - branje	f
00030000-5596-4a78-9634-29d761beaac2	Posta-write	Posta - spreminjanje	f
00030000-5596-4a78-3a50-2a81ad630079	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5596-4a78-8c1d-d3fa7072be92	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5596-4a78-a999-9e0baa738b7c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5596-4a78-766e-a58e3119f7dd	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5596-4a78-601c-a8c8de5116e8	Predstava-read	Predstava - branje	f
00030000-5596-4a78-2ff0-628325ba4025	Predstava-write	Predstava - spreminjanje	f
00030000-5596-4a78-26e0-436a95abd846	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5596-4a78-651d-5d453161b409	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5596-4a78-b9d2-db44475b7a32	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5596-4a78-b2bf-00c3e6010e66	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5596-4a78-0b45-d1db748a7e29	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5596-4a78-9115-33911c330221	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5596-4a78-a362-f21a3c703651	ProgramDela-read	ProgramDela - branje	f
00030000-5596-4a78-f451-ba7221bb61e6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5596-4a78-15ff-9a136a59ddb2	ProgramFestival-read	ProgramFestival - branje	f
00030000-5596-4a78-4fde-ab1f53d09c84	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5596-4a78-818d-3c329a099276	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5596-4a78-8876-f95acb4b3520	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5596-4a78-b549-eff81e290040	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5596-4a78-b7c4-617ff8da1592	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5596-4a78-b97c-a944fb6c98f9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5596-4a78-c45a-9d8acd3fed20	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5596-4a78-43ee-5050a1a07d71	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5596-4a78-2dcd-1acd9e9c52eb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5596-4a78-2401-eb70d2eea3f3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5596-4a78-171a-d962c636b247	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5596-4a78-f0cd-681ead915dd0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5596-4a78-d36c-e4f485f611aa	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5596-4a78-9a34-f1c20c64f84e	ProgramRazno-read	ProgramRazno - branje	f
00030000-5596-4a78-a286-c710ec785bc4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5596-4a78-80c4-b442bb164b05	Prostor-read	Prostor - branje	f
00030000-5596-4a78-c177-449521c86e8f	Prostor-write	Prostor - spreminjanje	f
00030000-5596-4a78-b7d9-2922bfba9d72	Racun-read	Racun - branje	f
00030000-5596-4a78-3d15-1e3baac326d4	Racun-write	Racun - spreminjanje	f
00030000-5596-4a78-40c5-b691d8baa997	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5596-4a78-9579-dfc5616df069	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5596-4a78-25a7-439d998a6a4f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5596-4a78-02c1-f2f0e487f7fb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5596-4a78-5875-a53042ade4ca	Rekvizit-read	Rekvizit - branje	f
00030000-5596-4a78-213e-68791ae38e6a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5596-4a78-d41a-4b743e0185c5	Revizija-read	Revizija - branje	f
00030000-5596-4a78-efac-c37ea83fbffe	Revizija-write	Revizija - spreminjanje	f
00030000-5596-4a78-a6cb-62c6079349c0	Rezervacija-read	Rezervacija - branje	f
00030000-5596-4a78-9f38-210029013061	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5596-4a78-b899-8138359aaea9	SedezniRed-read	SedezniRed - branje	f
00030000-5596-4a78-d0cb-3606a0671564	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5596-4a78-fc14-792ccab9f6d0	Sedez-read	Sedez - branje	f
00030000-5596-4a78-d38f-1d4f01eb9c8f	Sedez-write	Sedez - spreminjanje	f
00030000-5596-4a78-c48f-effd1afbf54f	Sezona-read	Sezona - branje	f
00030000-5596-4a78-2f32-5a005c66061d	Sezona-write	Sezona - spreminjanje	f
00030000-5596-4a78-03c0-9da1e5c4f753	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5596-4a78-9a55-8788fcbc4957	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5596-4a78-1cee-8f30e16062ff	Stevilcenje-read	Stevilcenje - branje	f
00030000-5596-4a78-eddc-41bfd52bda60	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5596-4a78-23d3-922b4e107956	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5596-4a78-b221-83f373dfb531	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5596-4a78-0a24-bcf38232b3ce	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5596-4a78-a6b0-0499e6cf9c6c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5596-4a78-25ee-58c11b22e422	Telefonska-read	Telefonska - branje	f
00030000-5596-4a78-33a0-d2a7509d831b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5596-4a78-e905-54070797770a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5596-4a78-70cb-47c386b0802f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5596-4a78-92c7-1c9ac50853a3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5596-4a78-5f51-78818664b3da	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5596-4a78-764c-d1fb19ef7813	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5596-4a78-1281-601225f7719f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5596-4a78-936f-7e3a94b574a9	Trr-read	Trr - branje	f
00030000-5596-4a78-2d0d-8e4913486afc	Trr-write	Trr - spreminjanje	f
00030000-5596-4a78-9d52-f77213696691	Uprizoritev-read	Uprizoritev - branje	f
00030000-5596-4a78-6dba-397e98330bfe	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5596-4a78-f14f-9cca23d9e568	Vaja-read	Vaja - branje	f
00030000-5596-4a78-033d-f151e96583a8	Vaja-write	Vaja - spreminjanje	f
00030000-5596-4a78-b9e7-df970ad85084	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5596-4a78-f1e7-e4b1b58a6236	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5596-4a78-57aa-a76dbe76176c	Zaposlitev-read	Zaposlitev - branje	f
00030000-5596-4a78-4685-973a866026be	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5596-4a78-22b9-c56d41c8dbd3	Zasedenost-read	Zasedenost - branje	f
00030000-5596-4a78-9ff1-13f7a0c590dc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5596-4a78-833e-ad0b6c263d62	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5596-4a78-8782-6dea2832bc13	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5596-4a78-1c4f-0ae18ede02f7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5596-4a78-6aa6-3e68c17f536a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8930481)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5596-4a78-857f-2def5b0254c8	00030000-5596-4a78-8c10-4c7e510278eb
00020000-5596-4a78-fbac-114418951049	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-f936-52b2f0f961bb
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-c9b4-47e3dd3853b4
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-e1b2-48be138a7081
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-d4fd-c61da8259c7d
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-81b0-d6dfcf473699
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-1556-be104acf6f3c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-d9d2-6b9aba00a617
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-38a5-572d2d0811fc
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-4307-e8a99bdeea1b
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-015f-a5e5066f3b98
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-96db-45f6ed10c6af
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-e914-595e440c52cd
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-a832-4a7707749f0c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-3d8c-5b7070ac6e05
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-afa4-80d856c2c7a5
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-9634-29d761beaac2
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-a999-9e0baa738b7c
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-766e-a58e3119f7dd
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-2ff0-628325ba4025
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-0b45-d1db748a7e29
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-9115-33911c330221
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-c177-449521c86e8f
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-02c1-f2f0e487f7fb
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-213e-68791ae38e6a
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-2f32-5a005c66061d
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-92c7-1c9ac50853a3
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-9d52-f77213696691
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-6dba-397e98330bfe
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-f14f-9cca23d9e568
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-033d-f151e96583a8
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-22b9-c56d41c8dbd3
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-9ff1-13f7a0c590dc
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a78-0c9e-30b777c12977	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-96db-45f6ed10c6af
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-e914-595e440c52cd
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-a832-4a7707749f0c
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-3d8c-5b7070ac6e05
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-a999-9e0baa738b7c
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-766e-a58e3119f7dd
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-25ee-58c11b22e422
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-33a0-d2a7509d831b
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-936f-7e3a94b574a9
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-2d0d-8e4913486afc
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-57aa-a76dbe76176c
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-4685-973a866026be
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a78-eba9-bb4f3a45daef	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-c9b4-47e3dd3853b4
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-3844-fd984fc21d40
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-71fb-789728f00879
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-beeb-9a4ce7d40ffb
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-d9d2-6b9aba00a617
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-96db-45f6ed10c6af
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-a832-4a7707749f0c
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-0b45-d1db748a7e29
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-92c7-1c9ac50853a3
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-f14f-9cca23d9e568
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-22b9-c56d41c8dbd3
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a78-8410-b920404d1e59	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-f936-52b2f0f961bb
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-e1b2-48be138a7081
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-92c7-1c9ac50853a3
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a78-2258-6276f9093ba2	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-e905-54070797770a
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-d0fa-96b66403878b
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-92c7-1c9ac50853a3
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a78-ef25-715bc2de2597	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a1bd-90bf72e51db5
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8c10-4c7e510278eb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d0fa-96b66403878b
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d4fd-c61da8259c7d
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f0e5-c3532bae3283
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-56d1-8b765164ecb1
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f936-52b2f0f961bb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-c9b4-47e3dd3853b4
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-e1b2-48be138a7081
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d44f-0f64e85991e4
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-3844-fd984fc21d40
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-71fb-789728f00879
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f9ed-40f770d926d8
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-beeb-9a4ce7d40ffb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2927-a97afac5867e
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-66a8-e48cf0b8cf69
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-81b0-d6dfcf473699
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-6422-72bb0a997d6c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-1556-be104acf6f3c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-feb7-e556953116eb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-6f1e-190b63538141
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d9d2-6b9aba00a617
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-38a5-572d2d0811fc
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-fbe9-4339e581adc0
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-4307-e8a99bdeea1b
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-dfd4-689a5d67bf8d
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-015f-a5e5066f3b98
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-96db-45f6ed10c6af
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-e914-595e440c52cd
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f322-43d58fc8db2c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-7928-bb7db5d8592e
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8710-807f0ba87143
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-7c57-f1892b2c2d05
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-18cc-6e41d110b3e1
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d1ed-1331d05cc8db
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-134b-2d4fd96b9e40
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-4ec6-92262fbe2d39
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a832-4a7707749f0c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-3d8c-5b7070ac6e05
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d355-309e84aa3034
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-97e0-651b8bb1bcd2
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-e252-49677adc87b9
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9db8-d22eb4742bae
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9d15-9b300efbe9d3
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-faf6-7297a044782d
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8d68-9cd8eacea2c2
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-afa4-80d856c2c7a5
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-1cf7-c6c11faa891c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9634-29d761beaac2
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-3a50-2a81ad630079
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8c1d-d3fa7072be92
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a999-9e0baa738b7c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-766e-a58e3119f7dd
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-601c-a8c8de5116e8
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2ff0-628325ba4025
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-26e0-436a95abd846
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-651d-5d453161b409
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b9d2-db44475b7a32
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b2bf-00c3e6010e66
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-0b45-d1db748a7e29
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9115-33911c330221
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a362-f21a3c703651
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f451-ba7221bb61e6
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-15ff-9a136a59ddb2
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-4fde-ab1f53d09c84
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-818d-3c329a099276
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8876-f95acb4b3520
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b549-eff81e290040
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b7c4-617ff8da1592
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b97c-a944fb6c98f9
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-c45a-9d8acd3fed20
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-43ee-5050a1a07d71
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2dcd-1acd9e9c52eb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2401-eb70d2eea3f3
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-171a-d962c636b247
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f0cd-681ead915dd0
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d36c-e4f485f611aa
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9a34-f1c20c64f84e
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a286-c710ec785bc4
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-80c4-b442bb164b05
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-c177-449521c86e8f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b7d9-2922bfba9d72
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-3d15-1e3baac326d4
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-40c5-b691d8baa997
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9579-dfc5616df069
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-25a7-439d998a6a4f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-02c1-f2f0e487f7fb
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-5875-a53042ade4ca
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-213e-68791ae38e6a
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d41a-4b743e0185c5
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-efac-c37ea83fbffe
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a6cb-62c6079349c0
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9f38-210029013061
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b899-8138359aaea9
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d0cb-3606a0671564
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-fc14-792ccab9f6d0
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-d38f-1d4f01eb9c8f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-c48f-effd1afbf54f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2f32-5a005c66061d
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-03c0-9da1e5c4f753
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9a55-8788fcbc4957
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-1cee-8f30e16062ff
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-eddc-41bfd52bda60
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-23d3-922b4e107956
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b221-83f373dfb531
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-0a24-bcf38232b3ce
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-a6b0-0499e6cf9c6c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-25ee-58c11b22e422
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-33a0-d2a7509d831b
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-e905-54070797770a
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-70cb-47c386b0802f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-92c7-1c9ac50853a3
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-5f51-78818664b3da
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-764c-d1fb19ef7813
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-1281-601225f7719f
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-936f-7e3a94b574a9
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-2d0d-8e4913486afc
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9d52-f77213696691
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-6dba-397e98330bfe
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f14f-9cca23d9e568
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-033d-f151e96583a8
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-b9e7-df970ad85084
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-f1e7-e4b1b58a6236
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-57aa-a76dbe76176c
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-4685-973a866026be
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-22b9-c56d41c8dbd3
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-9ff1-13f7a0c590dc
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-833e-ad0b6c263d62
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-8782-6dea2832bc13
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-1c4f-0ae18ede02f7
00020000-5596-4a79-9c3b-81f506218f1d	00030000-5596-4a78-6aa6-3e68c17f536a
\.


--
-- TOC entry 2881 (class 0 OID 8930776)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8930807)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8930920)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5596-4a79-d51a-5fddcf62d8d4	00090000-5596-4a79-aa89-d077394040c4	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8930541)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5596-4a79-7c1c-2a197a01d7b0	00040000-5596-4a77-6bd2-9396fc36a76d	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-9aa6-53f9d0ace24a	00040000-5596-4a77-6bd2-9396fc36a76d	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5596-4a79-8a02-3a52a3450119	00040000-5596-4a77-6bd2-9396fc36a76d	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-e600-de1ea2df4e3d	00040000-5596-4a77-6bd2-9396fc36a76d	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-8a9e-33c4c6282a09	00040000-5596-4a77-6bd2-9396fc36a76d	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-9f0f-a6e1d5ae8749	00040000-5596-4a77-9e86-f2387cda764b	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-e9d8-e5851b47b12d	00040000-5596-4a77-e441-6dde9916abfb	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-3019-5fe7b859b90e	00040000-5596-4a77-1d58-6fdb08be05da	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5596-4a79-83a9-37a01752714f	00040000-5596-4a77-6bd2-9396fc36a76d	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8930576)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5596-4a78-17f8-71cd395240d8	8341	Adlešiči
00050000-5596-4a78-3317-2eb57c216acf	5270	Ajdovščina
00050000-5596-4a78-5def-1791424ccb9f	6280	Ankaran/Ancarano
00050000-5596-4a78-0fc3-6266733f7d49	9253	Apače
00050000-5596-4a78-baad-616c536b1aa6	8253	Artiče
00050000-5596-4a78-6eb4-b3386941ee47	4275	Begunje na Gorenjskem
00050000-5596-4a78-ff86-fcf3a7b31a64	1382	Begunje pri Cerknici
00050000-5596-4a78-ee4c-94057fdeef8a	9231	Beltinci
00050000-5596-4a78-2860-c13c472fade9	2234	Benedikt
00050000-5596-4a78-319f-e8189638faf5	2345	Bistrica ob Dravi
00050000-5596-4a78-eeee-03634ce9fa91	3256	Bistrica ob Sotli
00050000-5596-4a78-83cf-10c5719a84c4	8259	Bizeljsko
00050000-5596-4a78-7060-cc7535a24069	1223	Blagovica
00050000-5596-4a78-b67c-091fa8ac7f79	8283	Blanca
00050000-5596-4a78-945f-51dec4721991	4260	Bled
00050000-5596-4a78-f120-40066c586c93	4273	Blejska Dobrava
00050000-5596-4a78-a3a1-8c4fd19a35d5	9265	Bodonci
00050000-5596-4a78-4aa4-06c3e68ce39b	9222	Bogojina
00050000-5596-4a78-8229-03431c7a8a9f	4263	Bohinjska Bela
00050000-5596-4a78-9484-fd16d56987a6	4264	Bohinjska Bistrica
00050000-5596-4a78-3c51-caa37f0db899	4265	Bohinjsko jezero
00050000-5596-4a78-8311-8e2b6050277d	1353	Borovnica
00050000-5596-4a78-94b1-e450a067cf34	8294	Boštanj
00050000-5596-4a78-accf-eaf9e8afe88f	5230	Bovec
00050000-5596-4a78-5b2c-8c5b3fb76afa	5295	Branik
00050000-5596-4a78-5361-10edae3b42e8	3314	Braslovče
00050000-5596-4a78-c275-d0d40758df39	5223	Breginj
00050000-5596-4a78-e529-abf0a2b5d386	8280	Brestanica
00050000-5596-4a78-3c56-86ff8d8fb42f	2354	Bresternica
00050000-5596-4a78-06b7-68181ed07c70	4243	Brezje
00050000-5596-4a78-dcc5-b4ea01b41a01	1351	Brezovica pri Ljubljani
00050000-5596-4a78-56d7-89bc75b20d6c	8250	Brežice
00050000-5596-4a78-df97-8b48fd7418c6	4210	Brnik - Aerodrom
00050000-5596-4a78-5c8d-025bc9e60d66	8321	Brusnice
00050000-5596-4a78-3b71-30eb18b36b4b	3255	Buče
00050000-5596-4a78-517c-0d3bafc75e5c	8276	Bučka 
00050000-5596-4a78-397f-0922a741ad26	9261	Cankova
00050000-5596-4a78-6a99-38f2c315b1ed	3000	Celje 
00050000-5596-4a78-4b58-d8f249241194	3001	Celje - poštni predali
00050000-5596-4a78-6976-7401c1c92167	4207	Cerklje na Gorenjskem
00050000-5596-4a78-4cf0-573c61e35882	8263	Cerklje ob Krki
00050000-5596-4a78-4cc7-c37414d5ef38	1380	Cerknica
00050000-5596-4a78-b7e5-e51a6a10a486	5282	Cerkno
00050000-5596-4a78-18fa-c5dca67ac131	2236	Cerkvenjak
00050000-5596-4a78-3675-cda66fe709f3	2215	Ceršak
00050000-5596-4a78-a527-56032223a331	2326	Cirkovce
00050000-5596-4a78-4eb6-fb69cbee1339	2282	Cirkulane
00050000-5596-4a78-9a0d-00755f06985d	5273	Col
00050000-5596-4a78-123a-ac54fc5e5ed3	8251	Čatež ob Savi
00050000-5596-4a78-5975-7a389c4e8b3b	1413	Čemšenik
00050000-5596-4a78-9bca-921139c28d36	5253	Čepovan
00050000-5596-4a78-4822-57efc788dd13	9232	Črenšovci
00050000-5596-4a78-3523-38ad9271be01	2393	Črna na Koroškem
00050000-5596-4a78-3cec-10c21f6f2a43	6275	Črni Kal
00050000-5596-4a78-ccce-28c927b719f5	5274	Črni Vrh nad Idrijo
00050000-5596-4a78-1e2b-71c2f99bcb3b	5262	Črniče
00050000-5596-4a78-ef00-38814e399f32	8340	Črnomelj
00050000-5596-4a78-64dd-cd9b338a24e3	6271	Dekani
00050000-5596-4a78-d373-40765167fc6d	5210	Deskle
00050000-5596-4a78-7dda-86791797e788	2253	Destrnik
00050000-5596-4a78-acbf-0fdff4c19edd	6215	Divača
00050000-5596-4a78-c4d3-434ae181fb3c	1233	Dob
00050000-5596-4a78-8705-1e7c4744bd78	3224	Dobje pri Planini
00050000-5596-4a78-a680-7d2984b3f1bd	8257	Dobova
00050000-5596-4a78-0de6-543b2d77dd10	1423	Dobovec
00050000-5596-4a78-0323-2e3f1a074fbf	5263	Dobravlje
00050000-5596-4a78-a17a-35d681ac6d81	3204	Dobrna
00050000-5596-4a78-edaf-0cbdc70ab368	8211	Dobrnič
00050000-5596-4a78-da7c-a010ab234649	1356	Dobrova
00050000-5596-4a78-5e52-a64935bb1828	9223	Dobrovnik/Dobronak 
00050000-5596-4a78-f243-0c300b592d7f	5212	Dobrovo v Brdih
00050000-5596-4a78-f27a-988aad71c29f	1431	Dol pri Hrastniku
00050000-5596-4a78-bf5c-db5e5c06121b	1262	Dol pri Ljubljani
00050000-5596-4a78-02ae-f3cd1e857a1f	1273	Dole pri Litiji
00050000-5596-4a78-8df7-5b9f317b2c10	1331	Dolenja vas
00050000-5596-4a78-3349-4f632fd87650	8350	Dolenjske Toplice
00050000-5596-4a78-1967-8fda1e3677c6	1230	Domžale
00050000-5596-4a78-dd77-c9d2aca13396	2252	Dornava
00050000-5596-4a78-c8ea-4b5ca2544f55	5294	Dornberk
00050000-5596-4a78-5b4e-c337e3f4a052	1319	Draga
00050000-5596-4a78-fbc9-5dd628271be1	8343	Dragatuš
00050000-5596-4a78-2954-2ad8e3c0967a	3222	Dramlje
00050000-5596-4a78-87ac-c02c1a27a06a	2370	Dravograd
00050000-5596-4a78-78d5-fec8b6e1e6b9	4203	Duplje
00050000-5596-4a78-54b8-4fcf05d8990a	6221	Dutovlje
00050000-5596-4a78-42b3-081acca81599	8361	Dvor
00050000-5596-4a78-23a3-29097f73ed2c	2343	Fala
00050000-5596-4a78-8050-90eb025b1171	9208	Fokovci
00050000-5596-4a78-0a51-71f8e7e17840	2313	Fram
00050000-5596-4a78-95d4-df1ad0421692	3213	Frankolovo
00050000-5596-4a78-2396-fda2ef9f3e86	1274	Gabrovka
00050000-5596-4a78-ae91-26d46ab23eb4	8254	Globoko
00050000-5596-4a78-0e26-a12ef92b149d	5275	Godovič
00050000-5596-4a78-ccd8-0f4e2a8dad27	4204	Golnik
00050000-5596-4a78-d2cf-21ec82c7892e	3303	Gomilsko
00050000-5596-4a78-6626-4bf5954186f4	4224	Gorenja vas
00050000-5596-4a78-2c7d-2a79874a39e2	3263	Gorica pri Slivnici
00050000-5596-4a78-03d9-0f95f73c4268	2272	Gorišnica
00050000-5596-4a78-de6e-b98a6bbed8cd	9250	Gornja Radgona
00050000-5596-4a78-b7a6-6656d7aa62cc	3342	Gornji Grad
00050000-5596-4a78-204e-7337246eaf62	4282	Gozd Martuljek
00050000-5596-4a78-7ee6-31dd99724e4d	6272	Gračišče
00050000-5596-4a78-b102-e357ca1d51a5	9264	Grad
00050000-5596-4a78-7f7d-7a3fe3b6f784	8332	Gradac
00050000-5596-4a78-a9ea-72206181165d	1384	Grahovo
00050000-5596-4a78-f35b-1beaf72d2ca6	5242	Grahovo ob Bači
00050000-5596-4a78-6efe-275824432d54	5251	Grgar
00050000-5596-4a78-536f-fe30d1609f4f	3302	Griže
00050000-5596-4a78-1138-8c563b730dce	3231	Grobelno
00050000-5596-4a78-5038-60557c19b40e	1290	Grosuplje
00050000-5596-4a78-ec8b-dfe20adcd43b	2288	Hajdina
00050000-5596-4a78-6a6e-5ec5edb6c84f	8362	Hinje
00050000-5596-4a78-51fa-4877fe9e592e	2311	Hoče
00050000-5596-4a78-a5d2-b9f70ccccff0	9205	Hodoš/Hodos
00050000-5596-4a78-1105-22066f16543d	1354	Horjul
00050000-5596-4a78-5fd8-716b5740b93a	1372	Hotedršica
00050000-5596-4a78-c19e-9f301bbb396a	1430	Hrastnik
00050000-5596-4a78-f7e4-c13e6ffbd2a2	6225	Hruševje
00050000-5596-4a78-fab9-e34ea5489777	4276	Hrušica
00050000-5596-4a78-4e98-d09bb0bd20a4	5280	Idrija
00050000-5596-4a78-9650-3cf9b302b832	1292	Ig
00050000-5596-4a78-a0c2-59a1ee4308da	6250	Ilirska Bistrica
00050000-5596-4a78-6561-abee0df0ef9d	6251	Ilirska Bistrica-Trnovo
00050000-5596-4a78-05aa-e0f7f2b3be9b	1295	Ivančna Gorica
00050000-5596-4a78-8211-ebd7e01c6f57	2259	Ivanjkovci
00050000-5596-4a78-e9f2-1c69f4b6f76f	1411	Izlake
00050000-5596-4a78-7538-d864e99a5799	6310	Izola/Isola
00050000-5596-4a78-1899-98024160529e	2222	Jakobski Dol
00050000-5596-4a78-b091-3232c3c8e047	2221	Jarenina
00050000-5596-4a78-b2cf-ec53d179ca03	6254	Jelšane
00050000-5596-4a78-7572-a8d400d4bb65	4270	Jesenice
00050000-5596-4a78-c8a9-8b6faf70fea3	8261	Jesenice na Dolenjskem
00050000-5596-4a78-1c22-31df2e7deb60	3273	Jurklošter
00050000-5596-4a78-c0b2-e037babee2cc	2223	Jurovski Dol
00050000-5596-4a78-1b60-e53b7ddd3147	2256	Juršinci
00050000-5596-4a78-15b6-9d5bb570e344	5214	Kal nad Kanalom
00050000-5596-4a78-8626-6f5538c561b6	3233	Kalobje
00050000-5596-4a78-9f30-0450d76a7970	4246	Kamna Gorica
00050000-5596-4a78-d6a2-6d7be4b670d0	2351	Kamnica
00050000-5596-4a78-72fe-5a6482138d04	1241	Kamnik
00050000-5596-4a78-69a8-0f5e6dd16bb2	5213	Kanal
00050000-5596-4a78-2b44-cd211edbdd77	8258	Kapele
00050000-5596-4a78-a799-7d2f0a02b735	2362	Kapla
00050000-5596-4a78-55dc-f010fa10e52b	2325	Kidričevo
00050000-5596-4a78-d640-7b7b2772230a	1412	Kisovec
00050000-5596-4a78-81d0-fdd864474ac1	6253	Knežak
00050000-5596-4a78-0ffb-6f16b833ed38	5222	Kobarid
00050000-5596-4a78-0923-f89378b85371	9227	Kobilje
00050000-5596-4a78-61da-3815d714db7e	1330	Kočevje
00050000-5596-4a78-3c19-16e7e7558c83	1338	Kočevska Reka
00050000-5596-4a78-8c9a-91d24b00da65	2276	Kog
00050000-5596-4a78-4d04-659b60a70a6d	5211	Kojsko
00050000-5596-4a78-ae82-c63a3e682f4c	6223	Komen
00050000-5596-4a78-e956-fcc67b3a036b	1218	Komenda
00050000-5596-4a78-c817-52040cd68d88	6000	Koper/Capodistria 
00050000-5596-4a78-4385-993c0af04da5	6001	Koper/Capodistria - poštni predali
00050000-5596-4a78-f897-02d425ef2f4d	8282	Koprivnica
00050000-5596-4a78-d7ae-3d69427d18e8	5296	Kostanjevica na Krasu
00050000-5596-4a78-c2af-2f1951d8ce10	8311	Kostanjevica na Krki
00050000-5596-4a78-d841-a3a5d643ed88	1336	Kostel
00050000-5596-4a78-2e67-124e4f94c398	6256	Košana
00050000-5596-4a78-ba1c-62f19fe77ad0	2394	Kotlje
00050000-5596-4a78-2325-28105b29a6e6	6240	Kozina
00050000-5596-4a78-be6e-ab0b594ba926	3260	Kozje
00050000-5596-4a78-ba33-8d10dbfe901a	4000	Kranj 
00050000-5596-4a78-5663-e6e64d05226b	4001	Kranj - poštni predali
00050000-5596-4a78-15c4-19a0c20f78fa	4280	Kranjska Gora
00050000-5596-4a78-fadf-42e4cb3cfd21	1281	Kresnice
00050000-5596-4a78-19ba-8addb34b3535	4294	Križe
00050000-5596-4a78-c272-0852af37fbb1	9206	Križevci
00050000-5596-4a78-cba8-e1c2a756934c	9242	Križevci pri Ljutomeru
00050000-5596-4a78-d40d-40bf62fc03b2	1301	Krka
00050000-5596-4a78-dd21-a6a9256d7410	8296	Krmelj
00050000-5596-4a78-485b-d5647c0f08e3	4245	Kropa
00050000-5596-4a78-6108-390550d48377	8262	Krška vas
00050000-5596-4a78-01c8-cd6f598adec0	8270	Krško
00050000-5596-4a78-22ab-499745747213	9263	Kuzma
00050000-5596-4a78-5eda-d7d6698e2749	2318	Laporje
00050000-5596-4a78-4c2c-79c3235b104d	3270	Laško
00050000-5596-4a78-66af-d02abc1c9b64	1219	Laze v Tuhinju
00050000-5596-4a78-503f-ae32bfc8f822	2230	Lenart v Slovenskih goricah
00050000-5596-4a78-e81b-1f056e72b04c	9220	Lendava/Lendva
00050000-5596-4a78-97f1-1d27e58620bd	4248	Lesce
00050000-5596-4a78-61bf-36e2030e6917	3261	Lesično
00050000-5596-4a78-6a84-9508846392d7	8273	Leskovec pri Krškem
00050000-5596-4a78-fcdb-390f219c6447	2372	Libeliče
00050000-5596-4a78-e8ee-6807dec22739	2341	Limbuš
00050000-5596-4a78-be7a-0e1b5c1499d2	1270	Litija
00050000-5596-4a78-1942-f1fa4e8efe33	3202	Ljubečna
00050000-5596-4a78-f2da-e2ad72f8ff20	1000	Ljubljana 
00050000-5596-4a78-ef70-0717eb5b234d	1001	Ljubljana - poštni predali
00050000-5596-4a78-7e89-57191bae8a41	1231	Ljubljana - Črnuče
00050000-5596-4a78-1d40-c3ececec803e	1261	Ljubljana - Dobrunje
00050000-5596-4a78-ebd4-208f9ede9ab1	1260	Ljubljana - Polje
00050000-5596-4a78-4805-41f1e8209b30	1210	Ljubljana - Šentvid
00050000-5596-4a78-ed63-a9fb6220f431	1211	Ljubljana - Šmartno
00050000-5596-4a78-3de9-8a2cb4c9512a	3333	Ljubno ob Savinji
00050000-5596-4a78-6ab1-c3afb0659b23	9240	Ljutomer
00050000-5596-4a78-acd8-0a4444d51934	3215	Loče
00050000-5596-4a78-693f-304b3f3bcaaf	5231	Log pod Mangartom
00050000-5596-4a78-3000-04611a9e87fd	1358	Log pri Brezovici
00050000-5596-4a78-a167-40273f31b6fa	1370	Logatec
00050000-5596-4a78-ed66-495070e76efa	1371	Logatec
00050000-5596-4a78-4d3c-7d2104372574	1434	Loka pri Zidanem Mostu
00050000-5596-4a78-6f16-50386e3efdf9	3223	Loka pri Žusmu
00050000-5596-4a78-fc48-4d8dc2e1c844	6219	Lokev
00050000-5596-4a78-a7ed-c0f91cf5931c	1318	Loški Potok
00050000-5596-4a78-38b0-1bf2841ebd70	2324	Lovrenc na Dravskem polju
00050000-5596-4a78-fd07-ade5b098fc2e	2344	Lovrenc na Pohorju
00050000-5596-4a78-ba6e-a8b466b8d4f1	3334	Luče
00050000-5596-4a78-23cc-be29f1cfc3f0	1225	Lukovica
00050000-5596-4a78-2bbf-d891a99aa7fe	9202	Mačkovci
00050000-5596-4a78-e5a3-829a83fbb717	2322	Majšperk
00050000-5596-4a78-ebaa-62d981b85ee8	2321	Makole
00050000-5596-4a78-57cd-c16b134987bd	9243	Mala Nedelja
00050000-5596-4a78-43ba-a3d4f509d868	2229	Malečnik
00050000-5596-4a78-f0b0-cb2a95206513	6273	Marezige
00050000-5596-4a78-9acd-a8556bb0e86c	2000	Maribor 
00050000-5596-4a78-0fe3-cd1f79de4dbb	2001	Maribor - poštni predali
00050000-5596-4a78-20fe-e3a65c7a71b7	2206	Marjeta na Dravskem polju
00050000-5596-4a78-0637-dfd2d9168e83	2281	Markovci
00050000-5596-4a78-c781-61570ec0f944	9221	Martjanci
00050000-5596-4a78-556c-33390fed6e99	6242	Materija
00050000-5596-4a78-64c3-0fa62109f16c	4211	Mavčiče
00050000-5596-4a78-fe74-3fc6ff721ed4	1215	Medvode
00050000-5596-4a78-4672-198edf1e0399	1234	Mengeš
00050000-5596-4a78-b8cb-32954dc324a8	8330	Metlika
00050000-5596-4a78-549b-5a21cd3ee81d	2392	Mežica
00050000-5596-4a78-6e4c-0e9c5daf3e3d	2204	Miklavž na Dravskem polju
00050000-5596-4a78-728d-6a327c51d6d3	2275	Miklavž pri Ormožu
00050000-5596-4a78-744d-7f386ddd9571	5291	Miren
00050000-5596-4a78-3c12-817858252494	8233	Mirna
00050000-5596-4a78-5253-1aa48ab20084	8216	Mirna Peč
00050000-5596-4a78-44bb-3f57d3bc8ce2	2382	Mislinja
00050000-5596-4a78-3b30-73d293ff2573	4281	Mojstrana
00050000-5596-4a78-cc55-ec38e683a0e3	8230	Mokronog
00050000-5596-4a78-5bcb-fdd88834003b	1251	Moravče
00050000-5596-4a78-aa93-60b0b40a27d7	9226	Moravske Toplice
00050000-5596-4a78-3581-3fdc1bec382b	5216	Most na Soči
00050000-5596-4a78-a20a-927b4f012bdc	1221	Motnik
00050000-5596-4a78-6cb2-d4c05dd44678	3330	Mozirje
00050000-5596-4a78-6de5-be73ba578b87	9000	Murska Sobota 
00050000-5596-4a78-144e-219b9622a2f3	9001	Murska Sobota - poštni predali
00050000-5596-4a78-fd17-28f436ffecc2	2366	Muta
00050000-5596-4a78-0d6d-6e1144004f7c	4202	Naklo
00050000-5596-4a78-1245-05b053d3384b	3331	Nazarje
00050000-5596-4a78-147a-a65493a84bcc	1357	Notranje Gorice
00050000-5596-4a78-a4f2-fe6f6fdc2cfc	3203	Nova Cerkev
00050000-5596-4a78-b042-ccfa8b477b89	5000	Nova Gorica 
00050000-5596-4a78-2462-4b26bcaff976	5001	Nova Gorica - poštni predali
00050000-5596-4a78-f04f-838651045879	1385	Nova vas
00050000-5596-4a78-5d83-056e1921bf0a	8000	Novo mesto
00050000-5596-4a78-47b6-342e1539b947	8001	Novo mesto - poštni predali
00050000-5596-4a78-0c66-8631905c9f25	6243	Obrov
00050000-5596-4a78-ddb0-d0fa24239494	9233	Odranci
00050000-5596-4a78-2eff-82eb9e4fc0db	2317	Oplotnica
00050000-5596-4a78-de94-a91b4a2f1e42	2312	Orehova vas
00050000-5596-4a78-ae80-d7adced3e2ce	2270	Ormož
00050000-5596-4a78-b005-331cef5bf52f	1316	Ortnek
00050000-5596-4a78-18f9-c901f7d139d1	1337	Osilnica
00050000-5596-4a78-bc31-44f88cd2378d	8222	Otočec
00050000-5596-4a78-6a6b-a52207b36497	2361	Ožbalt
00050000-5596-4a78-92b8-e437dc0651e8	2231	Pernica
00050000-5596-4a78-2df2-ab09bfa46a21	2211	Pesnica pri Mariboru
00050000-5596-4a78-8457-e1e396864655	9203	Petrovci
00050000-5596-4a78-8c32-951e4ad1275d	3301	Petrovče
00050000-5596-4a78-a072-22c6d92e4ae5	6330	Piran/Pirano
00050000-5596-4a78-9028-3c35810d6898	8255	Pišece
00050000-5596-4a78-cd19-b696e9fe41d6	6257	Pivka
00050000-5596-4a78-12c9-ed5d2fc866ba	6232	Planina
00050000-5596-4a78-7b3b-48117ab8c4c9	3225	Planina pri Sevnici
00050000-5596-4a78-b684-20e867c7c8ea	6276	Pobegi
00050000-5596-4a78-5d80-eac26971bbf1	8312	Podbočje
00050000-5596-4a78-1267-2b3705f40fc6	5243	Podbrdo
00050000-5596-4a78-d727-ab3a4845302b	3254	Podčetrtek
00050000-5596-4a78-8690-40ea7f6f1443	2273	Podgorci
00050000-5596-4a78-98d5-a7522ca61bbc	6216	Podgorje
00050000-5596-4a78-1830-5c2dfa22d97c	2381	Podgorje pri Slovenj Gradcu
00050000-5596-4a78-fcbc-9dc42bc818e0	6244	Podgrad
00050000-5596-4a78-5b95-6ac7cc14a0cd	1414	Podkum
00050000-5596-4a78-e0f7-7933cf91862c	2286	Podlehnik
00050000-5596-4a78-ba1c-a2e8bdc1ca51	5272	Podnanos
00050000-5596-4a78-9362-8d643f009cdd	4244	Podnart
00050000-5596-4a78-9778-8561e5d425df	3241	Podplat
00050000-5596-4a78-f83e-255f7bbe3e11	3257	Podsreda
00050000-5596-4a78-350a-0c198cccd567	2363	Podvelka
00050000-5596-4a78-0935-4ae79c6710fb	2208	Pohorje
00050000-5596-4a78-88e6-211d81e53f90	2257	Polenšak
00050000-5596-4a78-cde4-00b2b9e531b1	1355	Polhov Gradec
00050000-5596-4a78-5de0-cf61a17d1c86	4223	Poljane nad Škofjo Loko
00050000-5596-4a78-0356-62fcc77b0bc7	2319	Poljčane
00050000-5596-4a78-4d6a-ab9aa0b34f13	1272	Polšnik
00050000-5596-4a78-b660-d5f43e8aa2d0	3313	Polzela
00050000-5596-4a78-7556-121a3cae2ccb	3232	Ponikva
00050000-5596-4a78-9a03-a13efc22058a	6320	Portorož/Portorose
00050000-5596-4a78-0de7-b65f8ed8baf4	6230	Postojna
00050000-5596-4a78-7561-69fba920b526	2331	Pragersko
00050000-5596-4a78-6943-37718c55904c	3312	Prebold
00050000-5596-4a78-13a2-ddcb23f42119	4205	Preddvor
00050000-5596-4a78-c52c-fe545454b495	6255	Prem
00050000-5596-4a78-2567-0a5f7810d1f6	1352	Preserje
00050000-5596-4a78-69a1-7f61d79b1d83	6258	Prestranek
00050000-5596-4a78-e890-a93ef7c4151c	2391	Prevalje
00050000-5596-4a78-7ce8-d3d7c37c74c6	3262	Prevorje
00050000-5596-4a78-14cf-31e2209e5c7a	1276	Primskovo 
00050000-5596-4a78-6e5e-e832907a93ed	3253	Pristava pri Mestinju
00050000-5596-4a78-3b29-c2cc344aecb8	9207	Prosenjakovci/Partosfalva
00050000-5596-4a78-744c-84c92a9f5b46	5297	Prvačina
00050000-5596-4a78-69a6-7b25911c6794	2250	Ptuj
00050000-5596-4a78-74d1-627277296f4e	2323	Ptujska Gora
00050000-5596-4a78-2207-0c39450102b6	9201	Puconci
00050000-5596-4a78-1ae5-01cce2404dfd	2327	Rače
00050000-5596-4a78-3f17-5e73871daba2	1433	Radeče
00050000-5596-4a78-ad6c-6e7d3547fd97	9252	Radenci
00050000-5596-4a78-8345-e35a248c8faf	2360	Radlje ob Dravi
00050000-5596-4a78-7cc0-69b7f5abeaa6	1235	Radomlje
00050000-5596-4a78-a506-fa7dce0a15ee	4240	Radovljica
00050000-5596-4a78-b06e-80e9041164ee	8274	Raka
00050000-5596-4a78-e231-6401e8f45daa	1381	Rakek
00050000-5596-4a78-6231-a7e34593e9c7	4283	Rateče - Planica
00050000-5596-4a78-3625-8385d576c390	2390	Ravne na Koroškem
00050000-5596-4a78-3556-29805ff357f3	9246	Razkrižje
00050000-5596-4a78-68c9-0af6a5fc9fd2	3332	Rečica ob Savinji
00050000-5596-4a78-cdf8-da038c207270	5292	Renče
00050000-5596-4a78-ea45-d35be055fcbb	1310	Ribnica
00050000-5596-4a78-b395-17cefb5adaa7	2364	Ribnica na Pohorju
00050000-5596-4a78-ff62-e6ff17850095	3272	Rimske Toplice
00050000-5596-4a78-fbf7-efb09192e567	1314	Rob
00050000-5596-4a78-d666-f3a56e0c501a	5215	Ročinj
00050000-5596-4a78-3a42-1443427dac6c	3250	Rogaška Slatina
00050000-5596-4a78-84a8-69810840f888	9262	Rogašovci
00050000-5596-4a78-3894-fc4c5ed9d705	3252	Rogatec
00050000-5596-4a78-7926-ce803a66d162	1373	Rovte
00050000-5596-4a78-69e4-9641c57fe13c	2342	Ruše
00050000-5596-4a78-d732-198cf4373e30	1282	Sava
00050000-5596-4a78-11ed-bab35387bb2b	6333	Sečovlje/Sicciole
00050000-5596-4a78-b874-a15fe87109a7	4227	Selca
00050000-5596-4a78-ef4b-372f5d7ddd4c	2352	Selnica ob Dravi
00050000-5596-4a78-4dd8-eed997ed2f11	8333	Semič
00050000-5596-4a78-f594-5a0dfcf4d3bb	8281	Senovo
00050000-5596-4a78-6b85-7dc0fa27b1cd	6224	Senožeče
00050000-5596-4a78-3f71-33f8d3f6c17d	8290	Sevnica
00050000-5596-4a78-42f3-6ed293e692c0	6210	Sežana
00050000-5596-4a78-8ec8-06f06973dfb9	2214	Sladki Vrh
00050000-5596-4a78-bc29-2ca7824a4b8b	5283	Slap ob Idrijci
00050000-5596-4a78-9a64-7752ec92cafa	2380	Slovenj Gradec
00050000-5596-4a78-f8d4-0016d2be81a0	2310	Slovenska Bistrica
00050000-5596-4a78-91c0-463dc98117d5	3210	Slovenske Konjice
00050000-5596-4a78-33aa-8abb357e9450	1216	Smlednik
00050000-5596-4a78-4857-c90104f4c202	5232	Soča
00050000-5596-4a78-f001-1ecbb074cb39	1317	Sodražica
00050000-5596-4a78-4cba-b123b140f2cb	3335	Solčava
00050000-5596-4a78-94c3-67de818cafe4	5250	Solkan
00050000-5596-4a78-59a1-bc63de8bce4e	4229	Sorica
00050000-5596-4a78-fc28-8b53433846a7	4225	Sovodenj
00050000-5596-4a78-1033-e052933a5056	5281	Spodnja Idrija
00050000-5596-4a78-713f-99cab332dcfc	2241	Spodnji Duplek
00050000-5596-4a78-2728-de72f05c14d4	9245	Spodnji Ivanjci
00050000-5596-4a78-2628-0325e30a79a9	2277	Središče ob Dravi
00050000-5596-4a78-68a5-e80e6e825c1b	4267	Srednja vas v Bohinju
00050000-5596-4a78-3131-d9085ae4b489	8256	Sromlje 
00050000-5596-4a78-4b1b-e0c5f0c89c79	5224	Srpenica
00050000-5596-4a78-c206-6dc8c5ca21fb	1242	Stahovica
00050000-5596-4a78-0078-6a756415098b	1332	Stara Cerkev
00050000-5596-4a78-49b7-40bee42112e0	8342	Stari trg ob Kolpi
00050000-5596-4a78-30d6-58b694d52b29	1386	Stari trg pri Ložu
00050000-5596-4a78-acb0-d2bab989ce11	2205	Starše
00050000-5596-4a78-10e0-f05fbe26d703	2289	Stoperce
00050000-5596-4a78-f0a0-4ece045b2d33	8322	Stopiče
00050000-5596-4a78-74ae-b8b71b5be896	3206	Stranice
00050000-5596-4a78-eb60-b209944c0563	8351	Straža
00050000-5596-4a78-b0aa-827bac42f803	1313	Struge
00050000-5596-4a78-f82f-b78eca559e2e	8293	Studenec
00050000-5596-4a78-21cd-bc8d795d765d	8331	Suhor
00050000-5596-4a78-21a7-8ec5c87442f0	2233	Sv. Ana v Slovenskih goricah
00050000-5596-4a78-7949-944e5510e906	2235	Sv. Trojica v Slovenskih goricah
00050000-5596-4a78-d937-04a3072559ff	2353	Sveti Duh na Ostrem Vrhu
00050000-5596-4a78-61f3-eac912643c20	9244	Sveti Jurij ob Ščavnici
00050000-5596-4a78-1442-728d7babd965	3264	Sveti Štefan
00050000-5596-4a78-6cf5-264d279e50ff	2258	Sveti Tomaž
00050000-5596-4a78-5d79-4e2c3409d758	9204	Šalovci
00050000-5596-4a78-223c-35e93159f7f9	5261	Šempas
00050000-5596-4a78-8086-691a25560402	5290	Šempeter pri Gorici
00050000-5596-4a78-b7ce-b51051d2d99b	3311	Šempeter v Savinjski dolini
00050000-5596-4a78-b5a3-d2a3fa13ba03	4208	Šenčur
00050000-5596-4a78-718b-31aa04d5e35a	2212	Šentilj v Slovenskih goricah
00050000-5596-4a78-ab4a-33d68de42d35	8297	Šentjanž
00050000-5596-4a78-ca91-1cf660eef449	2373	Šentjanž pri Dravogradu
00050000-5596-4a78-b6db-077338ab87a8	8310	Šentjernej
00050000-5596-4a78-3897-19c1f7c67b8f	3230	Šentjur
00050000-5596-4a78-3bb5-d9d87624e354	3271	Šentrupert
00050000-5596-4a78-bab2-e051f6de3458	8232	Šentrupert
00050000-5596-4a78-c46d-be2b06d8a938	1296	Šentvid pri Stični
00050000-5596-4a78-14db-204857906528	8275	Škocjan
00050000-5596-4a78-38b1-f110a61e3900	6281	Škofije
00050000-5596-4a78-33ab-db43cf31bb05	4220	Škofja Loka
00050000-5596-4a78-8c61-e368e079d915	3211	Škofja vas
00050000-5596-4a78-057b-a3b9edc46adf	1291	Škofljica
00050000-5596-4a78-cb2d-a79b2e502d95	6274	Šmarje
00050000-5596-4a78-6656-d48111037622	1293	Šmarje - Sap
00050000-5596-4a78-0063-ac50c21bee87	3240	Šmarje pri Jelšah
00050000-5596-4a78-3a58-ae99e5457894	8220	Šmarješke Toplice
00050000-5596-4a78-c48f-9c3d51c6a32b	2315	Šmartno na Pohorju
00050000-5596-4a78-826b-11e0e795e7cb	3341	Šmartno ob Dreti
00050000-5596-4a78-3323-a4d0251b8e74	3327	Šmartno ob Paki
00050000-5596-4a78-e388-3a8777cbc898	1275	Šmartno pri Litiji
00050000-5596-4a78-4498-c6d1a160c6fa	2383	Šmartno pri Slovenj Gradcu
00050000-5596-4a78-c4f4-9faa5a7b3bf2	3201	Šmartno v Rožni dolini
00050000-5596-4a78-41f3-69c4eda57118	3325	Šoštanj
00050000-5596-4a78-061e-d44b20680b4d	6222	Štanjel
00050000-5596-4a78-5588-142e3f9be0a6	3220	Štore
00050000-5596-4a78-ef1f-c51ee190f4e2	3304	Tabor
00050000-5596-4a78-2972-c64b401fa7f9	3221	Teharje
00050000-5596-4a78-fece-a397b3722235	9251	Tišina
00050000-5596-4a78-3441-b55f6b388422	5220	Tolmin
00050000-5596-4a78-9e71-248cfe85231d	3326	Topolšica
00050000-5596-4a78-6ce7-c4981df30ac3	2371	Trbonje
00050000-5596-4a78-0026-8f43a90ce277	1420	Trbovlje
00050000-5596-4a78-3a95-bb2eda7d2968	8231	Trebelno 
00050000-5596-4a78-f736-fb3c203f4c9e	8210	Trebnje
00050000-5596-4a78-1754-6973c5c8d3bd	5252	Trnovo pri Gorici
00050000-5596-4a78-7fa1-d6ae695399e7	2254	Trnovska vas
00050000-5596-4a78-55b1-04db3708dd2f	1222	Trojane
00050000-5596-4a78-ce63-bf87f81cca33	1236	Trzin
00050000-5596-4a78-b617-e5d0d8f75d44	4290	Tržič
00050000-5596-4a78-9f52-d97e13e73a6b	8295	Tržišče
00050000-5596-4a78-8c39-fd840cadd65f	1311	Turjak
00050000-5596-4a78-4e5c-f47bac9685b1	9224	Turnišče
00050000-5596-4a78-5b18-900ef3ce5702	8323	Uršna sela
00050000-5596-4a78-c6b5-c1d8d86a2dac	1252	Vače
00050000-5596-4a78-dadc-8c7684cbd005	3320	Velenje 
00050000-5596-4a78-c02f-e5f1f45ba2f7	3322	Velenje - poštni predali
00050000-5596-4a78-7c06-9d767a581998	8212	Velika Loka
00050000-5596-4a78-4853-588fb4ba823b	2274	Velika Nedelja
00050000-5596-4a78-ef05-e06eb0b84a90	9225	Velika Polana
00050000-5596-4a78-2f69-628ed378bce7	1315	Velike Lašče
00050000-5596-4a78-3a5c-1d61859c8aaa	8213	Veliki Gaber
00050000-5596-4a78-5723-0fd86669347c	9241	Veržej
00050000-5596-4a78-0d9f-642fe9a6702f	1312	Videm - Dobrepolje
00050000-5596-4a78-9121-8aa152485386	2284	Videm pri Ptuju
00050000-5596-4a78-c83a-e249b3b78b89	8344	Vinica
00050000-5596-4a78-4158-bf10513abc6d	5271	Vipava
00050000-5596-4a78-b31c-d1ee80df1087	4212	Visoko
00050000-5596-4a78-932e-9643e126e7c4	1294	Višnja Gora
00050000-5596-4a78-7725-f62df2a7e3c6	3205	Vitanje
00050000-5596-4a78-c3b9-60779ca1ae35	2255	Vitomarci
00050000-5596-4a78-5837-4dc82de0da1c	1217	Vodice
00050000-5596-4a78-99db-09d4df2fe4c0	3212	Vojnik\t
00050000-5596-4a78-4b5c-6c2a0e51d02c	5293	Volčja Draga
00050000-5596-4a78-a662-662747ef39fe	2232	Voličina
00050000-5596-4a78-0ee7-4cfae8bf15e8	3305	Vransko
00050000-5596-4a78-41aa-e07bdf04002a	6217	Vremski Britof
00050000-5596-4a78-48ae-48c88248cba5	1360	Vrhnika
00050000-5596-4a78-6b16-3fa3a9378f7a	2365	Vuhred
00050000-5596-4a78-ad8d-a8c04ad8d6a2	2367	Vuzenica
00050000-5596-4a78-c0ec-9cd04d4b4fc3	8292	Zabukovje 
00050000-5596-4a78-b613-5718c2f38e31	1410	Zagorje ob Savi
00050000-5596-4a78-6e00-aed627ffc169	1303	Zagradec
00050000-5596-4a78-0d83-9ab62d0d4664	2283	Zavrč
00050000-5596-4a78-decd-9e3410133c11	8272	Zdole 
00050000-5596-4a78-0842-f44139c27214	4201	Zgornja Besnica
00050000-5596-4a78-2b30-80b8d6ebc93b	2242	Zgornja Korena
00050000-5596-4a78-dfe8-e3d486e1f741	2201	Zgornja Kungota
00050000-5596-4a78-7f96-0a1b527c14d0	2316	Zgornja Ložnica
00050000-5596-4a78-af59-c4d9007263f1	2314	Zgornja Polskava
00050000-5596-4a78-484a-4224def6fcc0	2213	Zgornja Velka
00050000-5596-4a78-3768-ba0efe49f677	4247	Zgornje Gorje
00050000-5596-4a78-ffce-ea8dfc3a0e5d	4206	Zgornje Jezersko
00050000-5596-4a78-6cf9-c9c301592bf9	2285	Zgornji Leskovec
00050000-5596-4a78-021c-d41a6bc31b32	1432	Zidani Most
00050000-5596-4a78-e887-5d59950add23	3214	Zreče
00050000-5596-4a78-a2de-d5010a675d5a	4209	Žabnica
00050000-5596-4a78-bbd0-441c04c0d509	3310	Žalec
00050000-5596-4a78-3792-a73b0406295f	4228	Železniki
00050000-5596-4a78-2719-afe02d0a163e	2287	Žetale
00050000-5596-4a78-9a7e-647e6dedf391	4226	Žiri
00050000-5596-4a78-4cff-c79d9c2860b9	4274	Žirovnica
00050000-5596-4a78-1ce2-132c5a914130	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8930750)
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
-- TOC entry 2859 (class 0 OID 8930561)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8930639)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8930762)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8931065)
-- Dependencies: 231
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 8931076)
-- Dependencies: 232
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5596-4a79-bce5-85662878bd37	00080000-5596-4a79-83a9-37a01752714f	0900	AK
00190000-5596-4a79-dabe-c5c4b06b26ba	00080000-5596-4a79-8a02-3a52a3450119	0987	A
00190000-5596-4a79-e0e5-3500acaeab60	00080000-5596-4a79-9aa6-53f9d0ace24a	0989	A
00190000-5596-4a79-32c2-29e436c8127c	00080000-5596-4a79-e600-de1ea2df4e3d	0986	A
00190000-5596-4a79-0ad7-0abc8c5c75b0	00080000-5596-4a79-9f0f-a6e1d5ae8749	0984	A
00190000-5596-4a79-6f11-2f7571686406	00080000-5596-4a79-e9d8-e5851b47b12d	0983	A
00190000-5596-4a79-81be-2c6ce207d93d	00080000-5596-4a79-3019-5fe7b859b90e	0982	A
\.


--
-- TOC entry 2901 (class 0 OID 8931046)
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
-- TOC entry 2883 (class 0 OID 8930791)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5596-4a79-2fb4-7fdca734b779	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5596-4a79-a964-9a58741e9335	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5596-4a79-082d-83a437edd127	0003	Kazinska	t	84	Kazinska dvorana
00220000-5596-4a79-fcc2-b9a8b99cd651	0004	Mali oder	t	24	Mali oder 
00220000-5596-4a79-6d4f-17588de7e03c	0005	Komorni oder	t	15	Komorni oder
00220000-5596-4a79-b368-7f8705dddf48	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5596-4a79-f0ce-d6e7de64cdbf	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8930735)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8930725)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 8930909)
-- Dependencies: 223
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8930859)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8930433)
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
-- TOC entry 2884 (class 0 OID 8930801)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8930471)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5596-4a78-857f-2def5b0254c8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5596-4a78-fbac-114418951049	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5596-4a78-ac96-f25d44bd8003	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5596-4a78-f9b4-588200991617	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5596-4a78-0c9e-30b777c12977	planer	Planer dogodkov v koledarju	t
00020000-5596-4a78-eba9-bb4f3a45daef	kadrovska	Kadrovska služba	t
00020000-5596-4a78-8410-b920404d1e59	arhivar	Ažuriranje arhivalij	t
00020000-5596-4a78-2258-6276f9093ba2	igralec	Igralec	t
00020000-5596-4a78-ef25-715bc2de2597	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5596-4a79-9c3b-81f506218f1d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8930455)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5596-4a78-4cab-c8af3070f66c	00020000-5596-4a78-ac96-f25d44bd8003
00010000-5596-4a78-3f26-86a25e1e47b0	00020000-5596-4a78-ac96-f25d44bd8003
00010000-5596-4a79-5cbf-0074994f602b	00020000-5596-4a79-9c3b-81f506218f1d
\.


--
-- TOC entry 2886 (class 0 OID 8930815)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8930756)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8930706)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8931115)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5596-4a78-e666-03b2a954b30b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5596-4a78-e86e-fbba7369092e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5596-4a78-297e-62bc546bb80f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5596-4a78-6b73-80dbfe7c25c3	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5596-4a78-20ca-410601861027	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8931107)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5596-4a78-c250-e02de6fe2ba1	00230000-5596-4a78-6b73-80dbfe7c25c3	popa
00240000-5596-4a78-5cab-c3fa4db7e196	00230000-5596-4a78-6b73-80dbfe7c25c3	oseba
00240000-5596-4a78-b660-413115a8f616	00230000-5596-4a78-e86e-fbba7369092e	prostor
00240000-5596-4a78-43a2-b15589d66556	00230000-5596-4a78-6b73-80dbfe7c25c3	besedilo
00240000-5596-4a78-fe71-d1f9fbe0f986	00230000-5596-4a78-6b73-80dbfe7c25c3	uprizoritev
00240000-5596-4a78-ee73-6301f803fc1d	00230000-5596-4a78-6b73-80dbfe7c25c3	funkcija
00240000-5596-4a78-e7af-1f38283b4790	00230000-5596-4a78-6b73-80dbfe7c25c3	tipfunkcije
00240000-5596-4a78-e3f1-8e35f8da0fa0	00230000-5596-4a78-6b73-80dbfe7c25c3	alternacija
00240000-5596-4a78-d4b8-633bac7575d3	00230000-5596-4a78-e666-03b2a954b30b	pogodba
00240000-5596-4a78-05ac-f8d245511bb6	00230000-5596-4a78-6b73-80dbfe7c25c3	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8931102)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8930869)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5596-4a79-38ab-a1143d877ddd	000e0000-5596-4a79-286d-4e1d142c97bc	00080000-5596-4a79-7c1c-2a197a01d7b0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5596-4a79-71ea-b5d415bda64f	000e0000-5596-4a79-286d-4e1d142c97bc	00080000-5596-4a79-7c1c-2a197a01d7b0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5596-4a79-31f1-3ddeb76b0541	000e0000-5596-4a79-286d-4e1d142c97bc	00080000-5596-4a79-8a9e-33c4c6282a09	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8930533)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8930712)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5596-4a79-8c42-ce92e7b9d442	00180000-5596-4a79-5355-357fb280057d	000c0000-5596-4a79-c26a-c96bcc48c7d3	00090000-5596-4a79-acc5-eb7edaea6032	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-4a79-1bb0-0e1b6a4aedfe	00180000-5596-4a79-5355-357fb280057d	000c0000-5596-4a79-10f6-43a585cb1421	00090000-5596-4a79-cd75-ebb348bd9226	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-4a79-44e7-780dbe8f1f2a	00180000-5596-4a79-5355-357fb280057d	000c0000-5596-4a79-2790-16bffaa23ed4	00090000-5596-4a79-5493-00686ad5ede6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-4a79-1ba7-b04c6270f156	00180000-5596-4a79-5355-357fb280057d	000c0000-5596-4a79-c0d0-58d3f3732611	00090000-5596-4a79-2935-7e78ad47ae99	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-4a79-233f-15e56fb664a3	00180000-5596-4a79-5355-357fb280057d	000c0000-5596-4a79-181e-d67122b02b69	00090000-5596-4a79-25cb-2051374080ff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5596-4a79-496c-e11c947bdb44	00180000-5596-4a79-2bd8-ba7c5c2fee97	\N	00090000-5596-4a79-25cb-2051374080ff	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2893 (class 0 OID 8930898)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5596-4a78-1620-eeb18c434858	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5596-4a78-3438-2f8276d64388	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5596-4a78-27d3-f41328437050	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5596-4a78-e63c-a5fdcfbe4f69	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5596-4a78-1583-705d21bc28ab	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5596-4a78-4325-7c2c2fb29207	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5596-4a78-7a83-8d2b6ac8338b	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5596-4a78-b29a-63f429590e23	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5596-4a78-d709-8222e9139ca4	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5596-4a78-6760-101457513732	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5596-4a78-29b2-625cfec15c01	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5596-4a78-c5db-12197b3fbdba	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5596-4a78-5258-e0cff36dbe1c	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5596-4a78-262e-0b9a4db79475	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5596-4a78-fcf3-0c1e48dd1f76	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5596-4a78-ecc7-0820d6fcba73	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8931084)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5596-4a78-358a-3d3cea94b1f9	01	Velika predstava	f	1.00	1.00
002b0000-5596-4a78-6f4b-3343472f6e65	02	Mala predstava	f	0.50	0.50
002b0000-5596-4a78-277a-27c96e469462	03	Mala koprodukcija	t	0.40	1.00
002b0000-5596-4a78-53fe-46885baded71	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5596-4a78-7f37-ede401d9282d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8930596)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8930442)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5596-4a78-3f26-86a25e1e47b0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuexsDBlUswFfbtxN/dJqlACcRn3VNWi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5596-4a79-21b2-19c9073b71fc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5596-4a79-0564-af3c280d94f3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5596-4a79-f265-386dd39d7ca6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5596-4a79-17f1-e3769e220804	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5596-4a79-679e-71cd07dcf5ce	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5596-4a79-56f0-f6575c41d92a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5596-4a79-7571-35d4dd100bc8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5596-4a79-5a93-5fd6e2e509cc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5596-4a79-7a2c-e54fe27800ce	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5596-4a79-5cbf-0074994f602b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5596-4a78-4cab-c8af3070f66c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2897 (class 0 OID 8930947)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5596-4a79-103d-fe5fbb6d56b4	00160000-5596-4a79-5351-08a6fb6a2d15	00150000-5596-4a78-0478-202712866b7c	00140000-5596-4a77-3b32-bd60337bcd10	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5596-4a79-6d4f-17588de7e03c
000e0000-5596-4a79-286d-4e1d142c97bc	00160000-5596-4a79-9c5d-e3c47a0de586	00150000-5596-4a78-8bfc-2acd815861cb	00140000-5596-4a77-f50a-7565ff82ae8d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5596-4a79-b368-7f8705dddf48
000e0000-5596-4a79-f9fd-7f94d9caefba	\N	00150000-5596-4a78-8bfc-2acd815861cb	00140000-5596-4a77-f50a-7565ff82ae8d	00190000-5596-4a79-dabe-c5c4b06b26ba	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5596-4a79-6d4f-17588de7e03c
000e0000-5596-4a79-41b6-0ee03fbfcd7d	\N	00150000-5596-4a78-8bfc-2acd815861cb	00140000-5596-4a77-f50a-7565ff82ae8d	00190000-5596-4a79-dabe-c5c4b06b26ba	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5596-4a79-6d4f-17588de7e03c
000e0000-5596-4a79-0409-ce73319e91d0	\N	00150000-5596-4a78-8bfc-2acd815861cb	00140000-5596-4a77-f50a-7565ff82ae8d	00190000-5596-4a79-dabe-c5c4b06b26ba	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5596-4a79-2fb4-7fdca734b779
\.


--
-- TOC entry 2867 (class 0 OID 8930658)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5596-4a79-4654-8daca59f246a	000e0000-5596-4a79-286d-4e1d142c97bc	1	
00200000-5596-4a79-7421-828a4b98919e	000e0000-5596-4a79-286d-4e1d142c97bc	2	
\.


--
-- TOC entry 2882 (class 0 OID 8930783)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8930852)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8930690)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8930937)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5596-4a77-3b32-bd60337bcd10	01	Drama	drama (SURS 01)
00140000-5596-4a77-78d3-14c37a5d9db2	02	Opera	opera (SURS 02)
00140000-5596-4a77-9aef-b1c96aab72f7	03	Balet	balet (SURS 03)
00140000-5596-4a77-9803-4636d519f473	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5596-4a77-ecda-23bc7259f8ed	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5596-4a77-f50a-7565ff82ae8d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5596-4a77-2f30-07a04c1920bd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8930842)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5596-4a78-13af-1efae6e2a59e	01	Opera	opera
00150000-5596-4a78-c66c-3c6e3d09eebe	02	Opereta	opereta
00150000-5596-4a78-7a65-896961f50167	03	Balet	balet
00150000-5596-4a78-51fb-d54e269756d2	04	Plesne prireditve	plesne prireditve
00150000-5596-4a78-8031-b4ea933ff7f5	05	Lutkovno gledališče	lutkovno gledališče
00150000-5596-4a78-e816-8a092abe7a14	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5596-4a78-60bd-a5a20ed7bfd8	07	Biografska drama	biografska drama
00150000-5596-4a78-0478-202712866b7c	08	Komedija	komedija
00150000-5596-4a78-0e3e-469b8af7a83a	09	Črna komedija	črna komedija
00150000-5596-4a78-7031-4b9095fe4ab7	10	E-igra	E-igra
00150000-5596-4a78-8bfc-2acd815861cb	11	Kriminalka	kriminalka
00150000-5596-4a78-6c40-8a98e91cf851	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8930496)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8930994)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8930984)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8930897)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8930680)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8930705)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8931100)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8930622)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 8931041)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8930838)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8930656)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8930699)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8930636)
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
-- TOC entry 2533 (class 2606 OID 8930748)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8930775)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8930594)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8930505)
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
-- TOC entry 2448 (class 2606 OID 8930529)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8930485)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8930470)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8930781)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8930814)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 8930932)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8930558)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8930582)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8930754)
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
-- TOC entry 2463 (class 2606 OID 8930572)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8930643)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8930766)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8931073)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8931081)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8931063)
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
-- TOC entry 2553 (class 2606 OID 8930798)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8930739)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8930730)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8930919)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8930866)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8930441)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8930805)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8930459)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8930479)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8930823)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8930761)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8930711)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8931124)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8931112)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8931106)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8930879)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8930538)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8930721)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8930908)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8931094)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8930607)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8930454)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8930963)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8930665)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8930789)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8930857)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8930694)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 8930945)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8930850)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8930687)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8930880)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8930881)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8930560)
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
-- TOC entry 2546 (class 1259 OID 8930782)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8930768)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8930767)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8930666)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8930839)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8930841)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8930840)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8930638)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8930637)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 8930934)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 8930935)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8930936)
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
-- TOC entry 2600 (class 1259 OID 8930968)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 8930965)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 8930969)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 8930967)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 8930966)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8930609)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8930608)
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
-- TOC entry 2446 (class 1259 OID 8930532)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8930806)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8930700)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8930486)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8930487)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8930826)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8930825)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8930824)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8930644)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8930646)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8930645)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8931114)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8930734)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8930732)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8930731)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8930733)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8930460)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8930461)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8930790)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8930755)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8930867)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8930868)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 8931045)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 8931042)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8931043)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2624 (class 1259 OID 8931044)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8930574)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8930573)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8930575)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2628 (class 1259 OID 8931074)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2629 (class 1259 OID 8931075)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 8930998)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 8930999)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 8930996)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 8930997)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8930858)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8930743)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8930742)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8930740)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8930741)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2610 (class 1259 OID 8930986)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 8930985)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2625 (class 1259 OID 8931064)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8930657)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8931101)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8930507)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8930506)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8930539)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8930540)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8930724)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8930723)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8930722)
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
-- TOC entry 2498 (class 1259 OID 8930689)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8930685)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8930682)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8930683)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8930681)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8930686)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8930684)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8930559)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8930623)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8930625)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8930624)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8930626)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8930749)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 8930933)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8930964)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8930530)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8930531)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8930851)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8931125)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8930595)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8931113)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8930800)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8930799)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 8930995)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8930583)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8930946)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 8931082)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 8931083)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8930480)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8930688)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8931261)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8931246)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8931251)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8931271)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8931241)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8931266)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8931256)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8931416)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8931421)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8931176)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8931356)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8931351)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8931346)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8931236)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8931386)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8931396)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8931391)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8931211)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8931206)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8931336)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8931426)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 8931431)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 8931436)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2714 (class 2606 OID 8931456)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2717 (class 2606 OID 8931441)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2713 (class 2606 OID 8931461)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2715 (class 2606 OID 8931451)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2716 (class 2606 OID 8931446)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8931201)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8931196)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8931161)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8931156)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8931366)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8931276)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8931136)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8931141)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8931381)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8931376)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8931371)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8931216)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8931226)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8931221)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8931541)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8931311)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8931301)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8931296)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8931306)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8931126)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8931131)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8931361)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8931341)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8931406)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8931411)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2724 (class 2606 OID 8931511)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 8931496)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2726 (class 2606 OID 8931501)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2725 (class 2606 OID 8931506)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8931186)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8931181)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8931191)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2730 (class 2606 OID 8931521)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2729 (class 2606 OID 8931526)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2721 (class 2606 OID 8931486)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 8931491)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2723 (class 2606 OID 8931476)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2722 (class 2606 OID 8931481)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8931401)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8931331)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8931326)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8931316)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8931321)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2718 (class 2606 OID 8931471)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2719 (class 2606 OID 8931466)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2728 (class 2606 OID 8931516)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8931231)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2731 (class 2606 OID 8931531)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8931536)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8931151)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8931146)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8931166)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8931171)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8931291)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8931286)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8931281)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-03 10:40:26 CEST

--
-- PostgreSQL database dump complete
--

