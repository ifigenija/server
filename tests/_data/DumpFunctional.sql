--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-26 16:34:04 CEST

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
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 8316401)
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
-- TOC entry 230 (class 1259 OID 8316919)
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
-- TOC entry 229 (class 1259 OID 8316902)
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
-- TOC entry 222 (class 1259 OID 8316806)
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
-- TOC entry 197 (class 1259 OID 8316580)
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
-- TOC entry 200 (class 1259 OID 8316614)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8317002)
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
-- TOC entry 192 (class 1259 OID 8316523)
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
-- TOC entry 231 (class 1259 OID 8316932)
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
-- TOC entry 216 (class 1259 OID 8316740)
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
-- TOC entry 195 (class 1259 OID 8316560)
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
-- TOC entry 199 (class 1259 OID 8316608)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8316540)
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
-- TOC entry 205 (class 1259 OID 8316657)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8316682)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8316497)
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
-- TOC entry 184 (class 1259 OID 8316410)
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
-- TOC entry 185 (class 1259 OID 8316421)
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
-- TOC entry 180 (class 1259 OID 8316375)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8316394)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8316689)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8316720)
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
-- TOC entry 226 (class 1259 OID 8316852)
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
-- TOC entry 187 (class 1259 OID 8316454)
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
-- TOC entry 189 (class 1259 OID 8316489)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8316663)
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
-- TOC entry 188 (class 1259 OID 8316474)
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
-- TOC entry 194 (class 1259 OID 8316552)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8316675)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8316795)
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
-- TOC entry 225 (class 1259 OID 8316844)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8316978)
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
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric
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
-- TOC entry 212 (class 1259 OID 8316704)
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
-- TOC entry 204 (class 1259 OID 8316648)
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
-- TOC entry 203 (class 1259 OID 8316638)
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
-- TOC entry 224 (class 1259 OID 8316833)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8316772)
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
-- TOC entry 177 (class 1259 OID 8316346)
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
-- TOC entry 176 (class 1259 OID 8316344)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 8316714)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8316384)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8316368)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8316728)
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
-- TOC entry 207 (class 1259 OID 8316669)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8316619)
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
-- TOC entry 237 (class 1259 OID 8317022)
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
-- TOC entry 236 (class 1259 OID 8317014)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8317009)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8316782)
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
-- TOC entry 186 (class 1259 OID 8316446)
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
-- TOC entry 202 (class 1259 OID 8316625)
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
-- TOC entry 223 (class 1259 OID 8316822)
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
-- TOC entry 233 (class 1259 OID 8316991)
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
-- TOC entry 191 (class 1259 OID 8316509)
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
-- TOC entry 178 (class 1259 OID 8316355)
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
-- TOC entry 228 (class 1259 OID 8316879)
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
-- TOC entry 196 (class 1259 OID 8316571)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8316696)
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
-- TOC entry 218 (class 1259 OID 8316765)
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
-- TOC entry 198 (class 1259 OID 8316603)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8316869)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8316755)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8316349)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8316401)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8316919)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558d-62db-ff9a-ee1e2b11eae8	000d0000-558d-62db-9b56-d9a5a2b8aecb	\N	00090000-558d-62db-68ae-01ce34126b7e	000b0000-558d-62db-7571-4f40d9383040	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-62db-4db6-de66aedbbbe7	000d0000-558d-62db-1924-9e0605d78717	\N	00090000-558d-62db-9180-6ab63898aae9	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-62db-5bf9-e60dbaf7ff6b	000d0000-558d-62db-35d2-b4d1d1fe4903	\N	00090000-558d-62db-bcfb-68c9dee8007e	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-62db-340f-53f7eed2597a	000d0000-558d-62db-d92d-5f1061e4abee	\N	00090000-558d-62db-617d-0f8b884a6479	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-62db-a51b-e83a372d6706	000d0000-558d-62db-dbd4-1523cce7b5ba	\N	00090000-558d-62db-8a6a-2872c22910e2	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-62db-0085-edaec0173144	000d0000-558d-62db-50e9-275b319906dd	\N	00090000-558d-62db-9180-6ab63898aae9	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8316902)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8316806)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558d-62da-6177-81f586b1519c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558d-62da-d290-03341cd11d5d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558d-62da-008f-c2c3450d7d19	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8316580)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558d-62db-32b4-d4ab9f960de0	\N	\N	00200000-558d-62db-263a-940c56b55d4f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558d-62db-35c8-f8409d662dc8	\N	\N	00200000-558d-62db-d1d5-9d121946d10f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558d-62db-5969-0d837b636273	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558d-62db-eadd-78c9a296ea44	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558d-62db-cf94-76de4f4a4dc7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8316614)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8317002)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8316523)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558d-62d8-9577-f77e8f493c31	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558d-62d8-0e90-c64666ab9f43	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558d-62d8-ee71-652d7b9a12ff	AL	ALB	008	Albania 	Albanija	\N
00040000-558d-62d8-4209-061e63c37bef	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558d-62d8-17c8-89479e4ea9e1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558d-62d8-df3b-59476411ffd6	AD	AND	020	Andorra 	Andora	\N
00040000-558d-62d8-5995-86c1ea426da6	AO	AGO	024	Angola 	Angola	\N
00040000-558d-62d8-0a9e-609012fe4168	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558d-62d8-4461-da2685d0320f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558d-62d8-ad9f-988932794b55	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-62d8-aeb5-e7b38dd23acb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558d-62d8-ef4f-275db0508543	AM	ARM	051	Armenia 	Armenija	\N
00040000-558d-62d8-6039-93870f708914	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558d-62d8-db80-708e3a16704d	AU	AUS	036	Australia 	Avstralija	\N
00040000-558d-62d8-3416-f35922934185	AT	AUT	040	Austria 	Avstrija	\N
00040000-558d-62d8-5891-7d4d10588894	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558d-62d8-ce62-ac76ec6cc947	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558d-62d8-49c7-ca8b709e252c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558d-62d8-2b6d-b9e1a56d7dfd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558d-62d8-437c-0f98904de8f2	BB	BRB	052	Barbados 	Barbados	\N
00040000-558d-62d8-1dec-fc8fa20389de	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558d-62d8-4454-5aaf209f3be4	BE	BEL	056	Belgium 	Belgija	\N
00040000-558d-62d8-f715-5b1ed5e44466	BZ	BLZ	084	Belize 	Belize	\N
00040000-558d-62d8-b96e-5a762540eed8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558d-62d8-32c0-189cfff58adf	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558d-62d8-0ce1-d60806caa0ad	BT	BTN	064	Bhutan 	Butan	\N
00040000-558d-62d8-19c5-1c80a77d2b3b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558d-62d8-20c8-2d3a66398ece	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558d-62d8-0666-de20c1b08d9b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558d-62d8-66a3-a02da033ce88	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558d-62d8-64b2-d447da64a62f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558d-62d8-7a9b-57b50cf9013e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558d-62d8-6054-2cfbcdd6dbaf	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558d-62d8-32a9-e1f7ec77506d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558d-62d8-f3fc-df9c0c589793	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558d-62d8-63b1-70508f127759	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558d-62d8-9578-4729e4bb1ed1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558d-62d8-8248-64471ecf002a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558d-62d8-87df-534f4e1bd188	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558d-62d8-31df-8b02d6eb6df5	CA	CAN	124	Canada 	Kanada	\N
00040000-558d-62d8-fd06-04217c4d0e15	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558d-62d8-c44e-7443e08c6551	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558d-62d8-9310-d4bf6eeb50a2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558d-62d8-6920-e583aa08d227	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558d-62d8-6251-045e64523b10	CL	CHL	152	Chile 	Čile	\N
00040000-558d-62d8-6574-d77986bba862	CN	CHN	156	China 	Kitajska	\N
00040000-558d-62d8-debc-c89d6ccd1493	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558d-62d8-2c26-b26cd6f6aa70	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558d-62d8-03e6-751578c8b9af	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558d-62d8-bb0b-a1e4a95f4031	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558d-62d8-ebfb-9bc0945a5f87	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558d-62d8-49ba-c4490fe1d40b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558d-62d8-a1f5-c999b4a3b3d4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558d-62d8-bae6-ec44d67f6ca6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558d-62d8-a2ac-4018d2184559	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558d-62d8-cf09-9d537f21333c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558d-62d8-d58d-50fa21c0cf9e	CU	CUB	192	Cuba 	Kuba	\N
00040000-558d-62d8-66ea-8c40690704c8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558d-62d8-d711-03edd500190f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558d-62d8-0fbc-56aaea8887f0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558d-62d8-257f-ac59f71ced3a	DK	DNK	208	Denmark 	Danska	\N
00040000-558d-62d8-0ab3-6ffcf47b717e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558d-62d8-736a-a494e89dcc81	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-62d8-c0bc-8d6dd3912158	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558d-62d8-d4ef-9e437c3309f8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558d-62d8-a6bf-ea1cd367b2d6	EG	EGY	818	Egypt 	Egipt	\N
00040000-558d-62d8-5b6a-14ab74cc1149	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558d-62d8-7ede-13c1f8b6205f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558d-62d8-30b0-4110bc04514c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558d-62d8-afca-97381c3aa455	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558d-62d8-c4eb-0d5f2a3d9f74	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558d-62d8-962f-ebd97c8501ab	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558d-62d8-9480-67d4c86b94b4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558d-62d8-c861-9a4e66bfccac	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558d-62d8-a990-778806ee4039	FI	FIN	246	Finland 	Finska	\N
00040000-558d-62d8-dbdc-7f78a05b2471	FR	FRA	250	France 	Francija	\N
00040000-558d-62d8-7dab-bbd361f07246	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558d-62d8-ff57-cef3f69f0c31	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558d-62d8-79ca-6ee265edda2c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558d-62d8-cc58-52cadb8db238	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558d-62d8-3e26-f41c7308d03d	GA	GAB	266	Gabon 	Gabon	\N
00040000-558d-62d8-b8d1-5696242e1a70	GM	GMB	270	Gambia 	Gambija	\N
00040000-558d-62d8-af78-9235eea8cbf5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558d-62d8-5f5a-11c53a6efab4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558d-62d8-3218-ff51d02636c2	GH	GHA	288	Ghana 	Gana	\N
00040000-558d-62d8-c555-ab71f6632ffc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558d-62d8-aad9-0e8039b0ba64	GR	GRC	300	Greece 	Grčija	\N
00040000-558d-62d8-1ab9-de507236ab5b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558d-62d8-9bde-049b6ccba798	GD	GRD	308	Grenada 	Grenada	\N
00040000-558d-62d8-600c-e38d255e3ddd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558d-62d8-e7d2-dc2d249f10e3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558d-62d8-cde5-d17bccda957c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558d-62d8-8163-1ab1d939a74c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558d-62d8-d5c9-cb44453a4313	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558d-62d8-af38-dd90ae92dcdc	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558d-62d8-92bf-26baa17fb878	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558d-62d8-da32-ff433eddc42d	HT	HTI	332	Haiti 	Haiti	\N
00040000-558d-62d8-4d65-f1b80e72a5b2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558d-62d8-4608-c596ad45779d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558d-62d8-65e6-f9095e80d20f	HN	HND	340	Honduras 	Honduras	\N
00040000-558d-62d8-293b-6eb86c74639e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558d-62d8-452b-42be39e01608	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558d-62d8-cd56-5701ffb73fad	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558d-62d8-8a22-312e8fbb7f01	IN	IND	356	India 	Indija	\N
00040000-558d-62d8-d8ae-4d528311cae8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558d-62d8-b125-b2474ff0cba0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558d-62d8-f840-e69df95f386f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558d-62d8-f867-09f49bc3b571	IE	IRL	372	Ireland 	Irska	\N
00040000-558d-62d8-5106-f543713572a3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558d-62d8-06e4-ccc2c626243b	IL	ISR	376	Israel 	Izrael	\N
00040000-558d-62d8-9d2e-0ee39dc4b5ea	IT	ITA	380	Italy 	Italija	\N
00040000-558d-62d8-b862-710a2307d404	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558d-62d8-b52e-300412c3e2f1	JP	JPN	392	Japan 	Japonska	\N
00040000-558d-62d8-c946-4ab4ef25a4ed	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558d-62d8-415f-b169ca5a6030	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558d-62d8-8c03-66b23baa5860	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558d-62d8-3f46-2cf892d852ac	KE	KEN	404	Kenya 	Kenija	\N
00040000-558d-62d8-69e3-07d8bb49a3a5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558d-62d8-281b-050c2657bc04	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558d-62d8-a1e4-1d67b4d71491	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558d-62d8-b262-e4fb7ecc638c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558d-62d8-d4e5-613df8c96d1e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558d-62d8-224a-98650051517b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558d-62d8-12ca-2d8fda0e479b	LV	LVA	428	Latvia 	Latvija	\N
00040000-558d-62d8-5d93-dac0e80ba927	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558d-62d8-ea10-3c2102173a95	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558d-62d8-cd10-688fc0fe3e37	LR	LBR	430	Liberia 	Liberija	\N
00040000-558d-62d8-5828-d510519924e8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558d-62d8-baa4-acd7449a2eea	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558d-62d8-e0d1-086b06c1ddd5	LT	LTU	440	Lithuania 	Litva	\N
00040000-558d-62d8-3e11-f607ea02ac53	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558d-62d8-5de2-0243087133a5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558d-62d8-f977-db06e3f96705	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558d-62d8-e04f-6f2a8491d7df	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558d-62d8-e11e-736dc4fa671a	MW	MWI	454	Malawi 	Malavi	\N
00040000-558d-62d8-8f7c-f5fd9027ff65	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558d-62d8-029c-234dcf239832	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558d-62d8-318e-587b17c06425	ML	MLI	466	Mali 	Mali	\N
00040000-558d-62d8-bb20-c7d6c8472425	MT	MLT	470	Malta 	Malta	\N
00040000-558d-62d8-fbd3-8d53f7aea40b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558d-62d8-c763-bbab969577ff	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558d-62d8-8106-69f77bfba175	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558d-62d8-84d8-e4f66e6f756d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558d-62d8-859a-32d58b390f3e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558d-62d8-02be-a42b13d9a542	MX	MEX	484	Mexico 	Mehika	\N
00040000-558d-62d8-1ad4-7480dc08950d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558d-62d8-a605-c166690b27f8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558d-62d8-d450-b4e51d10148c	MC	MCO	492	Monaco 	Monako	\N
00040000-558d-62d8-b07d-087707570b78	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558d-62d8-d7be-8c4970d4a45a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558d-62d8-122e-8ecd27850436	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558d-62d8-fa18-757b86166cfd	MA	MAR	504	Morocco 	Maroko	\N
00040000-558d-62d8-4721-707f834d585d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558d-62d8-12e0-c0ed6c363d7e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558d-62d8-f88a-bfdac7142090	NA	NAM	516	Namibia 	Namibija	\N
00040000-558d-62d8-4744-5b64253fa749	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558d-62d8-fe61-6a2883d0508a	NP	NPL	524	Nepal 	Nepal	\N
00040000-558d-62d8-ae02-95019f8a6120	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558d-62d8-dfc9-ee39b458d788	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558d-62d8-c403-6538d7806e38	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558d-62d8-7baa-5a580630965d	NE	NER	562	Niger 	Niger 	\N
00040000-558d-62d8-401c-65001719b663	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558d-62d8-a001-16e6a6985956	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558d-62d8-bede-f390233b2308	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558d-62d8-8919-de58e24b993e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558d-62d8-a2db-3346faa5e45d	NO	NOR	578	Norway 	Norveška	\N
00040000-558d-62d8-b3d0-fe9a2c3cc83f	OM	OMN	512	Oman 	Oman	\N
00040000-558d-62d8-b62e-f4a19dd9524c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558d-62d8-c575-d6e077ad18d0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558d-62d8-4c3c-83cc4a715ffe	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558d-62d8-b819-8da601addc92	PA	PAN	591	Panama 	Panama	\N
00040000-558d-62d8-c494-c90806cc5860	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558d-62d8-1397-f394cd5219a7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558d-62d8-8537-12786ad07f83	PE	PER	604	Peru 	Peru	\N
00040000-558d-62d8-a5a0-b1cc61e63eb4	PH	PHL	608	Philippines 	Filipini	\N
00040000-558d-62d8-f37b-cd0a467d2f69	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558d-62d8-bad8-90e66902a739	PL	POL	616	Poland 	Poljska	\N
00040000-558d-62d8-2e3d-11e6333b9f4f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558d-62d8-9814-2fa1a0dfb5fe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558d-62d8-c631-e26745f2da0a	QA	QAT	634	Qatar 	Katar	\N
00040000-558d-62d8-ef77-12cfa5efe94e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558d-62d8-ae93-4510f1485409	RO	ROU	642	Romania 	Romunija	\N
00040000-558d-62d8-491e-9eb27826ff21	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558d-62d8-afa1-cbecdb3b40bf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558d-62d8-9b1b-bdd7197d3910	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558d-62d8-308e-d5fcf3d975f3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558d-62d8-88d5-8adc51d2d5e6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558d-62d8-44b9-4c4eb3160a7d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558d-62d8-2177-8a72867697d7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558d-62d8-870b-e1a01d200b3e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558d-62d8-da10-d25c7f984d24	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558d-62d8-b499-cee27f198493	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558d-62d8-c765-b867c0ccf593	SM	SMR	674	San Marino 	San Marino	\N
00040000-558d-62d8-f101-acd3ca37784c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558d-62d8-8460-b8ada05291fb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558d-62d8-facc-8f124cc7e4c0	SN	SEN	686	Senegal 	Senegal	\N
00040000-558d-62d8-c25c-a10c02612979	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558d-62d8-fe59-5c6eebc04b13	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558d-62d8-10b4-709f06c811f1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558d-62d8-9377-6c012e0ba311	SG	SGP	702	Singapore 	Singapur	\N
00040000-558d-62d8-61c1-69b9bc6267c1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558d-62d8-ae86-708b8aa75826	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558d-62d8-d83f-2c1921903934	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558d-62d8-8cf5-fcbb9e6c76ad	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558d-62d8-27f6-a0ef780e3fac	SO	SOM	706	Somalia 	Somalija	\N
00040000-558d-62d8-3c96-6b7cfefe17fa	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558d-62d8-8562-dd66253002b4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558d-62d8-7bae-514805c5905f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558d-62d8-17d3-93cc0e0ecaff	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558d-62d8-64df-6bb7ec4ce0d9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558d-62d8-5271-b78098f191d2	SD	SDN	729	Sudan 	Sudan	\N
00040000-558d-62d8-5722-565aa8311fdc	SR	SUR	740	Suriname 	Surinam	\N
00040000-558d-62d8-79c0-e1fcf7a1acfa	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558d-62d8-885f-5d02596a9d0c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558d-62d8-9dfc-bfec67e91b54	SE	SWE	752	Sweden 	Švedska	\N
00040000-558d-62d8-c518-bf48a7e630f3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558d-62d8-870e-aaa24a97c24c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558d-62d8-f515-b1f9c460046f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558d-62d8-f04b-4d622a579322	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558d-62d8-45a3-b1ea1620fb2f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558d-62d8-750c-09bae18f055d	TH	THA	764	Thailand 	Tajska	\N
00040000-558d-62d8-d52d-fc2ec33063f9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558d-62d8-1956-909da393e347	TG	TGO	768	Togo 	Togo	\N
00040000-558d-62d8-ec47-815852fb7d19	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558d-62d8-f692-a702466a8a49	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558d-62d8-088c-b7a74137954c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558d-62d8-08ac-515b380ad862	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558d-62d8-321e-9d134176f4b5	TR	TUR	792	Turkey 	Turčija	\N
00040000-558d-62d8-ffb2-baaa55823740	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558d-62d8-c66a-0fc898220ab7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-62d8-b1d2-13d43c09efaf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558d-62d8-6bd0-950759f654db	UG	UGA	800	Uganda 	Uganda	\N
00040000-558d-62d8-03c0-995561cfa822	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558d-62d8-983d-64cf9b0b0637	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558d-62d8-8c2b-1a25d0466b15	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558d-62d8-a0d6-d459bd8df827	US	USA	840	United States 	Združene države Amerike	\N
00040000-558d-62d8-8349-5f8f2d26e007	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558d-62d8-7769-829d0eb5c379	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558d-62d8-3671-942c1e3863ee	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558d-62d8-5961-fd660886af2d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558d-62d8-e536-34b7b1d3d855	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558d-62d8-36f1-57be5edb9458	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558d-62d8-7e76-2afe56b13742	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-62d8-5fcd-94cf934c2ac5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558d-62d8-b09a-abf0216b8748	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558d-62d8-2887-05c505a08617	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558d-62d8-4cc9-d81710aa9ada	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558d-62d8-9d73-c3abf47a17ae	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558d-62d8-9672-f8a7feda8b72	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8316932)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-558d-62db-e5a2-c6de2e64678f	000e0000-558d-62db-8c21-be5cab3e1e2f	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-558d-62d9-4d9e-7262b8d25c81	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-558d-62db-d041-6c4ddbbe1d87	000e0000-558d-62db-24da-f6b6218907d5	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-558d-62d9-911b-1b5b4645912f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8316740)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558d-62db-3176-6bbe5888da0b	000e0000-558d-62db-24da-f6b6218907d5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558d-62d9-2af8-14e7a13a063b
000d0000-558d-62db-9b56-d9a5a2b8aecb	000e0000-558d-62db-24da-f6b6218907d5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-62d9-2af8-14e7a13a063b
000d0000-558d-62db-1924-9e0605d78717	000e0000-558d-62db-24da-f6b6218907d5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558d-62d9-99d0-243eb9da4912
000d0000-558d-62db-35d2-b4d1d1fe4903	000e0000-558d-62db-24da-f6b6218907d5	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558d-62d9-097f-e235a1e7ce27
000d0000-558d-62db-d92d-5f1061e4abee	000e0000-558d-62db-24da-f6b6218907d5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558d-62d9-097f-e235a1e7ce27
000d0000-558d-62db-dbd4-1523cce7b5ba	000e0000-558d-62db-24da-f6b6218907d5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558d-62d9-097f-e235a1e7ce27
000d0000-558d-62db-50e9-275b319906dd	000e0000-558d-62db-24da-f6b6218907d5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-62d9-2af8-14e7a13a063b
\.


