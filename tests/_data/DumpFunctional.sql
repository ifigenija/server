--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-01 16:53:50 CEST

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
-- TOC entry 183 (class 1259 OID 8770578)
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
-- TOC entry 230 (class 1259 OID 8771096)
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
-- TOC entry 229 (class 1259 OID 8771079)
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
-- TOC entry 222 (class 1259 OID 8770983)
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
-- TOC entry 197 (class 1259 OID 8770757)
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
-- TOC entry 200 (class 1259 OID 8770791)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8771185)
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
-- TOC entry 192 (class 1259 OID 8770700)
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
-- TOC entry 231 (class 1259 OID 8771109)
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
-- TOC entry 216 (class 1259 OID 8770917)
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
-- TOC entry 195 (class 1259 OID 8770737)
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
-- TOC entry 199 (class 1259 OID 8770785)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8770717)
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
-- TOC entry 205 (class 1259 OID 8770834)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8770859)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8770674)
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
-- TOC entry 184 (class 1259 OID 8770587)
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
-- TOC entry 185 (class 1259 OID 8770598)
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
-- TOC entry 180 (class 1259 OID 8770552)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8770571)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8770866)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8770897)
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
-- TOC entry 226 (class 1259 OID 8771029)
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
-- TOC entry 187 (class 1259 OID 8770631)
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
-- TOC entry 189 (class 1259 OID 8770666)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8770840)
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
-- TOC entry 188 (class 1259 OID 8770651)
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
-- TOC entry 194 (class 1259 OID 8770729)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8770852)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8770972)
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
-- TOC entry 225 (class 1259 OID 8771021)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8771155)
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
-- TOC entry 212 (class 1259 OID 8770881)
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
-- TOC entry 204 (class 1259 OID 8770825)
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
-- TOC entry 203 (class 1259 OID 8770815)
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
-- TOC entry 224 (class 1259 OID 8771010)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8770949)
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
-- TOC entry 177 (class 1259 OID 8770523)
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
-- TOC entry 176 (class 1259 OID 8770521)
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
-- TOC entry 213 (class 1259 OID 8770891)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8770561)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8770545)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8770905)
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
-- TOC entry 207 (class 1259 OID 8770846)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8770796)
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
-- TOC entry 237 (class 1259 OID 8771205)
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
-- TOC entry 236 (class 1259 OID 8771197)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8771192)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8770959)
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
-- TOC entry 186 (class 1259 OID 8770623)
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
-- TOC entry 202 (class 1259 OID 8770802)
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
-- TOC entry 223 (class 1259 OID 8770999)
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
-- TOC entry 233 (class 1259 OID 8771174)
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
-- TOC entry 191 (class 1259 OID 8770686)
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
-- TOC entry 178 (class 1259 OID 8770532)
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
-- TOC entry 228 (class 1259 OID 8771056)
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
-- TOC entry 196 (class 1259 OID 8770748)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8770873)
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
-- TOC entry 218 (class 1259 OID 8770942)
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
-- TOC entry 198 (class 1259 OID 8770780)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8771046)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8770932)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8770526)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8770578)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8771096)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5593-fefe-7a92-dffb1521cc19	000d0000-5593-fefe-6f6c-179c5666e4fd	\N	00090000-5593-fefe-bef3-a8f25be9ca7f	000b0000-5593-fefe-d0ee-189a90ae17b4	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-fefe-e4e4-6edf2b0a2f11	000d0000-5593-fefe-a5b3-f36dc9208937	\N	00090000-5593-fefe-e1b2-dfcf96c2e1c2	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-fefe-f46d-23308a98e780	000d0000-5593-fefe-bdaa-df6482de29af	\N	00090000-5593-fefe-2040-f60a71d66d77	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-fefe-acba-a65cb741db20	000d0000-5593-fefe-4352-99f731ab68b2	\N	00090000-5593-fefe-c31e-7753def65f03	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-fefe-1932-384e2eada3e5	000d0000-5593-fefe-d100-027162e57f3e	\N	00090000-5593-fefe-49aa-76b08420bf1b	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-fefe-06af-3d333915db26	000d0000-5593-fefe-2173-93257b30cc87	\N	00090000-5593-fefe-e1b2-dfcf96c2e1c2	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8771079)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8770983)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5593-fefd-3748-a8bfb1e124cc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5593-fefd-514c-c0070bf94e5e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5593-fefd-408a-6b5a6fd7e336	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8770757)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5593-fefe-d706-bec754527cec	\N	\N	00200000-5593-fefe-37a2-a340824bcbfd	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5593-fefe-6a70-f4cc66ae788a	\N	\N	00200000-5593-fefe-e918-d91f17992101	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5593-fefe-781e-daf7695b24b8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5593-fefe-7a52-592307343e17	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5593-fefe-c199-bd73f4e193c8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8770791)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8771185)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8770700)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5593-fefb-c5f5-479e76b6e6fd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5593-fefb-c68d-d8689ec2c216	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5593-fefb-a6b0-476c09a5429c	AL	ALB	008	Albania 	Albanija	\N
00040000-5593-fefb-506d-4654b244399d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5593-fefb-2b2e-820e65ca6698	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5593-fefb-abc6-c3a94e5a22d8	AD	AND	020	Andorra 	Andora	\N
00040000-5593-fefb-58ae-74e601610769	AO	AGO	024	Angola 	Angola	\N
00040000-5593-fefb-3941-2162e4717124	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5593-fefb-2f8a-b4b68165f796	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5593-fefb-e566-260531837d7f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-fefb-6d7b-cab1a5e87436	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5593-fefb-eb0e-9f8c88905f6b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5593-fefb-60d1-c88567263824	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5593-fefb-2a2b-4a429500ee29	AU	AUS	036	Australia 	Avstralija	\N
00040000-5593-fefb-20cf-9d756d7059a8	AT	AUT	040	Austria 	Avstrija	\N
00040000-5593-fefb-490b-1191048a15b1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5593-fefb-8c49-5eb01e9a321a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5593-fefb-266b-befc1a9afd65	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5593-fefb-b7cd-9eda6e1d7cf6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5593-fefb-57ea-756aad3e37d9	BB	BRB	052	Barbados 	Barbados	\N
00040000-5593-fefb-8801-c26411926123	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5593-fefb-c7df-63c7ddf8975c	BE	BEL	056	Belgium 	Belgija	\N
00040000-5593-fefb-18ad-19ee0af56f38	BZ	BLZ	084	Belize 	Belize	\N
00040000-5593-fefb-eb40-4ae610e870fd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5593-fefb-5d24-c27cde2da3ac	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5593-fefb-4f14-f1104558b956	BT	BTN	064	Bhutan 	Butan	\N
00040000-5593-fefb-0d2d-aeb5b0b3f151	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5593-fefb-7091-8a574e7dff84	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5593-fefb-3c89-a5faa5064ee8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5593-fefb-2a5f-42ef3722c594	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5593-fefb-2053-d7b3bd45757f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5593-fefb-0c85-706af5166648	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5593-fefb-d01a-cc12661c9fec	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5593-fefb-3ace-ac1b6087d0f5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5593-fefb-4cab-1e1b1e98f8a0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5593-fefb-aa9f-45e13d528cac	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5593-fefb-014a-6512946e7715	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5593-fefb-3bf3-2ff86717d47b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5593-fefb-524a-99410311b845	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5593-fefb-0e30-49d37f03740b	CA	CAN	124	Canada 	Kanada	\N
00040000-5593-fefb-dc30-bd285b52fcf2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5593-fefb-f6fd-567b10c4f43c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5593-fefb-f9ba-66db73bb5ca0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5593-fefb-4e63-9257f4b933a1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5593-fefc-dc3a-1a8491314805	CL	CHL	152	Chile 	Čile	\N
00040000-5593-fefc-9a10-607dbdb24a65	CN	CHN	156	China 	Kitajska	\N
00040000-5593-fefc-3bf2-66a8da60ebe6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5593-fefc-52b7-432379cb4a50	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5593-fefc-51cd-5fbaad5c9f50	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5593-fefc-8b72-152b82f41ef6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5593-fefc-cae7-3ba35f6c26b6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5593-fefc-07bd-367fa3a782cf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5593-fefc-8b76-5e63bbdbba04	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5593-fefc-92d3-42dc8b261bee	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5593-fefc-681b-95ae9186ffb9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5593-fefc-092d-2a95822bc18d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5593-fefc-91e0-89eec7a91ad8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5593-fefc-54d6-705a02d5a2c0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5593-fefc-2f14-613156625807	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5593-fefc-3c01-3f0c530d62e4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5593-fefc-839d-6facdfab6ca6	DK	DNK	208	Denmark 	Danska	\N
00040000-5593-fefc-50d0-75005fe8a12e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5593-fefc-86da-f716b68af25a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-fefc-a2a1-2d9aa92068c5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5593-fefc-5eb2-7ffbf405ac94	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5593-fefc-c55c-b475d9864239	EG	EGY	818	Egypt 	Egipt	\N
00040000-5593-fefc-4681-7f9941c251ef	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5593-fefc-b552-be4d6c891b8f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5593-fefc-4dba-ad52ca378784	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5593-fefc-d3f6-8f9d85939c7a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5593-fefc-30f5-2e162a3a917f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5593-fefc-ba08-69ae23bb83b3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5593-fefc-7700-9122230b0b68	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5593-fefc-44f7-874e4f5dd8d4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5593-fefc-2ffa-b7d1e90cad99	FI	FIN	246	Finland 	Finska	\N
00040000-5593-fefc-3450-2ef0ce059754	FR	FRA	250	France 	Francija	\N
00040000-5593-fefc-f37a-9698ed256f47	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5593-fefc-8140-f494b64a8a20	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5593-fefc-f01e-c9940ce87fd2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5593-fefc-c560-4b0e4c09d25b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5593-fefc-f989-25e19e3e9db0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5593-fefc-ec42-d36b8e0112d7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5593-fefc-d8fd-2716ec8f0e72	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5593-fefc-3eac-aee5b1a75b21	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5593-fefc-85c5-6f9261cf160b	GH	GHA	288	Ghana 	Gana	\N
00040000-5593-fefc-2b72-7cb3f957939d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5593-fefc-63d0-a18080e28745	GR	GRC	300	Greece 	Grčija	\N
00040000-5593-fefc-25d8-5383eb7f2a60	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5593-fefc-309c-494ad1c6f721	GD	GRD	308	Grenada 	Grenada	\N
00040000-5593-fefc-99fa-899e9bb3fae7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5593-fefc-520e-a9b1c19ab094	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5593-fefc-7ff2-139ca33bf1fc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5593-fefc-f54b-fc9ac932bab9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5593-fefc-68e2-51b49a20c2a5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5593-fefc-b22b-4891d225e37a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5593-fefc-70f7-8a3604f24a2c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5593-fefc-b191-3bd0ba15e96c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5593-fefc-ffdb-36e0157ded3d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5593-fefc-8ab4-49b402b08c96	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5593-fefc-2012-9618c8be8428	HN	HND	340	Honduras 	Honduras	\N
00040000-5593-fefc-366e-ee5ec4d49856	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5593-fefc-eba9-00856043f575	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5593-fefc-dc4e-222b0efaa4e4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5593-fefc-c457-203e92b7f641	IN	IND	356	India 	Indija	\N
00040000-5593-fefc-54ed-2d6126f68e66	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5593-fefc-fbab-36a27fb7bcc7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5593-fefc-aaa2-320466288c66	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5593-fefc-a9dd-a92fc0fa1695	IE	IRL	372	Ireland 	Irska	\N
00040000-5593-fefc-45fd-ae7b5a7221c1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5593-fefc-1354-2cc4130edeee	IL	ISR	376	Israel 	Izrael	\N
00040000-5593-fefc-7ad8-aa9e01ea34aa	IT	ITA	380	Italy 	Italija	\N
00040000-5593-fefc-9a3a-90bffd1a3bbe	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5593-fefc-980f-3f96af45742e	JP	JPN	392	Japan 	Japonska	\N
00040000-5593-fefc-280f-711708163f4c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5593-fefc-492b-79bf0dbefede	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5593-fefc-461c-550cd870712e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5593-fefc-3aee-6c4fc4cae3d8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5593-fefc-5a64-566fca922069	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5593-fefc-9109-5125abaac60d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5593-fefc-96d3-2118fdfdf3cf	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5593-fefc-0ade-0ad4135f74c6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5593-fefc-4f46-f9f0fba7b4d2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5593-fefc-bef9-d76dbfe31c74	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5593-fefc-985e-72782c1fccd2	LV	LVA	428	Latvia 	Latvija	\N
00040000-5593-fefc-c443-4f81bb01cb5a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5593-fefc-0dd4-31fe8f5a69a8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5593-fefc-6baf-9aeeffc0f5fe	LR	LBR	430	Liberia 	Liberija	\N
00040000-5593-fefc-7fab-ada83bd3ff02	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5593-fefc-6350-4ebd4f43b20b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5593-fefc-4157-08512e009c62	LT	LTU	440	Lithuania 	Litva	\N
00040000-5593-fefc-3b59-d70ea14c2859	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5593-fefc-4c8a-3aac21f933f5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5593-fefc-7d5f-3d3bec5a4e00	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5593-fefc-5ae5-bb6ea05ed32b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5593-fefc-9e12-3a0fe2dca1f4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5593-fefc-8fda-00bf95b9bac6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5593-fefc-1175-5badd9f702d5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5593-fefc-623d-fc36e0eeabd3	ML	MLI	466	Mali 	Mali	\N
00040000-5593-fefc-eab5-61ef914cec20	MT	MLT	470	Malta 	Malta	\N
00040000-5593-fefc-559c-9de3a62afe0a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5593-fefc-7c49-4a0fd823c178	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5593-fefc-d92a-d910d2e65c6f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5593-fefc-e0a1-b76c7efadd92	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5593-fefc-4368-5fe42fff8bbe	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5593-fefc-0411-79096e686d72	MX	MEX	484	Mexico 	Mehika	\N
00040000-5593-fefc-8642-bdcea2892d9c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5593-fefc-ee78-d8c193b83427	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5593-fefc-40db-a468433c72b9	MC	MCO	492	Monaco 	Monako	\N
00040000-5593-fefc-448a-30d5c0f1b8b9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5593-fefc-18a6-9798b2b2b960	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5593-fefc-a4e0-7066aba001b7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5593-fefc-0d9e-e91abc63a822	MA	MAR	504	Morocco 	Maroko	\N
00040000-5593-fefc-e864-5ea93b3b254e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5593-fefc-f607-d54222298f17	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5593-fefc-cb7f-5cfcca6e38be	NA	NAM	516	Namibia 	Namibija	\N
00040000-5593-fefc-2612-24323dd071a3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5593-fefc-b11c-5ca96d343048	NP	NPL	524	Nepal 	Nepal	\N
00040000-5593-fefc-5632-3ad8f6763978	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5593-fefc-627f-e0473dd03aee	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5593-fefc-3804-2d494485eaff	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5593-fefc-641e-cfdb30b4636e	NE	NER	562	Niger 	Niger 	\N
00040000-5593-fefc-eed4-42f1e260f0cd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5593-fefc-46f3-d9f331ee7500	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5593-fefc-7442-6d1c331dc8bc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5593-fefc-3cdc-9addec15dcd3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5593-fefc-339f-b74eb58f1949	NO	NOR	578	Norway 	Norveška	\N
00040000-5593-fefc-b272-68074865a179	OM	OMN	512	Oman 	Oman	\N
00040000-5593-fefc-7d4e-9db34d2b6e9b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5593-fefc-e2e5-bf8e1f2f1a66	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5593-fefc-f428-bda6c8f3c2ee	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5593-fefc-4e0c-85dc6732028a	PA	PAN	591	Panama 	Panama	\N
00040000-5593-fefc-5a04-1a1c38317c85	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5593-fefc-792b-a6519fedd1af	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5593-fefc-af66-587abab18822	PE	PER	604	Peru 	Peru	\N
00040000-5593-fefc-f787-288bb1819a75	PH	PHL	608	Philippines 	Filipini	\N
00040000-5593-fefc-6e2c-c3c33279a05a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5593-fefc-aff4-c617bece63eb	PL	POL	616	Poland 	Poljska	\N
00040000-5593-fefc-a9fe-48c91b5a0f6f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5593-fefc-50c7-95d6664c77e3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5593-fefc-1006-9f371c338a79	QA	QAT	634	Qatar 	Katar	\N
00040000-5593-fefc-af0e-9b631f18cc47	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5593-fefc-3722-ddc31ea1c8fd	RO	ROU	642	Romania 	Romunija	\N
00040000-5593-fefc-1d62-9d0fb4fe566d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5593-fefc-7c19-e5b503c869f3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5593-fefc-fc49-8bde57bae51d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5593-fefc-01bb-460e5bf7285c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5593-fefc-8af3-8893fddaf734	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5593-fefc-7201-7dd4efb5158b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5593-fefc-a398-ea8ed3d27d0f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5593-fefc-71fa-2c3e32780f79	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5593-fefc-8019-c970de343559	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5593-fefc-c229-7f8fe10484d3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5593-fefc-691d-e8be3051591c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5593-fefc-033e-0475c3a89257	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5593-fefc-81d3-6a3ec7d50e8e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5593-fefc-7030-824afc47be57	SN	SEN	686	Senegal 	Senegal	\N
00040000-5593-fefc-726c-eb235eb70972	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5593-fefc-e35b-225951dc4e72	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5593-fefc-0e0a-f852646a0149	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5593-fefc-2a00-1571e989037e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5593-fefc-4456-93affca0522f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5593-fefc-87da-5f4086b8199e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5593-fefc-6a54-5a148d37d7b6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5593-fefc-995a-b6104eea74ae	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5593-fefc-6433-a47df48f7c8a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5593-fefc-b17c-1e27a6f64da4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5593-fefc-2ff7-739168b67035	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5593-fefc-5231-815b882e1ee1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5593-fefc-e03c-e78afe813f05	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5593-fefc-84fb-2598a6386f7a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5593-fefc-cdf4-ea248e7b946f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5593-fefc-6c6d-0b067360a407	SR	SUR	740	Suriname 	Surinam	\N
00040000-5593-fefc-efa3-52962f20b759	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5593-fefc-de85-746a8b1cab3d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5593-fefc-e0ab-ad3de8fa26e5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5593-fefc-b728-61e57f55cc04	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5593-fefc-afcf-f602260b29c4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5593-fefc-0c78-a8feae4230b2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5593-fefc-4d2f-bb8cce215bbb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5593-fefc-085b-bb659e325c16	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5593-fefc-5504-edd596cff711	TH	THA	764	Thailand 	Tajska	\N
00040000-5593-fefc-9156-358288798c15	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5593-fefc-c888-f221d4617cd9	TG	TGO	768	Togo 	Togo	\N
00040000-5593-fefc-2f1b-7be464c8a914	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5593-fefc-ff27-3952379b95f4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5593-fefc-0efc-49d318401beb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5593-fefc-e6a3-015ec7276f9b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5593-fefc-fd16-4278feae8b65	TR	TUR	792	Turkey 	Turčija	\N
00040000-5593-fefc-4671-0be0d1e7fe98	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5593-fefc-ecc2-45dbc730c0ca	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-fefc-85df-db56f7633a69	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5593-fefc-1c09-a611b3f02cd5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5593-fefc-4690-f527bd610b7d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5593-fefc-5445-19fa1d2dd4ab	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5593-fefc-71d3-85d9b22d9be1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5593-fefc-18ba-00208ca21e2c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5593-fefc-fdfa-dae38afcb8d7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5593-fefc-6a02-2fc2a26d0f5f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5593-fefc-7267-e7486a210487	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5593-fefc-7e92-e76fe91a4f0e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5593-fefc-2b65-d4cd1aac2f7e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5593-fefc-3bd9-900bfcb8f210	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5593-fefc-6fbc-e1c7a06b3a10	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-fefc-f7c8-0ff8e3dfa1e5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5593-fefc-2785-a763cf041398	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5593-fefc-b6f0-f5fd5a602e42	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5593-fefc-d162-bd3ad5e5465f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5593-fefc-1260-a18af7335ce6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5593-fefc-c25d-6b2ecc53d8cf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8771109)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5593-fefe-75db-6546333ea526	000e0000-5593-fefe-d46f-05ab167fddd5	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5593-fefd-78a9-559bc7aefe46	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5593-fefe-dea0-ed9fe48813ea	000e0000-5593-fefe-6a35-7bab5731eb59	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5593-fefd-a152-95b2a1b0ad14	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8770917)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5593-fefe-1de5-6fa3f1c03939	000e0000-5593-fefe-6a35-7bab5731eb59	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5593-fefd-98a8-94d3ea310b68
000d0000-5593-fefe-6f6c-179c5666e4fd	000e0000-5593-fefe-6a35-7bab5731eb59	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-fefd-98a8-94d3ea310b68
000d0000-5593-fefe-a5b3-f36dc9208937	000e0000-5593-fefe-6a35-7bab5731eb59	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5593-fefd-e3fc-73b53f750268
000d0000-5593-fefe-bdaa-df6482de29af	000e0000-5593-fefe-6a35-7bab5731eb59	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5593-fefd-c734-86af103ca9b1
000d0000-5593-fefe-4352-99f731ab68b2	000e0000-5593-fefe-6a35-7bab5731eb59	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5593-fefd-c734-86af103ca9b1
000d0000-5593-fefe-d100-027162e57f3e	000e0000-5593-fefe-6a35-7bab5731eb59	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5593-fefd-c734-86af103ca9b1
000d0000-5593-fefe-2173-93257b30cc87	000e0000-5593-fefe-6a35-7bab5731eb59	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-fefd-98a8-94d3ea310b68
\.


