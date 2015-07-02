--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-02 08:58:28 CEST

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
-- TOC entry 183 (class 1259 OID 8772917)
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
-- TOC entry 230 (class 1259 OID 8773435)
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
-- TOC entry 229 (class 1259 OID 8773418)
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
-- TOC entry 222 (class 1259 OID 8773322)
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
-- TOC entry 197 (class 1259 OID 8773096)
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
-- TOC entry 200 (class 1259 OID 8773130)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8773524)
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
-- TOC entry 192 (class 1259 OID 8773039)
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
-- TOC entry 231 (class 1259 OID 8773448)
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
-- TOC entry 216 (class 1259 OID 8773256)
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
-- TOC entry 195 (class 1259 OID 8773076)
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
-- TOC entry 199 (class 1259 OID 8773124)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8773056)
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
-- TOC entry 205 (class 1259 OID 8773173)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8773198)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8773013)
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
-- TOC entry 184 (class 1259 OID 8772926)
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
-- TOC entry 185 (class 1259 OID 8772937)
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
-- TOC entry 180 (class 1259 OID 8772891)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8772910)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8773205)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8773236)
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
-- TOC entry 226 (class 1259 OID 8773368)
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
-- TOC entry 187 (class 1259 OID 8772970)
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
-- TOC entry 189 (class 1259 OID 8773005)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8773179)
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
-- TOC entry 188 (class 1259 OID 8772990)
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
-- TOC entry 194 (class 1259 OID 8773068)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8773191)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8773311)
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
-- TOC entry 225 (class 1259 OID 8773360)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8773494)
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
-- TOC entry 212 (class 1259 OID 8773220)
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
-- TOC entry 204 (class 1259 OID 8773164)
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
-- TOC entry 203 (class 1259 OID 8773154)
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
-- TOC entry 224 (class 1259 OID 8773349)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8773288)
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
-- TOC entry 177 (class 1259 OID 8772862)
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
-- TOC entry 176 (class 1259 OID 8772860)
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
-- TOC entry 213 (class 1259 OID 8773230)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8772900)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8772884)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8773244)
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
-- TOC entry 207 (class 1259 OID 8773185)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8773135)
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
-- TOC entry 237 (class 1259 OID 8773544)
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
-- TOC entry 236 (class 1259 OID 8773536)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8773531)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8773298)
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
-- TOC entry 186 (class 1259 OID 8772962)
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
-- TOC entry 202 (class 1259 OID 8773141)
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
-- TOC entry 223 (class 1259 OID 8773338)
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
-- TOC entry 233 (class 1259 OID 8773513)
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
-- TOC entry 191 (class 1259 OID 8773025)
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
-- TOC entry 178 (class 1259 OID 8772871)
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
-- TOC entry 228 (class 1259 OID 8773395)
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
-- TOC entry 196 (class 1259 OID 8773087)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8773212)
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
-- TOC entry 218 (class 1259 OID 8773281)
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
-- TOC entry 198 (class 1259 OID 8773119)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8773385)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8773271)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8772865)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8772917)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8773435)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5594-e113-5224-beed2d65d355	000d0000-5594-e113-1101-02d88d82fbe9	\N	00090000-5594-e113-3ea9-2f7fdc547299	000b0000-5594-e113-9e8c-8216fb810d3a	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-e113-5ae9-44a10a06fe01	000d0000-5594-e113-5778-f2ac1be89ff5	\N	00090000-5594-e113-567f-58a663672af9	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-e113-e88f-d403d0c26069	000d0000-5594-e113-7b00-7d4a407502b0	\N	00090000-5594-e113-350c-404179bc6152	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-e113-126f-976776622b01	000d0000-5594-e113-e72f-3290e8f68b81	\N	00090000-5594-e113-e661-9a0f4175f7f0	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-e113-28df-e659097b0140	000d0000-5594-e113-dafc-a65cfe359094	\N	00090000-5594-e113-e6ef-70eb5ab82cf0	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5594-e113-1e0f-6117f1cfc3c3	000d0000-5594-e113-5635-3b6f5b0e689c	\N	00090000-5594-e113-567f-58a663672af9	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8773418)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8773322)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5594-e113-ff35-4785e78c80b2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5594-e113-e9a0-2228a3eb04f5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5594-e113-408f-b221977007ff	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8773096)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5594-e113-0d70-a502c26a7eae	\N	\N	00200000-5594-e113-26b7-d73d93efbf9b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5594-e113-0a8c-48e53e199217	\N	\N	00200000-5594-e113-7ea7-851419428a7c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5594-e113-d6dc-58f33bdb56d4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5594-e113-4a3f-d7449532d829	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5594-e113-41a3-134ff27039c3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8773130)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8773524)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8773039)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5594-e111-c4ec-83c3dbc40b53	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5594-e111-22d3-9f10e3051f93	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5594-e111-819d-ef03805008e1	AL	ALB	008	Albania 	Albanija	\N
00040000-5594-e111-4461-b8a7444af80e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5594-e111-d343-85126a0707d2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5594-e111-3474-a14f8bbbadf9	AD	AND	020	Andorra 	Andora	\N
00040000-5594-e111-fe94-112c6b8c1867	AO	AGO	024	Angola 	Angola	\N
00040000-5594-e111-4cb0-08db015d8b17	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5594-e111-f726-8559d50a45db	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5594-e111-c209-65a9a0fb96e9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5594-e111-7f8c-f1112e1c9c9c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5594-e111-3a39-a82cdcdf65cc	AM	ARM	051	Armenia 	Armenija	\N
00040000-5594-e111-fed4-30b4af1ad559	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5594-e111-6aeb-2564d5d999bd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5594-e111-519b-2fbc75438ff1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5594-e111-6217-c4d5833b0611	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5594-e111-5ecd-48d209d84d35	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5594-e111-2c02-949db68e305c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5594-e111-7777-6761d1c172f4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5594-e111-3a80-53a06d99cbde	BB	BRB	052	Barbados 	Barbados	\N
00040000-5594-e111-8954-2ad20c625589	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5594-e111-72e9-cde3a48deecc	BE	BEL	056	Belgium 	Belgija	\N
00040000-5594-e111-649a-a6cc5b8f0644	BZ	BLZ	084	Belize 	Belize	\N
00040000-5594-e111-ba11-ec9e014b9000	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5594-e111-6e05-50699dfcabca	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5594-e111-8529-b5dae239c7e1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5594-e111-afac-27145a426502	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5594-e111-2036-2f058ed3640d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5594-e111-9ba1-cda006ca95a5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5594-e111-9bc1-17185a60406f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5594-e111-4b09-37e4ca7c744d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5594-e111-f0b4-2c408db86317	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5594-e111-56e8-b21c88007282	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5594-e111-7aae-723fe7d596c6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5594-e111-0bed-3d141e2675fd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5594-e111-8dea-e4347472b0a6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5594-e111-c0b0-b022e90eb79a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5594-e111-fbf5-b3c32b5a8778	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5594-e111-c278-2c4f8f943573	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5594-e111-b838-d1b113ebe144	CA	CAN	124	Canada 	Kanada	\N
00040000-5594-e111-1309-b405dcefff7b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5594-e111-89d5-f2aabc14c66a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5594-e111-0790-b92752d30950	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5594-e111-7a26-53f396d5e30c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5594-e111-7cb6-aa752fd721d9	CL	CHL	152	Chile 	Čile	\N
00040000-5594-e111-f14e-11bce8140fd2	CN	CHN	156	China 	Kitajska	\N
00040000-5594-e111-fca9-7972058de395	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5594-e111-3c6b-abda57b76bc5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5594-e111-22a4-e81e52d3169a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5594-e111-0a27-575fec0e0530	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5594-e111-8a7b-101d04be57fd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5594-e111-50a0-beaf028ecfb9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5594-e111-553e-614772e6f395	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5594-e111-0a80-a992e275af43	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5594-e111-07e9-677012b5921c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5594-e111-a840-ecda7ecf064a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5594-e111-e1bc-03e3d8051a3c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5594-e111-3682-1bcfc09ec9d2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5594-e111-7691-986095f471ed	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5594-e111-e2a1-a91a9c9458b7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5594-e111-21dc-de4b32e1627c	DK	DNK	208	Denmark 	Danska	\N
00040000-5594-e111-ff6c-cfe36a2865c6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5594-e111-3c15-f633b16d5c32	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5594-e111-73dc-13b15e923026	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5594-e111-0767-e4a08c4e17b0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5594-e111-3507-773ba9ac7788	EG	EGY	818	Egypt 	Egipt	\N
00040000-5594-e111-e5d4-29a9866bd5ea	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5594-e111-c964-98833f00f312	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5594-e111-0f7e-79a3e5f38b0c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5594-e111-85ce-1b961724f17e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5594-e111-4212-e0a29281f500	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5594-e111-029a-b7e75073b3d2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5594-e111-328a-48059840d6f2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5594-e111-c126-912e5cfeee3e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5594-e111-26f3-b2f577183967	FI	FIN	246	Finland 	Finska	\N
00040000-5594-e111-eb43-870f4eaa4633	FR	FRA	250	France 	Francija	\N
00040000-5594-e111-f277-6abb9231cfd1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5594-e111-09fe-914a9ecc29bf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5594-e111-2f50-2e4fd78e592c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5594-e111-7e57-887d364e316d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5594-e111-4ea6-d7d221383c16	GA	GAB	266	Gabon 	Gabon	\N
00040000-5594-e111-9255-c162f2a23493	GM	GMB	270	Gambia 	Gambija	\N
00040000-5594-e111-8c8e-a4d35b56e5fc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5594-e111-2049-50dbe18f749b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5594-e111-c359-53674ea1c82c	GH	GHA	288	Ghana 	Gana	\N
00040000-5594-e111-3bf7-725493557aa3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5594-e111-89db-a38a616fdf1d	GR	GRC	300	Greece 	Grčija	\N
00040000-5594-e111-18a3-88356b31bae1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5594-e111-44d3-5d434afcbcc4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5594-e111-ec39-8809f5e3f4be	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5594-e111-beae-b72549f34c5b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5594-e111-6f13-1037bece3a31	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5594-e111-c27e-993ecc6dcea8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5594-e111-d77c-9ce68471b890	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5594-e111-06c0-3599aed09d83	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5594-e111-cd98-0b71c74115d8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5594-e111-9bf9-938af9d31e7e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5594-e111-9ad5-4a8393ff481c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5594-e111-b4d7-129aa2fb03a5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5594-e111-1c4f-1c35e91234f6	HN	HND	340	Honduras 	Honduras	\N
00040000-5594-e111-f71c-7dff9fb710d0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5594-e111-83ad-1bf02d11e0ab	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5594-e111-3f4a-2c1597b4b38f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5594-e111-ad07-1e4f9ae6bb1c	IN	IND	356	India 	Indija	\N
00040000-5594-e111-2f66-423ebc11d3ab	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5594-e111-5d84-f7e1f656a342	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5594-e111-4d51-ea9cd914ba28	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5594-e111-d889-ee865bf1f750	IE	IRL	372	Ireland 	Irska	\N
00040000-5594-e111-e008-0ce368306938	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5594-e111-cb36-7555674d34f5	IL	ISR	376	Israel 	Izrael	\N
00040000-5594-e111-14bf-ac74352ae3de	IT	ITA	380	Italy 	Italija	\N
00040000-5594-e111-8d5c-785fbb88d089	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5594-e111-dcd8-5d38cc899a23	JP	JPN	392	Japan 	Japonska	\N
00040000-5594-e111-4b1c-f8fa891f12c2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5594-e111-dec9-9f4129d55a0e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5594-e111-fa68-d31b51d8c6e7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5594-e111-7cc2-a5fd5082916d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5594-e111-c345-0c2e7e73a3b8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5594-e111-68ca-b54442ba0a83	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5594-e111-e8e1-52dd55fc6936	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5594-e111-17d4-eb7b5b6f42dd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5594-e111-2a34-7c1d82a732f6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5594-e111-8384-8bf4ba2c6e16	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5594-e111-1363-79609e8c5578	LV	LVA	428	Latvia 	Latvija	\N
00040000-5594-e111-7f0d-c3ca2f9901a4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5594-e111-9c29-803fbde14bf7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5594-e111-73be-64e62e040624	LR	LBR	430	Liberia 	Liberija	\N
00040000-5594-e111-acd3-a58d83c34bdd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5594-e111-2fee-54e35a49a438	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5594-e111-b4da-14f09eff8334	LT	LTU	440	Lithuania 	Litva	\N
00040000-5594-e111-cf6c-09be3bff79ab	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5594-e111-7c1b-d554650e37fb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5594-e111-8923-f493917a6c23	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5594-e111-d821-bf4dd4ab5259	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5594-e111-1513-b7aa5f3f5ac2	MW	MWI	454	Malawi 	Malavi	\N
00040000-5594-e111-e10d-296158101acf	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5594-e111-1a5c-c2d6e678afcb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5594-e111-0581-632b242b7f2b	ML	MLI	466	Mali 	Mali	\N
00040000-5594-e111-5724-dba93c443f50	MT	MLT	470	Malta 	Malta	\N
00040000-5594-e111-8f8f-1dd55560bad3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5594-e111-69df-00d15277060d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5594-e111-8ee3-7a5db1a8360e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5594-e111-f2a5-df743e33c8b6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5594-e111-da1d-0264f91ca952	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5594-e111-bc9e-9b289851f160	MX	MEX	484	Mexico 	Mehika	\N
00040000-5594-e111-c088-efca1ab98788	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5594-e111-4be6-59d94e00a383	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5594-e111-7bed-a02a731594f4	MC	MCO	492	Monaco 	Monako	\N
00040000-5594-e111-4374-0f33714c6409	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5594-e111-de7a-109a622677a4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5594-e111-370c-673559f5d817	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5594-e111-610d-7d5856d2adab	MA	MAR	504	Morocco 	Maroko	\N
00040000-5594-e111-3bb6-e480c99118ab	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5594-e111-be07-95f267ab87b5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5594-e111-4723-7fa38e8d423f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5594-e111-a12b-db172f92d8a0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5594-e111-cc61-bfe1b082afa4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5594-e111-294c-4eeb03a32f6a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5594-e111-9554-b50eb56247d0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5594-e111-22e5-029d13df8a61	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5594-e111-59dd-797b9f07a590	NE	NER	562	Niger 	Niger 	\N
00040000-5594-e111-149e-808d6f04c586	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5594-e111-f2cd-7f621eb728f3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5594-e111-dd46-b3af7e32153e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5594-e111-96ac-9285e56027d0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5594-e111-7693-4f96bcaf3eb4	NO	NOR	578	Norway 	Norveška	\N
00040000-5594-e111-969c-8dfaf4dce2d6	OM	OMN	512	Oman 	Oman	\N
00040000-5594-e111-a8a8-c791e1068fb7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5594-e111-5d34-47aaac451542	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5594-e111-8d46-27a7ec5ea5b7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5594-e111-fda5-6fc090e0a6b8	PA	PAN	591	Panama 	Panama	\N
00040000-5594-e111-b672-dc89f39414b3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5594-e111-56f3-6e258f252d40	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5594-e111-ba44-86d793da15f1	PE	PER	604	Peru 	Peru	\N
00040000-5594-e111-d952-6ebe0f14a02c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5594-e111-3891-de9642b2a07a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5594-e111-ca0a-ef6a03506b04	PL	POL	616	Poland 	Poljska	\N
00040000-5594-e111-05e3-a1b4eec5b8dc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5594-e111-be17-d96e9bea17ff	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5594-e111-b193-4c1363d28531	QA	QAT	634	Qatar 	Katar	\N
00040000-5594-e111-0805-fe52982101c2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5594-e111-4a0d-c23ff6d82e45	RO	ROU	642	Romania 	Romunija	\N
00040000-5594-e111-6693-47ee2105b191	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5594-e111-1ba3-3c059422e683	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5594-e111-a66c-a0d4287eb301	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5594-e111-d709-ca8ebd9dc361	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5594-e111-fd13-0d0bdd2ffb0b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5594-e111-fc09-21d5481921a4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5594-e111-df7a-04aee3f1b0f1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5594-e111-b4e0-e7791e8e37e1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5594-e111-65ab-375e68049d43	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5594-e111-99a9-3cca7e141f5b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5594-e111-c14e-a604750e28cf	SM	SMR	674	San Marino 	San Marino	\N
00040000-5594-e111-b440-80652d6a7f1b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5594-e111-62f1-34cc33802765	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5594-e111-a844-e8d850440c15	SN	SEN	686	Senegal 	Senegal	\N
00040000-5594-e111-42df-2dee0c7ccadc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5594-e111-6de3-9fb5131c53be	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5594-e111-f353-0ddd91b79bea	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5594-e111-5268-53ac78c5b970	SG	SGP	702	Singapore 	Singapur	\N
00040000-5594-e111-297c-060a82437080	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5594-e111-1422-6abda25cc3e5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5594-e111-32d4-bc539eb52ddb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5594-e111-5c98-5c1c49e1ef47	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5594-e111-c909-fb0c41dd1cea	SO	SOM	706	Somalia 	Somalija	\N
00040000-5594-e111-a2d7-02b1781c1785	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5594-e111-2f04-b98a98639124	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5594-e111-4a79-d929ccf7e657	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5594-e111-6b6d-c0db4344359c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5594-e111-c1ee-6fcdd818a43f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5594-e111-0f6d-998e9e798fa9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5594-e111-cece-1b7e370093e9	SR	SUR	740	Suriname 	Surinam	\N
00040000-5594-e111-a8da-b95a97907070	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5594-e111-25d5-ba96e324964e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5594-e111-0300-036ae1cafeb8	SE	SWE	752	Sweden 	Švedska	\N
00040000-5594-e111-09a2-95e5c15840c3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5594-e111-1278-c8eafa8d9819	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5594-e111-cb0c-68a35082171b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5594-e111-18f4-d95b133f2098	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5594-e111-69ba-b900f8e98ac7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5594-e111-a062-f1433f5ccbea	TH	THA	764	Thailand 	Tajska	\N
00040000-5594-e111-9f7c-6aa76048e801	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5594-e111-9bc8-b45d65258f6a	TG	TGO	768	Togo 	Togo	\N
00040000-5594-e111-4a1a-12f6c6a18590	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5594-e111-cd7e-c02a5205260f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5594-e111-e4ab-2ad454956ab2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5594-e111-f6db-4a3445ff126d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5594-e111-3b73-880e992c4abe	TR	TUR	792	Turkey 	Turčija	\N
00040000-5594-e111-d3d1-24428e73c9bc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5594-e111-2d70-d64af1cfa36a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5594-e111-14e2-cb3210930d1f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5594-e111-c072-1fc6955edb00	UG	UGA	800	Uganda 	Uganda	\N
00040000-5594-e111-c72a-a39b59ca7cd6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5594-e111-173d-32895b448314	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5594-e111-e5d1-18ff7095da1d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5594-e111-a772-9f1fcf473b27	US	USA	840	United States 	Združene države Amerike	\N
00040000-5594-e111-eff4-8bfac1e493f8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5594-e111-bd08-fc9b52c339f8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5594-e111-3aa7-b0693c237749	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5594-e111-551b-a8fd1cf18a8b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5594-e111-7ef2-5ea63c541924	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5594-e111-9cdf-e1ea90fa5a1f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5594-e111-596e-00f12c2dd23d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5594-e111-82e8-a8cbdc206b72	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5594-e111-77da-7728bb7fddee	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5594-e111-39fd-941a5378a320	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5594-e111-fb51-6144568477cb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5594-e111-d66c-291ba17c9dca	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5594-e111-22b5-7bee079aba43	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8773448)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5594-e113-796b-8c700157947e	000e0000-5594-e113-2985-a150a9267fd4	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5594-e112-4e28-28727150a7a6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5594-e113-ca65-76709c59c5b1	000e0000-5594-e113-b37c-b17b972cb95b	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5594-e112-6f7d-e2cdeeff02d7	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8773256)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5594-e113-ff30-baacfc82e9b2	000e0000-5594-e113-b37c-b17b972cb95b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5594-e112-0f99-7d714223dd7e
000d0000-5594-e113-1101-02d88d82fbe9	000e0000-5594-e113-b37c-b17b972cb95b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5594-e112-0f99-7d714223dd7e
000d0000-5594-e113-5778-f2ac1be89ff5	000e0000-5594-e113-b37c-b17b972cb95b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5594-e112-6f13-3308eedfa914
000d0000-5594-e113-7b00-7d4a407502b0	000e0000-5594-e113-b37c-b17b972cb95b	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5594-e112-92d6-b24780ed62d0
000d0000-5594-e113-e72f-3290e8f68b81	000e0000-5594-e113-b37c-b17b972cb95b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5594-e112-92d6-b24780ed62d0
000d0000-5594-e113-dafc-a65cfe359094	000e0000-5594-e113-b37c-b17b972cb95b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5594-e112-92d6-b24780ed62d0
000d0000-5594-e113-5635-3b6f5b0e689c	000e0000-5594-e113-b37c-b17b972cb95b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5594-e112-0f99-7d714223dd7e
\.


