--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-02 15:26:59 CEST

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
-- TOC entry 183 (class 1259 OID 8897777)
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
-- TOC entry 230 (class 1259 OID 8898295)
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
-- TOC entry 229 (class 1259 OID 8898278)
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
-- TOC entry 222 (class 1259 OID 8898182)
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
-- TOC entry 197 (class 1259 OID 8897956)
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
-- TOC entry 200 (class 1259 OID 8897990)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8898384)
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
-- TOC entry 192 (class 1259 OID 8897899)
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
-- TOC entry 231 (class 1259 OID 8898308)
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
-- TOC entry 216 (class 1259 OID 8898116)
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
-- TOC entry 195 (class 1259 OID 8897936)
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
-- TOC entry 199 (class 1259 OID 8897984)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8897916)
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
-- TOC entry 205 (class 1259 OID 8898033)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8898058)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8897873)
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
-- TOC entry 184 (class 1259 OID 8897786)
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
-- TOC entry 185 (class 1259 OID 8897797)
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
-- TOC entry 180 (class 1259 OID 8897751)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8897770)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8898065)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8898096)
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
-- TOC entry 226 (class 1259 OID 8898228)
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
-- TOC entry 187 (class 1259 OID 8897830)
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
-- TOC entry 189 (class 1259 OID 8897865)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8898039)
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
-- TOC entry 188 (class 1259 OID 8897850)
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
-- TOC entry 194 (class 1259 OID 8897928)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8898051)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8898171)
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
-- TOC entry 225 (class 1259 OID 8898220)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8898354)
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
-- TOC entry 212 (class 1259 OID 8898080)
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
-- TOC entry 204 (class 1259 OID 8898024)
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
-- TOC entry 203 (class 1259 OID 8898014)
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
-- TOC entry 224 (class 1259 OID 8898209)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8898148)
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
-- TOC entry 177 (class 1259 OID 8897722)
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
-- TOC entry 176 (class 1259 OID 8897720)
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
-- TOC entry 213 (class 1259 OID 8898090)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8897760)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8897744)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8898104)
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
-- TOC entry 207 (class 1259 OID 8898045)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8897995)
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
-- TOC entry 237 (class 1259 OID 8898404)
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
-- TOC entry 236 (class 1259 OID 8898396)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8898391)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8898158)
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
-- TOC entry 186 (class 1259 OID 8897822)
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
-- TOC entry 202 (class 1259 OID 8898001)
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
-- TOC entry 223 (class 1259 OID 8898198)
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
-- TOC entry 233 (class 1259 OID 8898373)
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
-- TOC entry 191 (class 1259 OID 8897885)
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
-- TOC entry 178 (class 1259 OID 8897731)
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
-- TOC entry 228 (class 1259 OID 8898255)
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
-- TOC entry 196 (class 1259 OID 8897947)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8898072)
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
-- TOC entry 218 (class 1259 OID 8898141)
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
-- TOC entry 198 (class 1259 OID 8897979)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8898245)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8898131)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8897725)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8897777)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8898295)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5595-3c22-b351-d2c363d901e5	000d0000-5595-3c22-b7fc-2c1ad6ba6414	\N	00090000-5595-3c22-08b5-faa0ec801943	000b0000-5595-3c22-b069-151062d7a035	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-3c22-0a5b-7a09e3755a00	000d0000-5595-3c22-4e80-5a75e0b8ddfc	\N	00090000-5595-3c22-3a01-051e4539866f	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-3c22-3449-0e8783f5696a	000d0000-5595-3c22-354a-7fdcb592b4b5	\N	00090000-5595-3c22-38af-257288473dd2	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-3c22-d7ad-e704e1bfda1f	000d0000-5595-3c22-894d-28e7dcfb218a	\N	00090000-5595-3c22-ccb7-0a56fd99fd14	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-3c22-7ffe-471159f9b592	000d0000-5595-3c22-b65f-6d8f10da1b0b	\N	00090000-5595-3c22-f0b7-22a20a54b751	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-3c22-0af9-b8ff6d1fd95d	000d0000-5595-3c22-0629-c3057272acc7	\N	00090000-5595-3c22-3a01-051e4539866f	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8898278)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8898182)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5595-3c22-37a1-c4f32436c966	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5595-3c22-1fe5-b5ddcb4459fc	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5595-3c22-e206-9de593b622a3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8897956)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5595-3c22-f382-ce4d04f9be79	\N	\N	00200000-5595-3c22-d0f9-be4ebd9334b7	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5595-3c22-e10f-07742a4eafc5	\N	\N	00200000-5595-3c22-2e8e-895f0267d964	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5595-3c22-36ab-6d3747f466a2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5595-3c22-2943-cc07cf58bffc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5595-3c22-70a9-3291fe971f23	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8897990)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8898384)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8897899)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5595-3c1f-8973-d40517b373e4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5595-3c1f-0ec3-e5bb9ba1c1a1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5595-3c1f-be1f-d1f099fc9296	AL	ALB	008	Albania 	Albanija	\N
00040000-5595-3c1f-5354-9f51963e5e18	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5595-3c1f-5343-ce22aa88a9f5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5595-3c1f-74c7-7d12e8b7c2f9	AD	AND	020	Andorra 	Andora	\N
00040000-5595-3c1f-7e93-0013250fc473	AO	AGO	024	Angola 	Angola	\N
00040000-5595-3c1f-a687-1ef227279553	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5595-3c1f-b046-e64a9f048d24	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5595-3c1f-6358-40192a9a814e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-3c1f-8190-240c47c421cd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5595-3c1f-d2d3-11f405a173f3	AM	ARM	051	Armenia 	Armenija	\N
00040000-5595-3c1f-d48a-7e91b3442a6e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5595-3c1f-5ca3-35523cc6a35e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5595-3c1f-d214-1676f2cdc511	AT	AUT	040	Austria 	Avstrija	\N
00040000-5595-3c1f-ed05-f50bea3c8d76	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5595-3c1f-a49a-15ec4271442f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5595-3c1f-d455-78b14b65f1da	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5595-3c1f-6afa-a9784eb74f3b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5595-3c1f-a999-e80061c09107	BB	BRB	052	Barbados 	Barbados	\N
00040000-5595-3c1f-f59e-3ac8c667d7d2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5595-3c1f-8ce7-f025dc01501f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5595-3c1f-c677-2a4883419174	BZ	BLZ	084	Belize 	Belize	\N
00040000-5595-3c1f-d985-8a92a2fc4328	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5595-3c1f-c2cc-dde146db50ac	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5595-3c1f-d393-e54e49bd4ac5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5595-3c1f-73db-ef18a6124eb2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5595-3c1f-c04f-a8f4447216a2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5595-3c1f-e03b-e77e46a4c5d7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5595-3c1f-1299-99180e386b89	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5595-3c1f-50dd-e777b1b8c5db	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5595-3c1f-25db-1ef660c68f92	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5595-3c1f-dc21-13a7391c09bc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5595-3c1f-745a-8338f5438665	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5595-3c1f-de13-11c3d78aebde	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5595-3c1f-0f9a-55c5ed1f3e5c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5595-3c1f-5266-87a929409773	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5595-3c1f-aa0b-371f607fa227	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5595-3c1f-ee60-467fe0a01669	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5595-3c1f-aed2-efca00720562	CA	CAN	124	Canada 	Kanada	\N
00040000-5595-3c1f-15c8-afe5f1412f36	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5595-3c1f-4dad-3f55a9ade740	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5595-3c1f-615c-f946af83330c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5595-3c1f-3182-2d8b8ead1353	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5595-3c1f-27f3-afc73ee99a69	CL	CHL	152	Chile 	Čile	\N
00040000-5595-3c1f-e02f-4dbedf27bf89	CN	CHN	156	China 	Kitajska	\N
00040000-5595-3c1f-24ad-122cc8b1b81e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5595-3c1f-fa7c-fc1b786bb1e8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5595-3c1f-fa64-1fb9a2cff522	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5595-3c1f-e7cc-b9aced635682	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5595-3c1f-6367-764bedde6e7b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5595-3c1f-27bb-29f2e30bae23	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5595-3c1f-db59-06b4e9cc7922	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5595-3c1f-8bdb-dd0b23526be0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5595-3c1f-7d00-331e4b3a01bd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5595-3c1f-788f-a3cc321b63b9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5595-3c1f-fd69-140e25109916	CU	CUB	192	Cuba 	Kuba	\N
00040000-5595-3c20-79a5-8003c15e8db1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5595-3c20-5655-806f05ceea47	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5595-3c20-1369-d4127a747469	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5595-3c20-271a-8df30e1dd062	DK	DNK	208	Denmark 	Danska	\N
00040000-5595-3c20-0131-936dab68cd6e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5595-3c20-5cb3-d2701820e04d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-3c20-aaf4-e52c909c8079	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5595-3c20-f6d8-7d1732e72c77	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5595-3c20-e775-699423143350	EG	EGY	818	Egypt 	Egipt	\N
00040000-5595-3c20-b9da-ed074496f27d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5595-3c20-0bea-f81c89f37695	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5595-3c20-18b0-8215ec67098e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5595-3c20-cc61-73aa6b47b0ce	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5595-3c20-2770-d4a52789b5f3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5595-3c20-04da-c82844652b06	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5595-3c20-c43e-f85bb36e137b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5595-3c20-462a-e539f6f99adc	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5595-3c20-cb49-6629c802f912	FI	FIN	246	Finland 	Finska	\N
00040000-5595-3c20-e7c4-ebf1d018ad4d	FR	FRA	250	France 	Francija	\N
00040000-5595-3c20-1b04-5f8fc70b6b9a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5595-3c20-200d-c669c804b711	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5595-3c20-75f1-cc07abd94b1f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5595-3c20-d188-42fad00a69ae	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5595-3c20-1119-46443fb2f402	GA	GAB	266	Gabon 	Gabon	\N
00040000-5595-3c20-578b-4258b6d735bf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5595-3c20-f19a-02dead7bcc45	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5595-3c20-d541-04a28f1d5529	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5595-3c20-81a3-345f8b8fb94b	GH	GHA	288	Ghana 	Gana	\N
00040000-5595-3c20-1cea-400036677d4d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5595-3c20-a677-0e5e6a414616	GR	GRC	300	Greece 	Grčija	\N
00040000-5595-3c20-6d9d-82447d696e16	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5595-3c20-124e-40a451812fe6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5595-3c20-13ac-9a00d2f2fb47	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5595-3c20-7e33-b53d95f2d025	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5595-3c20-f704-3c4b73295d6d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5595-3c20-28e6-c73d58b93f4f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5595-3c20-9fbb-c7c246b0e479	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5595-3c20-0782-9769e4b1da32	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5595-3c20-89af-9b7fe85c4d38	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5595-3c20-2710-5581b581e22c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5595-3c20-793c-15ec41bab868	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5595-3c20-d494-599be89cb66a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5595-3c20-622e-f0299ae5aff6	HN	HND	340	Honduras 	Honduras	\N
00040000-5595-3c20-807d-bd20f2f8711d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5595-3c20-2c38-32b91ffc2c37	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5595-3c20-4e22-c7a60077a95c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5595-3c20-035c-40f41a848513	IN	IND	356	India 	Indija	\N
00040000-5595-3c20-ddc3-e1dff15e08fa	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5595-3c20-c7eb-5b9460d73e09	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5595-3c20-3d72-2c396a82076f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5595-3c20-2be0-fb5705ec28bc	IE	IRL	372	Ireland 	Irska	\N
00040000-5595-3c20-28b2-a57304576c8f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5595-3c20-af3c-eb975dd84306	IL	ISR	376	Israel 	Izrael	\N
00040000-5595-3c20-727b-a04bcb2f649d	IT	ITA	380	Italy 	Italija	\N
00040000-5595-3c20-1a8a-aa11771666f2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5595-3c20-cc0a-8fc0d305c31d	JP	JPN	392	Japan 	Japonska	\N
00040000-5595-3c20-da55-a31cd4b65837	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5595-3c20-55ef-f3ee447d2195	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5595-3c20-09fd-07a6b82c13fb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5595-3c20-3b61-7ff1e6d9c115	KE	KEN	404	Kenya 	Kenija	\N
00040000-5595-3c20-a476-ee6da81010a8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5595-3c20-805b-6ed22a7bfb60	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5595-3c20-d30a-e1f49eca2d3c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5595-3c20-adb2-7b24c89093f9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5595-3c20-89ab-0172c4b977fe	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5595-3c20-2f80-6a6ea089fc0c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5595-3c20-8997-b81ef66e5e84	LV	LVA	428	Latvia 	Latvija	\N
00040000-5595-3c20-adc2-f4a6e2c9a1cc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5595-3c20-0433-4184d63fabc7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5595-3c20-686d-18a64c75fb9f	LR	LBR	430	Liberia 	Liberija	\N
00040000-5595-3c20-93d0-f91a945a0c69	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5595-3c20-7ff8-9fa3f1105a0c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5595-3c20-1386-e62fb5ba2393	LT	LTU	440	Lithuania 	Litva	\N
00040000-5595-3c20-a066-c2b0fe880393	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5595-3c20-d3a5-935b9a3b3961	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5595-3c20-25b0-db5122b9ef32	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5595-3c20-592e-2bc880dd5a06	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5595-3c20-d7d1-25db3987b5f0	MW	MWI	454	Malawi 	Malavi	\N
00040000-5595-3c20-d150-e0505d553471	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5595-3c20-7bd7-be3a50214229	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5595-3c20-7363-2a3c8bb75370	ML	MLI	466	Mali 	Mali	\N
00040000-5595-3c20-f122-46628cbcc426	MT	MLT	470	Malta 	Malta	\N
00040000-5595-3c20-b529-d866d988555d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5595-3c20-6b75-c056e681af30	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5595-3c20-9331-6c0cd43a32ca	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5595-3c20-e3f7-7ab411895d75	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5595-3c20-a17d-e775918d5686	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5595-3c20-011c-0f9985ddd614	MX	MEX	484	Mexico 	Mehika	\N
00040000-5595-3c20-85f8-8c56bd2b16f0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5595-3c20-2be8-23a4f8cf4377	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5595-3c20-f778-ef44528fbecd	MC	MCO	492	Monaco 	Monako	\N
00040000-5595-3c20-e07b-c33a82382e87	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5595-3c20-a3e6-d9089878f835	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5595-3c20-12b9-3a2484ddddfb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5595-3c20-5068-e09df33c9137	MA	MAR	504	Morocco 	Maroko	\N
00040000-5595-3c20-1c14-f2e5777128c5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5595-3c20-0aec-aeee06265b2f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5595-3c20-c028-a501d01766b1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5595-3c20-c33d-cdba21218bde	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5595-3c20-ff5e-617e3c4a4d1e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5595-3c20-c60a-ca2e266abdf2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5595-3c20-4d68-0bb42430b7d6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5595-3c20-9f53-b963a8af5e41	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5595-3c20-88d3-58dfcfb4651b	NE	NER	562	Niger 	Niger 	\N
00040000-5595-3c20-6c0c-40eefb506f6d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5595-3c20-6a8d-c8b48deddd64	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5595-3c20-94b3-0c92fe45febc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5595-3c20-8842-9f59b057d207	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5595-3c20-a1d6-7b663c65d0b9	NO	NOR	578	Norway 	Norveška	\N
00040000-5595-3c20-adb3-febda1260712	OM	OMN	512	Oman 	Oman	\N
00040000-5595-3c20-b730-fb089eddf0a0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5595-3c20-25db-fa23367fb09a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5595-3c20-6226-70fe6c764b43	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5595-3c20-c439-f3d8d1e0a818	PA	PAN	591	Panama 	Panama	\N
00040000-5595-3c20-2100-92af97b26648	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5595-3c20-a33f-f2b6e4d4a0c1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5595-3c20-f70a-2e885870590b	PE	PER	604	Peru 	Peru	\N
00040000-5595-3c20-f742-bba8deaeb6da	PH	PHL	608	Philippines 	Filipini	\N
00040000-5595-3c20-0f36-471bb4db9941	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5595-3c20-3dec-1699e4b2b548	PL	POL	616	Poland 	Poljska	\N
00040000-5595-3c20-1412-865c74c23a9e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5595-3c20-86f1-99ae9dbe6999	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5595-3c20-89df-95ecf8a0d0c3	QA	QAT	634	Qatar 	Katar	\N
00040000-5595-3c20-dfa8-3c2f4edd902e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5595-3c20-f54c-44673a15c371	RO	ROU	642	Romania 	Romunija	\N
00040000-5595-3c20-25b8-e238abeded5e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5595-3c20-0ff4-38b687977236	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5595-3c20-3877-4e9e52d8b089	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5595-3c20-c78a-2e1d5d357f2d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5595-3c20-1bf5-2e0b5d9b88ac	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5595-3c20-32cc-30db061f1f60	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5595-3c20-de66-ab47a5c6890b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5595-3c20-b445-d5578a38118b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5595-3c20-0fbb-976b8e8bbec1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5595-3c20-0641-8630df123828	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5595-3c20-869f-a92b7fe4f474	SM	SMR	674	San Marino 	San Marino	\N
00040000-5595-3c20-85c0-f9c7b5d6e00c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5595-3c20-55e7-fe61fef2b88e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5595-3c20-ccb5-b8271e3cf37a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5595-3c20-3762-42440eb06724	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5595-3c20-f4ca-559d89cf197a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5595-3c20-f7bc-becbea27e949	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5595-3c20-1999-628f860e411e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5595-3c20-25b6-5a4783f38a3b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5595-3c20-0b52-e89367742b5c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5595-3c20-f82d-bbc2a8529ae9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5595-3c20-9fc8-b08763b6f4cb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5595-3c20-8d67-84256b066b10	SO	SOM	706	Somalia 	Somalija	\N
00040000-5595-3c20-7705-4d92c2fef641	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5595-3c20-1823-b86c449262ae	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5595-3c20-6aa4-460833efece1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5595-3c20-e1ed-b89a1221259e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5595-3c20-2061-9806e154186e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5595-3c20-9255-7a1a821dd7b3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5595-3c20-c30b-e7bdab3326ac	SR	SUR	740	Suriname 	Surinam	\N
00040000-5595-3c20-b5f3-b06ac048cb04	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5595-3c20-a8ea-57b8dd22c1a9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5595-3c20-728e-61c6f88ea2e0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5595-3c20-bde6-7de0b1ff9c5b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5595-3c20-5a1d-2556c8885e0d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5595-3c20-7722-ad4996e80f62	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5595-3c20-2368-da69572b393c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5595-3c20-3861-544e29977608	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5595-3c20-e194-af9c13bcc4a2	TH	THA	764	Thailand 	Tajska	\N
00040000-5595-3c20-4293-f0b7be15c66d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5595-3c20-b3ed-fa4851767a89	TG	TGO	768	Togo 	Togo	\N
00040000-5595-3c20-9c90-37344e878f0a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5595-3c20-b1f7-a2e09033bcff	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5595-3c20-9d03-fbfb7509c328	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5595-3c20-6d82-2b167a6eae2d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5595-3c20-4948-c367476f34df	TR	TUR	792	Turkey 	Turčija	\N
00040000-5595-3c20-5079-a83a77b2a04b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5595-3c20-cf92-688a833a630f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-3c20-a1bc-196f9df9fa85	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5595-3c20-a389-8ba7f9655cd3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5595-3c20-2a6b-301a448f8e76	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5595-3c20-2a8b-0a49a47bfb0e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5595-3c20-93fc-e04c28432b4c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5595-3c20-f553-fa3de9c5e047	US	USA	840	United States 	Združene države Amerike	\N
00040000-5595-3c20-320c-c38b6ce06e05	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5595-3c20-bd96-704c57780145	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5595-3c20-dd10-28bb450f0849	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5595-3c20-b86a-03897294ac02	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5595-3c20-8433-70ec731b50f8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5595-3c20-df63-a95b9987a0ba	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5595-3c20-10b3-de8fc1e13430	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-3c20-1603-15f361f0914b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5595-3c20-7582-0f2d10668b8b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5595-3c20-6ea7-78029c6f7e65	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5595-3c20-f09d-0b0a54b63def	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5595-3c20-b12d-a7f2f929be84	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5595-3c20-d1dc-a1c3bf5f4140	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8898308)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5595-3c22-8744-5b7369065015	000e0000-5595-3c22-7422-2bd201e81e7b	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5595-3c21-4f23-dc859ceadecb	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5595-3c22-18d3-29c7acf51e89	000e0000-5595-3c22-a68a-45ac31f80de3	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5595-3c21-89ad-cb5a8bcc4e11	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8898116)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5595-3c22-e4e9-75e839c370e4	000e0000-5595-3c22-a68a-45ac31f80de3	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5595-3c21-7b00-05c37c5f4071
000d0000-5595-3c22-b7fc-2c1ad6ba6414	000e0000-5595-3c22-a68a-45ac31f80de3	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-3c21-7b00-05c37c5f4071
000d0000-5595-3c22-4e80-5a75e0b8ddfc	000e0000-5595-3c22-a68a-45ac31f80de3	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5595-3c21-8b4a-671b926f3958
000d0000-5595-3c22-354a-7fdcb592b4b5	000e0000-5595-3c22-a68a-45ac31f80de3	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5595-3c21-b84f-a63ff3978a63
000d0000-5595-3c22-894d-28e7dcfb218a	000e0000-5595-3c22-a68a-45ac31f80de3	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5595-3c21-b84f-a63ff3978a63
000d0000-5595-3c22-b65f-6d8f10da1b0b	000e0000-5595-3c22-a68a-45ac31f80de3	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5595-3c21-b84f-a63ff3978a63
000d0000-5595-3c22-0629-c3057272acc7	000e0000-5595-3c22-a68a-45ac31f80de3	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-3c21-7b00-05c37c5f4071
\.


