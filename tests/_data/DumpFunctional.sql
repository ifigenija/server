--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-02 16:47:58 CEST

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
-- TOC entry 183 (class 1259 OID 8913481)
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
-- TOC entry 230 (class 1259 OID 8913999)
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
-- TOC entry 229 (class 1259 OID 8913982)
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
-- TOC entry 222 (class 1259 OID 8913886)
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
-- TOC entry 197 (class 1259 OID 8913660)
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
-- TOC entry 200 (class 1259 OID 8913694)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8914088)
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
-- TOC entry 192 (class 1259 OID 8913603)
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
-- TOC entry 231 (class 1259 OID 8914012)
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
-- TOC entry 216 (class 1259 OID 8913820)
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
-- TOC entry 195 (class 1259 OID 8913640)
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
-- TOC entry 199 (class 1259 OID 8913688)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8913620)
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
-- TOC entry 205 (class 1259 OID 8913737)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8913762)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8913577)
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
-- TOC entry 184 (class 1259 OID 8913490)
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
-- TOC entry 185 (class 1259 OID 8913501)
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
-- TOC entry 180 (class 1259 OID 8913455)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8913474)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8913769)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8913800)
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
-- TOC entry 226 (class 1259 OID 8913932)
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
-- TOC entry 187 (class 1259 OID 8913534)
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
-- TOC entry 189 (class 1259 OID 8913569)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8913743)
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
-- TOC entry 188 (class 1259 OID 8913554)
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
-- TOC entry 194 (class 1259 OID 8913632)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8913755)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8913875)
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
-- TOC entry 225 (class 1259 OID 8913924)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8914058)
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
-- TOC entry 212 (class 1259 OID 8913784)
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
-- TOC entry 204 (class 1259 OID 8913728)
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
-- TOC entry 203 (class 1259 OID 8913718)
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
-- TOC entry 224 (class 1259 OID 8913913)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8913852)
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
-- TOC entry 177 (class 1259 OID 8913426)
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
-- TOC entry 176 (class 1259 OID 8913424)
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
-- TOC entry 213 (class 1259 OID 8913794)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8913464)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8913448)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8913808)
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
-- TOC entry 207 (class 1259 OID 8913749)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8913699)
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
-- TOC entry 237 (class 1259 OID 8914108)
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
-- TOC entry 236 (class 1259 OID 8914100)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8914095)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8913862)
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
-- TOC entry 186 (class 1259 OID 8913526)
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
-- TOC entry 202 (class 1259 OID 8913705)
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
-- TOC entry 223 (class 1259 OID 8913902)
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
-- TOC entry 233 (class 1259 OID 8914077)
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
-- TOC entry 191 (class 1259 OID 8913589)
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
-- TOC entry 178 (class 1259 OID 8913435)
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
-- TOC entry 228 (class 1259 OID 8913959)
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
-- TOC entry 196 (class 1259 OID 8913651)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8913776)
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
-- TOC entry 218 (class 1259 OID 8913845)
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
-- TOC entry 198 (class 1259 OID 8913683)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8913949)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8913835)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8913429)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8913481)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8913999)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5595-4f1d-312a-544a274f9bc1	000d0000-5595-4f1d-61d2-7329db2c1eb5	\N	00090000-5595-4f1d-8ff3-a5c8f8fd0fa3	000b0000-5595-4f1d-e625-d79b9222d740	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4f1d-1bc1-e10e9bb6e8e8	000d0000-5595-4f1d-410a-1c37383eb671	\N	00090000-5595-4f1d-d872-4ea8b1577f45	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4f1d-67b9-64ac8eb1de1e	000d0000-5595-4f1d-ef78-309cdd91e656	\N	00090000-5595-4f1d-27df-753fd9feab59	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4f1d-e69c-00ed65c92d42	000d0000-5595-4f1d-6b93-f908be67137a	\N	00090000-5595-4f1d-5d39-8470e7a7468f	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4f1d-11c6-6ca19d409d09	000d0000-5595-4f1d-6ad8-7014211c204b	\N	00090000-5595-4f1d-289a-37a7451446b5	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5595-4f1d-81e7-fa4aedb69586	000d0000-5595-4f1d-cc9e-efafc6237835	\N	00090000-5595-4f1d-d872-4ea8b1577f45	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8913982)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8913886)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5595-4f1c-c48f-452fc2bd3060	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5595-4f1c-9129-f65f93feb29b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5595-4f1c-88e5-3f756fae5daa	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8913660)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5595-4f1d-379f-a4e6a6b5e980	\N	\N	00200000-5595-4f1d-2396-5f60be409252	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5595-4f1d-6d4b-a5e222826f01	\N	\N	00200000-5595-4f1d-a731-cc6f9e73a7b2	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5595-4f1d-c96d-c3468f550a5b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5595-4f1d-95a3-8cb6d33fe231	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5595-4f1d-1525-bc3ec1335450	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8913694)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8914088)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8913603)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5595-4f1a-4215-c57bc6e50ce1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5595-4f1a-4f8f-788844068678	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5595-4f1a-5478-f5b291adcacd	AL	ALB	008	Albania 	Albanija	\N
00040000-5595-4f1a-fb74-aa3fbc6b37cc	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5595-4f1a-4c7e-84dde77b6008	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5595-4f1a-b641-342507f3c26a	AD	AND	020	Andorra 	Andora	\N
00040000-5595-4f1a-1d29-f5495d0bbd9b	AO	AGO	024	Angola 	Angola	\N
00040000-5595-4f1a-6347-e9999f141edb	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5595-4f1a-8078-ddae79351b4e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5595-4f1a-2177-157abcfa425d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-4f1a-5cbc-591064d1acb8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5595-4f1a-9e57-f7630e9b1d15	AM	ARM	051	Armenia 	Armenija	\N
00040000-5595-4f1a-ceab-d6dc258da91c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5595-4f1a-2818-0f8707b1b618	AU	AUS	036	Australia 	Avstralija	\N
00040000-5595-4f1a-58c2-9fd3be9191fa	AT	AUT	040	Austria 	Avstrija	\N
00040000-5595-4f1a-1b8a-d85af9685191	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5595-4f1a-9ce1-1cebe91cc02c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5595-4f1a-96f1-c63d71ac51da	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5595-4f1a-5297-26bb38661a9c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5595-4f1a-bba1-5f1c98f163b5	BB	BRB	052	Barbados 	Barbados	\N
00040000-5595-4f1a-6c7a-a4e792e33156	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5595-4f1a-2d0e-cdc52375c6cf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5595-4f1a-44b1-de7cb8f98f09	BZ	BLZ	084	Belize 	Belize	\N
00040000-5595-4f1a-5526-8f7de0c02e04	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5595-4f1a-d12d-839ff9f1cf2a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5595-4f1a-4b37-891815135e2f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5595-4f1a-ff4a-6b1b04d91234	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5595-4f1a-40ae-29995ef9e731	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5595-4f1a-176c-da2412d64a42	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5595-4f1a-cb70-2eae70cb4ffc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5595-4f1a-19a8-b8fed77c2357	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5595-4f1a-2f38-9827fb0c243a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5595-4f1a-71eb-773bf4d1564f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5595-4f1a-e5c9-5f2f7061858c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5595-4f1a-a1b3-cb92926514c0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5595-4f1a-1f54-ecb4cef1d9f3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5595-4f1a-04b5-85b740be5865	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5595-4f1a-32f2-fd7465616b20	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5595-4f1a-fdb5-4988fdeccb15	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5595-4f1a-2aa2-74972c027a66	CA	CAN	124	Canada 	Kanada	\N
00040000-5595-4f1a-d470-d127f959bb89	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5595-4f1a-e291-0516576d2611	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5595-4f1a-e645-45ba2eba4339	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5595-4f1a-cb7a-438d695fb745	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5595-4f1a-0b2b-20fc2e99effa	CL	CHL	152	Chile 	Čile	\N
00040000-5595-4f1a-4aa1-29cbf7f06e40	CN	CHN	156	China 	Kitajska	\N
00040000-5595-4f1a-2a02-03745ffc4e9e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5595-4f1a-d63b-c7e29eee9e8e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5595-4f1a-4f3e-beed954a07be	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5595-4f1a-e126-e4fa7f64506c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5595-4f1a-ec2d-04ae0435c41a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5595-4f1a-85ba-ad9ddc69d2ec	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5595-4f1a-72b3-02573129b97a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5595-4f1a-ce4a-333e3eb8e0ae	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5595-4f1a-d317-d01cd47e3eeb	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5595-4f1a-b1bf-9f5c2d40e7b3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5595-4f1a-2d57-2ca457acef5a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5595-4f1a-f100-9e22c1eb076e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5595-4f1a-f3bc-cdd72c30937b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5595-4f1a-cb1e-59f3ec953afc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5595-4f1a-998a-ed62a27f955a	DK	DNK	208	Denmark 	Danska	\N
00040000-5595-4f1a-adbc-21ac4894bb25	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5595-4f1a-70e2-2a5093187a34	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5595-4f1a-9f88-5e01bf672447	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5595-4f1a-af27-d3c0c9c602a5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5595-4f1a-87f6-be882df1fda8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5595-4f1a-5dc3-ce5870b06062	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5595-4f1a-84e7-a13f50004f2f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5595-4f1a-6b7c-32da73f8a354	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5595-4f1a-7961-407eb831a1ac	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5595-4f1a-07ad-137c1711b41a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5595-4f1a-9986-4f08b8665080	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5595-4f1a-52a4-e5dd972f49a5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5595-4f1a-d116-487b020e2d1a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5595-4f1a-e639-5204f069bf9f	FI	FIN	246	Finland 	Finska	\N
00040000-5595-4f1a-4515-b6c7d8fd2556	FR	FRA	250	France 	Francija	\N
00040000-5595-4f1a-7367-b505845e1e44	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5595-4f1a-8f8b-04de9a379171	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5595-4f1a-c2af-7ed5da18e355	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5595-4f1a-f011-92aaa87f9131	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5595-4f1a-08bb-855227f11059	GA	GAB	266	Gabon 	Gabon	\N
00040000-5595-4f1a-ab22-5c99afd5ef83	GM	GMB	270	Gambia 	Gambija	\N
00040000-5595-4f1a-4116-1a429f00d8c2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5595-4f1a-db91-1bd9a0be786a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5595-4f1a-6d0a-57a1cc37f619	GH	GHA	288	Ghana 	Gana	\N
00040000-5595-4f1a-cf0c-b608054241ab	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5595-4f1a-a9fc-88b30d7a67d1	GR	GRC	300	Greece 	Grčija	\N
00040000-5595-4f1a-138e-735f02ae24b3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5595-4f1a-789b-e0d00da4bd38	GD	GRD	308	Grenada 	Grenada	\N
00040000-5595-4f1a-c55f-9157694959e6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5595-4f1a-35b6-7925c224c5cf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5595-4f1a-d5c8-0b61e9c2f243	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5595-4f1a-d235-f45d7cc3276a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5595-4f1a-75b4-455c780dd0bb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5595-4f1a-d34b-fd6de6181b28	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5595-4f1a-82d5-8b129ed1eccd	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5595-4f1a-5f55-bbe622b2a503	HT	HTI	332	Haiti 	Haiti	\N
00040000-5595-4f1a-b200-2612f4764417	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5595-4f1a-8ab9-5a555f0d3d18	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5595-4f1a-6f6d-079ae7ec3511	HN	HND	340	Honduras 	Honduras	\N
00040000-5595-4f1a-524b-d676ce10d5b8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5595-4f1a-8775-4c4e8dcf0966	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5595-4f1a-2281-52b3639ee0c7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5595-4f1a-bd61-2a90d559efb3	IN	IND	356	India 	Indija	\N
00040000-5595-4f1a-97f9-6d496eae75e4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5595-4f1a-df7a-b4e393f5e426	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5595-4f1a-68cc-ff5e8b182580	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5595-4f1a-202f-515e5ec88912	IE	IRL	372	Ireland 	Irska	\N
00040000-5595-4f1a-95a0-35c575bf4623	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5595-4f1a-303c-7c20be853061	IL	ISR	376	Israel 	Izrael	\N
00040000-5595-4f1a-23a8-a36b65f7b068	IT	ITA	380	Italy 	Italija	\N
00040000-5595-4f1a-6d27-4e1792da80c4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5595-4f1a-7558-4766d7aca328	JP	JPN	392	Japan 	Japonska	\N
00040000-5595-4f1a-9538-8320ae3753ae	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5595-4f1a-259a-03581fc267d2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5595-4f1a-ff06-0d6e15087b13	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5595-4f1a-9dbf-9a2d8a1c30af	KE	KEN	404	Kenya 	Kenija	\N
00040000-5595-4f1a-2928-c47f8d3e1ea4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5595-4f1a-741d-adfa25342b58	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5595-4f1a-ced4-f970b6e1637c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5595-4f1a-f74f-73a9aef59322	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5595-4f1a-0b31-6bd48d9ea962	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5595-4f1a-e026-32025eba3f3e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5595-4f1a-3649-e72afc283b80	LV	LVA	428	Latvia 	Latvija	\N
00040000-5595-4f1a-8232-fce374c7b831	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5595-4f1a-09a1-d71f91ab2221	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5595-4f1a-6454-b79e36373444	LR	LBR	430	Liberia 	Liberija	\N
00040000-5595-4f1a-ac54-d9cb10979be4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5595-4f1a-818f-1aeff4cf923e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5595-4f1a-ffc9-998a548247a9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5595-4f1a-5ca8-d4e17f450ea2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5595-4f1a-116f-dc45a81c2412	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5595-4f1a-2d13-b083fbdf4c33	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5595-4f1a-46a5-85c4eb9d6ef5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5595-4f1a-d811-d6e56a38cb97	MW	MWI	454	Malawi 	Malavi	\N
00040000-5595-4f1a-5f5b-d462357ac6e5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5595-4f1a-ba0a-1a2ad277879a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5595-4f1a-d92b-3ad776fe2c47	ML	MLI	466	Mali 	Mali	\N
00040000-5595-4f1a-0962-0054a3e4bb54	MT	MLT	470	Malta 	Malta	\N
00040000-5595-4f1a-ba6a-8d280d57e83a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5595-4f1a-3824-4fecf568a403	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5595-4f1a-9893-8c9b47107cc3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5595-4f1a-5b86-8fe2194ab9cb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5595-4f1a-2442-b48abefda63d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5595-4f1a-c2fc-b5fbd90ebddb	MX	MEX	484	Mexico 	Mehika	\N
00040000-5595-4f1a-c788-8b965bbf74bd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5595-4f1a-d760-f1b739e735aa	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5595-4f1a-0ae5-b4e8758961fb	MC	MCO	492	Monaco 	Monako	\N
00040000-5595-4f1a-3d12-26f60bf46f1e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5595-4f1a-5f05-211e0e7699f3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5595-4f1a-0ab4-226100e299aa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5595-4f1a-ef66-b16ae081bf3d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5595-4f1a-d636-1035c45e842e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5595-4f1a-7a75-0763b2453fce	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5595-4f1a-8fae-f4cdd393c688	NA	NAM	516	Namibia 	Namibija	\N
00040000-5595-4f1a-1a03-2f12f6a27d8f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5595-4f1a-d65c-ffff88362263	NP	NPL	524	Nepal 	Nepal	\N
00040000-5595-4f1a-6ce5-1261736137fb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5595-4f1a-3d42-36195d94602b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5595-4f1a-7c8b-6a4e11448918	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5595-4f1a-bd37-9c91f65f6c8b	NE	NER	562	Niger 	Niger 	\N
00040000-5595-4f1a-d80d-eae0b9a1f3bd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5595-4f1a-05a9-bd9929e71a21	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5595-4f1a-f05d-82dfeab8cc96	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5595-4f1a-7220-92b210fe28a9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5595-4f1a-ba14-fec076eb6002	NO	NOR	578	Norway 	Norveška	\N
00040000-5595-4f1a-d5b5-78c7a7ecad86	OM	OMN	512	Oman 	Oman	\N
00040000-5595-4f1a-3059-86ea7a7c9a0f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5595-4f1a-7eb3-9ca42c06a557	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5595-4f1a-ca83-b46e60fddad7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5595-4f1a-91f0-b39aac9a7306	PA	PAN	591	Panama 	Panama	\N
00040000-5595-4f1a-e514-c2713586f259	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5595-4f1a-df9a-df1c71c275b1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5595-4f1a-4393-cb354c3a0472	PE	PER	604	Peru 	Peru	\N
00040000-5595-4f1a-d2cb-d04d7262644c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5595-4f1a-dcb3-57eea2c66754	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5595-4f1a-5fa7-9d6b5c8fb2dd	PL	POL	616	Poland 	Poljska	\N
00040000-5595-4f1a-38a6-c0ac98c15bd1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5595-4f1a-5154-c2dd02c30350	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5595-4f1a-cf81-0b5cc7c50faa	QA	QAT	634	Qatar 	Katar	\N
00040000-5595-4f1a-52a0-f9f018c13db3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5595-4f1a-f30f-0cfdedccd6d4	RO	ROU	642	Romania 	Romunija	\N
00040000-5595-4f1a-b864-269aa245b19b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5595-4f1a-a277-c09ede91fdbe	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5595-4f1a-4788-a2b1b49b7301	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5595-4f1a-4135-a048def1ed17	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5595-4f1a-0709-5b1eab5c19f4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5595-4f1a-0efb-0167cd7d0bf3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5595-4f1a-a295-7ea1aa83fe96	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5595-4f1a-8d67-5b21eb8c67fd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5595-4f1a-1c9f-cc5ac490310c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5595-4f1a-ecbd-b43863dee866	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5595-4f1a-7870-f2bd90b0cc0a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5595-4f1a-ca37-79fa2c8cb699	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5595-4f1a-875f-44a975073557	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5595-4f1a-fc65-ee90d89fa10a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5595-4f1a-6e58-1f34d7bd178b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5595-4f1a-d675-bf263718225a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5595-4f1a-b07a-b2a0b7383742	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5595-4f1a-874d-127a0d0cf6bd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5595-4f1a-a582-929a3f25a9fa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5595-4f1a-bacb-5451d1bfc7e0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5595-4f1a-00db-5d0feb4f99ef	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5595-4f1a-ca25-3985d52b0a19	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5595-4f1a-fcd0-3a01d67e66d4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5595-4f1a-8db6-f64f4bbbd2e5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5595-4f1a-2f43-f2c66f14265a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5595-4f1a-086f-71e924597f70	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5595-4f1a-6020-a3d71c294a49	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5595-4f1a-c4f8-552f37a984bb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5595-4f1a-a5f0-64b9f0d45ec6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5595-4f1a-3ead-c7312f9e1232	SR	SUR	740	Suriname 	Surinam	\N
00040000-5595-4f1a-b1e4-a9a457728048	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5595-4f1b-bde1-d6a69b0e14db	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5595-4f1b-eba4-75924deaae70	SE	SWE	752	Sweden 	Švedska	\N
00040000-5595-4f1b-529c-40dba3700c0b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5595-4f1b-e98e-193e8b6127cb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5595-4f1b-80ba-a9840f5a6e1e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5595-4f1b-ed47-b8437c1e2c64	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5595-4f1b-0f34-e4c52e1d0353	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5595-4f1b-2752-0519db391e16	TH	THA	764	Thailand 	Tajska	\N
00040000-5595-4f1b-fee0-9a0c597d35af	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5595-4f1b-42ef-9ab249176d74	TG	TGO	768	Togo 	Togo	\N
00040000-5595-4f1b-ac21-8e0d61dafa6d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5595-4f1b-2879-72475e0d14a7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5595-4f1b-65d2-94f0646f7e69	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5595-4f1b-acbe-d0fc83d6b1ee	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5595-4f1b-1b1c-74c1f2af2f88	TR	TUR	792	Turkey 	Turčija	\N
00040000-5595-4f1b-ad1f-c0b43c74aac3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5595-4f1b-6a7f-054464652dab	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-4f1b-0ba7-9b9c5b843691	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5595-4f1b-2d16-f85998594eca	UG	UGA	800	Uganda 	Uganda	\N
00040000-5595-4f1b-11c3-21c7ff29f1fb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5595-4f1b-f1b9-1aceccfc4cc0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5595-4f1b-1028-b2ed648696aa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5595-4f1b-d11b-95f147528fba	US	USA	840	United States 	Združene države Amerike	\N
00040000-5595-4f1b-5bfa-95db42a444d5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5595-4f1b-fc26-bd84952d9f03	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5595-4f1b-4cee-d06d71d6306a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5595-4f1b-951a-7525d349658b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5595-4f1b-dea5-6e8ed2be72de	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5595-4f1b-1007-475e3781615b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5595-4f1b-5d10-ad9d0e8032c6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5595-4f1b-bd51-fd260087be28	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5595-4f1b-c685-9dc1c149591f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5595-4f1b-3428-5397983f015c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5595-4f1b-8731-8ce72a4e221d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5595-4f1b-71a7-84ccf15f15ac	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5595-4f1b-6e1b-848de0962638	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8914012)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5595-4f1d-cd92-b61fee6c248e	000e0000-5595-4f1d-e1c6-f42ad512766a	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5595-4f1c-0fdc-eec0b3843f69	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5595-4f1d-011b-5f357af27b91	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5595-4f1c-647a-1b45a5e05311	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8913820)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5595-4f1d-d556-c14edcb80f46	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5595-4f1c-5fb8-c7b1752be337
000d0000-5595-4f1d-61d2-7329db2c1eb5	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-4f1c-5fb8-c7b1752be337
000d0000-5595-4f1d-410a-1c37383eb671	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5595-4f1c-7d9f-fb975ede5c81
000d0000-5595-4f1d-ef78-309cdd91e656	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5595-4f1c-c5f5-133af16f0cf4
000d0000-5595-4f1d-6b93-f908be67137a	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5595-4f1c-c5f5-133af16f0cf4
000d0000-5595-4f1d-6ad8-7014211c204b	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5595-4f1c-c5f5-133af16f0cf4
000d0000-5595-4f1d-cc9e-efafc6237835	000e0000-5595-4f1d-a37d-d0b867f4d1cc	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5595-4f1c-5fb8-c7b1752be337
\.


