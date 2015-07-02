--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-02 10:56:35 CEST

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
-- TOC entry 183 (class 1259 OID 8816166)
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
-- TOC entry 230 (class 1259 OID 8816684)
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
-- TOC entry 229 (class 1259 OID 8816667)
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
-- TOC entry 222 (class 1259 OID 8816571)
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
-- TOC entry 197 (class 1259 OID 8816345)
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
-- TOC entry 200 (class 1259 OID 8816379)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8816773)
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
-- TOC entry 192 (class 1259 OID 8816288)
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
-- TOC entry 231 (class 1259 OID 8816697)
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
-- TOC entry 216 (class 1259 OID 8816505)
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
-- TOC entry 195 (class 1259 OID 8816325)
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
-- TOC entry 199 (class 1259 OID 8816373)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8816305)
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
-- TOC entry 205 (class 1259 OID 8816422)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8816447)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8816262)
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
-- TOC entry 184 (class 1259 OID 8816175)
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
-- TOC entry 185 (class 1259 OID 8816186)
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
-- TOC entry 180 (class 1259 OID 8816140)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8816159)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8816454)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8816485)
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
-- TOC entry 226 (class 1259 OID 8816617)
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
-- TOC entry 187 (class 1259 OID 8816219)
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
-- TOC entry 189 (class 1259 OID 8816254)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8816428)
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
-- TOC entry 188 (class 1259 OID 8816239)
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
-- TOC entry 194 (class 1259 OID 8816317)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8816440)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8816560)
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
-- TOC entry 225 (class 1259 OID 8816609)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8816743)
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
-- TOC entry 212 (class 1259 OID 8816469)
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
-- TOC entry 204 (class 1259 OID 8816413)
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
-- TOC entry 203 (class 1259 OID 8816403)
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
-- TOC entry 224 (class 1259 OID 8816598)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8816537)
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
-- TOC entry 177 (class 1259 OID 8816111)
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
-- TOC entry 176 (class 1259 OID 8816109)
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
-- TOC entry 213 (class 1259 OID 8816479)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8816149)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8816133)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8816493)
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
-- TOC entry 207 (class 1259 OID 8816434)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8816384)
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
-- TOC entry 237 (class 1259 OID 8816793)
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
-- TOC entry 236 (class 1259 OID 8816785)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8816780)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8816547)
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
-- TOC entry 186 (class 1259 OID 8816211)
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
-- TOC entry 202 (class 1259 OID 8816390)
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
-- TOC entry 223 (class 1259 OID 8816587)
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
-- TOC entry 233 (class 1259 OID 8816762)
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
-- TOC entry 191 (class 1259 OID 8816274)
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
-- TOC entry 178 (class 1259 OID 8816120)
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
-- TOC entry 228 (class 1259 OID 8816644)
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
-- TOC entry 196 (class 1259 OID 8816336)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8816461)
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
-- TOC entry 218 (class 1259 OID 8816530)
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
-- TOC entry 198 (class 1259 OID 8816368)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8816634)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8816520)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8816114)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8816166)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8816684)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5594-fcc2-b49f-e9c6a999ff13	000d0000-5594-fcc2-0c47-d534a16570af	\N	00090000-5594-fcc2-8b23-262783c96a77	000b0000-5594-fcc2-3988-49f363781bea	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-fcc2-961d-73328419ecb7	000d0000-5594-fcc2-a6f3-ea2c0db04ae5	\N	00090000-5594-fcc2-cb97-36e07b2f5ae2	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-fcc2-0d33-aa1baf4f0b7b	000d0000-5594-fcc2-1b31-f9b8ddcb287f	\N	00090000-5594-fcc2-b361-f7ef471b2dad	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-fcc2-badd-3908dcb1e5b1	000d0000-5594-fcc2-b0ad-b1e4cc703b27	\N	00090000-5594-fcc2-6046-73f18d9a7da2	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-fcc2-15e5-75223cc9898f	000d0000-5594-fcc2-25c8-4a0c8e3fcef4	\N	00090000-5594-fcc2-c6f4-f970c6fbae87	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-fcc2-0623-c51452bb34a2	000d0000-5594-fcc2-2833-cfa8147cbc99	\N	00090000-5594-fcc2-cb97-36e07b2f5ae2	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8816667)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8816571)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5594-fcc2-d53c-14a9f8d2afd5	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5594-fcc2-1387-856093755a93	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5594-fcc2-d862-51b7f8ec641c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8816345)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5594-fcc2-fda7-403f57ba6b5b	\N	\N	00200000-5594-fcc2-dc7b-eb36a7861ae0	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5594-fcc2-8603-f52a1e372258	\N	\N	00200000-5594-fcc2-4804-b392f104e8b6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5594-fcc2-3b86-63003d374945	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5594-fcc2-b388-08675391a45a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5594-fcc2-ae10-b84083875b19	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8816379)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8816773)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8816288)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5594-fcc0-a6fb-82dec699d5ff	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5594-fcc0-1b85-69fa44cf3f5a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5594-fcc0-8ad7-b0db092da4d9	AL	ALB	008	Albania 	Albanija	\N
00040000-5594-fcc0-5f0e-041da75f0b9e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5594-fcc0-0ab3-83a5a523395d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5594-fcc0-ac97-edf272a67ef4	AD	AND	020	Andorra 	Andora	\N
00040000-5594-fcc0-9957-16dbddd932f4	AO	AGO	024	Angola 	Angola	\N
00040000-5594-fcc0-1a9c-977731960940	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5594-fcc0-9ce7-dcc372d22cbd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5594-fcc0-1cce-2fe0ac3c7868	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5594-fcc0-8118-4c54ec345a0d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5594-fcc0-5238-2b7b5f56eb7f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5594-fcc0-1d0b-055933e644e4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5594-fcc0-2531-f4537454a1b7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5594-fcc0-959f-7027daf627a7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5594-fcc0-3be3-27a92e472d27	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5594-fcc0-3bc0-e670fed64d1a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5594-fcc0-f8f2-b64d97c766ec	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5594-fcc0-a668-cf7bc5ed1bdc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5594-fcc0-e59f-f8e1b9143242	BB	BRB	052	Barbados 	Barbados	\N
00040000-5594-fcc0-3b15-6d5bc83dc220	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5594-fcc0-6805-209df0583216	BE	BEL	056	Belgium 	Belgija	\N
00040000-5594-fcc0-1222-d5c02db8ca6e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5594-fcc0-3b12-718334af2133	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5594-fcc0-826b-027183ec7d30	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5594-fcc0-3d99-9b0f92e7567f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5594-fcc0-7043-ffb1c67d72c0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5594-fcc0-4a21-299896e20924	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5594-fcc0-bdc1-5e266f8ab47a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5594-fcc0-b340-5b8d4d75cbf8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5594-fcc0-f8cf-972be22adc72	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5594-fcc0-9d41-7655a2c9f83a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5594-fcc0-80d7-2df3e83555a4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5594-fcc0-9e79-62673a307dcf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5594-fcc0-5890-950a09bb0b40	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5594-fcc0-f6ed-4f1f38f22e45	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5594-fcc0-625d-add124081871	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5594-fcc0-cfff-5fe652ad5f6b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5594-fcc0-3864-bcd9d87021d9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5594-fcc0-cf02-5a7cb91c55c8	CA	CAN	124	Canada 	Kanada	\N
00040000-5594-fcc0-c367-2476e0e38451	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5594-fcc0-c19e-0377bc85dd5c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5594-fcc0-db0d-5560b1f2eeb4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5594-fcc0-df8d-88bf696c7da4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5594-fcc0-56eb-c363f95a7459	CL	CHL	152	Chile 	Čile	\N
00040000-5594-fcc0-1887-bbac18cb351d	CN	CHN	156	China 	Kitajska	\N
00040000-5594-fcc0-ee28-a867e715c73d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5594-fcc0-e9c8-c8b1608eeb72	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5594-fcc0-6ae0-6b0bd85d162f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5594-fcc0-8191-8a1803787900	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5594-fcc0-fa50-c6f1e8dc662c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5594-fcc0-abdd-5f0fdf335888	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5594-fcc0-4108-bf1d16162dd1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5594-fcc0-323a-e1084776babe	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5594-fcc0-e2ef-ea45251e51c6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5594-fcc0-e80f-c72b51b41a7a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5594-fcc0-a0ae-346fe95e6193	CU	CUB	192	Cuba 	Kuba	\N
00040000-5594-fcc0-a8f4-c36f5aa4ecc9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5594-fcc0-5d56-bfe29dcc01c9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5594-fcc0-ffa3-342892ec95eb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5594-fcc0-9a59-cce9277bafab	DK	DNK	208	Denmark 	Danska	\N
00040000-5594-fcc0-00fd-967b872eb81f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5594-fcc0-442b-b1ba06ce1d7e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5594-fcc0-1a43-46e52a82d284	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5594-fcc0-65bd-1e2473745b6e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5594-fcc0-8fca-e312de61f3c6	EG	EGY	818	Egypt 	Egipt	\N
00040000-5594-fcc0-801a-3cdbf29fbca3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5594-fcc0-b8f8-9ba38e8341a6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5594-fcc0-c38a-0fddef3fa156	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5594-fcc0-f768-f5cbb61f10ee	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5594-fcc0-1057-973bb13f105d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5594-fcc0-d2db-777e3c7a594d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5594-fcc0-fa7f-892cfd647e1a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5594-fcc0-f57c-d43f89532db6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5594-fcc0-9236-0750675531da	FI	FIN	246	Finland 	Finska	\N
00040000-5594-fcc0-29b3-f798ef53bd80	FR	FRA	250	France 	Francija	\N
00040000-5594-fcc0-35f6-c44a9ed4fec7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5594-fcc0-a7eb-2e02ce48982d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5594-fcc0-919b-649ad9774db4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5594-fcc0-bda3-a9cc694a2741	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5594-fcc0-2639-0cad331ba257	GA	GAB	266	Gabon 	Gabon	\N
00040000-5594-fcc0-b02e-270f273fd2b5	GM	GMB	270	Gambia 	Gambija	\N
00040000-5594-fcc0-3350-6a2c0989e22e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5594-fcc0-5216-6fa7b5b06768	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5594-fcc0-3ca5-12337a47e768	GH	GHA	288	Ghana 	Gana	\N
00040000-5594-fcc0-5b6d-b669c554e7fe	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5594-fcc0-6037-b851e3fe17fe	GR	GRC	300	Greece 	Grčija	\N
00040000-5594-fcc0-314e-bd574b57a1bd	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5594-fcc0-0bb7-509b041162e5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5594-fcc0-285c-7f271ac9f6f5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5594-fcc0-0b09-8d433e0fc349	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5594-fcc0-2a7f-b3007f3cb78b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5594-fcc0-3612-0b14cfd28206	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5594-fcc0-1ed6-e020784c14bc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5594-fcc0-d3fd-704e773dd3f7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5594-fcc0-8fa6-9c3df25c4cb0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5594-fcc0-4b62-4c9a9af1d611	HT	HTI	332	Haiti 	Haiti	\N
00040000-5594-fcc0-ac80-cb4f080f7df1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5594-fcc0-5ab2-29f6e48e2065	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5594-fcc0-b059-cb7d629939c9	HN	HND	340	Honduras 	Honduras	\N
00040000-5594-fcc0-e7f5-3560cd38545e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5594-fcc0-0846-3d5580b90928	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5594-fcc0-8e96-fad627dade31	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5594-fcc0-0836-4ddd284dcce0	IN	IND	356	India 	Indija	\N
00040000-5594-fcc0-62d0-08070109f615	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5594-fcc0-809b-5b9bf510fc1a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5594-fcc0-81b9-7a78b2e82674	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5594-fcc0-7b3c-3d29e2b82ab4	IE	IRL	372	Ireland 	Irska	\N
00040000-5594-fcc0-88d2-40f0a0044ec7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5594-fcc0-a70f-b5954d7f50f0	IL	ISR	376	Israel 	Izrael	\N
00040000-5594-fcc0-3154-2a401a142297	IT	ITA	380	Italy 	Italija	\N
00040000-5594-fcc0-976e-49123a455c48	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5594-fcc0-eff4-77532a196cd5	JP	JPN	392	Japan 	Japonska	\N
00040000-5594-fcc0-407c-cbe333ce46d0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5594-fcc0-8f3c-d7e58916caf6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5594-fcc0-77ba-14aba8c58c54	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5594-fcc0-5986-80fe1c143ae6	KE	KEN	404	Kenya 	Kenija	\N
00040000-5594-fcc0-c35d-64eb14c01a99	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5594-fcc0-879c-5b68064e2f0b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5594-fcc0-ebf1-d5c3fe488221	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5594-fcc0-7833-b8c083e6cdc0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5594-fcc0-5d47-096ca4ae1f44	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5594-fcc0-8cec-5202fca94a0b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5594-fcc0-3786-f2e8f0adff20	LV	LVA	428	Latvia 	Latvija	\N
00040000-5594-fcc0-0244-cd1f3a9a38b8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5594-fcc0-5b0c-c0e6071bcbb3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5594-fcc0-314d-709b99dadb17	LR	LBR	430	Liberia 	Liberija	\N
00040000-5594-fcc0-4096-cd5eef59c8c7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5594-fcc0-e0f8-3d3fa1a84c2e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5594-fcc0-f468-ba64db84705c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5594-fcc0-a3ec-f1b6c47c84d5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5594-fcc0-beb1-41fe743b0f9d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5594-fcc0-2dfe-c6810227f83e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5594-fcc0-2870-6fb51db40f60	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5594-fcc0-c136-0c3ddd87f1aa	MW	MWI	454	Malawi 	Malavi	\N
00040000-5594-fcc0-057c-e32cd35b593d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5594-fcc0-f094-f1ecb9c2ff6b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5594-fcc0-34af-2cc3f28be7be	ML	MLI	466	Mali 	Mali	\N
00040000-5594-fcc0-ee1a-b65beeb801cc	MT	MLT	470	Malta 	Malta	\N
00040000-5594-fcc0-f905-5d7b948da89b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5594-fcc0-8ebd-0c35087fd082	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5594-fcc0-fb55-15dd5ef03cb3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5594-fcc0-2d55-5e33095d65ab	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5594-fcc0-1e70-67b858995c37	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5594-fcc0-0777-97d273da8def	MX	MEX	484	Mexico 	Mehika	\N
00040000-5594-fcc0-a33e-198f726d5b71	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5594-fcc0-04fa-7953da1e5a00	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5594-fcc0-fddf-9aeeed442df2	MC	MCO	492	Monaco 	Monako	\N
00040000-5594-fcc0-6f70-6d9c323744b3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5594-fcc0-1003-348b6f2468a8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5594-fcc0-08cf-d012f367d875	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5594-fcc0-af00-4a568053923b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5594-fcc0-4fa1-191c436bc675	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5594-fcc0-39b4-2916cb024fe7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5594-fcc0-d1b0-609cad5d9ec2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5594-fcc0-bf76-c795b8cf5eac	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5594-fcc0-4aad-6799b10f7940	NP	NPL	524	Nepal 	Nepal	\N
00040000-5594-fcc0-f78e-2168f86c1f8b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5594-fcc0-0bfd-15ae8888e7be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5594-fcc0-77a1-471bc79791d0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5594-fcc0-8030-15fdfe360e72	NE	NER	562	Niger 	Niger 	\N
00040000-5594-fcc0-db1e-d450d5d7108b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5594-fcc0-6602-e9cea62ee72b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5594-fcc0-a38e-3ca4e2d35b8d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5594-fcc0-dbc9-26c04325232b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5594-fcc0-447e-ac5abe7988ae	NO	NOR	578	Norway 	Norveška	\N
00040000-5594-fcc0-0339-2e9c5cc22e63	OM	OMN	512	Oman 	Oman	\N
00040000-5594-fcc0-10fd-2bb49a7e5981	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5594-fcc0-ef79-a68f28bed407	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5594-fcc0-19da-756e99cf66f6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5594-fcc0-e5fc-836095630820	PA	PAN	591	Panama 	Panama	\N
00040000-5594-fcc0-1bfa-64b9eaac0161	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5594-fcc0-69b7-727f5f3c157d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5594-fcc0-96bd-3e34436904bd	PE	PER	604	Peru 	Peru	\N
00040000-5594-fcc0-93c7-586676a03492	PH	PHL	608	Philippines 	Filipini	\N
00040000-5594-fcc0-5f1e-5973ecaa88ab	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5594-fcc0-866e-d38ae94e8b5e	PL	POL	616	Poland 	Poljska	\N
00040000-5594-fcc0-45e7-45c60d0864be	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5594-fcc0-2b6c-366bae7189e5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5594-fcc0-c98f-1f10c9fa9a2b	QA	QAT	634	Qatar 	Katar	\N
00040000-5594-fcc0-366b-20e99098d6eb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5594-fcc0-5a47-b190b7686a72	RO	ROU	642	Romania 	Romunija	\N
00040000-5594-fcc0-7689-b418750ee37d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5594-fcc0-ac50-d4a664a22f3b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5594-fcc0-7677-68eb7c7aa41a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5594-fcc0-40aa-8f0b04c283ee	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5594-fcc0-7788-5a8769bbcfd4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5594-fcc0-3564-028f91127010	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5594-fcc0-da2d-128931587d89	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5594-fcc0-dd33-828ec2e68f6e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5594-fcc0-da5c-1d57b12846e7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5594-fcc0-1c66-0fc797cf9c02	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5594-fcc0-9bf5-b3f018debd36	SM	SMR	674	San Marino 	San Marino	\N
00040000-5594-fcc0-f736-fa9cea652e25	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5594-fcc0-13b2-b04134fd9d9e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5594-fcc0-6d92-d229b1db7419	SN	SEN	686	Senegal 	Senegal	\N
00040000-5594-fcc0-3c51-6c945ab97ed9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5594-fcc0-a645-87468ff41e4b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5594-fcc0-beb7-27cefbb08b08	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5594-fcc0-7aae-89f1361ca266	SG	SGP	702	Singapore 	Singapur	\N
00040000-5594-fcc0-4e4c-ffea7d771349	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5594-fcc0-89ec-f500b5fc6a69	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5594-fcc0-344c-4442a2147f46	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5594-fcc0-50e7-0fb249acad9f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5594-fcc0-a644-c4506afec78e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5594-fcc0-997e-22d7b2dda70a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5594-fcc0-f6b4-c5af80abcf41	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5594-fcc0-74e7-05a1aae1645d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5594-fcc0-7775-a73f720368bb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5594-fcc0-4dbd-94f1bf79a56f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5594-fcc0-1a40-11721a6a3fd8	SD	SDN	729	Sudan 	Sudan	\N
00040000-5594-fcc0-1367-70ce75269395	SR	SUR	740	Suriname 	Surinam	\N
00040000-5594-fcc0-36b3-79b8413cec04	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5594-fcc0-f131-d38217f86c52	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5594-fcc0-cc88-9d5797f7ab95	SE	SWE	752	Sweden 	Švedska	\N
00040000-5594-fcc0-5122-5758cf1b40ac	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5594-fcc0-9db2-f2c96395b421	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5594-fcc0-d217-ccf8783292ff	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5594-fcc0-f460-5d07d1bec163	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5594-fcc0-dc6e-9ce117ee3995	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5594-fcc0-baea-b8a85fe7768f	TH	THA	764	Thailand 	Tajska	\N
00040000-5594-fcc0-e2df-d8ff6c625315	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5594-fcc0-ad3f-7ed8d90ac600	TG	TGO	768	Togo 	Togo	\N
00040000-5594-fcc0-5d6d-7a143626197e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5594-fcc0-a379-c57a138e8967	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5594-fcc0-0a22-f23e5ac8d364	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5594-fcc0-8673-97008b063aeb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5594-fcc0-9e96-60ba3d617174	TR	TUR	792	Turkey 	Turčija	\N
00040000-5594-fcc0-1a3f-fd43deb220fa	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5594-fcc0-ff57-b051c7589fb2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5594-fcc0-1551-c6d819097bbe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5594-fcc0-a214-06cb492729d6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5594-fcc0-4a03-42713fb83ec5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5594-fcc0-0084-63faf36925c7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5594-fcc0-77c8-9d29f926962e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5594-fcc0-977a-e7472c2de22f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5594-fcc0-4f98-3d1c4791b5d9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5594-fcc0-0d30-5aa671096607	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5594-fcc0-0022-63027f9cd319	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5594-fcc0-16c1-ea5936c4445d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5594-fcc0-f33d-169827850062	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5594-fcc0-e6fe-0112b2267c03	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5594-fcc0-750b-fe18c6c00347	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5594-fcc0-953a-38e4cda5febf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5594-fcc0-6890-47426e3d4606	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5594-fcc0-9dc4-5f3492a2830d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5594-fcc0-6425-0c1fab814696	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5594-fcc0-ebd3-642d7e676ca2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5594-fcc0-7500-9e8d6a5fe346	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8816697)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5594-fcc2-3041-62f676116a7d	000e0000-5594-fcc2-e627-2567d4e3b5d3	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5594-fcc1-7cea-13483b28c9dd	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5594-fcc2-fcaa-2b2c98506313	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5594-fcc1-a8ff-bd85c8a2f0ac	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8816505)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5594-fcc2-5833-83296de31bf4	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5594-fcc1-42d2-c130b73a71e5
000d0000-5594-fcc2-0c47-d534a16570af	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5594-fcc1-42d2-c130b73a71e5
000d0000-5594-fcc2-a6f3-ea2c0db04ae5	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5594-fcc1-8986-ff93d94823b1
000d0000-5594-fcc2-1b31-f9b8ddcb287f	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5594-fcc1-5052-15563c0e9c18
000d0000-5594-fcc2-b0ad-b1e4cc703b27	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5594-fcc1-5052-15563c0e9c18
000d0000-5594-fcc2-25c8-4a0c8e3fcef4	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5594-fcc1-5052-15563c0e9c18
000d0000-5594-fcc2-2833-cfa8147cbc99	000e0000-5594-fcc2-b3c9-ebe4e264f812	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5594-fcc1-42d2-c130b73a71e5
\.