--
-- TOC entry 2860 (class 0 OID 8316560)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8316608)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8316540)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558d-62db-a482-396eb617b76f	00080000-558d-62da-e87b-4fde36e2a040	00090000-558d-62db-68ae-01ce34126b7e	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8316657)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8316682)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8316497)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558d-62d9-d11d-bd460bb918f3	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558d-62d9-fcc6-2d2345af5ecb	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558d-62d9-a1a0-0e9c63a3e5cd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558d-62d9-1166-227e740c9d96	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558d-62d9-f945-2e1dcc6960dc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558d-62d9-05d5-066944f71b9d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558d-62d9-2cfb-78fd1a16200b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558d-62d9-a922-d8ea72232b32	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-62d9-374c-5629bfbaafbd	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-62d9-e4aa-d7f83dbef9dd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558d-62d9-0237-c88b19cb9c5d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558d-62d9-e17e-9615742c5da3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558d-62d9-47f3-d6745a005c0a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558d-62da-ded2-7034aaa8591a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558d-62da-9eb7-c0541a079410	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558d-62da-8218-62f9c0d88a27	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558d-62da-3640-07234bb287a0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558d-62da-5131-70e357c0c8e1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558d-62da-3cf4-6c9d81b0feab	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8316410)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558d-62da-bfc2-a3ad4fe95862	00000000-558d-62da-9eb7-c0541a079410	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558d-62da-68b3-4dd61cee174f	00000000-558d-62da-9eb7-c0541a079410	00010000-558d-62d9-a12f-ac043040c68b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558d-62da-d325-780dd8ad4491	00000000-558d-62da-8218-62f9c0d88a27	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8316421)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558d-62db-9e5b-072e28532304	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558d-62db-617d-0f8b884a6479	00010000-558d-62db-a9ea-8c1a685fcfd7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558d-62db-bcfb-68c9dee8007e	00010000-558d-62db-69e2-928dec3ea309	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558d-62db-dda5-db4a6962b6e0	00010000-558d-62db-0f29-79a85a607c44	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558d-62db-168b-090516c100bf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558d-62db-c32e-a5a733851fc7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558d-62db-9323-1a3c07126e9d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558d-62db-28bc-1c6b3991feb0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558d-62db-68ae-01ce34126b7e	00010000-558d-62db-10bf-114b02954ecc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558d-62db-9180-6ab63898aae9	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558d-62db-5831-b4973ecb63c1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558d-62db-8a6a-2872c22910e2	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558d-62db-1cc8-b7b8741d436b	00010000-558d-62db-b9cd-2d560f6d6d7f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8316375)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558d-62d8-5182-0e0faab733fb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558d-62d8-9fdf-44f6dc017c0b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558d-62d8-c8e1-191769ed24a8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558d-62d8-37c8-02c0355e54d3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558d-62d8-7e5d-f0ba0acdbd3c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558d-62d8-ff01-a2c15fb64a15	Abonma-read	Abonma - branje	f
00030000-558d-62d8-d7f2-1f6d5d5347eb	Abonma-write	Abonma - spreminjanje	f
00030000-558d-62d8-0190-88724c0f3909	Alternacija-read	Alternacija - branje	f
00030000-558d-62d8-11ea-cdab3cad503c	Alternacija-write	Alternacija - spreminjanje	f
00030000-558d-62d8-ee55-155a82a5f02c	Arhivalija-read	Arhivalija - branje	f
00030000-558d-62d8-f7a5-4fc90b4f10f6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558d-62d8-1dbf-d61b293a5f62	Besedilo-read	Besedilo - branje	f
00030000-558d-62d8-cf98-4b99dd0cc094	Besedilo-write	Besedilo - spreminjanje	f
00030000-558d-62d8-07c7-957dc74c8ab3	DogodekIzven-read	DogodekIzven - branje	f
00030000-558d-62d8-aa0a-690500f01c49	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558d-62d8-f529-dc3b97cc7db1	Dogodek-read	Dogodek - branje	f
00030000-558d-62d8-585f-b3ad05b01655	Dogodek-write	Dogodek - spreminjanje	f
00030000-558d-62d8-30dc-adf868eb680b	DrugiVir-read	DrugiVir - branje	f
00030000-558d-62d8-5f64-622f4cba501a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558d-62d8-89e5-5a96fe89ea62	Drzava-read	Drzava - branje	f
00030000-558d-62d8-b656-70d1829c10c0	Drzava-write	Drzava - spreminjanje	f
00030000-558d-62d8-5204-613472c907c1	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-558d-62d8-d0f7-1f26fc8a14a8	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-558d-62d8-bfee-d20609ce01ef	Funkcija-read	Funkcija - branje	f
00030000-558d-62d8-7db4-c24a23c7273c	Funkcija-write	Funkcija - spreminjanje	f
00030000-558d-62d8-53bc-5c55abb5a5af	Gostovanje-read	Gostovanje - branje	f
00030000-558d-62d8-3608-2e18c55ffb43	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558d-62d8-46a5-c769da1328d8	Gostujoca-read	Gostujoca - branje	f
00030000-558d-62d8-c01c-a65a7b6da15b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558d-62d8-bde6-ba3b6d5579c1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558d-62d8-b654-c1152f3d93df	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558d-62d8-3bfe-8449c4e067e3	Kupec-read	Kupec - branje	f
00030000-558d-62d8-e29d-9140ad18b6d0	Kupec-write	Kupec - spreminjanje	f
00030000-558d-62d8-61e5-bf81f7597526	NacinPlacina-read	NacinPlacina - branje	f
00030000-558d-62d8-1016-dd315b7cdc66	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558d-62d8-5a4e-db428eb4ff27	Option-read	Option - branje	f
00030000-558d-62d8-5277-c7c07986c883	Option-write	Option - spreminjanje	f
00030000-558d-62d8-2a00-eacd9af15b15	OptionValue-read	OptionValue - branje	f
00030000-558d-62d8-549a-86c8a111bbf6	OptionValue-write	OptionValue - spreminjanje	f
00030000-558d-62d8-bfdf-4e9f4f7bcaaa	Oseba-read	Oseba - branje	f
00030000-558d-62d8-53c4-9e1c779ea5e4	Oseba-write	Oseba - spreminjanje	f
00030000-558d-62d8-bcc3-3cb7b881803a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558d-62d8-15b6-490c6485b576	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558d-62d8-e19b-db97d0e55c44	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558d-62d8-33d8-7bce73459e43	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558d-62d8-d6b3-4a45069a6fd5	Pogodba-read	Pogodba - branje	f
00030000-558d-62d8-82cc-31f7d7122f54	Pogodba-write	Pogodba - spreminjanje	f
00030000-558d-62d8-efe4-1f38a2785d8b	Popa-read	Popa - branje	f
00030000-558d-62d8-5868-5247a21a4f46	Popa-write	Popa - spreminjanje	f
00030000-558d-62d8-a613-a627e1a6ee1d	Posta-read	Posta - branje	f
00030000-558d-62d8-321d-e0cc2d10696a	Posta-write	Posta - spreminjanje	f
00030000-558d-62d8-cbb3-932ec4f2f6a2	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558d-62d8-c18a-812a7d62e9e9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558d-62d8-8e99-8302bda9ecd2	PostniNaslov-read	PostniNaslov - branje	f
00030000-558d-62d8-8d7f-65264ea09fc6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558d-62d8-c1d8-5282543f9c22	Predstava-read	Predstava - branje	f
00030000-558d-62d8-b217-e77f6aebab3e	Predstava-write	Predstava - spreminjanje	f
00030000-558d-62d8-7741-c988abdfdc18	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558d-62d8-7680-88ded3f45f53	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558d-62d8-2322-51ca413e7bb5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558d-62d8-88ce-9b602de0a644	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558d-62d8-ab61-6b8482da6359	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558d-62d8-03a1-408385bd43ac	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558d-62d8-9145-c00afcc20e85	ProgramDela-read	ProgramDela - branje	f
00030000-558d-62d8-6a50-28666fe5bb60	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558d-62d8-ceb0-591371101df7	ProgramFestival-read	ProgramFestival - branje	f
00030000-558d-62d8-d4aa-25a121e21a5a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558d-62d8-c9c8-4774728ad08e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558d-62d8-0149-8d24935958f3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558d-62d8-0c57-9bb6dfdc4bc0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558d-62d8-4fb1-da09b3419d6d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558d-62d8-5d2b-250a2d7990a1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558d-62d8-8e49-2988b02e8a45	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558d-62d8-c8c8-b6783ff886d5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558d-62d8-59d5-ec67ffd14324	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558d-62d8-c16b-ba8d387acb5c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558d-62d8-dc44-2bef468c6a39	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558d-62d8-982b-8bfc12ad587c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558d-62d8-6842-682777edc50b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558d-62d8-dee9-4281be4079ab	ProgramRazno-read	ProgramRazno - branje	f
00030000-558d-62d8-7016-0565b67bd74d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558d-62d8-baaa-d633807d0632	Prostor-read	Prostor - branje	f
00030000-558d-62d8-f8b8-afea8a71a918	Prostor-write	Prostor - spreminjanje	f
00030000-558d-62d8-0c4e-4bd9272f524d	Racun-read	Racun - branje	f
00030000-558d-62d8-845c-d8197ba79c97	Racun-write	Racun - spreminjanje	f
00030000-558d-62d8-5066-7f4547d227b3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558d-62d8-9a17-0d33c9a1d652	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558d-62d8-d3c2-72421cc999e8	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558d-62d8-ad01-0f480a8d2cd8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558d-62d8-bd0a-1b7a23c8d79a	Rekvizit-read	Rekvizit - branje	f
00030000-558d-62d8-a4e1-0d9f4940ed49	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558d-62d8-2faa-694e0ffcbfcd	Revizija-read	Revizija - branje	f
00030000-558d-62d8-0c17-b39c92382f0e	Revizija-write	Revizija - spreminjanje	f
00030000-558d-62d8-8899-33966e4a6c29	Rezervacija-read	Rezervacija - branje	f
00030000-558d-62d8-65f8-d52aefddbd3e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558d-62d8-8927-9e28b0fc1313	SedezniRed-read	SedezniRed - branje	f
00030000-558d-62d8-1c08-129b68a2e66d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558d-62d8-e2c1-157f08c8f9e5	Sedez-read	Sedez - branje	f
00030000-558d-62d8-8988-d16987be8cc4	Sedez-write	Sedez - spreminjanje	f
00030000-558d-62d8-6d41-a38bc21c8ffc	Sezona-read	Sezona - branje	f
00030000-558d-62d8-b3f0-c717d891e7dc	Sezona-write	Sezona - spreminjanje	f
00030000-558d-62d8-0b0e-0892529065be	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558d-62d8-2525-d727aff6246e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558d-62d8-2cc4-a7e5ae2d67e8	Stevilcenje-read	Stevilcenje - branje	f
00030000-558d-62d8-d460-a931a334be2c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558d-62d8-47e2-35aefc5c06e4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558d-62d8-f7f6-d9a5bb8c8666	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558d-62d8-d5a0-8118d14b5b1b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558d-62d8-35af-88debee46605	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558d-62d8-3b48-304d28b6d8e0	Telefonska-read	Telefonska - branje	f
00030000-558d-62d8-b449-689eb4bf7faa	Telefonska-write	Telefonska - spreminjanje	f
00030000-558d-62d8-bf0c-1e2a3aa6f0b0	TerminStoritve-read	TerminStoritve - branje	f
00030000-558d-62d8-070f-8e3a1810a51e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558d-62d8-242a-312051ef61d5	TipFunkcije-read	TipFunkcije - branje	f
00030000-558d-62d8-ae71-7f419a0acaaa	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558d-62d8-a54f-c83ec705b41e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558d-62d8-71b2-792512393703	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558d-62d8-d352-007b8580c848	Trr-read	Trr - branje	f
00030000-558d-62d8-92e3-6aefea8e054e	Trr-write	Trr - spreminjanje	f
00030000-558d-62d8-9472-a4aa062a217c	Uprizoritev-read	Uprizoritev - branje	f
00030000-558d-62d8-8c6e-eb94bbe54ef0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558d-62d8-64dc-74b124cd8d42	Vaja-read	Vaja - branje	f
00030000-558d-62d8-5b33-f6f288029a51	Vaja-write	Vaja - spreminjanje	f
00030000-558d-62d8-3ce2-b3388681d0e7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558d-62d8-91ae-b04f02912d78	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558d-62d8-7ccc-27d3fa7042a2	Zaposlitev-read	Zaposlitev - branje	f
00030000-558d-62d8-9377-cc595db3e9cf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558d-62d8-c0b7-da19a5009368	Zasedenost-read	Zasedenost - branje	f
00030000-558d-62d8-49eb-b7ef82492a95	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558d-62d8-9173-f9d65f0fbc3d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558d-62d8-728b-7c7f9d30cb5f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558d-62d8-df16-10f2908c9bf4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558d-62d8-1839-9cf33bc4f4ec	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8316394)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558d-62d8-0124-8c0d001bef9c	00030000-558d-62d8-9fdf-44f6dc017c0b
00020000-558d-62d8-feb8-22877b5e42c5	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-d7f2-1f6d5d5347eb
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-0190-88724c0f3909
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-11ea-cdab3cad503c
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-37c8-02c0355e54d3
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-585f-b3ad05b01655
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-b656-70d1829c10c0
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-bfee-d20609ce01ef
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-7db4-c24a23c7273c
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-3608-2e18c55ffb43
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-c01c-a65a7b6da15b
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-bde6-ba3b6d5579c1
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-b654-c1152f3d93df
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-bfdf-4e9f4f7bcaaa
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-53c4-9e1c779ea5e4
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-5868-5247a21a4f46
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-321d-e0cc2d10696a
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-8e99-8302bda9ecd2
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-8d7f-65264ea09fc6
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-b217-e77f6aebab3e
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-ab61-6b8482da6359
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-03a1-408385bd43ac
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-f8b8-afea8a71a918
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-ad01-0f480a8d2cd8
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-a4e1-0d9f4940ed49
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-b3f0-c717d891e7dc
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-242a-312051ef61d5
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-9472-a4aa062a217c
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-8c6e-eb94bbe54ef0
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-64dc-74b124cd8d42
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-5b33-f6f288029a51
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-c0b7-da19a5009368
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-49eb-b7ef82492a95
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62d8-9c45-8c7e652a45b9	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-bde6-ba3b6d5579c1
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-b654-c1152f3d93df
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-bfdf-4e9f4f7bcaaa
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-53c4-9e1c779ea5e4
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-8e99-8302bda9ecd2
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-8d7f-65264ea09fc6
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-3b48-304d28b6d8e0
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-b449-689eb4bf7faa
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-d352-007b8580c848
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-92e3-6aefea8e054e
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-7ccc-27d3fa7042a2
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-9377-cc595db3e9cf
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62d8-b09b-a021f974888b	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-0190-88724c0f3909
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-f7a5-4fc90b4f10f6
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-1dbf-d61b293a5f62
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-07c7-957dc74c8ab3
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-bfee-d20609ce01ef
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-bde6-ba3b6d5579c1
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-bfdf-4e9f4f7bcaaa
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-ab61-6b8482da6359
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-242a-312051ef61d5
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-64dc-74b124cd8d42
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-c0b7-da19a5009368
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62d8-e967-4410775cd758	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-d7f2-1f6d5d5347eb
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-11ea-cdab3cad503c
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-242a-312051ef61d5
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62d9-6267-c4da7627512e	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-bf0c-1e2a3aa6f0b0
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-c8e1-191769ed24a8
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-242a-312051ef61d5
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62d9-12c5-c199497243a4	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5182-0e0faab733fb
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9fdf-44f6dc017c0b
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c8e1-191769ed24a8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-37c8-02c0355e54d3
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7e5d-f0ba0acdbd3c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ff01-a2c15fb64a15
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d7f2-1f6d5d5347eb
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0190-88724c0f3909
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-11ea-cdab3cad503c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ee55-155a82a5f02c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-f7a5-4fc90b4f10f6
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-1dbf-d61b293a5f62
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-cf98-4b99dd0cc094
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-07c7-957dc74c8ab3
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-aa0a-690500f01c49
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-f529-dc3b97cc7db1
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-585f-b3ad05b01655
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-89e5-5a96fe89ea62
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-b656-70d1829c10c0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5204-613472c907c1
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d0f7-1f26fc8a14a8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bfee-d20609ce01ef
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7db4-c24a23c7273c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-53bc-5c55abb5a5af
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-3608-2e18c55ffb43
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-46a5-c769da1328d8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c01c-a65a7b6da15b
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bde6-ba3b6d5579c1
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-b654-c1152f3d93df
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-3bfe-8449c4e067e3
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-e29d-9140ad18b6d0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-61e5-bf81f7597526
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-1016-dd315b7cdc66
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5a4e-db428eb4ff27
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5277-c7c07986c883
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-2a00-eacd9af15b15
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-549a-86c8a111bbf6
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bfdf-4e9f4f7bcaaa
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-53c4-9e1c779ea5e4
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bcc3-3cb7b881803a
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-15b6-490c6485b576
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-e19b-db97d0e55c44
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-33d8-7bce73459e43
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d6b3-4a45069a6fd5
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-82cc-31f7d7122f54
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-efe4-1f38a2785d8b
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5868-5247a21a4f46
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-a613-a627e1a6ee1d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-321d-e0cc2d10696a
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-cbb3-932ec4f2f6a2
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c18a-812a7d62e9e9
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8e99-8302bda9ecd2
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8d7f-65264ea09fc6
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c1d8-5282543f9c22
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-b217-e77f6aebab3e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7741-c988abdfdc18
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7680-88ded3f45f53
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-2322-51ca413e7bb5
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-88ce-9b602de0a644
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ab61-6b8482da6359
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-03a1-408385bd43ac
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9145-c00afcc20e85
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-6a50-28666fe5bb60
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ceb0-591371101df7
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d4aa-25a121e21a5a
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c9c8-4774728ad08e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0149-8d24935958f3
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0c57-9bb6dfdc4bc0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-4fb1-da09b3419d6d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5d2b-250a2d7990a1
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8e49-2988b02e8a45
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c8c8-b6783ff886d5
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-59d5-ec67ffd14324
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c16b-ba8d387acb5c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-dc44-2bef468c6a39
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-982b-8bfc12ad587c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-6842-682777edc50b
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-dee9-4281be4079ab
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7016-0565b67bd74d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-baaa-d633807d0632
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-f8b8-afea8a71a918
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0c4e-4bd9272f524d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-845c-d8197ba79c97
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5066-7f4547d227b3
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9a17-0d33c9a1d652
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d3c2-72421cc999e8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ad01-0f480a8d2cd8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bd0a-1b7a23c8d79a
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-a4e1-0d9f4940ed49
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-2faa-694e0ffcbfcd
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0c17-b39c92382f0e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8899-33966e4a6c29
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-65f8-d52aefddbd3e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8927-9e28b0fc1313
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-1c08-129b68a2e66d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-e2c1-157f08c8f9e5
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8988-d16987be8cc4
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-6d41-a38bc21c8ffc
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-b3f0-c717d891e7dc
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-0b0e-0892529065be
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-2525-d727aff6246e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-2cc4-a7e5ae2d67e8
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d460-a931a334be2c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-47e2-35aefc5c06e4
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-f7f6-d9a5bb8c8666
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d5a0-8118d14b5b1b
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-35af-88debee46605
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-3b48-304d28b6d8e0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-b449-689eb4bf7faa
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-bf0c-1e2a3aa6f0b0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-070f-8e3a1810a51e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-242a-312051ef61d5
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-ae71-7f419a0acaaa
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-a54f-c83ec705b41e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-71b2-792512393703
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-d352-007b8580c848
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-92e3-6aefea8e054e
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9472-a4aa062a217c
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-8c6e-eb94bbe54ef0
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-64dc-74b124cd8d42
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-5b33-f6f288029a51
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-3ce2-b3388681d0e7
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-91ae-b04f02912d78
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-7ccc-27d3fa7042a2
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9377-cc595db3e9cf
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-c0b7-da19a5009368
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-49eb-b7ef82492a95
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-9173-f9d65f0fbc3d
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-728b-7c7f9d30cb5f
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-df16-10f2908c9bf4
00020000-558d-62db-65cb-a70c97fb73a5	00030000-558d-62d8-1839-9cf33bc4f4ec
\.