--
-- TOC entry 2866 (class 0 OID 8913640)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8913688)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8913620)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5595-4f1d-b7da-d42f54e2caa0	00080000-5595-4f1c-2bf3-a96f57252105	00090000-5595-4f1d-8ff3-a5c8f8fd0fa3	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8913737)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8913762)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8913577)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5595-4f1b-51ed-278883998677	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5595-4f1b-23ca-e7c0829eb0e1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5595-4f1b-76f5-ba72efc83f97	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5595-4f1b-8470-ae1e5f45f1bc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5595-4f1b-e638-f6274be05bcb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5595-4f1b-ce2f-3691f24aee47	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5595-4f1b-1789-c4e4cdfad317	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5595-4f1b-7c46-39b5eeb2e725	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-4f1b-d690-d3dc4b220134	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5595-4f1b-cda8-cf4f0b7b6f6e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5595-4f1b-2d62-5f1438574136	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5595-4f1b-43b1-5e37b176d40a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5595-4f1b-58b1-1fb0a5651a73	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5595-4f1c-2f29-b89d3f0addf5	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5595-4f1c-1255-f388e0a813bc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5595-4f1c-1d72-0c0f797a2369	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5595-4f1c-c61f-b3d8c880978d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5595-4f1c-326d-d70931cc44dd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5595-4f1c-bb07-43c4170b0b31	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8913490)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5595-4f1c-263e-d3aacdbaa760	00000000-5595-4f1c-1255-f388e0a813bc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5595-4f1c-f49a-b3cce08f1508	00000000-5595-4f1c-1255-f388e0a813bc	00010000-5595-4f1b-0113-a62247cf0b3a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5595-4f1c-612d-6077099f98cd	00000000-5595-4f1c-1d72-0c0f797a2369	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8913501)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5595-4f1d-4f2a-f8ddea12192f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5595-4f1d-5d39-8470e7a7468f	00010000-5595-4f1d-e2f8-1eabfeee88c9	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5595-4f1d-27df-753fd9feab59	00010000-5595-4f1d-b7b0-ab971b115d2f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5595-4f1d-0cc2-efa9b5a3d669	00010000-5595-4f1d-aaea-fbdd9ae9099b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5595-4f1d-a398-68ae5f322e81	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5595-4f1d-aa83-27087e1ae203	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5595-4f1d-caad-44ca9c21f40d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5595-4f1d-5ce2-c12f1ebe0c05	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5595-4f1d-8ff3-a5c8f8fd0fa3	00010000-5595-4f1d-2e51-a30fd5a54c18	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5595-4f1d-d872-4ea8b1577f45	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5595-4f1d-cc2a-dc6534e9ecd1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5595-4f1d-289a-37a7451446b5	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5595-4f1d-1764-cf3d3b9112d2	00010000-5595-4f1d-2fce-9ed38c08e524	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8913455)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5595-4f1b-2f50-5f5b65723100	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5595-4f1b-6027-9cca3907ea27	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5595-4f1b-d6b1-c8ff9c5c400f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5595-4f1b-345b-f3d3450cb3c2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5595-4f1b-68ae-85609ab495a3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5595-4f1b-5119-59734f3de218	Abonma-read	Abonma - branje	f
00030000-5595-4f1b-69cb-9a628bbfef7e	Abonma-write	Abonma - spreminjanje	f
00030000-5595-4f1b-77e8-609e102d3215	Alternacija-read	Alternacija - branje	f
00030000-5595-4f1b-7465-ef13964ad799	Alternacija-write	Alternacija - spreminjanje	f
00030000-5595-4f1b-0422-e1889ec6a904	Arhivalija-read	Arhivalija - branje	f
00030000-5595-4f1b-f35c-f5e2a39d1d5f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5595-4f1b-df93-6e97181466f5	Besedilo-read	Besedilo - branje	f
00030000-5595-4f1b-6bcc-fabd49caa5a6	Besedilo-write	Besedilo - spreminjanje	f
00030000-5595-4f1b-8541-3fa02a234e5c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5595-4f1b-fbb8-6a7fbb7bbff4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5595-4f1b-0acc-16d494f059f3	Dogodek-read	Dogodek - branje	f
00030000-5595-4f1b-d9f9-1381f963dac2	Dogodek-write	Dogodek - spreminjanje	f
00030000-5595-4f1b-c98b-4645c2ed92ec	DrugiVir-read	DrugiVir - branje	f
00030000-5595-4f1b-d99a-5bb1d63c68fc	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5595-4f1b-521f-95c13bd39bec	Drzava-read	Drzava - branje	f
00030000-5595-4f1b-ab27-18ec4019bb95	Drzava-write	Drzava - spreminjanje	f
00030000-5595-4f1b-5dd6-5537dd390743	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5595-4f1b-76c3-d78ed6d43166	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5595-4f1b-2edc-e20eb8ef9e8d	Funkcija-read	Funkcija - branje	f
00030000-5595-4f1b-85a2-1d41a193a4d6	Funkcija-write	Funkcija - spreminjanje	f
00030000-5595-4f1b-159c-563b6810c807	Gostovanje-read	Gostovanje - branje	f
00030000-5595-4f1b-29b2-5a98ba90e4aa	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5595-4f1b-df4e-4f9d6820db92	Gostujoca-read	Gostujoca - branje	f
00030000-5595-4f1b-ec2f-19046242c58a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5595-4f1b-2156-9a992ece1ee0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5595-4f1b-d85c-a1ccab5e4424	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5595-4f1b-684e-f96c841b0a4d	Kupec-read	Kupec - branje	f
00030000-5595-4f1b-93e7-f3aeeb69d4de	Kupec-write	Kupec - spreminjanje	f
00030000-5595-4f1b-66b7-b9c1f4d2d146	NacinPlacina-read	NacinPlacina - branje	f
00030000-5595-4f1b-3d9e-e2995d07f3df	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5595-4f1b-db25-babc143338f4	Option-read	Option - branje	f
00030000-5595-4f1b-861f-21a162e38a65	Option-write	Option - spreminjanje	f
00030000-5595-4f1b-5341-91791e1eb36a	OptionValue-read	OptionValue - branje	f
00030000-5595-4f1b-b5f2-0ba4ff08c94e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5595-4f1b-47bd-ef404b930b1b	Oseba-read	Oseba - branje	f
00030000-5595-4f1b-d746-96033ddaf793	Oseba-write	Oseba - spreminjanje	f
00030000-5595-4f1b-5be9-851c0249f91b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5595-4f1b-1035-711296d0d441	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5595-4f1b-b20b-0d71857ce54b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5595-4f1b-25e7-fc15873b69b1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5595-4f1b-9c49-87c920aa3c94	Pogodba-read	Pogodba - branje	f
00030000-5595-4f1b-f2bd-a826dfb0a122	Pogodba-write	Pogodba - spreminjanje	f
00030000-5595-4f1b-29ea-f979212c2bdf	Popa-read	Popa - branje	f
00030000-5595-4f1b-501b-3134800e8501	Popa-write	Popa - spreminjanje	f
00030000-5595-4f1b-7b74-a715a454e10e	Posta-read	Posta - branje	f
00030000-5595-4f1b-da3d-e431e1bd7bba	Posta-write	Posta - spreminjanje	f
00030000-5595-4f1b-119a-fdfb945e7309	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5595-4f1b-d636-c2d4aaf48079	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5595-4f1b-deaf-be0a5a9ffa2c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5595-4f1b-7f59-d29c3d46ac5c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5595-4f1b-6188-c9f5e593c040	Predstava-read	Predstava - branje	f
00030000-5595-4f1b-a448-623fe518dc69	Predstava-write	Predstava - spreminjanje	f
00030000-5595-4f1b-6991-508be094d272	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5595-4f1b-4616-2d5827ada762	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5595-4f1b-0d28-37b88cc1d943	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5595-4f1b-25b6-6f7e34a0d0c5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5595-4f1b-c3fa-41c57523f756	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5595-4f1b-3aad-3ff6ca43512a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5595-4f1b-5798-cb95b6a3658b	ProgramDela-read	ProgramDela - branje	f
00030000-5595-4f1b-c131-255033a907a5	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5595-4f1b-75b3-90297c31edb7	ProgramFestival-read	ProgramFestival - branje	f
00030000-5595-4f1b-9878-da690a246699	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5595-4f1b-c261-160e57ecd916	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5595-4f1b-738d-08f61a78cd3e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5595-4f1b-b45f-cb5ecac22b4f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5595-4f1b-4725-06c9c3d9dfd9	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5595-4f1b-8435-b050d1c97c3e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5595-4f1b-afb1-6a7d9420b49e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5595-4f1b-7509-43e12f009351	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5595-4f1b-1bbf-3f60103ad356	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5595-4f1b-668b-368896414ea1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5595-4f1b-f609-4add42061a6b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5595-4f1b-be5d-ed34b290db33	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5595-4f1b-ea3b-f966171bb056	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5595-4f1b-f40a-78126f41d9c9	ProgramRazno-read	ProgramRazno - branje	f
00030000-5595-4f1b-7060-6ac42cc117db	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5595-4f1b-7702-e6e3b6c55986	Prostor-read	Prostor - branje	f
00030000-5595-4f1b-f223-60764f3b44e0	Prostor-write	Prostor - spreminjanje	f
00030000-5595-4f1b-63ab-a1614ccaabbd	Racun-read	Racun - branje	f
00030000-5595-4f1b-5c6c-ab0da39de80d	Racun-write	Racun - spreminjanje	f
00030000-5595-4f1b-2be1-7d948b6f2410	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5595-4f1b-e0da-094bdb36bf96	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5595-4f1b-52b8-03267cc00b68	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5595-4f1b-6536-4b2244baa71c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5595-4f1b-afc1-8af06f0c4a94	Rekvizit-read	Rekvizit - branje	f
00030000-5595-4f1b-ea97-8cf638985f88	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5595-4f1b-cae7-f022bf75bf2e	Revizija-read	Revizija - branje	f
00030000-5595-4f1b-e73b-d5d4418dcd1f	Revizija-write	Revizija - spreminjanje	f
00030000-5595-4f1b-46ee-758e386bcc7d	Rezervacija-read	Rezervacija - branje	f
00030000-5595-4f1b-9b64-f44e66e04c4d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5595-4f1b-d1a3-12b47d811c5c	SedezniRed-read	SedezniRed - branje	f
00030000-5595-4f1b-796c-04f7da21c50c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5595-4f1b-0135-4319cb8e40ae	Sedez-read	Sedez - branje	f
00030000-5595-4f1b-db5d-e25e8a341101	Sedez-write	Sedez - spreminjanje	f
00030000-5595-4f1b-fb3e-7a32b3e27cb3	Sezona-read	Sezona - branje	f
00030000-5595-4f1b-ff9a-990f1ee7305a	Sezona-write	Sezona - spreminjanje	f
00030000-5595-4f1b-f900-4c4b2142074e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5595-4f1b-71d3-96c91c46a702	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5595-4f1b-632a-b493ed3b4bf0	Stevilcenje-read	Stevilcenje - branje	f
00030000-5595-4f1b-22af-62f2508962f9	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5595-4f1b-12aa-3945f76a8358	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5595-4f1b-85b3-ba559082dae5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5595-4f1b-7d96-1591a9511783	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5595-4f1b-7058-c3ad8a07923c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5595-4f1b-d7a9-804a44a60534	Telefonska-read	Telefonska - branje	f
00030000-5595-4f1b-df1d-db4729aa9f7e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5595-4f1b-057b-54dbc3b8a479	TerminStoritve-read	TerminStoritve - branje	f
00030000-5595-4f1b-48d2-0a19dec66e34	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5595-4f1b-e015-3da84e3c26fd	TipFunkcije-read	TipFunkcije - branje	f
00030000-5595-4f1b-d172-f30d673e0392	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5595-4f1b-8484-26af8334f7f8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5595-4f1b-bacf-00d26d467ba1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5595-4f1b-ef14-f0f61c3c8c7a	Trr-read	Trr - branje	f
00030000-5595-4f1b-f983-ea8a136c441c	Trr-write	Trr - spreminjanje	f
00030000-5595-4f1b-cf53-c409676f369a	Uprizoritev-read	Uprizoritev - branje	f
00030000-5595-4f1b-f40d-006cdd043693	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5595-4f1b-db6b-7b817d17260e	Vaja-read	Vaja - branje	f
00030000-5595-4f1b-54b2-b6e78f775ceb	Vaja-write	Vaja - spreminjanje	f
00030000-5595-4f1b-c976-659f20a7345b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5595-4f1b-bfc7-c55a5def3d4b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5595-4f1b-6b58-6c19745628d9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5595-4f1b-cc3f-67361986fe00	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5595-4f1b-3612-9d98916f227b	Zasedenost-read	Zasedenost - branje	f
00030000-5595-4f1b-7030-f298277bf198	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5595-4f1b-da98-d6b8ba1cdbef	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5595-4f1b-55bb-671265e1ab09	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5595-4f1b-0171-92b796fda9b5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5595-4f1b-b3ad-739f06f8c81f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8913474)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5595-4f1b-3e52-9d32aa682b2b	00030000-5595-4f1b-6027-9cca3907ea27
00020000-5595-4f1b-26c0-f5ceda57d8f8	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-69cb-9a628bbfef7e
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-77e8-609e102d3215
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-7465-ef13964ad799
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-345b-f3d3450cb3c2
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-d9f9-1381f963dac2
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-ab27-18ec4019bb95
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-2edc-e20eb8ef9e8d
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-85a2-1d41a193a4d6
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-29b2-5a98ba90e4aa
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-ec2f-19046242c58a
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-2156-9a992ece1ee0
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-d85c-a1ccab5e4424
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-47bd-ef404b930b1b
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-d746-96033ddaf793
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-501b-3134800e8501
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-da3d-e431e1bd7bba
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-deaf-be0a5a9ffa2c
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-7f59-d29c3d46ac5c
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-a448-623fe518dc69
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-c3fa-41c57523f756
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-3aad-3ff6ca43512a
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-f223-60764f3b44e0
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-6536-4b2244baa71c
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-ea97-8cf638985f88
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-ff9a-990f1ee7305a
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-e015-3da84e3c26fd
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-cf53-c409676f369a
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-f40d-006cdd043693
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-db6b-7b817d17260e
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-54b2-b6e78f775ceb
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-3612-9d98916f227b
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-7030-f298277bf198
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1b-b66a-8547fa5d183e	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-2156-9a992ece1ee0
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-d85c-a1ccab5e4424
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-47bd-ef404b930b1b
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-d746-96033ddaf793
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-deaf-be0a5a9ffa2c
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-7f59-d29c3d46ac5c
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-d7a9-804a44a60534
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-df1d-db4729aa9f7e
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-ef14-f0f61c3c8c7a
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-f983-ea8a136c441c
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-6b58-6c19745628d9
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-cc3f-67361986fe00
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1b-66f6-e2e02b146089	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-77e8-609e102d3215
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-f35c-f5e2a39d1d5f
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-df93-6e97181466f5
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-8541-3fa02a234e5c
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-2edc-e20eb8ef9e8d
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-2156-9a992ece1ee0
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-47bd-ef404b930b1b
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-c3fa-41c57523f756
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-e015-3da84e3c26fd
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-db6b-7b817d17260e
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-3612-9d98916f227b
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1b-b85f-465c7f3f7981	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-69cb-9a628bbfef7e
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-7465-ef13964ad799
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-e015-3da84e3c26fd
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1b-07eb-f80b7261e7a0	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-057b-54dbc3b8a479
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-d6b1-c8ff9c5c400f
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-e015-3da84e3c26fd
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1b-8eb8-3a172c2cedc3	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-2f50-5f5b65723100
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6027-9cca3907ea27
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d6b1-c8ff9c5c400f
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-345b-f3d3450cb3c2
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-68ae-85609ab495a3
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5119-59734f3de218
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-69cb-9a628bbfef7e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-77e8-609e102d3215
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7465-ef13964ad799
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-0422-e1889ec6a904
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f35c-f5e2a39d1d5f
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-df93-6e97181466f5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6bcc-fabd49caa5a6
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-8541-3fa02a234e5c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-fbb8-6a7fbb7bbff4
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-0acc-16d494f059f3
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d9f9-1381f963dac2
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-521f-95c13bd39bec
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ab27-18ec4019bb95
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5dd6-5537dd390743
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-76c3-d78ed6d43166
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-2edc-e20eb8ef9e8d
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-85a2-1d41a193a4d6
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-159c-563b6810c807
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-29b2-5a98ba90e4aa
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-df4e-4f9d6820db92
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ec2f-19046242c58a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-2156-9a992ece1ee0
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d85c-a1ccab5e4424
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-684e-f96c841b0a4d
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-93e7-f3aeeb69d4de
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-66b7-b9c1f4d2d146
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-3d9e-e2995d07f3df
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-db25-babc143338f4
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-861f-21a162e38a65
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5341-91791e1eb36a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-b5f2-0ba4ff08c94e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-47bd-ef404b930b1b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d746-96033ddaf793
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5be9-851c0249f91b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-1035-711296d0d441
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-b20b-0d71857ce54b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-25e7-fc15873b69b1
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-9c49-87c920aa3c94
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f2bd-a826dfb0a122
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-29ea-f979212c2bdf
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-501b-3134800e8501
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7b74-a715a454e10e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-da3d-e431e1bd7bba
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-119a-fdfb945e7309
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d636-c2d4aaf48079
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-deaf-be0a5a9ffa2c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7f59-d29c3d46ac5c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6188-c9f5e593c040
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-a448-623fe518dc69
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6991-508be094d272
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-4616-2d5827ada762
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-0d28-37b88cc1d943
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-25b6-6f7e34a0d0c5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-c3fa-41c57523f756
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-3aad-3ff6ca43512a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5798-cb95b6a3658b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-c131-255033a907a5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-75b3-90297c31edb7
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-9878-da690a246699
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-c261-160e57ecd916
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-738d-08f61a78cd3e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-b45f-cb5ecac22b4f
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-4725-06c9c3d9dfd9
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-8435-b050d1c97c3e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-afb1-6a7d9420b49e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7509-43e12f009351
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-1bbf-3f60103ad356
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-668b-368896414ea1
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f609-4add42061a6b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-be5d-ed34b290db33
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ea3b-f966171bb056
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f40a-78126f41d9c9
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7060-6ac42cc117db
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7702-e6e3b6c55986
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f223-60764f3b44e0
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-63ab-a1614ccaabbd
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-5c6c-ab0da39de80d
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-2be1-7d948b6f2410
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-e0da-094bdb36bf96
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-52b8-03267cc00b68
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6536-4b2244baa71c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-afc1-8af06f0c4a94
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ea97-8cf638985f88
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-cae7-f022bf75bf2e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-e73b-d5d4418dcd1f
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-46ee-758e386bcc7d
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-9b64-f44e66e04c4d
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d1a3-12b47d811c5c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-796c-04f7da21c50c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-0135-4319cb8e40ae
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-db5d-e25e8a341101
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-fb3e-7a32b3e27cb3
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ff9a-990f1ee7305a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f900-4c4b2142074e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-71d3-96c91c46a702
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-632a-b493ed3b4bf0
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-22af-62f2508962f9
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-12aa-3945f76a8358
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-85b3-ba559082dae5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7d96-1591a9511783
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7058-c3ad8a07923c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d7a9-804a44a60534
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-df1d-db4729aa9f7e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-057b-54dbc3b8a479
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-48d2-0a19dec66e34
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-e015-3da84e3c26fd
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-d172-f30d673e0392
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-8484-26af8334f7f8
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-bacf-00d26d467ba1
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-ef14-f0f61c3c8c7a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f983-ea8a136c441c
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-cf53-c409676f369a
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-f40d-006cdd043693
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-db6b-7b817d17260e
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-54b2-b6e78f775ceb
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-c976-659f20a7345b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-bfc7-c55a5def3d4b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-6b58-6c19745628d9
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-cc3f-67361986fe00
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-3612-9d98916f227b
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-7030-f298277bf198
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-da98-d6b8ba1cdbef
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-55bb-671265e1ab09
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-0171-92b796fda9b5
00020000-5595-4f1d-e691-fc310211132b	00030000-5595-4f1b-b3ad-739f06f8c81f
\.