--
-- TOC entry 2866 (class 0 OID 8816325)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8816373)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8816305)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5594-fcc2-e6f0-8fbd0ab1354f	00080000-5594-fcc2-4a67-44734e6eda5e	00090000-5594-fcc2-8b23-262783c96a77	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8816422)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8816447)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8816262)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5594-fcc1-84aa-e9e25d6a299d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5594-fcc1-d1ef-ddcb7156fb0c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5594-fcc1-e32f-3ce7643d0e2a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5594-fcc1-c672-967967971544	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5594-fcc1-8750-1586858d0370	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5594-fcc1-0b80-198d3071549b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5594-fcc1-cbcc-dbf541900e1d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5594-fcc1-7920-624d1eee1eb5	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5594-fcc1-5d64-b444a5bbc410	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5594-fcc1-93a3-17913ed7ddd7	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5594-fcc1-bd07-337ec8650708	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5594-fcc1-bbd7-39531c50cdbb	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5594-fcc1-969f-8dd374b48008	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5594-fcc2-f89b-f6cbddaf483a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5594-fcc2-e118-73962fa22776	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5594-fcc2-bf01-b2084194fa5d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5594-fcc2-b1e7-70600740dd98	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5594-fcc2-d8d4-6ac6cdb19390	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5594-fcc2-04bf-41212921eddc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8816175)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5594-fcc2-ef86-f8114805a677	00000000-5594-fcc2-e118-73962fa22776	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5594-fcc2-8694-80f56c0e882e	00000000-5594-fcc2-e118-73962fa22776	00010000-5594-fcc1-390c-acb84b073109	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5594-fcc2-3a34-7cfbec54de17	00000000-5594-fcc2-bf01-b2084194fa5d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8816186)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5594-fcc2-abdf-8ed16b003245	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5594-fcc2-6046-73f18d9a7da2	00010000-5594-fcc2-57f1-2c4aa0709ff3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5594-fcc2-b361-f7ef471b2dad	00010000-5594-fcc2-6fee-acfc00803728	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5594-fcc2-1621-7b44ee0e59b0	00010000-5594-fcc2-1427-6577e97b0ff6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5594-fcc2-10f5-fa12045e464b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5594-fcc2-d504-436d73245c95	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5594-fcc2-c489-1fcc4ae8ed23	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5594-fcc2-0180-8d544ad93d3f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5594-fcc2-8b23-262783c96a77	00010000-5594-fcc2-72fe-eb800b09ebdb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5594-fcc2-cb97-36e07b2f5ae2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5594-fcc2-3c53-ffd18f45a0a6	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5594-fcc2-c6f4-f970c6fbae87	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5594-fcc2-9c13-c9fcb483ee63	00010000-5594-fcc2-5b6c-6f339367fbb4	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8816140)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5594-fcc0-b3f5-ff3c92ff1a85	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5594-fcc0-f37d-9e1cb99fcb08	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5594-fcc0-8127-2885bfe0947c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5594-fcc0-f804-fa57c7b7841f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5594-fcc0-645c-02d6a060aa80	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5594-fcc0-8ac9-4898ce842715	Abonma-read	Abonma - branje	f
00030000-5594-fcc0-429f-5a7027198635	Abonma-write	Abonma - spreminjanje	f
00030000-5594-fcc0-cabe-20a0db70cfef	Alternacija-read	Alternacija - branje	f
00030000-5594-fcc0-d7c7-3e834d00b676	Alternacija-write	Alternacija - spreminjanje	f
00030000-5594-fcc0-96b7-e1903003799e	Arhivalija-read	Arhivalija - branje	f
00030000-5594-fcc0-be6b-64bcfa3324f5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5594-fcc0-470c-e2bd2f2d7576	Besedilo-read	Besedilo - branje	f
00030000-5594-fcc0-3fae-62952e154f9b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5594-fcc0-86e4-123d27ffcdfb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5594-fcc0-c9a8-5539c4c97fc7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5594-fcc0-e7ba-38883288340d	Dogodek-read	Dogodek - branje	f
00030000-5594-fcc0-808c-abe12c762d5c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5594-fcc0-20ff-c664b9f32c43	DrugiVir-read	DrugiVir - branje	f
00030000-5594-fcc0-561b-6119189f1901	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5594-fcc0-32cc-8f0697396cc0	Drzava-read	Drzava - branje	f
00030000-5594-fcc0-5420-441a9baee7af	Drzava-write	Drzava - spreminjanje	f
00030000-5594-fcc0-620b-059ed461f339	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5594-fcc0-2103-5af63e8f8d80	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5594-fcc0-bfa7-721995577eab	Funkcija-read	Funkcija - branje	f
00030000-5594-fcc0-dccb-11aabfd366a7	Funkcija-write	Funkcija - spreminjanje	f
00030000-5594-fcc0-1028-a239e66af576	Gostovanje-read	Gostovanje - branje	f
00030000-5594-fcc0-8ff4-1a6ab3d8ea9d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5594-fcc0-e529-157dcb0bb29e	Gostujoca-read	Gostujoca - branje	f
00030000-5594-fcc0-88af-27339f78f4bb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5594-fcc0-62a8-b57bc1fac928	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5594-fcc0-f8d0-7d4334e698f0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5594-fcc0-5b6e-9849ec8f24a9	Kupec-read	Kupec - branje	f
00030000-5594-fcc0-52ec-f55f5eeba445	Kupec-write	Kupec - spreminjanje	f
00030000-5594-fcc0-3a05-44e8d33869bb	NacinPlacina-read	NacinPlacina - branje	f
00030000-5594-fcc0-3263-203e80ac487c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5594-fcc0-1e2b-bcbfede1c7c9	Option-read	Option - branje	f
00030000-5594-fcc0-e752-90f7cb28c90d	Option-write	Option - spreminjanje	f
00030000-5594-fcc0-6641-88ac2ca02820	OptionValue-read	OptionValue - branje	f
00030000-5594-fcc0-c55a-bc18e664dbfc	OptionValue-write	OptionValue - spreminjanje	f
00030000-5594-fcc0-378e-48bbd39a6627	Oseba-read	Oseba - branje	f
00030000-5594-fcc0-6948-e8b49316f9cc	Oseba-write	Oseba - spreminjanje	f
00030000-5594-fcc0-b2f1-f6d72a695a1f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5594-fcc0-8d5a-15dae0eb1ddb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5594-fcc0-53b3-18fe3694dd6b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5594-fcc0-a4ab-f64cab6df094	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5594-fcc0-cdae-7752af423352	Pogodba-read	Pogodba - branje	f
00030000-5594-fcc0-ae30-cff031ef76b9	Pogodba-write	Pogodba - spreminjanje	f
00030000-5594-fcc0-8ad7-6e82e9689ce7	Popa-read	Popa - branje	f
00030000-5594-fcc0-8125-369e65feefd5	Popa-write	Popa - spreminjanje	f
00030000-5594-fcc0-a9b9-87127667c678	Posta-read	Posta - branje	f
00030000-5594-fcc0-b809-55606849cbb7	Posta-write	Posta - spreminjanje	f
00030000-5594-fcc0-30aa-e4cb65de9050	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5594-fcc0-0bcb-2e281014a205	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5594-fcc0-7818-987b19226f27	PostniNaslov-read	PostniNaslov - branje	f
00030000-5594-fcc0-d15a-3e3e5ec65044	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5594-fcc0-43fb-2ee3aa1786be	Predstava-read	Predstava - branje	f
00030000-5594-fcc0-f245-e69c2b3c4d00	Predstava-write	Predstava - spreminjanje	f
00030000-5594-fcc0-3ef6-1fac41927989	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5594-fcc0-a0d1-d48bef35c67e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5594-fcc0-ccdd-1cbe7ce1d48a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5594-fcc0-8b87-6afcce87955b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5594-fcc0-f26e-241266e33a88	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5594-fcc0-2a94-da6fcdee0abe	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5594-fcc0-9327-04f4903adee5	ProgramDela-read	ProgramDela - branje	f
00030000-5594-fcc0-7450-9f842b8dae11	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5594-fcc0-d1a7-09006b218e18	ProgramFestival-read	ProgramFestival - branje	f
00030000-5594-fcc0-ec3f-74dc5a7451c6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5594-fcc0-b0e0-106c45bb053e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5594-fcc0-578e-53ff88ba56d2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5594-fcc0-9b92-1d2baf181aec	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5594-fcc0-ab34-e08f54f4d243	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5594-fcc0-9923-f74b9fd8a6b3	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5594-fcc0-1d9d-d181569fc2f8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5594-fcc0-e71c-1c57d9f2ba5b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5594-fcc0-06c6-073f1fc3f112	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5594-fcc0-b50d-fc993a4bdf83	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5594-fcc0-c498-ee1524d59758	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5594-fcc0-7239-789575c1c317	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5594-fcc0-0345-d1946725c29d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5594-fcc0-da17-9148953536c1	ProgramRazno-read	ProgramRazno - branje	f
00030000-5594-fcc0-0df8-faac7be18b57	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5594-fcc0-5577-cf9a24228393	Prostor-read	Prostor - branje	f
00030000-5594-fcc0-7808-1200d031a261	Prostor-write	Prostor - spreminjanje	f
00030000-5594-fcc0-ff2d-a66c14a35724	Racun-read	Racun - branje	f
00030000-5594-fcc0-6473-c4143cc958c6	Racun-write	Racun - spreminjanje	f
00030000-5594-fcc0-7d90-9f90acf7477f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5594-fcc0-730c-41ca4b58014e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5594-fcc0-08a4-a353b2e5dfb5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5594-fcc0-f046-5381f62ff609	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5594-fcc0-172a-850ca2da9662	Rekvizit-read	Rekvizit - branje	f
00030000-5594-fcc0-ea88-62cae3ed662e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5594-fcc0-8d18-f347d65ae0f6	Revizija-read	Revizija - branje	f
00030000-5594-fcc0-1f6c-ab0a473d34b6	Revizija-write	Revizija - spreminjanje	f
00030000-5594-fcc0-7dce-7673134a7bff	Rezervacija-read	Rezervacija - branje	f
00030000-5594-fcc0-69f1-69c3f0d75e93	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5594-fcc0-ec9c-37ec1ae7df6c	SedezniRed-read	SedezniRed - branje	f
00030000-5594-fcc0-712d-40377c8ac8e2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5594-fcc0-5c76-be8f54f9f515	Sedez-read	Sedez - branje	f
00030000-5594-fcc0-b0d2-c8e45be7da97	Sedez-write	Sedez - spreminjanje	f
00030000-5594-fcc0-ff3d-7bf44d4a51c2	Sezona-read	Sezona - branje	f
00030000-5594-fcc0-7e4f-8c3012dbaf69	Sezona-write	Sezona - spreminjanje	f
00030000-5594-fcc0-1965-60e6f4292d65	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5594-fcc0-cbc4-42c18bd33d21	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5594-fcc0-c358-5e6a0811908e	Stevilcenje-read	Stevilcenje - branje	f
00030000-5594-fcc0-54de-65510946feca	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5594-fcc0-790a-25b7129a2791	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5594-fcc0-bf45-d3a6f9dc55ca	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5594-fcc0-1fac-57f7ec40e1c7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5594-fcc0-05f8-233026587826	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5594-fcc0-eae2-c7e39ede934a	Telefonska-read	Telefonska - branje	f
00030000-5594-fcc0-2a00-e0531fef6bc4	Telefonska-write	Telefonska - spreminjanje	f
00030000-5594-fcc0-e9ec-415da6cb10c8	TerminStoritve-read	TerminStoritve - branje	f
00030000-5594-fcc0-8fe0-c1027ccb3e8e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5594-fcc0-4de7-1ee016c9f500	TipFunkcije-read	TipFunkcije - branje	f
00030000-5594-fcc0-4bac-97bb4921188f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5594-fcc0-5fb5-bbf70772e38e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5594-fcc0-44dd-78f910c9f175	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5594-fcc0-0a9e-f2ddc0438618	Trr-read	Trr - branje	f
00030000-5594-fcc0-e0e2-a5352b7500be	Trr-write	Trr - spreminjanje	f
00030000-5594-fcc0-3cbe-dc5dbbf1adf5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5594-fcc0-0114-95cd40c1ade0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5594-fcc0-23ed-83b21490278c	Vaja-read	Vaja - branje	f
00030000-5594-fcc0-b4b3-ab45c0fe696a	Vaja-write	Vaja - spreminjanje	f
00030000-5594-fcc0-35d2-2ea73b842807	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5594-fcc0-214c-33699548bf72	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5594-fcc0-5d8d-18edd1794191	Zaposlitev-read	Zaposlitev - branje	f
00030000-5594-fcc0-fb49-baffb0552a2f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5594-fcc0-4955-64894eee9a9c	Zasedenost-read	Zasedenost - branje	f
00030000-5594-fcc0-d3c0-434d7e6f9d52	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5594-fcc0-4376-f801f5714d4a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5594-fcc0-b04c-a6c7bf6d29fc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5594-fcc0-4ea8-7bd1c7c7aa91	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5594-fcc0-4ea6-e9ebfbfd788a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8816159)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5594-fcc0-4d92-5dcf524bf5ee	00030000-5594-fcc0-f37d-9e1cb99fcb08
00020000-5594-fcc0-874d-fe9cf82bb370	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-429f-5a7027198635
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-cabe-20a0db70cfef
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-d7c7-3e834d00b676
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-f804-fa57c7b7841f
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-808c-abe12c762d5c
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-5420-441a9baee7af
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-bfa7-721995577eab
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-dccb-11aabfd366a7
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-8ff4-1a6ab3d8ea9d
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-88af-27339f78f4bb
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-62a8-b57bc1fac928
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-f8d0-7d4334e698f0
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-378e-48bbd39a6627
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-6948-e8b49316f9cc
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-8125-369e65feefd5
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-b809-55606849cbb7
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-7818-987b19226f27
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-d15a-3e3e5ec65044
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-f245-e69c2b3c4d00
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-f26e-241266e33a88
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-2a94-da6fcdee0abe
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-7808-1200d031a261
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-f046-5381f62ff609
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-ea88-62cae3ed662e
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-7e4f-8c3012dbaf69
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-4de7-1ee016c9f500
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-3cbe-dc5dbbf1adf5
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-0114-95cd40c1ade0
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-23ed-83b21490278c
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-b4b3-ab45c0fe696a
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-4955-64894eee9a9c
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-d3c0-434d7e6f9d52
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc0-c85e-d85f3e7c035e	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-62a8-b57bc1fac928
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-f8d0-7d4334e698f0
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-378e-48bbd39a6627
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-6948-e8b49316f9cc
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-7818-987b19226f27
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-d15a-3e3e5ec65044
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-eae2-c7e39ede934a
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-2a00-e0531fef6bc4
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-0a9e-f2ddc0438618
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-e0e2-a5352b7500be
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-5d8d-18edd1794191
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-fb49-baffb0552a2f
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc0-48eb-1c20cde67e85	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-cabe-20a0db70cfef
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-be6b-64bcfa3324f5
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-470c-e2bd2f2d7576
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-86e4-123d27ffcdfb
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-bfa7-721995577eab
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-62a8-b57bc1fac928
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-378e-48bbd39a6627
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-f26e-241266e33a88
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-4de7-1ee016c9f500
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-23ed-83b21490278c
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-4955-64894eee9a9c
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc0-f3a6-6e3bac5d13e5	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-429f-5a7027198635
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-d7c7-3e834d00b676
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-4de7-1ee016c9f500
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc0-569b-b4a9a25bafbe	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-e9ec-415da6cb10c8
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-8127-2885bfe0947c
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-4de7-1ee016c9f500
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc0-96a4-61eb6836275f	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b3f5-ff3c92ff1a85
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f37d-9e1cb99fcb08
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8127-2885bfe0947c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f804-fa57c7b7841f
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-645c-02d6a060aa80
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8ac9-4898ce842715
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-429f-5a7027198635
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-cabe-20a0db70cfef
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-d7c7-3e834d00b676
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-96b7-e1903003799e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-be6b-64bcfa3324f5
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-470c-e2bd2f2d7576
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-3fae-62952e154f9b
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-86e4-123d27ffcdfb
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-c9a8-5539c4c97fc7
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e7ba-38883288340d
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-808c-abe12c762d5c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-32cc-8f0697396cc0
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5420-441a9baee7af
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-620b-059ed461f339
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-2103-5af63e8f8d80
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-bfa7-721995577eab
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-dccb-11aabfd366a7
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1028-a239e66af576
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8ff4-1a6ab3d8ea9d
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e529-157dcb0bb29e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-88af-27339f78f4bb
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-62a8-b57bc1fac928
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f8d0-7d4334e698f0
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5b6e-9849ec8f24a9
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-52ec-f55f5eeba445
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-3a05-44e8d33869bb
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-3263-203e80ac487c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1e2b-bcbfede1c7c9
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e752-90f7cb28c90d
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-6641-88ac2ca02820
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-c55a-bc18e664dbfc
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-378e-48bbd39a6627
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-6948-e8b49316f9cc
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b2f1-f6d72a695a1f
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8d5a-15dae0eb1ddb
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-53b3-18fe3694dd6b
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-a4ab-f64cab6df094
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-cdae-7752af423352
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ae30-cff031ef76b9
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8ad7-6e82e9689ce7
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8125-369e65feefd5
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-a9b9-87127667c678
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b809-55606849cbb7
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-30aa-e4cb65de9050
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-0bcb-2e281014a205
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7818-987b19226f27
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-d15a-3e3e5ec65044
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-43fb-2ee3aa1786be
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f245-e69c2b3c4d00
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-3ef6-1fac41927989
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-a0d1-d48bef35c67e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ccdd-1cbe7ce1d48a
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8b87-6afcce87955b
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f26e-241266e33a88
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-2a94-da6fcdee0abe
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-9327-04f4903adee5
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7450-9f842b8dae11
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-d1a7-09006b218e18
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ec3f-74dc5a7451c6
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b0e0-106c45bb053e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-578e-53ff88ba56d2
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-9b92-1d2baf181aec
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ab34-e08f54f4d243
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-9923-f74b9fd8a6b3
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1d9d-d181569fc2f8
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e71c-1c57d9f2ba5b
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-06c6-073f1fc3f112
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b50d-fc993a4bdf83
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-c498-ee1524d59758
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7239-789575c1c317
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-0345-d1946725c29d
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-da17-9148953536c1
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-0df8-faac7be18b57
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5577-cf9a24228393
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7808-1200d031a261
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ff2d-a66c14a35724
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-6473-c4143cc958c6
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7d90-9f90acf7477f
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-730c-41ca4b58014e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-08a4-a353b2e5dfb5
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-f046-5381f62ff609
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-172a-850ca2da9662
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ea88-62cae3ed662e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8d18-f347d65ae0f6
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1f6c-ab0a473d34b6
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7dce-7673134a7bff
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-69f1-69c3f0d75e93
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ec9c-37ec1ae7df6c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-712d-40377c8ac8e2
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5c76-be8f54f9f515
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b0d2-c8e45be7da97
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-ff3d-7bf44d4a51c2
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-7e4f-8c3012dbaf69
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1965-60e6f4292d65
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-cbc4-42c18bd33d21
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-c358-5e6a0811908e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-54de-65510946feca
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-790a-25b7129a2791
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-bf45-d3a6f9dc55ca
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-1fac-57f7ec40e1c7
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-05f8-233026587826
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-eae2-c7e39ede934a
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-2a00-e0531fef6bc4
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e9ec-415da6cb10c8
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-8fe0-c1027ccb3e8e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4de7-1ee016c9f500
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4bac-97bb4921188f
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5fb5-bbf70772e38e
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-44dd-78f910c9f175
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-0a9e-f2ddc0438618
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-e0e2-a5352b7500be
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-3cbe-dc5dbbf1adf5
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-0114-95cd40c1ade0
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-23ed-83b21490278c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b4b3-ab45c0fe696a
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-35d2-2ea73b842807
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-214c-33699548bf72
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-5d8d-18edd1794191
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-fb49-baffb0552a2f
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4955-64894eee9a9c
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-d3c0-434d7e6f9d52
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4376-f801f5714d4a
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-b04c-a6c7bf6d29fc
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4ea8-7bd1c7c7aa91
00020000-5594-fcc2-aa37-006581d4ea5c	00030000-5594-fcc0-4ea6-e9ebfbfd788a
\.


