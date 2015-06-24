--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-24 11:26:08 CEST

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
-- TOC entry 183 (class 1259 OID 8127850)
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
-- TOC entry 230 (class 1259 OID 8128372)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
    oseba_id uuid,
    koprodukcija_id uuid,
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
-- TOC entry 229 (class 1259 OID 8128355)
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
-- TOC entry 222 (class 1259 OID 8128258)
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
-- TOC entry 197 (class 1259 OID 8128029)
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
-- TOC entry 200 (class 1259 OID 8128063)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8128456)
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
-- TOC entry 192 (class 1259 OID 8127972)
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
-- TOC entry 231 (class 1259 OID 8128386)
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
-- TOC entry 216 (class 1259 OID 8128189)
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
-- TOC entry 195 (class 1259 OID 8128009)
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
-- TOC entry 199 (class 1259 OID 8128057)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8127989)
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
-- TOC entry 205 (class 1259 OID 8128106)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8128131)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8127946)
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
-- TOC entry 184 (class 1259 OID 8127859)
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
-- TOC entry 185 (class 1259 OID 8127870)
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
-- TOC entry 180 (class 1259 OID 8127824)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8127843)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8128138)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8128169)
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
-- TOC entry 226 (class 1259 OID 8128304)
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
-- TOC entry 187 (class 1259 OID 8127903)
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
-- TOC entry 189 (class 1259 OID 8127938)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8128112)
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
-- TOC entry 188 (class 1259 OID 8127923)
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
-- TOC entry 194 (class 1259 OID 8128001)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8128124)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8128244)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    nasstrosek boolean,
    lastnasredstva numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    drugijavni numeric(15,2) DEFAULT NULL::numeric,
    avtorskih numeric(15,2) DEFAULT NULL::numeric,
    tantieme numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 225 (class 1259 OID 8128296)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8128432)
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
-- TOC entry 212 (class 1259 OID 8128153)
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
-- TOC entry 204 (class 1259 OID 8128097)
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
-- TOC entry 203 (class 1259 OID 8128087)
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
-- TOC entry 224 (class 1259 OID 8128285)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8128221)
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
-- TOC entry 177 (class 1259 OID 8127795)
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
-- TOC entry 176 (class 1259 OID 8127793)
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
-- TOC entry 213 (class 1259 OID 8128163)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8127833)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8127817)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8128177)
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
-- TOC entry 207 (class 1259 OID 8128118)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8128068)
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
-- TOC entry 237 (class 1259 OID 8128476)
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
-- TOC entry 236 (class 1259 OID 8128468)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8128463)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8128231)
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
-- TOC entry 186 (class 1259 OID 8127895)
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
-- TOC entry 202 (class 1259 OID 8128074)
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
-- TOC entry 223 (class 1259 OID 8128274)
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
-- TOC entry 233 (class 1259 OID 8128445)
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
-- TOC entry 191 (class 1259 OID 8127958)
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
-- TOC entry 178 (class 1259 OID 8127804)
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
-- TOC entry 228 (class 1259 OID 8128331)
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
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 8128020)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8128145)
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
-- TOC entry 218 (class 1259 OID 8128214)
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
-- TOC entry 198 (class 1259 OID 8128052)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8128321)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8128204)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8127798)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8127850)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8128372)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558a-77b0-847c-352c2d84bb4d	000d0000-558a-77b0-9d1c-6c6fa6fcf87d	\N	00090000-558a-77af-24b9-bda8207325b1	\N	000b0000-558a-77af-af96-8b4f20540913	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-77b0-58b6-1fe7e0513f51	000d0000-558a-77b0-c575-df6617078a1c	\N	00090000-558a-77af-2186-942a8c215a68	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-77b0-6768-9c98af80523d	000d0000-558a-77b0-8d31-76de0e17b6e8	\N	00090000-558a-77af-3175-79c11fad0e2c	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-77b0-0145-071cbbcb2676	000d0000-558a-77b0-85a9-b0b09eeb819a	\N	00090000-558a-77af-f628-ca130c8216c3	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-77b0-3cc9-c7dc18c4151d	000d0000-558a-77b0-dac8-6bdf6d1cc259	\N	00090000-558a-77af-c286-60b4f5d679b5	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-77b0-69e9-fc0b3d194de6	000d0000-558a-77b0-d51e-58e2f8affe53	\N	00090000-558a-77af-2186-942a8c215a68	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8128355)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8128258)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558a-77af-cf4a-8ed6ec64351a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558a-77af-076e-87f97475a008	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558a-77af-5e74-f91f08084d5f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8128029)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558a-77b0-2b66-eaf87a93115a	\N	\N	00200000-558a-77af-cf3a-d3ea368814dd	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558a-77b0-642c-41185b053ac6	\N	\N	00200000-558a-77af-a9fc-09d1ad7eff60	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558a-77b0-e570-496aa88b468a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558a-77b0-bb6b-0e3ebe67c214	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558a-77b0-0416-ee0b4d6d8961	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8128063)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8128456)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8127972)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558a-77ad-50cb-164cdb50cc3d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558a-77ad-91f6-f2ac7c7cd2a0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558a-77ad-718b-77ed8211abed	AL	ALB	008	Albania 	Albanija	\N
00040000-558a-77ad-7c72-a171ff8a9f04	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558a-77ad-7640-cf4435bc0717	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558a-77ad-0d46-33061de20a12	AD	AND	020	Andorra 	Andora	\N
00040000-558a-77ad-c279-e16f0efe0f62	AO	AGO	024	Angola 	Angola	\N
00040000-558a-77ad-8fd3-5ef2860ab4a8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558a-77ad-2233-1b17e8aae6de	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558a-77ad-767b-6bd30a9531ba	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-77ad-2f68-e7115cd3d67e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558a-77ad-3cdb-834d1587f41a	AM	ARM	051	Armenia 	Armenija	\N
00040000-558a-77ad-2ab6-e472ad2b1fcc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558a-77ad-b99b-af7f5849ffb0	AU	AUS	036	Australia 	Avstralija	\N
00040000-558a-77ad-6b33-36ee6d14101d	AT	AUT	040	Austria 	Avstrija	\N
00040000-558a-77ad-dbe4-51b7aa6aedb8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558a-77ad-1fb4-a8b194d1a483	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558a-77ad-4476-a72237e8ae4a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558a-77ad-b41a-e59d134c86a2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558a-77ad-279e-7da96638588a	BB	BRB	052	Barbados 	Barbados	\N
00040000-558a-77ad-19e1-6443f73ce421	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558a-77ad-30ea-09cac2a7d2e8	BE	BEL	056	Belgium 	Belgija	\N
00040000-558a-77ad-b7ae-a88c99d62d77	BZ	BLZ	084	Belize 	Belize	\N
00040000-558a-77ad-c10e-f39f3dd3f57f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558a-77ad-247d-c338f9ec5fb5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558a-77ad-6525-050907473737	BT	BTN	064	Bhutan 	Butan	\N
00040000-558a-77ad-8f63-97ba5a999a35	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558a-77ad-cac4-45b3d1721aa8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558a-77ad-8132-64c5ca8f4973	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558a-77ad-97e9-5f34d42a9c07	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558a-77ad-8340-ae554b2c5541	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558a-77ad-651a-b6d217ed0268	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558a-77ad-d0ff-3478d3783e64	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558a-77ad-17ff-e83da1170486	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558a-77ad-4e3c-cc73efa4c1b2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558a-77ad-8da2-a58d8b7d9203	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558a-77ad-bdd9-9a89cef0cbdd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558a-77ad-7659-394073b92bf4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558a-77ad-dbe0-b36f9d8353ad	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558a-77ad-e95e-82f97771a787	CA	CAN	124	Canada 	Kanada	\N
00040000-558a-77ad-0749-8b262e3c4390	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558a-77ad-f6ba-c3e752149803	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558a-77ad-03e3-a344573d5b5d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558a-77ad-7711-5276329fcc1a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558a-77ad-6f47-344de47c6767	CL	CHL	152	Chile 	Čile	\N
00040000-558a-77ad-59a3-cb4806da03b1	CN	CHN	156	China 	Kitajska	\N
00040000-558a-77ad-5377-8c4d831fb2b6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558a-77ad-1d9b-76f5a5910b75	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558a-77ad-b127-c2b0c2d452c6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558a-77ad-9697-d3c3a4d8d8f3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558a-77ad-ad11-7f46aff31cca	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558a-77ad-3fc5-9e8071f6a4b1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558a-77ad-eeb2-029a010fb22f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558a-77ad-e2db-32b557f16fe3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558a-77ad-67ae-1ebc893af463	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558a-77ad-6367-c6877736a1bf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558a-77ad-fe07-409861bfbdf1	CU	CUB	192	Cuba 	Kuba	\N
00040000-558a-77ad-b7eb-239ac396d4e0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558a-77ad-f725-404819977525	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558a-77ad-af41-6c7b76dc685f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558a-77ad-04d3-57dd3dadbf3b	DK	DNK	208	Denmark 	Danska	\N
00040000-558a-77ad-25c4-4082ad61c4e0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558a-77ad-ca00-3513036f3972	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-77ad-838f-af214695024a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558a-77ad-9846-8258ba24d410	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558a-77ad-c90e-702378daa4d3	EG	EGY	818	Egypt 	Egipt	\N
00040000-558a-77ad-ecc0-db766c677254	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558a-77ad-5a43-6e143d248c9b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558a-77ad-089b-c446ec83a40c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558a-77ad-d943-81bc9106ddba	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558a-77ad-5335-89993e0ae45c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558a-77ad-1568-ed97e89cd295	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558a-77ad-5a4f-270a7dacf1f9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558a-77ad-1582-e9ac04326985	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558a-77ad-9b0a-936946af5a1f	FI	FIN	246	Finland 	Finska	\N
00040000-558a-77ad-21f9-c06cd34950cd	FR	FRA	250	France 	Francija	\N
00040000-558a-77ad-02e6-a7ca2662ed95	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558a-77ad-2ae5-95325e17277f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558a-77ad-e0e2-4ee87a9d4f7a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558a-77ad-12ea-b0275b74920d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558a-77ad-47f2-3e5cb2766944	GA	GAB	266	Gabon 	Gabon	\N
00040000-558a-77ad-537e-e4edbea63919	GM	GMB	270	Gambia 	Gambija	\N
00040000-558a-77ad-0aeb-61c23fdbcfef	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558a-77ad-97f3-b747ab89a8cd	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558a-77ad-2613-d0ce9054036f	GH	GHA	288	Ghana 	Gana	\N
00040000-558a-77ad-5171-aec28097736d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558a-77ad-3860-b925fbc0f78e	GR	GRC	300	Greece 	Grčija	\N
00040000-558a-77ad-b31d-71441ae6fe50	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558a-77ad-0276-0c976f07adb2	GD	GRD	308	Grenada 	Grenada	\N
00040000-558a-77ad-8dfc-1aed3c37dc84	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558a-77ad-2e0a-8c7cc0e41f18	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558a-77ad-79d3-8c468019b846	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558a-77ad-1d92-2f69ff5a309b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558a-77ad-29d8-8de0e9bfe4fb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558a-77ad-3dbb-48fba7e9910a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558a-77ad-0430-53decd2a53e1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558a-77ad-bfb7-38a899f4e115	HT	HTI	332	Haiti 	Haiti	\N
00040000-558a-77ad-5261-66e7ee049111	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558a-77ad-e591-72e3ce92990a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558a-77ad-7769-890268448eef	HN	HND	340	Honduras 	Honduras	\N
00040000-558a-77ad-e625-7da5c52fef82	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558a-77ad-8a30-e1064d86954c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558a-77ad-bfce-7c54d284cbd9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558a-77ad-720e-52ee13054052	IN	IND	356	India 	Indija	\N
00040000-558a-77ad-3bcc-8a60f3bad687	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558a-77ad-9bfd-d1202cc9172b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558a-77ad-b5b7-b7063780c9e2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558a-77ad-8d65-7b86014a62be	IE	IRL	372	Ireland 	Irska	\N
00040000-558a-77ad-5828-51cf13aaed6b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558a-77ad-1807-e8854c4a312e	IL	ISR	376	Israel 	Izrael	\N
00040000-558a-77ad-d7f3-c78150fefe44	IT	ITA	380	Italy 	Italija	\N
00040000-558a-77ad-dc16-74eea4a60024	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558a-77ad-668a-80e031f9b51e	JP	JPN	392	Japan 	Japonska	\N
00040000-558a-77ad-ae83-8c084a56c5f6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558a-77ad-27f8-dad0f2f35943	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558a-77ad-1279-f8f393ca022a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558a-77ad-6b14-a70c5fca2a33	KE	KEN	404	Kenya 	Kenija	\N
00040000-558a-77ad-c1d5-a5924143b67e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558a-77ad-79d3-88aecc1897e1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558a-77ad-9cc5-1c18db7dbb80	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558a-77ad-90fc-5fb3524b93d6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558a-77ad-7642-508793d50d05	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558a-77ad-261e-a7f77330fcac	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558a-77ad-f2b7-ed49a93aef3a	LV	LVA	428	Latvia 	Latvija	\N
00040000-558a-77ad-545c-4096ec25711e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558a-77ad-f595-064f39a0ca00	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558a-77ad-55cf-175300318dc9	LR	LBR	430	Liberia 	Liberija	\N
00040000-558a-77ad-81ae-bb712a7d93bb	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558a-77ad-b1d8-d34de0745656	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558a-77ad-3e4e-3e9e3162a3c6	LT	LTU	440	Lithuania 	Litva	\N
00040000-558a-77ad-807a-78bf8ece0695	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558a-77ad-b6ee-f52f2cd82dea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558a-77ad-71c1-c052aab8516a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558a-77ad-f785-5cf28608f5bf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558a-77ad-b06d-736ac82f04d0	MW	MWI	454	Malawi 	Malavi	\N
00040000-558a-77ad-63d9-316e17955058	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558a-77ad-5f62-d603379f3701	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558a-77ad-ce3f-ac47fa0c0abd	ML	MLI	466	Mali 	Mali	\N
00040000-558a-77ad-64b6-0181ef3e8750	MT	MLT	470	Malta 	Malta	\N
00040000-558a-77ad-ed2a-7754d8761ff5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558a-77ad-2b84-431110d45900	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558a-77ad-8a42-d1bea6154765	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558a-77ad-2277-e558c05f73b4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558a-77ad-c394-35cb8bcfc27e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558a-77ad-abee-4e68a41e416b	MX	MEX	484	Mexico 	Mehika	\N
00040000-558a-77ad-f38a-37835d66f44c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558a-77ad-7ed8-90c8e9cf7321	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558a-77ad-df7e-7d74adc14870	MC	MCO	492	Monaco 	Monako	\N
00040000-558a-77ad-b4d3-67f9bfdd74e7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558a-77ad-f9dc-96825ff01927	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558a-77ad-55a3-eabe84c0a5e0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558a-77ad-005d-8b0ec6a6f127	MA	MAR	504	Morocco 	Maroko	\N
00040000-558a-77ad-c046-ee03fc4481ea	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558a-77ad-fb9a-0fef88194685	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558a-77ad-e4cf-b4479f3cc1d1	NA	NAM	516	Namibia 	Namibija	\N
00040000-558a-77ad-6ab1-2857047f032d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558a-77ad-2b38-1117a718d122	NP	NPL	524	Nepal 	Nepal	\N
00040000-558a-77ad-b4ca-d56e2f7a777d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558a-77ad-c538-60aa038c63a5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558a-77ad-d423-3770ebc5441c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558a-77ad-988c-4c4678629bb9	NE	NER	562	Niger 	Niger 	\N
00040000-558a-77ad-31f2-95a81fea87a2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558a-77ad-5921-b1b043a4cd3e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558a-77ad-3671-428201dff11e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558a-77ad-9116-86c88f7985d2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558a-77ad-cf51-7cbd1b5e479f	NO	NOR	578	Norway 	Norveška	\N
00040000-558a-77ad-1bd2-3a177280bba0	OM	OMN	512	Oman 	Oman	\N
00040000-558a-77ad-7de5-afae7e6afb84	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558a-77ad-7961-2e52f55dc493	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558a-77ad-ea65-1b8491a300d2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558a-77ad-0a61-8dba34532b0b	PA	PAN	591	Panama 	Panama	\N
00040000-558a-77ad-cd5d-31aa0d38e782	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558a-77ad-8db5-01e7fbeabc1a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558a-77ad-ae97-01cc3c986b41	PE	PER	604	Peru 	Peru	\N
00040000-558a-77ad-c820-52100b91b37a	PH	PHL	608	Philippines 	Filipini	\N
00040000-558a-77ad-15f2-6c5b3e5932ef	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558a-77ad-f9e0-a849b8c57bd6	PL	POL	616	Poland 	Poljska	\N
00040000-558a-77ad-37ae-c1222d284916	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558a-77ad-045b-468afbef4c9b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558a-77ad-c947-6ecd980f5c99	QA	QAT	634	Qatar 	Katar	\N
00040000-558a-77ad-a320-e87f86ff9d41	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558a-77ad-cf76-f05b5c447cc9	RO	ROU	642	Romania 	Romunija	\N
00040000-558a-77ad-783e-bee5a1ed3786	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558a-77ad-d0b3-ae3583aebea9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558a-77ad-f280-cd70bf528013	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558a-77ad-067b-18a19128ffb7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558a-77ad-18e0-303e2c5782d1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558a-77ad-5ff7-84d9e5226f46	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558a-77ad-0b9f-2c70c2fc012c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558a-77ad-7796-51eecd5f6863	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558a-77ad-5273-8288ba73c268	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558a-77ad-7003-bc8d1a1ea0e5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558a-77ad-9c68-99b373f2945a	SM	SMR	674	San Marino 	San Marino	\N
00040000-558a-77ad-13ba-f89b727d64c3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558a-77ad-0a6f-f3408d369dc7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558a-77ad-f3c7-9f8ef00cb6e4	SN	SEN	686	Senegal 	Senegal	\N
00040000-558a-77ad-76c2-c8604e0322c7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558a-77ad-66c0-f2e66914787c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558a-77ad-4712-08ac51fdbfbe	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558a-77ad-be9c-807c98e36dbb	SG	SGP	702	Singapore 	Singapur	\N
00040000-558a-77ad-53ff-463660bdb756	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558a-77ad-6005-8adae32b43be	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558a-77ad-f46f-fa744250924a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558a-77ad-217e-56e696b365e0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558a-77ad-ab59-231d6dd005a3	SO	SOM	706	Somalia 	Somalija	\N
00040000-558a-77ad-e292-c35dfcec631d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558a-77ad-bbd7-9b4e010da60b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558a-77ad-8902-89209cae3f38	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558a-77ad-2533-0a65fbca4986	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558a-77ad-099c-9e20051a291f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558a-77ad-356f-bcae25d3e086	SD	SDN	729	Sudan 	Sudan	\N
00040000-558a-77ad-10d9-7d5cf0c25e85	SR	SUR	740	Suriname 	Surinam	\N
00040000-558a-77ad-149c-d568d1572dea	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558a-77ad-f958-12fa91ece66d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558a-77ad-96d0-266352eab297	SE	SWE	752	Sweden 	Švedska	\N
00040000-558a-77ad-9881-2e7cb26f0c72	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558a-77ad-a5d3-e31682580b61	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558a-77ad-8e9f-d1eb9fd84ed6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558a-77ad-31c9-e22c138bf4d5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558a-77ad-b451-590dd6915b85	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558a-77ad-8fda-7f8fb752a1bd	TH	THA	764	Thailand 	Tajska	\N
00040000-558a-77ad-08ee-1ffff8b9b5c3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558a-77ad-8cb4-26e551856cfe	TG	TGO	768	Togo 	Togo	\N
00040000-558a-77ad-1672-8a27e4e37801	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558a-77ad-4abf-75096701ffec	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558a-77ad-b712-982631a8ec40	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558a-77ad-41d8-e7514f1eb1c3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558a-77ad-e2a9-97c7f2ca6251	TR	TUR	792	Turkey 	Turčija	\N
00040000-558a-77ad-19ab-bf3dcac3177d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558a-77ad-9eea-1f58bf5103af	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-77ad-ccb5-4401c72c08bf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558a-77ad-c553-e1acaa89a5c9	UG	UGA	800	Uganda 	Uganda	\N
00040000-558a-77ad-96e5-8896a40e914e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558a-77ad-8fd5-4ffad56bb473	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558a-77ad-37a5-81c73990628e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558a-77ad-1ef2-c48330af2c32	US	USA	840	United States 	Združene države Amerike	\N
00040000-558a-77ad-b747-13d082aea45a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558a-77ad-2fe6-225a1c2c6d75	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558a-77ad-00ee-793e32ca1ba0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558a-77ad-6770-5347b057f57b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558a-77ad-c907-2787d3f5b7a4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558a-77ad-f9a1-f36f6d720268	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558a-77ad-9d73-612a4de9d3c5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-77ad-53e4-8fc9310a7c8b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558a-77ad-3936-306347bceac1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558a-77ad-9f33-2e9b3a1ff6b1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558a-77ad-907a-2b0a9c2dfb79	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558a-77ad-10dc-8e928abba0ef	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558a-77ad-bf8b-c98aae9384e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8128386)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8128189)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558a-77b0-7ea1-5302f129b0b5	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558a-77ae-274d-1d58ad5cabe1
000d0000-558a-77b0-9d1c-6c6fa6fcf87d	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-77ae-274d-1d58ad5cabe1
000d0000-558a-77b0-c575-df6617078a1c	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558a-77ae-144b-e5d17543e0a8
000d0000-558a-77b0-8d31-76de0e17b6e8	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558a-77ae-415e-8211a57b1d20
000d0000-558a-77b0-85a9-b0b09eeb819a	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558a-77ae-415e-8211a57b1d20
000d0000-558a-77b0-dac8-6bdf6d1cc259	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558a-77ae-415e-8211a57b1d20
000d0000-558a-77b0-d51e-58e2f8affe53	000e0000-558a-77af-9aea-fca7b6adf7cf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-77ae-274d-1d58ad5cabe1
\.