--
-- TOC entry 2866 (class 0 OID 8770737)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8770785)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8770717)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5593-fefe-8531-e3ddb527c19f	00080000-5593-fefd-36ad-c6df4eb2a7c3	00090000-5593-fefe-bef3-a8f25be9ca7f	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8770834)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8770859)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8770674)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5593-fefc-e075-89f062338213	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5593-fefc-5f00-ada0b79119e5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5593-fefc-b489-0be93f0794b0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5593-fefc-f649-639c7789a676	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5593-fefc-ee07-8aa48b72dab0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5593-fefc-8767-e6910673a1a0	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5593-fefc-2aae-67bb569e27b4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5593-fefc-3e5a-d747a7e21045	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-fefc-65f6-62cef9328078	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-fefc-3951-8bf580ed7554	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5593-fefc-9b91-f4cf1a43563b	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5593-fefc-9bf6-8022e21a9f1d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5593-fefc-5330-6e3ca671112a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5593-fefd-ccf6-be308b20898a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5593-fefd-c08a-cca39e78cc0d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5593-fefd-8843-fc3f9ef8402f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5593-fefd-e220-35d3ee20b9e7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5593-fefd-f992-706f03a0c9f5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5593-fefd-b4b9-404cb14c7a31	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8770587)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5593-fefd-0715-b11d016ab1c3	00000000-5593-fefd-c08a-cca39e78cc0d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5593-fefd-8fe7-9644158223aa	00000000-5593-fefd-c08a-cca39e78cc0d	00010000-5593-fefc-4315-06fd050f5461	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5593-fefd-fae6-95b23193401d	00000000-5593-fefd-8843-fc3f9ef8402f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8770598)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5593-fefe-9c7d-cd0ffcea6394	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5593-fefe-c31e-7753def65f03	00010000-5593-fefd-b318-3d081489f196	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5593-fefe-2040-f60a71d66d77	00010000-5593-fefd-01c5-62a757148e95	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5593-fefe-fd63-842f74646512	00010000-5593-fefd-feec-59bfec106d91	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5593-fefe-ef8e-0cf91978b121	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5593-fefe-198a-7c5cbb3dcf21	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5593-fefe-bdaa-13314da05caa	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5593-fefe-c7a6-3bb1d1f5b2c3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5593-fefe-bef3-a8f25be9ca7f	00010000-5593-fefd-b0c9-2b16db266377	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5593-fefe-e1b2-dfcf96c2e1c2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5593-fefe-1cef-4e5646adcb9a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5593-fefe-49aa-76b08420bf1b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5593-fefe-1b2f-4a21b0c61312	00010000-5593-fefd-aa4a-b17bbe4e4ba6	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8770552)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5593-fefc-493d-5146a6cf7ddd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5593-fefc-aca5-f058e84bd55c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5593-fefc-aac0-366255079b3f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5593-fefc-303b-1b8c4c6d4f5e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5593-fefc-17be-4b618a80d3f6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5593-fefc-b9cc-4646e521e347	Abonma-read	Abonma - branje	f
00030000-5593-fefc-110d-19180ab4cb98	Abonma-write	Abonma - spreminjanje	f
00030000-5593-fefc-7a9f-1b0d7c6d7e73	Alternacija-read	Alternacija - branje	f
00030000-5593-fefc-8f1a-d392c888c9a5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5593-fefc-3436-36c65ce9bb6a	Arhivalija-read	Arhivalija - branje	f
00030000-5593-fefc-371b-76bde5a23f2e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5593-fefc-6c45-313357ae4803	Besedilo-read	Besedilo - branje	f
00030000-5593-fefc-85ac-7dcb250e0748	Besedilo-write	Besedilo - spreminjanje	f
00030000-5593-fefc-03e3-c7381c71024d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5593-fefc-a021-2d28268fdcaa	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5593-fefc-9f07-e0d5c52e6890	Dogodek-read	Dogodek - branje	f
00030000-5593-fefc-7de3-6c64273d578e	Dogodek-write	Dogodek - spreminjanje	f
00030000-5593-fefc-f757-aed4c6ddc17b	DrugiVir-read	DrugiVir - branje	f
00030000-5593-fefc-d609-5e1b979e85d1	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5593-fefc-9c29-c74e299a213d	Drzava-read	Drzava - branje	f
00030000-5593-fefc-a130-25313c3db305	Drzava-write	Drzava - spreminjanje	f
00030000-5593-fefc-37b1-04029b413125	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5593-fefc-8a09-7182b6a31a84	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5593-fefc-dbb9-e6aa7a1d18e6	Funkcija-read	Funkcija - branje	f
00030000-5593-fefc-fca0-f17abc93164e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5593-fefc-2033-2e3c02c33e1e	Gostovanje-read	Gostovanje - branje	f
00030000-5593-fefc-bcf8-ad44e4330c07	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5593-fefc-5273-2a5a08850b6f	Gostujoca-read	Gostujoca - branje	f
00030000-5593-fefc-5b1d-8d666ca2c9ee	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5593-fefc-56b6-8ed4086be0b0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5593-fefc-c576-37a0b4643858	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5593-fefc-83e7-0cba6bb05ac3	Kupec-read	Kupec - branje	f
00030000-5593-fefc-ad81-9bd37ba43aa0	Kupec-write	Kupec - spreminjanje	f
00030000-5593-fefc-58b6-cb1fa3de6f2c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5593-fefc-f092-456cf2f03c81	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5593-fefc-cd63-9c76ca04e7cf	Option-read	Option - branje	f
00030000-5593-fefc-2b31-b2af9e4cfcb3	Option-write	Option - spreminjanje	f
00030000-5593-fefc-bce7-680dbb9674b0	OptionValue-read	OptionValue - branje	f
00030000-5593-fefc-fc71-69804b4c9d8d	OptionValue-write	OptionValue - spreminjanje	f
00030000-5593-fefc-7ceb-a82634b0b1bf	Oseba-read	Oseba - branje	f
00030000-5593-fefc-53be-1b530854855c	Oseba-write	Oseba - spreminjanje	f
00030000-5593-fefc-fd9d-ec46ebfe4689	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5593-fefc-6189-cb5dfa4067b0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5593-fefc-18b7-1d1751fcc310	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5593-fefc-9ae4-8bcf922b3656	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5593-fefc-f8b2-5e73ee76a475	Pogodba-read	Pogodba - branje	f
00030000-5593-fefc-56f6-a3916017f545	Pogodba-write	Pogodba - spreminjanje	f
00030000-5593-fefc-5abd-c572074b7767	Popa-read	Popa - branje	f
00030000-5593-fefc-de70-57c03b9ff84b	Popa-write	Popa - spreminjanje	f
00030000-5593-fefc-aa2b-aa5eda3e9a21	Posta-read	Posta - branje	f
00030000-5593-fefc-c76a-c8765312cf2b	Posta-write	Posta - spreminjanje	f
00030000-5593-fefc-979b-2efbf7fed8a8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5593-fefc-1c51-2bf6e94d8274	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5593-fefc-e440-f4a8da68e9d6	PostniNaslov-read	PostniNaslov - branje	f
00030000-5593-fefc-7ec0-93f1adbd88cc	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5593-fefc-5b4a-f44741484a23	Predstava-read	Predstava - branje	f
00030000-5593-fefc-4dbb-b1cf35441b11	Predstava-write	Predstava - spreminjanje	f
00030000-5593-fefc-8f69-c2240ae30ff8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5593-fefc-a13c-30b56aaf1542	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5593-fefc-8316-42f2dc691af9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5593-fefc-fe24-5904d8a2e5e3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5593-fefc-ecc2-95322bf0ef67	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5593-fefc-850e-405660ff3f3a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5593-fefc-b9c3-ee489c40ed05	ProgramDela-read	ProgramDela - branje	f
00030000-5593-fefc-98e7-cd0902444446	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5593-fefc-5796-0e3c72b1527c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5593-fefc-a78f-49e4e9af3a51	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5593-fefc-0c88-c916c8e5e2f4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5593-fefc-6d66-10d3eee0048b	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5593-fefc-e603-0ac37e5c7fba	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5593-fefc-00cc-d7e2ed452169	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5593-fefc-5b9d-bc71ca151023	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5593-fefc-46c9-6a58f607aeba	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5593-fefc-8181-fddb256e4f0e	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5593-fefc-1cee-92c9547c7059	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5593-fefc-53d1-d41baf37f2fc	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5593-fefc-8e9b-db6eb5eff518	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5593-fefc-4048-931b96d316a4	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5593-fefc-a0a6-2d3b5247f724	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5593-fefc-b02f-06161f4ccfac	ProgramRazno-read	ProgramRazno - branje	f
00030000-5593-fefc-e662-fb5877cc7818	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5593-fefc-0458-fbfee7252b88	Prostor-read	Prostor - branje	f
00030000-5593-fefc-07ae-83e0763c9d8b	Prostor-write	Prostor - spreminjanje	f
00030000-5593-fefc-64d4-3172734dc68c	Racun-read	Racun - branje	f
00030000-5593-fefc-274a-96ee01af22a7	Racun-write	Racun - spreminjanje	f
00030000-5593-fefc-452b-8ddebedc922c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5593-fefc-876d-eb6c2f699662	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5593-fefc-6c55-5135ccb65082	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5593-fefc-1efc-97305d6fd5d3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5593-fefc-66ee-2b343777d93f	Rekvizit-read	Rekvizit - branje	f
00030000-5593-fefc-31dd-528f1c66d60f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5593-fefc-19af-f16c521da35c	Revizija-read	Revizija - branje	f
00030000-5593-fefc-7e51-1f638583b947	Revizija-write	Revizija - spreminjanje	f
00030000-5593-fefc-cfec-809612fa61af	Rezervacija-read	Rezervacija - branje	f
00030000-5593-fefc-a102-2e6a555cb2a2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5593-fefc-b2d0-169c270fcdb2	SedezniRed-read	SedezniRed - branje	f
00030000-5593-fefc-ed56-8a945679d22c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5593-fefc-58e8-55dff9ae8d16	Sedez-read	Sedez - branje	f
00030000-5593-fefc-a9dd-5287d31cb813	Sedez-write	Sedez - spreminjanje	f
00030000-5593-fefc-2edf-030f02971ced	Sezona-read	Sezona - branje	f
00030000-5593-fefc-fd9b-ea481c73b731	Sezona-write	Sezona - spreminjanje	f
00030000-5593-fefc-c4a7-419e33167bc6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5593-fefc-b395-d21a6c5085f7	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5593-fefc-4078-be4d263a7f10	Stevilcenje-read	Stevilcenje - branje	f
00030000-5593-fefc-ae50-797cb2c63fc2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5593-fefc-1b59-f0c8208d2910	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5593-fefc-19a2-25212c5f981c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5593-fefc-8df1-6a93de952dc6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5593-fefc-3a51-bcd092de9e03	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5593-fefc-ce26-e56c651b159d	Telefonska-read	Telefonska - branje	f
00030000-5593-fefc-d8b5-9c0493a0326f	Telefonska-write	Telefonska - spreminjanje	f
00030000-5593-fefc-2c8f-1c0a4b1108d7	TerminStoritve-read	TerminStoritve - branje	f
00030000-5593-fefc-86f0-14d23753c5ad	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5593-fefc-88f6-6308e70f131b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5593-fefc-84bc-976ab197a4be	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5593-fefc-4bdc-ce17b65e05af	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5593-fefc-a913-6bb85c5e09ec	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5593-fefc-b63a-225379a172ac	Trr-read	Trr - branje	f
00030000-5593-fefc-1a0f-9a4423739911	Trr-write	Trr - spreminjanje	f
00030000-5593-fefc-4979-daf566681253	Uprizoritev-read	Uprizoritev - branje	f
00030000-5593-fefc-3628-98ab482ff309	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5593-fefc-af8b-b87ad63aa608	Vaja-read	Vaja - branje	f
00030000-5593-fefc-d494-f5e425ddaf84	Vaja-write	Vaja - spreminjanje	f
00030000-5593-fefc-8f65-17eb151bd784	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5593-fefc-a1eb-9d7c3966534e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5593-fefc-c093-848363b783aa	Zaposlitev-read	Zaposlitev - branje	f
00030000-5593-fefc-c90b-c7dcd54e71ec	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5593-fefc-dbe3-b3b5a107b4c7	Zasedenost-read	Zasedenost - branje	f
00030000-5593-fefc-2183-273a288d8d9d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5593-fefc-c878-53e6ecf11bd8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5593-fefc-276e-5c139f854036	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5593-fefc-f6b9-c6172a3c00eb	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5593-fefc-1f44-d84040c8a514	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8770571)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5593-fefc-d7d9-1412c9dadad0	00030000-5593-fefc-aca5-f058e84bd55c
00020000-5593-fefc-b1de-9c7866027381	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-110d-19180ab4cb98
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-7a9f-1b0d7c6d7e73
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-8f1a-d392c888c9a5
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-303b-1b8c4c6d4f5e
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-7de3-6c64273d578e
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-a130-25313c3db305
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-dbb9-e6aa7a1d18e6
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-fca0-f17abc93164e
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-bcf8-ad44e4330c07
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-5b1d-8d666ca2c9ee
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-56b6-8ed4086be0b0
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-c576-37a0b4643858
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-7ceb-a82634b0b1bf
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-53be-1b530854855c
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-de70-57c03b9ff84b
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-c76a-c8765312cf2b
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-e440-f4a8da68e9d6
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-7ec0-93f1adbd88cc
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-4dbb-b1cf35441b11
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-ecc2-95322bf0ef67
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-850e-405660ff3f3a
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-07ae-83e0763c9d8b
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-1efc-97305d6fd5d3
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-31dd-528f1c66d60f
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-fd9b-ea481c73b731
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-88f6-6308e70f131b
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-4979-daf566681253
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-3628-98ab482ff309
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-af8b-b87ad63aa608
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-d494-f5e425ddaf84
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-dbe3-b3b5a107b4c7
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-2183-273a288d8d9d
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefc-b018-e0460aba6a7f	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-56b6-8ed4086be0b0
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-c576-37a0b4643858
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-7ceb-a82634b0b1bf
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-53be-1b530854855c
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-e440-f4a8da68e9d6
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-7ec0-93f1adbd88cc
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-ce26-e56c651b159d
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-d8b5-9c0493a0326f
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-b63a-225379a172ac
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-1a0f-9a4423739911
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-c093-848363b783aa
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-c90b-c7dcd54e71ec
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefc-cb1e-e663299edad1	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-7a9f-1b0d7c6d7e73
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-371b-76bde5a23f2e
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-6c45-313357ae4803
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-03e3-c7381c71024d
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-dbb9-e6aa7a1d18e6
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-56b6-8ed4086be0b0
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-7ceb-a82634b0b1bf
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-ecc2-95322bf0ef67
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-88f6-6308e70f131b
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-af8b-b87ad63aa608
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-dbe3-b3b5a107b4c7
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefc-9c8b-ff83dfac1593	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-110d-19180ab4cb98
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-8f1a-d392c888c9a5
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-88f6-6308e70f131b
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefc-4d25-14e34ee11f95	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-2c8f-1c0a4b1108d7
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-aac0-366255079b3f
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-88f6-6308e70f131b
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefc-da40-8ec55be41327	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-493d-5146a6cf7ddd
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-aca5-f058e84bd55c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-aac0-366255079b3f
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-303b-1b8c4c6d4f5e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-17be-4b618a80d3f6
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b9cc-4646e521e347
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-110d-19180ab4cb98
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-7a9f-1b0d7c6d7e73
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8f1a-d392c888c9a5
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-3436-36c65ce9bb6a
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-371b-76bde5a23f2e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-6c45-313357ae4803
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-85ac-7dcb250e0748
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-03e3-c7381c71024d
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a021-2d28268fdcaa
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-9f07-e0d5c52e6890
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-7de3-6c64273d578e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-9c29-c74e299a213d
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a130-25313c3db305
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-37b1-04029b413125
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8a09-7182b6a31a84
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-dbb9-e6aa7a1d18e6
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-fca0-f17abc93164e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-2033-2e3c02c33e1e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-bcf8-ad44e4330c07
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5273-2a5a08850b6f
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5b1d-8d666ca2c9ee
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-56b6-8ed4086be0b0
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c576-37a0b4643858
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-83e7-0cba6bb05ac3
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-ad81-9bd37ba43aa0
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-58b6-cb1fa3de6f2c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-f092-456cf2f03c81
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-cd63-9c76ca04e7cf
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-2b31-b2af9e4cfcb3
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-bce7-680dbb9674b0
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-fc71-69804b4c9d8d
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-7ceb-a82634b0b1bf
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-53be-1b530854855c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-fd9d-ec46ebfe4689
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-6189-cb5dfa4067b0
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-18b7-1d1751fcc310
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-9ae4-8bcf922b3656
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-f8b2-5e73ee76a475
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-56f6-a3916017f545
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5abd-c572074b7767
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-de70-57c03b9ff84b
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-aa2b-aa5eda3e9a21
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c76a-c8765312cf2b
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-979b-2efbf7fed8a8
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1c51-2bf6e94d8274
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-e440-f4a8da68e9d6
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-7ec0-93f1adbd88cc
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5b4a-f44741484a23
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-4dbb-b1cf35441b11
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8f69-c2240ae30ff8
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a13c-30b56aaf1542
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8316-42f2dc691af9
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-fe24-5904d8a2e5e3
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-ecc2-95322bf0ef67
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-850e-405660ff3f3a
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b9c3-ee489c40ed05
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-98e7-cd0902444446
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5796-0e3c72b1527c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a78f-49e4e9af3a51
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-0c88-c916c8e5e2f4
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-6d66-10d3eee0048b
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-e603-0ac37e5c7fba
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-00cc-d7e2ed452169
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-5b9d-bc71ca151023
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-46c9-6a58f607aeba
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8181-fddb256e4f0e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1cee-92c9547c7059
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-53d1-d41baf37f2fc
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8e9b-db6eb5eff518
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-4048-931b96d316a4
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a0a6-2d3b5247f724
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b02f-06161f4ccfac
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-e662-fb5877cc7818
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-0458-fbfee7252b88
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-07ae-83e0763c9d8b
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-64d4-3172734dc68c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-274a-96ee01af22a7
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-452b-8ddebedc922c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-876d-eb6c2f699662
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-6c55-5135ccb65082
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1efc-97305d6fd5d3
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-66ee-2b343777d93f
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-31dd-528f1c66d60f
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-19af-f16c521da35c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-7e51-1f638583b947
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-cfec-809612fa61af
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a102-2e6a555cb2a2
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b2d0-169c270fcdb2
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-ed56-8a945679d22c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-58e8-55dff9ae8d16
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a9dd-5287d31cb813
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-2edf-030f02971ced
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-fd9b-ea481c73b731
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c4a7-419e33167bc6
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b395-d21a6c5085f7
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-4078-be4d263a7f10
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-ae50-797cb2c63fc2
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1b59-f0c8208d2910
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-19a2-25212c5f981c
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8df1-6a93de952dc6
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-3a51-bcd092de9e03
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-ce26-e56c651b159d
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-d8b5-9c0493a0326f
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-2c8f-1c0a4b1108d7
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-86f0-14d23753c5ad
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-88f6-6308e70f131b
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-84bc-976ab197a4be
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-4bdc-ce17b65e05af
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a913-6bb85c5e09ec
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-b63a-225379a172ac
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1a0f-9a4423739911
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-4979-daf566681253
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-3628-98ab482ff309
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-af8b-b87ad63aa608
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-d494-f5e425ddaf84
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-8f65-17eb151bd784
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-a1eb-9d7c3966534e
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c093-848363b783aa
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c90b-c7dcd54e71ec
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-dbe3-b3b5a107b4c7
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-2183-273a288d8d9d
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-c878-53e6ecf11bd8
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-276e-5c139f854036
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-f6b9-c6172a3c00eb
00020000-5593-fefd-482d-a768781737c1	00030000-5593-fefc-1f44-d84040c8a514
\.