--
-- TOC entry 2866 (class 0 OID 8897936)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8897984)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8897916)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5595-3c22-6040-8816a3d3fab2	00080000-5595-3c22-282f-47a1f1a0da80	00090000-5595-3c22-08b5-faa0ec801943	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8898033)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8898058)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8897873)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5595-3c20-4eb9-2fe00556f30d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5595-3c20-2868-98a924014e1b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5595-3c20-c74c-03b176ea44bb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5595-3c20-7237-f06b1579a7c9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5595-3c20-ce51-7a5a0904ec43	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5595-3c20-9887-b6a9c03c7c08	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5595-3c20-d668-bb904ccba67a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5595-3c20-6e5d-7074433c9ba9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-3c20-8eaa-33af663494fa	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-3c20-7206-54b8842417f0	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5595-3c20-c91c-3fd6aa606dc9	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5595-3c20-67b4-45346bde28dc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5595-3c20-a2bb-3f0dafdad530	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5595-3c22-6752-81805c4834d8	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5595-3c22-735c-a6e9b217c313	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5595-3c22-1675-0fe786daf274	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5595-3c22-bd9d-dac0b4e8f188	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5595-3c22-db89-e6b93099dbad	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5595-3c22-8750-3b19488474a0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8897786)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5595-3c22-e548-92af7508bb48	00000000-5595-3c22-735c-a6e9b217c313	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5595-3c22-d176-3cea74ddc4e4	00000000-5595-3c22-735c-a6e9b217c313	00010000-5595-3c20-f42a-755cdeb85013	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5595-3c22-42e3-d7f18aa636f8	00000000-5595-3c22-1675-0fe786daf274	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8897797)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5595-3c22-ccfd-8cdb594e9ebb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5595-3c22-ccb7-0a56fd99fd14	00010000-5595-3c22-1f94-caef6e93f2ad	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5595-3c22-38af-257288473dd2	00010000-5595-3c22-770e-820495248faf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5595-3c22-2ef2-17f6add79b62	00010000-5595-3c22-037d-022cac2f734d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5595-3c22-c72a-e60c0fba7f20	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5595-3c22-3fa9-3388f0216b27	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5595-3c22-22d7-5b693eb7e3a2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5595-3c22-5391-e4042a0bec74	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5595-3c22-08b5-faa0ec801943	00010000-5595-3c22-3a72-628297dc4f1d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5595-3c22-3a01-051e4539866f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5595-3c22-5933-dbf17a8f2aec	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5595-3c22-f0b7-22a20a54b751	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5595-3c22-4f93-12da02650821	00010000-5595-3c22-d0c9-c2289e098d6d	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8897751)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5595-3c20-a7fc-1c1c189ae076	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5595-3c20-0a9d-ccca5e31ad2a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5595-3c20-b10c-a56d1bd8ce4e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5595-3c20-4c1b-9c6c6d5c1e0c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5595-3c20-ec53-f5cd8223939a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5595-3c20-f374-bad3351c43bd	Abonma-read	Abonma - branje	f
00030000-5595-3c20-225c-9e4ec2c6d0ec	Abonma-write	Abonma - spreminjanje	f
00030000-5595-3c20-54a8-fcc5d402fa4d	Alternacija-read	Alternacija - branje	f
00030000-5595-3c20-337b-cd51ea4cbf40	Alternacija-write	Alternacija - spreminjanje	f
00030000-5595-3c20-1739-c417f231b300	Arhivalija-read	Arhivalija - branje	f
00030000-5595-3c20-f5ff-a87b9c91950c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5595-3c20-d2ac-e60ec190e1e9	Besedilo-read	Besedilo - branje	f
00030000-5595-3c20-0052-0d2f1f2b2aad	Besedilo-write	Besedilo - spreminjanje	f
00030000-5595-3c20-d213-a04a22bc8e6e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5595-3c20-cda6-802529a6f193	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5595-3c20-5c34-59e6798e611b	Dogodek-read	Dogodek - branje	f
00030000-5595-3c20-88ab-e4e8e81337d5	Dogodek-write	Dogodek - spreminjanje	f
00030000-5595-3c20-300e-c6fb1aac9a90	DrugiVir-read	DrugiVir - branje	f
00030000-5595-3c20-86ac-f9b2313de7c1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5595-3c20-89f2-d61a820820f9	Drzava-read	Drzava - branje	f
00030000-5595-3c20-d84f-cdb27a9d7dc0	Drzava-write	Drzava - spreminjanje	f
00030000-5595-3c20-19eb-305dc241b17d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5595-3c20-8dbd-e4463b619a3d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5595-3c20-2a07-41dacdfe66f4	Funkcija-read	Funkcija - branje	f
00030000-5595-3c20-938c-93e7cb5e4220	Funkcija-write	Funkcija - spreminjanje	f
00030000-5595-3c20-056c-c72912904c58	Gostovanje-read	Gostovanje - branje	f
00030000-5595-3c20-8d3d-01a2c0b2b933	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5595-3c20-2719-ca1b98e43f14	Gostujoca-read	Gostujoca - branje	f
00030000-5595-3c20-2e4f-efa82bac57e0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5595-3c20-1263-c11bcc4b9b1f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5595-3c20-c1b3-11d822b40b6a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5595-3c20-bae6-a1eca7125fe3	Kupec-read	Kupec - branje	f
00030000-5595-3c20-5a32-28a66bb2de54	Kupec-write	Kupec - spreminjanje	f
00030000-5595-3c20-b9fb-637d0df1dfe5	NacinPlacina-read	NacinPlacina - branje	f
00030000-5595-3c20-ed39-94887aa562c6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5595-3c20-79d8-05fd2445682b	Option-read	Option - branje	f
00030000-5595-3c20-b4da-dc20fe19cd46	Option-write	Option - spreminjanje	f
00030000-5595-3c20-94d5-3a291ad7c1ad	OptionValue-read	OptionValue - branje	f
00030000-5595-3c20-5975-0146884418b9	OptionValue-write	OptionValue - spreminjanje	f
00030000-5595-3c20-29d3-b06685d88dad	Oseba-read	Oseba - branje	f
00030000-5595-3c20-a1b4-7014c0cd77b4	Oseba-write	Oseba - spreminjanje	f
00030000-5595-3c20-e1d5-1d04ae4724e2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5595-3c20-6d78-b1698933180f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5595-3c20-31a2-807636615a2b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5595-3c20-6c45-da229f703b97	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5595-3c20-079e-7728a44c8817	Pogodba-read	Pogodba - branje	f
00030000-5595-3c20-b80f-8bd3aa2e2907	Pogodba-write	Pogodba - spreminjanje	f
00030000-5595-3c20-fba6-97f3de439887	Popa-read	Popa - branje	f
00030000-5595-3c20-8e0f-20e82ee9dfc1	Popa-write	Popa - spreminjanje	f
00030000-5595-3c20-3021-5649a70d1b81	Posta-read	Posta - branje	f
00030000-5595-3c20-70a4-072de35d0eea	Posta-write	Posta - spreminjanje	f
00030000-5595-3c20-c844-d69fc95863d5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5595-3c20-9d62-977b5b49decc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5595-3c20-638b-ec622037a931	PostniNaslov-read	PostniNaslov - branje	f
00030000-5595-3c20-a5fb-85162db7282e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5595-3c20-668d-7e1ece827aa9	Predstava-read	Predstava - branje	f
00030000-5595-3c20-c93e-9e5fbd82f6d0	Predstava-write	Predstava - spreminjanje	f
00030000-5595-3c20-62e7-f52672e8fae1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5595-3c20-54a9-9547fbb3cd52	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5595-3c20-3c29-bcbcaf0f4b48	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5595-3c20-6900-66e2de0b6881	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5595-3c20-3fa3-cbcc0819cd26	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5595-3c20-cd7d-eb6141168c8b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5595-3c20-fb8e-71ec8e506c08	ProgramDela-read	ProgramDela - branje	f
00030000-5595-3c20-b2c9-e2b2f93ad599	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5595-3c20-6ec8-b99af99b20a3	ProgramFestival-read	ProgramFestival - branje	f
00030000-5595-3c20-7e8f-fc5ca8624551	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5595-3c20-0f8b-a93c00477fc4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5595-3c20-f7e3-672fdd97cb1f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5595-3c20-e2c6-508cbda37d1a	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5595-3c20-a007-d3e7872f3cb7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5595-3c20-ec48-636b11a14542	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5595-3c20-49eb-d7553dbcee8f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5595-3c20-6f5f-8a1c36c1303d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5595-3c20-8193-9bfb5864494c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5595-3c20-3b7c-308641cfe0ea	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5595-3c20-caa3-5f02aec16089	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5595-3c20-7618-413be4c6b0ca	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5595-3c20-b663-9a38147cf2a3	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5595-3c20-d5d0-908c63310e12	ProgramRazno-read	ProgramRazno - branje	f
00030000-5595-3c20-d533-2b0ab39c5087	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5595-3c20-99e2-39e1d84cbbda	Prostor-read	Prostor - branje	f
00030000-5595-3c20-1675-5652b1d73147	Prostor-write	Prostor - spreminjanje	f
00030000-5595-3c20-de7f-fc938d0c8e44	Racun-read	Racun - branje	f
00030000-5595-3c20-6bd2-6a15c9045be3	Racun-write	Racun - spreminjanje	f
00030000-5595-3c20-22b5-02c313d50eec	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5595-3c20-bd0e-b22fb205e804	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5595-3c20-7058-d9e10d363f77	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5595-3c20-abe0-13b07b392ba3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5595-3c20-224b-2bfaab2eca60	Rekvizit-read	Rekvizit - branje	f
00030000-5595-3c20-930b-a187678be258	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5595-3c20-0e4f-16d17732c141	Revizija-read	Revizija - branje	f
00030000-5595-3c20-2622-2c93871a0433	Revizija-write	Revizija - spreminjanje	f
00030000-5595-3c20-081e-922bf39090d4	Rezervacija-read	Rezervacija - branje	f
00030000-5595-3c20-5d9f-d34bdc0642f8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5595-3c20-fb2b-faef3679cfa6	SedezniRed-read	SedezniRed - branje	f
00030000-5595-3c20-fc37-1060a7fbe070	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5595-3c20-a768-ab4c421ae1d3	Sedez-read	Sedez - branje	f
00030000-5595-3c20-21e2-4dfdfa820d73	Sedez-write	Sedez - spreminjanje	f
00030000-5595-3c20-f8b0-6f4cf32c9de4	Sezona-read	Sezona - branje	f
00030000-5595-3c20-d061-2dc0cea566c0	Sezona-write	Sezona - spreminjanje	f
00030000-5595-3c20-118b-c9866f6f9aca	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5595-3c20-169a-48dcda34fe4e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5595-3c20-c433-9db2177d7776	Stevilcenje-read	Stevilcenje - branje	f
00030000-5595-3c20-5e1e-1a1060ae661d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5595-3c20-befc-7d9bf08ce4b9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5595-3c20-3d20-f4596f74c6a9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5595-3c20-4be8-8e45bf4042b9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5595-3c20-fe2f-c2b5121a9aee	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5595-3c20-5b12-adfebdf51d3c	Telefonska-read	Telefonska - branje	f
00030000-5595-3c20-8b54-39d2642ef099	Telefonska-write	Telefonska - spreminjanje	f
00030000-5595-3c20-dcf8-b8597ce6e5e9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5595-3c20-48f8-d9ea0f33caac	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5595-3c20-55f3-13109a9f4aad	TipFunkcije-read	TipFunkcije - branje	f
00030000-5595-3c20-d6f9-3dfcd2a8e372	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5595-3c20-8926-4cf69af5287b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5595-3c20-6593-fa7336f0c282	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5595-3c20-2547-8860f2f3bcea	Trr-read	Trr - branje	f
00030000-5595-3c20-7693-4d93493fbd16	Trr-write	Trr - spreminjanje	f
00030000-5595-3c20-3e5b-fc67fcd65013	Uprizoritev-read	Uprizoritev - branje	f
00030000-5595-3c20-6020-13ce09727b46	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5595-3c20-9b75-7347843af2c4	Vaja-read	Vaja - branje	f
00030000-5595-3c20-f46e-9f14fb7aec6e	Vaja-write	Vaja - spreminjanje	f
00030000-5595-3c20-5455-2f728c861666	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5595-3c20-eeae-4300683b0109	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5595-3c20-6375-03da40ad4abe	Zaposlitev-read	Zaposlitev - branje	f
00030000-5595-3c20-aecc-2578e0ebe431	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5595-3c20-e664-6163b2e5c6f7	Zasedenost-read	Zasedenost - branje	f
00030000-5595-3c20-2bf3-25e4afad5e7d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5595-3c20-d7d3-7f5ead4a763d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5595-3c20-dcd9-a7a1220de79a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5595-3c20-fe58-291d16ac02db	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5595-3c20-d46f-feacbb89d43e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8897770)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5595-3c20-bac9-d8ddb5d996a5	00030000-5595-3c20-0a9d-ccca5e31ad2a
00020000-5595-3c20-b4cb-56eec29004cf	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-225c-9e4ec2c6d0ec
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-54a8-fcc5d402fa4d
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-337b-cd51ea4cbf40
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-4c1b-9c6c6d5c1e0c
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-88ab-e4e8e81337d5
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-d84f-cdb27a9d7dc0
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-2a07-41dacdfe66f4
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-938c-93e7cb5e4220
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-8d3d-01a2c0b2b933
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-2e4f-efa82bac57e0
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-1263-c11bcc4b9b1f
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-c1b3-11d822b40b6a
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-29d3-b06685d88dad
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-a1b4-7014c0cd77b4
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-8e0f-20e82ee9dfc1
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-70a4-072de35d0eea
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-638b-ec622037a931
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-a5fb-85162db7282e
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-c93e-9e5fbd82f6d0
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-3fa3-cbcc0819cd26
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-cd7d-eb6141168c8b
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-1675-5652b1d73147
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-abe0-13b07b392ba3
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-930b-a187678be258
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-d061-2dc0cea566c0
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-55f3-13109a9f4aad
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-3e5b-fc67fcd65013
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-6020-13ce09727b46
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-9b75-7347843af2c4
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-f46e-9f14fb7aec6e
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-e664-6163b2e5c6f7
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-2bf3-25e4afad5e7d
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c20-1a9a-8a19179273db	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-1263-c11bcc4b9b1f
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-c1b3-11d822b40b6a
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-29d3-b06685d88dad
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-a1b4-7014c0cd77b4
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-638b-ec622037a931
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-a5fb-85162db7282e
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-5b12-adfebdf51d3c
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-8b54-39d2642ef099
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-2547-8860f2f3bcea
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-7693-4d93493fbd16
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-6375-03da40ad4abe
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-aecc-2578e0ebe431
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c20-2a34-df862879376c	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-54a8-fcc5d402fa4d
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-f5ff-a87b9c91950c
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-d2ac-e60ec190e1e9
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-d213-a04a22bc8e6e
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-2a07-41dacdfe66f4
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-1263-c11bcc4b9b1f
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-29d3-b06685d88dad
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-3fa3-cbcc0819cd26
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-55f3-13109a9f4aad
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-9b75-7347843af2c4
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-e664-6163b2e5c6f7
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c20-6292-5a82a4fb1a15	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-225c-9e4ec2c6d0ec
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-337b-cd51ea4cbf40
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-55f3-13109a9f4aad
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c20-078e-aeb4c968318f	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-dcf8-b8597ce6e5e9
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-b10c-a56d1bd8ce4e
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-55f3-13109a9f4aad
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c20-dac7-711ba8c223fe	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-a7fc-1c1c189ae076
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-0a9d-ccca5e31ad2a
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b10c-a56d1bd8ce4e
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-4c1b-9c6c6d5c1e0c
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-ec53-f5cd8223939a
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-f374-bad3351c43bd
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-225c-9e4ec2c6d0ec
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-54a8-fcc5d402fa4d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-337b-cd51ea4cbf40
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-1739-c417f231b300
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-f5ff-a87b9c91950c
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d2ac-e60ec190e1e9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-0052-0d2f1f2b2aad
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d213-a04a22bc8e6e
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-cda6-802529a6f193
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5c34-59e6798e611b
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-88ab-e4e8e81337d5
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-89f2-d61a820820f9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d84f-cdb27a9d7dc0
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-19eb-305dc241b17d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8dbd-e4463b619a3d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2a07-41dacdfe66f4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-938c-93e7cb5e4220
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-056c-c72912904c58
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8d3d-01a2c0b2b933
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2719-ca1b98e43f14
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2e4f-efa82bac57e0
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-1263-c11bcc4b9b1f
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-c1b3-11d822b40b6a
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-bae6-a1eca7125fe3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5a32-28a66bb2de54
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b9fb-637d0df1dfe5
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-ed39-94887aa562c6
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-79d8-05fd2445682b
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b4da-dc20fe19cd46
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-94d5-3a291ad7c1ad
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5975-0146884418b9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-29d3-b06685d88dad
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-a1b4-7014c0cd77b4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-e1d5-1d04ae4724e2
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6d78-b1698933180f
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-31a2-807636615a2b
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6c45-da229f703b97
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-079e-7728a44c8817
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b80f-8bd3aa2e2907
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fba6-97f3de439887
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8e0f-20e82ee9dfc1
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3021-5649a70d1b81
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-70a4-072de35d0eea
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-c844-d69fc95863d5
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-9d62-977b5b49decc
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-638b-ec622037a931
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-a5fb-85162db7282e
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-668d-7e1ece827aa9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-c93e-9e5fbd82f6d0
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-62e7-f52672e8fae1
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-54a9-9547fbb3cd52
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3c29-bcbcaf0f4b48
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6900-66e2de0b6881
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3fa3-cbcc0819cd26
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-cd7d-eb6141168c8b
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fb8e-71ec8e506c08
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b2c9-e2b2f93ad599
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6ec8-b99af99b20a3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-7e8f-fc5ca8624551
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-0f8b-a93c00477fc4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-f7e3-672fdd97cb1f
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-e2c6-508cbda37d1a
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-a007-d3e7872f3cb7
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-ec48-636b11a14542
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-49eb-d7553dbcee8f
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6f5f-8a1c36c1303d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8193-9bfb5864494c
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3b7c-308641cfe0ea
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-caa3-5f02aec16089
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-7618-413be4c6b0ca
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-b663-9a38147cf2a3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d5d0-908c63310e12
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d533-2b0ab39c5087
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-99e2-39e1d84cbbda
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-1675-5652b1d73147
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-de7f-fc938d0c8e44
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6bd2-6a15c9045be3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-22b5-02c313d50eec
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-bd0e-b22fb205e804
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-7058-d9e10d363f77
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-abe0-13b07b392ba3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-224b-2bfaab2eca60
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-930b-a187678be258
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-0e4f-16d17732c141
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2622-2c93871a0433
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-081e-922bf39090d4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5d9f-d34bdc0642f8
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fb2b-faef3679cfa6
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fc37-1060a7fbe070
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-a768-ab4c421ae1d3
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-21e2-4dfdfa820d73
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-f8b0-6f4cf32c9de4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d061-2dc0cea566c0
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-118b-c9866f6f9aca
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-169a-48dcda34fe4e
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-c433-9db2177d7776
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5e1e-1a1060ae661d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-befc-7d9bf08ce4b9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3d20-f4596f74c6a9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-4be8-8e45bf4042b9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fe2f-c2b5121a9aee
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5b12-adfebdf51d3c
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8b54-39d2642ef099
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-dcf8-b8597ce6e5e9
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-48f8-d9ea0f33caac
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-55f3-13109a9f4aad
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d6f9-3dfcd2a8e372
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-8926-4cf69af5287b
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6593-fa7336f0c282
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2547-8860f2f3bcea
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-7693-4d93493fbd16
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-3e5b-fc67fcd65013
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6020-13ce09727b46
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-9b75-7347843af2c4
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-f46e-9f14fb7aec6e
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-5455-2f728c861666
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-eeae-4300683b0109
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-6375-03da40ad4abe
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-aecc-2578e0ebe431
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-e664-6163b2e5c6f7
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-2bf3-25e4afad5e7d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d7d3-7f5ead4a763d
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-dcd9-a7a1220de79a
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-fe58-291d16ac02db
00020000-5595-3c22-71bf-7d99047327f4	00030000-5595-3c20-d46f-feacbb89d43e
\.