--
-- TOC entry 2866 (class 0 OID 8128009)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8128057)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8127989)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558a-77af-06bd-ecbca542b853	00080000-558a-77af-6aef-83eb5e278443	00090000-558a-77af-24b9-bda8207325b1	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8128106)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8128131)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8127946)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558a-77ae-9028-c6dc72470ac0	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558a-77ae-0bcf-049c51bab901	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558a-77ae-faa4-2bf5fa9beaea	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558a-77ae-c2ba-007824df3a0b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558a-77ae-47ea-daf122a69cb9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558a-77ae-ed99-2edfbc14324c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558a-77ae-c33f-b4edbb92db1f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558a-77ae-5e75-d56ace72cbf9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-77ae-c1b1-d1a4c3d8a392	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-77ae-f8d9-9f872557cc30	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558a-77ae-1cfd-21d31db398be	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558a-77ae-3c5c-fd4d5af9df38	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558a-77ae-6cb6-e41c270cda85	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558a-77af-6665-415c9521ec43	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558a-77af-bf23-403f68d09f9e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558a-77af-08c7-5d8f60d9dd5f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558a-77af-cf24-3a6cb1b8b6e9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558a-77af-692f-bd50f497272d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558a-77af-5b9a-d92114d6938c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8127859)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558a-77af-e8ae-40818fb90894	00000000-558a-77af-bf23-403f68d09f9e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558a-77af-98b4-55450be6be49	00000000-558a-77af-bf23-403f68d09f9e	00010000-558a-77ae-b82a-c5121ca12376	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558a-77af-3371-e234a89695b4	00000000-558a-77af-08c7-5d8f60d9dd5f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8127870)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558a-77af-ea1e-cc3298d7563b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558a-77af-f628-ca130c8216c3	00010000-558a-77af-641a-23857e7e406d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558a-77af-3175-79c11fad0e2c	00010000-558a-77af-e76c-4537737af50e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558a-77af-e046-c1f652e86896	00010000-558a-77af-8324-a0c1c4a21c00	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558a-77af-f62d-92a3dcf06b96	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558a-77af-137d-95dbeaece581	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558a-77af-ab39-12c62af53c54	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558a-77af-47de-21bf8e238f4c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558a-77af-24b9-bda8207325b1	00010000-558a-77af-3e00-d58999afcc79	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558a-77af-2186-942a8c215a68	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558a-77af-d532-8badc765131a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558a-77af-c286-60b4f5d679b5	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558a-77af-05fc-f08501818224	00010000-558a-77af-9023-622b4787b582	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8127824)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558a-77ad-bec9-1857309428db	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558a-77ad-819c-d2c79ec09719	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558a-77ad-5eeb-adb28b4bb2f7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558a-77ad-f3f6-0c3016c44bda	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558a-77ad-8869-360caf61cfd2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558a-77ad-9f54-1743241ea1b8	Abonma-read	Abonma - branje	f
00030000-558a-77ad-8a76-9138bf91572f	Abonma-write	Abonma - spreminjanje	f
00030000-558a-77ad-3ac1-9ef24120851b	Alternacija-read	Alternacija - branje	f
00030000-558a-77ad-a39a-c0fee4d74062	Alternacija-write	Alternacija - spreminjanje	f
00030000-558a-77ad-131e-e10de632cff9	Arhivalija-read	Arhivalija - branje	f
00030000-558a-77ad-bc6a-4ecf9feef43e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558a-77ad-11c0-a0c407431ecc	Besedilo-read	Besedilo - branje	f
00030000-558a-77ad-b95f-eb45d951fdf7	Besedilo-write	Besedilo - spreminjanje	f
00030000-558a-77ad-227e-b4ccb039fc37	DogodekIzven-read	DogodekIzven - branje	f
00030000-558a-77ad-968b-6ea622e8eab1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558a-77ad-3446-f9be3cfdab84	Dogodek-read	Dogodek - branje	f
00030000-558a-77ad-bb4d-862c44f59e48	Dogodek-write	Dogodek - spreminjanje	f
00030000-558a-77ad-b154-54ce0a9b709d	DrugiVir-read	DrugiVir - branje	f
00030000-558a-77ad-1c6e-430ff635e53b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558a-77ad-1c21-586485824852	Drzava-read	Drzava - branje	f
00030000-558a-77ad-cebd-a7d1939e6078	Drzava-write	Drzava - spreminjanje	f
00030000-558a-77ad-26c5-27ac53775843	Funkcija-read	Funkcija - branje	f
00030000-558a-77ad-5674-7415f231e9db	Funkcija-write	Funkcija - spreminjanje	f
00030000-558a-77ad-fc0b-e3abcca74caa	Gostovanje-read	Gostovanje - branje	f
00030000-558a-77ad-d89f-d47a078ae597	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558a-77ad-d962-bf7f0b90d25a	Gostujoca-read	Gostujoca - branje	f
00030000-558a-77ad-948e-acb4faf7b01e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558a-77ad-4ec0-983f21c140c3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558a-77ad-e57a-c75733939d95	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558a-77ad-1244-1afe31ab483f	Kupec-read	Kupec - branje	f
00030000-558a-77ad-a2b9-a99f4b9e6ed0	Kupec-write	Kupec - spreminjanje	f
00030000-558a-77ad-1932-d46f77443fb2	NacinPlacina-read	NacinPlacina - branje	f
00030000-558a-77ad-5c58-52def1497346	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558a-77ad-ec53-692ba9773cad	Option-read	Option - branje	f
00030000-558a-77ad-ff85-36d7bc3bb057	Option-write	Option - spreminjanje	f
00030000-558a-77ad-f822-3372e8fd5374	OptionValue-read	OptionValue - branje	f
00030000-558a-77ad-29bd-aed0ebd08a27	OptionValue-write	OptionValue - spreminjanje	f
00030000-558a-77ad-2218-67703ba8c43c	Oseba-read	Oseba - branje	f
00030000-558a-77ad-ce78-4041f501d1f2	Oseba-write	Oseba - spreminjanje	f
00030000-558a-77ad-7619-262dca1a76ec	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558a-77ad-e525-d84474bce7c0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558a-77ad-f1fb-c0fda048cc2f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558a-77ad-2ce2-f31b12424342	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558a-77ad-d8c8-9ddd6e1b3ee1	Pogodba-read	Pogodba - branje	f
00030000-558a-77ad-6d99-ca5deabb262b	Pogodba-write	Pogodba - spreminjanje	f
00030000-558a-77ad-bfa6-c6c29c1070a8	Popa-read	Popa - branje	f
00030000-558a-77ad-5cc6-3ffbaf34f482	Popa-write	Popa - spreminjanje	f
00030000-558a-77ad-b4f9-8d3443299daa	Posta-read	Posta - branje	f
00030000-558a-77ad-235d-9c1a05e26044	Posta-write	Posta - spreminjanje	f
00030000-558a-77ad-1218-1adb81d44508	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558a-77ad-4a11-c28e2018fe20	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558a-77ad-c7b0-686f03047028	PostniNaslov-read	PostniNaslov - branje	f
00030000-558a-77ad-98a1-74d7912108a9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558a-77ad-c2ae-38cdb8b1b271	Predstava-read	Predstava - branje	f
00030000-558a-77ad-91aa-05015e1697eb	Predstava-write	Predstava - spreminjanje	f
00030000-558a-77ad-1c6b-ba200b30e5ee	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558a-77ad-e521-71aa00685e0d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558a-77ad-378b-c96075a9fdf1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558a-77ad-73f7-8ebfa6fee0ed	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558a-77ad-d22e-790305ddef33	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558a-77ad-19ab-1bbf2aed0e28	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558a-77ad-b74d-1d20092f2a27	ProgramDela-read	ProgramDela - branje	f
00030000-558a-77ad-708b-4d4fd35cec24	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558a-77ad-e25e-864c858df262	ProgramFestival-read	ProgramFestival - branje	f
00030000-558a-77ad-0a57-de9b324e7166	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558a-77ad-e1b5-27cd6572fde4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558a-77ad-e29f-eb0d61fe4e9a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558a-77ad-030e-3add81b73c85	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558a-77ad-1d24-5b3607a1efb7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558a-77ad-65e8-5b76af05a317	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558a-77ad-f868-5d57a0de8b62	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558a-77ad-049a-58a382c08cf7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558a-77ad-7bc1-bae974ead36c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558a-77ad-ac05-ac2ea8ad6f05	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558a-77ad-f4d3-1a8ed84ee5ee	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558a-77ad-b56c-c22c7db7a845	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558a-77ad-bd51-6e9740eafb80	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558a-77ad-c640-38e425a28b2d	ProgramRazno-read	ProgramRazno - branje	f
00030000-558a-77ad-a849-6caa04b4ce0c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558a-77ad-70a2-add3d6de9c67	Prostor-read	Prostor - branje	f
00030000-558a-77ad-1153-8fe72f53dcf4	Prostor-write	Prostor - spreminjanje	f
00030000-558a-77ad-5599-38c41982039c	Racun-read	Racun - branje	f
00030000-558a-77ad-6e43-c3844762cfc5	Racun-write	Racun - spreminjanje	f
00030000-558a-77ad-07dc-6db02cf84c09	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558a-77ad-0f6a-8fecd9852f9e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558a-77ad-a98d-6a1ff63fb13e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558a-77ad-623e-027691589a30	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558a-77ad-e658-416eec9b0802	Rekvizit-read	Rekvizit - branje	f
00030000-558a-77ad-034f-366460e15812	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558a-77ad-b584-c07e2531cde9	Revizija-read	Revizija - branje	f
00030000-558a-77ad-ad5f-223dd1d02383	Revizija-write	Revizija - spreminjanje	f
00030000-558a-77ad-6704-06a15502d547	Rezervacija-read	Rezervacija - branje	f
00030000-558a-77ad-fc12-78c1969adfee	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558a-77ad-cd8c-0699abff105d	SedezniRed-read	SedezniRed - branje	f
00030000-558a-77ad-536f-6ebb80c0e55e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558a-77ad-385b-f03121f0f79c	Sedez-read	Sedez - branje	f
00030000-558a-77ad-c768-8a50d5cd93eb	Sedez-write	Sedez - spreminjanje	f
00030000-558a-77ad-cc0c-eff5d6c07274	Sezona-read	Sezona - branje	f
00030000-558a-77ad-ca3f-c1d9441bfa14	Sezona-write	Sezona - spreminjanje	f
00030000-558a-77ad-89bd-d9b85da3f5b7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558a-77ad-ca04-fee8dc5b2520	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558a-77ad-3ef3-763393eb998a	Stevilcenje-read	Stevilcenje - branje	f
00030000-558a-77ad-dbf8-3cc4c001630f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558a-77ad-47dc-05bfcc175a19	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558a-77ad-8c20-67349b03e9e6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558a-77ad-03f1-08119a5f3a9f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558a-77ad-4238-199bcf627ecb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558a-77ad-9ff9-7fae72022f24	Telefonska-read	Telefonska - branje	f
00030000-558a-77ad-4839-511300c57fb0	Telefonska-write	Telefonska - spreminjanje	f
00030000-558a-77ad-ba04-be9742e88d24	TerminStoritve-read	TerminStoritve - branje	f
00030000-558a-77ad-503f-ce027443a116	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558a-77ad-18a2-52242e264adb	TipFunkcije-read	TipFunkcije - branje	f
00030000-558a-77ad-d5d8-9cbec9d82e3c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558a-77ad-f84d-4d3b002d08f9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558a-77ad-795d-4dae55ada168	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558a-77ad-d94d-ae133cf58771	Trr-read	Trr - branje	f
00030000-558a-77ad-d863-fa51a7258e11	Trr-write	Trr - spreminjanje	f
00030000-558a-77ad-d529-9a69eb7dd40c	Uprizoritev-read	Uprizoritev - branje	f
00030000-558a-77ad-e46b-7f6badaef003	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558a-77ad-01cb-45a749e1c87a	Vaja-read	Vaja - branje	f
00030000-558a-77ad-7081-bc5da2403ed4	Vaja-write	Vaja - spreminjanje	f
00030000-558a-77ad-af3e-c520518aa001	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558a-77ad-68ff-096f745947a4	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558a-77ad-da3f-e690f4cba299	Zaposlitev-read	Zaposlitev - branje	f
00030000-558a-77ad-82e6-b174d4c5ebc2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558a-77ad-dd99-e04f25aa3664	Zasedenost-read	Zasedenost - branje	f
00030000-558a-77ad-1221-0f3abdcfe9db	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558a-77ad-e895-3c90a38d8725	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558a-77ad-1ce7-85d3917cc9bf	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558a-77ad-ef86-67a4b4fa2a63	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558a-77ad-54cc-3c8b935e0d1c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8127843)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558a-77ad-4f60-f1c217717e7c	00030000-558a-77ad-819c-d2c79ec09719
00020000-558a-77ad-b49b-2d00a5b87aac	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-8a76-9138bf91572f
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-3ac1-9ef24120851b
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-a39a-c0fee4d74062
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-f3f6-0c3016c44bda
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-bb4d-862c44f59e48
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-cebd-a7d1939e6078
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-26c5-27ac53775843
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-5674-7415f231e9db
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-d89f-d47a078ae597
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-948e-acb4faf7b01e
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-4ec0-983f21c140c3
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-e57a-c75733939d95
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-2218-67703ba8c43c
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-ce78-4041f501d1f2
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-5cc6-3ffbaf34f482
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-235d-9c1a05e26044
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-c7b0-686f03047028
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-98a1-74d7912108a9
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-91aa-05015e1697eb
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-d22e-790305ddef33
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-19ab-1bbf2aed0e28
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-1153-8fe72f53dcf4
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-623e-027691589a30
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-034f-366460e15812
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-ca3f-c1d9441bfa14
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-18a2-52242e264adb
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-d529-9a69eb7dd40c
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-e46b-7f6badaef003
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-01cb-45a749e1c87a
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-7081-bc5da2403ed4
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-dd99-e04f25aa3664
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-1221-0f3abdcfe9db
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77ae-085a-8540759a1810	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-4ec0-983f21c140c3
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-e57a-c75733939d95
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-2218-67703ba8c43c
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-ce78-4041f501d1f2
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-c7b0-686f03047028
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-98a1-74d7912108a9
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-9ff9-7fae72022f24
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-4839-511300c57fb0
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-d94d-ae133cf58771
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-d863-fa51a7258e11
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-da3f-e690f4cba299
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-82e6-b174d4c5ebc2
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77ae-cb04-87fdc174f895	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-3ac1-9ef24120851b
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-bc6a-4ecf9feef43e
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-11c0-a0c407431ecc
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-227e-b4ccb039fc37
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-26c5-27ac53775843
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-4ec0-983f21c140c3
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-2218-67703ba8c43c
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-d22e-790305ddef33
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-18a2-52242e264adb
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-01cb-45a749e1c87a
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-dd99-e04f25aa3664
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77ae-8a67-c65d7e0bef86	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-8a76-9138bf91572f
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-a39a-c0fee4d74062
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-18a2-52242e264adb
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77ae-8d3b-c8ef5da6a820	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-1c21-586485824852
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-ba04-be9742e88d24
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-5eeb-adb28b4bb2f7
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-18a2-52242e264adb
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77ae-0f65-79fd9132e18e	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-bec9-1857309428db
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-819c-d2c79ec09719
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-5eeb-adb28b4bb2f7
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f3f6-0c3016c44bda
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-8869-360caf61cfd2
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-9f54-1743241ea1b8
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-8a76-9138bf91572f
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-3ac1-9ef24120851b
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-a39a-c0fee4d74062
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-131e-e10de632cff9
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-bc6a-4ecf9feef43e
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-11c0-a0c407431ecc
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-b95f-eb45d951fdf7
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-227e-b4ccb039fc37
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-968b-6ea622e8eab1
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-3446-f9be3cfdab84
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-bb4d-862c44f59e48
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1c21-586485824852
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-cebd-a7d1939e6078
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-26c5-27ac53775843
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-5674-7415f231e9db
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-fc0b-e3abcca74caa
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d89f-d47a078ae597
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d962-bf7f0b90d25a
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-948e-acb4faf7b01e
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-4ec0-983f21c140c3
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e57a-c75733939d95
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1244-1afe31ab483f
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-a2b9-a99f4b9e6ed0
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1932-d46f77443fb2
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-5c58-52def1497346
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ec53-692ba9773cad
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ff85-36d7bc3bb057
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f822-3372e8fd5374
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-29bd-aed0ebd08a27
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-2218-67703ba8c43c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ce78-4041f501d1f2
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-7619-262dca1a76ec
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e525-d84474bce7c0
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f1fb-c0fda048cc2f
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-2ce2-f31b12424342
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d8c8-9ddd6e1b3ee1
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-6d99-ca5deabb262b
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-bfa6-c6c29c1070a8
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-5cc6-3ffbaf34f482
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-b4f9-8d3443299daa
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-235d-9c1a05e26044
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1218-1adb81d44508
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-4a11-c28e2018fe20
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-c7b0-686f03047028
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-98a1-74d7912108a9
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-c2ae-38cdb8b1b271
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-91aa-05015e1697eb
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1c6b-ba200b30e5ee
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e521-71aa00685e0d
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-378b-c96075a9fdf1
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-73f7-8ebfa6fee0ed
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d22e-790305ddef33
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-19ab-1bbf2aed0e28
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-b74d-1d20092f2a27
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-708b-4d4fd35cec24
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e25e-864c858df262
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-0a57-de9b324e7166
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e1b5-27cd6572fde4
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e29f-eb0d61fe4e9a
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-030e-3add81b73c85
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1d24-5b3607a1efb7
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-65e8-5b76af05a317
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f868-5d57a0de8b62
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-049a-58a382c08cf7
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-7bc1-bae974ead36c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ac05-ac2ea8ad6f05
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f4d3-1a8ed84ee5ee
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-b56c-c22c7db7a845
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-bd51-6e9740eafb80
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-c640-38e425a28b2d
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-a849-6caa04b4ce0c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-70a2-add3d6de9c67
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1153-8fe72f53dcf4
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-5599-38c41982039c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-6e43-c3844762cfc5
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-07dc-6db02cf84c09
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-0f6a-8fecd9852f9e
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-a98d-6a1ff63fb13e
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-623e-027691589a30
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e658-416eec9b0802
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-034f-366460e15812
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-b584-c07e2531cde9
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ad5f-223dd1d02383
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-6704-06a15502d547
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-fc12-78c1969adfee
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-cd8c-0699abff105d
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-536f-6ebb80c0e55e
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-385b-f03121f0f79c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-c768-8a50d5cd93eb
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-cc0c-eff5d6c07274
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ca3f-c1d9441bfa14
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-89bd-d9b85da3f5b7
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ca04-fee8dc5b2520
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-3ef3-763393eb998a
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-dbf8-3cc4c001630f
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-47dc-05bfcc175a19
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-8c20-67349b03e9e6
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-03f1-08119a5f3a9f
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-4238-199bcf627ecb
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-9ff9-7fae72022f24
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-4839-511300c57fb0
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ba04-be9742e88d24
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-503f-ce027443a116
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-18a2-52242e264adb
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d5d8-9cbec9d82e3c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-f84d-4d3b002d08f9
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-795d-4dae55ada168
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d94d-ae133cf58771
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d863-fa51a7258e11
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-d529-9a69eb7dd40c
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e46b-7f6badaef003
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-01cb-45a749e1c87a
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-7081-bc5da2403ed4
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-af3e-c520518aa001
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-68ff-096f745947a4
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-da3f-e690f4cba299
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-82e6-b174d4c5ebc2
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-dd99-e04f25aa3664
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1221-0f3abdcfe9db
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-e895-3c90a38d8725
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-1ce7-85d3917cc9bf
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-ef86-67a4b4fa2a63
00020000-558a-77af-bf12-0ee0ced1d411	00030000-558a-77ad-54cc-3c8b935e0d1c
\.