--
-- TOC entry 2881 (class 0 OID 8770866)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8770897)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8771029)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5593-fefe-d0ee-189a90ae17b4	00090000-5593-fefe-9c7d-cd0ffcea6394	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8770631)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5593-fefd-36ad-c6df4eb2a7c3	00040000-5593-fefc-6a54-5a148d37d7b6	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-f51f-a08a5fdf79bf	00040000-5593-fefc-6a54-5a148d37d7b6	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5593-fefd-1156-c66f311c6f33	00040000-5593-fefc-6a54-5a148d37d7b6	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-c564-b2e9ece894f1	00040000-5593-fefc-6a54-5a148d37d7b6	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-d32e-818a7a89d309	00040000-5593-fefc-6a54-5a148d37d7b6	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-ff2d-b77420103d61	00040000-5593-fefb-6d7b-cab1a5e87436	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-1fc6-4ef01dd039a0	00040000-5593-fefc-092d-2a95822bc18d	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefd-e82b-3573c7c52c74	00040000-5593-fefb-20cf-9d756d7059a8	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-fefe-9ed7-d2034496f01c	00040000-5593-fefc-6a54-5a148d37d7b6	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8770666)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5593-fefc-4271-711ff970c0a9	8341	Adlešiči
00050000-5593-fefc-6b6a-01e18da2e5bd	5270	Ajdovščina
00050000-5593-fefc-246b-808c1ae2243a	6280	Ankaran/Ancarano
00050000-5593-fefc-a5bd-ac78735a0aa3	9253	Apače
00050000-5593-fefc-34cb-070e379f7e8b	8253	Artiče
00050000-5593-fefc-0a33-b598ff70136c	4275	Begunje na Gorenjskem
00050000-5593-fefc-8310-c919d4239294	1382	Begunje pri Cerknici
00050000-5593-fefc-0988-0d594bc5b25a	9231	Beltinci
00050000-5593-fefc-b45e-1e71a16a237b	2234	Benedikt
00050000-5593-fefc-e0ce-7ecbba07c257	2345	Bistrica ob Dravi
00050000-5593-fefc-fffd-f0fd5643c18f	3256	Bistrica ob Sotli
00050000-5593-fefc-c41b-36574f3d4820	8259	Bizeljsko
00050000-5593-fefc-076d-08e4f97b6fe0	1223	Blagovica
00050000-5593-fefc-346c-2fc3177da297	8283	Blanca
00050000-5593-fefc-7f47-98b8c3af35cb	4260	Bled
00050000-5593-fefc-e698-33f2f94212b7	4273	Blejska Dobrava
00050000-5593-fefc-1789-0ee8dccc5f90	9265	Bodonci
00050000-5593-fefc-1143-dd02fe575221	9222	Bogojina
00050000-5593-fefc-40c2-7cfd8bd5d687	4263	Bohinjska Bela
00050000-5593-fefc-d4df-1aaf21db88e6	4264	Bohinjska Bistrica
00050000-5593-fefc-b96f-a7ca9edbac3e	4265	Bohinjsko jezero
00050000-5593-fefc-b449-f01dc294158b	1353	Borovnica
00050000-5593-fefc-4bed-d5a5520da136	8294	Boštanj
00050000-5593-fefc-8205-6703061c198d	5230	Bovec
00050000-5593-fefc-e91e-fffb90b5c969	5295	Branik
00050000-5593-fefc-52f5-ad2a6064b7af	3314	Braslovče
00050000-5593-fefc-fe8e-66dfae820508	5223	Breginj
00050000-5593-fefc-cc5b-3c390a9536fb	8280	Brestanica
00050000-5593-fefc-ab61-c22317e222c2	2354	Bresternica
00050000-5593-fefc-6c89-940db8bd8ccc	4243	Brezje
00050000-5593-fefc-670e-27c368b4bd3c	1351	Brezovica pri Ljubljani
00050000-5593-fefc-2999-862d3e19d522	8250	Brežice
00050000-5593-fefc-d0ba-7a7cc1bb4ae1	4210	Brnik - Aerodrom
00050000-5593-fefc-f4e5-8069b5c33370	8321	Brusnice
00050000-5593-fefc-6760-a97250feed39	3255	Buče
00050000-5593-fefc-27b9-59aae0e30205	8276	Bučka 
00050000-5593-fefc-51e6-f6cc535df0d2	9261	Cankova
00050000-5593-fefc-8f28-9eda1be11438	3000	Celje 
00050000-5593-fefc-892a-1d02114c80bb	3001	Celje - poštni predali
00050000-5593-fefc-ed9f-a1a62ee9b11c	4207	Cerklje na Gorenjskem
00050000-5593-fefc-17e8-9fc06108bf39	8263	Cerklje ob Krki
00050000-5593-fefc-aff9-26c1fc8ebba7	1380	Cerknica
00050000-5593-fefc-3496-02ffebefd3c8	5282	Cerkno
00050000-5593-fefc-6a6d-d0738b1e2ae4	2236	Cerkvenjak
00050000-5593-fefc-279f-30da16f76b83	2215	Ceršak
00050000-5593-fefc-1171-bc08b4c05b79	2326	Cirkovce
00050000-5593-fefc-d1dc-b0efcd797515	2282	Cirkulane
00050000-5593-fefc-e36e-e3001a4a5604	5273	Col
00050000-5593-fefc-37cd-7399248757ca	8251	Čatež ob Savi
00050000-5593-fefc-5ac8-800c688888b7	1413	Čemšenik
00050000-5593-fefc-3a7e-d39d0cc666fa	5253	Čepovan
00050000-5593-fefc-0412-72fe725321c5	9232	Črenšovci
00050000-5593-fefc-504c-523be060b092	2393	Črna na Koroškem
00050000-5593-fefc-015b-21957d49d79e	6275	Črni Kal
00050000-5593-fefc-c605-b4d463f46d4a	5274	Črni Vrh nad Idrijo
00050000-5593-fefc-44c0-6a3f9520b92a	5262	Črniče
00050000-5593-fefc-2fde-fd5020df2f65	8340	Črnomelj
00050000-5593-fefc-088f-3309398f6559	6271	Dekani
00050000-5593-fefc-1d7a-e539167f2eac	5210	Deskle
00050000-5593-fefc-ad32-6d50548ff3af	2253	Destrnik
00050000-5593-fefc-69dc-56dc2b413146	6215	Divača
00050000-5593-fefc-d6d8-14cf68752da4	1233	Dob
00050000-5593-fefc-c9a2-9f9b46965e81	3224	Dobje pri Planini
00050000-5593-fefc-4ecc-fe2acf66139e	8257	Dobova
00050000-5593-fefc-b2fd-f5ca3e6c18e5	1423	Dobovec
00050000-5593-fefc-2631-98ffd0040ef2	5263	Dobravlje
00050000-5593-fefc-b481-389e5ded55f2	3204	Dobrna
00050000-5593-fefc-2cc9-5fac06f8be6f	8211	Dobrnič
00050000-5593-fefc-0d04-780997abd12f	1356	Dobrova
00050000-5593-fefc-86e2-3e91cec6a76a	9223	Dobrovnik/Dobronak 
00050000-5593-fefc-5111-6d60aa7e0a0f	5212	Dobrovo v Brdih
00050000-5593-fefc-8cf2-009f95175dea	1431	Dol pri Hrastniku
00050000-5593-fefc-91d1-4eed31927a54	1262	Dol pri Ljubljani
00050000-5593-fefc-a183-3e18a4aa9020	1273	Dole pri Litiji
00050000-5593-fefc-5614-778cef5628f6	1331	Dolenja vas
00050000-5593-fefc-8ce2-520fe34a1873	8350	Dolenjske Toplice
00050000-5593-fefc-4aab-4cc0a36f7618	1230	Domžale
00050000-5593-fefc-3cbd-0a8bbfb5b41e	2252	Dornava
00050000-5593-fefc-e119-e1637a9774c8	5294	Dornberk
00050000-5593-fefc-e005-39aece1fe0d7	1319	Draga
00050000-5593-fefc-5206-2d57d392b3a2	8343	Dragatuš
00050000-5593-fefc-1a12-60dff584a18e	3222	Dramlje
00050000-5593-fefc-3540-6eecb1a2b471	2370	Dravograd
00050000-5593-fefc-7e5e-6384ed6dc593	4203	Duplje
00050000-5593-fefc-f612-73182507fe81	6221	Dutovlje
00050000-5593-fefc-f25a-b87ebfa4eede	8361	Dvor
00050000-5593-fefc-b6c9-03e59d61eaf7	2343	Fala
00050000-5593-fefc-d238-9090e7dc6713	9208	Fokovci
00050000-5593-fefc-f295-b327078a1380	2313	Fram
00050000-5593-fefc-4fda-695724a8ef2d	3213	Frankolovo
00050000-5593-fefc-c898-9da81de30b3b	1274	Gabrovka
00050000-5593-fefc-21a1-b130c74c562c	8254	Globoko
00050000-5593-fefc-59b5-d09165745749	5275	Godovič
00050000-5593-fefc-7e9a-e9c68fb36bc5	4204	Golnik
00050000-5593-fefc-8af4-3886c0bbac6a	3303	Gomilsko
00050000-5593-fefc-67b9-110ee92c57b4	4224	Gorenja vas
00050000-5593-fefc-b2d7-5f594e4a9ac8	3263	Gorica pri Slivnici
00050000-5593-fefc-4e79-cfd9cf15597f	2272	Gorišnica
00050000-5593-fefc-9cb1-05a4c657de65	9250	Gornja Radgona
00050000-5593-fefc-0b7e-b206b278864e	3342	Gornji Grad
00050000-5593-fefc-3a24-5c2e03c235c0	4282	Gozd Martuljek
00050000-5593-fefc-a283-f0eed6e2530f	6272	Gračišče
00050000-5593-fefc-d631-28e228ab3e74	9264	Grad
00050000-5593-fefc-f9a0-a552d46f0bfc	8332	Gradac
00050000-5593-fefc-7072-a4198c51caee	1384	Grahovo
00050000-5593-fefc-97f3-84431d532017	5242	Grahovo ob Bači
00050000-5593-fefc-4306-172751bb96df	5251	Grgar
00050000-5593-fefc-75b2-65d1cc6a9541	3302	Griže
00050000-5593-fefc-e857-bcfe8152be22	3231	Grobelno
00050000-5593-fefc-30ad-8f5a3b87467b	1290	Grosuplje
00050000-5593-fefc-bb29-0e958f8d2e16	2288	Hajdina
00050000-5593-fefc-256d-b756ff25f6b3	8362	Hinje
00050000-5593-fefc-1709-60b9a73a614f	2311	Hoče
00050000-5593-fefc-e737-5bd79bde8b30	9205	Hodoš/Hodos
00050000-5593-fefc-ace5-f4f7753aff60	1354	Horjul
00050000-5593-fefc-c74f-500de18e6d01	1372	Hotedršica
00050000-5593-fefc-c6bf-94955a3d8569	1430	Hrastnik
00050000-5593-fefc-fa96-ec178e6c0ed8	6225	Hruševje
00050000-5593-fefc-dc7b-e26779ba45af	4276	Hrušica
00050000-5593-fefc-0c7a-6ca2bd901756	5280	Idrija
00050000-5593-fefc-3a0b-da91acf2dfa0	1292	Ig
00050000-5593-fefc-b340-c7158ed5ad83	6250	Ilirska Bistrica
00050000-5593-fefc-76fd-bfb643c84004	6251	Ilirska Bistrica-Trnovo
00050000-5593-fefc-0b56-9efba3027f9d	1295	Ivančna Gorica
00050000-5593-fefc-0f31-abd6bdcec22a	2259	Ivanjkovci
00050000-5593-fefc-5e93-f03432ab7f5c	1411	Izlake
00050000-5593-fefc-a166-23a15e17f022	6310	Izola/Isola
00050000-5593-fefc-3338-3614ef4f8887	2222	Jakobski Dol
00050000-5593-fefc-d0c2-913736a9a26a	2221	Jarenina
00050000-5593-fefc-da32-bcb02cc3a407	6254	Jelšane
00050000-5593-fefc-b64d-4f3e7167b035	4270	Jesenice
00050000-5593-fefc-b934-444e7219e0ef	8261	Jesenice na Dolenjskem
00050000-5593-fefc-5df1-cccaadb2da6a	3273	Jurklošter
00050000-5593-fefc-518d-6dac4b235970	2223	Jurovski Dol
00050000-5593-fefc-b284-3b800f6c17be	2256	Juršinci
00050000-5593-fefc-143a-e6663115c957	5214	Kal nad Kanalom
00050000-5593-fefc-a9c3-202781cdfc01	3233	Kalobje
00050000-5593-fefc-affe-59114ddb9ee2	4246	Kamna Gorica
00050000-5593-fefc-4a9e-91d7669aaf21	2351	Kamnica
00050000-5593-fefc-bdbe-fed4e5078511	1241	Kamnik
00050000-5593-fefc-8fb8-f7252c7808fa	5213	Kanal
00050000-5593-fefc-31c2-00bfb2ac4938	8258	Kapele
00050000-5593-fefc-ce39-4ba7f00187db	2362	Kapla
00050000-5593-fefc-6e06-e4d8984ced26	2325	Kidričevo
00050000-5593-fefc-e350-6c9508e08bac	1412	Kisovec
00050000-5593-fefc-cac0-55ecaf33ed70	6253	Knežak
00050000-5593-fefc-443b-fd151fc83f98	5222	Kobarid
00050000-5593-fefc-1594-d8fd59c88802	9227	Kobilje
00050000-5593-fefc-7df4-a093e44e99ea	1330	Kočevje
00050000-5593-fefc-2de8-082cbd2bb130	1338	Kočevska Reka
00050000-5593-fefc-e27e-f1bccffb709e	2276	Kog
00050000-5593-fefc-ef83-d7072863ae39	5211	Kojsko
00050000-5593-fefc-3b38-3c697c32d94c	6223	Komen
00050000-5593-fefc-b3e0-3157034466e3	1218	Komenda
00050000-5593-fefc-610c-3856de9c35e6	6000	Koper/Capodistria 
00050000-5593-fefc-8469-96e71d7a8db7	6001	Koper/Capodistria - poštni predali
00050000-5593-fefc-514b-5df189d09add	8282	Koprivnica
00050000-5593-fefc-393c-eaa334a4d157	5296	Kostanjevica na Krasu
00050000-5593-fefc-1757-b0b80baed455	8311	Kostanjevica na Krki
00050000-5593-fefc-e0e0-edb032484089	1336	Kostel
00050000-5593-fefc-b615-bc1414a83ab6	6256	Košana
00050000-5593-fefc-a925-19d195f51c8f	2394	Kotlje
00050000-5593-fefc-dba0-619329c3da3e	6240	Kozina
00050000-5593-fefc-8c8d-0620c33e49b5	3260	Kozje
00050000-5593-fefc-df2d-b7cbbd17ccd1	4000	Kranj 
00050000-5593-fefc-1f97-53b05d4648b9	4001	Kranj - poštni predali
00050000-5593-fefc-1b53-23b7331e9fbf	4280	Kranjska Gora
00050000-5593-fefc-e42e-7bce1cdcbbe0	1281	Kresnice
00050000-5593-fefc-2ba8-a9c2df40bf64	4294	Križe
00050000-5593-fefc-d03b-c8222c576093	9206	Križevci
00050000-5593-fefc-0753-478204840351	9242	Križevci pri Ljutomeru
00050000-5593-fefc-e269-247f211422e5	1301	Krka
00050000-5593-fefc-05df-796d5f92d36a	8296	Krmelj
00050000-5593-fefc-6a15-4831c2666738	4245	Kropa
00050000-5593-fefc-c32f-7f203304fda1	8262	Krška vas
00050000-5593-fefc-65b2-697ac34f51af	8270	Krško
00050000-5593-fefc-1904-e2ccac2f76a6	9263	Kuzma
00050000-5593-fefc-6509-e0922ac849aa	2318	Laporje
00050000-5593-fefc-d341-a0bb8b5a5014	3270	Laško
00050000-5593-fefc-f7be-a8ff498fb2be	1219	Laze v Tuhinju
00050000-5593-fefc-723d-31a252640971	2230	Lenart v Slovenskih goricah
00050000-5593-fefc-10a8-086e74b8693c	9220	Lendava/Lendva
00050000-5593-fefc-0141-1b598df24a7a	4248	Lesce
00050000-5593-fefc-ee57-020b5a88d88f	3261	Lesično
00050000-5593-fefc-94e4-1f56032f889e	8273	Leskovec pri Krškem
00050000-5593-fefc-0fb3-491515ba6339	2372	Libeliče
00050000-5593-fefc-d062-3cdd5f0275ec	2341	Limbuš
00050000-5593-fefc-6019-66b2c5102e54	1270	Litija
00050000-5593-fefc-0518-65f61266ad1e	3202	Ljubečna
00050000-5593-fefc-e790-6d8d0ae1a960	1000	Ljubljana 
00050000-5593-fefc-2b52-6d9b60938a94	1001	Ljubljana - poštni predali
00050000-5593-fefc-33ac-c40abf1b29ab	1231	Ljubljana - Črnuče
00050000-5593-fefc-a8ab-788287198857	1261	Ljubljana - Dobrunje
00050000-5593-fefc-f3e0-1ba82fa99ba1	1260	Ljubljana - Polje
00050000-5593-fefc-f702-dba3f953033b	1210	Ljubljana - Šentvid
00050000-5593-fefc-7d32-2bfe3d4b9307	1211	Ljubljana - Šmartno
00050000-5593-fefc-66b1-1fa28d416dfa	3333	Ljubno ob Savinji
00050000-5593-fefc-a022-e4a8faaa741b	9240	Ljutomer
00050000-5593-fefc-06c8-b7507c65a4cb	3215	Loče
00050000-5593-fefc-6d2d-c194b4145309	5231	Log pod Mangartom
00050000-5593-fefc-2404-c4dcb75cb832	1358	Log pri Brezovici
00050000-5593-fefc-291f-87a53712bd13	1370	Logatec
00050000-5593-fefc-3f7b-5490c9fdb203	1371	Logatec
00050000-5593-fefc-0f2f-b1049dcb66c6	1434	Loka pri Zidanem Mostu
00050000-5593-fefc-3826-8a770608efe2	3223	Loka pri Žusmu
00050000-5593-fefc-2a70-dcf2838453cc	6219	Lokev
00050000-5593-fefc-79fd-446267a996e7	1318	Loški Potok
00050000-5593-fefc-6fe4-80769595b83f	2324	Lovrenc na Dravskem polju
00050000-5593-fefc-d37d-e28da8fa885a	2344	Lovrenc na Pohorju
00050000-5593-fefc-79d2-275f0ee5fae9	3334	Luče
00050000-5593-fefc-fc4f-eda4d720c887	1225	Lukovica
00050000-5593-fefc-2599-c445fa71a302	9202	Mačkovci
00050000-5593-fefc-5490-09642192f4b2	2322	Majšperk
00050000-5593-fefc-6f99-84a6aa24f474	2321	Makole
00050000-5593-fefc-9fba-1e74dae05520	9243	Mala Nedelja
00050000-5593-fefc-a64e-798381acb0b7	2229	Malečnik
00050000-5593-fefc-59fb-390bc82ee27f	6273	Marezige
00050000-5593-fefc-2962-fe2877489405	2000	Maribor 
00050000-5593-fefc-9931-f72603b9fbd6	2001	Maribor - poštni predali
00050000-5593-fefc-13a7-ad241344028a	2206	Marjeta na Dravskem polju
00050000-5593-fefc-7e7c-04723d10b7b4	2281	Markovci
00050000-5593-fefc-0c7d-de8867432008	9221	Martjanci
00050000-5593-fefc-3dae-64210e29dadc	6242	Materija
00050000-5593-fefc-ff57-f3335b1120ee	4211	Mavčiče
00050000-5593-fefc-3c92-209caa509b8b	1215	Medvode
00050000-5593-fefc-f870-ceffcf76cfbf	1234	Mengeš
00050000-5593-fefc-ae45-2d379d22ee66	8330	Metlika
00050000-5593-fefc-b25f-b8a40887b6ec	2392	Mežica
00050000-5593-fefc-1402-c4f85a179d7b	2204	Miklavž na Dravskem polju
00050000-5593-fefc-0404-262eca0d4399	2275	Miklavž pri Ormožu
00050000-5593-fefc-671a-9f097fb4bc11	5291	Miren
00050000-5593-fefc-7cb5-8d4326c9200a	8233	Mirna
00050000-5593-fefc-485a-746a4b8b2f14	8216	Mirna Peč
00050000-5593-fefc-9180-9a72a465940a	2382	Mislinja
00050000-5593-fefc-17ce-0aca6d02c85e	4281	Mojstrana
00050000-5593-fefc-f2f5-44400ecf1316	8230	Mokronog
00050000-5593-fefc-7076-0c2de62270ec	1251	Moravče
00050000-5593-fefc-8989-38ba3458f799	9226	Moravske Toplice
00050000-5593-fefc-560e-376b8b036057	5216	Most na Soči
00050000-5593-fefc-7875-54b32b37dd9a	1221	Motnik
00050000-5593-fefc-87d4-5622a55df108	3330	Mozirje
00050000-5593-fefc-f20c-949c3e89c4da	9000	Murska Sobota 
00050000-5593-fefc-6586-5d3496c91b96	9001	Murska Sobota - poštni predali
00050000-5593-fefc-692e-0f7256dc81d4	2366	Muta
00050000-5593-fefc-098a-0d6a427ef6c1	4202	Naklo
00050000-5593-fefc-8aa0-9c9fc0a4cdfa	3331	Nazarje
00050000-5593-fefc-ce53-e34a147a1e02	1357	Notranje Gorice
00050000-5593-fefc-bb49-f27e712ae071	3203	Nova Cerkev
00050000-5593-fefc-327b-362df9bdbde0	5000	Nova Gorica 
00050000-5593-fefc-fd0e-1d8c6408210f	5001	Nova Gorica - poštni predali
00050000-5593-fefc-6cc9-e719d63505c3	1385	Nova vas
00050000-5593-fefc-af5c-1c2807ef11f5	8000	Novo mesto
00050000-5593-fefc-ed76-635cdeed4228	8001	Novo mesto - poštni predali
00050000-5593-fefc-7483-2400da05f666	6243	Obrov
00050000-5593-fefc-e8de-2cdb7bcc7dd5	9233	Odranci
00050000-5593-fefc-e5c8-66f68ff22f8a	2317	Oplotnica
00050000-5593-fefc-3054-fe3863079135	2312	Orehova vas
00050000-5593-fefc-e387-9a892b6d3ac0	2270	Ormož
00050000-5593-fefc-40ed-34638df60b4f	1316	Ortnek
00050000-5593-fefc-c57c-ccad13791295	1337	Osilnica
00050000-5593-fefc-8cbd-9808f9029ba5	8222	Otočec
00050000-5593-fefc-7a55-655523c77623	2361	Ožbalt
00050000-5593-fefc-c407-8182edbc4e77	2231	Pernica
00050000-5593-fefc-d37a-e23d6b86b30b	2211	Pesnica pri Mariboru
00050000-5593-fefc-fa69-6b20249a1721	9203	Petrovci
00050000-5593-fefc-7434-aaca79a0cb61	3301	Petrovče
00050000-5593-fefc-8f53-431ab427f2b4	6330	Piran/Pirano
00050000-5593-fefc-d235-2dd13b5c1e8c	8255	Pišece
00050000-5593-fefc-10b4-300a9c972766	6257	Pivka
00050000-5593-fefc-ab8d-577d954d0ff6	6232	Planina
00050000-5593-fefc-45d4-3a5b25fa624d	3225	Planina pri Sevnici
00050000-5593-fefc-ae9e-26315b12e161	6276	Pobegi
00050000-5593-fefc-a143-d7e3c2a94705	8312	Podbočje
00050000-5593-fefc-bd26-0e585f448bb7	5243	Podbrdo
00050000-5593-fefc-7c0d-4f91fef5e20a	3254	Podčetrtek
00050000-5593-fefc-9bca-15206b7c1241	2273	Podgorci
00050000-5593-fefc-bea5-539a94f9617f	6216	Podgorje
00050000-5593-fefc-cf1b-705e345d9722	2381	Podgorje pri Slovenj Gradcu
00050000-5593-fefc-75c4-5b1d1fa22755	6244	Podgrad
00050000-5593-fefc-ee1d-79ffe4e997fd	1414	Podkum
00050000-5593-fefc-b046-3483f0e61fa8	2286	Podlehnik
00050000-5593-fefc-41cc-b58408e57c57	5272	Podnanos
00050000-5593-fefc-6cd6-8911d402bcfc	4244	Podnart
00050000-5593-fefc-4554-2ee6f5b07008	3241	Podplat
00050000-5593-fefc-f33d-d65604dfde22	3257	Podsreda
00050000-5593-fefc-0a47-db90d0e315b4	2363	Podvelka
00050000-5593-fefc-3335-258d27ae489d	2208	Pohorje
00050000-5593-fefc-27cd-db3b302d313d	2257	Polenšak
00050000-5593-fefc-9ef2-37db881c0a3e	1355	Polhov Gradec
00050000-5593-fefc-e829-85bea9fefdaa	4223	Poljane nad Škofjo Loko
00050000-5593-fefc-973c-b6e9e8b9b49b	2319	Poljčane
00050000-5593-fefc-a323-0754086cc9de	1272	Polšnik
00050000-5593-fefc-b4cb-8125e331f5b2	3313	Polzela
00050000-5593-fefc-debf-4072ec2f7aa3	3232	Ponikva
00050000-5593-fefc-e24d-dfbcb122cd6e	6320	Portorož/Portorose
00050000-5593-fefc-701b-3ff8748877ed	6230	Postojna
00050000-5593-fefc-d12b-84e83428bc97	2331	Pragersko
00050000-5593-fefc-6cc1-70d9ec35ce75	3312	Prebold
00050000-5593-fefc-b658-b260ed822108	4205	Preddvor
00050000-5593-fefc-7f56-85fa7223a98b	6255	Prem
00050000-5593-fefc-9083-a148fe79949e	1352	Preserje
00050000-5593-fefc-9976-e99b45a4b70f	6258	Prestranek
00050000-5593-fefc-03dc-9de2c831b2b8	2391	Prevalje
00050000-5593-fefc-e92e-a73dc4c623b5	3262	Prevorje
00050000-5593-fefc-eac7-58c867df4298	1276	Primskovo 
00050000-5593-fefc-89bc-7e7b74a37d47	3253	Pristava pri Mestinju
00050000-5593-fefc-491f-09d75418a9f8	9207	Prosenjakovci/Partosfalva
00050000-5593-fefc-04c8-c27647f75e49	5297	Prvačina
00050000-5593-fefc-3301-b97ac7874fa8	2250	Ptuj
00050000-5593-fefc-a01f-160608eeec43	2323	Ptujska Gora
00050000-5593-fefc-6606-61c225a8615f	9201	Puconci
00050000-5593-fefc-118c-2a8f4c96f76c	2327	Rače
00050000-5593-fefc-fa79-c26688be5373	1433	Radeče
00050000-5593-fefc-d900-b27059855f8d	9252	Radenci
00050000-5593-fefc-7dca-d8e3ecc1ef23	2360	Radlje ob Dravi
00050000-5593-fefc-bab1-748ced06c988	1235	Radomlje
00050000-5593-fefc-8f4a-e331349bec61	4240	Radovljica
00050000-5593-fefc-c839-33cda57e65eb	8274	Raka
00050000-5593-fefc-d1a5-cc47418c948f	1381	Rakek
00050000-5593-fefc-49b6-8808f09d6af1	4283	Rateče - Planica
00050000-5593-fefc-188c-f03281c70c34	2390	Ravne na Koroškem
00050000-5593-fefc-0db9-2f9868b8fde9	9246	Razkrižje
00050000-5593-fefc-f36b-98d3ca706c9e	3332	Rečica ob Savinji
00050000-5593-fefc-94dc-b86e457e849a	5292	Renče
00050000-5593-fefc-dfa3-6fb1f4e7fba3	1310	Ribnica
00050000-5593-fefc-18b4-af0c864d7551	2364	Ribnica na Pohorju
00050000-5593-fefc-b774-2bf17aa729c7	3272	Rimske Toplice
00050000-5593-fefc-8189-05fd1547204f	1314	Rob
00050000-5593-fefc-543f-0e1aebfe82de	5215	Ročinj
00050000-5593-fefc-c1b0-35f53e792586	3250	Rogaška Slatina
00050000-5593-fefc-d9cb-4072d1f2ace6	9262	Rogašovci
00050000-5593-fefc-069a-08b4c3993e69	3252	Rogatec
00050000-5593-fefc-24b7-ff221accfa9e	1373	Rovte
00050000-5593-fefc-b3ca-0a7937203c0d	2342	Ruše
00050000-5593-fefc-61ab-070842a4d544	1282	Sava
00050000-5593-fefc-b833-4b199c7ac374	6333	Sečovlje/Sicciole
00050000-5593-fefc-a2bd-3ffeaffb86c9	4227	Selca
00050000-5593-fefc-811a-c01e617d15c8	2352	Selnica ob Dravi
00050000-5593-fefc-b7dd-58e8f9d4415a	8333	Semič
00050000-5593-fefc-d8f8-2b81a7c8d38b	8281	Senovo
00050000-5593-fefc-7829-42c053eaa981	6224	Senožeče
00050000-5593-fefc-06a2-02e3b0181f99	8290	Sevnica
00050000-5593-fefc-6110-4cc3919f1df1	6210	Sežana
00050000-5593-fefc-37ec-7b0eec8011ae	2214	Sladki Vrh
00050000-5593-fefc-4f19-b64736f126d7	5283	Slap ob Idrijci
00050000-5593-fefc-94dc-569718412336	2380	Slovenj Gradec
00050000-5593-fefc-623a-21b8b7fef836	2310	Slovenska Bistrica
00050000-5593-fefc-994f-3d523b7aa786	3210	Slovenske Konjice
00050000-5593-fefc-ad8d-47d98117cfb7	1216	Smlednik
00050000-5593-fefc-e1d5-3711c2d2990e	5232	Soča
00050000-5593-fefc-85e6-df1fd02feb2c	1317	Sodražica
00050000-5593-fefc-a149-3ad9c60b87ce	3335	Solčava
00050000-5593-fefc-e58a-44291c81ecfb	5250	Solkan
00050000-5593-fefc-f7b2-b17622a438f8	4229	Sorica
00050000-5593-fefc-9d3f-032235bec63e	4225	Sovodenj
00050000-5593-fefc-3caf-c78d6aaca193	5281	Spodnja Idrija
00050000-5593-fefc-bdd6-57f611d3e968	2241	Spodnji Duplek
00050000-5593-fefc-34a2-bd29082ec180	9245	Spodnji Ivanjci
00050000-5593-fefc-dcc0-88e39bffe6da	2277	Središče ob Dravi
00050000-5593-fefc-500c-bc3f30b550d7	4267	Srednja vas v Bohinju
00050000-5593-fefc-1eb8-f054ef4d6d2e	8256	Sromlje 
00050000-5593-fefc-0713-4b6130cacf32	5224	Srpenica
00050000-5593-fefc-54e8-e52668eb0e96	1242	Stahovica
00050000-5593-fefc-8d41-07b856f0e21a	1332	Stara Cerkev
00050000-5593-fefc-2786-3f29940b34aa	8342	Stari trg ob Kolpi
00050000-5593-fefc-507f-45ff8e3b5cff	1386	Stari trg pri Ložu
00050000-5593-fefc-8605-882a7df9cac7	2205	Starše
00050000-5593-fefc-e59e-eeefecc2e47a	2289	Stoperce
00050000-5593-fefc-ebd6-015094a6e3a0	8322	Stopiče
00050000-5593-fefc-bb2c-c5ac2c8bac86	3206	Stranice
00050000-5593-fefc-f381-4a5c8190026d	8351	Straža
00050000-5593-fefc-b4bb-c5e67074d00f	1313	Struge
00050000-5593-fefc-cbc1-9ad2fd64bb2c	8293	Studenec
00050000-5593-fefc-bddd-ba71d8d3945e	8331	Suhor
00050000-5593-fefc-c2fb-df06f1e2a0ce	2233	Sv. Ana v Slovenskih goricah
00050000-5593-fefc-e3e6-ad5f584fa8e4	2235	Sv. Trojica v Slovenskih goricah
00050000-5593-fefc-00b7-091a5c388a0e	2353	Sveti Duh na Ostrem Vrhu
00050000-5593-fefc-7453-ca1f7c9a93ab	9244	Sveti Jurij ob Ščavnici
00050000-5593-fefc-611f-12e381ed5099	3264	Sveti Štefan
00050000-5593-fefc-605c-6cda10056d99	2258	Sveti Tomaž
00050000-5593-fefc-ac5c-8deb2964ccce	9204	Šalovci
00050000-5593-fefc-7b95-58f097771014	5261	Šempas
00050000-5593-fefc-e902-fe3911d0b317	5290	Šempeter pri Gorici
00050000-5593-fefc-d08c-b4aa084bb783	3311	Šempeter v Savinjski dolini
00050000-5593-fefc-ccb9-405291505048	4208	Šenčur
00050000-5593-fefc-1c0e-cebbbfd0fbce	2212	Šentilj v Slovenskih goricah
00050000-5593-fefc-4293-7e2d61bd0a96	8297	Šentjanž
00050000-5593-fefc-6540-758a9fa91eb5	2373	Šentjanž pri Dravogradu
00050000-5593-fefc-54f8-23b813e26104	8310	Šentjernej
00050000-5593-fefc-5758-fa0eab12aa79	3230	Šentjur
00050000-5593-fefc-eefa-b54080d31423	3271	Šentrupert
00050000-5593-fefc-fecf-d35bab52a63e	8232	Šentrupert
00050000-5593-fefc-0f6c-acb634c5b63a	1296	Šentvid pri Stični
00050000-5593-fefc-8c01-6a7c1775a011	8275	Škocjan
00050000-5593-fefc-04d8-b56c70df786b	6281	Škofije
00050000-5593-fefc-b263-a44fcc856731	4220	Škofja Loka
00050000-5593-fefc-1b66-a17433c83bde	3211	Škofja vas
00050000-5593-fefc-4284-11f80562f478	1291	Škofljica
00050000-5593-fefc-e0b2-5aba567ff5e8	6274	Šmarje
00050000-5593-fefc-d03e-38db70e06d4b	1293	Šmarje - Sap
00050000-5593-fefc-9f5d-7049cdf7d8c3	3240	Šmarje pri Jelšah
00050000-5593-fefc-b6d3-1ddcc9d79096	8220	Šmarješke Toplice
00050000-5593-fefc-35a5-636e9242f76c	2315	Šmartno na Pohorju
00050000-5593-fefc-7cdb-9234580878bb	3341	Šmartno ob Dreti
00050000-5593-fefc-c6d7-3bc26def2e1f	3327	Šmartno ob Paki
00050000-5593-fefc-9478-30d5193dd57c	1275	Šmartno pri Litiji
00050000-5593-fefc-fa82-a4aa30b6ee40	2383	Šmartno pri Slovenj Gradcu
00050000-5593-fefc-09b8-6a63a9a8856e	3201	Šmartno v Rožni dolini
00050000-5593-fefc-bc51-ba47b6fafdf2	3325	Šoštanj
00050000-5593-fefc-ed33-7fdf67a83403	6222	Štanjel
00050000-5593-fefc-6df3-aad69ee41e59	3220	Štore
00050000-5593-fefc-696c-9c1fff1958f7	3304	Tabor
00050000-5593-fefc-68e5-3dcfb13cda1f	3221	Teharje
00050000-5593-fefc-ced1-ab0e66ca2d6d	9251	Tišina
00050000-5593-fefc-7daf-10ec521345d2	5220	Tolmin
00050000-5593-fefc-4fb5-88d961ed01a3	3326	Topolšica
00050000-5593-fefc-e14f-fc2aa617a821	2371	Trbonje
00050000-5593-fefc-685b-aa53ace9a0f2	1420	Trbovlje
00050000-5593-fefc-f3be-9a2b76dc0987	8231	Trebelno 
00050000-5593-fefc-6993-6a462a44329d	8210	Trebnje
00050000-5593-fefc-6733-553ca0d42276	5252	Trnovo pri Gorici
00050000-5593-fefc-b1ac-bee4649e054d	2254	Trnovska vas
00050000-5593-fefc-4202-01aac4a7a734	1222	Trojane
00050000-5593-fefc-654c-5d985910e2b3	1236	Trzin
00050000-5593-fefc-2739-6b7e4fedaa81	4290	Tržič
00050000-5593-fefc-5008-ce58de00655c	8295	Tržišče
00050000-5593-fefc-d19b-59196aa0815e	1311	Turjak
00050000-5593-fefc-9a3b-f2c30c2803f8	9224	Turnišče
00050000-5593-fefc-d012-ceee733e00db	8323	Uršna sela
00050000-5593-fefc-5804-bdca7a228e7b	1252	Vače
00050000-5593-fefc-5329-eaa726ce1378	3320	Velenje 
00050000-5593-fefc-a2c9-fa39e90a08a0	3322	Velenje - poštni predali
00050000-5593-fefc-1d2e-bd9451bd5512	8212	Velika Loka
00050000-5593-fefc-0493-cfe6416b8669	2274	Velika Nedelja
00050000-5593-fefc-4bb4-442acbb4668c	9225	Velika Polana
00050000-5593-fefc-7b44-48f54c3b4961	1315	Velike Lašče
00050000-5593-fefc-92b3-c3293752c6ef	8213	Veliki Gaber
00050000-5593-fefc-1f77-f36c9cb0d908	9241	Veržej
00050000-5593-fefc-6c3f-98d33d28be7c	1312	Videm - Dobrepolje
00050000-5593-fefc-6f2f-9e4ab0308143	2284	Videm pri Ptuju
00050000-5593-fefc-0c70-eeb2ddbb8108	8344	Vinica
00050000-5593-fefc-698b-2dec860f50af	5271	Vipava
00050000-5593-fefc-5b00-cb9d189b7a60	4212	Visoko
00050000-5593-fefc-8e0a-0334282c9aa7	1294	Višnja Gora
00050000-5593-fefc-360e-54f990728237	3205	Vitanje
00050000-5593-fefc-aa0d-c80462a116c0	2255	Vitomarci
00050000-5593-fefc-e19d-7a97a83a413c	1217	Vodice
00050000-5593-fefc-20f3-68c5451b47d0	3212	Vojnik\t
00050000-5593-fefc-0564-9fa629c8ed54	5293	Volčja Draga
00050000-5593-fefc-bc3e-7218bf8ef6e6	2232	Voličina
00050000-5593-fefc-96d0-59648df32b1d	3305	Vransko
00050000-5593-fefc-38de-2f767da2c932	6217	Vremski Britof
00050000-5593-fefc-30bc-6accce689ee8	1360	Vrhnika
00050000-5593-fefc-d1f2-89bc784a518a	2365	Vuhred
00050000-5593-fefc-a534-4f6fea865ac4	2367	Vuzenica
00050000-5593-fefc-b9c8-2790462d9127	8292	Zabukovje 
00050000-5593-fefc-7a0d-cdf45effe655	1410	Zagorje ob Savi
00050000-5593-fefc-0e92-6fa94c7eef43	1303	Zagradec
00050000-5593-fefc-d59e-c46afb4e882e	2283	Zavrč
00050000-5593-fefc-ee63-a6bb94e357e8	8272	Zdole 
00050000-5593-fefc-83e9-4a5ca7c9a42f	4201	Zgornja Besnica
00050000-5593-fefc-d80e-8596d46ac04d	2242	Zgornja Korena
00050000-5593-fefc-aa8f-8f480cfc76b0	2201	Zgornja Kungota
00050000-5593-fefc-82a0-1ebc2fcc6dce	2316	Zgornja Ložnica
00050000-5593-fefc-4ee0-125c0a0954fe	2314	Zgornja Polskava
00050000-5593-fefc-0e9a-41f0327d59ae	2213	Zgornja Velka
00050000-5593-fefc-95fc-209bc354e396	4247	Zgornje Gorje
00050000-5593-fefc-a6a3-e1c3dbfbcd13	4206	Zgornje Jezersko
00050000-5593-fefc-dec8-2c0fba12d79d	2285	Zgornji Leskovec
00050000-5593-fefc-8448-fd41908a18bd	1432	Zidani Most
00050000-5593-fefc-611b-14b7cb0f3e7a	3214	Zreče
00050000-5593-fefc-3d1e-9cd26ef2fe38	4209	Žabnica
00050000-5593-fefc-47e9-99d3c9cf16ad	3310	Žalec
00050000-5593-fefc-0635-163785e63c96	4228	Železniki
00050000-5593-fefc-7320-d17c3904dde1	2287	Žetale
00050000-5593-fefc-a207-c5639ed2d391	4226	Žiri
00050000-5593-fefc-fa94-9c1cb178bb00	4274	Žirovnica
00050000-5593-fefc-8b06-f1536cb8bdbc	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8770840)
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
-- TOC entry 2859 (class 0 OID 8770651)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8770729)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8770852)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8770972)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8771021)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5593-fefe-2e72-3745b1cc65e9	00080000-5593-fefe-9ed7-d2034496f01c	0900	AK
00190000-5593-fefe-8144-725fb2838aeb	00080000-5593-fefd-1156-c66f311c6f33	0987	A
00190000-5593-fefe-33be-8d2a021c1a43	00080000-5593-fefd-f51f-a08a5fdf79bf	0989	A
00190000-5593-fefe-dd65-0bfdd2026631	00080000-5593-fefd-c564-b2e9ece894f1	0986	A
00190000-5593-fefe-b4c2-0248542fd403	00080000-5593-fefd-ff2d-b77420103d61	0984	A
00190000-5593-fefe-1d67-d6c9eafa3dfa	00080000-5593-fefd-1fc6-4ef01dd039a0	0983	A
00190000-5593-fefe-d02e-16eba1ba955f	00080000-5593-fefd-e82b-3573c7c52c74	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8771155)
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
-- TOC entry 2883 (class 0 OID 8770881)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5593-fefd-f417-c91b088ddb85	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5593-fefd-baad-166ef4b65ced	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5593-fefd-c6bf-ad8c4bf5d70a	0003	Kazinska	t	84	Kazinska dvorana
00220000-5593-fefd-e86c-5daf459960c6	0004	Mali oder	t	24	Mali oder 
00220000-5593-fefd-04dc-6659e7b70e08	0005	Komorni oder	t	15	Komorni oder
00220000-5593-fefd-6215-c4cf23f6e4d2	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5593-fefd-66be-9035dcfd76f8	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8770825)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8770815)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8771010)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8770949)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8770523)
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
-- TOC entry 2884 (class 0 OID 8770891)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8770561)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5593-fefc-d7d9-1412c9dadad0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5593-fefc-b1de-9c7866027381	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5593-fefc-eed2-b8d78d685b95	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5593-fefc-cf7b-075be8ef5430	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5593-fefc-b018-e0460aba6a7f	planer	Planer dogodkov v koledarju	t
00020000-5593-fefc-cb1e-e663299edad1	kadrovska	Kadrovska služba	t
00020000-5593-fefc-9c8b-ff83dfac1593	arhivar	Ažuriranje arhivalij	t
00020000-5593-fefc-4d25-14e34ee11f95	igralec	Igralec	t
00020000-5593-fefc-da40-8ec55be41327	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5593-fefd-482d-a768781737c1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8770545)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5593-fefc-4315-06fd050f5461	00020000-5593-fefc-eed2-b8d78d685b95
00010000-5593-fefc-81d0-957a7a0f5a8d	00020000-5593-fefc-eed2-b8d78d685b95
00010000-5593-fefe-7f90-38e5f276f994	00020000-5593-fefd-482d-a768781737c1
\.