--
-- TOC entry 2866 (class 0 OID 8773076)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8773124)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8773056)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5594-e113-2d8e-33f129f8e8f8	00080000-5594-e113-08f7-30416948a4e0	00090000-5594-e113-3ea9-2f7fdc547299	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8773173)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8773198)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8773013)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5594-e112-835b-407c7dcfda15	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5594-e112-fc8f-cd842c38a63c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5594-e112-f7d0-a83a2d573654	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5594-e112-e808-aa88d4e45a6e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5594-e112-a076-3a7e70818797	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5594-e112-362e-3f9750bf6fd5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5594-e112-96b0-181a51edac5f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5594-e112-eb62-37514535e503	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5594-e112-6b1d-1ca2048505b4	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5594-e112-4bc2-6f62b79bc2de	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5594-e112-661d-da3f3a2c19e6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5594-e112-a116-d44658ff790e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5594-e112-0188-f449c58b1d2b	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5594-e113-da84-e210d7d1a479	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5594-e113-8102-f36d4ff008a2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5594-e113-972f-02a483fb9389	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5594-e113-cf68-fc27a2c0a263	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5594-e113-2d22-ecee77cba54b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5594-e113-3d4b-a38c3b210c89	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8772926)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5594-e113-766d-cce03fac3dd4	00000000-5594-e113-8102-f36d4ff008a2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5594-e113-450d-b1248db79882	00000000-5594-e113-8102-f36d4ff008a2	00010000-5594-e111-f54c-7c579dd4eb40	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5594-e113-1d22-fcd80f0c0ed9	00000000-5594-e113-972f-02a483fb9389	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8772937)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5594-e113-09bf-5cf226db00c6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5594-e113-e661-9a0f4175f7f0	00010000-5594-e113-d627-0e5a701378eb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5594-e113-350c-404179bc6152	00010000-5594-e113-e651-bfc80ec3bb48	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5594-e113-1163-cd8a11816e20	00010000-5594-e113-5b63-4f2859a65663	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5594-e113-16e3-5aa1a05fc0f2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5594-e113-0ef5-427b24ab7c4d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5594-e113-c9d4-c38e6a689830	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5594-e113-e972-df9456d592a6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5594-e113-3ea9-2f7fdc547299	00010000-5594-e113-5807-b10746fa560b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5594-e113-567f-58a663672af9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5594-e113-6f56-bcaaea20cba1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5594-e113-e6ef-70eb5ab82cf0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5594-e113-ed0f-5c7cd3a49529	00010000-5594-e113-1378-8d5ec5639be4	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8772891)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5594-e111-9336-74d78658ba4c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5594-e111-fe75-4285f1a63923	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5594-e111-a7bd-934fc4e636b6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5594-e111-9cce-540463d5a902	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5594-e111-4d6c-d905fcce9c2c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5594-e111-6ff2-b6620f331dff	Abonma-read	Abonma - branje	f
00030000-5594-e111-c163-493ee1b6d6df	Abonma-write	Abonma - spreminjanje	f
00030000-5594-e111-fc0f-82e1756e5be7	Alternacija-read	Alternacija - branje	f
00030000-5594-e111-07d9-5d462c7f6c22	Alternacija-write	Alternacija - spreminjanje	f
00030000-5594-e111-cdc8-26caeed15335	Arhivalija-read	Arhivalija - branje	f
00030000-5594-e111-9af3-10a17cfd6728	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5594-e111-7525-9b3b0b5762fe	Besedilo-read	Besedilo - branje	f
00030000-5594-e111-5a50-bfb87f0d7571	Besedilo-write	Besedilo - spreminjanje	f
00030000-5594-e111-8c49-053fdb2401e3	DogodekIzven-read	DogodekIzven - branje	f
00030000-5594-e111-c53e-08a84e5ff8a3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5594-e111-ffa5-b03fcdfdf57b	Dogodek-read	Dogodek - branje	f
00030000-5594-e111-b059-e7a73b055996	Dogodek-write	Dogodek - spreminjanje	f
00030000-5594-e111-1bb9-7777a6267665	DrugiVir-read	DrugiVir - branje	f
00030000-5594-e111-992e-7ac7e04ccaf7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5594-e111-cdc1-59eb8a1165a8	Drzava-read	Drzava - branje	f
00030000-5594-e111-da9b-cc0eb9d727db	Drzava-write	Drzava - spreminjanje	f
00030000-5594-e111-aeaf-55d08c253823	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5594-e111-90a1-5c4b7b147273	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5594-e111-4621-9b9720bcc52c	Funkcija-read	Funkcija - branje	f
00030000-5594-e111-dba3-366a34abb409	Funkcija-write	Funkcija - spreminjanje	f
00030000-5594-e111-5dd7-a82ecdde2d05	Gostovanje-read	Gostovanje - branje	f
00030000-5594-e111-3723-34f082461091	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5594-e111-705e-f73a3529378a	Gostujoca-read	Gostujoca - branje	f
00030000-5594-e111-e3ed-912249c3fd41	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5594-e111-7c71-e2522c99289d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5594-e111-89f4-54c3ad0476ec	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5594-e111-a382-1d1d39b8962d	Kupec-read	Kupec - branje	f
00030000-5594-e111-a9f7-fb22bc679528	Kupec-write	Kupec - spreminjanje	f
00030000-5594-e111-7b0c-fdb2af63e973	NacinPlacina-read	NacinPlacina - branje	f
00030000-5594-e111-5107-6d7c462d1e52	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5594-e111-310a-81b2cbcf5031	Option-read	Option - branje	f
00030000-5594-e111-72bb-124e4e050353	Option-write	Option - spreminjanje	f
00030000-5594-e111-eb23-eebdaafb699d	OptionValue-read	OptionValue - branje	f
00030000-5594-e111-c208-729b2d9ca84b	OptionValue-write	OptionValue - spreminjanje	f
00030000-5594-e111-9940-c39539da9aba	Oseba-read	Oseba - branje	f
00030000-5594-e111-5632-7d2867d16f53	Oseba-write	Oseba - spreminjanje	f
00030000-5594-e111-7886-d594e234e03f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5594-e111-9ab0-f768107362e0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5594-e111-00c2-41797e08638e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5594-e111-e47d-1197fc0dc9a2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5594-e111-bdd2-ac6022a129e9	Pogodba-read	Pogodba - branje	f
00030000-5594-e111-eba4-baff499b013d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5594-e111-0554-bfad7f744ebd	Popa-read	Popa - branje	f
00030000-5594-e111-8fe4-0c6cc0bc748d	Popa-write	Popa - spreminjanje	f
00030000-5594-e111-f2dc-24998dd1290c	Posta-read	Posta - branje	f
00030000-5594-e111-f497-353bc499a210	Posta-write	Posta - spreminjanje	f
00030000-5594-e111-b9a5-6bc6c5375fe4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5594-e111-4038-1132b67b87b3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5594-e111-4cde-5fb73e1c1177	PostniNaslov-read	PostniNaslov - branje	f
00030000-5594-e111-202e-320483dbe277	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5594-e111-0cf8-94406c0cd840	Predstava-read	Predstava - branje	f
00030000-5594-e111-8486-a885af696544	Predstava-write	Predstava - spreminjanje	f
00030000-5594-e111-3ac6-d3b56232bf53	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5594-e111-99d4-2db900ee83c1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5594-e111-fb88-e1665ef05953	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5594-e111-7b4e-d9f6875420f3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5594-e111-8a5e-8c699f55f6f7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5594-e111-11df-42b08350a9f0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5594-e111-1033-2699f4de93c5	ProgramDela-read	ProgramDela - branje	f
00030000-5594-e111-f4a3-2480fcba21b4	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5594-e111-8cf4-47c776403419	ProgramFestival-read	ProgramFestival - branje	f
00030000-5594-e111-043c-9aaaa177a5c0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5594-e111-363f-5fb126beea88	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5594-e111-384b-d8171b54ca09	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5594-e111-c9b4-4da9337dbf06	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5594-e111-bc5a-997e41c9f23b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5594-e111-157a-a1c9844e3c58	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5594-e111-619c-4ec891c912a5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5594-e111-f372-1b2670f16508	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5594-e111-f447-cf935f396025	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5594-e111-84fa-a05c3c7cf39d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5594-e111-fbd3-9787fc1ec694	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5594-e111-3d13-68a90bd0ed51	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5594-e111-0488-938b2bd0324c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5594-e111-d140-297603cbff5d	ProgramRazno-read	ProgramRazno - branje	f
00030000-5594-e111-e04f-2de47956a283	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5594-e111-17d0-cdcbdc7085d1	Prostor-read	Prostor - branje	f
00030000-5594-e111-f67d-5be4e18f531d	Prostor-write	Prostor - spreminjanje	f
00030000-5594-e111-915c-6ba02691e1d9	Racun-read	Racun - branje	f
00030000-5594-e111-aa17-068302d2879b	Racun-write	Racun - spreminjanje	f
00030000-5594-e111-9a95-df4dda4004ee	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5594-e111-ca7c-a0baedf59a80	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5594-e111-7506-e5cb3cbea006	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5594-e111-d09a-47145f48ae2e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5594-e111-9009-b51966b7129f	Rekvizit-read	Rekvizit - branje	f
00030000-5594-e111-94bd-c1719fc9d084	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5594-e111-fa29-b2a2cbfae69a	Revizija-read	Revizija - branje	f
00030000-5594-e111-b1d2-93c0e7529841	Revizija-write	Revizija - spreminjanje	f
00030000-5594-e111-f8fe-fe00d3f7b4bd	Rezervacija-read	Rezervacija - branje	f
00030000-5594-e111-a161-3d091d1470d9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5594-e111-a59c-490591c8878f	SedezniRed-read	SedezniRed - branje	f
00030000-5594-e111-e489-7170ae563c1d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5594-e111-56bc-6d81a8e38192	Sedez-read	Sedez - branje	f
00030000-5594-e111-b8d6-f7c8129c2c64	Sedez-write	Sedez - spreminjanje	f
00030000-5594-e111-1466-4fae7e33b315	Sezona-read	Sezona - branje	f
00030000-5594-e111-d7a2-13bc2fb6dbeb	Sezona-write	Sezona - spreminjanje	f
00030000-5594-e111-6a18-5200c4ad5e1a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5594-e111-ef3a-e6f113f780dd	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5594-e111-bc6d-9754b88e0278	Stevilcenje-read	Stevilcenje - branje	f
00030000-5594-e111-3a06-8a802f7ef526	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5594-e111-af56-2f271baf0810	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5594-e111-17da-94b451653dfe	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5594-e111-6db8-7f98dba08714	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5594-e111-1fb3-1932552caaa3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5594-e111-efde-2ab388cba745	Telefonska-read	Telefonska - branje	f
00030000-5594-e111-b67f-ec8167949670	Telefonska-write	Telefonska - spreminjanje	f
00030000-5594-e111-30aa-f6c2485718b9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5594-e111-debe-8a0757f8ce09	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5594-e111-4055-d535bb46a22a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5594-e111-7da1-8f879e508988	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5594-e111-b9a3-0e19f9ca88a4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5594-e111-05f8-be9093b8b2d3	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5594-e111-4f0c-f51043cfe1ce	Trr-read	Trr - branje	f
00030000-5594-e111-395e-5a0f8aaed66c	Trr-write	Trr - spreminjanje	f
00030000-5594-e111-db30-7ddecd61591d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5594-e111-0a0f-28c39707e0a9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5594-e111-00cf-ca9d2a52dfb8	Vaja-read	Vaja - branje	f
00030000-5594-e111-80a4-de875f1b6f16	Vaja-write	Vaja - spreminjanje	f
00030000-5594-e111-a31b-6d3951154628	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5594-e111-c276-9653d352eeee	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5594-e111-5d43-f79e6ac5f1ef	Zaposlitev-read	Zaposlitev - branje	f
00030000-5594-e111-977d-976b99e8b5ef	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5594-e111-3b6f-24a4954138b0	Zasedenost-read	Zasedenost - branje	f
00030000-5594-e111-8aef-1af0a2e2e061	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5594-e111-254a-09e719ab07a3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5594-e111-98f5-109c034788dc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5594-e111-c0f1-e525513fdcc6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5594-e111-0541-0ccf74dc86e0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8772910)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5594-e111-a429-b678a501cf13	00030000-5594-e111-fe75-4285f1a63923
00020000-5594-e111-2cd4-fa9fbc3111d4	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-c163-493ee1b6d6df
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-fc0f-82e1756e5be7
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-07d9-5d462c7f6c22
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-9cce-540463d5a902
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-b059-e7a73b055996
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-da9b-cc0eb9d727db
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-4621-9b9720bcc52c
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-dba3-366a34abb409
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-3723-34f082461091
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-e3ed-912249c3fd41
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-7c71-e2522c99289d
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-89f4-54c3ad0476ec
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-9940-c39539da9aba
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-5632-7d2867d16f53
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-8fe4-0c6cc0bc748d
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-f497-353bc499a210
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-4cde-5fb73e1c1177
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-202e-320483dbe277
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-8486-a885af696544
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-8a5e-8c699f55f6f7
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-11df-42b08350a9f0
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-f67d-5be4e18f531d
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-d09a-47145f48ae2e
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-94bd-c1719fc9d084
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-d7a2-13bc2fb6dbeb
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-4055-d535bb46a22a
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-db30-7ddecd61591d
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-0a0f-28c39707e0a9
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-00cf-ca9d2a52dfb8
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-80a4-de875f1b6f16
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-3b6f-24a4954138b0
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-8aef-1af0a2e2e061
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e111-1edb-99c64a316db9	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-7c71-e2522c99289d
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-89f4-54c3ad0476ec
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-9940-c39539da9aba
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-5632-7d2867d16f53
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-4cde-5fb73e1c1177
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-202e-320483dbe277
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-efde-2ab388cba745
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-b67f-ec8167949670
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-4f0c-f51043cfe1ce
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-395e-5a0f8aaed66c
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-5d43-f79e6ac5f1ef
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-977d-976b99e8b5ef
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e111-24ab-e5a57f215a15	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-fc0f-82e1756e5be7
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-9af3-10a17cfd6728
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-7525-9b3b0b5762fe
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-8c49-053fdb2401e3
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-4621-9b9720bcc52c
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-7c71-e2522c99289d
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-9940-c39539da9aba
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-8a5e-8c699f55f6f7
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-4055-d535bb46a22a
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-00cf-ca9d2a52dfb8
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-3b6f-24a4954138b0
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e111-b302-de444dc521a5	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-c163-493ee1b6d6df
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-07d9-5d462c7f6c22
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-4055-d535bb46a22a
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e111-aefd-73d00e14fdc5	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-30aa-f6c2485718b9
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-a7bd-934fc4e636b6
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-4055-d535bb46a22a
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e111-a989-d038cadcb1c8	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9336-74d78658ba4c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-fe75-4285f1a63923
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a7bd-934fc4e636b6
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9cce-540463d5a902
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4d6c-d905fcce9c2c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-6ff2-b6620f331dff
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c163-493ee1b6d6df
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-fc0f-82e1756e5be7
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-07d9-5d462c7f6c22
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-cdc8-26caeed15335
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9af3-10a17cfd6728
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7525-9b3b0b5762fe
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-5a50-bfb87f0d7571
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8c49-053fdb2401e3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c53e-08a84e5ff8a3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-ffa5-b03fcdfdf57b
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b059-e7a73b055996
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-cdc1-59eb8a1165a8
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-da9b-cc0eb9d727db
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-aeaf-55d08c253823
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-90a1-5c4b7b147273
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4621-9b9720bcc52c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-dba3-366a34abb409
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-5dd7-a82ecdde2d05
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-3723-34f082461091
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-705e-f73a3529378a
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-e3ed-912249c3fd41
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7c71-e2522c99289d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-89f4-54c3ad0476ec
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a382-1d1d39b8962d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a9f7-fb22bc679528
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7b0c-fdb2af63e973
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-5107-6d7c462d1e52
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-310a-81b2cbcf5031
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-72bb-124e4e050353
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-eb23-eebdaafb699d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c208-729b2d9ca84b
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9940-c39539da9aba
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-5632-7d2867d16f53
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7886-d594e234e03f
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9ab0-f768107362e0
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-00c2-41797e08638e
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-e47d-1197fc0dc9a2
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-bdd2-ac6022a129e9
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-eba4-baff499b013d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-0554-bfad7f744ebd
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8fe4-0c6cc0bc748d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f2dc-24998dd1290c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f497-353bc499a210
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b9a5-6bc6c5375fe4
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4038-1132b67b87b3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4cde-5fb73e1c1177
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-202e-320483dbe277
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-0cf8-94406c0cd840
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8486-a885af696544
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-3ac6-d3b56232bf53
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-99d4-2db900ee83c1
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-fb88-e1665ef05953
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7b4e-d9f6875420f3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8a5e-8c699f55f6f7
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-11df-42b08350a9f0
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-1033-2699f4de93c5
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f4a3-2480fcba21b4
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8cf4-47c776403419
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-043c-9aaaa177a5c0
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-363f-5fb126beea88
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-384b-d8171b54ca09
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c9b4-4da9337dbf06
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-bc5a-997e41c9f23b
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-157a-a1c9844e3c58
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-619c-4ec891c912a5
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f372-1b2670f16508
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f447-cf935f396025
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-84fa-a05c3c7cf39d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-fbd3-9787fc1ec694
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-3d13-68a90bd0ed51
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-0488-938b2bd0324c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-d140-297603cbff5d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-e04f-2de47956a283
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-17d0-cdcbdc7085d1
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f67d-5be4e18f531d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-915c-6ba02691e1d9
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-aa17-068302d2879b
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9a95-df4dda4004ee
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-ca7c-a0baedf59a80
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7506-e5cb3cbea006
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-d09a-47145f48ae2e
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-9009-b51966b7129f
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-94bd-c1719fc9d084
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-fa29-b2a2cbfae69a
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b1d2-93c0e7529841
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-f8fe-fe00d3f7b4bd
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a161-3d091d1470d9
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a59c-490591c8878f
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-e489-7170ae563c1d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-56bc-6d81a8e38192
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b8d6-f7c8129c2c64
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-1466-4fae7e33b315
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-d7a2-13bc2fb6dbeb
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-6a18-5200c4ad5e1a
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-ef3a-e6f113f780dd
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-bc6d-9754b88e0278
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-3a06-8a802f7ef526
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-af56-2f271baf0810
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-17da-94b451653dfe
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-6db8-7f98dba08714
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-1fb3-1932552caaa3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-efde-2ab388cba745
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b67f-ec8167949670
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-30aa-f6c2485718b9
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-debe-8a0757f8ce09
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4055-d535bb46a22a
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-7da1-8f879e508988
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-b9a3-0e19f9ca88a4
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-05f8-be9093b8b2d3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-4f0c-f51043cfe1ce
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-395e-5a0f8aaed66c
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-db30-7ddecd61591d
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-0a0f-28c39707e0a9
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-00cf-ca9d2a52dfb8
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-80a4-de875f1b6f16
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-a31b-6d3951154628
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c276-9653d352eeee
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-5d43-f79e6ac5f1ef
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-977d-976b99e8b5ef
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-3b6f-24a4954138b0
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-8aef-1af0a2e2e061
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-254a-09e719ab07a3
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-98f5-109c034788dc
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-c0f1-e525513fdcc6
00020000-5594-e113-4a0a-a48310b65db6	00030000-5594-e111-0541-0ccf74dc86e0
\.