--
-- TOC entry 2881 (class 0 OID 8128138)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8128169)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8128304)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558a-77af-af96-8b4f20540913	00090000-558a-77af-ea1e-cc3298d7563b	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8127903)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558a-77af-6aef-83eb5e278443	00040000-558a-77ad-50cb-164cdb50cc3d	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-77af-bf7f-2044a908d10f	00040000-558a-77ad-50cb-164cdb50cc3d	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-77af-37fe-7cf6b72455f6	00040000-558a-77ad-50cb-164cdb50cc3d	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-77af-b105-68516138894a	00040000-558a-77ad-50cb-164cdb50cc3d	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-77af-def5-3efec3f6453e	00040000-558a-77ad-50cb-164cdb50cc3d	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-77af-c4a8-8959241aa2b5	00040000-558a-77ad-f46f-fa744250924a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8127938)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558a-77ae-8a29-71099ab2709e	8341	Adlešiči
00050000-558a-77ae-abe6-c7a301bac7ed	5270	Ajdovščina
00050000-558a-77ae-be53-68e0675cdb86	6280	Ankaran/Ancarano
00050000-558a-77ae-6d7c-917d71bd155b	9253	Apače
00050000-558a-77ae-4a0b-62ed418b5118	8253	Artiče
00050000-558a-77ae-e149-aada3a1939db	4275	Begunje na Gorenjskem
00050000-558a-77ae-ba64-69a342e963fa	1382	Begunje pri Cerknici
00050000-558a-77ae-c8f9-d2df24f26153	9231	Beltinci
00050000-558a-77ae-96dc-732df5751a04	2234	Benedikt
00050000-558a-77ae-80f1-69051f7080ff	2345	Bistrica ob Dravi
00050000-558a-77ae-4065-1fb1ec74b5df	3256	Bistrica ob Sotli
00050000-558a-77ae-e7bd-480719f0bb2c	8259	Bizeljsko
00050000-558a-77ae-59ce-3c6ed19f925f	1223	Blagovica
00050000-558a-77ae-44b4-c3a126dbb81c	8283	Blanca
00050000-558a-77ae-be74-db61c0008f95	4260	Bled
00050000-558a-77ae-7bf8-689ad747ce75	4273	Blejska Dobrava
00050000-558a-77ae-732b-a7f4bbc0eb70	9265	Bodonci
00050000-558a-77ae-9258-879f081c2a3c	9222	Bogojina
00050000-558a-77ae-d97e-081a8b32e931	4263	Bohinjska Bela
00050000-558a-77ae-fc9b-40ad54733840	4264	Bohinjska Bistrica
00050000-558a-77ae-10be-3aa94b60f61f	4265	Bohinjsko jezero
00050000-558a-77ae-a0cf-f356ab65d395	1353	Borovnica
00050000-558a-77ae-a641-31c8e07f2b29	8294	Boštanj
00050000-558a-77ae-6f75-acc78d626be2	5230	Bovec
00050000-558a-77ae-6ca6-3024d8996e45	5295	Branik
00050000-558a-77ae-d55e-cd929cbb081d	3314	Braslovče
00050000-558a-77ae-c791-cd779676a2e6	5223	Breginj
00050000-558a-77ae-2bde-ad5c63994a99	8280	Brestanica
00050000-558a-77ae-0cc2-2552a0226753	2354	Bresternica
00050000-558a-77ae-8fda-9a7566e3c2ac	4243	Brezje
00050000-558a-77ae-c27a-ac886fa5e1f0	1351	Brezovica pri Ljubljani
00050000-558a-77ae-f1df-263cafd73b4c	8250	Brežice
00050000-558a-77ae-a16a-0ce789447518	4210	Brnik - Aerodrom
00050000-558a-77ae-d981-8461fb978330	8321	Brusnice
00050000-558a-77ae-a6d4-0e41b552ec5d	3255	Buče
00050000-558a-77ae-d4b5-caa903567d30	8276	Bučka 
00050000-558a-77ae-77f9-f247ae8f1703	9261	Cankova
00050000-558a-77ae-7276-7476af42efab	3000	Celje 
00050000-558a-77ae-26ac-956a8ff08f07	3001	Celje - poštni predali
00050000-558a-77ae-6532-162b9e35e419	4207	Cerklje na Gorenjskem
00050000-558a-77ae-b880-9998b5805c0e	8263	Cerklje ob Krki
00050000-558a-77ae-a0c7-4e4c67433615	1380	Cerknica
00050000-558a-77ae-baba-03f9f2b03b03	5282	Cerkno
00050000-558a-77ae-7709-53d1a51735fc	2236	Cerkvenjak
00050000-558a-77ae-1d37-0ee28eb634d2	2215	Ceršak
00050000-558a-77ae-6369-77aadb750790	2326	Cirkovce
00050000-558a-77ae-f931-4cad4093920f	2282	Cirkulane
00050000-558a-77ae-c483-ef524105da04	5273	Col
00050000-558a-77ae-326b-0a86f4b9d648	8251	Čatež ob Savi
00050000-558a-77ae-5900-bc699a1b9901	1413	Čemšenik
00050000-558a-77ae-96a5-a7e551387c0a	5253	Čepovan
00050000-558a-77ae-c1ca-df4c6ff6af92	9232	Črenšovci
00050000-558a-77ae-4144-5d1d6ce2bdb9	2393	Črna na Koroškem
00050000-558a-77ae-07df-6db0283616a5	6275	Črni Kal
00050000-558a-77ae-7e3c-b135bc8db292	5274	Črni Vrh nad Idrijo
00050000-558a-77ae-480a-83b90a91140f	5262	Črniče
00050000-558a-77ae-4dfc-57fdca1f42a7	8340	Črnomelj
00050000-558a-77ae-1dee-5beaf12f5dd4	6271	Dekani
00050000-558a-77ae-2d05-af7d8751b953	5210	Deskle
00050000-558a-77ae-a032-7938088b45de	2253	Destrnik
00050000-558a-77ae-daf5-ea0d029eedb7	6215	Divača
00050000-558a-77ae-fa9d-e0039d3c9fd8	1233	Dob
00050000-558a-77ae-88d5-ce3e178a99ee	3224	Dobje pri Planini
00050000-558a-77ae-ef3b-7e2697c1ccff	8257	Dobova
00050000-558a-77ae-102a-52f44ad20227	1423	Dobovec
00050000-558a-77ae-99f0-6d7e489d4045	5263	Dobravlje
00050000-558a-77ae-f5ee-3562158984cc	3204	Dobrna
00050000-558a-77ae-dfe4-f46cc7947ffb	8211	Dobrnič
00050000-558a-77ae-e637-0c80fd35005e	1356	Dobrova
00050000-558a-77ae-69fb-bb2f547bdf8d	9223	Dobrovnik/Dobronak 
00050000-558a-77ae-e3bc-f0a9d62e99bf	5212	Dobrovo v Brdih
00050000-558a-77ae-5bb9-839ac2d1dab1	1431	Dol pri Hrastniku
00050000-558a-77ae-58b1-3bf35afd42c5	1262	Dol pri Ljubljani
00050000-558a-77ae-3369-1e1cd3dbacc2	1273	Dole pri Litiji
00050000-558a-77ae-201d-c6e18b5aed46	1331	Dolenja vas
00050000-558a-77ae-82dc-fa2b8d43678d	8350	Dolenjske Toplice
00050000-558a-77ae-c556-e4a595d100fe	1230	Domžale
00050000-558a-77ae-0c0d-08b4fa13312d	2252	Dornava
00050000-558a-77ae-96ed-931352e9dce3	5294	Dornberk
00050000-558a-77ae-6972-38c17a7948b1	1319	Draga
00050000-558a-77ae-684e-537abcc1f821	8343	Dragatuš
00050000-558a-77ae-2e7f-4f8110c718e1	3222	Dramlje
00050000-558a-77ae-3db4-38b8281b60ee	2370	Dravograd
00050000-558a-77ae-e77d-d24f779bf553	4203	Duplje
00050000-558a-77ae-247e-c927c492700e	6221	Dutovlje
00050000-558a-77ae-7ef2-b0a69d360021	8361	Dvor
00050000-558a-77ae-d3f3-cf38229407c1	2343	Fala
00050000-558a-77ae-3ba3-88d82bbbe96c	9208	Fokovci
00050000-558a-77ae-8ee7-9f417fb9b709	2313	Fram
00050000-558a-77ae-e4f5-7779cedd06f6	3213	Frankolovo
00050000-558a-77ae-fb59-eec19e82912b	1274	Gabrovka
00050000-558a-77ae-7651-3d56883db6d9	8254	Globoko
00050000-558a-77ae-1b28-c918e2688416	5275	Godovič
00050000-558a-77ae-4027-01672e9cf179	4204	Golnik
00050000-558a-77ae-6444-ac3acf01641f	3303	Gomilsko
00050000-558a-77ae-72c8-4ae35a098564	4224	Gorenja vas
00050000-558a-77ae-4197-94f865330acd	3263	Gorica pri Slivnici
00050000-558a-77ae-fd64-2c5d8251b24b	2272	Gorišnica
00050000-558a-77ae-ab5a-281aed793100	9250	Gornja Radgona
00050000-558a-77ae-d7da-d0ed63c101a4	3342	Gornji Grad
00050000-558a-77ae-f78a-f787a0a7e5ac	4282	Gozd Martuljek
00050000-558a-77ae-c71c-734cd8a2954d	6272	Gračišče
00050000-558a-77ae-2272-107c456cb587	9264	Grad
00050000-558a-77ae-b019-e3ac53469d23	8332	Gradac
00050000-558a-77ae-35b9-f76e6ace75f3	1384	Grahovo
00050000-558a-77ae-17bf-cf494e355b3a	5242	Grahovo ob Bači
00050000-558a-77ae-8321-c6d5f87ef1af	5251	Grgar
00050000-558a-77ae-7ed4-33fb49b9b58a	3302	Griže
00050000-558a-77ae-a844-f6b52e135bbf	3231	Grobelno
00050000-558a-77ae-91cc-2339cc2d8765	1290	Grosuplje
00050000-558a-77ae-34df-456ee7bf12f3	2288	Hajdina
00050000-558a-77ae-d64e-7be40e821a79	8362	Hinje
00050000-558a-77ae-c33a-f38e1aad43fa	2311	Hoče
00050000-558a-77ae-2800-387df1200f18	9205	Hodoš/Hodos
00050000-558a-77ae-b78a-7e356989f609	1354	Horjul
00050000-558a-77ae-1279-c80c38e25050	1372	Hotedršica
00050000-558a-77ae-c140-d3596bdbf2db	1430	Hrastnik
00050000-558a-77ae-8cce-45a718f49d49	6225	Hruševje
00050000-558a-77ae-396b-326766a2205b	4276	Hrušica
00050000-558a-77ae-7b22-fcb106d8ea46	5280	Idrija
00050000-558a-77ae-66ed-1afb0ca2cc88	1292	Ig
00050000-558a-77ae-b92b-65ccc11ac7ff	6250	Ilirska Bistrica
00050000-558a-77ae-17d9-27ae49e6d782	6251	Ilirska Bistrica-Trnovo
00050000-558a-77ae-7338-88281f4229e1	1295	Ivančna Gorica
00050000-558a-77ae-c666-15560054fb08	2259	Ivanjkovci
00050000-558a-77ae-d977-68891d345080	1411	Izlake
00050000-558a-77ae-4f63-1427e2048f3e	6310	Izola/Isola
00050000-558a-77ae-6a83-0a7b10c4e7a9	2222	Jakobski Dol
00050000-558a-77ae-0ecf-0faafb1445c5	2221	Jarenina
00050000-558a-77ae-6caf-bf63e12c8d39	6254	Jelšane
00050000-558a-77ae-c031-9a416a43590a	4270	Jesenice
00050000-558a-77ae-10b7-4a4747a10d4d	8261	Jesenice na Dolenjskem
00050000-558a-77ae-2fc4-ba88a9cc1f57	3273	Jurklošter
00050000-558a-77ae-464c-a8352e25ccbc	2223	Jurovski Dol
00050000-558a-77ae-1ea8-f0aa7bafd293	2256	Juršinci
00050000-558a-77ae-d4a9-d9df4bbc2718	5214	Kal nad Kanalom
00050000-558a-77ae-9d4c-66f6f9fa5d66	3233	Kalobje
00050000-558a-77ae-86c2-247564b81b39	4246	Kamna Gorica
00050000-558a-77ae-bdde-daa703feef2c	2351	Kamnica
00050000-558a-77ae-ce6f-b0dcc250cb94	1241	Kamnik
00050000-558a-77ae-b501-7a71a0a1d50b	5213	Kanal
00050000-558a-77ae-b3ff-09af762f43d8	8258	Kapele
00050000-558a-77ae-2553-f2622c105ab0	2362	Kapla
00050000-558a-77ae-0590-977464238e24	2325	Kidričevo
00050000-558a-77ae-c31d-f3e58a774789	1412	Kisovec
00050000-558a-77ae-7e59-6660f5a73c3a	6253	Knežak
00050000-558a-77ae-bc19-cc86d52e11a2	5222	Kobarid
00050000-558a-77ae-db8f-9a9ea9a0d288	9227	Kobilje
00050000-558a-77ae-7cc6-c86db8da92e8	1330	Kočevje
00050000-558a-77ae-9f50-a3c1df6c4e08	1338	Kočevska Reka
00050000-558a-77ae-747e-1ef7077c26bf	2276	Kog
00050000-558a-77ae-16e8-76c963913f4a	5211	Kojsko
00050000-558a-77ae-10e5-cbf9e63a419b	6223	Komen
00050000-558a-77ae-f7d5-e2c8f80c6178	1218	Komenda
00050000-558a-77ae-4918-254ba4ef0b2d	6000	Koper/Capodistria 
00050000-558a-77ae-ddf7-8f9dbae312b4	6001	Koper/Capodistria - poštni predali
00050000-558a-77ae-e91c-5395cbec5252	8282	Koprivnica
00050000-558a-77ae-df39-970e828e0c84	5296	Kostanjevica na Krasu
00050000-558a-77ae-13e3-6faa64aaad0c	8311	Kostanjevica na Krki
00050000-558a-77ae-5583-2c70dfa3f458	1336	Kostel
00050000-558a-77ae-fa0c-00e62ab4d07f	6256	Košana
00050000-558a-77ae-e714-bde091cacde3	2394	Kotlje
00050000-558a-77ae-5a99-cec11f67adae	6240	Kozina
00050000-558a-77ae-c1df-ae8f3250810f	3260	Kozje
00050000-558a-77ae-4ca9-bf6625f4c92a	4000	Kranj 
00050000-558a-77ae-2719-6e939788ad45	4001	Kranj - poštni predali
00050000-558a-77ae-c0c4-aede97012500	4280	Kranjska Gora
00050000-558a-77ae-2386-d983b62ee48f	1281	Kresnice
00050000-558a-77ae-5235-78c45c318f71	4294	Križe
00050000-558a-77ae-dbb0-67d615d7b5ef	9206	Križevci
00050000-558a-77ae-c578-5805a7d13003	9242	Križevci pri Ljutomeru
00050000-558a-77ae-7b60-b8e72e3e51d9	1301	Krka
00050000-558a-77ae-0f31-373084a39348	8296	Krmelj
00050000-558a-77ae-d905-488db152f371	4245	Kropa
00050000-558a-77ae-e476-1c4d3e3109fd	8262	Krška vas
00050000-558a-77ae-ce8d-facd5b3b6f77	8270	Krško
00050000-558a-77ae-e124-8b2b9ebe31c9	9263	Kuzma
00050000-558a-77ae-57c8-b43f809ac388	2318	Laporje
00050000-558a-77ae-fe96-2cf9e70b759d	3270	Laško
00050000-558a-77ae-8b61-994074b98ce7	1219	Laze v Tuhinju
00050000-558a-77ae-e16d-8b18067dd9fe	2230	Lenart v Slovenskih goricah
00050000-558a-77ae-2716-26b884986b17	9220	Lendava/Lendva
00050000-558a-77ae-dfda-26ded628d04c	4248	Lesce
00050000-558a-77ae-19de-43cf50beb91a	3261	Lesično
00050000-558a-77ae-0f2e-bfd9fcc1b675	8273	Leskovec pri Krškem
00050000-558a-77ae-32a7-bada1872fa19	2372	Libeliče
00050000-558a-77ae-2882-e5e52779890d	2341	Limbuš
00050000-558a-77ae-cf09-4859be687222	1270	Litija
00050000-558a-77ae-147d-96aea2d84b4c	3202	Ljubečna
00050000-558a-77ae-8e1e-73b0742fe67f	1000	Ljubljana 
00050000-558a-77ae-1543-856d06a3cfc1	1001	Ljubljana - poštni predali
00050000-558a-77ae-1aa3-8c4cc9ca1340	1231	Ljubljana - Črnuče
00050000-558a-77ae-5534-21b99e63fcdd	1261	Ljubljana - Dobrunje
00050000-558a-77ae-eba9-083d88355cf9	1260	Ljubljana - Polje
00050000-558a-77ae-f625-9967bed1ec61	1210	Ljubljana - Šentvid
00050000-558a-77ae-cf23-c052739e0be0	1211	Ljubljana - Šmartno
00050000-558a-77ae-0cbf-207dee7d3c76	3333	Ljubno ob Savinji
00050000-558a-77ae-a201-f3c1b443282a	9240	Ljutomer
00050000-558a-77ae-d38e-f301747933d0	3215	Loče
00050000-558a-77ae-7cf3-0e3559434f31	5231	Log pod Mangartom
00050000-558a-77ae-1564-ad4e80a07ab4	1358	Log pri Brezovici
00050000-558a-77ae-303e-6aff12a2d5d3	1370	Logatec
00050000-558a-77ae-399e-d2739aa35564	1371	Logatec
00050000-558a-77ae-6659-f8515acc79a0	1434	Loka pri Zidanem Mostu
00050000-558a-77ae-8bea-6b7d91c32ab0	3223	Loka pri Žusmu
00050000-558a-77ae-aa94-ad9aa9ab402a	6219	Lokev
00050000-558a-77ae-9746-a1bb61c87ef5	1318	Loški Potok
00050000-558a-77ae-ca0e-f5219ff8ef2a	2324	Lovrenc na Dravskem polju
00050000-558a-77ae-8a02-3b332ad61b57	2344	Lovrenc na Pohorju
00050000-558a-77ae-b53e-3bd85c8d4831	3334	Luče
00050000-558a-77ae-c205-2408071876c0	1225	Lukovica
00050000-558a-77ae-53fe-dc5fcf9b0ea3	9202	Mačkovci
00050000-558a-77ae-4d5c-b9cf9f1cc6d7	2322	Majšperk
00050000-558a-77ae-0640-a1e08b6392ce	2321	Makole
00050000-558a-77ae-f13f-4dc207615bd7	9243	Mala Nedelja
00050000-558a-77ae-638e-35bafd680aba	2229	Malečnik
00050000-558a-77ae-1bb1-d11a3478e46a	6273	Marezige
00050000-558a-77ae-8e68-88a34db8d740	2000	Maribor 
00050000-558a-77ae-745e-a3a9b833a79f	2001	Maribor - poštni predali
00050000-558a-77ae-062f-2ce4c7125f8d	2206	Marjeta na Dravskem polju
00050000-558a-77ae-0993-55794cb2ac29	2281	Markovci
00050000-558a-77ae-0c6d-b1b9c720a622	9221	Martjanci
00050000-558a-77ae-15df-61f522b1a3aa	6242	Materija
00050000-558a-77ae-75ee-110632955c4d	4211	Mavčiče
00050000-558a-77ae-e576-8b34cd95ccce	1215	Medvode
00050000-558a-77ae-7be3-ec831bb6a00c	1234	Mengeš
00050000-558a-77ae-cbda-ebb6674ecd36	8330	Metlika
00050000-558a-77ae-c888-4a57e14c3e77	2392	Mežica
00050000-558a-77ae-3095-230febba2244	2204	Miklavž na Dravskem polju
00050000-558a-77ae-2bd6-ef4a6ec1cffb	2275	Miklavž pri Ormožu
00050000-558a-77ae-cf03-ea372146d18f	5291	Miren
00050000-558a-77ae-19b3-79bf3c374991	8233	Mirna
00050000-558a-77ae-ba61-f000fcda9ca8	8216	Mirna Peč
00050000-558a-77ae-c8c4-f916bfd6723c	2382	Mislinja
00050000-558a-77ae-aef7-76715eb02b4a	4281	Mojstrana
00050000-558a-77ae-77b5-9d4578f5943e	8230	Mokronog
00050000-558a-77ae-d179-16654095453a	1251	Moravče
00050000-558a-77ae-5425-984cc1494851	9226	Moravske Toplice
00050000-558a-77ae-e2d0-975f471a2073	5216	Most na Soči
00050000-558a-77ae-7280-1e33f84acfea	1221	Motnik
00050000-558a-77ae-af81-29f6377acc9f	3330	Mozirje
00050000-558a-77ae-07a0-22bc1b5b1fba	9000	Murska Sobota 
00050000-558a-77ae-3d6a-6aa969509faf	9001	Murska Sobota - poštni predali
00050000-558a-77ae-3101-35ea36c71bc0	2366	Muta
00050000-558a-77ae-5d5a-b25ac110f3e8	4202	Naklo
00050000-558a-77ae-02fb-fc8a1563f51e	3331	Nazarje
00050000-558a-77ae-893d-03a7275ca9a7	1357	Notranje Gorice
00050000-558a-77ae-77f3-10d106eced7d	3203	Nova Cerkev
00050000-558a-77ae-59c4-8dc580f87bcd	5000	Nova Gorica 
00050000-558a-77ae-6128-54378650bc6d	5001	Nova Gorica - poštni predali
00050000-558a-77ae-8aa3-f6f3ddd7e061	1385	Nova vas
00050000-558a-77ae-0ccd-b05aebc8f3a2	8000	Novo mesto
00050000-558a-77ae-e64b-97e8f37bf9e0	8001	Novo mesto - poštni predali
00050000-558a-77ae-0d6c-1f1b7cb3ba26	6243	Obrov
00050000-558a-77ae-1569-52b5bae5621a	9233	Odranci
00050000-558a-77ae-37c1-a7601571414c	2317	Oplotnica
00050000-558a-77ae-11e6-23101dc36873	2312	Orehova vas
00050000-558a-77ae-bc1c-8b5bedba9867	2270	Ormož
00050000-558a-77ae-1d7e-2f7df81b4c63	1316	Ortnek
00050000-558a-77ae-0e5b-55ba9adbba0b	1337	Osilnica
00050000-558a-77ae-a640-2e99729c092d	8222	Otočec
00050000-558a-77ae-437b-1f0f0c8f5e61	2361	Ožbalt
00050000-558a-77ae-fefc-e69d92c104c3	2231	Pernica
00050000-558a-77ae-18e0-8ad59a873694	2211	Pesnica pri Mariboru
00050000-558a-77ae-df1d-89390db48647	9203	Petrovci
00050000-558a-77ae-7bcf-cbbcba614ba6	3301	Petrovče
00050000-558a-77ae-fd09-3862c535918d	6330	Piran/Pirano
00050000-558a-77ae-1743-8304c164adbf	8255	Pišece
00050000-558a-77ae-cc0b-8c01c626224c	6257	Pivka
00050000-558a-77ae-fd83-a7c11b87afe3	6232	Planina
00050000-558a-77ae-4ec7-f4b9a17c0a7e	3225	Planina pri Sevnici
00050000-558a-77ae-4726-d386a0067027	6276	Pobegi
00050000-558a-77ae-eb29-d19b3e326619	8312	Podbočje
00050000-558a-77ae-ea12-45121176b34e	5243	Podbrdo
00050000-558a-77ae-a11c-b4707ababe1e	3254	Podčetrtek
00050000-558a-77ae-4bc7-026218938b6a	2273	Podgorci
00050000-558a-77ae-9390-7b48fff15d50	6216	Podgorje
00050000-558a-77ae-11e9-b378c3a39969	2381	Podgorje pri Slovenj Gradcu
00050000-558a-77ae-b250-5fd9530ed3e2	6244	Podgrad
00050000-558a-77ae-dd4a-e11524ae5963	1414	Podkum
00050000-558a-77ae-37b5-577754641c15	2286	Podlehnik
00050000-558a-77ae-1e98-e844aa27a8f9	5272	Podnanos
00050000-558a-77ae-0557-a019a724d590	4244	Podnart
00050000-558a-77ae-d6c1-a2594d7c3cf2	3241	Podplat
00050000-558a-77ae-9c53-f60233798cad	3257	Podsreda
00050000-558a-77ae-9c53-2847f84889bf	2363	Podvelka
00050000-558a-77ae-6290-3ba0e2f17f18	2208	Pohorje
00050000-558a-77ae-2fca-e842f94927ca	2257	Polenšak
00050000-558a-77ae-f3a6-5984b8dc49f5	1355	Polhov Gradec
00050000-558a-77ae-e0f0-b49d73166ef3	4223	Poljane nad Škofjo Loko
00050000-558a-77ae-356b-0d7f3c852c97	2319	Poljčane
00050000-558a-77ae-e4b8-8f1747051856	1272	Polšnik
00050000-558a-77ae-f21f-a77721b4c792	3313	Polzela
00050000-558a-77ae-9d46-6086d8ff6666	3232	Ponikva
00050000-558a-77ae-8c79-c7f2337f9c6e	6320	Portorož/Portorose
00050000-558a-77ae-bc84-88a0024afc13	6230	Postojna
00050000-558a-77ae-6eff-4b83833e4201	2331	Pragersko
00050000-558a-77ae-a8ee-7f05498ab200	3312	Prebold
00050000-558a-77ae-1090-9cc08bf64a59	4205	Preddvor
00050000-558a-77ae-325d-068dc038420d	6255	Prem
00050000-558a-77ae-edad-bd9c38190e23	1352	Preserje
00050000-558a-77ae-c107-fca9a037c3a6	6258	Prestranek
00050000-558a-77ae-c819-da71f6a2f433	2391	Prevalje
00050000-558a-77ae-fd07-0c0bbd499def	3262	Prevorje
00050000-558a-77ae-6d26-1a16cbe9704c	1276	Primskovo 
00050000-558a-77ae-4bf8-460e7f6e4922	3253	Pristava pri Mestinju
00050000-558a-77ae-313a-c8dff51f6a50	9207	Prosenjakovci/Partosfalva
00050000-558a-77ae-37c5-09093f0d953d	5297	Prvačina
00050000-558a-77ae-6ba4-8070663d03e5	2250	Ptuj
00050000-558a-77ae-7c05-4c255b2a6fdb	2323	Ptujska Gora
00050000-558a-77ae-f5e8-ef9c72fe169c	9201	Puconci
00050000-558a-77ae-9ba9-38cefb399ea0	2327	Rače
00050000-558a-77ae-a7f2-024844b1d2e3	1433	Radeče
00050000-558a-77ae-dec5-3764dcccc6a7	9252	Radenci
00050000-558a-77ae-b4fe-e589614a224d	2360	Radlje ob Dravi
00050000-558a-77ae-107e-c8086edeb3c2	1235	Radomlje
00050000-558a-77ae-95de-fb7b5a3845f1	4240	Radovljica
00050000-558a-77ae-e465-989062621f06	8274	Raka
00050000-558a-77ae-61e3-76323cd8cab1	1381	Rakek
00050000-558a-77ae-02cf-d1bb991ff4cc	4283	Rateče - Planica
00050000-558a-77ae-6378-6d7461338863	2390	Ravne na Koroškem
00050000-558a-77ae-26a7-7b60ece01383	9246	Razkrižje
00050000-558a-77ae-159c-0a8a348339fa	3332	Rečica ob Savinji
00050000-558a-77ae-45d2-9497cfb586ff	5292	Renče
00050000-558a-77ae-7f4d-876160389b14	1310	Ribnica
00050000-558a-77ae-1f63-c87aa117e0f9	2364	Ribnica na Pohorju
00050000-558a-77ae-6046-4577a15d7130	3272	Rimske Toplice
00050000-558a-77ae-81ba-da152663d367	1314	Rob
00050000-558a-77ae-8798-077ec4895c6c	5215	Ročinj
00050000-558a-77ae-e94f-cb65cd34c4f3	3250	Rogaška Slatina
00050000-558a-77ae-f074-9c885bf6292a	9262	Rogašovci
00050000-558a-77ae-adfc-9def4ca4b17c	3252	Rogatec
00050000-558a-77ae-f084-15a886bd0ad8	1373	Rovte
00050000-558a-77ae-fe9c-c57d4ac8e280	2342	Ruše
00050000-558a-77ae-7bc3-f8f3c6820743	1282	Sava
00050000-558a-77ae-fdfb-80140525a40c	6333	Sečovlje/Sicciole
00050000-558a-77ae-cd86-090fc58132e9	4227	Selca
00050000-558a-77ae-592e-9b48823e6086	2352	Selnica ob Dravi
00050000-558a-77ae-ac3e-40e555421000	8333	Semič
00050000-558a-77ae-68a2-5b3cc4278135	8281	Senovo
00050000-558a-77ae-5437-ec6d705e5f97	6224	Senožeče
00050000-558a-77ae-c572-4e3ec6363f6c	8290	Sevnica
00050000-558a-77ae-2e0a-66b8653fe5c0	6210	Sežana
00050000-558a-77ae-6324-0e0bb9b7c325	2214	Sladki Vrh
00050000-558a-77ae-2a5a-1095fd705934	5283	Slap ob Idrijci
00050000-558a-77ae-b3db-c36ac329d606	2380	Slovenj Gradec
00050000-558a-77ae-c33f-6d78b73be0ca	2310	Slovenska Bistrica
00050000-558a-77ae-b366-891bb843b6a0	3210	Slovenske Konjice
00050000-558a-77ae-9dc0-b65473eac72f	1216	Smlednik
00050000-558a-77ae-4ece-9608e303322d	5232	Soča
00050000-558a-77ae-da08-eae900941f6d	1317	Sodražica
00050000-558a-77ae-41e0-dc4d69bc4841	3335	Solčava
00050000-558a-77ae-4b13-86bc0fc0ec18	5250	Solkan
00050000-558a-77ae-870d-506cb5ec046b	4229	Sorica
00050000-558a-77ae-a2ed-2e0c373dae0c	4225	Sovodenj
00050000-558a-77ae-d15f-c98782d4319d	5281	Spodnja Idrija
00050000-558a-77ae-65a7-3b101e2ee5f3	2241	Spodnji Duplek
00050000-558a-77ae-66a6-d4f37bae5be5	9245	Spodnji Ivanjci
00050000-558a-77ae-c418-442c5e290a95	2277	Središče ob Dravi
00050000-558a-77ae-004b-be2055f39289	4267	Srednja vas v Bohinju
00050000-558a-77ae-8c3d-cf48ec000a90	8256	Sromlje 
00050000-558a-77ae-cb51-89f07e473bfd	5224	Srpenica
00050000-558a-77ae-28e5-1fdf622cc218	1242	Stahovica
00050000-558a-77ae-14ea-ec7f1ee6c0d6	1332	Stara Cerkev
00050000-558a-77ae-6e49-41ba269c18fa	8342	Stari trg ob Kolpi
00050000-558a-77ae-4fd1-993be7d6b0f8	1386	Stari trg pri Ložu
00050000-558a-77ae-b2ee-f3e200746d30	2205	Starše
00050000-558a-77ae-3a10-351fb0a19a03	2289	Stoperce
00050000-558a-77ae-9e66-643d3f5abdf5	8322	Stopiče
00050000-558a-77ae-9780-28de13d9999b	3206	Stranice
00050000-558a-77ae-89ad-c5d9b59a19a9	8351	Straža
00050000-558a-77ae-9222-67397990c49a	1313	Struge
00050000-558a-77ae-df70-238e26f8c028	8293	Studenec
00050000-558a-77ae-99f1-13357df3e520	8331	Suhor
00050000-558a-77ae-c09a-bee19e1d25a4	2233	Sv. Ana v Slovenskih goricah
00050000-558a-77ae-75bb-8dea89f43d2f	2235	Sv. Trojica v Slovenskih goricah
00050000-558a-77ae-7222-f7a0c23f884f	2353	Sveti Duh na Ostrem Vrhu
00050000-558a-77ae-4ae3-7095931609c4	9244	Sveti Jurij ob Ščavnici
00050000-558a-77ae-1206-b16c01beab0d	3264	Sveti Štefan
00050000-558a-77ae-a672-c603466d20b6	2258	Sveti Tomaž
00050000-558a-77ae-2853-2c364863c7b5	9204	Šalovci
00050000-558a-77ae-fbde-9c9bcef5981d	5261	Šempas
00050000-558a-77ae-50ed-55cc47f4e76e	5290	Šempeter pri Gorici
00050000-558a-77ae-aa0d-78045d2de464	3311	Šempeter v Savinjski dolini
00050000-558a-77ae-1e03-983e1fabf08f	4208	Šenčur
00050000-558a-77ae-7d1a-dfec799eeb2d	2212	Šentilj v Slovenskih goricah
00050000-558a-77ae-8ebc-fa3a91c78306	8297	Šentjanž
00050000-558a-77ae-c191-8197a7f9b44f	2373	Šentjanž pri Dravogradu
00050000-558a-77ae-0705-da7a68416993	8310	Šentjernej
00050000-558a-77ae-2eaa-954272333536	3230	Šentjur
00050000-558a-77ae-de33-8af24c098a74	3271	Šentrupert
00050000-558a-77ae-9d8b-e753d4224cfc	8232	Šentrupert
00050000-558a-77ae-b3b8-cfe51480f7b8	1296	Šentvid pri Stični
00050000-558a-77ae-14e5-ac25493260c4	8275	Škocjan
00050000-558a-77ae-4694-22fb4aab5cc4	6281	Škofije
00050000-558a-77ae-f20b-b61f324ead6a	4220	Škofja Loka
00050000-558a-77ae-0892-24ab9d829487	3211	Škofja vas
00050000-558a-77ae-fd78-b9fb47cf046d	1291	Škofljica
00050000-558a-77ae-8f3c-efa75966e2f5	6274	Šmarje
00050000-558a-77ae-f1ca-ac6f2dcff497	1293	Šmarje - Sap
00050000-558a-77ae-e080-8351d789a9d7	3240	Šmarje pri Jelšah
00050000-558a-77ae-09e0-e93258ca1d5f	8220	Šmarješke Toplice
00050000-558a-77ae-bdd3-5a5be2c23ef3	2315	Šmartno na Pohorju
00050000-558a-77ae-3ea0-25310705148a	3341	Šmartno ob Dreti
00050000-558a-77ae-8aff-830680d2472a	3327	Šmartno ob Paki
00050000-558a-77ae-a23c-de68f2af1460	1275	Šmartno pri Litiji
00050000-558a-77ae-d5d2-6c9007cafabe	2383	Šmartno pri Slovenj Gradcu
00050000-558a-77ae-75aa-f7e74268fda2	3201	Šmartno v Rožni dolini
00050000-558a-77ae-ff12-09096815caf8	3325	Šoštanj
00050000-558a-77ae-3d5a-cee5367ea026	6222	Štanjel
00050000-558a-77ae-96c6-8f837d8e0634	3220	Štore
00050000-558a-77ae-dd35-ba12ddb309fd	3304	Tabor
00050000-558a-77ae-0f01-c41a515ac3f4	3221	Teharje
00050000-558a-77ae-467b-89fa995ea26e	9251	Tišina
00050000-558a-77ae-910a-ed56b948e76e	5220	Tolmin
00050000-558a-77ae-5a0a-b99e584dce40	3326	Topolšica
00050000-558a-77ae-5655-02c2a69b4be1	2371	Trbonje
00050000-558a-77ae-f159-fbef343bdab1	1420	Trbovlje
00050000-558a-77ae-1954-ab6821b6553a	8231	Trebelno 
00050000-558a-77ae-17f0-15e8dd184c4d	8210	Trebnje
00050000-558a-77ae-7ef9-80098bf8ef7c	5252	Trnovo pri Gorici
00050000-558a-77ae-1926-05727f1b8aca	2254	Trnovska vas
00050000-558a-77ae-edbf-26e7463e489d	1222	Trojane
00050000-558a-77ae-0514-9f589c7cefc9	1236	Trzin
00050000-558a-77ae-ab62-561be106b4e2	4290	Tržič
00050000-558a-77ae-3a25-0e63b3e90e28	8295	Tržišče
00050000-558a-77ae-8d71-76d6ed03ebd0	1311	Turjak
00050000-558a-77ae-d328-8461a451be1e	9224	Turnišče
00050000-558a-77ae-90da-8fc39ee955d5	8323	Uršna sela
00050000-558a-77ae-fad7-300039181237	1252	Vače
00050000-558a-77ae-6f86-eef0ce0e429d	3320	Velenje 
00050000-558a-77ae-7eb0-8895c011f299	3322	Velenje - poštni predali
00050000-558a-77ae-f34f-63089be56f76	8212	Velika Loka
00050000-558a-77ae-9e5d-a68d20b7edc5	2274	Velika Nedelja
00050000-558a-77ae-0da1-588d749d1312	9225	Velika Polana
00050000-558a-77ae-b639-02d2a1dbfd2f	1315	Velike Lašče
00050000-558a-77ae-2428-12d21f60ecb0	8213	Veliki Gaber
00050000-558a-77ae-fa16-a01f241de979	9241	Veržej
00050000-558a-77ae-216f-77c0a9d1a2ac	1312	Videm - Dobrepolje
00050000-558a-77ae-72f9-ae90fc7bf491	2284	Videm pri Ptuju
00050000-558a-77ae-66ad-094e312a4256	8344	Vinica
00050000-558a-77ae-1c4b-5a1afb6d894b	5271	Vipava
00050000-558a-77ae-30d7-8b219fa6223a	4212	Visoko
00050000-558a-77ae-934c-4daa3b7007e7	1294	Višnja Gora
00050000-558a-77ae-c274-833fac798b59	3205	Vitanje
00050000-558a-77ae-a4c4-76d39dd255f5	2255	Vitomarci
00050000-558a-77ae-6f3c-ca30feb0045e	1217	Vodice
00050000-558a-77ae-a84f-b532ddee43de	3212	Vojnik\t
00050000-558a-77ae-6947-e405be911dfe	5293	Volčja Draga
00050000-558a-77ae-6fcb-1e37a502fa67	2232	Voličina
00050000-558a-77ae-6e33-173bd808a689	3305	Vransko
00050000-558a-77ae-2692-fcb85b0569cd	6217	Vremski Britof
00050000-558a-77ae-51b4-87cc0f53766a	1360	Vrhnika
00050000-558a-77ae-35fd-87b8b3e9316f	2365	Vuhred
00050000-558a-77ae-c912-1682f8e15afe	2367	Vuzenica
00050000-558a-77ae-c448-713596764b18	8292	Zabukovje 
00050000-558a-77ae-2bcb-f958e57776c3	1410	Zagorje ob Savi
00050000-558a-77ae-f43d-a8e7c7b989e4	1303	Zagradec
00050000-558a-77ae-bf9a-0a5de98334ee	2283	Zavrč
00050000-558a-77ae-9823-868ee781199f	8272	Zdole 
00050000-558a-77ae-da93-0e53381f541d	4201	Zgornja Besnica
00050000-558a-77ae-eba2-92c16f537820	2242	Zgornja Korena
00050000-558a-77ae-b2ec-bba3d618a1b5	2201	Zgornja Kungota
00050000-558a-77ae-8271-737ace846c08	2316	Zgornja Ložnica
00050000-558a-77ae-2e1c-5d4983ba28be	2314	Zgornja Polskava
00050000-558a-77ae-f134-291c37857a3d	2213	Zgornja Velka
00050000-558a-77ae-0e90-f1ee2d364f30	4247	Zgornje Gorje
00050000-558a-77ae-333a-c088677d2672	4206	Zgornje Jezersko
00050000-558a-77ae-3a25-21f0c255682c	2285	Zgornji Leskovec
00050000-558a-77ae-aa0b-09c90782aca5	1432	Zidani Most
00050000-558a-77ae-f87a-da593528358e	3214	Zreče
00050000-558a-77ae-faa6-422331422919	4209	Žabnica
00050000-558a-77ae-aabc-63e713d3b448	3310	Žalec
00050000-558a-77ae-c9a1-1207744c97df	4228	Železniki
00050000-558a-77ae-c610-9c8193ce8b46	2287	Žetale
00050000-558a-77ae-e6ca-0f197be35964	4226	Žiri
00050000-558a-77ae-83ba-1c229d001863	4274	Žirovnica
00050000-558a-77ae-c130-50c17779618a	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8128112)
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
-- TOC entry 2859 (class 0 OID 8127923)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8128001)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8128124)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8128244)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8128296)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558a-77af-fe97-9033e5571f30	00080000-558a-77af-c4a8-8959241aa2b5	0900	AK
00190000-558a-77af-266b-91cdc175e5f4	00080000-558a-77af-37fe-7cf6b72455f6	0987	A
00190000-558a-77af-b3d8-0cc6a398ce62	00080000-558a-77af-bf7f-2044a908d10f	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8128432)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
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
-- TOC entry 2883 (class 0 OID 8128153)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558a-77af-d88a-a065d397e02b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558a-77af-e3e2-47405e54133f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558a-77af-4f55-93bf1596bd31	0003	Kazinska	t	84	Kazinska dvorana
00220000-558a-77af-e3d2-eb6c4a2996ec	0004	Mali oder	t	24	Mali oder 
00220000-558a-77af-6697-44e316c477a7	0005	Komorni oder	t	15	Komorni oder
00220000-558a-77af-7f4b-4335fa023271	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558a-77af-3b68-fad4d73d94e4	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8128097)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8128087)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8128285)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8128221)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8127795)
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
-- TOC entry 2884 (class 0 OID 8128163)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8127833)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558a-77ad-4f60-f1c217717e7c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558a-77ad-b49b-2d00a5b87aac	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558a-77ad-2da8-f3f6504b0853	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558a-77ad-372c-e291587e1f83	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558a-77ae-085a-8540759a1810	planer	Planer dogodkov v koledarju	t
00020000-558a-77ae-cb04-87fdc174f895	kadrovska	Kadrovska služba	t
00020000-558a-77ae-8a67-c65d7e0bef86	arhivar	Ažuriranje arhivalij	t
00020000-558a-77ae-8d3b-c8ef5da6a820	igralec	Igralec	t
00020000-558a-77ae-0f65-79fd9132e18e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558a-77af-bf12-0ee0ced1d411	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8127817)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558a-77ae-b82a-c5121ca12376	00020000-558a-77ad-2da8-f3f6504b0853
00010000-558a-77ae-86cf-d853535e1f5c	00020000-558a-77ad-2da8-f3f6504b0853
00010000-558a-77af-f08d-b267dd23e1d5	00020000-558a-77af-bf12-0ee0ced1d411
\.