--
-- TOC entry 2881 (class 0 OID 8913769)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8913800)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8913932)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5595-4f1d-e625-d79b9222d740	00090000-5595-4f1d-4f2a-f8ddea12192f	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8913534)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5595-4f1c-2bf3-a96f57252105	00040000-5595-4f1a-00db-5d0feb4f99ef	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1c-695a-b08bb5149b0d	00040000-5595-4f1a-00db-5d0feb4f99ef	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5595-4f1c-2cc0-1888a42e3e59	00040000-5595-4f1a-00db-5d0feb4f99ef	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-6f1a-5bfbe076856c	00040000-5595-4f1a-00db-5d0feb4f99ef	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-20ac-57e079f244ec	00040000-5595-4f1a-00db-5d0feb4f99ef	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-53e5-bf2b03bf553c	00040000-5595-4f1a-5cbc-591064d1acb8	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-1509-030af6b13243	00040000-5595-4f1a-b1bf-9f5c2d40e7b3	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-0620-e7960589451e	00040000-5595-4f1a-58c2-9fd3be9191fa	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5595-4f1d-ec07-8dfbae8c9a66	00040000-5595-4f1a-00db-5d0feb4f99ef	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8913569)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5595-4f1b-45d7-f67ff0080276	8341	Adlešiči
00050000-5595-4f1b-6720-30b288fc6c0c	5270	Ajdovščina
00050000-5595-4f1b-d0b5-de3f97bc4c09	6280	Ankaran/Ancarano
00050000-5595-4f1b-a22a-16b3e2aae87b	9253	Apače
00050000-5595-4f1b-d194-6b420d814cc2	8253	Artiče
00050000-5595-4f1b-7500-f62f526dc90e	4275	Begunje na Gorenjskem
00050000-5595-4f1b-4ca1-a7694f66ebe6	1382	Begunje pri Cerknici
00050000-5595-4f1b-89fb-e33de0433795	9231	Beltinci
00050000-5595-4f1b-a17e-3f6bd39b3061	2234	Benedikt
00050000-5595-4f1b-c332-2d94d05c22a3	2345	Bistrica ob Dravi
00050000-5595-4f1b-8979-e4c66907c9bc	3256	Bistrica ob Sotli
00050000-5595-4f1b-88eb-ac0c3099652d	8259	Bizeljsko
00050000-5595-4f1b-1b60-1b36d6cdc4e6	1223	Blagovica
00050000-5595-4f1b-2db8-6731fae7fe4a	8283	Blanca
00050000-5595-4f1b-5873-bef073068197	4260	Bled
00050000-5595-4f1b-5ac6-08c692e47d2c	4273	Blejska Dobrava
00050000-5595-4f1b-64d2-0e62c8f1b0eb	9265	Bodonci
00050000-5595-4f1b-b38e-11105370c203	9222	Bogojina
00050000-5595-4f1b-2374-34709266bef2	4263	Bohinjska Bela
00050000-5595-4f1b-92b1-08a28f7e3fdf	4264	Bohinjska Bistrica
00050000-5595-4f1b-1425-a9c2e496baa2	4265	Bohinjsko jezero
00050000-5595-4f1b-87ae-611e42c8b147	1353	Borovnica
00050000-5595-4f1b-6ff5-b12a3a01eb12	8294	Boštanj
00050000-5595-4f1b-6165-bfd70a5ac0d4	5230	Bovec
00050000-5595-4f1b-423a-e3f8ede4d94a	5295	Branik
00050000-5595-4f1b-9ac0-0878a79addeb	3314	Braslovče
00050000-5595-4f1b-a493-9d781daadd6b	5223	Breginj
00050000-5595-4f1b-ce89-9aaa28350c1c	8280	Brestanica
00050000-5595-4f1b-24f2-1c0638755a4a	2354	Bresternica
00050000-5595-4f1b-1b61-ac345cb3ed5c	4243	Brezje
00050000-5595-4f1b-7d4a-38518dafd724	1351	Brezovica pri Ljubljani
00050000-5595-4f1b-0368-5b7264b7b689	8250	Brežice
00050000-5595-4f1b-57c7-d699b56aa9f8	4210	Brnik - Aerodrom
00050000-5595-4f1b-c75c-439954deeff6	8321	Brusnice
00050000-5595-4f1b-2f4b-732720613214	3255	Buče
00050000-5595-4f1b-e702-037cc7495cd1	8276	Bučka 
00050000-5595-4f1b-73e0-3728b867bf7b	9261	Cankova
00050000-5595-4f1b-c1ac-08876a19d222	3000	Celje 
00050000-5595-4f1b-89c1-1ef39cb737b1	3001	Celje - poštni predali
00050000-5595-4f1b-3e2f-1cd5b5ed8388	4207	Cerklje na Gorenjskem
00050000-5595-4f1b-c08f-36cdb99286bd	8263	Cerklje ob Krki
00050000-5595-4f1b-6292-6eee90bce5b6	1380	Cerknica
00050000-5595-4f1b-ab30-ac3b0ee14e67	5282	Cerkno
00050000-5595-4f1b-273d-86d062672a1a	2236	Cerkvenjak
00050000-5595-4f1b-f8a1-babbb50d4d4b	2215	Ceršak
00050000-5595-4f1b-9ad2-c48ab3f0ddbd	2326	Cirkovce
00050000-5595-4f1b-82db-5c6a1e74a469	2282	Cirkulane
00050000-5595-4f1b-5bf2-24e3c87a80b9	5273	Col
00050000-5595-4f1b-ca67-904c7986a5af	8251	Čatež ob Savi
00050000-5595-4f1b-1401-2795d8fcccde	1413	Čemšenik
00050000-5595-4f1b-ccab-6be12faa3374	5253	Čepovan
00050000-5595-4f1b-7176-7c59ebd6220f	9232	Črenšovci
00050000-5595-4f1b-4a13-e9ed8744d87c	2393	Črna na Koroškem
00050000-5595-4f1b-5ae8-95385637876f	6275	Črni Kal
00050000-5595-4f1b-8ca2-2d1683825585	5274	Črni Vrh nad Idrijo
00050000-5595-4f1b-f0c1-50697231efc9	5262	Črniče
00050000-5595-4f1b-e5b9-6bc6bdd64a2c	8340	Črnomelj
00050000-5595-4f1b-f79f-705957ee82fb	6271	Dekani
00050000-5595-4f1b-3e4a-f4b0d196dfa9	5210	Deskle
00050000-5595-4f1b-7416-070611ee714b	2253	Destrnik
00050000-5595-4f1b-50fa-2dafcbf5c7af	6215	Divača
00050000-5595-4f1b-787d-16211084b9e9	1233	Dob
00050000-5595-4f1b-57c2-a4f9724bf30c	3224	Dobje pri Planini
00050000-5595-4f1b-3537-81262e6effb9	8257	Dobova
00050000-5595-4f1b-04cc-da20450cf039	1423	Dobovec
00050000-5595-4f1b-8510-dd4d6b0ff7a5	5263	Dobravlje
00050000-5595-4f1b-005b-114757cdfbd0	3204	Dobrna
00050000-5595-4f1b-7df5-0be47714c40b	8211	Dobrnič
00050000-5595-4f1b-b664-dbefd274687c	1356	Dobrova
00050000-5595-4f1b-536a-1878cadf71b5	9223	Dobrovnik/Dobronak 
00050000-5595-4f1b-3fdd-420c1743af64	5212	Dobrovo v Brdih
00050000-5595-4f1b-d4e4-9560e28aae26	1431	Dol pri Hrastniku
00050000-5595-4f1b-ed7a-962d9ff364f4	1262	Dol pri Ljubljani
00050000-5595-4f1b-858b-df8989ae817a	1273	Dole pri Litiji
00050000-5595-4f1b-361a-88e8223ed623	1331	Dolenja vas
00050000-5595-4f1b-9961-82bfc08b9594	8350	Dolenjske Toplice
00050000-5595-4f1b-cea1-c1a50e2df145	1230	Domžale
00050000-5595-4f1b-3182-2582ba6f0a49	2252	Dornava
00050000-5595-4f1b-0673-5a2c4f2c3729	5294	Dornberk
00050000-5595-4f1b-1786-f849a28baae2	1319	Draga
00050000-5595-4f1b-941c-fa30e0ff3d2d	8343	Dragatuš
00050000-5595-4f1b-badc-efb20c1e9206	3222	Dramlje
00050000-5595-4f1b-0aa3-8be8aae72aec	2370	Dravograd
00050000-5595-4f1b-64de-13949278e545	4203	Duplje
00050000-5595-4f1b-9af6-0fef94d06f26	6221	Dutovlje
00050000-5595-4f1b-6174-947070283f5e	8361	Dvor
00050000-5595-4f1b-2eb7-538481c5cb88	2343	Fala
00050000-5595-4f1b-3b61-c752fd13914d	9208	Fokovci
00050000-5595-4f1b-e4a7-284ccfead716	2313	Fram
00050000-5595-4f1b-72f7-6d61093da014	3213	Frankolovo
00050000-5595-4f1b-9f1d-956186eeed82	1274	Gabrovka
00050000-5595-4f1b-34a7-c947318e6066	8254	Globoko
00050000-5595-4f1b-28cd-5325ebecef01	5275	Godovič
00050000-5595-4f1b-ba03-70683d079fa2	4204	Golnik
00050000-5595-4f1b-65f9-68cd5fcdfb35	3303	Gomilsko
00050000-5595-4f1b-af48-a2fee4c65de3	4224	Gorenja vas
00050000-5595-4f1b-68d2-332b269e74c0	3263	Gorica pri Slivnici
00050000-5595-4f1b-6653-de69f719b03c	2272	Gorišnica
00050000-5595-4f1b-4c26-d79e911c6b8d	9250	Gornja Radgona
00050000-5595-4f1b-ed21-809fbb3a2bfa	3342	Gornji Grad
00050000-5595-4f1b-aeaf-e96ffba8b239	4282	Gozd Martuljek
00050000-5595-4f1b-fe4a-d78eb6b1cd96	6272	Gračišče
00050000-5595-4f1b-5e08-bcfabfcfb82f	9264	Grad
00050000-5595-4f1b-a080-11b06fd6e982	8332	Gradac
00050000-5595-4f1b-b3e1-9a96d77eca17	1384	Grahovo
00050000-5595-4f1b-4772-a0489b508ced	5242	Grahovo ob Bači
00050000-5595-4f1b-9293-b56780d3193d	5251	Grgar
00050000-5595-4f1b-46cc-59e703db0a3e	3302	Griže
00050000-5595-4f1b-ec40-d9b47cc7ccf0	3231	Grobelno
00050000-5595-4f1b-1be4-b798f1460028	1290	Grosuplje
00050000-5595-4f1b-5a3e-f9df04d4725f	2288	Hajdina
00050000-5595-4f1b-3787-5e03434b5ea5	8362	Hinje
00050000-5595-4f1b-d009-ab4eba13f096	2311	Hoče
00050000-5595-4f1b-5b81-d6b4e6e0b582	9205	Hodoš/Hodos
00050000-5595-4f1b-ccb8-ca446d196336	1354	Horjul
00050000-5595-4f1b-6476-81f89897761e	1372	Hotedršica
00050000-5595-4f1b-cabf-d1d9ee24e841	1430	Hrastnik
00050000-5595-4f1b-bc80-bedb3705144a	6225	Hruševje
00050000-5595-4f1b-9278-80b0567e8f9b	4276	Hrušica
00050000-5595-4f1b-30cf-72f0304c065e	5280	Idrija
00050000-5595-4f1b-f538-564e65a71656	1292	Ig
00050000-5595-4f1b-2d0b-e31652ebd9ef	6250	Ilirska Bistrica
00050000-5595-4f1b-9595-a5b0a63a1b09	6251	Ilirska Bistrica-Trnovo
00050000-5595-4f1b-6988-445f713f555a	1295	Ivančna Gorica
00050000-5595-4f1b-6fd5-649876b361ed	2259	Ivanjkovci
00050000-5595-4f1b-b50e-7b3753499727	1411	Izlake
00050000-5595-4f1b-e144-f2ecdd86f430	6310	Izola/Isola
00050000-5595-4f1b-7dca-5bdf110997a1	2222	Jakobski Dol
00050000-5595-4f1b-a1c2-68773ad814fc	2221	Jarenina
00050000-5595-4f1b-6ba3-989142c4be18	6254	Jelšane
00050000-5595-4f1b-a12a-29bc635c73ff	4270	Jesenice
00050000-5595-4f1b-ee5b-4acb646a2291	8261	Jesenice na Dolenjskem
00050000-5595-4f1b-ab1b-6f6e4c63c81e	3273	Jurklošter
00050000-5595-4f1b-a5de-7c20fe2f96b6	2223	Jurovski Dol
00050000-5595-4f1b-5368-d14108e12570	2256	Juršinci
00050000-5595-4f1b-9b20-7de066804dd3	5214	Kal nad Kanalom
00050000-5595-4f1b-5fe6-17b6cb0feb87	3233	Kalobje
00050000-5595-4f1b-5e3e-20f252f98d73	4246	Kamna Gorica
00050000-5595-4f1b-3aff-6348a7a4cbf3	2351	Kamnica
00050000-5595-4f1b-f7f1-a371c4353599	1241	Kamnik
00050000-5595-4f1b-fcb5-8901dfc0d804	5213	Kanal
00050000-5595-4f1b-0420-9b969f86d278	8258	Kapele
00050000-5595-4f1b-7bb2-81baa06e2b8c	2362	Kapla
00050000-5595-4f1b-8ed8-a8f177be97e3	2325	Kidričevo
00050000-5595-4f1b-3147-6a096b3e3759	1412	Kisovec
00050000-5595-4f1b-b8ea-a5d106ea750e	6253	Knežak
00050000-5595-4f1b-5972-292a41995fe3	5222	Kobarid
00050000-5595-4f1b-1f1e-1d0f6e05a336	9227	Kobilje
00050000-5595-4f1b-c062-cfd7ee0859f4	1330	Kočevje
00050000-5595-4f1b-f83a-879ed60bf6ec	1338	Kočevska Reka
00050000-5595-4f1b-6e6e-13c04a8ecfea	2276	Kog
00050000-5595-4f1b-3642-8878a804fa32	5211	Kojsko
00050000-5595-4f1b-2c2d-2d5e34265401	6223	Komen
00050000-5595-4f1b-363c-750d4ecc97a7	1218	Komenda
00050000-5595-4f1b-ab4b-4fdd62637256	6000	Koper/Capodistria 
00050000-5595-4f1b-776e-6cf3fbcdc08a	6001	Koper/Capodistria - poštni predali
00050000-5595-4f1b-9cb4-4a74c92d639a	8282	Koprivnica
00050000-5595-4f1b-9efd-c705abd6eb4f	5296	Kostanjevica na Krasu
00050000-5595-4f1b-7528-b89309a0b30d	8311	Kostanjevica na Krki
00050000-5595-4f1b-a37b-84cee21a5d05	1336	Kostel
00050000-5595-4f1b-90cb-55785494b12c	6256	Košana
00050000-5595-4f1b-78fe-7d17ddfb6ce9	2394	Kotlje
00050000-5595-4f1b-565f-79454d053a56	6240	Kozina
00050000-5595-4f1b-276b-b606cee5a243	3260	Kozje
00050000-5595-4f1b-2d29-346908334d84	4000	Kranj 
00050000-5595-4f1b-58a7-287376401541	4001	Kranj - poštni predali
00050000-5595-4f1b-6add-27317afac286	4280	Kranjska Gora
00050000-5595-4f1b-8e42-621c0ca96aad	1281	Kresnice
00050000-5595-4f1b-d926-474075702fe2	4294	Križe
00050000-5595-4f1b-9022-6223d0b065d2	9206	Križevci
00050000-5595-4f1b-c16f-45fea82816f6	9242	Križevci pri Ljutomeru
00050000-5595-4f1b-a5bc-8fc1d3f75f08	1301	Krka
00050000-5595-4f1b-079b-7a234297cbf5	8296	Krmelj
00050000-5595-4f1b-38df-16d3c75c6f6b	4245	Kropa
00050000-5595-4f1b-1c80-8ed6e2f80381	8262	Krška vas
00050000-5595-4f1b-f0ed-3e9694011bef	8270	Krško
00050000-5595-4f1b-0526-cdba86624c91	9263	Kuzma
00050000-5595-4f1b-592d-6a4073941f1d	2318	Laporje
00050000-5595-4f1b-81fc-2a85cd44882c	3270	Laško
00050000-5595-4f1b-45c8-8ce048c48951	1219	Laze v Tuhinju
00050000-5595-4f1b-ce07-3400713be292	2230	Lenart v Slovenskih goricah
00050000-5595-4f1b-8e99-9453799bde47	9220	Lendava/Lendva
00050000-5595-4f1b-f9d9-ca90931d5465	4248	Lesce
00050000-5595-4f1b-19a2-7865ee2e5b9f	3261	Lesično
00050000-5595-4f1b-4492-e310c7ca28cd	8273	Leskovec pri Krškem
00050000-5595-4f1b-255a-4c085d2d3156	2372	Libeliče
00050000-5595-4f1b-2bdb-88e56e1f7503	2341	Limbuš
00050000-5595-4f1b-e52d-9b6854a93006	1270	Litija
00050000-5595-4f1b-1975-912939154814	3202	Ljubečna
00050000-5595-4f1b-9729-a30fd7736dc7	1000	Ljubljana 
00050000-5595-4f1b-f9ab-9797585c1f47	1001	Ljubljana - poštni predali
00050000-5595-4f1b-178b-08c3dbe785fa	1231	Ljubljana - Črnuče
00050000-5595-4f1b-61b4-9a0b72b6f863	1261	Ljubljana - Dobrunje
00050000-5595-4f1b-46dd-b6f38f47df26	1260	Ljubljana - Polje
00050000-5595-4f1b-f9e2-5de482a93cff	1210	Ljubljana - Šentvid
00050000-5595-4f1b-bac5-f86dfd0f6496	1211	Ljubljana - Šmartno
00050000-5595-4f1b-f450-0db51ba23626	3333	Ljubno ob Savinji
00050000-5595-4f1b-6dc4-bfb9a8240695	9240	Ljutomer
00050000-5595-4f1b-95b2-49b3d302ba58	3215	Loče
00050000-5595-4f1b-8bb0-72f2d9f7bd9e	5231	Log pod Mangartom
00050000-5595-4f1b-50d5-48127c3ff7e1	1358	Log pri Brezovici
00050000-5595-4f1b-dfd0-a5dea9ef3ff7	1370	Logatec
00050000-5595-4f1b-6681-1a37f59a8680	1371	Logatec
00050000-5595-4f1b-ef99-cec05b027ca4	1434	Loka pri Zidanem Mostu
00050000-5595-4f1b-0ee1-170f4f9fdcf5	3223	Loka pri Žusmu
00050000-5595-4f1b-93bb-d35b58614808	6219	Lokev
00050000-5595-4f1b-911d-bdbfc7bd1027	1318	Loški Potok
00050000-5595-4f1b-25e5-a45304b99f9b	2324	Lovrenc na Dravskem polju
00050000-5595-4f1b-e19d-1e8d600df4bb	2344	Lovrenc na Pohorju
00050000-5595-4f1b-775e-7f934e62d648	3334	Luče
00050000-5595-4f1b-1bba-b36041cc2a55	1225	Lukovica
00050000-5595-4f1b-6688-2acc58f0dec1	9202	Mačkovci
00050000-5595-4f1b-d540-6c4b0651a448	2322	Majšperk
00050000-5595-4f1b-5334-7639de0ba181	2321	Makole
00050000-5595-4f1b-bb09-8849a0ab5d04	9243	Mala Nedelja
00050000-5595-4f1b-370a-1a79831d1a5e	2229	Malečnik
00050000-5595-4f1b-f5c9-8e7ef5d49f1b	6273	Marezige
00050000-5595-4f1b-03c7-757e2b750995	2000	Maribor 
00050000-5595-4f1b-7f57-83969cc90299	2001	Maribor - poštni predali
00050000-5595-4f1b-4e06-7d2f5bdca62a	2206	Marjeta na Dravskem polju
00050000-5595-4f1b-6bb0-9ea762893a0c	2281	Markovci
00050000-5595-4f1b-ac41-bb85f33f0a59	9221	Martjanci
00050000-5595-4f1b-b8c8-91a946e79963	6242	Materija
00050000-5595-4f1b-d8b0-2efa1c00c8bc	4211	Mavčiče
00050000-5595-4f1b-5d64-174651ed719b	1215	Medvode
00050000-5595-4f1b-e3eb-6c0208fc204b	1234	Mengeš
00050000-5595-4f1b-8b9b-dedb19373287	8330	Metlika
00050000-5595-4f1b-7e58-94d524d6679c	2392	Mežica
00050000-5595-4f1b-6499-08a5d8afa0e3	2204	Miklavž na Dravskem polju
00050000-5595-4f1b-e58a-7d82cfaa65cd	2275	Miklavž pri Ormožu
00050000-5595-4f1b-8516-fa0265e23998	5291	Miren
00050000-5595-4f1b-7764-ff107503a38a	8233	Mirna
00050000-5595-4f1b-1a17-5ffe2be97e13	8216	Mirna Peč
00050000-5595-4f1b-2bbe-510ab04f8f88	2382	Mislinja
00050000-5595-4f1b-e57f-e9c1cc3e72af	4281	Mojstrana
00050000-5595-4f1b-b5f7-c5ffcf3b88f0	8230	Mokronog
00050000-5595-4f1b-f91a-8b2a98f78bff	1251	Moravče
00050000-5595-4f1b-a8ea-8756433d92a9	9226	Moravske Toplice
00050000-5595-4f1b-4c04-011ac46d97f4	5216	Most na Soči
00050000-5595-4f1b-519f-1c68ceaee2bf	1221	Motnik
00050000-5595-4f1b-82d1-ccbce5c2d89e	3330	Mozirje
00050000-5595-4f1b-e000-48e3d32fe26a	9000	Murska Sobota 
00050000-5595-4f1b-ea02-63d13ef994e4	9001	Murska Sobota - poštni predali
00050000-5595-4f1b-b998-3b2f0336fefc	2366	Muta
00050000-5595-4f1b-59f3-c11c4ca9d250	4202	Naklo
00050000-5595-4f1b-4196-f9a243079a5e	3331	Nazarje
00050000-5595-4f1b-b44d-eae447c6b3fd	1357	Notranje Gorice
00050000-5595-4f1b-84f8-a079c06e1b6e	3203	Nova Cerkev
00050000-5595-4f1b-5ad4-bc810faad301	5000	Nova Gorica 
00050000-5595-4f1b-fe47-98502c8f7e29	5001	Nova Gorica - poštni predali
00050000-5595-4f1b-13ec-d052caef2d0a	1385	Nova vas
00050000-5595-4f1b-1c82-d4478fbb05e8	8000	Novo mesto
00050000-5595-4f1b-3ffd-1bd7b5da51c8	8001	Novo mesto - poštni predali
00050000-5595-4f1b-2c4e-aac7d05b2b91	6243	Obrov
00050000-5595-4f1b-d7aa-830d1fa10268	9233	Odranci
00050000-5595-4f1b-351e-6084969d88ca	2317	Oplotnica
00050000-5595-4f1b-0e26-6948a23480ab	2312	Orehova vas
00050000-5595-4f1b-e056-6801e5b16999	2270	Ormož
00050000-5595-4f1b-6777-51305cd9bb7c	1316	Ortnek
00050000-5595-4f1b-d8db-737d7af7b5c3	1337	Osilnica
00050000-5595-4f1b-ee7a-bb6ae2c7042d	8222	Otočec
00050000-5595-4f1b-c334-64f85aae21ad	2361	Ožbalt
00050000-5595-4f1b-0c92-ef70fa0a231f	2231	Pernica
00050000-5595-4f1b-2bd6-440c3aaf640e	2211	Pesnica pri Mariboru
00050000-5595-4f1b-b73b-4e2d3c505e5f	9203	Petrovci
00050000-5595-4f1b-74ca-c0c3225008f5	3301	Petrovče
00050000-5595-4f1b-63c4-1a6d275662ec	6330	Piran/Pirano
00050000-5595-4f1b-2391-0f0fa6e21731	8255	Pišece
00050000-5595-4f1b-7701-dc5ddc5f9c43	6257	Pivka
00050000-5595-4f1b-a99d-3549d24f6888	6232	Planina
00050000-5595-4f1b-01f6-e1e6deef88b9	3225	Planina pri Sevnici
00050000-5595-4f1b-3534-50244ec354d5	6276	Pobegi
00050000-5595-4f1b-bee9-564129f22297	8312	Podbočje
00050000-5595-4f1b-8e6f-8b8ef2e3a92a	5243	Podbrdo
00050000-5595-4f1b-b348-18eb10b8930c	3254	Podčetrtek
00050000-5595-4f1b-54ca-c76c8f6afe91	2273	Podgorci
00050000-5595-4f1b-5af8-dd45966c99ec	6216	Podgorje
00050000-5595-4f1b-5da7-c64c1613a091	2381	Podgorje pri Slovenj Gradcu
00050000-5595-4f1b-c776-1ef7dbf72d77	6244	Podgrad
00050000-5595-4f1b-4ab7-e47b5e4415c4	1414	Podkum
00050000-5595-4f1b-b2d8-d3b18a874383	2286	Podlehnik
00050000-5595-4f1b-7033-046941e7440d	5272	Podnanos
00050000-5595-4f1b-1673-36adc1530418	4244	Podnart
00050000-5595-4f1b-f141-f7ed9326ff44	3241	Podplat
00050000-5595-4f1b-c2e5-3a853079d99e	3257	Podsreda
00050000-5595-4f1b-2e97-bc52898c0cc8	2363	Podvelka
00050000-5595-4f1b-603c-fa0a6ac8f955	2208	Pohorje
00050000-5595-4f1b-a29d-f214cd38a62c	2257	Polenšak
00050000-5595-4f1b-ba98-95b0f0117cab	1355	Polhov Gradec
00050000-5595-4f1b-f563-46fcdf7e8aa6	4223	Poljane nad Škofjo Loko
00050000-5595-4f1b-ef5a-dc8ed35d25f5	2319	Poljčane
00050000-5595-4f1b-922e-a4463a37be8d	1272	Polšnik
00050000-5595-4f1b-7db8-12526c233959	3313	Polzela
00050000-5595-4f1b-6b53-335c20cf3561	3232	Ponikva
00050000-5595-4f1b-d447-e0c73a576326	6320	Portorož/Portorose
00050000-5595-4f1b-049a-cf76f22070d4	6230	Postojna
00050000-5595-4f1b-89dc-ece799cecc35	2331	Pragersko
00050000-5595-4f1b-5b4e-8c746bba9884	3312	Prebold
00050000-5595-4f1b-6808-197bb2f1c360	4205	Preddvor
00050000-5595-4f1b-f947-47d03490ce5e	6255	Prem
00050000-5595-4f1b-ebb3-8f622197b87a	1352	Preserje
00050000-5595-4f1b-c09e-68c9d8365b44	6258	Prestranek
00050000-5595-4f1b-27ab-66b542142fcf	2391	Prevalje
00050000-5595-4f1b-8f62-e96781fc87c6	3262	Prevorje
00050000-5595-4f1b-911a-f1cb71a394b2	1276	Primskovo 
00050000-5595-4f1b-119a-ab8ea746b3c4	3253	Pristava pri Mestinju
00050000-5595-4f1b-5e53-c8b83ba7dc64	9207	Prosenjakovci/Partosfalva
00050000-5595-4f1b-2a6f-8337d53731fb	5297	Prvačina
00050000-5595-4f1b-6b58-9778cbf596d1	2250	Ptuj
00050000-5595-4f1b-2ff7-115f679c3c9a	2323	Ptujska Gora
00050000-5595-4f1b-b644-f95c7b450ef6	9201	Puconci
00050000-5595-4f1b-02a8-aeadf43b81f6	2327	Rače
00050000-5595-4f1b-b71f-69b7471f6262	1433	Radeče
00050000-5595-4f1b-39be-2ee0ff2049bf	9252	Radenci
00050000-5595-4f1b-3444-387b55ba0a0a	2360	Radlje ob Dravi
00050000-5595-4f1b-e810-49233bbf1e84	1235	Radomlje
00050000-5595-4f1b-5b6a-08b2e7b1287f	4240	Radovljica
00050000-5595-4f1b-a0f2-fe42a1b1829f	8274	Raka
00050000-5595-4f1b-658e-9cafa39acf9a	1381	Rakek
00050000-5595-4f1b-9f9c-914f3933ce69	4283	Rateče - Planica
00050000-5595-4f1b-04f2-e3d69a38297d	2390	Ravne na Koroškem
00050000-5595-4f1b-2013-e3b809a3ce5f	9246	Razkrižje
00050000-5595-4f1b-4393-e945cc42b477	3332	Rečica ob Savinji
00050000-5595-4f1b-3149-dd2ba1e302e6	5292	Renče
00050000-5595-4f1b-0d3b-4eb822912c31	1310	Ribnica
00050000-5595-4f1b-02d0-47c8cdb3793e	2364	Ribnica na Pohorju
00050000-5595-4f1b-bd98-0e1c88aea0b2	3272	Rimske Toplice
00050000-5595-4f1b-8886-59048939379d	1314	Rob
00050000-5595-4f1b-3f3f-f46070f9638e	5215	Ročinj
00050000-5595-4f1b-0098-7bbd6fcbc982	3250	Rogaška Slatina
00050000-5595-4f1b-85b8-3a86938920bc	9262	Rogašovci
00050000-5595-4f1b-3994-835b82c26243	3252	Rogatec
00050000-5595-4f1b-c6e6-ff32b416c204	1373	Rovte
00050000-5595-4f1b-f508-6a668b609dd3	2342	Ruše
00050000-5595-4f1b-7793-ac3b4e537871	1282	Sava
00050000-5595-4f1b-3c0b-b308979dc070	6333	Sečovlje/Sicciole
00050000-5595-4f1b-ba62-dcec75434780	4227	Selca
00050000-5595-4f1b-9640-2b5a22806282	2352	Selnica ob Dravi
00050000-5595-4f1b-1343-075d352d809a	8333	Semič
00050000-5595-4f1b-88a8-d9d70b452a90	8281	Senovo
00050000-5595-4f1b-1965-c9736d79ea91	6224	Senožeče
00050000-5595-4f1b-b9ca-69b8693b0a3d	8290	Sevnica
00050000-5595-4f1b-dc24-f44d2209d5b2	6210	Sežana
00050000-5595-4f1b-5b3a-30f517b433b4	2214	Sladki Vrh
00050000-5595-4f1b-e1d1-c3f08871170f	5283	Slap ob Idrijci
00050000-5595-4f1b-8ebf-171eaaa3dd60	2380	Slovenj Gradec
00050000-5595-4f1b-29fa-ee0e93153042	2310	Slovenska Bistrica
00050000-5595-4f1b-148d-2751db3f9608	3210	Slovenske Konjice
00050000-5595-4f1b-0869-41b4b7db2bab	1216	Smlednik
00050000-5595-4f1b-6d05-7cf1a54dcaad	5232	Soča
00050000-5595-4f1b-42a4-323c5445239c	1317	Sodražica
00050000-5595-4f1b-47ac-606d1c6291c6	3335	Solčava
00050000-5595-4f1b-4889-211549db7703	5250	Solkan
00050000-5595-4f1b-5f65-79d1a1495981	4229	Sorica
00050000-5595-4f1b-8504-0106e0f1fb46	4225	Sovodenj
00050000-5595-4f1b-e630-590f6782156e	5281	Spodnja Idrija
00050000-5595-4f1b-f330-8b10d8375bc8	2241	Spodnji Duplek
00050000-5595-4f1b-1149-5b109b340fa8	9245	Spodnji Ivanjci
00050000-5595-4f1b-e0ff-51e015d10ef5	2277	Središče ob Dravi
00050000-5595-4f1b-aef9-d788acfc2c61	4267	Srednja vas v Bohinju
00050000-5595-4f1b-6f28-e3c6a8077a33	8256	Sromlje 
00050000-5595-4f1b-1b98-b03e9adcd8b1	5224	Srpenica
00050000-5595-4f1b-b877-65b4fc557534	1242	Stahovica
00050000-5595-4f1b-8f3e-a5c11b107448	1332	Stara Cerkev
00050000-5595-4f1b-07de-3f67fc8d9a12	8342	Stari trg ob Kolpi
00050000-5595-4f1b-056f-d1454361037a	1386	Stari trg pri Ložu
00050000-5595-4f1b-6803-e465d1637e2e	2205	Starše
00050000-5595-4f1b-1f93-ec4c7232c92c	2289	Stoperce
00050000-5595-4f1b-cfd9-6f1d9cd7ed8e	8322	Stopiče
00050000-5595-4f1b-af65-a9a153007dfd	3206	Stranice
00050000-5595-4f1b-7112-674b20c2798c	8351	Straža
00050000-5595-4f1b-e013-a8e1a19f0484	1313	Struge
00050000-5595-4f1b-1b16-176ab949890e	8293	Studenec
00050000-5595-4f1b-646c-9ec063448562	8331	Suhor
00050000-5595-4f1b-4802-e17539d3925c	2233	Sv. Ana v Slovenskih goricah
00050000-5595-4f1b-a683-71ff3af6c85d	2235	Sv. Trojica v Slovenskih goricah
00050000-5595-4f1b-32f1-be19954ae4c4	2353	Sveti Duh na Ostrem Vrhu
00050000-5595-4f1b-c0c0-5d8b9d8df01b	9244	Sveti Jurij ob Ščavnici
00050000-5595-4f1b-acdc-0d8a0a0060ca	3264	Sveti Štefan
00050000-5595-4f1b-1932-5569f75cedab	2258	Sveti Tomaž
00050000-5595-4f1b-6439-1f6feb89dc6d	9204	Šalovci
00050000-5595-4f1b-914c-f467df2f4f57	5261	Šempas
00050000-5595-4f1b-49f6-8cfb10258bbf	5290	Šempeter pri Gorici
00050000-5595-4f1b-2a2a-ebb0bb11b7ed	3311	Šempeter v Savinjski dolini
00050000-5595-4f1b-cba7-a866ddcd2e94	4208	Šenčur
00050000-5595-4f1b-52df-50daa0ee9624	2212	Šentilj v Slovenskih goricah
00050000-5595-4f1b-a150-fd41f2309a2d	8297	Šentjanž
00050000-5595-4f1b-11c5-16fa93a73e60	2373	Šentjanž pri Dravogradu
00050000-5595-4f1b-f3d1-7ee52bc631bf	8310	Šentjernej
00050000-5595-4f1b-1cd1-800d0e1acda8	3230	Šentjur
00050000-5595-4f1b-9bd3-d74edcafe15f	3271	Šentrupert
00050000-5595-4f1b-0145-4ffa09e95c69	8232	Šentrupert
00050000-5595-4f1b-5753-b61c5312432a	1296	Šentvid pri Stični
00050000-5595-4f1b-8daa-762f18c4d511	8275	Škocjan
00050000-5595-4f1b-9cf2-2aafd9d5fdd1	6281	Škofije
00050000-5595-4f1b-cb35-531affa8174a	4220	Škofja Loka
00050000-5595-4f1b-92da-c48eee28887c	3211	Škofja vas
00050000-5595-4f1b-52dd-db31bb60567b	1291	Škofljica
00050000-5595-4f1b-3b80-9f98331bfc5b	6274	Šmarje
00050000-5595-4f1b-eadc-40db274e99d9	1293	Šmarje - Sap
00050000-5595-4f1b-87dc-0958216e3601	3240	Šmarje pri Jelšah
00050000-5595-4f1b-4703-2ee81d38a257	8220	Šmarješke Toplice
00050000-5595-4f1b-0bc0-4d1cd9eef5f7	2315	Šmartno na Pohorju
00050000-5595-4f1b-277a-7e584d03511c	3341	Šmartno ob Dreti
00050000-5595-4f1b-fbbd-b83e017142d9	3327	Šmartno ob Paki
00050000-5595-4f1b-18e2-0a6ce07d2280	1275	Šmartno pri Litiji
00050000-5595-4f1b-ed01-b1dd51100975	2383	Šmartno pri Slovenj Gradcu
00050000-5595-4f1b-7057-4d3b25b5b924	3201	Šmartno v Rožni dolini
00050000-5595-4f1b-b2d9-63b11b3c438e	3325	Šoštanj
00050000-5595-4f1b-d19b-98355fb534db	6222	Štanjel
00050000-5595-4f1b-0cef-0ec8ac1f6200	3220	Štore
00050000-5595-4f1b-43d1-c203f08e359d	3304	Tabor
00050000-5595-4f1b-ac50-92d8487e1aaf	3221	Teharje
00050000-5595-4f1b-5898-e30a05e23d9d	9251	Tišina
00050000-5595-4f1b-da31-c27823e10baf	5220	Tolmin
00050000-5595-4f1b-e235-826b93758a28	3326	Topolšica
00050000-5595-4f1b-3ec8-571dbf852e38	2371	Trbonje
00050000-5595-4f1b-48cf-9106403f8eec	1420	Trbovlje
00050000-5595-4f1b-85ce-e961f137d5b4	8231	Trebelno 
00050000-5595-4f1b-1646-20600d21c2ed	8210	Trebnje
00050000-5595-4f1b-0308-090c36ba8220	5252	Trnovo pri Gorici
00050000-5595-4f1b-e26d-94384a1e114f	2254	Trnovska vas
00050000-5595-4f1b-ff90-84e4251efe08	1222	Trojane
00050000-5595-4f1b-ec8d-f4ef593f7fc1	1236	Trzin
00050000-5595-4f1b-5e3c-d3f3260aae29	4290	Tržič
00050000-5595-4f1b-218b-6d72aaa7887f	8295	Tržišče
00050000-5595-4f1b-9425-553c54b4d078	1311	Turjak
00050000-5595-4f1b-984f-a2df2e9d45a8	9224	Turnišče
00050000-5595-4f1b-5f10-91a8aa293d75	8323	Uršna sela
00050000-5595-4f1b-a8e4-623fcb87d700	1252	Vače
00050000-5595-4f1b-74b9-b76a591781c4	3320	Velenje 
00050000-5595-4f1b-7567-30d1a61471fb	3322	Velenje - poštni predali
00050000-5595-4f1b-cab3-6bb778c0413a	8212	Velika Loka
00050000-5595-4f1b-dd7e-b4f569232448	2274	Velika Nedelja
00050000-5595-4f1b-da01-658a8c95ecac	9225	Velika Polana
00050000-5595-4f1b-7fd4-41624360bbdb	1315	Velike Lašče
00050000-5595-4f1b-03aa-374ba4d45089	8213	Veliki Gaber
00050000-5595-4f1b-5fb4-86ada078e940	9241	Veržej
00050000-5595-4f1b-79a5-6d298e57f004	1312	Videm - Dobrepolje
00050000-5595-4f1b-e2ea-ee17a479e090	2284	Videm pri Ptuju
00050000-5595-4f1b-9545-4f4e8786ab25	8344	Vinica
00050000-5595-4f1b-4c5d-baf3ba425c0d	5271	Vipava
00050000-5595-4f1b-85ae-21300efd4954	4212	Visoko
00050000-5595-4f1b-eaf2-85218ed7c2ea	1294	Višnja Gora
00050000-5595-4f1b-106b-235c36d5950e	3205	Vitanje
00050000-5595-4f1b-f7b2-60801f33034d	2255	Vitomarci
00050000-5595-4f1b-ba63-70120956085f	1217	Vodice
00050000-5595-4f1b-0e57-a0a0a8c3eeb0	3212	Vojnik\t
00050000-5595-4f1b-05c3-a6f1ee6e63de	5293	Volčja Draga
00050000-5595-4f1b-30da-473285adbd5b	2232	Voličina
00050000-5595-4f1b-ac07-e64ce51579ae	3305	Vransko
00050000-5595-4f1b-65c9-13f6fe080cac	6217	Vremski Britof
00050000-5595-4f1b-989e-f8c6b4b509bc	1360	Vrhnika
00050000-5595-4f1b-e90e-32853c193461	2365	Vuhred
00050000-5595-4f1b-157a-13bb95dc06b0	2367	Vuzenica
00050000-5595-4f1b-739d-c0c149760a45	8292	Zabukovje 
00050000-5595-4f1b-567c-dd10b27cd121	1410	Zagorje ob Savi
00050000-5595-4f1b-f53d-30cf0fad2e71	1303	Zagradec
00050000-5595-4f1b-e5a7-38f07879f054	2283	Zavrč
00050000-5595-4f1b-d348-5b5734c03987	8272	Zdole 
00050000-5595-4f1b-f0c6-b564e2b5815b	4201	Zgornja Besnica
00050000-5595-4f1b-7209-3fef3890a516	2242	Zgornja Korena
00050000-5595-4f1b-f7b0-127b7e1aa08f	2201	Zgornja Kungota
00050000-5595-4f1b-7d4e-116a12f0958e	2316	Zgornja Ložnica
00050000-5595-4f1b-219f-7bccc8029e8d	2314	Zgornja Polskava
00050000-5595-4f1b-ed8b-cdb7306a2daa	2213	Zgornja Velka
00050000-5595-4f1b-1ca2-7ead281c313a	4247	Zgornje Gorje
00050000-5595-4f1b-c51b-0ee958134ff6	4206	Zgornje Jezersko
00050000-5595-4f1b-1797-974a9b0375d8	2285	Zgornji Leskovec
00050000-5595-4f1b-cae6-1a411d345a45	1432	Zidani Most
00050000-5595-4f1b-8e56-e0cffd4a0105	3214	Zreče
00050000-5595-4f1b-e018-703e46bf10e0	4209	Žabnica
00050000-5595-4f1b-afad-033a82bef0d3	3310	Žalec
00050000-5595-4f1b-6f5c-1164dd66f092	4228	Železniki
00050000-5595-4f1b-798d-0d6a6f68040d	2287	Žetale
00050000-5595-4f1b-7810-5593af640a98	4226	Žiri
00050000-5595-4f1b-9a32-ed4e360a6456	4274	Žirovnica
00050000-5595-4f1b-282a-80a1c38cdc92	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8913743)
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
-- TOC entry 2859 (class 0 OID 8913554)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8913632)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8913755)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8913875)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8913924)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5595-4f1d-7edc-e08c40cd4f9b	00080000-5595-4f1d-ec07-8dfbae8c9a66	0900	AK
00190000-5595-4f1d-2ddc-c9f8290499e7	00080000-5595-4f1c-2cc0-1888a42e3e59	0987	A
00190000-5595-4f1d-abfb-b1baa338a6e4	00080000-5595-4f1c-695a-b08bb5149b0d	0989	A
00190000-5595-4f1d-0ddc-4c22f442f530	00080000-5595-4f1d-6f1a-5bfbe076856c	0986	A
00190000-5595-4f1d-8690-82f0e02605ff	00080000-5595-4f1d-53e5-bf2b03bf553c	0984	A
00190000-5595-4f1d-630f-ebd965548eb0	00080000-5595-4f1d-1509-030af6b13243	0983	A
00190000-5595-4f1d-abd8-af324e11165c	00080000-5595-4f1d-0620-e7960589451e	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8914058)
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
-- TOC entry 2883 (class 0 OID 8913784)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5595-4f1c-12fa-482b90882c9c	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5595-4f1c-0303-f414dabd6e3a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5595-4f1c-1b09-d27be303cb99	0003	Kazinska	t	84	Kazinska dvorana
00220000-5595-4f1c-d431-f9d8c69488e7	0004	Mali oder	t	24	Mali oder 
00220000-5595-4f1c-9d9a-c03e334331aa	0005	Komorni oder	t	15	Komorni oder
00220000-5595-4f1c-9bf8-3a60a6ef8b2f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5595-4f1c-80c7-f50867958eb4	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8913728)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8913718)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8913913)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8913852)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8913426)
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
-- TOC entry 2884 (class 0 OID 8913794)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8913464)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5595-4f1b-3e52-9d32aa682b2b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5595-4f1b-26c0-f5ceda57d8f8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5595-4f1b-197b-e8789ed9e061	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5595-4f1b-dcee-88a03e6a4abe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5595-4f1b-b66a-8547fa5d183e	planer	Planer dogodkov v koledarju	t
00020000-5595-4f1b-66f6-e2e02b146089	kadrovska	Kadrovska služba	t
00020000-5595-4f1b-b85f-465c7f3f7981	arhivar	Ažuriranje arhivalij	t
00020000-5595-4f1b-07eb-f80b7261e7a0	igralec	Igralec	t
00020000-5595-4f1b-8eb8-3a172c2cedc3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5595-4f1d-e691-fc310211132b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8913448)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5595-4f1b-0113-a62247cf0b3a	00020000-5595-4f1b-197b-e8789ed9e061
00010000-5595-4f1b-2081-9a19e9fda2c8	00020000-5595-4f1b-197b-e8789ed9e061
00010000-5595-4f1d-0129-7c07278b1574	00020000-5595-4f1d-e691-fc310211132b
\.