--
-- TOC entry 2881 (class 0 OID 8773205)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8773236)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8773368)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5594-e113-9e8c-8216fb810d3a	00090000-5594-e113-09bf-5cf226db00c6	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8772970)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5594-e113-08f7-30416948a4e0	00040000-5594-e111-32d4-bc539eb52ddb	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-efc2-e17331048dc0	00040000-5594-e111-32d4-bc539eb52ddb	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5594-e113-662d-f8a3dec5c190	00040000-5594-e111-32d4-bc539eb52ddb	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-ecac-a98e0166e464	00040000-5594-e111-32d4-bc539eb52ddb	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-e788-af97638ee08c	00040000-5594-e111-32d4-bc539eb52ddb	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-f4f0-e6e95b4bf11b	00040000-5594-e111-7f8c-f1112e1c9c9c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-d36a-37edcb8a392c	00040000-5594-e111-a840-ecda7ecf064a	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-2500-fd22dca9e0ea	00040000-5594-e111-519b-2fbc75438ff1	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5594-e113-8b24-4a9f07622528	00040000-5594-e111-32d4-bc539eb52ddb	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8773005)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5594-e112-fe20-84ae93b46c25	8341	Adlešiči
00050000-5594-e112-a58c-c1d24fd75bec	5270	Ajdovščina
00050000-5594-e112-0f77-d2f8c54de7e9	6280	Ankaran/Ancarano
00050000-5594-e112-50d5-8b48b21f6f63	9253	Apače
00050000-5594-e112-ea25-28c718b5ef10	8253	Artiče
00050000-5594-e112-1f2d-d10416558e00	4275	Begunje na Gorenjskem
00050000-5594-e112-b190-c5ade22b52c6	1382	Begunje pri Cerknici
00050000-5594-e112-7e2c-c40f46eb1c03	9231	Beltinci
00050000-5594-e112-4c05-0582c78ba8a6	2234	Benedikt
00050000-5594-e112-44c8-c55cfb3b2a28	2345	Bistrica ob Dravi
00050000-5594-e112-8b26-b10286889aa4	3256	Bistrica ob Sotli
00050000-5594-e112-52dc-1a97c2c285de	8259	Bizeljsko
00050000-5594-e112-9411-5f7fc0519c24	1223	Blagovica
00050000-5594-e112-ad17-7472a09715c9	8283	Blanca
00050000-5594-e112-38d6-a86b98d29e89	4260	Bled
00050000-5594-e112-005d-5258bfc7055b	4273	Blejska Dobrava
00050000-5594-e112-48eb-742d7be9b30b	9265	Bodonci
00050000-5594-e112-1cc3-0735736e6228	9222	Bogojina
00050000-5594-e112-2c55-74dcd17a73b3	4263	Bohinjska Bela
00050000-5594-e112-1e17-fb909e9c8b0b	4264	Bohinjska Bistrica
00050000-5594-e112-b82f-04ae47db9e81	4265	Bohinjsko jezero
00050000-5594-e112-dadc-0d4906c5d85e	1353	Borovnica
00050000-5594-e112-1a89-8006b0211f32	8294	Boštanj
00050000-5594-e112-7d25-4df20767cd35	5230	Bovec
00050000-5594-e112-adc4-2fb38fc597ff	5295	Branik
00050000-5594-e112-d97f-5e0007571a39	3314	Braslovče
00050000-5594-e112-c737-800cb8b80085	5223	Breginj
00050000-5594-e112-4f62-274b76faf0b4	8280	Brestanica
00050000-5594-e112-0afb-be362a39f775	2354	Bresternica
00050000-5594-e112-68a7-0b7a00f551b2	4243	Brezje
00050000-5594-e112-7cb3-8bd2af4de1ff	1351	Brezovica pri Ljubljani
00050000-5594-e112-73d8-13af370a189f	8250	Brežice
00050000-5594-e112-6958-a239592e3ef3	4210	Brnik - Aerodrom
00050000-5594-e112-bd75-2c924bc5123e	8321	Brusnice
00050000-5594-e112-78dc-0fd82cfb7eb4	3255	Buče
00050000-5594-e112-1fc1-0f6149a91efc	8276	Bučka 
00050000-5594-e112-dfa6-2dc2a5cde855	9261	Cankova
00050000-5594-e112-0a30-6579af2be62e	3000	Celje 
00050000-5594-e112-d60b-9a63059311e4	3001	Celje - poštni predali
00050000-5594-e112-897d-e8463722d007	4207	Cerklje na Gorenjskem
00050000-5594-e112-eaae-7ce70c999959	8263	Cerklje ob Krki
00050000-5594-e112-9123-8ad5b3c2fd55	1380	Cerknica
00050000-5594-e112-abf5-417ba911782b	5282	Cerkno
00050000-5594-e112-b233-f220b563dc55	2236	Cerkvenjak
00050000-5594-e112-212e-50d58cf19cc6	2215	Ceršak
00050000-5594-e112-fec8-0aaa628b90e4	2326	Cirkovce
00050000-5594-e112-3a75-27e5d974c80a	2282	Cirkulane
00050000-5594-e112-a44c-a0012d0b612b	5273	Col
00050000-5594-e112-367b-654783ce1bb7	8251	Čatež ob Savi
00050000-5594-e112-d8ec-47ac874cf3cd	1413	Čemšenik
00050000-5594-e112-efcc-9da10c177258	5253	Čepovan
00050000-5594-e112-4dde-2d7a19dde382	9232	Črenšovci
00050000-5594-e112-c25d-dfb34b578016	2393	Črna na Koroškem
00050000-5594-e112-af06-803f48e5005f	6275	Črni Kal
00050000-5594-e112-956e-8f77b37016b6	5274	Črni Vrh nad Idrijo
00050000-5594-e112-4519-d078ab0e5787	5262	Črniče
00050000-5594-e112-066a-20cba05994ea	8340	Črnomelj
00050000-5594-e112-6e17-411e169d7c97	6271	Dekani
00050000-5594-e112-3c6a-ea7b67ad4f32	5210	Deskle
00050000-5594-e112-3b81-7ce456ea2f4e	2253	Destrnik
00050000-5594-e112-8a9b-fe28be4e2ebb	6215	Divača
00050000-5594-e112-571f-3b8ba04c753d	1233	Dob
00050000-5594-e112-1e4c-23b9b0ad58af	3224	Dobje pri Planini
00050000-5594-e112-dab7-9a4e610ef151	8257	Dobova
00050000-5594-e112-7cd3-925fa7525b9c	1423	Dobovec
00050000-5594-e112-5e95-003ce85fb8c3	5263	Dobravlje
00050000-5594-e112-6613-fba5759a1fa1	3204	Dobrna
00050000-5594-e112-baf2-531e6b406c8f	8211	Dobrnič
00050000-5594-e112-86ed-15b64cb34abb	1356	Dobrova
00050000-5594-e112-28d7-20dbdb0ecd20	9223	Dobrovnik/Dobronak 
00050000-5594-e112-0184-1aaa0b553c03	5212	Dobrovo v Brdih
00050000-5594-e112-0590-868d5aabedbd	1431	Dol pri Hrastniku
00050000-5594-e112-85a3-9d522abf756d	1262	Dol pri Ljubljani
00050000-5594-e112-f4a7-0ca2961626b2	1273	Dole pri Litiji
00050000-5594-e112-0e6e-5efc11a11df1	1331	Dolenja vas
00050000-5594-e112-e10a-16b54d8305f2	8350	Dolenjske Toplice
00050000-5594-e112-1450-8fc2a8171a60	1230	Domžale
00050000-5594-e112-42d6-fd7708159dc3	2252	Dornava
00050000-5594-e112-31aa-eec0b31423b4	5294	Dornberk
00050000-5594-e112-f0eb-126a9d45d513	1319	Draga
00050000-5594-e112-2675-b5dfdbf20d04	8343	Dragatuš
00050000-5594-e112-3dc4-9d7a6fc772ca	3222	Dramlje
00050000-5594-e112-11bd-992aedec08cf	2370	Dravograd
00050000-5594-e112-8c72-786623e91e96	4203	Duplje
00050000-5594-e112-9524-be142fdd6e5f	6221	Dutovlje
00050000-5594-e112-8c6b-9d184ef113a2	8361	Dvor
00050000-5594-e112-8cc1-774d8a76ec4f	2343	Fala
00050000-5594-e112-2c63-54b1c5868d1d	9208	Fokovci
00050000-5594-e112-644f-ebfd09fbec13	2313	Fram
00050000-5594-e112-8fe2-9dea78624f14	3213	Frankolovo
00050000-5594-e112-077e-d7f314048728	1274	Gabrovka
00050000-5594-e112-6f2d-21f33c59217b	8254	Globoko
00050000-5594-e112-1c3f-328497d5bc4b	5275	Godovič
00050000-5594-e112-792c-fa5324405a21	4204	Golnik
00050000-5594-e112-22b7-2bc14acd1654	3303	Gomilsko
00050000-5594-e112-e71d-b8edca8a1722	4224	Gorenja vas
00050000-5594-e112-27ef-f8d64009b5ca	3263	Gorica pri Slivnici
00050000-5594-e112-b828-f15d2b457287	2272	Gorišnica
00050000-5594-e112-2f6c-e8875bab3227	9250	Gornja Radgona
00050000-5594-e112-5a22-55889935b78f	3342	Gornji Grad
00050000-5594-e112-159c-a5674df1c3e0	4282	Gozd Martuljek
00050000-5594-e112-1f6c-d285075ca765	6272	Gračišče
00050000-5594-e112-85ed-07552525f524	9264	Grad
00050000-5594-e112-5520-27fadc756ae0	8332	Gradac
00050000-5594-e112-0045-8d289c68edde	1384	Grahovo
00050000-5594-e112-c778-252da7be59df	5242	Grahovo ob Bači
00050000-5594-e112-6eef-a7792fc486d0	5251	Grgar
00050000-5594-e112-3fa8-e2a34b377f5d	3302	Griže
00050000-5594-e112-baac-0dcac1eedc2c	3231	Grobelno
00050000-5594-e112-0bb3-bc93f7beeb1a	1290	Grosuplje
00050000-5594-e112-ba88-84dbb6c6732a	2288	Hajdina
00050000-5594-e112-c565-c6b16b93b194	8362	Hinje
00050000-5594-e112-3bfc-a9cd230bd0a9	2311	Hoče
00050000-5594-e112-4d58-524c7af32584	9205	Hodoš/Hodos
00050000-5594-e112-c09c-2eb08ff85201	1354	Horjul
00050000-5594-e112-cad7-ff972a5edd0f	1372	Hotedršica
00050000-5594-e112-944c-8683aa6dd370	1430	Hrastnik
00050000-5594-e112-374c-6257fb5eef90	6225	Hruševje
00050000-5594-e112-6668-815d5d73849d	4276	Hrušica
00050000-5594-e112-cb79-ea8bb940cd1c	5280	Idrija
00050000-5594-e112-580e-6bcf4b485384	1292	Ig
00050000-5594-e112-16e0-b4154da0566f	6250	Ilirska Bistrica
00050000-5594-e112-592a-127000c3a0ae	6251	Ilirska Bistrica-Trnovo
00050000-5594-e112-f4c8-347bdcc24ddb	1295	Ivančna Gorica
00050000-5594-e112-67c3-e0a99dfff356	2259	Ivanjkovci
00050000-5594-e112-8acd-d0fae9dc79ce	1411	Izlake
00050000-5594-e112-e761-4b46216985ea	6310	Izola/Isola
00050000-5594-e112-d42c-99c5026a266b	2222	Jakobski Dol
00050000-5594-e112-8e86-3f4aaf8f46b5	2221	Jarenina
00050000-5594-e112-cb88-315936fbd788	6254	Jelšane
00050000-5594-e112-f455-231c79f4ec7e	4270	Jesenice
00050000-5594-e112-14ad-3478c499e358	8261	Jesenice na Dolenjskem
00050000-5594-e112-2e8e-f5ffa4d73dd1	3273	Jurklošter
00050000-5594-e112-18b8-1c0d63d24ae4	2223	Jurovski Dol
00050000-5594-e112-0d08-b961ee07e80f	2256	Juršinci
00050000-5594-e112-e771-cc87937f9f9b	5214	Kal nad Kanalom
00050000-5594-e112-b605-4972cf62862c	3233	Kalobje
00050000-5594-e112-8246-ab7ead8b0157	4246	Kamna Gorica
00050000-5594-e112-427c-d2e71b74e047	2351	Kamnica
00050000-5594-e112-d5f6-b18758521122	1241	Kamnik
00050000-5594-e112-5e07-da5aef5db1c9	5213	Kanal
00050000-5594-e112-7acc-0c5b1a04ea74	8258	Kapele
00050000-5594-e112-2ddc-15937abffded	2362	Kapla
00050000-5594-e112-1864-d28845fbde8c	2325	Kidričevo
00050000-5594-e112-e569-602fece40477	1412	Kisovec
00050000-5594-e112-2f5b-99b2cea29b45	6253	Knežak
00050000-5594-e112-78d1-422d6a1dc0d5	5222	Kobarid
00050000-5594-e112-a940-ffec72ce4e77	9227	Kobilje
00050000-5594-e112-4d0f-5eb740346ad2	1330	Kočevje
00050000-5594-e112-71d6-9cafb66387ed	1338	Kočevska Reka
00050000-5594-e112-01da-f7abf03385df	2276	Kog
00050000-5594-e112-2ac9-a67d9535ac3a	5211	Kojsko
00050000-5594-e112-c392-e216f9da3223	6223	Komen
00050000-5594-e112-7154-6b530c1a90aa	1218	Komenda
00050000-5594-e112-5265-4517d14c8c60	6000	Koper/Capodistria 
00050000-5594-e112-c54f-0d64ec26d275	6001	Koper/Capodistria - poštni predali
00050000-5594-e112-bb61-d5044d3b7068	8282	Koprivnica
00050000-5594-e112-7fb6-e6b3d83b70d7	5296	Kostanjevica na Krasu
00050000-5594-e112-07dc-5e1e3d29d439	8311	Kostanjevica na Krki
00050000-5594-e112-75be-d30ef6ff4f8a	1336	Kostel
00050000-5594-e112-c24e-f828d99cd74e	6256	Košana
00050000-5594-e112-d780-c2479ef7326c	2394	Kotlje
00050000-5594-e112-83b1-5a939b857bd1	6240	Kozina
00050000-5594-e112-44be-d7357519a641	3260	Kozje
00050000-5594-e112-f0b9-7e2ab9591d9c	4000	Kranj 
00050000-5594-e112-0a20-6ce35edaebb4	4001	Kranj - poštni predali
00050000-5594-e112-402a-6f138691a1e1	4280	Kranjska Gora
00050000-5594-e112-f83b-53c247c7ca18	1281	Kresnice
00050000-5594-e112-365e-9aec33373d63	4294	Križe
00050000-5594-e112-701c-58e5cfa73719	9206	Križevci
00050000-5594-e112-665b-7eada7936163	9242	Križevci pri Ljutomeru
00050000-5594-e112-7248-10a0f9e399c6	1301	Krka
00050000-5594-e112-65d2-7238692d12a0	8296	Krmelj
00050000-5594-e112-21dc-f779a4efdf69	4245	Kropa
00050000-5594-e112-3ec9-6174cac2494e	8262	Krška vas
00050000-5594-e112-0ae8-a527d1cfd9e7	8270	Krško
00050000-5594-e112-4f51-9ebdf5a6b69e	9263	Kuzma
00050000-5594-e112-3792-bc17ffd23901	2318	Laporje
00050000-5594-e112-a72a-3eb0f080b936	3270	Laško
00050000-5594-e112-659d-0b37f5b1b9da	1219	Laze v Tuhinju
00050000-5594-e112-d33e-bcbf6e8206cc	2230	Lenart v Slovenskih goricah
00050000-5594-e112-da29-143ff8450046	9220	Lendava/Lendva
00050000-5594-e112-cd4c-551ef71a39a1	4248	Lesce
00050000-5594-e112-99c4-0c7224709ad9	3261	Lesično
00050000-5594-e112-bccd-1f9e703b5307	8273	Leskovec pri Krškem
00050000-5594-e112-55a7-aa221a04d4c5	2372	Libeliče
00050000-5594-e112-e80c-4b376751db9c	2341	Limbuš
00050000-5594-e112-e126-0b4bda9d7c41	1270	Litija
00050000-5594-e112-bf85-5ca711c57182	3202	Ljubečna
00050000-5594-e112-c1d4-c57d57245be7	1000	Ljubljana 
00050000-5594-e112-6b94-bd05bbdafbfa	1001	Ljubljana - poštni predali
00050000-5594-e112-504e-f4fcf6b199f8	1231	Ljubljana - Črnuče
00050000-5594-e112-8cdc-8e18d2e66450	1261	Ljubljana - Dobrunje
00050000-5594-e112-9991-3eb987f4be89	1260	Ljubljana - Polje
00050000-5594-e112-4aa3-213a075d4bc6	1210	Ljubljana - Šentvid
00050000-5594-e112-1e5a-eccdef13ab6c	1211	Ljubljana - Šmartno
00050000-5594-e112-f32e-5e7f44665851	3333	Ljubno ob Savinji
00050000-5594-e112-2d9c-fa05cd51d543	9240	Ljutomer
00050000-5594-e112-403b-b1d71580ddfa	3215	Loče
00050000-5594-e112-8948-be760a3baae5	5231	Log pod Mangartom
00050000-5594-e112-dccd-a08294c8ea91	1358	Log pri Brezovici
00050000-5594-e112-0c59-593eb428e479	1370	Logatec
00050000-5594-e112-741e-ba181c28f6fb	1371	Logatec
00050000-5594-e112-da03-eacdf9ba6e32	1434	Loka pri Zidanem Mostu
00050000-5594-e112-8047-06bea665b569	3223	Loka pri Žusmu
00050000-5594-e112-6e38-1188490c8b6c	6219	Lokev
00050000-5594-e112-3314-ab21b619ff7b	1318	Loški Potok
00050000-5594-e112-d115-90d32b6901fe	2324	Lovrenc na Dravskem polju
00050000-5594-e112-6956-32780b9ee76f	2344	Lovrenc na Pohorju
00050000-5594-e112-6c69-db63ff7fb917	3334	Luče
00050000-5594-e112-c4dd-364d49a1689b	1225	Lukovica
00050000-5594-e112-5cfe-4be24205ca05	9202	Mačkovci
00050000-5594-e112-f3a9-39ea1c63ef23	2322	Majšperk
00050000-5594-e112-7e18-5d7f5e990730	2321	Makole
00050000-5594-e112-9542-d7c8b7ce7cbf	9243	Mala Nedelja
00050000-5594-e112-3a6d-fd0d4a10d13b	2229	Malečnik
00050000-5594-e112-218b-f7d7cd7e33de	6273	Marezige
00050000-5594-e112-370a-7d9124c1cbb0	2000	Maribor 
00050000-5594-e112-5958-426acdb1e414	2001	Maribor - poštni predali
00050000-5594-e112-eed5-498fe885333b	2206	Marjeta na Dravskem polju
00050000-5594-e112-a56d-e68e4960c4c4	2281	Markovci
00050000-5594-e112-f805-7673e876a5df	9221	Martjanci
00050000-5594-e112-3e49-5b3fa15bd283	6242	Materija
00050000-5594-e112-a869-3f3c163bd23c	4211	Mavčiče
00050000-5594-e112-3ea2-b3379b62eb4b	1215	Medvode
00050000-5594-e112-364b-3e9b985a6b3b	1234	Mengeš
00050000-5594-e112-88fd-35b42dc7d6ac	8330	Metlika
00050000-5594-e112-666c-1b96e2454e34	2392	Mežica
00050000-5594-e112-88af-03d8f2f4e265	2204	Miklavž na Dravskem polju
00050000-5594-e112-8a7f-a26910828dca	2275	Miklavž pri Ormožu
00050000-5594-e112-60c0-58fe780a409f	5291	Miren
00050000-5594-e112-30b0-a6228acc5edb	8233	Mirna
00050000-5594-e112-1c1a-48712c32ad4f	8216	Mirna Peč
00050000-5594-e112-2407-939d7134b1e9	2382	Mislinja
00050000-5594-e112-eb65-7be5d49b4c94	4281	Mojstrana
00050000-5594-e112-8932-33bd59635bef	8230	Mokronog
00050000-5594-e112-1741-16267ae2a3fd	1251	Moravče
00050000-5594-e112-587d-6420dd7c69a0	9226	Moravske Toplice
00050000-5594-e112-953d-bdd16cfc5868	5216	Most na Soči
00050000-5594-e112-f8f6-d23a14635cea	1221	Motnik
00050000-5594-e112-c6c5-4b9966abdd15	3330	Mozirje
00050000-5594-e112-b7fa-d5e2b20b81ed	9000	Murska Sobota 
00050000-5594-e112-318d-8db5331b8c4e	9001	Murska Sobota - poštni predali
00050000-5594-e112-953b-09e28e8dedd1	2366	Muta
00050000-5594-e112-0f0b-62ef3efe4255	4202	Naklo
00050000-5594-e112-ad4d-619c9df9ec71	3331	Nazarje
00050000-5594-e112-a41a-1b4135f12900	1357	Notranje Gorice
00050000-5594-e112-8ab3-0d87b229edd6	3203	Nova Cerkev
00050000-5594-e112-c31a-3ad4cc794b75	5000	Nova Gorica 
00050000-5594-e112-eda9-3b68e03254aa	5001	Nova Gorica - poštni predali
00050000-5594-e112-d692-0009c53f3036	1385	Nova vas
00050000-5594-e112-4db4-587e0da55bc5	8000	Novo mesto
00050000-5594-e112-6e68-35240ed3769f	8001	Novo mesto - poštni predali
00050000-5594-e112-d2c3-11917aae84e1	6243	Obrov
00050000-5594-e112-2d0b-9c85df83756b	9233	Odranci
00050000-5594-e112-0706-3020ffee6418	2317	Oplotnica
00050000-5594-e112-b389-32dc732b5179	2312	Orehova vas
00050000-5594-e112-fc2b-bf0d2c087626	2270	Ormož
00050000-5594-e112-3af9-011d0d8436e8	1316	Ortnek
00050000-5594-e112-9b52-3ff774957aed	1337	Osilnica
00050000-5594-e112-25a0-563762f517bb	8222	Otočec
00050000-5594-e112-b264-267db105629c	2361	Ožbalt
00050000-5594-e112-6710-9b5b4fa38a06	2231	Pernica
00050000-5594-e112-b72b-121347e52aad	2211	Pesnica pri Mariboru
00050000-5594-e112-cc61-3b10c22e03c4	9203	Petrovci
00050000-5594-e112-1fd5-03875120206c	3301	Petrovče
00050000-5594-e112-82c8-3b5080743df9	6330	Piran/Pirano
00050000-5594-e112-683f-d74c3504d175	8255	Pišece
00050000-5594-e112-4949-685586f37e43	6257	Pivka
00050000-5594-e112-7c4f-b96235677bb8	6232	Planina
00050000-5594-e112-b190-45a0a12f96ad	3225	Planina pri Sevnici
00050000-5594-e112-f54c-a36a8a8693db	6276	Pobegi
00050000-5594-e112-1e8b-a52cfa39f304	8312	Podbočje
00050000-5594-e112-8b08-f67953cf46a9	5243	Podbrdo
00050000-5594-e112-b8b9-7520ccfbe863	3254	Podčetrtek
00050000-5594-e112-0e12-a0b306fe8933	2273	Podgorci
00050000-5594-e112-3541-8bf9c5fd8dc2	6216	Podgorje
00050000-5594-e112-ee8e-58a3674de1ef	2381	Podgorje pri Slovenj Gradcu
00050000-5594-e112-5061-6d9b9bc8cc81	6244	Podgrad
00050000-5594-e112-6067-f5f57b933431	1414	Podkum
00050000-5594-e112-62e9-a6b7e4a2a3ea	2286	Podlehnik
00050000-5594-e112-7a79-31ba9b719fd0	5272	Podnanos
00050000-5594-e112-5a48-0933e6941d43	4244	Podnart
00050000-5594-e112-af90-3df4226b743d	3241	Podplat
00050000-5594-e112-c43b-bcb2c3471707	3257	Podsreda
00050000-5594-e112-bc8c-3b6f6e819e96	2363	Podvelka
00050000-5594-e112-bcc7-b0a03a06b7b7	2208	Pohorje
00050000-5594-e112-d886-a6dfb265691c	2257	Polenšak
00050000-5594-e112-7285-f1f06b3ed808	1355	Polhov Gradec
00050000-5594-e112-cece-6ba6860d391c	4223	Poljane nad Škofjo Loko
00050000-5594-e112-5bd8-bc0a64ff6208	2319	Poljčane
00050000-5594-e112-e73c-e44d0104912c	1272	Polšnik
00050000-5594-e112-c3ce-c51ff9fa4035	3313	Polzela
00050000-5594-e112-cfda-d83a1d111c14	3232	Ponikva
00050000-5594-e112-4d44-a53a720689f1	6320	Portorož/Portorose
00050000-5594-e112-eb01-5a64381f8ccf	6230	Postojna
00050000-5594-e112-367f-90a848d65fe3	2331	Pragersko
00050000-5594-e112-5aa2-cc4959aa65a1	3312	Prebold
00050000-5594-e112-651f-8218adf0e9e9	4205	Preddvor
00050000-5594-e112-db70-b97c895368d0	6255	Prem
00050000-5594-e112-1bbf-e57ff0df354c	1352	Preserje
00050000-5594-e112-f538-a725efff5bff	6258	Prestranek
00050000-5594-e112-abba-124bc787d201	2391	Prevalje
00050000-5594-e112-47b6-a19c9fa7affc	3262	Prevorje
00050000-5594-e112-6d58-d96e0c9d7f61	1276	Primskovo 
00050000-5594-e112-1bc3-b352baca2d84	3253	Pristava pri Mestinju
00050000-5594-e112-7b78-79b40476c10f	9207	Prosenjakovci/Partosfalva
00050000-5594-e112-bc48-153d333a2db1	5297	Prvačina
00050000-5594-e112-842b-c67ea1d915dd	2250	Ptuj
00050000-5594-e112-2eaa-5b2381d36d70	2323	Ptujska Gora
00050000-5594-e112-29f1-cf4f79524c38	9201	Puconci
00050000-5594-e112-d0e8-29f48ad0598b	2327	Rače
00050000-5594-e112-7bbc-03db0e147c75	1433	Radeče
00050000-5594-e112-09f4-1b6cf353f5c5	9252	Radenci
00050000-5594-e112-a08a-79622d72a402	2360	Radlje ob Dravi
00050000-5594-e112-b17d-e76c1e9861b5	1235	Radomlje
00050000-5594-e112-5944-08b9f4329aa7	4240	Radovljica
00050000-5594-e112-0b5f-5341411447fe	8274	Raka
00050000-5594-e112-380b-3764cf89be7e	1381	Rakek
00050000-5594-e112-3947-f8ad6cc2384e	4283	Rateče - Planica
00050000-5594-e112-ef8f-745405b83ea6	2390	Ravne na Koroškem
00050000-5594-e112-4fd5-6df384607649	9246	Razkrižje
00050000-5594-e112-7877-d12e09200dc5	3332	Rečica ob Savinji
00050000-5594-e112-52ca-e08f7634c7e7	5292	Renče
00050000-5594-e112-2c4f-b3465c432682	1310	Ribnica
00050000-5594-e112-3fa5-735131756dbc	2364	Ribnica na Pohorju
00050000-5594-e112-5dca-60fa52cfc4c0	3272	Rimske Toplice
00050000-5594-e112-0551-cbe72ab0c698	1314	Rob
00050000-5594-e112-77b1-73f5c2faa314	5215	Ročinj
00050000-5594-e112-4077-9d7429c51ed7	3250	Rogaška Slatina
00050000-5594-e112-e40b-8586e188541b	9262	Rogašovci
00050000-5594-e112-c745-d4c409617e71	3252	Rogatec
00050000-5594-e112-f0a3-9baaa7efa037	1373	Rovte
00050000-5594-e112-327e-e92d8286a547	2342	Ruše
00050000-5594-e112-0df7-906c4cf1eac3	1282	Sava
00050000-5594-e112-0897-8dc90fb0911c	6333	Sečovlje/Sicciole
00050000-5594-e112-99ea-54236054fabf	4227	Selca
00050000-5594-e112-f9c0-735e8fa9a9a8	2352	Selnica ob Dravi
00050000-5594-e112-3c74-2e40a3ac6277	8333	Semič
00050000-5594-e112-ba2d-4b888cba7a9c	8281	Senovo
00050000-5594-e112-4166-35f8409db52f	6224	Senožeče
00050000-5594-e112-6d91-beb2fadc70f7	8290	Sevnica
00050000-5594-e112-7522-817c5f423bb6	6210	Sežana
00050000-5594-e112-0ba1-a0308a03b215	2214	Sladki Vrh
00050000-5594-e112-c86d-88f23448d17a	5283	Slap ob Idrijci
00050000-5594-e112-c490-a4a0584914e1	2380	Slovenj Gradec
00050000-5594-e112-8b69-1561aff2e592	2310	Slovenska Bistrica
00050000-5594-e112-3411-7ed286d6dc5b	3210	Slovenske Konjice
00050000-5594-e112-0d99-2bca8efe97a4	1216	Smlednik
00050000-5594-e112-edff-c9da9c313b79	5232	Soča
00050000-5594-e112-ef62-a19deb9b0750	1317	Sodražica
00050000-5594-e112-04d1-faa97a9e0c2a	3335	Solčava
00050000-5594-e112-4b3f-2e0b1910259e	5250	Solkan
00050000-5594-e112-688b-030f4d680646	4229	Sorica
00050000-5594-e112-86b8-313dd2e1f116	4225	Sovodenj
00050000-5594-e112-973c-7dd1a4ba3edf	5281	Spodnja Idrija
00050000-5594-e112-c2f4-d0fcd7a64b62	2241	Spodnji Duplek
00050000-5594-e112-3d16-f28a71a28496	9245	Spodnji Ivanjci
00050000-5594-e112-dcb5-38a3f1c1783c	2277	Središče ob Dravi
00050000-5594-e112-c519-fc441623fcfa	4267	Srednja vas v Bohinju
00050000-5594-e112-e4b8-8de97e9ccc2c	8256	Sromlje 
00050000-5594-e112-27ef-7d80a36ccdfd	5224	Srpenica
00050000-5594-e112-bbdc-31fc5190428d	1242	Stahovica
00050000-5594-e112-a94a-7d4850fc4121	1332	Stara Cerkev
00050000-5594-e112-ce0a-ed027115de99	8342	Stari trg ob Kolpi
00050000-5594-e112-d571-d3fef2fe3169	1386	Stari trg pri Ložu
00050000-5594-e112-2571-69e84bb86e69	2205	Starše
00050000-5594-e112-2c74-a0c84395ee7c	2289	Stoperce
00050000-5594-e112-5933-10ce3c0b3c7c	8322	Stopiče
00050000-5594-e112-eced-fbdfcea4bdb1	3206	Stranice
00050000-5594-e112-0317-88c56c9f666c	8351	Straža
00050000-5594-e112-8116-b6b8c28c5241	1313	Struge
00050000-5594-e112-bd9c-a17abdb10a2a	8293	Studenec
00050000-5594-e112-6e72-1dd05524febf	8331	Suhor
00050000-5594-e112-eab4-4feba12db8c9	2233	Sv. Ana v Slovenskih goricah
00050000-5594-e112-3a68-e14aefdd62ce	2235	Sv. Trojica v Slovenskih goricah
00050000-5594-e112-372d-f53ae5e71a4a	2353	Sveti Duh na Ostrem Vrhu
00050000-5594-e112-f2f3-50841a1515ff	9244	Sveti Jurij ob Ščavnici
00050000-5594-e112-3da8-254577bad666	3264	Sveti Štefan
00050000-5594-e112-7c23-68ee1db60c9b	2258	Sveti Tomaž
00050000-5594-e112-6fed-0cd4c1f39337	9204	Šalovci
00050000-5594-e112-8ff5-42f73ee43365	5261	Šempas
00050000-5594-e112-a679-b4ef0acd5924	5290	Šempeter pri Gorici
00050000-5594-e112-8723-e05b7de60526	3311	Šempeter v Savinjski dolini
00050000-5594-e112-48c1-76d9592dc9b1	4208	Šenčur
00050000-5594-e112-601f-706fe13dd36a	2212	Šentilj v Slovenskih goricah
00050000-5594-e112-089b-8cb3efd61271	8297	Šentjanž
00050000-5594-e112-ce13-a1c90b734121	2373	Šentjanž pri Dravogradu
00050000-5594-e112-0f49-d119072f5956	8310	Šentjernej
00050000-5594-e112-a634-06679ce7a0f9	3230	Šentjur
00050000-5594-e112-966d-21019006d199	3271	Šentrupert
00050000-5594-e112-01ed-9546b96b7a49	8232	Šentrupert
00050000-5594-e112-9474-13596fed339d	1296	Šentvid pri Stični
00050000-5594-e112-e6f8-a32c395225fe	8275	Škocjan
00050000-5594-e112-c37d-d6cda464472f	6281	Škofije
00050000-5594-e112-cc0f-1c5dbc81bdeb	4220	Škofja Loka
00050000-5594-e112-80ab-1df1d917f604	3211	Škofja vas
00050000-5594-e112-13ac-8ded4fa979a2	1291	Škofljica
00050000-5594-e112-8f9d-d2b12b178fc8	6274	Šmarje
00050000-5594-e112-b334-0e385b9a01d8	1293	Šmarje - Sap
00050000-5594-e112-57f6-6f77eb49be0e	3240	Šmarje pri Jelšah
00050000-5594-e112-7aa7-1e15c5220571	8220	Šmarješke Toplice
00050000-5594-e112-e5eb-a777399b58d8	2315	Šmartno na Pohorju
00050000-5594-e112-f9c6-18a74dd8b109	3341	Šmartno ob Dreti
00050000-5594-e112-cee1-aa605e102cab	3327	Šmartno ob Paki
00050000-5594-e112-57b5-252aa193d3a7	1275	Šmartno pri Litiji
00050000-5594-e112-0d96-161868e72010	2383	Šmartno pri Slovenj Gradcu
00050000-5594-e112-b64a-9581c2c83064	3201	Šmartno v Rožni dolini
00050000-5594-e112-f857-1e603e52a428	3325	Šoštanj
00050000-5594-e112-e73b-6d182f575b82	6222	Štanjel
00050000-5594-e112-f4a0-4957582b36f6	3220	Štore
00050000-5594-e112-a7f4-1253d7dd68bd	3304	Tabor
00050000-5594-e112-63e1-2636ae39f50c	3221	Teharje
00050000-5594-e112-446c-7f6ae20229e0	9251	Tišina
00050000-5594-e112-d2c6-475c83534bec	5220	Tolmin
00050000-5594-e112-f504-086c262bd348	3326	Topolšica
00050000-5594-e112-e067-c79ab452c7c5	2371	Trbonje
00050000-5594-e112-ff5b-d50f9ce0bdb0	1420	Trbovlje
00050000-5594-e112-18aa-fd8ba303c7e2	8231	Trebelno 
00050000-5594-e112-88a8-ac73c8e7374b	8210	Trebnje
00050000-5594-e112-dbe5-cbb36caa31c6	5252	Trnovo pri Gorici
00050000-5594-e112-33a2-e922b8c9faae	2254	Trnovska vas
00050000-5594-e112-1fb8-20c97cc7a096	1222	Trojane
00050000-5594-e112-64e5-4a4d165e80cd	1236	Trzin
00050000-5594-e112-0696-2202c2001382	4290	Tržič
00050000-5594-e112-ae05-89f2b4204d9a	8295	Tržišče
00050000-5594-e112-02a1-699e6c923b3c	1311	Turjak
00050000-5594-e112-75cd-cd7229b85bcd	9224	Turnišče
00050000-5594-e112-27f8-58da5e73621a	8323	Uršna sela
00050000-5594-e112-e69e-bc97878031c2	1252	Vače
00050000-5594-e112-71b0-ee6d98f12c6d	3320	Velenje 
00050000-5594-e112-2f7c-fda1f88f6b27	3322	Velenje - poštni predali
00050000-5594-e112-0152-a106071acd14	8212	Velika Loka
00050000-5594-e112-dd4e-363548e786f7	2274	Velika Nedelja
00050000-5594-e112-6079-c269d57b5de0	9225	Velika Polana
00050000-5594-e112-dafe-8c190393e355	1315	Velike Lašče
00050000-5594-e112-22d4-008c05421810	8213	Veliki Gaber
00050000-5594-e112-61cd-5c07d5658f55	9241	Veržej
00050000-5594-e112-af70-f123e6976299	1312	Videm - Dobrepolje
00050000-5594-e112-b0b5-747fa2be2df0	2284	Videm pri Ptuju
00050000-5594-e112-93d4-e3a2fc00f935	8344	Vinica
00050000-5594-e112-08e6-a55880e6cfbd	5271	Vipava
00050000-5594-e112-ce17-66811d2a3f6e	4212	Visoko
00050000-5594-e112-d6b4-b79f4ba9fe2d	1294	Višnja Gora
00050000-5594-e112-51b7-70a0f2e90f35	3205	Vitanje
00050000-5594-e112-bc3d-7ad41eb1e60c	2255	Vitomarci
00050000-5594-e112-6de4-bcb898f95e47	1217	Vodice
00050000-5594-e112-fad9-bf1f87df68f4	3212	Vojnik\t
00050000-5594-e112-8409-1baa89149f9b	5293	Volčja Draga
00050000-5594-e112-75dd-62572a8f49be	2232	Voličina
00050000-5594-e112-21b0-d92321182701	3305	Vransko
00050000-5594-e112-43b3-12978d95709f	6217	Vremski Britof
00050000-5594-e112-9337-9cb50eb68fea	1360	Vrhnika
00050000-5594-e112-2087-8def6dcb4944	2365	Vuhred
00050000-5594-e112-7d5d-0e280281fef4	2367	Vuzenica
00050000-5594-e112-c568-7da6479ee527	8292	Zabukovje 
00050000-5594-e112-3062-97038a3c039d	1410	Zagorje ob Savi
00050000-5594-e112-c3d2-4ec61a7922e6	1303	Zagradec
00050000-5594-e112-c7d8-327414a82f23	2283	Zavrč
00050000-5594-e112-381d-528786ddab39	8272	Zdole 
00050000-5594-e112-a22a-e360c83e732b	4201	Zgornja Besnica
00050000-5594-e112-4100-17ee8d3ed522	2242	Zgornja Korena
00050000-5594-e112-1de7-10e3a5b7739d	2201	Zgornja Kungota
00050000-5594-e112-7149-807a0ec8806a	2316	Zgornja Ložnica
00050000-5594-e112-1806-0cd5f1c95ffa	2314	Zgornja Polskava
00050000-5594-e112-c896-1ca4e74837f2	2213	Zgornja Velka
00050000-5594-e112-dc95-a86754b08383	4247	Zgornje Gorje
00050000-5594-e112-893e-8835d30c15dc	4206	Zgornje Jezersko
00050000-5594-e112-abdf-4d1c0bf570d3	2285	Zgornji Leskovec
00050000-5594-e112-045f-cc44431deb0f	1432	Zidani Most
00050000-5594-e112-41d8-08e7a11813c3	3214	Zreče
00050000-5594-e112-9138-5472a06239fb	4209	Žabnica
00050000-5594-e112-eb3b-b307aba7c25e	3310	Žalec
00050000-5594-e112-6681-52b33ac85ac8	4228	Železniki
00050000-5594-e112-f482-69b12e7a27f0	2287	Žetale
00050000-5594-e112-8a83-c7726bac0a72	4226	Žiri
00050000-5594-e112-8007-970daea8d30a	4274	Žirovnica
00050000-5594-e112-4b8f-f0ff9c008e74	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8773179)
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
-- TOC entry 2859 (class 0 OID 8772990)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8773068)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8773191)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8773311)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8773360)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5594-e113-4654-6fe0b0350cb6	00080000-5594-e113-8b24-4a9f07622528	0900	AK
00190000-5594-e113-1900-bb0c9f8b5f3f	00080000-5594-e113-662d-f8a3dec5c190	0987	A
00190000-5594-e113-f4b4-e91ef0330d73	00080000-5594-e113-efc2-e17331048dc0	0989	A
00190000-5594-e113-4ef6-4bc946697561	00080000-5594-e113-ecac-a98e0166e464	0986	A
00190000-5594-e113-4252-e2d0dfcd6f93	00080000-5594-e113-f4f0-e6e95b4bf11b	0984	A
00190000-5594-e113-9fd6-698a580b3221	00080000-5594-e113-d36a-37edcb8a392c	0983	A
00190000-5594-e113-3456-d0424cfcdd01	00080000-5594-e113-2500-fd22dca9e0ea	0982	A
\.