--
-- TOC entry 2886 (class 0 OID 8128177)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8128118)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8128068)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8128476)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558a-77ae-1f07-1ecdf77d9d70	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558a-77ae-3fd4-f64e33ec598a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558a-77ae-a6bb-291ae70b3cd4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558a-77ae-3ef1-7a1efa8f35f0	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558a-77ae-ae84-c6d4449e2c21	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8128468)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558a-77ae-51ab-ab96c61c270f	00230000-558a-77ae-3ef1-7a1efa8f35f0	popa
00240000-558a-77ae-ec2e-5d40d5846ba3	00230000-558a-77ae-3ef1-7a1efa8f35f0	oseba
00240000-558a-77ae-e2b9-65a6f030660e	00230000-558a-77ae-3fd4-f64e33ec598a	prostor
00240000-558a-77ae-32c3-6fdbe0c55f17	00230000-558a-77ae-3ef1-7a1efa8f35f0	besedilo
00240000-558a-77ae-d545-025b500ceaac	00230000-558a-77ae-3ef1-7a1efa8f35f0	uprizoritev
00240000-558a-77ae-166e-fb2ecd6818de	00230000-558a-77ae-3ef1-7a1efa8f35f0	funkcija
00240000-558a-77ae-ed75-ce6a03d315f0	00230000-558a-77ae-3ef1-7a1efa8f35f0	tipfunkcije
00240000-558a-77ae-7c54-80e9b4fae0fd	00230000-558a-77ae-3ef1-7a1efa8f35f0	alternacija
00240000-558a-77ae-d123-819fa67e38d5	00230000-558a-77ae-1f07-1ecdf77d9d70	pogodba
00240000-558a-77ae-95f6-7accf0a8dee9	00230000-558a-77ae-3ef1-7a1efa8f35f0	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8128463)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8128231)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558a-77b0-beea-319d76552496	000e0000-558a-77af-9aea-fca7b6adf7cf	00080000-558a-77af-6aef-83eb5e278443	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558a-77b0-2d21-3a16df564434	000e0000-558a-77af-9aea-fca7b6adf7cf	00080000-558a-77af-6aef-83eb5e278443	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558a-77b0-b2f1-d60039a2f08e	000e0000-558a-77af-9aea-fca7b6adf7cf	00080000-558a-77af-def5-3efec3f6453e	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8127895)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8128074)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558a-77b0-95ac-206c982a31ef	00180000-558a-77b0-2b66-eaf87a93115a	000c0000-558a-77b0-847c-352c2d84bb4d	00090000-558a-77af-24b9-bda8207325b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-77b0-4e85-fdee0c3bdc24	00180000-558a-77b0-2b66-eaf87a93115a	000c0000-558a-77b0-58b6-1fe7e0513f51	00090000-558a-77af-2186-942a8c215a68	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-77b0-917b-e5aa59996188	00180000-558a-77b0-2b66-eaf87a93115a	000c0000-558a-77b0-6768-9c98af80523d	00090000-558a-77af-3175-79c11fad0e2c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-77b0-71ac-78d5c5ea0338	00180000-558a-77b0-2b66-eaf87a93115a	000c0000-558a-77b0-0145-071cbbcb2676	00090000-558a-77af-f628-ca130c8216c3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-77b0-592a-1ea6bad46c3b	00180000-558a-77b0-2b66-eaf87a93115a	000c0000-558a-77b0-3cc9-c7dc18c4151d	00090000-558a-77af-c286-60b4f5d679b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-77b0-f812-839da568af3e	00180000-558a-77b0-e570-496aa88b468a	\N	00090000-558a-77af-c286-60b4f5d679b5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8128274)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558a-77ae-274d-1d58ad5cabe1	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558a-77ae-a338-285903e0a60a	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558a-77ae-cb4a-b26e553418ba	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558a-77ae-144b-e5d17543e0a8	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558a-77ae-a25a-3a79b6f55f32	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558a-77ae-86d0-aaecd54e4ee7	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558a-77ae-f555-b96b88dd4e83	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558a-77ae-5f37-0228dc5b36b9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558a-77ae-86ba-cc158cb6ba86	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558a-77ae-165c-000f87fac991	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558a-77ae-61ae-45a583fdb165	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558a-77ae-af6a-791a58b6bae0	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558a-77ae-16aa-d1bd6bebab13	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558a-77ae-d5c1-82e1e876bf51	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558a-77ae-937e-2a3c29c4d148	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558a-77ae-415e-8211a57b1d20	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8128445)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558a-77ae-9b5b-86a6b1a2f017	01	Velika predstava	f	1.00	1.00
002b0000-558a-77ae-28e7-0c6e4bf3ed3f	02	Mala predstava	f	0.50	0.50
002b0000-558a-77ae-6743-9011cdbb8434	03	Mala koprodukcija	t	0.40	1.00
002b0000-558a-77ae-12ac-8bc3778bab14	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558a-77ae-22da-3b2d0959d298	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8127958)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8127804)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558a-77ae-86cf-d853535e1f5c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROi9fvi6yS51u0aI0HP9TFPebYAk87KJ6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558a-77af-e76c-4537737af50e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558a-77af-641a-23857e7e406d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558a-77af-3e00-d58999afcc79	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558a-77af-9023-622b4787b582	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558a-77af-8324-a0c1c4a21c00	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558a-77af-174c-797a85c9b9af	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558a-77af-6788-96191aa54787	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558a-77af-4285-809c12576ca3	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558a-77af-8ed9-7b83e18f9665	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558a-77af-f08d-b267dd23e1d5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558a-77ae-b82a-c5121ca12376	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8128331)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, skupnistrosek, maticnioder_id) FROM stdin;
000e0000-558a-77af-029a-2f4cdedc7ef3	00160000-558a-77af-cf4a-8ed6ec64351a	00150000-558a-77ae-a3ee-e3d93e527f73	00140000-558a-77ad-83a3-ba6b45c19888	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		\N	00220000-558a-77af-6697-44e316c477a7
000e0000-558a-77af-9aea-fca7b6adf7cf	00160000-558a-77af-5e74-f91f08084d5f	00150000-558a-77ae-3053-8ba985e4d86c	00140000-558a-77ad-2648-9f7e32e0b43d	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		\N	00220000-558a-77af-7f4b-4335fa023271
000e0000-558a-77af-0ab5-97e116a74051	\N	00150000-558a-77ae-3053-8ba985e4d86c	00140000-558a-77ad-2648-9f7e32e0b43d	00190000-558a-77af-266b-91cdc175e5f4	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		\N	00220000-558a-77af-6697-44e316c477a7
000e0000-558a-77af-ef42-b2b6bdeb04e7	\N	00150000-558a-77ae-3053-8ba985e4d86c	00140000-558a-77ad-2648-9f7e32e0b43d	00190000-558a-77af-266b-91cdc175e5f4	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		\N	00220000-558a-77af-6697-44e316c477a7
\.