--
-- TOC entry 2886 (class 0 OID 8770905)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8770846)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8770796)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8771205)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5593-fefd-1b23-5c345721cbb8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5593-fefd-9e55-6aa5963daafc	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5593-fefd-ed5d-ad7f47fc917b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5593-fefd-5700-54a93dba986f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5593-fefd-f624-e52d3add7ba5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8771197)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5593-fefd-e72a-7cb40994423c	00230000-5593-fefd-5700-54a93dba986f	popa
00240000-5593-fefd-d05e-d6c3e3c7f930	00230000-5593-fefd-5700-54a93dba986f	oseba
00240000-5593-fefd-137c-515bf4164f65	00230000-5593-fefd-9e55-6aa5963daafc	prostor
00240000-5593-fefd-36a0-8d19e0ddedc3	00230000-5593-fefd-5700-54a93dba986f	besedilo
00240000-5593-fefd-5763-d9425cc67df0	00230000-5593-fefd-5700-54a93dba986f	uprizoritev
00240000-5593-fefd-4cc6-c61a4de2d376	00230000-5593-fefd-5700-54a93dba986f	funkcija
00240000-5593-fefd-69f6-5ce59dc0a7df	00230000-5593-fefd-5700-54a93dba986f	tipfunkcije
00240000-5593-fefd-a89e-a53a922560be	00230000-5593-fefd-5700-54a93dba986f	alternacija
00240000-5593-fefd-11a4-e77f8c78701f	00230000-5593-fefd-1b23-5c345721cbb8	pogodba
00240000-5593-fefd-f893-afc3509f05ac	00230000-5593-fefd-5700-54a93dba986f	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8771192)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8770959)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5593-fefe-47c9-a3e718e66481	000e0000-5593-fefe-6a35-7bab5731eb59	00080000-5593-fefd-36ad-c6df4eb2a7c3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5593-fefe-93b8-379e6cd66c62	000e0000-5593-fefe-6a35-7bab5731eb59	00080000-5593-fefd-36ad-c6df4eb2a7c3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5593-fefe-eb3b-40cfec88794b	000e0000-5593-fefe-6a35-7bab5731eb59	00080000-5593-fefd-d32e-818a7a89d309	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8770623)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8770802)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5593-fefe-378c-0858c81df6ef	00180000-5593-fefe-d706-bec754527cec	000c0000-5593-fefe-7a92-dffb1521cc19	00090000-5593-fefe-bef3-a8f25be9ca7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-fefe-c10b-15d5f74be11f	00180000-5593-fefe-d706-bec754527cec	000c0000-5593-fefe-e4e4-6edf2b0a2f11	00090000-5593-fefe-e1b2-dfcf96c2e1c2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-fefe-d738-793085000830	00180000-5593-fefe-d706-bec754527cec	000c0000-5593-fefe-f46d-23308a98e780	00090000-5593-fefe-2040-f60a71d66d77	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-fefe-2930-c0f7dc2732b0	00180000-5593-fefe-d706-bec754527cec	000c0000-5593-fefe-acba-a65cb741db20	00090000-5593-fefe-c31e-7753def65f03	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-fefe-a34c-49e08d34dd7c	00180000-5593-fefe-d706-bec754527cec	000c0000-5593-fefe-1932-384e2eada3e5	00090000-5593-fefe-49aa-76b08420bf1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-fefe-7e2b-798de753f6b3	00180000-5593-fefe-781e-daf7695b24b8	\N	00090000-5593-fefe-49aa-76b08420bf1b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8770999)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5593-fefd-98a8-94d3ea310b68	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5593-fefd-d0aa-1fbd76b109ff	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5593-fefd-4133-f75e4b6a7696	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5593-fefd-e3fc-73b53f750268	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5593-fefd-bacc-d2a888901b07	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5593-fefd-05b2-09ebc4bea1b5	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5593-fefd-4f67-32c42db74699	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5593-fefd-ad08-9a4e7c56a9d4	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5593-fefd-643e-4ae7f72158e5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5593-fefd-254d-ef2cbc967689	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5593-fefd-cd4e-5d960eca8862	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5593-fefd-9c1f-0b7bfd8a6991	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5593-fefd-eda1-b5385d6bf8e5	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5593-fefd-6396-58aac664b584	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5593-fefd-b1cd-f9c5d5227999	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5593-fefd-c734-86af103ca9b1	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8771174)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5593-fefd-78a9-559bc7aefe46	01	Velika predstava	f	1.00	1.00
002b0000-5593-fefd-a152-95b2a1b0ad14	02	Mala predstava	f	0.50	0.50
002b0000-5593-fefd-be87-003d177452a5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5593-fefd-f012-e4939a532361	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5593-fefd-4da0-4eeef70f3ef4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8770686)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8770532)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5593-fefc-81d0-957a7a0f5a8d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODKNm2MfITyr8bcIuklrBTxHd09BYhEy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5593-fefd-01c5-62a757148e95	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5593-fefd-b318-3d081489f196	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5593-fefd-b0c9-2b16db266377	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5593-fefd-aa4a-b17bbe4e4ba6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5593-fefd-feec-59bfec106d91	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5593-fefd-58f7-18d467bdedd1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5593-fefd-4f29-21128dfbd889	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5593-fefd-0446-30858bd41082	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5593-fefd-8355-ba3d32551a0c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5593-fefe-7f90-38e5f276f994	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5593-fefc-4315-06fd050f5461	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8771056)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5593-fefe-d46f-05ab167fddd5	00160000-5593-fefd-3748-a8bfb1e124cc	00150000-5593-fefd-c826-309434f8d5c8	00140000-5593-fefb-9119-d2254269bdea	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5593-fefd-04dc-6659e7b70e08
000e0000-5593-fefe-6a35-7bab5731eb59	00160000-5593-fefd-408a-6b5a6fd7e336	00150000-5593-fefd-970f-cd6c4b5dcb96	00140000-5593-fefb-f330-23ae31e1fb5a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5593-fefd-6215-c4cf23f6e4d2
000e0000-5593-fefe-12f2-a50d2ebcc876	\N	00150000-5593-fefd-970f-cd6c4b5dcb96	00140000-5593-fefb-f330-23ae31e1fb5a	00190000-5593-fefe-8144-725fb2838aeb	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5593-fefd-04dc-6659e7b70e08
000e0000-5593-fefe-ae05-4280ba93efdd	\N	00150000-5593-fefd-970f-cd6c4b5dcb96	00140000-5593-fefb-f330-23ae31e1fb5a	00190000-5593-fefe-8144-725fb2838aeb	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5593-fefd-04dc-6659e7b70e08
000e0000-5593-fefe-7add-ba06a7cf84f8	\N	00150000-5593-fefd-970f-cd6c4b5dcb96	00140000-5593-fefb-f330-23ae31e1fb5a	00190000-5593-fefe-8144-725fb2838aeb	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5593-fefd-f417-c91b088ddb85
\.