--
-- TOC entry 2903 (class 0 OID 8773494)
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
-- TOC entry 2883 (class 0 OID 8773220)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5594-e113-4fa8-f783dde50947	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5594-e113-2ecd-6b727c756bb3	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5594-e113-48da-ed650a4bb8ad	0003	Kazinska	t	84	Kazinska dvorana
00220000-5594-e113-6789-7e8b4911a46d	0004	Mali oder	t	24	Mali oder 
00220000-5594-e113-c1b9-cdc05425fdef	0005	Komorni oder	t	15	Komorni oder
00220000-5594-e113-a6f2-9da617503466	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5594-e113-5106-2c70c2102d40	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8773164)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8773154)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8773349)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8773288)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8772862)
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
-- TOC entry 2884 (class 0 OID 8773230)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8772900)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5594-e111-a429-b678a501cf13	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5594-e111-2cd4-fa9fbc3111d4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5594-e111-5da4-89a5518e9cc4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5594-e111-54c9-db90a6b9b4d4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5594-e111-1edb-99c64a316db9	planer	Planer dogodkov v koledarju	t
00020000-5594-e111-24ab-e5a57f215a15	kadrovska	Kadrovska služba	t
00020000-5594-e111-b302-de444dc521a5	arhivar	Ažuriranje arhivalij	t
00020000-5594-e111-aefd-73d00e14fdc5	igralec	Igralec	t
00020000-5594-e111-a989-d038cadcb1c8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5594-e113-4a0a-a48310b65db6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8772884)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5594-e111-f54c-7c579dd4eb40	00020000-5594-e111-5da4-89a5518e9cc4
00010000-5594-e111-063e-96d39486fbc7	00020000-5594-e111-5da4-89a5518e9cc4
00010000-5594-e113-cae5-1bad60dc5655	00020000-5594-e113-4a0a-a48310b65db6
\.