--
-- TOC entry 2881 (class 0 OID 8898065)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8898096)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8898228)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5595-3c22-b069-151062d7a035	00090000-5595-3c22-ccfd-8cdb594e9ebb	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8897830)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5595-3c22-282f-47a1f1a0da80	00040000-5595-3c20-f82d-bbc2a8529ae9	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-0ab8-edf01150a2eb	00040000-5595-3c20-f82d-bbc2a8529ae9	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5595-3c22-aa64-5d5289db3eb8	00040000-5595-3c20-f82d-bbc2a8529ae9	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-b7c8-69c93398de40	00040000-5595-3c20-f82d-bbc2a8529ae9	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-c434-1785c217f81e	00040000-5595-3c20-f82d-bbc2a8529ae9	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-7e94-d816c70d74d1	00040000-5595-3c1f-8190-240c47c421cd	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-2bcc-45f274414795	00040000-5595-3c1f-788f-a3cc321b63b9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-cb6d-6b5e81d7b3f1	00040000-5595-3c1f-d214-1676f2cdc511	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-3c22-a1a8-706a6124d83a	00040000-5595-3c20-f82d-bbc2a8529ae9	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8897865)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5595-3c20-f077-55b5b4ed1692	8341	Adlešiči
00050000-5595-3c20-7dea-651a84a328f0	5270	Ajdovščina
00050000-5595-3c20-0999-501aaa2c35c6	6280	Ankaran/Ancarano
00050000-5595-3c20-6ed9-1afbe8b29680	9253	Apače
00050000-5595-3c20-05f5-66cfdd47ace1	8253	Artiče
00050000-5595-3c20-5180-4761f5fe7231	4275	Begunje na Gorenjskem
00050000-5595-3c20-9917-872f43c00fd7	1382	Begunje pri Cerknici
00050000-5595-3c20-4de3-90c8692f6e2e	9231	Beltinci
00050000-5595-3c20-a581-f7f59944fd59	2234	Benedikt
00050000-5595-3c20-fefe-2d6406ef0e4f	2345	Bistrica ob Dravi
00050000-5595-3c20-b009-31f46b93de77	3256	Bistrica ob Sotli
00050000-5595-3c20-bd42-f23e74753a8d	8259	Bizeljsko
00050000-5595-3c20-87d6-9ed4fc4d2b8a	1223	Blagovica
00050000-5595-3c20-cdef-d8740d615ace	8283	Blanca
00050000-5595-3c20-f85a-57ddb4b39691	4260	Bled
00050000-5595-3c20-3e16-fea8041004bd	4273	Blejska Dobrava
00050000-5595-3c20-2b99-4e5e0e62d025	9265	Bodonci
00050000-5595-3c20-79aa-6272831323e5	9222	Bogojina
00050000-5595-3c20-2ffb-56913b91ab5c	4263	Bohinjska Bela
00050000-5595-3c20-998b-44a134516449	4264	Bohinjska Bistrica
00050000-5595-3c20-beae-9d44acebb32c	4265	Bohinjsko jezero
00050000-5595-3c20-b310-0d83f7224ac7	1353	Borovnica
00050000-5595-3c20-9274-c85b235471fd	8294	Boštanj
00050000-5595-3c20-268a-1df742d3fe01	5230	Bovec
00050000-5595-3c20-483a-678bee2e3e47	5295	Branik
00050000-5595-3c20-79dc-2d7f499bf930	3314	Braslovče
00050000-5595-3c20-b23f-74fdfb6a388b	5223	Breginj
00050000-5595-3c20-931f-1fa2f6dea1de	8280	Brestanica
00050000-5595-3c20-80bc-454cde3c08b3	2354	Bresternica
00050000-5595-3c20-c39f-52a242ede0ca	4243	Brezje
00050000-5595-3c20-60ac-80c7593a9973	1351	Brezovica pri Ljubljani
00050000-5595-3c20-1c0f-71e2dc5fa37f	8250	Brežice
00050000-5595-3c20-dade-ea9bbd905d83	4210	Brnik - Aerodrom
00050000-5595-3c20-e784-293ac5d48a5d	8321	Brusnice
00050000-5595-3c20-b0bc-da06e2d66838	3255	Buče
00050000-5595-3c20-ca51-1c78fcaffe1d	8276	Bučka 
00050000-5595-3c20-c4ff-0e44962847d2	9261	Cankova
00050000-5595-3c20-4bdf-871018a6c930	3000	Celje 
00050000-5595-3c20-eb05-edbb12ba4d10	3001	Celje - poštni predali
00050000-5595-3c20-8b7a-e074195b0b09	4207	Cerklje na Gorenjskem
00050000-5595-3c20-bd22-df347e84639a	8263	Cerklje ob Krki
00050000-5595-3c20-8511-5d8f5ddae698	1380	Cerknica
00050000-5595-3c20-17f0-ab8d560ddcb4	5282	Cerkno
00050000-5595-3c20-a28c-7cc2aafa93f2	2236	Cerkvenjak
00050000-5595-3c20-a643-474ad0667c8c	2215	Ceršak
00050000-5595-3c20-d71d-f18063691c24	2326	Cirkovce
00050000-5595-3c20-f864-95a996fcad61	2282	Cirkulane
00050000-5595-3c20-6284-8375f1ab1d9a	5273	Col
00050000-5595-3c20-ddee-7f96bd70f6ac	8251	Čatež ob Savi
00050000-5595-3c20-0ac1-d6d708b3de78	1413	Čemšenik
00050000-5595-3c20-189d-3da849a6b86a	5253	Čepovan
00050000-5595-3c20-887f-76bb45adcd53	9232	Črenšovci
00050000-5595-3c20-84ba-cbb8a439c36e	2393	Črna na Koroškem
00050000-5595-3c20-447e-936e8358f178	6275	Črni Kal
00050000-5595-3c20-08ce-646b318baa85	5274	Črni Vrh nad Idrijo
00050000-5595-3c20-feae-25ac2c15048b	5262	Črniče
00050000-5595-3c20-05f8-709c885bd939	8340	Črnomelj
00050000-5595-3c20-7cf8-921c3589a4aa	6271	Dekani
00050000-5595-3c20-594d-77f9ad66b29d	5210	Deskle
00050000-5595-3c20-352f-e2263d69987e	2253	Destrnik
00050000-5595-3c20-30c3-2e414450fec9	6215	Divača
00050000-5595-3c20-ebe3-46b4e8a4a52c	1233	Dob
00050000-5595-3c20-8a97-9c5fc3b484f4	3224	Dobje pri Planini
00050000-5595-3c20-65d6-6c07d5341058	8257	Dobova
00050000-5595-3c20-b95c-710561f1ca75	1423	Dobovec
00050000-5595-3c20-2c5d-2f6552a2a069	5263	Dobravlje
00050000-5595-3c20-d14f-eb2bfb445d1f	3204	Dobrna
00050000-5595-3c20-cf2e-4f73209540a3	8211	Dobrnič
00050000-5595-3c20-47f3-b5026708bf06	1356	Dobrova
00050000-5595-3c20-cece-b26255905889	9223	Dobrovnik/Dobronak 
00050000-5595-3c20-35f5-049abd90f6d5	5212	Dobrovo v Brdih
00050000-5595-3c20-3d65-7197e956919b	1431	Dol pri Hrastniku
00050000-5595-3c20-8757-742a0a196f0b	1262	Dol pri Ljubljani
00050000-5595-3c20-c13d-3d0ec39b0560	1273	Dole pri Litiji
00050000-5595-3c20-148d-78fe78957ec3	1331	Dolenja vas
00050000-5595-3c20-3296-d34d99f4d99e	8350	Dolenjske Toplice
00050000-5595-3c20-172a-58125a0785cb	1230	Domžale
00050000-5595-3c20-9641-a380dfa83aec	2252	Dornava
00050000-5595-3c20-3449-8379357de572	5294	Dornberk
00050000-5595-3c20-ae7d-79203d7187df	1319	Draga
00050000-5595-3c20-9b67-efc11a4e04ce	8343	Dragatuš
00050000-5595-3c20-6aad-f608d1ae7e80	3222	Dramlje
00050000-5595-3c20-53de-31966aa11b83	2370	Dravograd
00050000-5595-3c20-9b00-07a400c39545	4203	Duplje
00050000-5595-3c20-9d7d-9ed60f7a6e74	6221	Dutovlje
00050000-5595-3c20-0e1c-b0ea5ce5d9c1	8361	Dvor
00050000-5595-3c20-d49a-4236b2f10bb8	2343	Fala
00050000-5595-3c20-c295-4fec76544377	9208	Fokovci
00050000-5595-3c20-c5f8-9003097395a6	2313	Fram
00050000-5595-3c20-37f1-d7a20e3fd504	3213	Frankolovo
00050000-5595-3c20-e57f-1631a0e51920	1274	Gabrovka
00050000-5595-3c20-c0d1-e2727f8bddbe	8254	Globoko
00050000-5595-3c20-da55-8d2bc1bf6159	5275	Godovič
00050000-5595-3c20-23b9-4b5426e5fd0a	4204	Golnik
00050000-5595-3c20-e203-f2137cefe613	3303	Gomilsko
00050000-5595-3c20-7767-6f96435d51f5	4224	Gorenja vas
00050000-5595-3c20-fe0f-f2b525a2240a	3263	Gorica pri Slivnici
00050000-5595-3c20-8431-6a8d882576ab	2272	Gorišnica
00050000-5595-3c20-c4e1-0cbfd8fdf2e4	9250	Gornja Radgona
00050000-5595-3c20-251c-0cbadf1754eb	3342	Gornji Grad
00050000-5595-3c20-a111-3d102081a1ed	4282	Gozd Martuljek
00050000-5595-3c20-5feb-d4be41614299	6272	Gračišče
00050000-5595-3c20-9607-0bcbf9c58291	9264	Grad
00050000-5595-3c20-a16e-5b008e5e61f4	8332	Gradac
00050000-5595-3c20-01e9-4be4fd9eb39d	1384	Grahovo
00050000-5595-3c20-4499-7e4a168751e8	5242	Grahovo ob Bači
00050000-5595-3c20-2057-8397f1e9390f	5251	Grgar
00050000-5595-3c20-9263-04c90e4420ce	3302	Griže
00050000-5595-3c20-4c5d-2ac0413bbe8d	3231	Grobelno
00050000-5595-3c20-8326-5b175ff67092	1290	Grosuplje
00050000-5595-3c20-a9ca-391e41dd01ac	2288	Hajdina
00050000-5595-3c20-7de7-7e715f00093d	8362	Hinje
00050000-5595-3c20-1062-cc20540eb8cf	2311	Hoče
00050000-5595-3c20-cb08-a26a3d7c94c0	9205	Hodoš/Hodos
00050000-5595-3c20-67a8-75a673cdc0d9	1354	Horjul
00050000-5595-3c20-91dc-15c6710dd0e0	1372	Hotedršica
00050000-5595-3c20-9b4c-962f374b9b67	1430	Hrastnik
00050000-5595-3c20-ce40-0ee304cc0944	6225	Hruševje
00050000-5595-3c20-f88a-95725b43b22c	4276	Hrušica
00050000-5595-3c20-4794-4de27fc8e21f	5280	Idrija
00050000-5595-3c20-619b-b3b20f91a613	1292	Ig
00050000-5595-3c20-b384-105002448e5c	6250	Ilirska Bistrica
00050000-5595-3c20-0ec3-b20a56594709	6251	Ilirska Bistrica-Trnovo
00050000-5595-3c20-7387-c846c1fa48ea	1295	Ivančna Gorica
00050000-5595-3c20-2a9a-a5bb75c94e2f	2259	Ivanjkovci
00050000-5595-3c20-ba7b-70e5ba980ece	1411	Izlake
00050000-5595-3c20-6e07-6e0bde24625c	6310	Izola/Isola
00050000-5595-3c20-0bb5-3736201c5569	2222	Jakobski Dol
00050000-5595-3c20-5650-c6e97f3da8b1	2221	Jarenina
00050000-5595-3c20-afa3-0c675da38213	6254	Jelšane
00050000-5595-3c20-4631-9ca4553b89f1	4270	Jesenice
00050000-5595-3c20-5dbc-6441e77142a8	8261	Jesenice na Dolenjskem
00050000-5595-3c20-cd83-f9eae79b0adf	3273	Jurklošter
00050000-5595-3c20-92b3-7eec48894c55	2223	Jurovski Dol
00050000-5595-3c20-3eb2-c09a37be1999	2256	Juršinci
00050000-5595-3c20-1b14-85a405e02f9f	5214	Kal nad Kanalom
00050000-5595-3c20-6470-548c313b8660	3233	Kalobje
00050000-5595-3c20-ea13-c5f741705a24	4246	Kamna Gorica
00050000-5595-3c20-23fe-4ec5fa487d36	2351	Kamnica
00050000-5595-3c20-3d81-0155b69643e3	1241	Kamnik
00050000-5595-3c20-3620-bb34b810a04b	5213	Kanal
00050000-5595-3c20-d8d4-464cded78cfc	8258	Kapele
00050000-5595-3c20-4be4-efc38a1cf98e	2362	Kapla
00050000-5595-3c20-17a3-b4c9e896317c	2325	Kidričevo
00050000-5595-3c20-834d-de5d31ad391b	1412	Kisovec
00050000-5595-3c20-bfab-9e56cd73f715	6253	Knežak
00050000-5595-3c20-ce4f-10f7036cd053	5222	Kobarid
00050000-5595-3c20-871d-1ea33aefad0c	9227	Kobilje
00050000-5595-3c20-eec7-26f24ad77569	1330	Kočevje
00050000-5595-3c20-d2e2-bc32f6cc5517	1338	Kočevska Reka
00050000-5595-3c20-240a-390bbc48aad6	2276	Kog
00050000-5595-3c20-ff81-1c88b7cb0f50	5211	Kojsko
00050000-5595-3c20-79c6-44f18a2615ae	6223	Komen
00050000-5595-3c20-83b6-f4680aabb599	1218	Komenda
00050000-5595-3c20-0542-6694866b3e46	6000	Koper/Capodistria 
00050000-5595-3c20-3224-b91b06381659	6001	Koper/Capodistria - poštni predali
00050000-5595-3c20-3106-dd2b39896706	8282	Koprivnica
00050000-5595-3c20-9ed0-53196efe9a1a	5296	Kostanjevica na Krasu
00050000-5595-3c20-9f04-1213a7eec717	8311	Kostanjevica na Krki
00050000-5595-3c20-c0ca-40504d16dc6b	1336	Kostel
00050000-5595-3c20-a66e-24b5c8cffd83	6256	Košana
00050000-5595-3c20-7851-2b50d3b0b316	2394	Kotlje
00050000-5595-3c20-be30-f5744c780011	6240	Kozina
00050000-5595-3c20-8334-e2934eb79197	3260	Kozje
00050000-5595-3c20-a850-c02018603182	4000	Kranj 
00050000-5595-3c20-8661-b3cd8b65dd4d	4001	Kranj - poštni predali
00050000-5595-3c20-6ceb-ce04c7b4e955	4280	Kranjska Gora
00050000-5595-3c20-efa7-f97e453376f7	1281	Kresnice
00050000-5595-3c20-0fea-88e0919282c0	4294	Križe
00050000-5595-3c20-6c21-cb61890a8157	9206	Križevci
00050000-5595-3c20-a6d6-e03c38389e35	9242	Križevci pri Ljutomeru
00050000-5595-3c20-6273-0f045bf229cf	1301	Krka
00050000-5595-3c20-d17d-7aa503aa1cc9	8296	Krmelj
00050000-5595-3c20-ecde-45fe4f399c45	4245	Kropa
00050000-5595-3c20-fecc-f40a79af0652	8262	Krška vas
00050000-5595-3c20-aefa-3ecf0d93f15d	8270	Krško
00050000-5595-3c20-5635-5a5f2de92a7b	9263	Kuzma
00050000-5595-3c20-d780-14712f076ed0	2318	Laporje
00050000-5595-3c20-3158-6579c30a792b	3270	Laško
00050000-5595-3c20-8589-e101e0c95376	1219	Laze v Tuhinju
00050000-5595-3c20-d378-3ad135d76c36	2230	Lenart v Slovenskih goricah
00050000-5595-3c20-c03f-639ffc13f955	9220	Lendava/Lendva
00050000-5595-3c20-a8bc-98940bb4990a	4248	Lesce
00050000-5595-3c20-6b95-3f2852144f67	3261	Lesično
00050000-5595-3c20-3d77-d573e51d7414	8273	Leskovec pri Krškem
00050000-5595-3c20-c7dd-28682187261f	2372	Libeliče
00050000-5595-3c20-c1f5-345fd57a258d	2341	Limbuš
00050000-5595-3c20-d46e-cbd3f96e6312	1270	Litija
00050000-5595-3c20-c344-6a021efa9103	3202	Ljubečna
00050000-5595-3c20-5f08-e551a15352ef	1000	Ljubljana 
00050000-5595-3c20-a2ac-8aac26db2669	1001	Ljubljana - poštni predali
00050000-5595-3c20-65cf-93911eb46609	1231	Ljubljana - Črnuče
00050000-5595-3c20-2ac3-3e2afab91078	1261	Ljubljana - Dobrunje
00050000-5595-3c20-77ec-973c168069be	1260	Ljubljana - Polje
00050000-5595-3c20-72be-a3a17cf2dcac	1210	Ljubljana - Šentvid
00050000-5595-3c20-e953-0cd112e18fc3	1211	Ljubljana - Šmartno
00050000-5595-3c20-9206-96e32e9690f2	3333	Ljubno ob Savinji
00050000-5595-3c20-f7c5-5dd53b0d9b73	9240	Ljutomer
00050000-5595-3c20-3d23-3a7983b37ade	3215	Loče
00050000-5595-3c20-d6de-d761c43b0208	5231	Log pod Mangartom
00050000-5595-3c20-a3e1-bd79c22e623b	1358	Log pri Brezovici
00050000-5595-3c20-7994-c936f7221c39	1370	Logatec
00050000-5595-3c20-f48d-70ea1e4bcf41	1371	Logatec
00050000-5595-3c20-b3bd-a4675d19df88	1434	Loka pri Zidanem Mostu
00050000-5595-3c20-a6bb-11b660278caf	3223	Loka pri Žusmu
00050000-5595-3c20-0687-e9f278713c6d	6219	Lokev
00050000-5595-3c20-ae20-540017b26748	1318	Loški Potok
00050000-5595-3c20-c8d5-b49cbfa08240	2324	Lovrenc na Dravskem polju
00050000-5595-3c20-65e9-3a9f559827c6	2344	Lovrenc na Pohorju
00050000-5595-3c20-dc9b-b46ae70c84a7	3334	Luče
00050000-5595-3c20-a66a-25386988980a	1225	Lukovica
00050000-5595-3c20-5952-437eea604a2d	9202	Mačkovci
00050000-5595-3c20-bcef-249c24133ebe	2322	Majšperk
00050000-5595-3c20-b719-f9f2b7ae54da	2321	Makole
00050000-5595-3c20-06d1-2789d02d5c59	9243	Mala Nedelja
00050000-5595-3c20-abfb-7d709ca350b5	2229	Malečnik
00050000-5595-3c20-a2b9-d1f4489e5242	6273	Marezige
00050000-5595-3c20-8c70-bc28b5126122	2000	Maribor 
00050000-5595-3c20-4afe-185341c49eba	2001	Maribor - poštni predali
00050000-5595-3c20-da8d-31c74200674f	2206	Marjeta na Dravskem polju
00050000-5595-3c20-8011-9ed753740c69	2281	Markovci
00050000-5595-3c20-76a4-87e74d5a49f6	9221	Martjanci
00050000-5595-3c20-5231-3b3931f3f3ff	6242	Materija
00050000-5595-3c20-783a-817c2d36ab79	4211	Mavčiče
00050000-5595-3c20-f3ca-1a897b7cce9c	1215	Medvode
00050000-5595-3c20-f03a-7617adca0589	1234	Mengeš
00050000-5595-3c20-681b-761d8da39f90	8330	Metlika
00050000-5595-3c20-0492-03983619a74c	2392	Mežica
00050000-5595-3c20-d0f5-f6e66b058cd0	2204	Miklavž na Dravskem polju
00050000-5595-3c20-7286-24005836efed	2275	Miklavž pri Ormožu
00050000-5595-3c20-cfdd-8462627262ff	5291	Miren
00050000-5595-3c20-06fe-7c5b916604fb	8233	Mirna
00050000-5595-3c20-62ac-caa747410fa3	8216	Mirna Peč
00050000-5595-3c20-a981-1185a5df9aa2	2382	Mislinja
00050000-5595-3c20-2135-01bc436a5830	4281	Mojstrana
00050000-5595-3c20-7ea5-1df3555ad6d3	8230	Mokronog
00050000-5595-3c20-bbcb-2b8c0f3a48ea	1251	Moravče
00050000-5595-3c20-d0a5-52ef9d9cde74	9226	Moravske Toplice
00050000-5595-3c20-96ea-87716f861399	5216	Most na Soči
00050000-5595-3c20-8fd3-9497920b1bcc	1221	Motnik
00050000-5595-3c20-16d3-67dbc1d8ee91	3330	Mozirje
00050000-5595-3c20-d186-86d5a6616896	9000	Murska Sobota 
00050000-5595-3c20-56ae-b110b4683012	9001	Murska Sobota - poštni predali
00050000-5595-3c20-8d74-7d3da9157565	2366	Muta
00050000-5595-3c20-a1e5-3efa744ec800	4202	Naklo
00050000-5595-3c20-0127-d41f790d553a	3331	Nazarje
00050000-5595-3c20-77a5-1022ec9e64af	1357	Notranje Gorice
00050000-5595-3c20-f7df-db346af17e63	3203	Nova Cerkev
00050000-5595-3c20-e046-e108de5ab109	5000	Nova Gorica 
00050000-5595-3c20-e74e-81ebd0cd315e	5001	Nova Gorica - poštni predali
00050000-5595-3c20-2e7f-085774965277	1385	Nova vas
00050000-5595-3c20-c005-f3cdee7367c0	8000	Novo mesto
00050000-5595-3c20-b842-e92637e7e4fd	8001	Novo mesto - poštni predali
00050000-5595-3c20-38de-8d74e21212d8	6243	Obrov
00050000-5595-3c20-14b1-e0cd4ff667ff	9233	Odranci
00050000-5595-3c20-342f-b5b5bdcd0dc7	2317	Oplotnica
00050000-5595-3c20-e459-46d1ae18070f	2312	Orehova vas
00050000-5595-3c20-4225-9ab6474148d6	2270	Ormož
00050000-5595-3c20-4f7e-de841ae647a2	1316	Ortnek
00050000-5595-3c20-5b65-e6e298747b15	1337	Osilnica
00050000-5595-3c20-af82-19dec4a499da	8222	Otočec
00050000-5595-3c20-7505-fb4c5bcbd9ee	2361	Ožbalt
00050000-5595-3c20-da8d-a429d257a8fa	2231	Pernica
00050000-5595-3c20-6895-0b855685d0ca	2211	Pesnica pri Mariboru
00050000-5595-3c20-4a7f-3402523fabf2	9203	Petrovci
00050000-5595-3c20-2848-26feda667a79	3301	Petrovče
00050000-5595-3c20-1600-2ca822bf4eb4	6330	Piran/Pirano
00050000-5595-3c20-73de-c1ff48d129e8	8255	Pišece
00050000-5595-3c20-389c-3826b97610d6	6257	Pivka
00050000-5595-3c20-d757-8fd38f7eab03	6232	Planina
00050000-5595-3c20-6054-49eb16bd28f8	3225	Planina pri Sevnici
00050000-5595-3c20-b9e8-4e90cb124c26	6276	Pobegi
00050000-5595-3c20-18e5-2a548256c7d5	8312	Podbočje
00050000-5595-3c20-ee1a-5c534fab1a18	5243	Podbrdo
00050000-5595-3c20-6263-f4f32213366b	3254	Podčetrtek
00050000-5595-3c20-3676-de53de9ad0a5	2273	Podgorci
00050000-5595-3c20-07cc-68d678d7bd0d	6216	Podgorje
00050000-5595-3c20-b73e-bbf0a728c45b	2381	Podgorje pri Slovenj Gradcu
00050000-5595-3c20-11f9-b8be13763c37	6244	Podgrad
00050000-5595-3c20-9a5b-0fe6ff312985	1414	Podkum
00050000-5595-3c20-0795-487cfa9fb17d	2286	Podlehnik
00050000-5595-3c20-8f53-f0edb85a49fc	5272	Podnanos
00050000-5595-3c20-b36a-84a1b4aa8dd2	4244	Podnart
00050000-5595-3c20-2048-179ce09d2939	3241	Podplat
00050000-5595-3c20-8310-e59161f8aa94	3257	Podsreda
00050000-5595-3c20-5f41-6528a85502a3	2363	Podvelka
00050000-5595-3c20-785d-259a57cf8bd8	2208	Pohorje
00050000-5595-3c20-ed6c-967ec46d74ad	2257	Polenšak
00050000-5595-3c20-ba54-c0b0633da411	1355	Polhov Gradec
00050000-5595-3c20-89f0-6bc03d60687d	4223	Poljane nad Škofjo Loko
00050000-5595-3c20-8cfe-03bf89b2a2db	2319	Poljčane
00050000-5595-3c20-8bf6-1778d2ff025a	1272	Polšnik
00050000-5595-3c20-e30e-3761d65a20c1	3313	Polzela
00050000-5595-3c20-93bc-f4a71d1939d5	3232	Ponikva
00050000-5595-3c20-891c-fe9d5ae06768	6320	Portorož/Portorose
00050000-5595-3c20-e6cc-777376490a60	6230	Postojna
00050000-5595-3c20-f27c-7382b41c7dd5	2331	Pragersko
00050000-5595-3c20-5195-4b00b519cdb6	3312	Prebold
00050000-5595-3c20-dc4b-617cc257eed6	4205	Preddvor
00050000-5595-3c20-16c3-82687e17798d	6255	Prem
00050000-5595-3c20-f020-29386a7e7939	1352	Preserje
00050000-5595-3c20-38b3-486044594c58	6258	Prestranek
00050000-5595-3c20-c605-f3d05d21d1e4	2391	Prevalje
00050000-5595-3c20-c6bc-74927959ad75	3262	Prevorje
00050000-5595-3c20-b53a-fc8cf85395a4	1276	Primskovo 
00050000-5595-3c20-f973-8dc1cdf43fba	3253	Pristava pri Mestinju
00050000-5595-3c20-8a50-0f212208c0e6	9207	Prosenjakovci/Partosfalva
00050000-5595-3c20-1c43-bd920f7a2f36	5297	Prvačina
00050000-5595-3c20-406e-0d0b4a539f44	2250	Ptuj
00050000-5595-3c20-88e8-6b580decbe79	2323	Ptujska Gora
00050000-5595-3c20-63b0-2f7c49227dc3	9201	Puconci
00050000-5595-3c20-4cdd-6d35ac5e362d	2327	Rače
00050000-5595-3c20-8ebb-034e33c97da1	1433	Radeče
00050000-5595-3c20-471d-1ce004e374c9	9252	Radenci
00050000-5595-3c20-f920-0228d92694e9	2360	Radlje ob Dravi
00050000-5595-3c20-1840-3adbb8b8db66	1235	Radomlje
00050000-5595-3c20-7375-2eb12f4c4244	4240	Radovljica
00050000-5595-3c20-1453-166e992abbc2	8274	Raka
00050000-5595-3c20-3401-357cbed67a90	1381	Rakek
00050000-5595-3c20-a332-746626e13f0f	4283	Rateče - Planica
00050000-5595-3c20-5276-5035b9afa121	2390	Ravne na Koroškem
00050000-5595-3c20-aa0d-66457a8c1d44	9246	Razkrižje
00050000-5595-3c20-c9f9-6bf320978b0d	3332	Rečica ob Savinji
00050000-5595-3c20-98e7-c8ec2b156c6b	5292	Renče
00050000-5595-3c20-0304-beb2d12409ad	1310	Ribnica
00050000-5595-3c20-9458-e8c1dc1c47f7	2364	Ribnica na Pohorju
00050000-5595-3c20-6d1a-f9946974ccac	3272	Rimske Toplice
00050000-5595-3c20-6a52-101cc765c9f5	1314	Rob
00050000-5595-3c20-67a5-404203f2a9a4	5215	Ročinj
00050000-5595-3c20-6ba5-e3e2bbbcf9a4	3250	Rogaška Slatina
00050000-5595-3c20-dd6f-e5749b17373b	9262	Rogašovci
00050000-5595-3c20-db98-06d9ba2ce242	3252	Rogatec
00050000-5595-3c20-12bf-e47382cc9e31	1373	Rovte
00050000-5595-3c20-d3f9-24e2c3918763	2342	Ruše
00050000-5595-3c20-c8df-048eccafcedb	1282	Sava
00050000-5595-3c20-5d52-a25b29e6f4de	6333	Sečovlje/Sicciole
00050000-5595-3c20-53aa-cd34eee36a35	4227	Selca
00050000-5595-3c20-834b-b63605fd00ef	2352	Selnica ob Dravi
00050000-5595-3c20-bfa0-759c0033b6ff	8333	Semič
00050000-5595-3c20-7661-72d5ebb624b7	8281	Senovo
00050000-5595-3c20-90f1-e02a184e7496	6224	Senožeče
00050000-5595-3c20-06fb-bf48b4613afb	8290	Sevnica
00050000-5595-3c20-e7d9-a467c91790dd	6210	Sežana
00050000-5595-3c20-883a-2161876264b1	2214	Sladki Vrh
00050000-5595-3c20-5b58-8d01e12ec5b0	5283	Slap ob Idrijci
00050000-5595-3c20-b83d-18685a0bdc83	2380	Slovenj Gradec
00050000-5595-3c20-441f-a5a3855d8466	2310	Slovenska Bistrica
00050000-5595-3c20-d200-bb7e56ff23d0	3210	Slovenske Konjice
00050000-5595-3c20-1dd4-266a25738a16	1216	Smlednik
00050000-5595-3c20-4299-5c2464492586	5232	Soča
00050000-5595-3c20-36e2-26b965cf0372	1317	Sodražica
00050000-5595-3c20-b893-e87e9512725c	3335	Solčava
00050000-5595-3c20-c9fd-b3aa8007e6b4	5250	Solkan
00050000-5595-3c20-f932-a2470a6c576b	4229	Sorica
00050000-5595-3c20-2862-46c4b61126a0	4225	Sovodenj
00050000-5595-3c20-8694-d707ebc07f63	5281	Spodnja Idrija
00050000-5595-3c20-0386-40a044809711	2241	Spodnji Duplek
00050000-5595-3c20-70bc-2629b3fb60cd	9245	Spodnji Ivanjci
00050000-5595-3c20-1a91-2642d82b6a40	2277	Središče ob Dravi
00050000-5595-3c20-968d-3fca90ae9bca	4267	Srednja vas v Bohinju
00050000-5595-3c20-47b5-ece9e1fcfff5	8256	Sromlje 
00050000-5595-3c20-3584-445634a5ed6e	5224	Srpenica
00050000-5595-3c20-152d-d5d84e7056f9	1242	Stahovica
00050000-5595-3c20-8720-851d54a40f7d	1332	Stara Cerkev
00050000-5595-3c20-45a2-998ad4a35c9b	8342	Stari trg ob Kolpi
00050000-5595-3c20-0a92-a8023d23d720	1386	Stari trg pri Ložu
00050000-5595-3c20-d05a-e6a00e4106b6	2205	Starše
00050000-5595-3c20-f462-875f9ea6be45	2289	Stoperce
00050000-5595-3c20-556b-2093f4bfac89	8322	Stopiče
00050000-5595-3c20-c54e-c5e10d0d9837	3206	Stranice
00050000-5595-3c20-0e84-935b8b88163a	8351	Straža
00050000-5595-3c20-b63a-02ca0aabc5c8	1313	Struge
00050000-5595-3c20-e559-1a4b1c34ea1f	8293	Studenec
00050000-5595-3c20-ed02-4b031d441a56	8331	Suhor
00050000-5595-3c20-d83d-f4c432feb626	2233	Sv. Ana v Slovenskih goricah
00050000-5595-3c20-fb47-a6b8f9bb78c7	2235	Sv. Trojica v Slovenskih goricah
00050000-5595-3c20-12ad-90289a4c0dd8	2353	Sveti Duh na Ostrem Vrhu
00050000-5595-3c20-87cf-9b407a75a860	9244	Sveti Jurij ob Ščavnici
00050000-5595-3c20-8563-de1d6bac2613	3264	Sveti Štefan
00050000-5595-3c20-2ef6-ce98d0e65cf5	2258	Sveti Tomaž
00050000-5595-3c20-3c50-f734e6569d5a	9204	Šalovci
00050000-5595-3c20-aa74-e86cc5f03e22	5261	Šempas
00050000-5595-3c20-a57a-eefc99115c0e	5290	Šempeter pri Gorici
00050000-5595-3c20-9133-03fcb672b506	3311	Šempeter v Savinjski dolini
00050000-5595-3c20-023d-0a28b7799016	4208	Šenčur
00050000-5595-3c20-b2c6-82332233779b	2212	Šentilj v Slovenskih goricah
00050000-5595-3c20-a629-4f968a619c38	8297	Šentjanž
00050000-5595-3c20-30d5-a2cb48ddce85	2373	Šentjanž pri Dravogradu
00050000-5595-3c20-d98c-29941a410f0d	8310	Šentjernej
00050000-5595-3c20-5df0-4881dfe3b48c	3230	Šentjur
00050000-5595-3c20-b4d0-5cd0252bee8c	3271	Šentrupert
00050000-5595-3c20-6610-f0ff4d043f4f	8232	Šentrupert
00050000-5595-3c20-65b5-3b9f17fb66ef	1296	Šentvid pri Stični
00050000-5595-3c20-eade-5c354e8d496a	8275	Škocjan
00050000-5595-3c20-0616-4bef84e80e5f	6281	Škofije
00050000-5595-3c20-1400-02c397695768	4220	Škofja Loka
00050000-5595-3c20-8b16-2536e14123ec	3211	Škofja vas
00050000-5595-3c20-6b01-dc95917cd495	1291	Škofljica
00050000-5595-3c20-50a7-e4a11a8be30b	6274	Šmarje
00050000-5595-3c20-5019-ca7c08f80a82	1293	Šmarje - Sap
00050000-5595-3c20-5cba-e729e3a59aca	3240	Šmarje pri Jelšah
00050000-5595-3c20-d787-c87afc80980f	8220	Šmarješke Toplice
00050000-5595-3c20-47cc-763a5d99918d	2315	Šmartno na Pohorju
00050000-5595-3c20-70e8-eeb951655a28	3341	Šmartno ob Dreti
00050000-5595-3c20-b5e7-ad72b6333299	3327	Šmartno ob Paki
00050000-5595-3c20-e148-7569c116d900	1275	Šmartno pri Litiji
00050000-5595-3c20-b729-d5d19e9e3c4e	2383	Šmartno pri Slovenj Gradcu
00050000-5595-3c20-7995-e4c4855efac2	3201	Šmartno v Rožni dolini
00050000-5595-3c20-62e0-e4d0378ec938	3325	Šoštanj
00050000-5595-3c20-4443-14e64c244608	6222	Štanjel
00050000-5595-3c20-0b2d-0e0626c96ead	3220	Štore
00050000-5595-3c20-41f0-57492466da13	3304	Tabor
00050000-5595-3c20-644b-aba7b786b74b	3221	Teharje
00050000-5595-3c20-3a57-a80e2fb41cf0	9251	Tišina
00050000-5595-3c20-492f-fc78ee0379e1	5220	Tolmin
00050000-5595-3c20-a03e-2bc2d9d6105e	3326	Topolšica
00050000-5595-3c20-2cb6-af2b4c6158d2	2371	Trbonje
00050000-5595-3c20-6e9f-1f3403c4d3b2	1420	Trbovlje
00050000-5595-3c20-553a-fe6e45ccdca2	8231	Trebelno 
00050000-5595-3c20-3db8-777b11013b70	8210	Trebnje
00050000-5595-3c20-87c9-5339ba4bae93	5252	Trnovo pri Gorici
00050000-5595-3c20-430e-8d83cfada266	2254	Trnovska vas
00050000-5595-3c20-2e33-cc8c562fc15b	1222	Trojane
00050000-5595-3c20-7de5-d95a198f7af3	1236	Trzin
00050000-5595-3c20-7a0c-1c3aa142c847	4290	Tržič
00050000-5595-3c20-5630-83ab80fa4318	8295	Tržišče
00050000-5595-3c20-4940-9dc8bc0e21d8	1311	Turjak
00050000-5595-3c20-a672-5e116905d7e6	9224	Turnišče
00050000-5595-3c20-c625-48dce2de6a70	8323	Uršna sela
00050000-5595-3c20-a74c-33788ef1ebb6	1252	Vače
00050000-5595-3c20-975a-fb8630f74446	3320	Velenje 
00050000-5595-3c20-3cb9-2cd6b9ecfff3	3322	Velenje - poštni predali
00050000-5595-3c20-9a33-0fa7baf7da9a	8212	Velika Loka
00050000-5595-3c20-fbdd-abe73c873624	2274	Velika Nedelja
00050000-5595-3c20-d210-a3effd59d041	9225	Velika Polana
00050000-5595-3c20-263d-97dce31acb6d	1315	Velike Lašče
00050000-5595-3c20-064a-fc0b40087cd4	8213	Veliki Gaber
00050000-5595-3c20-1eee-f5755fa513f2	9241	Veržej
00050000-5595-3c20-ee76-defd50f09ed8	1312	Videm - Dobrepolje
00050000-5595-3c20-22de-3e4b24c67f31	2284	Videm pri Ptuju
00050000-5595-3c20-bda0-2b3069637253	8344	Vinica
00050000-5595-3c20-63ce-bab405ca2a3c	5271	Vipava
00050000-5595-3c20-4e8f-69452825e15e	4212	Visoko
00050000-5595-3c20-b1d2-88023860797d	1294	Višnja Gora
00050000-5595-3c20-f6f3-cf0138d7e581	3205	Vitanje
00050000-5595-3c20-97fe-5fbf048aeda4	2255	Vitomarci
00050000-5595-3c20-dc89-27e360306388	1217	Vodice
00050000-5595-3c20-c0f5-6c68d618ff74	3212	Vojnik\t
00050000-5595-3c20-7b3d-1f95dbce4909	5293	Volčja Draga
00050000-5595-3c20-18ea-96b7086a1e55	2232	Voličina
00050000-5595-3c20-cd3d-b0d90ea34da3	3305	Vransko
00050000-5595-3c20-f38a-f6a1d064bfb8	6217	Vremski Britof
00050000-5595-3c21-3644-8df715c54350	1360	Vrhnika
00050000-5595-3c21-5a93-201ffea57451	2365	Vuhred
00050000-5595-3c21-2490-93a5f79819bb	2367	Vuzenica
00050000-5595-3c21-d05a-e27f42d465a5	8292	Zabukovje 
00050000-5595-3c21-eb8d-7f75dde356ae	1410	Zagorje ob Savi
00050000-5595-3c21-2107-07a382807792	1303	Zagradec
00050000-5595-3c21-a7ae-f5f644a276fd	2283	Zavrč
00050000-5595-3c21-8e90-e54fb52961b8	8272	Zdole 
00050000-5595-3c21-b037-d033e4a3b432	4201	Zgornja Besnica
00050000-5595-3c21-5eb2-cf68ba4d8bcb	2242	Zgornja Korena
00050000-5595-3c21-8878-ff29b3034b06	2201	Zgornja Kungota
00050000-5595-3c21-419b-e91108cd1f62	2316	Zgornja Ložnica
00050000-5595-3c21-0b7c-d1f3dbd527f3	2314	Zgornja Polskava
00050000-5595-3c21-7554-d66d69703311	2213	Zgornja Velka
00050000-5595-3c21-4120-e72b139d0317	4247	Zgornje Gorje
00050000-5595-3c21-b217-7582dcbc132a	4206	Zgornje Jezersko
00050000-5595-3c21-9b30-86754da491cf	2285	Zgornji Leskovec
00050000-5595-3c21-2d7e-1576ff742931	1432	Zidani Most
00050000-5595-3c21-eaa9-14d22674cf9d	3214	Zreče
00050000-5595-3c21-8be5-7af53a43ee83	4209	Žabnica
00050000-5595-3c21-e275-cbf5c53ab642	3310	Žalec
00050000-5595-3c21-f8f6-730d9df6f64d	4228	Železniki
00050000-5595-3c21-16be-63edcab85229	2287	Žetale
00050000-5595-3c21-b1e5-7be04ba82b2f	4226	Žiri
00050000-5595-3c21-8c77-8df3d5ab2b1c	4274	Žirovnica
00050000-5595-3c21-a260-f42782348bc6	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8898039)
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
-- TOC entry 2859 (class 0 OID 8897850)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8897928)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8898051)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8898171)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8898220)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5595-3c22-4116-f7efb91cab51	00080000-5595-3c22-a1a8-706a6124d83a	0900	AK
00190000-5595-3c22-82db-a80b21cdfef0	00080000-5595-3c22-aa64-5d5289db3eb8	0987	A
00190000-5595-3c22-3cb0-7fba5aee2361	00080000-5595-3c22-0ab8-edf01150a2eb	0989	A
00190000-5595-3c22-17d7-7870c9a0c986	00080000-5595-3c22-b7c8-69c93398de40	0986	A
00190000-5595-3c22-0744-c4c9c39de4a3	00080000-5595-3c22-7e94-d816c70d74d1	0984	A
00190000-5595-3c22-4ae3-169a768f7063	00080000-5595-3c22-2bcc-45f274414795	0983	A
00190000-5595-3c22-94f7-c027718f22ba	00080000-5595-3c22-cb6d-6b5e81d7b3f1	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8898354)
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
-- TOC entry 2883 (class 0 OID 8898080)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5595-3c22-2d3c-3c64a478a2d2	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5595-3c22-6f5e-09bb7fc7a93e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5595-3c22-7f11-91266b6af106	0003	Kazinska	t	84	Kazinska dvorana
00220000-5595-3c22-9de3-4cab285802c0	0004	Mali oder	t	24	Mali oder 
00220000-5595-3c22-c6be-78b2f2c17aa5	0005	Komorni oder	t	15	Komorni oder
00220000-5595-3c22-9c2b-66d4556da939	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5595-3c22-617b-94dbdffe036e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8898024)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8898014)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8898209)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8898148)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8897722)
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
-- TOC entry 2884 (class 0 OID 8898090)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8897760)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5595-3c20-bac9-d8ddb5d996a5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5595-3c20-b4cb-56eec29004cf	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5595-3c20-57ba-ce08b28be537	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5595-3c20-40c2-db7e7e88b85a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5595-3c20-1a9a-8a19179273db	planer	Planer dogodkov v koledarju	t
00020000-5595-3c20-2a34-df862879376c	kadrovska	Kadrovska služba	t
00020000-5595-3c20-6292-5a82a4fb1a15	arhivar	Ažuriranje arhivalij	t
00020000-5595-3c20-078e-aeb4c968318f	igralec	Igralec	t
00020000-5595-3c20-dac7-711ba8c223fe	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5595-3c22-71bf-7d99047327f4	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8897744)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5595-3c20-f42a-755cdeb85013	00020000-5595-3c20-57ba-ce08b28be537
00010000-5595-3c20-6326-fb2e1307c8a3	00020000-5595-3c20-57ba-ce08b28be537
00010000-5595-3c22-27dd-be5a14548fac	00020000-5595-3c22-71bf-7d99047327f4
\.