--
-- TOC entry 2875 (class 0 OID 8316689)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8316720)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8316852)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558d-62db-7571-4f40d9383040	00090000-558d-62db-9e5b-072e28532304	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8316454)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558d-62da-e87b-4fde36e2a040	00040000-558d-62d8-9577-f77e8f493c31	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-62da-1ff1-16fdcc42e115	00040000-558d-62d8-9577-f77e8f493c31	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-62da-5804-5c11080cf73e	00040000-558d-62d8-9577-f77e8f493c31	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-62db-7614-029058e64af5	00040000-558d-62d8-9577-f77e8f493c31	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-62db-e0ae-b66f41f2f387	00040000-558d-62d8-9577-f77e8f493c31	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-62db-474f-9e5d8b9a6ba0	00040000-558d-62d8-d83f-2c1921903934	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8316489)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558d-62d9-73d6-64209983c726	8341	Adlešiči
00050000-558d-62d9-6030-8bed48eaff36	5270	Ajdovščina
00050000-558d-62d9-94d1-43340b30be6e	6280	Ankaran/Ancarano
00050000-558d-62d9-2c96-0c8465ee079d	9253	Apače
00050000-558d-62d9-4f21-11de31470d20	8253	Artiče
00050000-558d-62d9-52e4-d60d09c37b54	4275	Begunje na Gorenjskem
00050000-558d-62d9-13bd-79b6bf6e27e5	1382	Begunje pri Cerknici
00050000-558d-62d9-9497-0ebf11042fe5	9231	Beltinci
00050000-558d-62d9-8fe4-792bccf079d2	2234	Benedikt
00050000-558d-62d9-5f68-249dee24f69b	2345	Bistrica ob Dravi
00050000-558d-62d9-313f-47c4c4f938ed	3256	Bistrica ob Sotli
00050000-558d-62d9-3e92-48d4d7656606	8259	Bizeljsko
00050000-558d-62d9-e09f-fed45aa1d105	1223	Blagovica
00050000-558d-62d9-25e6-421857043070	8283	Blanca
00050000-558d-62d9-63e9-b2756c78fb92	4260	Bled
00050000-558d-62d9-20f3-a67a219808ed	4273	Blejska Dobrava
00050000-558d-62d9-9248-ec98b8329e55	9265	Bodonci
00050000-558d-62d9-b6d8-8cec1d863acf	9222	Bogojina
00050000-558d-62d9-eaf8-f4259cf739e4	4263	Bohinjska Bela
00050000-558d-62d9-4299-4aa929304a07	4264	Bohinjska Bistrica
00050000-558d-62d9-b203-2fccb6dabab8	4265	Bohinjsko jezero
00050000-558d-62d9-ffa2-b5d4cac3c46f	1353	Borovnica
00050000-558d-62d9-fed0-745ac9c428f5	8294	Boštanj
00050000-558d-62d9-4d0e-17bbd1eb2be7	5230	Bovec
00050000-558d-62d9-ce4a-3fb6c0dda328	5295	Branik
00050000-558d-62d9-ea11-a4f549526f03	3314	Braslovče
00050000-558d-62d9-06b2-7e177f25fd21	5223	Breginj
00050000-558d-62d9-e228-3c8ca3383557	8280	Brestanica
00050000-558d-62d9-b224-e3c99ac23be6	2354	Bresternica
00050000-558d-62d9-ee80-b4a986cc8a7e	4243	Brezje
00050000-558d-62d9-5547-90a3e46bb08d	1351	Brezovica pri Ljubljani
00050000-558d-62d9-74cf-76f1176d4feb	8250	Brežice
00050000-558d-62d9-72a0-3e00da5965a2	4210	Brnik - Aerodrom
00050000-558d-62d9-3a71-db8fbcb2fd16	8321	Brusnice
00050000-558d-62d9-2833-cbfe6c38d04c	3255	Buče
00050000-558d-62d9-37dc-d73015f03209	8276	Bučka 
00050000-558d-62d9-4b8b-2c7b5db59c9c	9261	Cankova
00050000-558d-62d9-5d74-5798aa3f1c77	3000	Celje 
00050000-558d-62d9-7d27-6e444556fef5	3001	Celje - poštni predali
00050000-558d-62d9-e818-dc6a3cec3a25	4207	Cerklje na Gorenjskem
00050000-558d-62d9-842b-1e2789aaa92f	8263	Cerklje ob Krki
00050000-558d-62d9-1e6e-5e9f3311b670	1380	Cerknica
00050000-558d-62d9-1091-9483a1900b98	5282	Cerkno
00050000-558d-62d9-1d24-1df8890542a4	2236	Cerkvenjak
00050000-558d-62d9-b893-c70431da1289	2215	Ceršak
00050000-558d-62d9-38e0-a51dc2b76906	2326	Cirkovce
00050000-558d-62d9-7bab-8eb983aa59ee	2282	Cirkulane
00050000-558d-62d9-a87f-de7330b0a024	5273	Col
00050000-558d-62d9-cbbd-6c2523e76dfd	8251	Čatež ob Savi
00050000-558d-62d9-f41e-66c2afd83d9c	1413	Čemšenik
00050000-558d-62d9-827f-633ba0c569f4	5253	Čepovan
00050000-558d-62d9-10fd-4d65859f9ab1	9232	Črenšovci
00050000-558d-62d9-a538-0a03bfdccca4	2393	Črna na Koroškem
00050000-558d-62d9-ecee-c12eab52a393	6275	Črni Kal
00050000-558d-62d9-e068-732ca496a761	5274	Črni Vrh nad Idrijo
00050000-558d-62d9-b324-db2f5147f8ec	5262	Črniče
00050000-558d-62d9-4aee-7aceb57f832f	8340	Črnomelj
00050000-558d-62d9-a6af-97baa5bac247	6271	Dekani
00050000-558d-62d9-924f-a8d8ddebf45d	5210	Deskle
00050000-558d-62d9-c3a5-fca49b6525c3	2253	Destrnik
00050000-558d-62d9-b621-903bbdece03e	6215	Divača
00050000-558d-62d9-0a00-5ba757312486	1233	Dob
00050000-558d-62d9-3430-e5a253a476ff	3224	Dobje pri Planini
00050000-558d-62d9-7314-5d8bd7615544	8257	Dobova
00050000-558d-62d9-34fe-dc73d482b635	1423	Dobovec
00050000-558d-62d9-7096-45b5ad798932	5263	Dobravlje
00050000-558d-62d9-4769-bd66a12f2f69	3204	Dobrna
00050000-558d-62d9-f375-8cdbe1e01216	8211	Dobrnič
00050000-558d-62d9-0002-305f0c6a5575	1356	Dobrova
00050000-558d-62d9-6aa8-946ee83c6cbb	9223	Dobrovnik/Dobronak 
00050000-558d-62d9-78cb-3eafff429d15	5212	Dobrovo v Brdih
00050000-558d-62d9-ad11-f36f89229f44	1431	Dol pri Hrastniku
00050000-558d-62d9-93b1-a8effb5d07e4	1262	Dol pri Ljubljani
00050000-558d-62d9-077f-1a30e696a258	1273	Dole pri Litiji
00050000-558d-62d9-f018-46d7528e4197	1331	Dolenja vas
00050000-558d-62d9-c392-4227d2098365	8350	Dolenjske Toplice
00050000-558d-62d9-297d-f3b229e1e9f4	1230	Domžale
00050000-558d-62d9-0cca-adf4a98ad3a9	2252	Dornava
00050000-558d-62d9-abde-973d078041dd	5294	Dornberk
00050000-558d-62d9-ecd6-3e0b6765926c	1319	Draga
00050000-558d-62d9-1779-f92337f39b54	8343	Dragatuš
00050000-558d-62d9-63d5-2e2087edd4db	3222	Dramlje
00050000-558d-62d9-259f-4f479dd6cdfa	2370	Dravograd
00050000-558d-62d9-6e48-e4788862147d	4203	Duplje
00050000-558d-62d9-e21d-15793139e844	6221	Dutovlje
00050000-558d-62d9-2e3c-e7062b17b101	8361	Dvor
00050000-558d-62d9-5483-68c9aca883a5	2343	Fala
00050000-558d-62d9-64db-f66865a30578	9208	Fokovci
00050000-558d-62d9-a888-c4372e8db5a7	2313	Fram
00050000-558d-62d9-1da5-70ea952cab3b	3213	Frankolovo
00050000-558d-62d9-b75b-07d7496e0788	1274	Gabrovka
00050000-558d-62d9-4e04-d0d690812501	8254	Globoko
00050000-558d-62d9-6550-143340479486	5275	Godovič
00050000-558d-62d9-bb8d-6de17b953d3c	4204	Golnik
00050000-558d-62d9-c850-6c6629c925b3	3303	Gomilsko
00050000-558d-62d9-942c-a5f4a1b25a48	4224	Gorenja vas
00050000-558d-62d9-cb71-a311317ca6b5	3263	Gorica pri Slivnici
00050000-558d-62d9-a2d9-fbbfed1d0c5b	2272	Gorišnica
00050000-558d-62d9-fbfa-2676821b5a78	9250	Gornja Radgona
00050000-558d-62d9-e042-fe695e851f5e	3342	Gornji Grad
00050000-558d-62d9-5f65-b31a25643ca2	4282	Gozd Martuljek
00050000-558d-62d9-c95e-0fa65354c6ac	6272	Gračišče
00050000-558d-62d9-ec7f-b1ec8a28e6a3	9264	Grad
00050000-558d-62d9-e92c-0ef0d660489b	8332	Gradac
00050000-558d-62d9-d9b9-8973f2d57354	1384	Grahovo
00050000-558d-62d9-9c34-6a70f140282a	5242	Grahovo ob Bači
00050000-558d-62d9-37c0-b693a553eb2c	5251	Grgar
00050000-558d-62d9-578d-09395fc2706a	3302	Griže
00050000-558d-62d9-8907-eca11208c8e2	3231	Grobelno
00050000-558d-62d9-566b-fec29ea268fc	1290	Grosuplje
00050000-558d-62d9-3491-3195952ebebc	2288	Hajdina
00050000-558d-62d9-d083-5aba4674f0b8	8362	Hinje
00050000-558d-62d9-5da2-517e7322a96c	2311	Hoče
00050000-558d-62d9-cac6-57b9e2be39b4	9205	Hodoš/Hodos
00050000-558d-62d9-4114-bd19450ff3a8	1354	Horjul
00050000-558d-62d9-74ab-9f2571b1fc5d	1372	Hotedršica
00050000-558d-62d9-e1c3-b7378d16ffc3	1430	Hrastnik
00050000-558d-62d9-2a2d-76bb662462c6	6225	Hruševje
00050000-558d-62d9-515c-68173fb5def4	4276	Hrušica
00050000-558d-62d9-abac-d1a6857c4f4d	5280	Idrija
00050000-558d-62d9-e814-54e89ae680ff	1292	Ig
00050000-558d-62d9-ec65-dab3577411cd	6250	Ilirska Bistrica
00050000-558d-62d9-5edc-ceb54d7219d8	6251	Ilirska Bistrica-Trnovo
00050000-558d-62d9-ba4d-9de94ed1b006	1295	Ivančna Gorica
00050000-558d-62d9-3874-22d42ab30776	2259	Ivanjkovci
00050000-558d-62d9-2127-3b02a7cd9627	1411	Izlake
00050000-558d-62d9-b36c-e0853567744e	6310	Izola/Isola
00050000-558d-62d9-74eb-7d98a40bcb0f	2222	Jakobski Dol
00050000-558d-62d9-2ea5-755d5685337d	2221	Jarenina
00050000-558d-62d9-9171-abfbeb4afbaf	6254	Jelšane
00050000-558d-62d9-746f-d9fecaa0e488	4270	Jesenice
00050000-558d-62d9-a7b7-76b1c9f1b50d	8261	Jesenice na Dolenjskem
00050000-558d-62d9-93bd-f5fc2e749ced	3273	Jurklošter
00050000-558d-62d9-17e8-691ed2bbef9b	2223	Jurovski Dol
00050000-558d-62d9-a924-ef8c9551c6f0	2256	Juršinci
00050000-558d-62d9-0297-668092da82b7	5214	Kal nad Kanalom
00050000-558d-62d9-5288-777c0d3db865	3233	Kalobje
00050000-558d-62d9-5208-a4f3f2d6400f	4246	Kamna Gorica
00050000-558d-62d9-09fb-46b04cb519f2	2351	Kamnica
00050000-558d-62d9-83c5-a4913e033121	1241	Kamnik
00050000-558d-62d9-f03d-dcb91a8c921c	5213	Kanal
00050000-558d-62d9-8859-b18fd0c24268	8258	Kapele
00050000-558d-62d9-762f-e2ed7b3536c3	2362	Kapla
00050000-558d-62d9-4eb3-e7ef74d32f10	2325	Kidričevo
00050000-558d-62d9-ad5a-88a93e74c52c	1412	Kisovec
00050000-558d-62d9-3a72-0f7a945713c9	6253	Knežak
00050000-558d-62d9-c13a-62e066dfa904	5222	Kobarid
00050000-558d-62d9-6870-f2a691f4b2b4	9227	Kobilje
00050000-558d-62d9-21cc-ef6a4c2542fc	1330	Kočevje
00050000-558d-62d9-1d6f-c9ea5a7d76b0	1338	Kočevska Reka
00050000-558d-62d9-1331-b78e049871f5	2276	Kog
00050000-558d-62d9-8e3b-85a702f39cac	5211	Kojsko
00050000-558d-62d9-d6d7-950c4cf12b03	6223	Komen
00050000-558d-62d9-a480-2d61a0622769	1218	Komenda
00050000-558d-62d9-6767-2557de837606	6000	Koper/Capodistria 
00050000-558d-62d9-b582-0a324cec2ff5	6001	Koper/Capodistria - poštni predali
00050000-558d-62d9-f2f3-e6f24314f3ae	8282	Koprivnica
00050000-558d-62d9-7122-71b4cc270a3b	5296	Kostanjevica na Krasu
00050000-558d-62d9-01a6-8602cc7860c8	8311	Kostanjevica na Krki
00050000-558d-62d9-1b4a-88d383a47c0d	1336	Kostel
00050000-558d-62d9-9e56-0f23c930a022	6256	Košana
00050000-558d-62d9-a59c-238b6d59c03e	2394	Kotlje
00050000-558d-62d9-83e9-c0b2ae8f3dfc	6240	Kozina
00050000-558d-62d9-8acb-bf7a697d517e	3260	Kozje
00050000-558d-62d9-dd9a-9330978b5077	4000	Kranj 
00050000-558d-62d9-54b1-05ab99e55e4a	4001	Kranj - poštni predali
00050000-558d-62d9-cae3-7d2f72fdd46b	4280	Kranjska Gora
00050000-558d-62d9-9997-52fa9f510c34	1281	Kresnice
00050000-558d-62d9-11d7-6e1fb7d62cf7	4294	Križe
00050000-558d-62d9-c4aa-1c2676eb4c4f	9206	Križevci
00050000-558d-62d9-6ced-caeb3c7edf97	9242	Križevci pri Ljutomeru
00050000-558d-62d9-a137-287824161fc3	1301	Krka
00050000-558d-62d9-042e-e10c4d96afd4	8296	Krmelj
00050000-558d-62d9-d47c-7bfe73cf89e7	4245	Kropa
00050000-558d-62d9-8304-1c5976a1e7e6	8262	Krška vas
00050000-558d-62d9-d656-cdbefc43741c	8270	Krško
00050000-558d-62d9-1ac5-b59a9823e29b	9263	Kuzma
00050000-558d-62d9-a1b3-d5a4770e40c7	2318	Laporje
00050000-558d-62d9-7149-6eabf81553bc	3270	Laško
00050000-558d-62d9-fd25-2ae9504f290e	1219	Laze v Tuhinju
00050000-558d-62d9-ae81-3edfc46bf0d0	2230	Lenart v Slovenskih goricah
00050000-558d-62d9-eefd-f8dd2a92a651	9220	Lendava/Lendva
00050000-558d-62d9-15dc-ccd688a06887	4248	Lesce
00050000-558d-62d9-1eec-efef6e94f548	3261	Lesično
00050000-558d-62d9-3c32-2017a7793835	8273	Leskovec pri Krškem
00050000-558d-62d9-7876-fc625d322ee7	2372	Libeliče
00050000-558d-62d9-8207-4330a6ab718a	2341	Limbuš
00050000-558d-62d9-5fbb-d3a556ec67e4	1270	Litija
00050000-558d-62d9-0550-858ef6bd724a	3202	Ljubečna
00050000-558d-62d9-92eb-ffdefb53aa47	1000	Ljubljana 
00050000-558d-62d9-8a60-d7d4efceacdd	1001	Ljubljana - poštni predali
00050000-558d-62d9-eb76-691948a89225	1231	Ljubljana - Črnuče
00050000-558d-62d9-5f7d-9110628cecaa	1261	Ljubljana - Dobrunje
00050000-558d-62d9-ab24-b333bc90980c	1260	Ljubljana - Polje
00050000-558d-62d9-99a4-170b31148217	1210	Ljubljana - Šentvid
00050000-558d-62d9-3889-32859608e201	1211	Ljubljana - Šmartno
00050000-558d-62d9-8fe6-2d758f87ee47	3333	Ljubno ob Savinji
00050000-558d-62d9-cc96-e8d99eb5fc6d	9240	Ljutomer
00050000-558d-62d9-c37b-019eb4da2826	3215	Loče
00050000-558d-62d9-68c0-fc90b76be19f	5231	Log pod Mangartom
00050000-558d-62d9-d150-4e269e833c60	1358	Log pri Brezovici
00050000-558d-62d9-c8fe-17a53cdcf79b	1370	Logatec
00050000-558d-62d9-932e-1cb08e881a37	1371	Logatec
00050000-558d-62d9-2fc2-4975c4a8d241	1434	Loka pri Zidanem Mostu
00050000-558d-62d9-7c12-7fc81b92ceb3	3223	Loka pri Žusmu
00050000-558d-62d9-2e23-1f0524784f4a	6219	Lokev
00050000-558d-62d9-46a5-4801275c0be2	1318	Loški Potok
00050000-558d-62d9-a75f-c7368db7d8cc	2324	Lovrenc na Dravskem polju
00050000-558d-62d9-6b76-78f03b7ddb3a	2344	Lovrenc na Pohorju
00050000-558d-62d9-d41b-1a63ff1f3177	3334	Luče
00050000-558d-62d9-3413-515b9bb8f51d	1225	Lukovica
00050000-558d-62d9-ccc1-a69c57d78b2d	9202	Mačkovci
00050000-558d-62d9-f87c-2524f3b36a83	2322	Majšperk
00050000-558d-62d9-888b-e3269045265e	2321	Makole
00050000-558d-62d9-1833-51a995cdf5bf	9243	Mala Nedelja
00050000-558d-62d9-c589-a3de2fc6b2d7	2229	Malečnik
00050000-558d-62d9-e8e8-e7127c0fbd5c	6273	Marezige
00050000-558d-62d9-5818-0d912d76ffbf	2000	Maribor 
00050000-558d-62d9-f9ba-086a86bf3679	2001	Maribor - poštni predali
00050000-558d-62d9-51de-0b53f68ff82e	2206	Marjeta na Dravskem polju
00050000-558d-62d9-4e73-998ed1e559a2	2281	Markovci
00050000-558d-62d9-3a7f-a1ab32d0cce2	9221	Martjanci
00050000-558d-62d9-9b0b-d2fe800fbb63	6242	Materija
00050000-558d-62d9-1d46-4918788feeea	4211	Mavčiče
00050000-558d-62d9-d547-79d6c342ccbb	1215	Medvode
00050000-558d-62d9-f140-dca1e635a5cf	1234	Mengeš
00050000-558d-62d9-df21-29671b41d7c0	8330	Metlika
00050000-558d-62d9-046b-cfbee77a8f6e	2392	Mežica
00050000-558d-62d9-1eab-768257c55548	2204	Miklavž na Dravskem polju
00050000-558d-62d9-cc75-74c892090788	2275	Miklavž pri Ormožu
00050000-558d-62d9-d653-66db72f3a484	5291	Miren
00050000-558d-62d9-e0af-c2355d6e74c9	8233	Mirna
00050000-558d-62d9-9e3f-48754e507a8c	8216	Mirna Peč
00050000-558d-62d9-4409-2314ec5c02c8	2382	Mislinja
00050000-558d-62d9-8cf1-f85ec7ab9ed1	4281	Mojstrana
00050000-558d-62d9-102c-6b9e0370b522	8230	Mokronog
00050000-558d-62d9-acf8-6bdada587742	1251	Moravče
00050000-558d-62d9-9b9f-b03ee8572fa5	9226	Moravske Toplice
00050000-558d-62d9-bf86-2597b93d3945	5216	Most na Soči
00050000-558d-62d9-82f0-7b55ecb8ad0b	1221	Motnik
00050000-558d-62d9-a8d1-00120a5e412a	3330	Mozirje
00050000-558d-62d9-1d5d-186c34b109d5	9000	Murska Sobota 
00050000-558d-62d9-cdfd-35b78a91470a	9001	Murska Sobota - poštni predali
00050000-558d-62d9-9a02-300b37598a7a	2366	Muta
00050000-558d-62d9-43c7-2ff6397d4d86	4202	Naklo
00050000-558d-62d9-f76f-d47895c75bbd	3331	Nazarje
00050000-558d-62d9-2bf1-8814f02624fd	1357	Notranje Gorice
00050000-558d-62d9-2694-0a02ebecd740	3203	Nova Cerkev
00050000-558d-62d9-19b0-3fdf4d1fa3e4	5000	Nova Gorica 
00050000-558d-62d9-1103-789126435de5	5001	Nova Gorica - poštni predali
00050000-558d-62d9-6ccc-b730250747d9	1385	Nova vas
00050000-558d-62d9-cef1-8d47df6f9889	8000	Novo mesto
00050000-558d-62d9-2643-69c31b9cc2fe	8001	Novo mesto - poštni predali
00050000-558d-62d9-d90a-2e9758bfdc01	6243	Obrov
00050000-558d-62d9-b67b-2c017ce9d6ad	9233	Odranci
00050000-558d-62d9-c42c-33706767af9b	2317	Oplotnica
00050000-558d-62d9-3cd2-303b211358bd	2312	Orehova vas
00050000-558d-62d9-689a-a458c5d94b75	2270	Ormož
00050000-558d-62d9-1c24-f0553956f6f5	1316	Ortnek
00050000-558d-62d9-689d-365b5fcf5013	1337	Osilnica
00050000-558d-62d9-8816-0074a5d578b7	8222	Otočec
00050000-558d-62d9-afdc-9868ad97fea5	2361	Ožbalt
00050000-558d-62d9-cd2c-0e68f3cb07f9	2231	Pernica
00050000-558d-62d9-70f2-a20db707323a	2211	Pesnica pri Mariboru
00050000-558d-62d9-ef17-5fa0b8a63a2d	9203	Petrovci
00050000-558d-62d9-c9f1-5f79d001e8f9	3301	Petrovče
00050000-558d-62d9-698d-bafb55ec0c05	6330	Piran/Pirano
00050000-558d-62d9-bd54-be4d886996ce	8255	Pišece
00050000-558d-62d9-9faf-2be6bc8f3fcf	6257	Pivka
00050000-558d-62d9-78c4-ec191ed2765c	6232	Planina
00050000-558d-62d9-6c00-c92e3c855b31	3225	Planina pri Sevnici
00050000-558d-62d9-3a81-045731ea8066	6276	Pobegi
00050000-558d-62d9-19b3-8402db4a54de	8312	Podbočje
00050000-558d-62d9-15ff-18c1b0e8ffdb	5243	Podbrdo
00050000-558d-62d9-1e9e-0b24282b4cce	3254	Podčetrtek
00050000-558d-62d9-c11c-37d88d8306ec	2273	Podgorci
00050000-558d-62d9-be57-e6a406fa25d4	6216	Podgorje
00050000-558d-62d9-cb36-9b259ac07e34	2381	Podgorje pri Slovenj Gradcu
00050000-558d-62d9-e722-52d5e5927652	6244	Podgrad
00050000-558d-62d9-88ce-cc3e20a28b9d	1414	Podkum
00050000-558d-62d9-d5c8-7f91d4ee84fe	2286	Podlehnik
00050000-558d-62d9-6c1b-79e04c841dbe	5272	Podnanos
00050000-558d-62d9-3043-eeb89e97fd77	4244	Podnart
00050000-558d-62d9-674d-bd73c337983c	3241	Podplat
00050000-558d-62d9-87c5-d9ea552a8d43	3257	Podsreda
00050000-558d-62d9-34d8-933787e74adb	2363	Podvelka
00050000-558d-62d9-1c19-791e7945be5c	2208	Pohorje
00050000-558d-62d9-86d4-dc71f6aeccf8	2257	Polenšak
00050000-558d-62d9-aaf9-a351d466ef81	1355	Polhov Gradec
00050000-558d-62d9-50eb-8bc58d8bde27	4223	Poljane nad Škofjo Loko
00050000-558d-62d9-7041-c5f837333a68	2319	Poljčane
00050000-558d-62d9-2d5c-540dcc9a9e45	1272	Polšnik
00050000-558d-62d9-2c2b-ad049b9f7c39	3313	Polzela
00050000-558d-62d9-eca1-ee235a7c9d97	3232	Ponikva
00050000-558d-62d9-a553-8f2e739d9647	6320	Portorož/Portorose
00050000-558d-62d9-deed-5554111692e7	6230	Postojna
00050000-558d-62d9-e296-d49099730eff	2331	Pragersko
00050000-558d-62d9-8596-4e5416209068	3312	Prebold
00050000-558d-62d9-d756-44939b1d378a	4205	Preddvor
00050000-558d-62d9-3939-b556b94ac04d	6255	Prem
00050000-558d-62d9-a2e0-008cfce92af0	1352	Preserje
00050000-558d-62d9-dd62-9f2b8c0a5ca1	6258	Prestranek
00050000-558d-62d9-6729-9eb457f35a87	2391	Prevalje
00050000-558d-62d9-19f7-02ca3d06dbca	3262	Prevorje
00050000-558d-62d9-b883-f2ab8ec349a4	1276	Primskovo 
00050000-558d-62d9-dbef-ad4438e070bd	3253	Pristava pri Mestinju
00050000-558d-62d9-1a40-efd8028e1cc9	9207	Prosenjakovci/Partosfalva
00050000-558d-62d9-815f-04e15db6f122	5297	Prvačina
00050000-558d-62d9-60c7-f5ae9615bd7e	2250	Ptuj
00050000-558d-62d9-e008-c977581284c8	2323	Ptujska Gora
00050000-558d-62d9-5b31-afa926652a78	9201	Puconci
00050000-558d-62d9-f64b-bdcaa46c3ebe	2327	Rače
00050000-558d-62d9-9f66-6b4a448a4951	1433	Radeče
00050000-558d-62d9-82e8-1185539ddc48	9252	Radenci
00050000-558d-62d9-f7d6-ef7518081524	2360	Radlje ob Dravi
00050000-558d-62d9-245d-e0b46e3a7649	1235	Radomlje
00050000-558d-62d9-e026-8bbb813ce48b	4240	Radovljica
00050000-558d-62d9-d562-af63c5454368	8274	Raka
00050000-558d-62d9-e1f1-203546b531b4	1381	Rakek
00050000-558d-62d9-dae0-1edd9b97dd1f	4283	Rateče - Planica
00050000-558d-62d9-284c-f9db79a86b9b	2390	Ravne na Koroškem
00050000-558d-62d9-7eca-a9348ac101c2	9246	Razkrižje
00050000-558d-62d9-ea3a-a6fb2b1bf840	3332	Rečica ob Savinji
00050000-558d-62d9-7bd3-a326b874a58b	5292	Renče
00050000-558d-62d9-2ff6-92dc58529439	1310	Ribnica
00050000-558d-62d9-5199-4efc594fbaaa	2364	Ribnica na Pohorju
00050000-558d-62d9-92e9-2045b24d2a2b	3272	Rimske Toplice
00050000-558d-62d9-8659-92db4189cf6f	1314	Rob
00050000-558d-62d9-ae02-527b84f38714	5215	Ročinj
00050000-558d-62d9-2c87-e0cbeb58db74	3250	Rogaška Slatina
00050000-558d-62d9-e47a-dc6a3b924851	9262	Rogašovci
00050000-558d-62d9-79cd-6444651c94cc	3252	Rogatec
00050000-558d-62d9-03a7-0247f9d1b459	1373	Rovte
00050000-558d-62d9-7223-2658bd460d14	2342	Ruše
00050000-558d-62d9-4c57-650aec9471c5	1282	Sava
00050000-558d-62d9-f941-bd74d7f18b3e	6333	Sečovlje/Sicciole
00050000-558d-62d9-ba9b-a5ccaeddc25e	4227	Selca
00050000-558d-62d9-33fe-4819d9f1996b	2352	Selnica ob Dravi
00050000-558d-62d9-286f-7a2f203fa46a	8333	Semič
00050000-558d-62d9-497e-e0bd35e7440f	8281	Senovo
00050000-558d-62d9-fee6-6a86d1f89d6a	6224	Senožeče
00050000-558d-62d9-443d-751bfac7e1a4	8290	Sevnica
00050000-558d-62d9-b5f9-11d147158aa1	6210	Sežana
00050000-558d-62d9-a525-48ddb68ea12a	2214	Sladki Vrh
00050000-558d-62d9-423e-7fcb277da2bc	5283	Slap ob Idrijci
00050000-558d-62d9-6c51-0a0acdedc40b	2380	Slovenj Gradec
00050000-558d-62d9-f1b8-86fcd43c34ff	2310	Slovenska Bistrica
00050000-558d-62d9-0180-0d603b15b31a	3210	Slovenske Konjice
00050000-558d-62d9-ead2-6a139df509d0	1216	Smlednik
00050000-558d-62d9-9561-5bd3c433a988	5232	Soča
00050000-558d-62d9-e649-849371ba9a6b	1317	Sodražica
00050000-558d-62d9-0e43-5b196a054bce	3335	Solčava
00050000-558d-62d9-b9dd-4109bee30838	5250	Solkan
00050000-558d-62d9-a531-2249816a0c22	4229	Sorica
00050000-558d-62d9-db2d-14e55240b159	4225	Sovodenj
00050000-558d-62d9-dd8d-b958fac077bd	5281	Spodnja Idrija
00050000-558d-62d9-9a05-566716a077bc	2241	Spodnji Duplek
00050000-558d-62d9-6f0a-4a293ae1def5	9245	Spodnji Ivanjci
00050000-558d-62d9-8b52-e2133791096f	2277	Središče ob Dravi
00050000-558d-62d9-63d5-ba092af3a096	4267	Srednja vas v Bohinju
00050000-558d-62d9-a945-6f303dd823c9	8256	Sromlje 
00050000-558d-62d9-6996-a218c7ce29cd	5224	Srpenica
00050000-558d-62d9-f809-d0be104d2100	1242	Stahovica
00050000-558d-62d9-d780-fbc70f54c573	1332	Stara Cerkev
00050000-558d-62d9-3f04-2aae1fa5517a	8342	Stari trg ob Kolpi
00050000-558d-62d9-63a9-3d53b0bc5a35	1386	Stari trg pri Ložu
00050000-558d-62d9-2842-5ff92f5770e2	2205	Starše
00050000-558d-62d9-1780-f97a7a0b2ab3	2289	Stoperce
00050000-558d-62d9-54a8-d4cf7826a575	8322	Stopiče
00050000-558d-62d9-59ad-4ff91871eef4	3206	Stranice
00050000-558d-62d9-4671-ed26a20d930c	8351	Straža
00050000-558d-62d9-780c-a9a3366c1d03	1313	Struge
00050000-558d-62d9-8413-abdbdc30ec65	8293	Studenec
00050000-558d-62d9-88c4-f8b16941d568	8331	Suhor
00050000-558d-62d9-277b-46d2cf8b039b	2233	Sv. Ana v Slovenskih goricah
00050000-558d-62d9-1979-5902f26c3511	2235	Sv. Trojica v Slovenskih goricah
00050000-558d-62d9-b8b2-c407487c7288	2353	Sveti Duh na Ostrem Vrhu
00050000-558d-62d9-11d5-7d0e9912ee76	9244	Sveti Jurij ob Ščavnici
00050000-558d-62d9-3585-83823315bb1a	3264	Sveti Štefan
00050000-558d-62d9-b335-b54b5ee80010	2258	Sveti Tomaž
00050000-558d-62d9-2604-ae4d09470986	9204	Šalovci
00050000-558d-62d9-9c3a-f0f1716fa4a3	5261	Šempas
00050000-558d-62d9-00e5-d3b33edbb15f	5290	Šempeter pri Gorici
00050000-558d-62d9-6020-0ee0063a044f	3311	Šempeter v Savinjski dolini
00050000-558d-62d9-4a55-9d5871f38238	4208	Šenčur
00050000-558d-62d9-b3d9-7418ad8eaad8	2212	Šentilj v Slovenskih goricah
00050000-558d-62d9-5bcf-33119f0883f3	8297	Šentjanž
00050000-558d-62d9-28dc-d10bda00072c	2373	Šentjanž pri Dravogradu
00050000-558d-62d9-63ca-adbda9c07c5c	8310	Šentjernej
00050000-558d-62d9-5380-08d0e351cb9c	3230	Šentjur
00050000-558d-62d9-2190-11b9229f58f0	3271	Šentrupert
00050000-558d-62d9-4bd8-94afd084dcd3	8232	Šentrupert
00050000-558d-62d9-a72f-3339aaf6eb80	1296	Šentvid pri Stični
00050000-558d-62d9-8f1f-2063a988b895	8275	Škocjan
00050000-558d-62d9-a44f-7fa0dccefcd3	6281	Škofije
00050000-558d-62d9-8f6b-6e50ea20cf5f	4220	Škofja Loka
00050000-558d-62d9-22d2-b8e343f7a435	3211	Škofja vas
00050000-558d-62d9-1eb5-d7db14016129	1291	Škofljica
00050000-558d-62d9-94fe-12307db12996	6274	Šmarje
00050000-558d-62d9-3a8a-2adc896adc1e	1293	Šmarje - Sap
00050000-558d-62d9-69fc-f35550167b88	3240	Šmarje pri Jelšah
00050000-558d-62d9-9f92-e6f0bb043b41	8220	Šmarješke Toplice
00050000-558d-62d9-a26d-dd2688301fea	2315	Šmartno na Pohorju
00050000-558d-62d9-06b0-0d182e8edaaa	3341	Šmartno ob Dreti
00050000-558d-62d9-fa45-89c3ba615921	3327	Šmartno ob Paki
00050000-558d-62d9-d9a0-fcd60aef0f71	1275	Šmartno pri Litiji
00050000-558d-62d9-cecf-c9859de95958	2383	Šmartno pri Slovenj Gradcu
00050000-558d-62d9-88e4-2a371d2f5cd3	3201	Šmartno v Rožni dolini
00050000-558d-62d9-94a6-363fc7e2b1c9	3325	Šoštanj
00050000-558d-62d9-b9f0-087c920eaf15	6222	Štanjel
00050000-558d-62d9-8760-5c546cbfa2d8	3220	Štore
00050000-558d-62d9-fd1d-f267dac8b34a	3304	Tabor
00050000-558d-62d9-dc42-2f2f599d2d85	3221	Teharje
00050000-558d-62d9-8bc5-98b2ec22bba0	9251	Tišina
00050000-558d-62d9-7536-969564e831f3	5220	Tolmin
00050000-558d-62d9-3357-211cbeb2ce9d	3326	Topolšica
00050000-558d-62d9-1e50-5bde61a877fb	2371	Trbonje
00050000-558d-62d9-bd71-23e3a6efb5fb	1420	Trbovlje
00050000-558d-62d9-499f-502e621ca8c4	8231	Trebelno 
00050000-558d-62d9-6f62-c662e9e19496	8210	Trebnje
00050000-558d-62d9-1cde-a670539bdd89	5252	Trnovo pri Gorici
00050000-558d-62d9-f127-9ae6eb64e846	2254	Trnovska vas
00050000-558d-62d9-b3df-633ba9952304	1222	Trojane
00050000-558d-62d9-ac56-84fab5adc8a4	1236	Trzin
00050000-558d-62d9-ce6c-8517100d1f24	4290	Tržič
00050000-558d-62d9-51f1-e2b790fc04a9	8295	Tržišče
00050000-558d-62d9-b202-ca4d4843a0c7	1311	Turjak
00050000-558d-62d9-eb7b-f7890af223f7	9224	Turnišče
00050000-558d-62d9-da6f-553cced89ff9	8323	Uršna sela
00050000-558d-62d9-7aa4-e552132172fd	1252	Vače
00050000-558d-62d9-1a5f-3c1a1ba728a5	3320	Velenje 
00050000-558d-62d9-ecfc-39101f51819e	3322	Velenje - poštni predali
00050000-558d-62d9-b05d-5796048c9c7d	8212	Velika Loka
00050000-558d-62d9-38fe-68593883fe34	2274	Velika Nedelja
00050000-558d-62d9-0f29-764f7d128369	9225	Velika Polana
00050000-558d-62d9-0baa-e9052ee1d0c7	1315	Velike Lašče
00050000-558d-62d9-209f-96352f6b24bf	8213	Veliki Gaber
00050000-558d-62d9-4099-27e2fb0778de	9241	Veržej
00050000-558d-62d9-9ee2-c4a5ce9bb635	1312	Videm - Dobrepolje
00050000-558d-62d9-6341-dea56aad0c45	2284	Videm pri Ptuju
00050000-558d-62d9-a1c6-d44d163dab10	8344	Vinica
00050000-558d-62d9-ce69-f1c989111f46	5271	Vipava
00050000-558d-62d9-f906-62610220ec87	4212	Visoko
00050000-558d-62d9-ef92-09064ecee99b	1294	Višnja Gora
00050000-558d-62d9-29ec-17aa721ca632	3205	Vitanje
00050000-558d-62d9-73f8-ddc8ceeb31da	2255	Vitomarci
00050000-558d-62d9-418d-a9a1cc58834a	1217	Vodice
00050000-558d-62d9-9b60-73caed18c435	3212	Vojnik\t
00050000-558d-62d9-c1c9-28010eaa1e24	5293	Volčja Draga
00050000-558d-62d9-878e-a181354e9991	2232	Voličina
00050000-558d-62d9-4304-38a5d75acf28	3305	Vransko
00050000-558d-62d9-1ea7-f36d3abb9a45	6217	Vremski Britof
00050000-558d-62d9-09a1-c1c855ec32ea	1360	Vrhnika
00050000-558d-62d9-33e9-47ae0b3dc127	2365	Vuhred
00050000-558d-62d9-6910-e067fa66b8f9	2367	Vuzenica
00050000-558d-62d9-1609-f0d4a465da0a	8292	Zabukovje 
00050000-558d-62d9-d3e0-44b6c45c09bd	1410	Zagorje ob Savi
00050000-558d-62d9-e817-0f7522f70dbe	1303	Zagradec
00050000-558d-62d9-650c-797581507a56	2283	Zavrč
00050000-558d-62d9-42b3-9e66d367ce7b	8272	Zdole 
00050000-558d-62d9-ee6f-f3b20065821c	4201	Zgornja Besnica
00050000-558d-62d9-76ec-4f15cd9e0e07	2242	Zgornja Korena
00050000-558d-62d9-3f9b-cd61f2a495e4	2201	Zgornja Kungota
00050000-558d-62d9-3198-90f33d1dcae7	2316	Zgornja Ložnica
00050000-558d-62d9-a4f3-a7869abacaa5	2314	Zgornja Polskava
00050000-558d-62d9-2edb-6eb3a096fdc4	2213	Zgornja Velka
00050000-558d-62d9-ae6d-8ea31c9f4854	4247	Zgornje Gorje
00050000-558d-62d9-a329-f91f6db26cc8	4206	Zgornje Jezersko
00050000-558d-62d9-f56c-24ef770233fe	2285	Zgornji Leskovec
00050000-558d-62d9-4c6a-6e0230538e7b	1432	Zidani Most
00050000-558d-62d9-412a-a5e0ccca5238	3214	Zreče
00050000-558d-62d9-4295-63b5cf5b343e	4209	Žabnica
00050000-558d-62d9-aaec-42ac2e5cf8de	3310	Žalec
00050000-558d-62d9-cda4-bf8bfbabb5cd	4228	Železniki
00050000-558d-62d9-b7da-d9012abb44c1	2287	Žetale
00050000-558d-62d9-ed29-a1bee33c203f	4226	Žiri
00050000-558d-62d9-5105-470375abd537	4274	Žirovnica
00050000-558d-62d9-438a-5a648b6bce1a	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8316663)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 8316474)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8316552)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8316675)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8316795)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8316844)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558d-62db-7c21-505cd9fed2bd	00080000-558d-62db-474f-9e5d8b9a6ba0	0900	AK
00190000-558d-62db-733a-c9ca79646958	00080000-558d-62da-5804-5c11080cf73e	0987	A
00190000-558d-62db-c80c-575e0241d48e	00080000-558d-62da-1ff1-16fdcc42e115	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8316978)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 8316704)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558d-62da-a42d-ea4a76904e78	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558d-62da-9ab9-8758ffb6b91f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558d-62da-d0c1-67cef79ea9d7	0003	Kazinska	t	84	Kazinska dvorana
00220000-558d-62da-3d08-103646ac1eb0	0004	Mali oder	t	24	Mali oder 
00220000-558d-62da-4948-a93bba4149b5	0005	Komorni oder	t	15	Komorni oder
00220000-558d-62da-1c5e-c39fc6ebe667	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558d-62da-1358-fab7c007cc18	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8316648)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8316638)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8316833)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8316772)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8316346)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2878 (class 0 OID 8316714)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8316384)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558d-62d8-0124-8c0d001bef9c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558d-62d8-feb8-22877b5e42c5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558d-62d8-c460-ccf7ef02411a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558d-62d8-9cb4-b5e101828ce5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558d-62d8-9c45-8c7e652a45b9	planer	Planer dogodkov v koledarju	t
00020000-558d-62d8-b09b-a021f974888b	kadrovska	Kadrovska služba	t
00020000-558d-62d8-e967-4410775cd758	arhivar	Ažuriranje arhivalij	t
00020000-558d-62d9-6267-c4da7627512e	igralec	Igralec	t
00020000-558d-62d9-12c5-c199497243a4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558d-62db-65cb-a70c97fb73a5	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8316368)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558d-62d9-a12f-ac043040c68b	00020000-558d-62d8-c460-ccf7ef02411a
00010000-558d-62d9-4414-3867440eec87	00020000-558d-62d8-c460-ccf7ef02411a
00010000-558d-62db-d897-bc092e4a36c2	00020000-558d-62db-65cb-a70c97fb73a5
\.