--
-- TOC entry 2881 (class 0 OID 8816454)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8816485)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8816617)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5594-fcc2-3988-49f363781bea	00090000-5594-fcc2-abdf-8ed16b003245	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8816219)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5594-fcc2-4a67-44734e6eda5e	00040000-5594-fcc0-344c-4442a2147f46	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-6980-c8677017bcfb	00040000-5594-fcc0-344c-4442a2147f46	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5594-fcc2-ba6b-f6a886bac5fa	00040000-5594-fcc0-344c-4442a2147f46	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-7f71-58e59cd2a412	00040000-5594-fcc0-344c-4442a2147f46	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-a23b-05b3871a4a4c	00040000-5594-fcc0-344c-4442a2147f46	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-bce7-0eabbf6c3633	00040000-5594-fcc0-8118-4c54ec345a0d	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-e5fc-050a4584d793	00040000-5594-fcc0-e80f-c72b51b41a7a	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-a714-72d65070b922	00040000-5594-fcc0-959f-7027daf627a7	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-fcc2-7b2f-109a3f56277a	00040000-5594-fcc0-344c-4442a2147f46	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8816254)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5594-fcc1-9ddd-96f024cc71e1	8341	Adlešiči
00050000-5594-fcc1-b5ff-14b247acf17d	5270	Ajdovščina
00050000-5594-fcc1-35f5-0f1bfd1b2791	6280	Ankaran/Ancarano
00050000-5594-fcc1-f2b7-5ada763d4e82	9253	Apače
00050000-5594-fcc1-7bda-4263b25bc324	8253	Artiče
00050000-5594-fcc1-efaa-8d9665c2a1a5	4275	Begunje na Gorenjskem
00050000-5594-fcc1-9870-b80885735a87	1382	Begunje pri Cerknici
00050000-5594-fcc1-4d33-eaf2189591ce	9231	Beltinci
00050000-5594-fcc1-2169-8bcca1ce2073	2234	Benedikt
00050000-5594-fcc1-457a-265477a93600	2345	Bistrica ob Dravi
00050000-5594-fcc1-2aba-978f1c8780be	3256	Bistrica ob Sotli
00050000-5594-fcc1-15a4-d9acc3cc7468	8259	Bizeljsko
00050000-5594-fcc1-c133-e149c30ff558	1223	Blagovica
00050000-5594-fcc1-b738-3ea86091d81d	8283	Blanca
00050000-5594-fcc1-1711-3ac26e1feee0	4260	Bled
00050000-5594-fcc1-ab3c-9fb038f3b7e5	4273	Blejska Dobrava
00050000-5594-fcc1-fdb2-dfb950a0f174	9265	Bodonci
00050000-5594-fcc1-27c5-838964c4aae9	9222	Bogojina
00050000-5594-fcc1-63b0-149a7087c53e	4263	Bohinjska Bela
00050000-5594-fcc1-223c-6407e27c2013	4264	Bohinjska Bistrica
00050000-5594-fcc1-87a8-6190aae6b312	4265	Bohinjsko jezero
00050000-5594-fcc1-d0d1-5eab826a1249	1353	Borovnica
00050000-5594-fcc1-b4b5-e74da025d599	8294	Boštanj
00050000-5594-fcc1-8d1b-bbab9636350f	5230	Bovec
00050000-5594-fcc1-8dd5-a6f5aa8e7104	5295	Branik
00050000-5594-fcc1-5149-87f968333459	3314	Braslovče
00050000-5594-fcc1-cbe4-9419340efbdc	5223	Breginj
00050000-5594-fcc1-ed74-8ab88d561ba0	8280	Brestanica
00050000-5594-fcc1-80b2-2689b2ef71c5	2354	Bresternica
00050000-5594-fcc1-e95c-b26f59a0987f	4243	Brezje
00050000-5594-fcc1-a0ec-204191be810c	1351	Brezovica pri Ljubljani
00050000-5594-fcc1-b457-fe4e70618ab0	8250	Brežice
00050000-5594-fcc1-ae1f-7a29e1adfa06	4210	Brnik - Aerodrom
00050000-5594-fcc1-4f98-149d868ccae3	8321	Brusnice
00050000-5594-fcc1-868d-e7e17335978a	3255	Buče
00050000-5594-fcc1-0049-133e2ba23a12	8276	Bučka 
00050000-5594-fcc1-aeb8-e42773fc3d0e	9261	Cankova
00050000-5594-fcc1-21b7-24f5cddbef09	3000	Celje 
00050000-5594-fcc1-2a56-25ffc1df904a	3001	Celje - poštni predali
00050000-5594-fcc1-2057-7b4de758d9ca	4207	Cerklje na Gorenjskem
00050000-5594-fcc1-2c7d-2763e1846185	8263	Cerklje ob Krki
00050000-5594-fcc1-ef94-9565cdc025b2	1380	Cerknica
00050000-5594-fcc1-5d26-db764fe59aa8	5282	Cerkno
00050000-5594-fcc1-0ea3-9bb7bb51c119	2236	Cerkvenjak
00050000-5594-fcc1-3cb2-ede224e6deba	2215	Ceršak
00050000-5594-fcc1-84a1-c124c9cd2461	2326	Cirkovce
00050000-5594-fcc1-f0d6-fe8c55463202	2282	Cirkulane
00050000-5594-fcc1-aedd-9bec044acb6b	5273	Col
00050000-5594-fcc1-8458-827c62fbc03f	8251	Čatež ob Savi
00050000-5594-fcc1-78fe-4fc7bbd420bb	1413	Čemšenik
00050000-5594-fcc1-3f62-bf707564ef51	5253	Čepovan
00050000-5594-fcc1-263c-b83cb01cabfc	9232	Črenšovci
00050000-5594-fcc1-ef58-33c096d7b32a	2393	Črna na Koroškem
00050000-5594-fcc1-fbfe-355e8bbaf52d	6275	Črni Kal
00050000-5594-fcc1-3c15-d1cd007a1c67	5274	Črni Vrh nad Idrijo
00050000-5594-fcc1-59f8-96032d0c8147	5262	Črniče
00050000-5594-fcc1-273e-a122bc2e0681	8340	Črnomelj
00050000-5594-fcc1-3e23-8f81c9db809e	6271	Dekani
00050000-5594-fcc1-7f7f-39e8903423f2	5210	Deskle
00050000-5594-fcc1-455a-949f1f72b3ba	2253	Destrnik
00050000-5594-fcc1-4d07-74ca69049c92	6215	Divača
00050000-5594-fcc1-6668-0ad311019d77	1233	Dob
00050000-5594-fcc1-5fc0-a573fbd2b079	3224	Dobje pri Planini
00050000-5594-fcc1-a966-61a6e1533cad	8257	Dobova
00050000-5594-fcc1-5f60-9ec9d14322b4	1423	Dobovec
00050000-5594-fcc1-da65-b279db8fe627	5263	Dobravlje
00050000-5594-fcc1-f09d-d369e3fbbf00	3204	Dobrna
00050000-5594-fcc1-f6bf-8f6d97ec11e7	8211	Dobrnič
00050000-5594-fcc1-c575-986a900eb6dd	1356	Dobrova
00050000-5594-fcc1-de7c-c230d2ddfdd4	9223	Dobrovnik/Dobronak 
00050000-5594-fcc1-7c30-4f0a85523a51	5212	Dobrovo v Brdih
00050000-5594-fcc1-b362-fd865ddf641e	1431	Dol pri Hrastniku
00050000-5594-fcc1-e69a-f79e9451b418	1262	Dol pri Ljubljani
00050000-5594-fcc1-a0e2-f3b680b49bd3	1273	Dole pri Litiji
00050000-5594-fcc1-b8c6-ff24226c5ada	1331	Dolenja vas
00050000-5594-fcc1-5d9c-f6e0a0fd74eb	8350	Dolenjske Toplice
00050000-5594-fcc1-1ef4-dcf8fb4b7b24	1230	Domžale
00050000-5594-fcc1-da00-8616003c18f7	2252	Dornava
00050000-5594-fcc1-d98c-ccb6b3bd142f	5294	Dornberk
00050000-5594-fcc1-45d8-7b618c0509c3	1319	Draga
00050000-5594-fcc1-146c-5267a7ea41e8	8343	Dragatuš
00050000-5594-fcc1-9be3-b10612f8025e	3222	Dramlje
00050000-5594-fcc1-fb9d-3d6ec1d2581f	2370	Dravograd
00050000-5594-fcc1-4755-436d1cc6a2ff	4203	Duplje
00050000-5594-fcc1-dbd4-fddd7ddc7fd1	6221	Dutovlje
00050000-5594-fcc1-9f2b-fcff826456ee	8361	Dvor
00050000-5594-fcc1-1908-780ad402dd42	2343	Fala
00050000-5594-fcc1-f208-645f5979163a	9208	Fokovci
00050000-5594-fcc1-4860-7e81f8d7d0d6	2313	Fram
00050000-5594-fcc1-445d-ed778fc80fdf	3213	Frankolovo
00050000-5594-fcc1-849d-04f8fdbcde1e	1274	Gabrovka
00050000-5594-fcc1-c1d3-659b2507dd9c	8254	Globoko
00050000-5594-fcc1-d7a8-a26701c4b54d	5275	Godovič
00050000-5594-fcc1-62f7-0b51bd1ae6c4	4204	Golnik
00050000-5594-fcc1-ab26-f168811c5828	3303	Gomilsko
00050000-5594-fcc1-343c-671ec02833e4	4224	Gorenja vas
00050000-5594-fcc1-4f6b-b1ad180edabc	3263	Gorica pri Slivnici
00050000-5594-fcc1-91f8-6025672edce7	2272	Gorišnica
00050000-5594-fcc1-3044-9a5c60aaddce	9250	Gornja Radgona
00050000-5594-fcc1-f6a6-7eac86cc8fd6	3342	Gornji Grad
00050000-5594-fcc1-9241-59321905ad46	4282	Gozd Martuljek
00050000-5594-fcc1-20c1-65713a8544c8	6272	Gračišče
00050000-5594-fcc1-fd81-33047656ca01	9264	Grad
00050000-5594-fcc1-d390-66536489610f	8332	Gradac
00050000-5594-fcc1-1104-b3693ad13833	1384	Grahovo
00050000-5594-fcc1-49e5-30412f406ed9	5242	Grahovo ob Bači
00050000-5594-fcc1-3282-ae069d60e6ff	5251	Grgar
00050000-5594-fcc1-6cf7-ad2662434164	3302	Griže
00050000-5594-fcc1-b32e-6fa8096639d5	3231	Grobelno
00050000-5594-fcc1-6217-5ef8a198fca9	1290	Grosuplje
00050000-5594-fcc1-0391-8c77ca83ab9c	2288	Hajdina
00050000-5594-fcc1-3c1c-b4ba969a77c1	8362	Hinje
00050000-5594-fcc1-5a7a-f4ac06a26e1b	2311	Hoče
00050000-5594-fcc1-b874-64bc2dacab17	9205	Hodoš/Hodos
00050000-5594-fcc1-d2da-fd491deb55f7	1354	Horjul
00050000-5594-fcc1-43d6-a34c9f43376c	1372	Hotedršica
00050000-5594-fcc1-62a7-d76a69e1b55d	1430	Hrastnik
00050000-5594-fcc1-ce55-979df076adc2	6225	Hruševje
00050000-5594-fcc1-dd62-67f40bd38543	4276	Hrušica
00050000-5594-fcc1-fef0-4f03d2ee0116	5280	Idrija
00050000-5594-fcc1-155b-702731ad7663	1292	Ig
00050000-5594-fcc1-4b55-014515cad56f	6250	Ilirska Bistrica
00050000-5594-fcc1-575b-df782aafd078	6251	Ilirska Bistrica-Trnovo
00050000-5594-fcc1-95b0-a48ceaad86c4	1295	Ivančna Gorica
00050000-5594-fcc1-6e0f-82370745709f	2259	Ivanjkovci
00050000-5594-fcc1-96e7-b2d5924e065d	1411	Izlake
00050000-5594-fcc1-4d1c-7abc9bd905f3	6310	Izola/Isola
00050000-5594-fcc1-b6ef-81cfb42d418d	2222	Jakobski Dol
00050000-5594-fcc1-f643-733948dd1f6d	2221	Jarenina
00050000-5594-fcc1-c41a-63a4807ad08b	6254	Jelšane
00050000-5594-fcc1-cbfe-ecec6047f947	4270	Jesenice
00050000-5594-fcc1-134b-c3392032b8a6	8261	Jesenice na Dolenjskem
00050000-5594-fcc1-5ef7-70e00a40f3b8	3273	Jurklošter
00050000-5594-fcc1-3cd4-7fd58ffc728b	2223	Jurovski Dol
00050000-5594-fcc1-3c88-b91f48589f3e	2256	Juršinci
00050000-5594-fcc1-c049-af171fa8d9f9	5214	Kal nad Kanalom
00050000-5594-fcc1-9cfd-ca36535c09e9	3233	Kalobje
00050000-5594-fcc1-3e45-f82d8c15575f	4246	Kamna Gorica
00050000-5594-fcc1-34c9-fd8a23cb8d5d	2351	Kamnica
00050000-5594-fcc1-bdc3-0876166440f6	1241	Kamnik
00050000-5594-fcc1-b673-9970e46bdec0	5213	Kanal
00050000-5594-fcc1-4437-683b85be1b27	8258	Kapele
00050000-5594-fcc1-11c5-984806c91a12	2362	Kapla
00050000-5594-fcc1-a5a6-ce251e32c331	2325	Kidričevo
00050000-5594-fcc1-b04a-cf1b64f8752a	1412	Kisovec
00050000-5594-fcc1-de87-bfd399e6582b	6253	Knežak
00050000-5594-fcc1-8d43-d4585c821f21	5222	Kobarid
00050000-5594-fcc1-1712-4f16cbc791f4	9227	Kobilje
00050000-5594-fcc1-e0ba-7cb58bfe7c72	1330	Kočevje
00050000-5594-fcc1-b110-91595f06230a	1338	Kočevska Reka
00050000-5594-fcc1-51ef-63f302be0f27	2276	Kog
00050000-5594-fcc1-1914-9b8edaa9a45e	5211	Kojsko
00050000-5594-fcc1-5d7b-aa32e669dd5a	6223	Komen
00050000-5594-fcc1-07ab-b0e7d134af90	1218	Komenda
00050000-5594-fcc1-ab24-a4331c63afe9	6000	Koper/Capodistria 
00050000-5594-fcc1-7a81-b292e91b9c3e	6001	Koper/Capodistria - poštni predali
00050000-5594-fcc1-24ea-741aed6da57e	8282	Koprivnica
00050000-5594-fcc1-d4de-1b6402fdf2ce	5296	Kostanjevica na Krasu
00050000-5594-fcc1-6784-da927479666d	8311	Kostanjevica na Krki
00050000-5594-fcc1-5381-aeab82ddd9c8	1336	Kostel
00050000-5594-fcc1-cf9e-5d2556cc3e8b	6256	Košana
00050000-5594-fcc1-5928-161d7fc449d1	2394	Kotlje
00050000-5594-fcc1-5988-ec8261c0d5c6	6240	Kozina
00050000-5594-fcc1-9024-cd13ab63296b	3260	Kozje
00050000-5594-fcc1-ce6a-7295904d6a65	4000	Kranj 
00050000-5594-fcc1-0e3a-fc07e5a530b6	4001	Kranj - poštni predali
00050000-5594-fcc1-a226-ac2f8b27adb9	4280	Kranjska Gora
00050000-5594-fcc1-83f2-9e5e35889c3f	1281	Kresnice
00050000-5594-fcc1-aa35-f67211cb5e7b	4294	Križe
00050000-5594-fcc1-f94a-72f41dbb241c	9206	Križevci
00050000-5594-fcc1-0975-0c0bd869138b	9242	Križevci pri Ljutomeru
00050000-5594-fcc1-02d2-550e2cc9188a	1301	Krka
00050000-5594-fcc1-626c-6521df6a75c8	8296	Krmelj
00050000-5594-fcc1-10ee-bceca8f4dc5d	4245	Kropa
00050000-5594-fcc1-8c83-01731d71de1d	8262	Krška vas
00050000-5594-fcc1-21e5-f751152a7cc8	8270	Krško
00050000-5594-fcc1-2a3d-b2225e58e9f1	9263	Kuzma
00050000-5594-fcc1-9d1c-eae66c98c952	2318	Laporje
00050000-5594-fcc1-3cd8-6b54ccaaeeab	3270	Laško
00050000-5594-fcc1-a997-0f6ff1590fe0	1219	Laze v Tuhinju
00050000-5594-fcc1-b0ac-d36dcfacb9e1	2230	Lenart v Slovenskih goricah
00050000-5594-fcc1-d618-7e6501a55cef	9220	Lendava/Lendva
00050000-5594-fcc1-7a73-edbf878d108b	4248	Lesce
00050000-5594-fcc1-4598-59626d299c36	3261	Lesično
00050000-5594-fcc1-6f87-fa55db81318e	8273	Leskovec pri Krškem
00050000-5594-fcc1-d1f7-563c279c386c	2372	Libeliče
00050000-5594-fcc1-d162-c4ae76ea6a79	2341	Limbuš
00050000-5594-fcc1-2676-686515e8103b	1270	Litija
00050000-5594-fcc1-be1f-e8606012d2bc	3202	Ljubečna
00050000-5594-fcc1-86dd-776f91ce8493	1000	Ljubljana 
00050000-5594-fcc1-202e-ba02ccbc8ecc	1001	Ljubljana - poštni predali
00050000-5594-fcc1-ca24-7507d18a88ba	1231	Ljubljana - Črnuče
00050000-5594-fcc1-e7a6-09e4131363c3	1261	Ljubljana - Dobrunje
00050000-5594-fcc1-cbf2-6357daae0ef4	1260	Ljubljana - Polje
00050000-5594-fcc1-5e54-d0d10fbffe8f	1210	Ljubljana - Šentvid
00050000-5594-fcc1-282e-3efdffc4bf5d	1211	Ljubljana - Šmartno
00050000-5594-fcc1-466e-fd9dc3f8de5e	3333	Ljubno ob Savinji
00050000-5594-fcc1-c58e-71d1342439d8	9240	Ljutomer
00050000-5594-fcc1-0aab-d4a882ca34d0	3215	Loče
00050000-5594-fcc1-7c06-5d49a9852ff4	5231	Log pod Mangartom
00050000-5594-fcc1-a1f7-474a6057c904	1358	Log pri Brezovici
00050000-5594-fcc1-5a0a-f062cfe82748	1370	Logatec
00050000-5594-fcc1-c3f5-c25aac08ae68	1371	Logatec
00050000-5594-fcc1-8ff1-bbac678b72b3	1434	Loka pri Zidanem Mostu
00050000-5594-fcc1-1eeb-8041ad3e7099	3223	Loka pri Žusmu
00050000-5594-fcc1-df2d-f89add6137b9	6219	Lokev
00050000-5594-fcc1-b3b1-71254773511a	1318	Loški Potok
00050000-5594-fcc1-03ad-a01dde39634d	2324	Lovrenc na Dravskem polju
00050000-5594-fcc1-ab8e-9ab055b6c6ec	2344	Lovrenc na Pohorju
00050000-5594-fcc1-d3e4-2005cc860c67	3334	Luče
00050000-5594-fcc1-3a31-e89117c48c4c	1225	Lukovica
00050000-5594-fcc1-203b-de6d0de88fd2	9202	Mačkovci
00050000-5594-fcc1-016d-1307f7bef8ed	2322	Majšperk
00050000-5594-fcc1-7275-c144c40d98ff	2321	Makole
00050000-5594-fcc1-f18a-c1b08f5a1c3a	9243	Mala Nedelja
00050000-5594-fcc1-c694-2e5f87e7a1d9	2229	Malečnik
00050000-5594-fcc1-1ebf-32815d9dff28	6273	Marezige
00050000-5594-fcc1-32ea-13ee2c16e1c9	2000	Maribor 
00050000-5594-fcc1-cd9d-deded42078b5	2001	Maribor - poštni predali
00050000-5594-fcc1-fffe-80db9d5126f8	2206	Marjeta na Dravskem polju
00050000-5594-fcc1-c4ad-6fa5dd22a977	2281	Markovci
00050000-5594-fcc1-4324-e209f86ebee7	9221	Martjanci
00050000-5594-fcc1-c335-03c78a4c0938	6242	Materija
00050000-5594-fcc1-84b7-e3bc373884cf	4211	Mavčiče
00050000-5594-fcc1-8bdf-c382efe16468	1215	Medvode
00050000-5594-fcc1-a8c9-dcb06105d277	1234	Mengeš
00050000-5594-fcc1-5c3d-fec796095ac2	8330	Metlika
00050000-5594-fcc1-19cb-27eee0afeac0	2392	Mežica
00050000-5594-fcc1-bc6c-c561a47333c7	2204	Miklavž na Dravskem polju
00050000-5594-fcc1-3d23-9da8f1ff98a4	2275	Miklavž pri Ormožu
00050000-5594-fcc1-7243-cb6fc6ed078f	5291	Miren
00050000-5594-fcc1-4025-e7f4e12feb3f	8233	Mirna
00050000-5594-fcc1-5f8b-4102ad36f1f4	8216	Mirna Peč
00050000-5594-fcc1-0516-b31014dbcc39	2382	Mislinja
00050000-5594-fcc1-f3cd-fac41383ff2f	4281	Mojstrana
00050000-5594-fcc1-7e29-84865e8f2cd6	8230	Mokronog
00050000-5594-fcc1-0ffc-4772514fb1a8	1251	Moravče
00050000-5594-fcc1-f823-ff47ed1eef10	9226	Moravske Toplice
00050000-5594-fcc1-678b-bb0a933db474	5216	Most na Soči
00050000-5594-fcc1-2aa8-086b369210cc	1221	Motnik
00050000-5594-fcc1-68ac-9e8aefe878b7	3330	Mozirje
00050000-5594-fcc1-4543-6837b045fc37	9000	Murska Sobota 
00050000-5594-fcc1-5ce0-71d88913d915	9001	Murska Sobota - poštni predali
00050000-5594-fcc1-760b-35d8aed7a39a	2366	Muta
00050000-5594-fcc1-b378-adab72b2b703	4202	Naklo
00050000-5594-fcc1-8744-a1a851e7fe2e	3331	Nazarje
00050000-5594-fcc1-f7f3-9249c4c096b5	1357	Notranje Gorice
00050000-5594-fcc1-9831-84d7730e739c	3203	Nova Cerkev
00050000-5594-fcc1-de5e-6779b37d2570	5000	Nova Gorica 
00050000-5594-fcc1-e263-2348ee27921e	5001	Nova Gorica - poštni predali
00050000-5594-fcc1-6736-1476242180ff	1385	Nova vas
00050000-5594-fcc1-e275-235119bca8bf	8000	Novo mesto
00050000-5594-fcc1-7629-99057785240e	8001	Novo mesto - poštni predali
00050000-5594-fcc1-5e56-829aca5eef46	6243	Obrov
00050000-5594-fcc1-9387-0a0900a31706	9233	Odranci
00050000-5594-fcc1-c8c0-d44154e2f549	2317	Oplotnica
00050000-5594-fcc1-30b2-e6fee26accc2	2312	Orehova vas
00050000-5594-fcc1-9db4-272149f5485c	2270	Ormož
00050000-5594-fcc1-98ab-0342796f9535	1316	Ortnek
00050000-5594-fcc1-aa4d-c06d74a2499a	1337	Osilnica
00050000-5594-fcc1-394a-f85fd480b106	8222	Otočec
00050000-5594-fcc1-820d-40d5ab02b8b0	2361	Ožbalt
00050000-5594-fcc1-725b-06fdf8207e53	2231	Pernica
00050000-5594-fcc1-c995-a13249cf1693	2211	Pesnica pri Mariboru
00050000-5594-fcc1-e599-ec469a4e08d7	9203	Petrovci
00050000-5594-fcc1-e7b5-b28d0f651c98	3301	Petrovče
00050000-5594-fcc1-dd2e-79586a987463	6330	Piran/Pirano
00050000-5594-fcc1-f9bd-78e5fc28675c	8255	Pišece
00050000-5594-fcc1-b4f0-c9d34a8b61d4	6257	Pivka
00050000-5594-fcc1-ad50-985fb68a968d	6232	Planina
00050000-5594-fcc1-3014-11e2a05867e2	3225	Planina pri Sevnici
00050000-5594-fcc1-8b4a-fa615b167b0a	6276	Pobegi
00050000-5594-fcc1-86ff-9a330dab6abc	8312	Podbočje
00050000-5594-fcc1-5ed6-6fc4853001f5	5243	Podbrdo
00050000-5594-fcc1-096c-aad37d29249b	3254	Podčetrtek
00050000-5594-fcc1-0b81-1dc6e8f4cb86	2273	Podgorci
00050000-5594-fcc1-e5e8-27b671d586ff	6216	Podgorje
00050000-5594-fcc1-5379-e32c8b9865ae	2381	Podgorje pri Slovenj Gradcu
00050000-5594-fcc1-bbe4-c441fe0af3ab	6244	Podgrad
00050000-5594-fcc1-38b5-bc3138bddb0e	1414	Podkum
00050000-5594-fcc1-543e-8b5f88968092	2286	Podlehnik
00050000-5594-fcc1-ff4f-5d69b0a3414c	5272	Podnanos
00050000-5594-fcc1-f3a1-e624ffe950d7	4244	Podnart
00050000-5594-fcc1-4ae0-f6dfc2ef6d52	3241	Podplat
00050000-5594-fcc1-0e9d-750886aa4335	3257	Podsreda
00050000-5594-fcc1-5f55-53c04c1bd965	2363	Podvelka
00050000-5594-fcc1-64b2-486b7dbb7e74	2208	Pohorje
00050000-5594-fcc1-707d-a3779de4a072	2257	Polenšak
00050000-5594-fcc1-d125-d6bcf83a8e7a	1355	Polhov Gradec
00050000-5594-fcc1-9fa6-fab1ecfb6042	4223	Poljane nad Škofjo Loko
00050000-5594-fcc1-780a-4ebb1c42967a	2319	Poljčane
00050000-5594-fcc1-08b1-bda1a32e7978	1272	Polšnik
00050000-5594-fcc1-2877-982d0766b4d1	3313	Polzela
00050000-5594-fcc1-2f41-d38871fc423f	3232	Ponikva
00050000-5594-fcc1-5fb9-f84d741de1a9	6320	Portorož/Portorose
00050000-5594-fcc1-7f09-4ad55589a5fe	6230	Postojna
00050000-5594-fcc1-6037-8febd9d36ff7	2331	Pragersko
00050000-5594-fcc1-28a7-623e9ab04a99	3312	Prebold
00050000-5594-fcc1-3099-604c175c35ec	4205	Preddvor
00050000-5594-fcc1-082c-05ae58f3ab9c	6255	Prem
00050000-5594-fcc1-2e8f-0b29bf1a2859	1352	Preserje
00050000-5594-fcc1-20fa-96b4a62e2b67	6258	Prestranek
00050000-5594-fcc1-b564-00b3f4159898	2391	Prevalje
00050000-5594-fcc1-03a1-009c2d19cb0d	3262	Prevorje
00050000-5594-fcc1-8298-4471915e3c3c	1276	Primskovo 
00050000-5594-fcc1-6686-7c7f9c0fe3e1	3253	Pristava pri Mestinju
00050000-5594-fcc1-efe5-34efd26acdfa	9207	Prosenjakovci/Partosfalva
00050000-5594-fcc1-4877-a589e406f076	5297	Prvačina
00050000-5594-fcc1-9094-a0b2c9913c02	2250	Ptuj
00050000-5594-fcc1-f73e-0502de0d6fa9	2323	Ptujska Gora
00050000-5594-fcc1-e1be-05a220c16771	9201	Puconci
00050000-5594-fcc1-7f20-9b3a08402482	2327	Rače
00050000-5594-fcc1-035f-cad5c1ac5fe6	1433	Radeče
00050000-5594-fcc1-3f0e-bcc715edb8f5	9252	Radenci
00050000-5594-fcc1-e1ed-2e37d5a41007	2360	Radlje ob Dravi
00050000-5594-fcc1-7e35-695762a2c921	1235	Radomlje
00050000-5594-fcc1-9e98-4272f0d86437	4240	Radovljica
00050000-5594-fcc1-c7f8-193351702926	8274	Raka
00050000-5594-fcc1-624e-b0f52bc85030	1381	Rakek
00050000-5594-fcc1-3f2a-e9cabdd7bd71	4283	Rateče - Planica
00050000-5594-fcc1-2b9e-e7eab99e6db9	2390	Ravne na Koroškem
00050000-5594-fcc1-76ba-a25246e1cdd1	9246	Razkrižje
00050000-5594-fcc1-6fed-dcf7302a6815	3332	Rečica ob Savinji
00050000-5594-fcc1-4214-43c8dc99bc03	5292	Renče
00050000-5594-fcc1-6027-84023e39dfd9	1310	Ribnica
00050000-5594-fcc1-84e7-9a7438903dcb	2364	Ribnica na Pohorju
00050000-5594-fcc1-82c8-7ad113e81ad3	3272	Rimske Toplice
00050000-5594-fcc1-f7d2-1094efccafcc	1314	Rob
00050000-5594-fcc1-fbfc-8fe7000ede95	5215	Ročinj
00050000-5594-fcc1-6730-848368edc9b9	3250	Rogaška Slatina
00050000-5594-fcc1-02d6-973c763fa82c	9262	Rogašovci
00050000-5594-fcc1-b901-eba4c76e15b6	3252	Rogatec
00050000-5594-fcc1-e1b6-2960bffc9a8c	1373	Rovte
00050000-5594-fcc1-f285-1f06fa6d4c90	2342	Ruše
00050000-5594-fcc1-e8bd-e44f53e28e28	1282	Sava
00050000-5594-fcc1-0bcc-b0e7fa60aa43	6333	Sečovlje/Sicciole
00050000-5594-fcc1-7f5f-39c854f8b032	4227	Selca
00050000-5594-fcc1-eb9c-4ec03185242d	2352	Selnica ob Dravi
00050000-5594-fcc1-e308-59a8d8f68ebd	8333	Semič
00050000-5594-fcc1-4203-88a29e73a875	8281	Senovo
00050000-5594-fcc1-b313-8bbd73e30375	6224	Senožeče
00050000-5594-fcc1-22a1-4d0ba0e4b271	8290	Sevnica
00050000-5594-fcc1-7e06-a6ecddfff18e	6210	Sežana
00050000-5594-fcc1-aff4-87fbbaeac3cc	2214	Sladki Vrh
00050000-5594-fcc1-b197-c4b284a3361f	5283	Slap ob Idrijci
00050000-5594-fcc1-946d-0e3238e3282e	2380	Slovenj Gradec
00050000-5594-fcc1-265a-38659514c82a	2310	Slovenska Bistrica
00050000-5594-fcc1-67c3-b7b917375b92	3210	Slovenske Konjice
00050000-5594-fcc1-81d9-b1e247cdc88b	1216	Smlednik
00050000-5594-fcc1-8492-ad44e51263cd	5232	Soča
00050000-5594-fcc1-f72e-86270507c70c	1317	Sodražica
00050000-5594-fcc1-5e69-3eb85ca928f8	3335	Solčava
00050000-5594-fcc1-6b9e-01064001dc89	5250	Solkan
00050000-5594-fcc1-d752-1e818039a05b	4229	Sorica
00050000-5594-fcc1-f71c-94c1ebb4ef55	4225	Sovodenj
00050000-5594-fcc1-fa20-d483514d683b	5281	Spodnja Idrija
00050000-5594-fcc1-2a22-a020b2287d60	2241	Spodnji Duplek
00050000-5594-fcc1-a7a8-7084a0052e1c	9245	Spodnji Ivanjci
00050000-5594-fcc1-7252-abef45bba081	2277	Središče ob Dravi
00050000-5594-fcc1-3e50-29cedd093488	4267	Srednja vas v Bohinju
00050000-5594-fcc1-9ae6-e39abb6b319d	8256	Sromlje 
00050000-5594-fcc1-bec5-ecfc0bcd0a1c	5224	Srpenica
00050000-5594-fcc1-56e4-a04af135a57f	1242	Stahovica
00050000-5594-fcc1-5743-c66b31a90abd	1332	Stara Cerkev
00050000-5594-fcc1-e5e8-bf9d72622ebc	8342	Stari trg ob Kolpi
00050000-5594-fcc1-65cb-7be356996deb	1386	Stari trg pri Ložu
00050000-5594-fcc1-916c-3e119bb057b4	2205	Starše
00050000-5594-fcc1-eb00-25db55b9b5a0	2289	Stoperce
00050000-5594-fcc1-7392-c2aba8b5e2cd	8322	Stopiče
00050000-5594-fcc1-c5ea-b20d88b5dc34	3206	Stranice
00050000-5594-fcc1-b9b1-b58c4afcba39	8351	Straža
00050000-5594-fcc1-2124-89821150c0f2	1313	Struge
00050000-5594-fcc1-1222-094a35485917	8293	Studenec
00050000-5594-fcc1-6cd6-f9bf48e6fba7	8331	Suhor
00050000-5594-fcc1-24f8-daeecf2b550a	2233	Sv. Ana v Slovenskih goricah
00050000-5594-fcc1-ed33-d37f9c0e89ee	2235	Sv. Trojica v Slovenskih goricah
00050000-5594-fcc1-91f9-aa81226b5aff	2353	Sveti Duh na Ostrem Vrhu
00050000-5594-fcc1-4d07-addca1473d25	9244	Sveti Jurij ob Ščavnici
00050000-5594-fcc1-1f1e-9b265cb89e59	3264	Sveti Štefan
00050000-5594-fcc1-6bee-58973d2d7a99	2258	Sveti Tomaž
00050000-5594-fcc1-572b-975a9a5b7c8c	9204	Šalovci
00050000-5594-fcc1-6354-d7281835e954	5261	Šempas
00050000-5594-fcc1-52f1-7a109acceb81	5290	Šempeter pri Gorici
00050000-5594-fcc1-7915-8b863029111f	3311	Šempeter v Savinjski dolini
00050000-5594-fcc1-0fca-dd8d65a864ac	4208	Šenčur
00050000-5594-fcc1-272a-de836addc615	2212	Šentilj v Slovenskih goricah
00050000-5594-fcc1-58d0-abb7fb1217c6	8297	Šentjanž
00050000-5594-fcc1-c74b-976274dc18f7	2373	Šentjanž pri Dravogradu
00050000-5594-fcc1-3e70-5d703be531f8	8310	Šentjernej
00050000-5594-fcc1-2745-53ba2df396f4	3230	Šentjur
00050000-5594-fcc1-bb93-fc0c6eebf632	3271	Šentrupert
00050000-5594-fcc1-3b31-d2ce433f1c9c	8232	Šentrupert
00050000-5594-fcc1-4000-69b655eadfc5	1296	Šentvid pri Stični
00050000-5594-fcc1-e765-49c375ef4419	8275	Škocjan
00050000-5594-fcc1-f5ae-419def48cd6e	6281	Škofije
00050000-5594-fcc1-ac1d-02328a78c9e8	4220	Škofja Loka
00050000-5594-fcc1-c54f-c083580cd3c7	3211	Škofja vas
00050000-5594-fcc1-754b-2783c7ebc73a	1291	Škofljica
00050000-5594-fcc1-928b-1ba9e137da27	6274	Šmarje
00050000-5594-fcc1-8bd6-b2f65f0ea814	1293	Šmarje - Sap
00050000-5594-fcc1-017e-828db179550d	3240	Šmarje pri Jelšah
00050000-5594-fcc1-7d01-16f5c9554b0c	8220	Šmarješke Toplice
00050000-5594-fcc1-fd2f-c6886baaa2ba	2315	Šmartno na Pohorju
00050000-5594-fcc1-8d49-5c35e8e4fce7	3341	Šmartno ob Dreti
00050000-5594-fcc1-6a4f-09f8498d48a7	3327	Šmartno ob Paki
00050000-5594-fcc1-1d0f-837867b6110c	1275	Šmartno pri Litiji
00050000-5594-fcc1-d83c-569ee70710d4	2383	Šmartno pri Slovenj Gradcu
00050000-5594-fcc1-5bea-ea3c49bb0409	3201	Šmartno v Rožni dolini
00050000-5594-fcc1-a77b-a222384e8034	3325	Šoštanj
00050000-5594-fcc1-b5ff-f8422c1c1dc3	6222	Štanjel
00050000-5594-fcc1-11b8-41cc606d0eb6	3220	Štore
00050000-5594-fcc1-bcd7-bb566de90850	3304	Tabor
00050000-5594-fcc1-f3f5-4fa60dd1bf62	3221	Teharje
00050000-5594-fcc1-9572-a14826e5c993	9251	Tišina
00050000-5594-fcc1-24bd-7f9ecc2abad1	5220	Tolmin
00050000-5594-fcc1-9f64-ec37d368e444	3326	Topolšica
00050000-5594-fcc1-0305-66dc2836f72d	2371	Trbonje
00050000-5594-fcc1-3ca8-fdff75c155a7	1420	Trbovlje
00050000-5594-fcc1-c904-0053113e2193	8231	Trebelno 
00050000-5594-fcc1-8c71-ded10d3ed5b6	8210	Trebnje
00050000-5594-fcc1-5743-09cebc0f846f	5252	Trnovo pri Gorici
00050000-5594-fcc1-9314-de90ff4bcb67	2254	Trnovska vas
00050000-5594-fcc1-928d-6485e7ae582b	1222	Trojane
00050000-5594-fcc1-fcc0-c564235e38c3	1236	Trzin
00050000-5594-fcc1-d3a4-012939d2ca4d	4290	Tržič
00050000-5594-fcc1-4edd-e535f2f93aa0	8295	Tržišče
00050000-5594-fcc1-f2aa-27f6c551e383	1311	Turjak
00050000-5594-fcc1-eefb-ad2cee6afcfe	9224	Turnišče
00050000-5594-fcc1-70d6-74530d5d5c72	8323	Uršna sela
00050000-5594-fcc1-70f1-066d0a169b3c	1252	Vače
00050000-5594-fcc1-d359-c3df8fda6321	3320	Velenje 
00050000-5594-fcc1-717c-35b51a9bb20a	3322	Velenje - poštni predali
00050000-5594-fcc1-936a-38fd57f04211	8212	Velika Loka
00050000-5594-fcc1-4280-4cd85566d24c	2274	Velika Nedelja
00050000-5594-fcc1-4f66-57c8caebd8d0	9225	Velika Polana
00050000-5594-fcc1-b8ae-67850fb2887a	1315	Velike Lašče
00050000-5594-fcc1-40a8-5b68dec5e0b4	8213	Veliki Gaber
00050000-5594-fcc1-5325-f6f56dbc55f8	9241	Veržej
00050000-5594-fcc1-8939-cb3c2ee3f2c0	1312	Videm - Dobrepolje
00050000-5594-fcc1-290b-95f207b3ff6b	2284	Videm pri Ptuju
00050000-5594-fcc1-5917-4815ab8d9345	8344	Vinica
00050000-5594-fcc1-2e28-8b4ba182b9dc	5271	Vipava
00050000-5594-fcc1-7b2c-6733e906c16f	4212	Visoko
00050000-5594-fcc1-f04b-f5d12e04e9d8	1294	Višnja Gora
00050000-5594-fcc1-7050-1abf5a7ca3c9	3205	Vitanje
00050000-5594-fcc1-3642-27400e39a007	2255	Vitomarci
00050000-5594-fcc1-544d-1090a6e1f588	1217	Vodice
00050000-5594-fcc1-2236-372206ef6285	3212	Vojnik\t
00050000-5594-fcc1-0682-25d7e5085f0b	5293	Volčja Draga
00050000-5594-fcc1-9691-d11cee6b922f	2232	Voličina
00050000-5594-fcc1-9367-bb055ac73a0d	3305	Vransko
00050000-5594-fcc1-c812-afdc613180dd	6217	Vremski Britof
00050000-5594-fcc1-1a87-9cf3cfd808d5	1360	Vrhnika
00050000-5594-fcc1-4105-f97141d32938	2365	Vuhred
00050000-5594-fcc1-852b-ad8134f1bd23	2367	Vuzenica
00050000-5594-fcc1-4a30-a539d4c43d7f	8292	Zabukovje 
00050000-5594-fcc1-3056-eb6e80095cf6	1410	Zagorje ob Savi
00050000-5594-fcc1-2136-1d140e0dd791	1303	Zagradec
00050000-5594-fcc1-e629-b5bf9745b3c1	2283	Zavrč
00050000-5594-fcc1-2d09-d966fe53fa12	8272	Zdole 
00050000-5594-fcc1-bf89-cdb2bfa74313	4201	Zgornja Besnica
00050000-5594-fcc1-b453-71315e265051	2242	Zgornja Korena
00050000-5594-fcc1-0cfe-42f4f3736671	2201	Zgornja Kungota
00050000-5594-fcc1-72bb-9330ed31194a	2316	Zgornja Ložnica
00050000-5594-fcc1-a039-c64b26f0ee47	2314	Zgornja Polskava
00050000-5594-fcc1-773f-f578223d5d09	2213	Zgornja Velka
00050000-5594-fcc1-aeb4-bb958245144c	4247	Zgornje Gorje
00050000-5594-fcc1-ff34-d15b8b9f917a	4206	Zgornje Jezersko
00050000-5594-fcc1-5825-6862098c2647	2285	Zgornji Leskovec
00050000-5594-fcc1-5990-48668f99693f	1432	Zidani Most
00050000-5594-fcc1-9c04-f7642442bbeb	3214	Zreče
00050000-5594-fcc1-4708-e83f7fa661f3	4209	Žabnica
00050000-5594-fcc1-8b08-3c2d7e776414	3310	Žalec
00050000-5594-fcc1-f603-095999cc0ef5	4228	Železniki
00050000-5594-fcc1-ca78-90585e2bee59	2287	Žetale
00050000-5594-fcc1-232b-aa69b5e37deb	4226	Žiri
00050000-5594-fcc1-2fec-9c167349dae0	4274	Žirovnica
00050000-5594-fcc1-cb65-490aa0de713b	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8816428)
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
-- TOC entry 2859 (class 0 OID 8816239)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8816317)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8816440)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8816560)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8816609)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5594-fcc2-0c72-03df7c21ea74	00080000-5594-fcc2-7b2f-109a3f56277a	0900	AK
00190000-5594-fcc2-59dd-211bf7ff78e5	00080000-5594-fcc2-ba6b-f6a886bac5fa	0987	A
00190000-5594-fcc2-a32d-4fec0be43a9c	00080000-5594-fcc2-6980-c8677017bcfb	0989	A
00190000-5594-fcc2-99ca-913a6b494ed8	00080000-5594-fcc2-7f71-58e59cd2a412	0986	A
00190000-5594-fcc2-b3d8-6e7bbb2a42a4	00080000-5594-fcc2-bce7-0eabbf6c3633	0984	A
00190000-5594-fcc2-1205-4507d589279c	00080000-5594-fcc2-e5fc-050a4584d793	0983	A
00190000-5594-fcc2-5a77-57bada47502a	00080000-5594-fcc2-a714-72d65070b922	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8816743)
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
-- TOC entry 2883 (class 0 OID 8816469)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5594-fcc2-33d5-cdf4bf2dcc03	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5594-fcc2-4d86-25168c92ce42	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5594-fcc2-7cba-e35edc420795	0003	Kazinska	t	84	Kazinska dvorana
00220000-5594-fcc2-7c99-17925ec1daae	0004	Mali oder	t	24	Mali oder 
00220000-5594-fcc2-0674-4686b8601f74	0005	Komorni oder	t	15	Komorni oder
00220000-5594-fcc2-e294-46795d131b16	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5594-fcc2-3620-0359e51b8623	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8816413)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8816403)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8816598)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8816537)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8816111)
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
-- TOC entry 2884 (class 0 OID 8816479)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8816149)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5594-fcc0-4d92-5dcf524bf5ee	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5594-fcc0-874d-fe9cf82bb370	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5594-fcc0-d4df-d9da7ea98060	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5594-fcc0-a714-59bc8e69be23	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5594-fcc0-c85e-d85f3e7c035e	planer	Planer dogodkov v koledarju	t
00020000-5594-fcc0-48eb-1c20cde67e85	kadrovska	Kadrovska služba	t
00020000-5594-fcc0-f3a6-6e3bac5d13e5	arhivar	Ažuriranje arhivalij	t
00020000-5594-fcc0-569b-b4a9a25bafbe	igralec	Igralec	t
00020000-5594-fcc0-96a4-61eb6836275f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5594-fcc2-aa37-006581d4ea5c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8816133)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5594-fcc1-390c-acb84b073109	00020000-5594-fcc0-d4df-d9da7ea98060
00010000-5594-fcc1-fcbf-9f094419cc1d	00020000-5594-fcc0-d4df-d9da7ea98060
00010000-5594-fcc2-c2d2-fc77c30fadb3	00020000-5594-fcc2-aa37-006581d4ea5c
\.