--
-- TOC entry 2886 (class 0 OID 8898104)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8898045)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8897995)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8898404)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5595-3c21-6c9e-794d50382a19	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5595-3c21-729b-ee6dd96416c4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5595-3c21-04db-f135b906ee20	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5595-3c21-84ba-123bf8c72d5f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5595-3c21-350c-c2ff4b6360c2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8898396)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5595-3c21-a394-029d7232520c	00230000-5595-3c21-84ba-123bf8c72d5f	popa
00240000-5595-3c21-58e1-11be0ad4885c	00230000-5595-3c21-84ba-123bf8c72d5f	oseba
00240000-5595-3c21-95da-028aa0cff3e5	00230000-5595-3c21-729b-ee6dd96416c4	prostor
00240000-5595-3c21-4030-06c739b1656a	00230000-5595-3c21-84ba-123bf8c72d5f	besedilo
00240000-5595-3c21-d0bf-e258f0ad1a52	00230000-5595-3c21-84ba-123bf8c72d5f	uprizoritev
00240000-5595-3c21-aa51-635c5bcdc4f1	00230000-5595-3c21-84ba-123bf8c72d5f	funkcija
00240000-5595-3c21-3b88-c4e3c613c98f	00230000-5595-3c21-84ba-123bf8c72d5f	tipfunkcije
00240000-5595-3c21-2c80-7b8d1104eebd	00230000-5595-3c21-84ba-123bf8c72d5f	alternacija
00240000-5595-3c21-86b0-845eb760ff0c	00230000-5595-3c21-6c9e-794d50382a19	pogodba
00240000-5595-3c21-9d98-922f13c400ba	00230000-5595-3c21-84ba-123bf8c72d5f	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8898391)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8898158)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5595-3c22-791b-e295f7a2b985	000e0000-5595-3c22-a68a-45ac31f80de3	00080000-5595-3c22-282f-47a1f1a0da80	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5595-3c22-6ce9-b00428268fd4	000e0000-5595-3c22-a68a-45ac31f80de3	00080000-5595-3c22-282f-47a1f1a0da80	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5595-3c22-567b-a62fd8759fef	000e0000-5595-3c22-a68a-45ac31f80de3	00080000-5595-3c22-c434-1785c217f81e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8897822)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8898001)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5595-3c22-0954-8b11e4af57d6	00180000-5595-3c22-f382-ce4d04f9be79	000c0000-5595-3c22-b351-d2c363d901e5	00090000-5595-3c22-08b5-faa0ec801943	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-3c22-b042-1561c802934d	00180000-5595-3c22-f382-ce4d04f9be79	000c0000-5595-3c22-0a5b-7a09e3755a00	00090000-5595-3c22-3a01-051e4539866f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-3c22-8492-c2f8340d2781	00180000-5595-3c22-f382-ce4d04f9be79	000c0000-5595-3c22-3449-0e8783f5696a	00090000-5595-3c22-38af-257288473dd2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-3c22-e477-30fbee8a07c7	00180000-5595-3c22-f382-ce4d04f9be79	000c0000-5595-3c22-d7ad-e704e1bfda1f	00090000-5595-3c22-ccb7-0a56fd99fd14	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-3c22-bd60-3ff0a0d90ab8	00180000-5595-3c22-f382-ce4d04f9be79	000c0000-5595-3c22-7ffe-471159f9b592	00090000-5595-3c22-f0b7-22a20a54b751	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-3c22-0ae7-115916ca655a	00180000-5595-3c22-36ab-6d3747f466a2	\N	00090000-5595-3c22-f0b7-22a20a54b751	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8898198)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5595-3c21-7b00-05c37c5f4071	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5595-3c21-f8f4-1d7359129a24	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5595-3c21-fbc6-6e93ef0960fd	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5595-3c21-8b4a-671b926f3958	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5595-3c21-848e-878349836f89	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5595-3c21-117c-9f241f701fc5	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5595-3c21-1fe4-8be87aff688e	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5595-3c21-ab26-0a127084741a	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5595-3c21-b0cd-cc716f08d4a1	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5595-3c21-a1b0-44143e074b46	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5595-3c21-e98a-ddb0b7fcf934	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5595-3c21-ae48-c3ef5de7d424	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5595-3c21-6c7d-879299e0bbfa	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5595-3c21-7961-ee0e8acc2359	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5595-3c21-a4d3-91f61a30e10f	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5595-3c21-b84f-a63ff3978a63	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8898373)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5595-3c21-4f23-dc859ceadecb	01	Velika predstava	f	1.00	1.00
002b0000-5595-3c21-89ad-cb5a8bcc4e11	02	Mala predstava	f	0.50	0.50
002b0000-5595-3c21-2e07-3c4b55c5a2ea	03	Mala koprodukcija	t	0.40	1.00
002b0000-5595-3c21-1c00-f0cacce4ea50	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5595-3c21-48b6-d4f8ac60d44c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8897885)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8897731)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5595-3c20-6326-fb2e1307c8a3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSN.PHyQ2O8zhbUegOtE0B3mesb7oWBq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5595-3c22-770e-820495248faf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5595-3c22-1f94-caef6e93f2ad	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5595-3c22-3a72-628297dc4f1d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5595-3c22-d0c9-c2289e098d6d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5595-3c22-037d-022cac2f734d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5595-3c22-ebd5-aff92982d434	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5595-3c22-ff13-a2925e465d65	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5595-3c22-da64-01ec9402d610	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5595-3c22-cd83-31d04673d342	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5595-3c22-27dd-be5a14548fac	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5595-3c20-f42a-755cdeb85013	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8898255)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5595-3c22-7422-2bd201e81e7b	00160000-5595-3c22-37a1-c4f32436c966	00150000-5595-3c21-d54a-24b4cce7102f	00140000-5595-3c1f-f512-87db803ae553	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5595-3c22-c6be-78b2f2c17aa5
000e0000-5595-3c22-a68a-45ac31f80de3	00160000-5595-3c22-e206-9de593b622a3	00150000-5595-3c21-d4bb-0c937f304d8c	00140000-5595-3c1f-a62c-e7d0bc192aa2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5595-3c22-9c2b-66d4556da939
000e0000-5595-3c22-60d4-6b9fc3c26f36	\N	00150000-5595-3c21-d4bb-0c937f304d8c	00140000-5595-3c1f-a62c-e7d0bc192aa2	00190000-5595-3c22-82db-a80b21cdfef0	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5595-3c22-c6be-78b2f2c17aa5
000e0000-5595-3c22-d088-45de8531843c	\N	00150000-5595-3c21-d4bb-0c937f304d8c	00140000-5595-3c1f-a62c-e7d0bc192aa2	00190000-5595-3c22-82db-a80b21cdfef0	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5595-3c22-c6be-78b2f2c17aa5
000e0000-5595-3c22-7267-f48f11084df2	\N	00150000-5595-3c21-d4bb-0c937f304d8c	00140000-5595-3c1f-a62c-e7d0bc192aa2	00190000-5595-3c22-82db-a80b21cdfef0	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5595-3c22-2d3c-3c64a478a2d2
\.