--
-- TOC entry 2880 (class 0 OID 8316728)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8316669)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8316619)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8317022)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558d-62d9-b42f-017b862dd6c2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558d-62d9-87f6-874f3550e3b3	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558d-62d9-7177-6a61781eb783	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558d-62d9-904c-220cc310b953	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558d-62d9-99de-d45687036d25	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8317014)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558d-62d9-e847-632bbf429935	00230000-558d-62d9-904c-220cc310b953	popa
00240000-558d-62d9-d522-373383f59187	00230000-558d-62d9-904c-220cc310b953	oseba
00240000-558d-62d9-5174-30f6621f018f	00230000-558d-62d9-87f6-874f3550e3b3	prostor
00240000-558d-62d9-85b2-2bf18ca6da1f	00230000-558d-62d9-904c-220cc310b953	besedilo
00240000-558d-62d9-810d-9b66d9e227cb	00230000-558d-62d9-904c-220cc310b953	uprizoritev
00240000-558d-62d9-4820-37cbdaabb198	00230000-558d-62d9-904c-220cc310b953	funkcija
00240000-558d-62d9-103d-bf2ef3f62232	00230000-558d-62d9-904c-220cc310b953	tipfunkcije
00240000-558d-62d9-1c42-29df6b590122	00230000-558d-62d9-904c-220cc310b953	alternacija
00240000-558d-62d9-2b19-77d52c8bd86c	00230000-558d-62d9-b42f-017b862dd6c2	pogodba
00240000-558d-62d9-361b-4da7e08f9da7	00230000-558d-62d9-904c-220cc310b953	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8317009)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8316782)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558d-62db-4d4e-3d19fd674147	000e0000-558d-62db-24da-f6b6218907d5	00080000-558d-62da-e87b-4fde36e2a040	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558d-62db-f1f4-078053f6e2e7	000e0000-558d-62db-24da-f6b6218907d5	00080000-558d-62da-e87b-4fde36e2a040	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558d-62db-4a15-6dfe490d8e54	000e0000-558d-62db-24da-f6b6218907d5	00080000-558d-62db-e0ae-b66f41f2f387	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8316446)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8316625)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558d-62db-baa9-b6c26a103da1	00180000-558d-62db-32b4-d4ab9f960de0	000c0000-558d-62db-ff9a-ee1e2b11eae8	00090000-558d-62db-68ae-01ce34126b7e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-62db-3fd0-f5b966e4b92a	00180000-558d-62db-32b4-d4ab9f960de0	000c0000-558d-62db-4db6-de66aedbbbe7	00090000-558d-62db-9180-6ab63898aae9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-62db-7fc7-b0efa6fdbfa9	00180000-558d-62db-32b4-d4ab9f960de0	000c0000-558d-62db-5bf9-e60dbaf7ff6b	00090000-558d-62db-bcfb-68c9dee8007e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-62db-ad11-28bb450cf025	00180000-558d-62db-32b4-d4ab9f960de0	000c0000-558d-62db-340f-53f7eed2597a	00090000-558d-62db-617d-0f8b884a6479	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-62db-9e8d-9055386f770c	00180000-558d-62db-32b4-d4ab9f960de0	000c0000-558d-62db-a51b-e83a372d6706	00090000-558d-62db-8a6a-2872c22910e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-62db-8a40-02c69e5c0c5a	00180000-558d-62db-5969-0d837b636273	\N	00090000-558d-62db-8a6a-2872c22910e2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8316822)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558d-62d9-2af8-14e7a13a063b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558d-62d9-23be-a98c9f290432	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558d-62d9-6cf2-4325d08411d7	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558d-62d9-99d0-243eb9da4912	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558d-62d9-3ad8-de0f5e6cd98d	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558d-62d9-40b3-9e74105c5880	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558d-62d9-43ed-70f2c777e7b6	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558d-62d9-ae25-91e43704ffc6	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558d-62d9-cd64-c65348a071b7	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558d-62d9-30ba-22bf21e27839	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558d-62d9-b25d-52f1c3d3fd07	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558d-62d9-3f04-d6144017275a	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558d-62d9-7e10-ae3e57d84fdc	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558d-62d9-ab8b-98cb97980fea	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558d-62d9-a1cb-27d77e0a902b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558d-62d9-097f-e235a1e7ce27	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8316991)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558d-62d9-4d9e-7262b8d25c81	01	Velika predstava	f	1.00	1.00
002b0000-558d-62d9-911b-1b5b4645912f	02	Mala predstava	f	0.50	0.50
002b0000-558d-62d9-2cc2-28c18dc9c44c	03	Mala koprodukcija	t	0.40	1.00
002b0000-558d-62d9-e841-0cf359c23e1c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558d-62d9-4734-74746bf4f28b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8316509)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8316355)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558d-62d9-4414-3867440eec87	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROIdQ7BgG7nFWMryhvA2YbnOQjNZTazNa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558d-62db-69e2-928dec3ea309	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558d-62db-a9ea-8c1a685fcfd7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558d-62db-10bf-114b02954ecc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558d-62db-b9cd-2d560f6d6d7f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558d-62db-0f29-79a85a607c44	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558d-62db-f5a8-2695f71981d0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558d-62db-a132-ef623b9bcc4e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558d-62db-3bfe-1aefa0407210	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558d-62db-5861-8a9f0e7e064f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558d-62db-d897-bc092e4a36c2	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558d-62d9-a12f-ac043040c68b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8316879)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-558d-62db-8c21-be5cab3e1e2f	00160000-558d-62da-6177-81f586b1519c	00150000-558d-62d9-c447-deab5078b096	00140000-558d-62d8-19e1-850a7167db47	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-558d-62da-4948-a93bba4149b5
000e0000-558d-62db-24da-f6b6218907d5	00160000-558d-62da-008f-c2c3450d7d19	00150000-558d-62d9-80b8-c0e712ea4fe1	00140000-558d-62d8-48b8-19dbfff5bf49	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-558d-62da-1c5e-c39fc6ebe667
000e0000-558d-62db-3b99-72b951fc1ead	\N	00150000-558d-62d9-80b8-c0e712ea4fe1	00140000-558d-62d8-48b8-19dbfff5bf49	00190000-558d-62db-733a-c9ca79646958	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-558d-62da-4948-a93bba4149b5
000e0000-558d-62db-ad33-4e390339e276	\N	00150000-558d-62d9-80b8-c0e712ea4fe1	00140000-558d-62d8-48b8-19dbfff5bf49	00190000-558d-62db-733a-c9ca79646958	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-558d-62da-4948-a93bba4149b5
\.