--
-- TOC entry 2886 (class 0 OID 8913808)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8913749)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8913699)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8914108)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5595-4f1c-92cd-7958722bdfc7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5595-4f1c-8c19-2387cd8d6005	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5595-4f1c-06b4-15ed5f159f9c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5595-4f1c-cbef-c8718cdb8b9d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5595-4f1c-6984-15931224d25e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8914100)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5595-4f1c-07a0-799487165138	00230000-5595-4f1c-cbef-c8718cdb8b9d	popa
00240000-5595-4f1c-c89a-3a4786cc9ba8	00230000-5595-4f1c-cbef-c8718cdb8b9d	oseba
00240000-5595-4f1c-14b8-a9c5edf2dfd6	00230000-5595-4f1c-8c19-2387cd8d6005	prostor
00240000-5595-4f1c-f58f-bb2efcc6128b	00230000-5595-4f1c-cbef-c8718cdb8b9d	besedilo
00240000-5595-4f1c-c228-01a45137dfa0	00230000-5595-4f1c-cbef-c8718cdb8b9d	uprizoritev
00240000-5595-4f1c-dcf5-ec2274c7c839	00230000-5595-4f1c-cbef-c8718cdb8b9d	funkcija
00240000-5595-4f1c-b806-15205a0b1960	00230000-5595-4f1c-cbef-c8718cdb8b9d	tipfunkcije
00240000-5595-4f1c-0484-bf77936ffd0d	00230000-5595-4f1c-cbef-c8718cdb8b9d	alternacija
00240000-5595-4f1c-dce3-acc1908e1e59	00230000-5595-4f1c-92cd-7958722bdfc7	pogodba
00240000-5595-4f1c-395f-cf2747036009	00230000-5595-4f1c-cbef-c8718cdb8b9d	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8914095)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8913862)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5595-4f1d-19e8-ce051ca353b3	000e0000-5595-4f1d-a37d-d0b867f4d1cc	00080000-5595-4f1c-2bf3-a96f57252105	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5595-4f1d-6986-0aa5a32ae54e	000e0000-5595-4f1d-a37d-d0b867f4d1cc	00080000-5595-4f1c-2bf3-a96f57252105	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5595-4f1d-0f65-dd066972aa80	000e0000-5595-4f1d-a37d-d0b867f4d1cc	00080000-5595-4f1d-20ac-57e079f244ec	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8913526)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8913705)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5595-4f1d-abf2-f254ab96d9da	00180000-5595-4f1d-379f-a4e6a6b5e980	000c0000-5595-4f1d-312a-544a274f9bc1	00090000-5595-4f1d-8ff3-a5c8f8fd0fa3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4f1d-2800-e6b1199a9a6a	00180000-5595-4f1d-379f-a4e6a6b5e980	000c0000-5595-4f1d-1bc1-e10e9bb6e8e8	00090000-5595-4f1d-d872-4ea8b1577f45	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4f1d-f67e-81474d923938	00180000-5595-4f1d-379f-a4e6a6b5e980	000c0000-5595-4f1d-67b9-64ac8eb1de1e	00090000-5595-4f1d-27df-753fd9feab59	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4f1d-c81b-33233c87bca5	00180000-5595-4f1d-379f-a4e6a6b5e980	000c0000-5595-4f1d-e69c-00ed65c92d42	00090000-5595-4f1d-5d39-8470e7a7468f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4f1d-9c89-359dd1b4da95	00180000-5595-4f1d-379f-a4e6a6b5e980	000c0000-5595-4f1d-11c6-6ca19d409d09	00090000-5595-4f1d-289a-37a7451446b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5595-4f1d-6f07-3eba9e7f0607	00180000-5595-4f1d-c96d-c3468f550a5b	\N	00090000-5595-4f1d-289a-37a7451446b5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8913902)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5595-4f1c-5fb8-c7b1752be337	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5595-4f1c-e709-c656077ffde2	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5595-4f1c-04c5-6f6f224c204f	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5595-4f1c-7d9f-fb975ede5c81	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5595-4f1c-b253-880b8a9a5ed8	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5595-4f1c-f14f-a5f64416e582	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5595-4f1c-56c9-80c0493b4f00	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5595-4f1c-0094-821e02a8e5fb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5595-4f1c-06d8-2e88d5461bcb	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5595-4f1c-2204-1526d25dcaa2	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5595-4f1c-9e7b-15ba1f0edb76	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5595-4f1c-c2c3-39fc6c63387f	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5595-4f1c-7b6e-3c01113123d5	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5595-4f1c-4236-6027575f878c	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5595-4f1c-c931-8173d7664a77	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5595-4f1c-c5f5-133af16f0cf4	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8914077)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5595-4f1c-0fdc-eec0b3843f69	01	Velika predstava	f	1.00	1.00
002b0000-5595-4f1c-647a-1b45a5e05311	02	Mala predstava	f	0.50	0.50
002b0000-5595-4f1c-f004-e5663e378ea8	03	Mala koprodukcija	t	0.40	1.00
002b0000-5595-4f1c-87a3-077e3d5834c1	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5595-4f1c-870d-365b064fb945	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8913589)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8913435)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5595-4f1b-2081-9a19e9fda2c8	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROzn/DtJ9f0JIMGPNTvPqdBQuKOdYnUIa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-b7b0-ab971b115d2f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-e2f8-1eabfeee88c9	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-2e51-a30fd5a54c18	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-2fce-9ed38c08e524	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-aaea-fbdd9ae9099b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-07e4-1f19bb47b0a9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-f94a-a0dfc286ef03	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-50f4-e74053724c2c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-33ba-85475641cc61	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5595-4f1d-0129-7c07278b1574	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5595-4f1b-0113-a62247cf0b3a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8913959)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5595-4f1d-e1c6-f42ad512766a	00160000-5595-4f1c-c48f-452fc2bd3060	00150000-5595-4f1c-0e88-df041ecdae50	00140000-5595-4f1a-bba3-71b534cfd017	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5595-4f1c-9d9a-c03e334331aa
000e0000-5595-4f1d-a37d-d0b867f4d1cc	00160000-5595-4f1c-88e5-3f756fae5daa	00150000-5595-4f1c-bcb4-d844477de49f	00140000-5595-4f1a-5c1a-53f38ace19c7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5595-4f1c-9bf8-3a60a6ef8b2f
000e0000-5595-4f1d-bbfb-94eaf8a1fee0	\N	00150000-5595-4f1c-bcb4-d844477de49f	00140000-5595-4f1a-5c1a-53f38ace19c7	00190000-5595-4f1d-2ddc-c9f8290499e7	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5595-4f1c-9d9a-c03e334331aa
000e0000-5595-4f1d-dd75-d20a97aac159	\N	00150000-5595-4f1c-bcb4-d844477de49f	00140000-5595-4f1a-5c1a-53f38ace19c7	00190000-5595-4f1d-2ddc-c9f8290499e7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5595-4f1c-9d9a-c03e334331aa
000e0000-5595-4f1d-73d5-4790ca7d1880	\N	00150000-5595-4f1c-bcb4-d844477de49f	00140000-5595-4f1a-5c1a-53f38ace19c7	00190000-5595-4f1d-2ddc-c9f8290499e7	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5595-4f1c-12fa-482b90882c9c
\.