--
-- TOC entry 2867 (class 0 OID 8897947)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5595-3c22-d0f9-be4ebd9334b7	000e0000-5595-3c22-a68a-45ac31f80de3	1	
00200000-5595-3c22-2e8e-895f0267d964	000e0000-5595-3c22-a68a-45ac31f80de3	2	
\.


--
-- TOC entry 2882 (class 0 OID 8898072)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8898141)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8897979)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8898245)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5595-3c1f-f512-87db803ae553	01	Drama	drama (SURS 01)
00140000-5595-3c1f-d7d2-d07c264cf5c9	02	Opera	opera (SURS 02)
00140000-5595-3c1f-821d-0beefa7a9a7d	03	Balet	balet (SURS 03)
00140000-5595-3c1f-108b-6d5ce4826235	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5595-3c1f-796f-d9723d93e146	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5595-3c1f-a62c-e7d0bc192aa2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5595-3c1f-8d7d-5d20353c2eb3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8898131)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5595-3c21-43e2-63d30b249a2f	01	Opera	opera
00150000-5595-3c21-5c28-58cb465c3baa	02	Opereta	opereta
00150000-5595-3c21-a797-39545ebe4e60	03	Balet	balet
00150000-5595-3c21-769a-5e74e7bc0955	04	Plesne prireditve	plesne prireditve
00150000-5595-3c21-d050-16cf352d8980	05	Lutkovno gledališče	lutkovno gledališče
00150000-5595-3c21-4508-bd8dd0d204ed	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5595-3c21-1e55-c0cf58fb341d	07	Biografska drama	biografska drama
00150000-5595-3c21-d54a-24b4cce7102f	08	Komedija	komedija
00150000-5595-3c21-8fe3-f8926f9d681f	09	Črna komedija	črna komedija
00150000-5595-3c21-69d8-04e67f92c703	10	E-igra	E-igra
00150000-5595-3c21-d4bb-0c937f304d8c	11	Kriminalka	kriminalka
00150000-5595-3c21-1c2f-37a6674b92e3	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8897785)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8898302)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8898292)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8898197)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8897969)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8897994)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8898389)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8897911)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8898349)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8898127)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8897945)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8897988)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8897925)
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
-- TOC entry 2533 (class 2606 OID 8898037)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8898064)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8897883)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8897794)
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
-- TOC entry 2448 (class 2606 OID 8897818)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8897774)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8897759)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8898070)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8898103)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8898240)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8897847)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8897871)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8898043)
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
-- TOC entry 2463 (class 2606 OID 8897861)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8897932)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8898055)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8898179)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8898225)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8898371)
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
-- TOC entry 2553 (class 2606 OID 8898087)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8898028)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8898019)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8898219)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8898155)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8897730)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8898094)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8897748)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8897768)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8898112)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8898050)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8898000)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8898413)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8898401)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8898395)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8898168)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8897827)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8898010)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8898208)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8898383)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8897896)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8897743)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8898271)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8897954)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8898078)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8898146)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8897983)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8898253)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8898139)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8897976)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8898169)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8898170)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8897849)
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
-- TOC entry 2546 (class 1259 OID 8898071)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8898057)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8898056)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8897955)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8898128)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8898130)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8898129)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8897927)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8897926)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8898242)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8898243)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8898244)
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
-- TOC entry 2608 (class 1259 OID 8898276)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8898273)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8898277)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8898275)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8898274)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8897898)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8897897)
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
-- TOC entry 2446 (class 1259 OID 8897821)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8898095)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8897989)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8897775)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8897776)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8898115)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8898114)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8898113)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8897933)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8897935)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8897934)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8898403)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8898023)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8898021)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8898020)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8898022)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8897749)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8897750)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8898079)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8898044)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8898156)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8898157)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8898353)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8898350)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8898351)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8898352)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8897863)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8897862)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8897864)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8898180)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8898181)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8898306)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8898307)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8898304)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8898305)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8898147)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8898032)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8898031)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8898029)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8898030)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8898294)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8898293)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8898372)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8897946)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8898390)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8897796)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8897795)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8897828)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8897829)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8898013)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8898012)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8898011)
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
-- TOC entry 2498 (class 1259 OID 8897978)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8897974)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8897971)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8897972)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8897970)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8897975)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8897973)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8897848)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8897912)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8897914)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8897913)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8897915)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8898038)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8898241)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8898272)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8897819)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8897820)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8898140)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8898414)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8897884)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8898402)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8898089)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8898088)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8898303)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8897872)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8898254)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8898226)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8898227)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8897769)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8897977)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8898550)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8898535)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8898540)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8898560)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8898530)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8898555)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8898545)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8898705)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8898710)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8898465)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8898645)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8898640)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8898635)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8898525)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8898675)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8898685)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8898680)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8898500)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8898495)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8898625)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8898730)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8898735)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8898740)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8898760)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8898745)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8898765)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8898755)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8898750)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8898490)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8898485)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8898450)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8898445)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8898655)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8898565)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8898425)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8898430)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8898670)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8898665)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8898660)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8898505)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8898515)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8898510)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8898830)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8898600)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8898590)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8898585)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8898595)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8898415)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8898420)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8898650)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8898630)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8898695)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8898700)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8898815)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8898800)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8898805)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8898810)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8898475)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8898470)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8898480)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8898715)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8898720)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8898790)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8898795)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8898780)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8898785)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8898690)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8898620)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8898615)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8898605)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8898610)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8898775)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8898770)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8898820)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8898520)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8898725)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8898825)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8898440)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8898435)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8898455)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8898460)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8898580)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8898575)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8898570)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-02 15:26:59 CEST

--
-- PostgreSQL database dump complete
--