--
-- TOC entry 2886 (class 0 OID 8816493)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8816434)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8816384)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8816793)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5594-fcc1-8401-accdb3c798c1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5594-fcc1-c8d0-4beee2d69735	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5594-fcc1-50c7-c8e8448bd0c0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5594-fcc1-9826-18acedad9d5b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5594-fcc1-11ea-824d862d0a5d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8816785)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5594-fcc1-ab86-32898ba64798	00230000-5594-fcc1-9826-18acedad9d5b	popa
00240000-5594-fcc1-d245-25520e167952	00230000-5594-fcc1-9826-18acedad9d5b	oseba
00240000-5594-fcc1-1dfd-04b25c72431f	00230000-5594-fcc1-c8d0-4beee2d69735	prostor
00240000-5594-fcc1-c3a6-fbbdd2b1b6f7	00230000-5594-fcc1-9826-18acedad9d5b	besedilo
00240000-5594-fcc1-bdef-2adc000f46c6	00230000-5594-fcc1-9826-18acedad9d5b	uprizoritev
00240000-5594-fcc1-be84-4358c6482bbd	00230000-5594-fcc1-9826-18acedad9d5b	funkcija
00240000-5594-fcc1-e264-b3b02d1558bc	00230000-5594-fcc1-9826-18acedad9d5b	tipfunkcije
00240000-5594-fcc1-c506-5de78cfb64ee	00230000-5594-fcc1-9826-18acedad9d5b	alternacija
00240000-5594-fcc1-c5da-ee0ba3b1a1f2	00230000-5594-fcc1-8401-accdb3c798c1	pogodba
00240000-5594-fcc1-cb3b-cd0a3a6a8f6d	00230000-5594-fcc1-9826-18acedad9d5b	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8816780)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8816547)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5594-fcc2-6217-ab82bd0a7176	000e0000-5594-fcc2-b3c9-ebe4e264f812	00080000-5594-fcc2-4a67-44734e6eda5e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5594-fcc2-faf9-c4722558a74f	000e0000-5594-fcc2-b3c9-ebe4e264f812	00080000-5594-fcc2-4a67-44734e6eda5e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5594-fcc2-9293-2033cd5d6d08	000e0000-5594-fcc2-b3c9-ebe4e264f812	00080000-5594-fcc2-a23b-05b3871a4a4c	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8816211)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8816390)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5594-fcc2-a8e6-7d46319d2e7f	00180000-5594-fcc2-fda7-403f57ba6b5b	000c0000-5594-fcc2-b49f-e9c6a999ff13	00090000-5594-fcc2-8b23-262783c96a77	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-fcc2-9626-aa4f08f3c554	00180000-5594-fcc2-fda7-403f57ba6b5b	000c0000-5594-fcc2-961d-73328419ecb7	00090000-5594-fcc2-cb97-36e07b2f5ae2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-fcc2-8946-18b4d095a043	00180000-5594-fcc2-fda7-403f57ba6b5b	000c0000-5594-fcc2-0d33-aa1baf4f0b7b	00090000-5594-fcc2-b361-f7ef471b2dad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-fcc2-d6e4-3e1786f43dff	00180000-5594-fcc2-fda7-403f57ba6b5b	000c0000-5594-fcc2-badd-3908dcb1e5b1	00090000-5594-fcc2-6046-73f18d9a7da2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-fcc2-9a5a-294e8529600c	00180000-5594-fcc2-fda7-403f57ba6b5b	000c0000-5594-fcc2-15e5-75223cc9898f	00090000-5594-fcc2-c6f4-f970c6fbae87	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-fcc2-5ba0-2a8f3b41e2bd	00180000-5594-fcc2-3b86-63003d374945	\N	00090000-5594-fcc2-c6f4-f970c6fbae87	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8816587)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5594-fcc1-42d2-c130b73a71e5	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5594-fcc1-1a98-18a17693db0f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5594-fcc1-daad-7a3573e035f9	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5594-fcc1-8986-ff93d94823b1	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5594-fcc1-c0fd-9471395c5a5d	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5594-fcc1-4cd1-1210169398c6	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5594-fcc1-a591-85af4645f946	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5594-fcc1-bc89-fb78902ad4ac	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5594-fcc1-a74c-25689ba22e7d	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5594-fcc1-1fee-70ca654e399f	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5594-fcc1-f9c9-90384b790c1a	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5594-fcc1-61f2-832847424088	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5594-fcc1-b57a-ed0c857d6241	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5594-fcc1-8673-60a24137ba68	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5594-fcc1-2548-8b41ddb0d2ae	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5594-fcc1-5052-15563c0e9c18	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8816762)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5594-fcc1-7cea-13483b28c9dd	01	Velika predstava	f	1.00	1.00
002b0000-5594-fcc1-a8ff-bd85c8a2f0ac	02	Mala predstava	f	0.50	0.50
002b0000-5594-fcc1-909a-dbd3ee76e51e	03	Mala koprodukcija	t	0.40	1.00
002b0000-5594-fcc1-a632-56aeed762d67	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5594-fcc1-5802-7af1b49c9e21	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8816274)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8816120)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5594-fcc1-fcbf-9f094419cc1d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROyYPBqcZGHwkaZSr3Sp7SjhzpbtwxvEy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-6fee-acfc00803728	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-57f1-2c4aa0709ff3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-72fe-eb800b09ebdb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-5b6c-6f339367fbb4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-1427-6577e97b0ff6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-d837-5f5783f1460d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-767c-3acd44e38b25	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-4e40-6b995c4bfc4d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-2d4d-0636893b61bb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5594-fcc2-c2d2-fc77c30fadb3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5594-fcc1-390c-acb84b073109	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8816644)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5594-fcc2-e627-2567d4e3b5d3	00160000-5594-fcc2-d53c-14a9f8d2afd5	00150000-5594-fcc1-0899-495ebc92151d	00140000-5594-fcc0-793b-0638564a1ddc	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5594-fcc2-0674-4686b8601f74
000e0000-5594-fcc2-b3c9-ebe4e264f812	00160000-5594-fcc2-d862-51b7f8ec641c	00150000-5594-fcc1-186e-3c46b6fa3a78	00140000-5594-fcc0-2bd7-fda4d49b359b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5594-fcc2-e294-46795d131b16
000e0000-5594-fcc2-3343-3d30112b625d	\N	00150000-5594-fcc1-186e-3c46b6fa3a78	00140000-5594-fcc0-2bd7-fda4d49b359b	00190000-5594-fcc2-59dd-211bf7ff78e5	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5594-fcc2-0674-4686b8601f74
000e0000-5594-fcc2-588e-55aa9b90e37f	\N	00150000-5594-fcc1-186e-3c46b6fa3a78	00140000-5594-fcc0-2bd7-fda4d49b359b	00190000-5594-fcc2-59dd-211bf7ff78e5	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5594-fcc2-0674-4686b8601f74
000e0000-5594-fcc2-9301-07b1e9f799fb	\N	00150000-5594-fcc1-186e-3c46b6fa3a78	00140000-5594-fcc0-2bd7-fda4d49b359b	00190000-5594-fcc2-59dd-211bf7ff78e5	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5594-fcc2-33d5-cdf4bf2dcc03
\.