--
-- TOC entry 2867 (class 0 OID 8913651)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5595-4f1d-2396-5f60be409252	000e0000-5595-4f1d-a37d-d0b867f4d1cc	1	
00200000-5595-4f1d-a731-cc6f9e73a7b2	000e0000-5595-4f1d-a37d-d0b867f4d1cc	2	
\.


--
-- TOC entry 2882 (class 0 OID 8913776)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8913845)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8913683)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8913949)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5595-4f1a-bba3-71b534cfd017	01	Drama	drama (SURS 01)
00140000-5595-4f1a-7e95-1e2afef765e9	02	Opera	opera (SURS 02)
00140000-5595-4f1a-ec0b-aaa184e52a6b	03	Balet	balet (SURS 03)
00140000-5595-4f1a-aece-c89cf9825742	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5595-4f1a-d4d3-b79ab5154b1e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5595-4f1a-5c1a-53f38ace19c7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5595-4f1a-7db2-097bd3ef7739	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8913835)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5595-4f1c-8ca3-8a7940dfa274	01	Opera	opera
00150000-5595-4f1c-b2cd-9506ae2bd62e	02	Opereta	opereta
00150000-5595-4f1c-492f-043bf25b29ff	03	Balet	balet
00150000-5595-4f1c-3acb-27b6989980ba	04	Plesne prireditve	plesne prireditve
00150000-5595-4f1c-3d07-a6360e5982c2	05	Lutkovno gledališče	lutkovno gledališče
00150000-5595-4f1c-2572-a74417a6d900	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5595-4f1c-a83e-0a4fb209319a	07	Biografska drama	biografska drama
00150000-5595-4f1c-0e88-df041ecdae50	08	Komedija	komedija
00150000-5595-4f1c-e020-7dc825002070	09	Črna komedija	črna komedija
00150000-5595-4f1c-6b76-1acd3291b56a	10	E-igra	E-igra
00150000-5595-4f1c-bcb4-d844477de49f	11	Kriminalka	kriminalka
00150000-5595-4f1c-2f33-ff7a37fc2f65	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8913489)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8914006)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8913996)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8913901)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8913673)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8913698)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8914093)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8913615)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8914053)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8913831)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8913649)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8913692)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8913629)
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
-- TOC entry 2533 (class 2606 OID 8913741)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8913768)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8913587)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8913498)
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
-- TOC entry 2448 (class 2606 OID 8913522)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8913478)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8913463)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8913774)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8913807)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8913944)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8913551)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8913575)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8913747)
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
-- TOC entry 2463 (class 2606 OID 8913565)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8913636)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8913759)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8913883)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8913929)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8914075)
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
-- TOC entry 2553 (class 2606 OID 8913791)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8913732)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8913723)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8913923)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8913859)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8913434)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8913798)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8913452)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8913472)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8913816)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8913754)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8913704)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8914117)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8914105)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8914099)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8913872)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8913531)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8913714)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8913912)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8914087)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8913600)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8913447)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8913975)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8913658)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8913782)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8913850)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8913687)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8913957)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8913843)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8913680)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8913873)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8913874)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8913553)
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
-- TOC entry 2546 (class 1259 OID 8913775)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8913761)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8913760)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8913659)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8913832)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8913834)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8913833)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8913631)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8913630)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8913946)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8913947)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8913948)
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
-- TOC entry 2608 (class 1259 OID 8913980)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8913977)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8913981)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8913979)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8913978)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8913602)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8913601)
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
-- TOC entry 2446 (class 1259 OID 8913525)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8913799)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8913693)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8913479)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8913480)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8913819)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8913818)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8913817)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8913637)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8913639)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8913638)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8914107)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8913727)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8913725)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8913724)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8913726)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8913453)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8913454)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8913783)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8913748)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8913860)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8913861)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8914057)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8914054)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8914055)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8914056)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8913567)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8913566)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8913568)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8913884)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8913885)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8914010)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8914011)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8914008)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8914009)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8913851)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8913736)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8913735)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8913733)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8913734)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8913998)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8913997)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8914076)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8913650)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8914094)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8913500)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8913499)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8913532)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8913533)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8913717)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8913716)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8913715)
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
-- TOC entry 2498 (class 1259 OID 8913682)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8913678)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8913675)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8913676)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8913674)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8913679)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8913677)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8913552)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8913616)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8913618)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8913617)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8913619)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8913742)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8913945)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8913976)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8913523)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8913524)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8913844)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8914118)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8913588)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8914106)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8913793)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8913792)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8914007)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8913576)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8913958)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8913930)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8913931)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8913473)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8913681)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8914254)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8914239)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8914244)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8914264)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8914234)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8914259)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8914249)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8914409)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8914414)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8914169)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8914349)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8914344)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8914339)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8914229)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8914379)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8914389)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8914384)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8914204)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8914199)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8914329)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8914434)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8914439)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8914444)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8914464)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8914449)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8914469)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8914459)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8914454)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8914194)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8914189)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8914154)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8914149)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8914359)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8914269)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8914129)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8914134)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8914374)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8914369)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8914364)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8914209)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8914219)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8914214)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8914534)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8914304)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8914294)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8914289)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8914299)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8914119)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8914124)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8914354)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8914334)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8914399)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8914404)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8914519)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8914504)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8914509)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8914514)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8914179)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8914174)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8914184)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8914419)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8914424)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8914494)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8914499)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8914484)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8914489)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8914394)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8914324)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8914319)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8914309)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8914314)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8914479)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8914474)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8914524)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8914224)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8914429)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8914529)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8914144)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8914139)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8914159)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8914164)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8914284)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8914279)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8914274)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-02 16:47:58 CEST

--
-- PostgreSQL database dump complete
--