--
-- TOC entry 2886 (class 0 OID 8773244)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8773185)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8773135)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8773544)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5594-e112-5d09-db613324c514	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5594-e112-5770-9d96fbdd16b6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5594-e112-4157-d406df266a7e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5594-e112-da45-7f829dee7c43	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5594-e112-6c13-a94d4d7d7521	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8773536)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5594-e112-ea70-a6a9b9f72f35	00230000-5594-e112-da45-7f829dee7c43	popa
00240000-5594-e112-4baf-bc1f5703e087	00230000-5594-e112-da45-7f829dee7c43	oseba
00240000-5594-e112-677c-2ed34acb891e	00230000-5594-e112-5770-9d96fbdd16b6	prostor
00240000-5594-e112-597c-eb26376d4f47	00230000-5594-e112-da45-7f829dee7c43	besedilo
00240000-5594-e112-f703-64e6bb12bbec	00230000-5594-e112-da45-7f829dee7c43	uprizoritev
00240000-5594-e112-fb65-2fd8ea9d5f8a	00230000-5594-e112-da45-7f829dee7c43	funkcija
00240000-5594-e112-9438-8130cd2fd70f	00230000-5594-e112-da45-7f829dee7c43	tipfunkcije
00240000-5594-e112-4393-e5a4e8375958	00230000-5594-e112-da45-7f829dee7c43	alternacija
00240000-5594-e112-f538-5ed72433a23d	00230000-5594-e112-5d09-db613324c514	pogodba
00240000-5594-e112-5281-8f11bc29c905	00230000-5594-e112-da45-7f829dee7c43	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8773531)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8773298)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5594-e113-3639-690c8398f8af	000e0000-5594-e113-b37c-b17b972cb95b	00080000-5594-e113-08f7-30416948a4e0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5594-e113-4a76-0488d7befae2	000e0000-5594-e113-b37c-b17b972cb95b	00080000-5594-e113-08f7-30416948a4e0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5594-e113-96cf-809634451da5	000e0000-5594-e113-b37c-b17b972cb95b	00080000-5594-e113-e788-af97638ee08c	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8772962)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8773141)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5594-e113-8e6f-8e6df824a8db	00180000-5594-e113-0d70-a502c26a7eae	000c0000-5594-e113-5224-beed2d65d355	00090000-5594-e113-3ea9-2f7fdc547299	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-e113-f927-2f65650962e7	00180000-5594-e113-0d70-a502c26a7eae	000c0000-5594-e113-5ae9-44a10a06fe01	00090000-5594-e113-567f-58a663672af9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-e113-f041-2498682cd4ba	00180000-5594-e113-0d70-a502c26a7eae	000c0000-5594-e113-e88f-d403d0c26069	00090000-5594-e113-350c-404179bc6152	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-e113-423e-2638525409f0	00180000-5594-e113-0d70-a502c26a7eae	000c0000-5594-e113-126f-976776622b01	00090000-5594-e113-e661-9a0f4175f7f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-e113-bdb7-d850f9bcaed3	00180000-5594-e113-0d70-a502c26a7eae	000c0000-5594-e113-28df-e659097b0140	00090000-5594-e113-e6ef-70eb5ab82cf0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5594-e113-b90a-2121065fdefc	00180000-5594-e113-d6dc-58f33bdb56d4	\N	00090000-5594-e113-e6ef-70eb5ab82cf0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8773338)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5594-e112-0f99-7d714223dd7e	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5594-e112-fd8e-2b4b0336e1a8	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5594-e112-9264-cd37fbb3f5a0	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5594-e112-6f13-3308eedfa914	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5594-e112-8fc9-031bffaf98a5	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5594-e112-6a9a-003105affa35	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5594-e112-69b5-a83ef52003f7	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5594-e112-38ae-8142feadacb6	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5594-e112-863d-9a2993f077f5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5594-e112-95dc-7d5ad26bf811	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5594-e112-92c6-ce7702250c2f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5594-e112-e510-cc6a302c8171	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5594-e112-dd99-8c7e3a3ad97a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5594-e112-52dd-7bf69248a62a	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5594-e112-7e71-6ed21cc4dd9b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5594-e112-92d6-b24780ed62d0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8773513)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5594-e112-4e28-28727150a7a6	01	Velika predstava	f	1.00	1.00
002b0000-5594-e112-6f7d-e2cdeeff02d7	02	Mala predstava	f	0.50	0.50
002b0000-5594-e112-7857-38373f71983d	03	Mala koprodukcija	t	0.40	1.00
002b0000-5594-e112-018e-55545ff02a12	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5594-e112-521f-56efd72937d6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8773025)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8772871)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5594-e111-063e-96d39486fbc7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfDHrzVuJWCwAW8g1ZyeaM/Pt2MzMqQW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5594-e113-e651-bfc80ec3bb48	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5594-e113-d627-0e5a701378eb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5594-e113-5807-b10746fa560b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5594-e113-1378-8d5ec5639be4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5594-e113-5b63-4f2859a65663	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5594-e113-2e92-1b7fe8d7ee4a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5594-e113-dedd-29719e4eec13	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5594-e113-146c-354bb18e6427	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5594-e113-a7b3-84878885688b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5594-e113-cae5-1bad60dc5655	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5594-e111-f54c-7c579dd4eb40	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8773395)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5594-e113-2985-a150a9267fd4	00160000-5594-e113-ff35-4785e78c80b2	00150000-5594-e112-55f2-a6f00627faf9	00140000-5594-e111-1452-1eac186ffc8b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5594-e113-c1b9-cdc05425fdef
000e0000-5594-e113-b37c-b17b972cb95b	00160000-5594-e113-408f-b221977007ff	00150000-5594-e112-6c0d-838205ce7336	00140000-5594-e111-5c66-413ac83fabcb	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5594-e113-a6f2-9da617503466
000e0000-5594-e113-6655-c86246337520	\N	00150000-5594-e112-6c0d-838205ce7336	00140000-5594-e111-5c66-413ac83fabcb	00190000-5594-e113-1900-bb0c9f8b5f3f	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5594-e113-c1b9-cdc05425fdef
000e0000-5594-e113-eaa0-156cd8436209	\N	00150000-5594-e112-6c0d-838205ce7336	00140000-5594-e111-5c66-413ac83fabcb	00190000-5594-e113-1900-bb0c9f8b5f3f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5594-e113-c1b9-cdc05425fdef
000e0000-5594-e113-9e56-f20a08e0fc46	\N	00150000-5594-e112-6c0d-838205ce7336	00140000-5594-e111-5c66-413ac83fabcb	00190000-5594-e113-1900-bb0c9f8b5f3f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5594-e113-4fa8-f783dde50947
\.