--
-- TOC entry 2861 (class 0 OID 8316571)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558d-62db-263a-940c56b55d4f	000e0000-558d-62db-24da-f6b6218907d5	1	
00200000-558d-62db-d1d5-9d121946d10f	000e0000-558d-62db-24da-f6b6218907d5	2	
\.


--
-- TOC entry 2876 (class 0 OID 8316696)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8316765)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8316603)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8316869)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558d-62d8-19e1-850a7167db47	01	Drama	drama (SURS 01)
00140000-558d-62d8-7e4a-395b17d3c6dc	02	Opera	opera (SURS 02)
00140000-558d-62d8-9b45-c252444ce34a	03	Balet	balet (SURS 03)
00140000-558d-62d8-675d-608eb754b7bd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558d-62d8-44f0-da449ca8fcaa	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558d-62d8-48b8-19dbfff5bf49	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558d-62d8-699a-546623608ddd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8316755)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558d-62d9-b653-b594d15b48cf	01	Opera	opera
00150000-558d-62d9-a5b5-7e6c67bbce1a	02	Opereta	opereta
00150000-558d-62d9-7740-b6727d956936	03	Balet	balet
00150000-558d-62d9-fafa-76d0ebccce06	04	Plesne prireditve	plesne prireditve
00150000-558d-62d9-f704-bb65076ccf99	05	Lutkovno gledališče	lutkovno gledališče
00150000-558d-62d9-4f40-0b30f52d006f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558d-62d9-aeb9-c1ca371f61cd	07	Biografska drama	biografska drama
00150000-558d-62d9-c447-deab5078b096	08	Komedija	komedija
00150000-558d-62d9-d85f-d2f8b42750b4	09	Črna komedija	črna komedija
00150000-558d-62d9-e02a-d0a910d68536	10	E-igra	E-igra
00150000-558d-62d9-80b8-c0e712ea4fe1	11	Kriminalka	kriminalka
00150000-558d-62d9-2820-b9c9ffc073dc	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8316409)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8316926)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8316916)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8316821)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8316593)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8316618)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8317007)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8316535)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8316973)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8316751)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8316569)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8316612)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8316549)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 8316661)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8316688)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8316507)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8316418)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2442 (class 2606 OID 8316442)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8316398)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8316383)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8316694)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8316727)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8316864)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8316471)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8316495)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8316667)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8316485)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8316556)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8316679)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8316803)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8316849)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8316989)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 8316711)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8316652)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8316643)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8316843)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8316779)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8316354)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8316718)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8316372)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8316392)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8316736)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8316674)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8316624)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8317031)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8317019)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8317013)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8316792)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8316451)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8316634)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8316832)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8317001)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8316520)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8316367)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8316895)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8316578)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8316702)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8316770)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8316607)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8316877)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8316763)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8316600)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8316793)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8316794)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8316473)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2396 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2398 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2540 (class 1259 OID 8316695)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8316681)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8316680)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8316579)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8316752)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8316754)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8316753)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8316551)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8316550)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8316866)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8316867)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8316868)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2410 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2411 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2602 (class 1259 OID 8316900)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8316897)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8316901)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8316899)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8316898)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8316522)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8316521)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 8316445)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8316719)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8316613)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8316399)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8316400)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8316739)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8316738)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8316737)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8316557)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8316559)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8316558)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8317021)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8316647)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8316645)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8316644)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8316646)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8316373)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8316374)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8316703)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8316668)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8316780)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8316781)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8316977)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8316974)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8316975)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8316976)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8316487)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8316486)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8316488)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8316804)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8316805)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8316930)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8316931)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8316928)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8316929)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8316771)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8316656)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8316655)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8316653)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8316654)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8316918)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8316917)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8316990)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8316570)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8317008)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8316420)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8316419)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8316452)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8316453)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8316637)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8316636)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8316635)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2405 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2406 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2492 (class 1259 OID 8316602)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8316598)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8316595)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8316596)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8316594)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8316599)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8316597)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8316472)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8316536)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8316538)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8316537)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8316539)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8316662)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8316865)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8316896)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8316443)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8316444)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8316764)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8317032)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8316508)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8317020)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8316713)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8316712)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8316927)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8316496)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8316878)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8316850)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8316851)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8316393)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8316601)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8317168)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8317153)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8317158)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8317178)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8317148)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8317173)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8317163)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8317323)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8317328)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8317083)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8317263)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8317258)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8317253)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8317143)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8317293)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8317303)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8317298)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8317118)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8317113)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8317243)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8317348)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8317353)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8317358)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8317378)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8317363)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8317383)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8317373)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8317368)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8317108)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8317103)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8317068)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8317063)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8317273)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8317183)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8317043)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8317048)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8317288)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8317283)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8317278)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8317123)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8317133)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8317128)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8317448)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8317218)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8317208)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8317203)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8317213)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8317033)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8317038)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8317268)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8317248)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8317313)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8317318)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8317433)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8317418)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8317423)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8317428)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8317093)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8317088)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8317098)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8317333)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8317338)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8317408)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8317413)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8317398)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8317403)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8317308)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8317238)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8317233)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8317223)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8317228)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8317393)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8317388)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8317438)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8317138)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8317343)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8317443)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8317058)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8317053)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8317073)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8317078)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8317198)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8317193)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8317188)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-26 16:34:04 CEST

--
-- PostgreSQL database dump complete
--