--
-- TOC entry 2867 (class 0 OID 8816336)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5594-fcc2-dc7b-eb36a7861ae0	000e0000-5594-fcc2-b3c9-ebe4e264f812	1	
00200000-5594-fcc2-4804-b392f104e8b6	000e0000-5594-fcc2-b3c9-ebe4e264f812	2	
\.


--
-- TOC entry 2882 (class 0 OID 8816461)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8816530)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8816368)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8816634)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5594-fcc0-793b-0638564a1ddc	01	Drama	drama (SURS 01)
00140000-5594-fcc0-c5a8-5bd90b0620fd	02	Opera	opera (SURS 02)
00140000-5594-fcc0-817b-b064c4fe2f5f	03	Balet	balet (SURS 03)
00140000-5594-fcc0-e139-fc05750791a8	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5594-fcc0-22a7-9bacc46cf520	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5594-fcc0-2bd7-fda4d49b359b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5594-fcc0-4f65-7d338d67de46	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8816520)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5594-fcc1-f7ab-02393f0013ed	01	Opera	opera
00150000-5594-fcc1-47f1-8b7f455574a5	02	Opereta	opereta
00150000-5594-fcc1-0f37-7c32eee44298	03	Balet	balet
00150000-5594-fcc1-cb8b-5cd840a217d1	04	Plesne prireditve	plesne prireditve
00150000-5594-fcc1-e135-1843d0dcdf7d	05	Lutkovno gledališče	lutkovno gledališče
00150000-5594-fcc1-a572-5ca8e941d6ff	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5594-fcc1-5e98-2756e7902846	07	Biografska drama	biografska drama
00150000-5594-fcc1-0899-495ebc92151d	08	Komedija	komedija
00150000-5594-fcc1-529f-70d93a740ae6	09	Črna komedija	črna komedija
00150000-5594-fcc1-ce7e-aa0cd0de930f	10	E-igra	E-igra
00150000-5594-fcc1-186e-3c46b6fa3a78	11	Kriminalka	kriminalka
00150000-5594-fcc1-a792-95068e9a027d	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8816174)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8816691)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8816681)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8816586)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8816358)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8816383)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8816778)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8816300)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8816738)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8816516)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8816334)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8816377)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8816314)
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
-- TOC entry 2533 (class 2606 OID 8816426)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8816453)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8816272)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8816183)
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
-- TOC entry 2448 (class 2606 OID 8816207)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8816163)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8816148)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8816459)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8816492)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8816629)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8816236)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8816260)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8816432)
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
-- TOC entry 2463 (class 2606 OID 8816250)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8816321)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8816444)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8816568)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8816614)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8816760)
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
-- TOC entry 2553 (class 2606 OID 8816476)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8816417)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8816408)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8816608)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8816544)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8816119)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8816483)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8816137)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8816157)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8816501)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8816439)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8816389)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8816802)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8816790)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8816784)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8816557)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8816216)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8816399)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8816597)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8816772)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8816285)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8816132)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8816660)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8816343)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8816467)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8816535)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8816372)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8816642)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8816528)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8816365)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8816558)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8816559)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8816238)
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
-- TOC entry 2546 (class 1259 OID 8816460)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8816446)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8816445)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8816344)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8816517)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8816519)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8816518)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8816316)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8816315)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8816631)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8816632)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8816633)
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
-- TOC entry 2608 (class 1259 OID 8816665)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8816662)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8816666)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8816664)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8816663)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8816287)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8816286)
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
-- TOC entry 2446 (class 1259 OID 8816210)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8816484)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8816378)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8816164)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8816165)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8816504)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8816503)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8816502)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8816322)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8816324)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8816323)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8816792)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8816412)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8816410)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8816409)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8816411)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8816138)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8816139)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8816468)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8816433)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8816545)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8816546)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8816742)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8816739)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8816740)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8816741)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8816252)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8816251)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8816253)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8816569)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8816570)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8816695)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8816696)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8816693)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8816694)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8816536)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8816421)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8816420)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8816418)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8816419)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8816683)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8816682)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8816761)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8816335)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8816779)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8816185)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8816184)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8816217)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8816218)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8816402)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8816401)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8816400)
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
-- TOC entry 2498 (class 1259 OID 8816367)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8816363)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8816360)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8816361)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8816359)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8816364)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8816362)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8816237)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8816301)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8816303)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8816302)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8816304)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8816427)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8816630)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8816661)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8816208)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8816209)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8816529)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8816803)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8816273)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8816791)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8816478)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8816477)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8816692)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8816261)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8816643)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8816615)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8816616)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8816158)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8816366)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8816939)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8816924)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8816929)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8816949)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8816919)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8816944)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8816934)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8817094)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8817099)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8816854)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8817034)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8817029)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8817024)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8816914)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8817064)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8817074)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8817069)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8816889)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8816884)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8817014)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8817119)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8817124)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8817129)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8817149)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8817134)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8817154)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8817144)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8817139)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8816879)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8816874)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8816839)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8816834)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8817044)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8816954)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8816814)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8816819)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8817059)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8817054)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8817049)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8816894)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8816904)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8816899)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8817219)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8816989)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8816979)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8816974)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8816984)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8816804)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8816809)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8817039)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8817019)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8817084)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8817089)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8817204)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8817189)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8817194)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8817199)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8816864)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8816859)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8816869)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8817104)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8817109)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8817179)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8817184)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8817169)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8817174)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8817079)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8817009)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8817004)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8816994)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8816999)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8817164)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8817159)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8817209)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8816909)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8817114)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8817214)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8816829)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8816824)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8816844)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8816849)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8816969)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8816964)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8816959)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-02 10:56:35 CEST

--
-- PostgreSQL database dump complete
--