--
-- TOC entry 2867 (class 0 OID 8770748)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5593-fefe-37a2-a340824bcbfd	000e0000-5593-fefe-6a35-7bab5731eb59	1	
00200000-5593-fefe-e918-d91f17992101	000e0000-5593-fefe-6a35-7bab5731eb59	2	
\.


--
-- TOC entry 2882 (class 0 OID 8770873)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8770942)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8770780)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8771046)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5593-fefb-9119-d2254269bdea	01	Drama	drama (SURS 01)
00140000-5593-fefb-992f-4104575f112f	02	Opera	opera (SURS 02)
00140000-5593-fefb-44be-a6f42dcfd20f	03	Balet	balet (SURS 03)
00140000-5593-fefb-d68b-d8e59437c0dd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5593-fefb-9369-c39c0a17701c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5593-fefb-f330-23ae31e1fb5a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5593-fefb-2dfc-0438f6c2ee33	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8770932)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5593-fefd-11cb-ca5d998dc61e	01	Opera	opera
00150000-5593-fefd-4e35-264527502eb2	02	Opereta	opereta
00150000-5593-fefd-2ef4-282a0e8f3f65	03	Balet	balet
00150000-5593-fefd-4dc9-cd5d26219099	04	Plesne prireditve	plesne prireditve
00150000-5593-fefd-0c55-d002cff051de	05	Lutkovno gledališče	lutkovno gledališče
00150000-5593-fefd-587f-e4e209618d2b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5593-fefd-3eb5-a150b5b6cdfd	07	Biografska drama	biografska drama
00150000-5593-fefd-c826-309434f8d5c8	08	Komedija	komedija
00150000-5593-fefd-ca8d-7bd3e592995e	09	Črna komedija	črna komedija
00150000-5593-fefd-b2f2-ed824d5e66c5	10	E-igra	E-igra
00150000-5593-fefd-970f-cd6c4b5dcb96	11	Kriminalka	kriminalka
00150000-5593-fefd-4b8a-e77b7b25629f	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8770586)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8771103)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8771093)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8770998)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8770770)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8770795)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8771190)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8770712)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8771150)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8770928)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8770746)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8770789)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8770726)
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
-- TOC entry 2533 (class 2606 OID 8770838)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8770865)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8770684)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8770595)
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
-- TOC entry 2448 (class 2606 OID 8770619)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8770575)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8770560)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8770871)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8770904)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8771041)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8770648)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8770672)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8770844)
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
-- TOC entry 2463 (class 2606 OID 8770662)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8770733)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8770856)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8770980)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8771026)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8771172)
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
-- TOC entry 2553 (class 2606 OID 8770888)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8770829)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8770820)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8771020)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8770956)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8770531)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8770895)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8770549)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8770569)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8770913)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8770851)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8770801)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8771214)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8771202)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8771196)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8770969)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8770628)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8770811)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8771009)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8771184)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8770697)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8770544)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8771072)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8770755)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8770879)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8770947)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8770784)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8771054)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8770940)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8770777)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8770970)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8770971)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8770650)
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
-- TOC entry 2546 (class 1259 OID 8770872)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8770858)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8770857)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8770756)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8770929)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8770931)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8770930)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8770728)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8770727)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8771043)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8771044)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8771045)
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
-- TOC entry 2608 (class 1259 OID 8771077)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8771074)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8771078)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8771076)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8771075)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8770699)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8770698)
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
-- TOC entry 2446 (class 1259 OID 8770622)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8770896)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8770790)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8770576)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8770577)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8770916)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8770915)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8770914)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8770734)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8770736)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8770735)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8771204)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8770824)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8770822)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8770821)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8770823)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8770550)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8770551)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8770880)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8770845)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8770957)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8770958)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8771154)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8771151)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8771152)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8771153)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8770664)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8770663)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8770665)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8770981)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8770982)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8771107)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8771108)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8771105)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8771106)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8770948)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8770833)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8770832)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8770830)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8770831)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8771095)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8771094)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8771173)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8770747)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8771191)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8770597)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8770596)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8770629)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8770630)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8770814)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8770813)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8770812)
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
-- TOC entry 2498 (class 1259 OID 8770779)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8770775)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8770772)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8770773)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8770771)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8770776)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8770774)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8770649)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8770713)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8770715)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8770714)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8770716)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8770839)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8771042)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8771073)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8770620)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8770621)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8770941)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8771215)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8770685)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8771203)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8770890)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8770889)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8771104)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8770673)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8771055)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8771027)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8771028)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8770570)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8770778)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8771351)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8771336)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8771341)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8771361)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8771331)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8771356)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8771346)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8771506)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8771511)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8771266)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8771446)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8771441)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8771436)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8771326)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8771476)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8771486)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8771481)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8771301)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8771296)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8771426)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8771531)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8771536)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8771541)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8771561)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8771546)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8771566)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8771556)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8771551)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8771291)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8771286)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8771251)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8771246)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8771456)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8771366)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8771226)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8771231)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8771471)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8771466)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8771461)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8771306)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8771316)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8771311)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8771631)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8771401)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8771391)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8771386)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8771396)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8771216)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8771221)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8771451)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8771431)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8771496)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8771501)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8771616)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8771601)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8771606)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8771611)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8771276)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8771271)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8771281)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8771516)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8771521)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8771591)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8771596)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8771581)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8771586)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8771491)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8771421)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8771416)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8771406)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8771411)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8771576)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8771571)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8771621)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8771321)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8771526)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8771626)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8771241)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8771236)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8771256)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8771261)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8771381)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8771376)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8771371)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-01 16:53:51 CEST

--
-- PostgreSQL database dump complete
--