--
-- TOC entry 2867 (class 0 OID 8128020)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558a-77af-cf3a-d3ea368814dd	000e0000-558a-77af-9aea-fca7b6adf7cf	1	
00200000-558a-77af-a9fc-09d1ad7eff60	000e0000-558a-77af-9aea-fca7b6adf7cf	2	
\.


--
-- TOC entry 2882 (class 0 OID 8128145)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8128214)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8128052)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8128321)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558a-77ad-83a3-ba6b45c19888	01	Drama	drama (SURS 01)
00140000-558a-77ad-3d48-fecd64d65caf	02	Opera	opera (SURS 02)
00140000-558a-77ad-afc0-07d2499d10cb	03	Balet	balet (SURS 03)
00140000-558a-77ad-c399-908e41c80939	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558a-77ad-2cc3-e0f121c808d7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558a-77ad-2648-9f7e32e0b43d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558a-77ad-6b35-b7ae9139bfbf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8128204)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558a-77ae-a165-5767d06391b8	01	Opera	opera
00150000-558a-77ae-5f4a-113d6d1f541c	02	Opereta	opereta
00150000-558a-77ae-5af8-77be952cde9d	03	Balet	balet
00150000-558a-77ae-a29c-07e23ad4963e	04	Plesne prireditve	plesne prireditve
00150000-558a-77ae-db7d-6f2673bca8fc	05	Lutkovno gledališče	lutkovno gledališče
00150000-558a-77ae-e4cf-73b6d3bd9456	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558a-77ae-388a-70ae0ecf44d6	07	Biografska drama	biografska drama
00150000-558a-77ae-a3ee-e3d93e527f73	08	Komedija	komedija
00150000-558a-77ae-066a-c01e2489ab6e	09	Črna komedija	črna komedija
00150000-558a-77ae-9848-1a56e2ad18f4	10	E-igra	E-igra
00150000-558a-77ae-3053-8ba985e4d86c	11	Kriminalka	kriminalka
00150000-558a-77ae-c4a9-7e5b4146373f	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8127858)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8128379)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8128369)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8128273)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8128042)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8128067)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8128461)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8127984)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8128427)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8128200)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8128018)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8128061)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8127998)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8128110)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8128137)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8127956)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8127867)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2446 (class 2606 OID 8127891)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8127847)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8127832)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8128143)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8128176)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8128316)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8127920)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8127944)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8128116)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 8127934)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8128005)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8128128)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8128255)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8128301)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8128443)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8128160)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8128101)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8128092)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8128295)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8128228)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8127803)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8128167)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8127821)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8127841)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8128185)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8128123)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8128073)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8128485)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8128473)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8128467)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8128241)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8127900)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8128083)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8128284)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8128455)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8127969)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8127816)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8128348)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8128027)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8128151)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8128219)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8128056)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8128329)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8128212)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8128049)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8128242)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8128243)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8127922)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2400 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2401 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2402 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2544 (class 1259 OID 8128144)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8128130)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8128129)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8128028)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8128201)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8128203)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8128202)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8128000)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8127999)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8128318)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8128319)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8128320)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2414 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2415 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2606 (class 1259 OID 8128353)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8128350)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8128354)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8128352)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8128351)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8127971)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8127970)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2405 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2406 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2444 (class 1259 OID 8127894)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8128168)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8128062)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8127848)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8127849)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8128188)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8128187)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8128186)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8128006)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8128008)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8128007)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8128475)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8128096)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8128094)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8128093)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8128095)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8127822)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8127823)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8128152)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8128117)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8128229)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8128230)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8128431)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8128428)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8128429)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8128430)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8127936)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8127935)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8127937)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8128256)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8128257)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8128383)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8128385)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8128381)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8128384)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8128382)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8128220)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8128105)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8128104)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8128102)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8128103)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8128371)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8128370)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8128444)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8128019)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8128462)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8127869)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8127868)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8127901)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8127902)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8128086)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8128085)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8128084)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2409 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2410 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2496 (class 1259 OID 8128051)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8128047)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8128044)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8128045)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8128043)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8128048)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8128046)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8127921)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8127985)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8127987)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8127986)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8127988)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8128111)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8128317)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8128349)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8127892)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8127893)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8128213)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8128486)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8127957)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8128474)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8128162)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8128161)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8128380)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8127945)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8128330)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8128302)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8128303)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8127842)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8128050)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 2606 OID 8128622)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2677 (class 2606 OID 8128607)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2676 (class 2606 OID 8128612)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2672 (class 2606 OID 8128632)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2678 (class 2606 OID 8128602)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2673 (class 2606 OID 8128627)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8128617)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8128777)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 8128782)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8128537)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8128717)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2693 (class 2606 OID 8128712)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8128707)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8128597)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8128747)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8128757)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8128752)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2665 (class 2606 OID 8128572)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8128567)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8128697)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8128802)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8128807)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8128812)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8128832)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2719 (class 2606 OID 8128817)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2715 (class 2606 OID 8128837)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8128827)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 8128822)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2663 (class 2606 OID 8128562)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8128557)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8128522)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8128517)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8128727)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8128637)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8128497)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2651 (class 2606 OID 8128502)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2698 (class 2606 OID 8128742)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8128737)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 8128732)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2669 (class 2606 OID 8128577)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 8128587)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8128582)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8128907)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2683 (class 2606 OID 8128672)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8128662)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 8128657)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2684 (class 2606 OID 8128667)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8128487)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8128492)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8128722)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8128702)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8128767)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2705 (class 2606 OID 8128772)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8128892)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8128877)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8128882)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8128887)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8128547)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 8128542)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8128552)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8128787)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8128792)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8128862)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 8128872)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8128852)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 8128867)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2725 (class 2606 OID 8128857)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8128762)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 8128692)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2688 (class 2606 OID 8128687)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 8128677)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8128682)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 8128847)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8128842)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8128897)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8128592)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8128797)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8128902)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2653 (class 2606 OID 8128512)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8128507)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8128527)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8128532)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 8128652)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8128647)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2682 (class 2606 OID 8128642)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-24 11:26:08 CEST

--
-- PostgreSQL database dump complete
--