--
-- TOC entry 2867 (class 0 OID 8773087)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5594-e113-26b7-d73d93efbf9b	000e0000-5594-e113-b37c-b17b972cb95b	1	
00200000-5594-e113-7ea7-851419428a7c	000e0000-5594-e113-b37c-b17b972cb95b	2	
\.


--
-- TOC entry 2882 (class 0 OID 8773212)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8773281)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8773119)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8773385)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5594-e111-1452-1eac186ffc8b	01	Drama	drama (SURS 01)
00140000-5594-e111-37e6-43b665920ed6	02	Opera	opera (SURS 02)
00140000-5594-e111-2260-d14729565164	03	Balet	balet (SURS 03)
00140000-5594-e111-f8c4-d768a3a0593e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5594-e111-f2f5-d4237e6ecca7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5594-e111-5c66-413ac83fabcb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5594-e111-e752-6fbc12b756ee	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8773271)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5594-e112-88c8-3186473ee7b4	01	Opera	opera
00150000-5594-e112-669b-74c7bc7168c0	02	Opereta	opereta
00150000-5594-e112-c92e-68228c54a732	03	Balet	balet
00150000-5594-e112-334c-5d9effbc7991	04	Plesne prireditve	plesne prireditve
00150000-5594-e112-a7b3-5743a8001eba	05	Lutkovno gledališče	lutkovno gledališče
00150000-5594-e112-1fde-d893ff8cb2c5	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5594-e112-6980-efdd9e4ce810	07	Biografska drama	biografska drama
00150000-5594-e112-55f2-a6f00627faf9	08	Komedija	komedija
00150000-5594-e112-d8df-d136d3b6ddb5	09	Črna komedija	črna komedija
00150000-5594-e112-e1c5-22da7e648fce	10	E-igra	E-igra
00150000-5594-e112-6c0d-838205ce7336	11	Kriminalka	kriminalka
00150000-5594-e112-411d-438cabd3d2b0	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8772925)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8773442)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8773432)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8773337)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8773109)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8773134)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8773529)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8773051)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8773489)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8773267)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8773085)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8773128)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8773065)
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
-- TOC entry 2533 (class 2606 OID 8773177)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8773204)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8773023)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8772934)
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
-- TOC entry 2448 (class 2606 OID 8772958)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8772914)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8772899)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8773210)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8773243)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8773380)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8772987)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8773011)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8773183)
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
-- TOC entry 2463 (class 2606 OID 8773001)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8773072)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8773195)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8773319)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8773365)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8773511)
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
-- TOC entry 2553 (class 2606 OID 8773227)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8773168)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8773159)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8773359)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8773295)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8772870)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8773234)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8772888)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8772908)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8773252)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8773190)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8773140)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8773553)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8773541)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8773535)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8773308)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8772967)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8773150)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8773348)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8773523)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8773036)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8772883)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8773411)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8773094)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8773218)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8773286)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8773123)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8773393)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8773279)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8773116)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8773309)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8773310)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8772989)
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
-- TOC entry 2546 (class 1259 OID 8773211)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8773197)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8773196)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8773095)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8773268)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8773270)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8773269)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8773067)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8773066)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8773382)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8773383)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8773384)
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
-- TOC entry 2608 (class 1259 OID 8773416)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8773413)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8773417)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8773415)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8773414)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8773038)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8773037)
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
-- TOC entry 2446 (class 1259 OID 8772961)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8773235)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8773129)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8772915)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8772916)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8773255)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8773254)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8773253)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8773073)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8773075)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8773074)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8773543)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8773163)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8773161)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8773160)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8773162)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8772889)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8772890)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8773219)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8773184)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8773296)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8773297)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8773493)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8773490)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8773491)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8773492)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8773003)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8773002)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8773004)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8773320)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8773321)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8773446)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8773447)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8773444)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8773445)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8773287)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8773172)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8773171)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8773169)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8773170)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8773434)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8773433)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8773512)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8773086)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8773530)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8772936)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8772935)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8772968)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8772969)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8773153)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8773152)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8773151)
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
-- TOC entry 2498 (class 1259 OID 8773118)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8773114)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8773111)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8773112)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8773110)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8773115)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8773113)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8772988)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8773052)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8773054)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8773053)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8773055)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8773178)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8773381)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8773412)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8772959)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8772960)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8773280)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8773554)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8773024)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8773542)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8773229)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8773228)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8773443)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8773012)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8773394)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8773366)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8773367)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8772909)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8773117)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8773690)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8773675)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8773680)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8773700)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8773670)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8773695)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8773685)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8773845)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8773850)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8773605)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8773785)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8773780)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8773775)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8773665)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8773815)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8773825)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8773820)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8773640)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8773635)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8773765)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8773870)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8773875)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8773880)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8773900)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8773885)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8773905)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8773895)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8773890)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8773630)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8773625)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8773590)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8773585)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8773795)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8773705)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8773565)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8773570)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8773810)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8773805)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8773800)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8773645)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8773655)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8773650)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8773970)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8773740)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8773730)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8773725)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8773735)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8773555)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8773560)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8773790)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8773770)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8773835)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8773840)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8773955)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8773940)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8773945)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8773950)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8773615)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8773610)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8773620)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8773855)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8773860)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8773930)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8773935)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8773920)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8773925)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8773830)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8773760)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8773755)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8773745)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8773750)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8773915)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8773910)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8773960)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8773660)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8773865)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8773965)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8773580)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8773575)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8773595)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8773600)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8773720)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8773715)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8773710)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-02 08:58:28 CEST

--
-- PostgreSQL database dump complete
--

