--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-24 11:34:35 CEST

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
-- TOC entry 183 (class 1259 OID 8130197)
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
-- TOC entry 230 (class 1259 OID 8130719)
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
-- TOC entry 229 (class 1259 OID 8130702)
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
-- TOC entry 222 (class 1259 OID 8130605)
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
-- TOC entry 197 (class 1259 OID 8130376)
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
-- TOC entry 200 (class 1259 OID 8130410)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8130803)
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
-- TOC entry 192 (class 1259 OID 8130319)
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
-- TOC entry 231 (class 1259 OID 8130733)
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
-- TOC entry 216 (class 1259 OID 8130536)
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
-- TOC entry 195 (class 1259 OID 8130356)
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
-- TOC entry 199 (class 1259 OID 8130404)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8130336)
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
-- TOC entry 205 (class 1259 OID 8130453)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8130478)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8130293)
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
-- TOC entry 184 (class 1259 OID 8130206)
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
-- TOC entry 185 (class 1259 OID 8130217)
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
-- TOC entry 180 (class 1259 OID 8130171)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8130190)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8130485)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8130516)
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
-- TOC entry 226 (class 1259 OID 8130651)
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
-- TOC entry 187 (class 1259 OID 8130250)
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
-- TOC entry 189 (class 1259 OID 8130285)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8130459)
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
-- TOC entry 188 (class 1259 OID 8130270)
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
-- TOC entry 194 (class 1259 OID 8130348)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8130471)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8130591)
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
-- TOC entry 225 (class 1259 OID 8130643)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8130779)
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
-- TOC entry 212 (class 1259 OID 8130500)
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
-- TOC entry 204 (class 1259 OID 8130444)
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
-- TOC entry 203 (class 1259 OID 8130434)
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
-- TOC entry 224 (class 1259 OID 8130632)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8130568)
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
-- TOC entry 177 (class 1259 OID 8130142)
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
-- TOC entry 176 (class 1259 OID 8130140)
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
-- TOC entry 213 (class 1259 OID 8130510)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8130180)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8130164)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8130524)
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
-- TOC entry 207 (class 1259 OID 8130465)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8130415)
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
-- TOC entry 237 (class 1259 OID 8130823)
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
-- TOC entry 236 (class 1259 OID 8130815)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8130810)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8130578)
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
-- TOC entry 186 (class 1259 OID 8130242)
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
-- TOC entry 202 (class 1259 OID 8130421)
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
-- TOC entry 223 (class 1259 OID 8130621)
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
-- TOC entry 233 (class 1259 OID 8130792)
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
-- TOC entry 191 (class 1259 OID 8130305)
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
-- TOC entry 178 (class 1259 OID 8130151)
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
-- TOC entry 228 (class 1259 OID 8130678)
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
-- TOC entry 196 (class 1259 OID 8130367)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8130492)
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
-- TOC entry 218 (class 1259 OID 8130561)
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
-- TOC entry 198 (class 1259 OID 8130399)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8130668)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8130551)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8130145)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8130197)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8130719)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558a-79aa-9ca4-d1fb0dbd864d	000d0000-558a-79aa-3b6b-fb94778ff653	\N	00090000-558a-79aa-0d49-01515c4e78b5	\N	000b0000-558a-79aa-419f-4fbe2fafb60f	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-79aa-dd10-f6abc2ff3c0d	000d0000-558a-79aa-9a9b-ce6796841225	\N	00090000-558a-79aa-2479-c3550cd7730e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-79aa-845c-60b3ef56f7b1	000d0000-558a-79aa-64ad-4cec37c02a67	\N	00090000-558a-79aa-1bfa-554e635dfe54	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-79aa-f04c-cf2ea6a812e1	000d0000-558a-79aa-f993-dd7d8b544ce7	\N	00090000-558a-79aa-7d1e-8d6a2cdddd8a	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-79aa-5fad-ba9c28a482ed	000d0000-558a-79aa-fd2e-48825f55d663	\N	00090000-558a-79aa-6df0-cd858e3371bd	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-79aa-a48d-d04d5568b22a	000d0000-558a-79aa-025d-3bdeebfc2612	\N	00090000-558a-79aa-2479-c3550cd7730e	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8130702)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8130605)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558a-79aa-9858-d6002d60819f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558a-79aa-72f0-70151d4250e4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558a-79aa-b174-dcdfe1f0ecf2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8130376)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558a-79aa-2c6b-e5b40e87be70	\N	\N	00200000-558a-79aa-1506-0caf69fa4e0f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558a-79aa-e741-37dc4dd87737	\N	\N	00200000-558a-79aa-b651-b091b0a4019b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558a-79aa-b271-483e0569ba61	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558a-79aa-d4f9-a72abd27c9ce	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558a-79aa-076d-f65023093e10	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8130410)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8130803)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8130319)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558a-79a8-b761-8def20b88fdb	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558a-79a8-6c2b-8c1d25ad373c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558a-79a8-5112-b544577459d9	AL	ALB	008	Albania 	Albanija	\N
00040000-558a-79a8-8182-1e2d3ae8910f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558a-79a8-0ece-a075ce1fe29c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558a-79a8-213d-0f7fccd23fa2	AD	AND	020	Andorra 	Andora	\N
00040000-558a-79a8-e3c3-c765d67661ce	AO	AGO	024	Angola 	Angola	\N
00040000-558a-79a8-d18c-dd1d63d84f27	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558a-79a8-0bba-1e1e26fb7199	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558a-79a8-e750-a4d01c0d2312	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-79a8-a1d6-a589c761db22	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558a-79a8-d200-5d171f179d20	AM	ARM	051	Armenia 	Armenija	\N
00040000-558a-79a8-ab51-b0b5e3f549ac	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558a-79a8-a024-620a36791eee	AU	AUS	036	Australia 	Avstralija	\N
00040000-558a-79a8-9218-b8731e27b148	AT	AUT	040	Austria 	Avstrija	\N
00040000-558a-79a8-aeea-a52ddada96e7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558a-79a8-fbf7-8054e10caa7c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558a-79a8-49ec-f1d3e14c31a1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558a-79a8-36b5-544a4574e5b1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558a-79a8-c56e-480379f349b0	BB	BRB	052	Barbados 	Barbados	\N
00040000-558a-79a8-442f-21e81b359d82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558a-79a8-7239-8fbd1ae99c73	BE	BEL	056	Belgium 	Belgija	\N
00040000-558a-79a8-d493-07f813c59ec5	BZ	BLZ	084	Belize 	Belize	\N
00040000-558a-79a8-a53a-0d1295ab5a9e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558a-79a8-18d8-85b2859c411c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558a-79a8-ffaa-9332f6b4e5fd	BT	BTN	064	Bhutan 	Butan	\N
00040000-558a-79a8-5051-ed64197d4af9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558a-79a8-b18c-433072b7bde2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558a-79a8-fab5-c01bccf72344	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558a-79a8-299c-89045dac2557	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558a-79a8-6b65-bd2ae303467e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558a-79a8-3ec4-d93d53a52901	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558a-79a8-8e06-b1c292f07788	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558a-79a8-8b89-8485ef78c800	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558a-79a8-789c-624ada35c8e0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558a-79a8-678b-60ffa9348fd7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558a-79a8-ce4d-6c3db57d6df7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558a-79a8-78ef-77adde61bcaf	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558a-79a8-0638-fa54a95c4e4d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558a-79a8-0692-96a6da4b0941	CA	CAN	124	Canada 	Kanada	\N
00040000-558a-79a8-42f3-d058a9692f51	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558a-79a8-baa6-4d7cd5241335	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558a-79a8-26e2-757030b35b4a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558a-79a8-42ee-cbd8e14db8b5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558a-79a8-9870-f756ec7d9da7	CL	CHL	152	Chile 	Čile	\N
00040000-558a-79a8-e95a-f80d2bbddfed	CN	CHN	156	China 	Kitajska	\N
00040000-558a-79a8-0906-37db964b54be	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558a-79a8-10a1-81b5bf026f49	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558a-79a8-e347-08ad3427a33d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558a-79a8-f999-05467ce95a4a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558a-79a8-7564-0071d2e65301	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558a-79a8-0ac5-965c23034ef5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558a-79a8-1483-a44d48032813	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558a-79a8-57b9-c319e4c06979	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558a-79a8-86d4-7f87b511e861	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558a-79a8-5c78-c8f5eb991ff1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558a-79a8-414f-7960eb0d04ff	CU	CUB	192	Cuba 	Kuba	\N
00040000-558a-79a8-dede-c42b29af37a0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558a-79a8-e1be-2c06ca868e44	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558a-79a8-92c8-0ac87954c52d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558a-79a8-6f92-3946a3f8c394	DK	DNK	208	Denmark 	Danska	\N
00040000-558a-79a8-118b-f48b0589f3d6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558a-79a8-f88d-d30f1dd35265	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-79a8-46d2-98bd7b64945f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558a-79a8-935e-18b2186e4917	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558a-79a8-5a2d-12c54a5dafa2	EG	EGY	818	Egypt 	Egipt	\N
00040000-558a-79a8-d64a-2f6e8ecd41d1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558a-79a8-b96b-86fb2e122b50	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558a-79a8-18ef-8b04bc30d535	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558a-79a8-947f-5d366da79401	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558a-79a8-b1fe-09e4506edbfa	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558a-79a8-3f09-ac4fffa3256b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558a-79a8-bdac-18beb858352f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558a-79a8-d6c6-401ca13746ad	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558a-79a8-d3d7-df26edac569a	FI	FIN	246	Finland 	Finska	\N
00040000-558a-79a8-1281-b593c936741e	FR	FRA	250	France 	Francija	\N
00040000-558a-79a8-10f2-b5ffff41f44c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558a-79a8-4eba-b193d1a4db60	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558a-79a8-8b41-7c2465c05087	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558a-79a8-1b9f-ec68db1209e2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558a-79a8-c067-e204e9d5697e	GA	GAB	266	Gabon 	Gabon	\N
00040000-558a-79a8-9e30-768170b7bbdd	GM	GMB	270	Gambia 	Gambija	\N
00040000-558a-79a8-96ea-1d108dc7fda1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558a-79a8-ac59-200d64826918	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558a-79a8-0e59-ec097392412b	GH	GHA	288	Ghana 	Gana	\N
00040000-558a-79a8-825e-dfa8f0a13d90	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558a-79a8-2374-b1c3c6637651	GR	GRC	300	Greece 	Grčija	\N
00040000-558a-79a8-2f2c-b77565422fd5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558a-79a8-22bd-19b2c61a5026	GD	GRD	308	Grenada 	Grenada	\N
00040000-558a-79a8-bd34-2e64c3438b27	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558a-79a8-d48c-a985fa62f7a0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558a-79a8-73f9-07f2da49624d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558a-79a8-eaac-3c527970fe6f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558a-79a8-39ae-a797ebf1927f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558a-79a8-a819-5d38cddba11e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558a-79a8-fb4f-dbc4ec90a4ed	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558a-79a8-f0fd-be82b717b259	HT	HTI	332	Haiti 	Haiti	\N
00040000-558a-79a8-3adc-54c6dfcce293	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558a-79a8-9d53-8e2f426375fb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558a-79a8-0785-93be19530967	HN	HND	340	Honduras 	Honduras	\N
00040000-558a-79a8-bf2e-d920d3e331ac	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558a-79a8-f0bc-fb3e62315c08	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558a-79a8-94f7-4ebba4d2cb7c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558a-79a8-1ef4-87f1847b7944	IN	IND	356	India 	Indija	\N
00040000-558a-79a8-a0ee-a4c09b10c077	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558a-79a8-2e87-72dd3a5a3fe7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558a-79a8-eec0-857d9abab0bf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558a-79a8-d524-02c36d27a74c	IE	IRL	372	Ireland 	Irska	\N
00040000-558a-79a8-04fe-3b7767495630	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558a-79a8-2567-0480019a6f68	IL	ISR	376	Israel 	Izrael	\N
00040000-558a-79a8-8974-32df9c306938	IT	ITA	380	Italy 	Italija	\N
00040000-558a-79a8-9621-9dccc2864aab	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558a-79a8-389b-f7a4c15c4f89	JP	JPN	392	Japan 	Japonska	\N
00040000-558a-79a8-3b8d-353dab098ebc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558a-79a8-72d8-eb87e3b848ba	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558a-79a8-b20d-9cb9bad549bd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558a-79a8-54e6-f1bac8d127e3	KE	KEN	404	Kenya 	Kenija	\N
00040000-558a-79a8-1631-2dad065d2fbb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558a-79a8-3f7f-0f80c3add659	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558a-79a8-d1fb-36e2be922689	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558a-79a8-3ef1-9fb8d3a247fc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558a-79a8-6d84-da28c068f86b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558a-79a8-3c25-2f442a473423	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558a-79a8-b97b-49d69007a18e	LV	LVA	428	Latvia 	Latvija	\N
00040000-558a-79a8-ac5b-4af690c14825	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558a-79a8-bf1e-e581fb8beae8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558a-79a8-0049-6c6c9b2fd188	LR	LBR	430	Liberia 	Liberija	\N
00040000-558a-79a8-4f19-e11154134de0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558a-79a8-f001-6aa770a8c23d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558a-79a8-c951-fceb5e86a8e5	LT	LTU	440	Lithuania 	Litva	\N
00040000-558a-79a8-e477-8750133cb86e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558a-79a8-b211-87372fb29125	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558a-79a8-29bd-3ba3c44db02b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558a-79a8-4dcc-d1fabeaa2f75	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558a-79a8-74be-82d7be22a723	MW	MWI	454	Malawi 	Malavi	\N
00040000-558a-79a8-cc9a-d14130d1ab9f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558a-79a8-f9b1-8ffd6e77919f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558a-79a8-f6a8-454981858e26	ML	MLI	466	Mali 	Mali	\N
00040000-558a-79a8-fbbe-f3ec1b7b0920	MT	MLT	470	Malta 	Malta	\N
00040000-558a-79a8-b98f-3a86dc3b7c01	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558a-79a8-43e4-9d7a8b5e791b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558a-79a8-4aab-5788b14b0718	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558a-79a8-e500-71d858a0e8c3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558a-79a8-fbce-9990a101e151	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558a-79a8-f6f6-5dcce9bcf215	MX	MEX	484	Mexico 	Mehika	\N
00040000-558a-79a8-fb2e-29234ac303d1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558a-79a8-1669-5a77cbccec22	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558a-79a8-50ea-95d4f1fe0dfc	MC	MCO	492	Monaco 	Monako	\N
00040000-558a-79a8-05cd-3a69c12fde62	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558a-79a8-7b8d-572c4fbb22ef	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558a-79a8-eba5-a1c43f859908	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558a-79a8-daf5-b801728843dc	MA	MAR	504	Morocco 	Maroko	\N
00040000-558a-79a8-8cdf-48deaccdd601	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558a-79a8-13a2-843d62a07f88	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558a-79a8-08e3-72afd5f9db40	NA	NAM	516	Namibia 	Namibija	\N
00040000-558a-79a8-bfdf-3f248f00dcff	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558a-79a8-2e30-ae29b538995e	NP	NPL	524	Nepal 	Nepal	\N
00040000-558a-79a8-9aeb-6c8e03781ccf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558a-79a8-5aba-8c6e162a3ff7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558a-79a8-79ad-ce9215518453	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558a-79a8-81da-360986759fef	NE	NER	562	Niger 	Niger 	\N
00040000-558a-79a8-e558-0e91bf1999fe	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558a-79a8-df64-ffda54f66519	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558a-79a8-add6-1169d52f8ea6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558a-79a8-b789-892ec249985c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558a-79a8-a383-2cb8354b9f80	NO	NOR	578	Norway 	Norveška	\N
00040000-558a-79a8-5152-b35a26bd510c	OM	OMN	512	Oman 	Oman	\N
00040000-558a-79a8-12ba-c6b5fcc0c4ef	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558a-79a8-f288-3d500b91a156	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558a-79a8-9c16-0569c0cc9beb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558a-79a8-6434-e28cf6d99cdc	PA	PAN	591	Panama 	Panama	\N
00040000-558a-79a8-a6d2-d3c553269de7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558a-79a8-f8f0-ef4c9f835436	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558a-79a8-1c11-aa93224d6713	PE	PER	604	Peru 	Peru	\N
00040000-558a-79a8-a898-fbf7acbf2224	PH	PHL	608	Philippines 	Filipini	\N
00040000-558a-79a8-8f58-0c6e8adf3131	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558a-79a8-c41c-07c24c78cdd5	PL	POL	616	Poland 	Poljska	\N
00040000-558a-79a8-e024-591698e90041	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558a-79a8-109c-3abb8e426bbd	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558a-79a8-675f-13b02718c057	QA	QAT	634	Qatar 	Katar	\N
00040000-558a-79a8-9bfa-b5a997fb4b40	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558a-79a8-3b69-bb523dd788d5	RO	ROU	642	Romania 	Romunija	\N
00040000-558a-79a8-c16b-1b0e59a1e306	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558a-79a8-e1b2-31de6ff27669	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558a-79a8-a3cd-bca9b6cc9d09	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558a-79a8-c88e-1702e84d3235	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558a-79a8-9dde-f5a7e01e4ce7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558a-79a8-64ed-cf8dac8405fc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558a-79a8-19cc-7be166c8d0ef	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558a-79a8-2748-3c8a6bbff8de	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558a-79a8-decb-2a6984bf8d05	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558a-79a8-51f7-022e27fe25be	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558a-79a8-e9c2-2a259dd3c54b	SM	SMR	674	San Marino 	San Marino	\N
00040000-558a-79a8-8637-859ca323f0ee	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558a-79a8-820b-b120bea82edf	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558a-79a8-98b4-54590e2ace50	SN	SEN	686	Senegal 	Senegal	\N
00040000-558a-79a8-1a71-d350c78e47fb	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558a-79a8-e432-181f574520c1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558a-79a8-4176-b947c7da0394	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558a-79a8-136b-20098db01998	SG	SGP	702	Singapore 	Singapur	\N
00040000-558a-79a8-30b5-3e701842c2bd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558a-79a8-d66e-07652d0d8504	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558a-79a8-8bdf-d586e6adc6a0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558a-79a8-5917-b633cc387cd2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558a-79a8-5fd9-637b8be4a54d	SO	SOM	706	Somalia 	Somalija	\N
00040000-558a-79a8-0cab-2ee872fc26a8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558a-79a8-256a-ee37a8d3cac4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558a-79a8-2173-9e3b66a5a079	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558a-79a8-f0ca-b48d590b007c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558a-79a8-4654-9269ae39659d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558a-79a8-2ffc-d1223f1e0e59	SD	SDN	729	Sudan 	Sudan	\N
00040000-558a-79a8-aaa0-0d6432f522bd	SR	SUR	740	Suriname 	Surinam	\N
00040000-558a-79a8-e2af-09e71a7dc4a6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558a-79a8-8384-32e0f299b14f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558a-79a8-63f0-a76f1060e2ee	SE	SWE	752	Sweden 	Švedska	\N
00040000-558a-79a8-b7f4-0ff2f0c3a07c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558a-79a8-7b84-beb0cd459301	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558a-79a8-c148-885441d378f6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558a-79a8-341b-121e27e7efb6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558a-79a8-4f97-2381abc119ba	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558a-79a8-6969-a0f31887a861	TH	THA	764	Thailand 	Tajska	\N
00040000-558a-79a8-d736-172cf048adf9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558a-79a8-d999-d90c8ba5db95	TG	TGO	768	Togo 	Togo	\N
00040000-558a-79a8-5523-f5f93a5f8633	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558a-79a8-b883-05e638089043	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558a-79a8-d995-ffb64837528f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558a-79a8-81e6-fa8503418a2b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558a-79a8-ebda-5556ea580857	TR	TUR	792	Turkey 	Turčija	\N
00040000-558a-79a8-ad7a-74873402d21a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558a-79a8-7f03-78cf7f89da7d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-79a8-f382-734e9250b120	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558a-79a8-0710-2f5c14844738	UG	UGA	800	Uganda 	Uganda	\N
00040000-558a-79a8-2c85-e270b3326db4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558a-79a8-4c85-bf4acc7736c7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558a-79a8-3ce2-7fda60c32a43	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558a-79a8-e5b8-2bfe9248bca3	US	USA	840	United States 	Združene države Amerike	\N
00040000-558a-79a8-702d-bd2ac9f5921a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558a-79a8-6cea-aa330e70b19b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558a-79a8-86e2-14e7bbee2414	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558a-79a8-539b-ef1ea8d90c7c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558a-79a8-ba67-5e1f3f331890	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558a-79a8-2f82-acab83e42657	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558a-79a8-f5dd-f6fc161a4878	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-79a8-a2eb-d1c9c060fa55	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558a-79a8-a546-9ad9058d8ad2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558a-79a8-a8dd-15fb124d92f5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558a-79a8-817b-e37a0e6d1331	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558a-79a8-d351-b3799adc0fc9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558a-79a8-f733-17d04c3dc96e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8130733)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8130536)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558a-79aa-e957-d311132d1f5f	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558a-79a9-9203-b2e3808412d0
000d0000-558a-79aa-3b6b-fb94778ff653	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-79a9-9203-b2e3808412d0
000d0000-558a-79aa-9a9b-ce6796841225	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558a-79a9-43a0-fa5077bc8e5c
000d0000-558a-79aa-64ad-4cec37c02a67	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558a-79a9-6504-79e43b1afafc
000d0000-558a-79aa-f993-dd7d8b544ce7	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558a-79a9-6504-79e43b1afafc
000d0000-558a-79aa-fd2e-48825f55d663	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558a-79a9-6504-79e43b1afafc
000d0000-558a-79aa-025d-3bdeebfc2612	000e0000-558a-79aa-0ba7-9af93229ad1b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-79a9-9203-b2e3808412d0
\.


--
-- TOC entry 2866 (class 0 OID 8130356)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8130404)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8130336)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558a-79aa-9200-61bfd9a2c5ed	00080000-558a-79aa-f2e6-ec18f4b3a9e3	00090000-558a-79aa-0d49-01515c4e78b5	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8130453)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8130478)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8130293)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558a-79a9-e2ed-5dac32e388ec	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558a-79a9-241f-0b50e5249a56	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558a-79a9-c3a2-dfbad813fa5b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558a-79a9-4348-412d1904cd5c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558a-79a9-e7c6-2e5ca11fb48b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558a-79a9-6fba-f2418d644398	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558a-79a9-fb1e-2202123c7e55	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558a-79a9-3531-6a5b8f01b063	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-79a9-f704-9f9af8e61f65	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-79a9-758a-519476f4e55a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558a-79a9-c01a-adcef1338edb	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558a-79a9-68e3-e0ddd8a706f6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558a-79a9-63a8-e32d68b838f4	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558a-79aa-2436-84b1325efa5c	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558a-79aa-29d3-8b221dbbac5c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558a-79aa-133c-6931ee05c64e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558a-79aa-bded-ff71cd10b89c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558a-79aa-d782-2db1375294ca	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558a-79aa-1dab-5164bda194d3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8130206)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558a-79aa-71ff-95305f32762e	00000000-558a-79aa-29d3-8b221dbbac5c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558a-79aa-ea19-777a43ea4b8b	00000000-558a-79aa-29d3-8b221dbbac5c	00010000-558a-79a8-2168-8d0f7f52af35	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558a-79aa-a3ee-589b7970f5e5	00000000-558a-79aa-133c-6931ee05c64e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8130217)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558a-79aa-4c96-6146da4519b4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558a-79aa-7d1e-8d6a2cdddd8a	00010000-558a-79aa-12db-5b87f17b9942	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558a-79aa-1bfa-554e635dfe54	00010000-558a-79aa-fb2c-6cf0c8e4e1f5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558a-79aa-cb7d-46aa00b64811	00010000-558a-79aa-5d39-6cd6efeb2ccb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558a-79aa-87bd-cf3bdb5e48ce	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558a-79aa-4345-a0f41f7a62ef	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558a-79aa-4d64-b73c3368bbc8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558a-79aa-327c-52772b3b555f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558a-79aa-0d49-01515c4e78b5	00010000-558a-79aa-9982-29a23389563f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558a-79aa-2479-c3550cd7730e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558a-79aa-2e9f-9b1b4c0740ee	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558a-79aa-6df0-cd858e3371bd	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558a-79aa-e57a-53beaad2366d	00010000-558a-79aa-fbfd-b619f5a4e0d9	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8130171)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558a-79a8-f8d8-c28bd1c07f08	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558a-79a8-d75c-1f23cf2ddde0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558a-79a8-eaf4-1526289d8a70	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558a-79a8-2a13-4c72d381eb64	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558a-79a8-f022-160c596aabd9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558a-79a8-5476-6aef448374bc	Abonma-read	Abonma - branje	f
00030000-558a-79a8-87b7-cc92fa60db12	Abonma-write	Abonma - spreminjanje	f
00030000-558a-79a8-4596-682c5c2f031e	Alternacija-read	Alternacija - branje	f
00030000-558a-79a8-b371-fd9009d91d5e	Alternacija-write	Alternacija - spreminjanje	f
00030000-558a-79a8-18fa-5efe1c260fb5	Arhivalija-read	Arhivalija - branje	f
00030000-558a-79a8-d939-be3b229a0b78	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558a-79a8-931d-22113f0f4d12	Besedilo-read	Besedilo - branje	f
00030000-558a-79a8-ad0f-42c4dfc83e5e	Besedilo-write	Besedilo - spreminjanje	f
00030000-558a-79a8-a331-e9be3ddb8eda	DogodekIzven-read	DogodekIzven - branje	f
00030000-558a-79a8-7d9d-a019773d2248	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558a-79a8-d4a0-8c6aff140d18	Dogodek-read	Dogodek - branje	f
00030000-558a-79a8-781a-4ed4bec83b34	Dogodek-write	Dogodek - spreminjanje	f
00030000-558a-79a8-ed39-e93b8c0034ef	DrugiVir-read	DrugiVir - branje	f
00030000-558a-79a8-8d96-36f864db9444	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558a-79a8-6e9c-b131bac9d8db	Drzava-read	Drzava - branje	f
00030000-558a-79a8-e468-058357dda7b4	Drzava-write	Drzava - spreminjanje	f
00030000-558a-79a8-7e4e-edf288e1ed9a	Funkcija-read	Funkcija - branje	f
00030000-558a-79a8-e753-5903f15ad01b	Funkcija-write	Funkcija - spreminjanje	f
00030000-558a-79a8-663f-470a70716d77	Gostovanje-read	Gostovanje - branje	f
00030000-558a-79a8-bb13-8f84ccfaa017	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558a-79a8-37e4-9ee8c6ae709b	Gostujoca-read	Gostujoca - branje	f
00030000-558a-79a8-e501-8e93529f7536	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558a-79a8-6c57-6ca721205225	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558a-79a8-42cd-5e88473cffb3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558a-79a8-6e72-b021183be218	Kupec-read	Kupec - branje	f
00030000-558a-79a8-799e-eb548c5cc6df	Kupec-write	Kupec - spreminjanje	f
00030000-558a-79a8-30ba-fd405071bea0	NacinPlacina-read	NacinPlacina - branje	f
00030000-558a-79a8-46d9-b61f12ffbe5e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558a-79a8-cb23-1084e0f5a73b	Option-read	Option - branje	f
00030000-558a-79a8-3ad7-d383454572dd	Option-write	Option - spreminjanje	f
00030000-558a-79a8-f28a-9ccc26839c62	OptionValue-read	OptionValue - branje	f
00030000-558a-79a8-2b97-bb17c6c19cf1	OptionValue-write	OptionValue - spreminjanje	f
00030000-558a-79a8-e5aa-748ddcb1e13a	Oseba-read	Oseba - branje	f
00030000-558a-79a8-8572-de98e64d8288	Oseba-write	Oseba - spreminjanje	f
00030000-558a-79a8-712c-13c31828a7a4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558a-79a8-c521-e74822ffd776	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558a-79a8-c652-4a467a5c130c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558a-79a8-c363-7ab110eb0dca	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558a-79a8-056e-f275689107a5	Pogodba-read	Pogodba - branje	f
00030000-558a-79a8-308d-7e05200063e3	Pogodba-write	Pogodba - spreminjanje	f
00030000-558a-79a8-967d-2f9467747ced	Popa-read	Popa - branje	f
00030000-558a-79a8-2d67-09c6aafd2bb6	Popa-write	Popa - spreminjanje	f
00030000-558a-79a8-6e6e-409dffca471f	Posta-read	Posta - branje	f
00030000-558a-79a8-c76e-a44e7f846d4e	Posta-write	Posta - spreminjanje	f
00030000-558a-79a8-016f-0edaa534668f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558a-79a8-da67-bfc38a2d175a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558a-79a8-b561-682f1890d431	PostniNaslov-read	PostniNaslov - branje	f
00030000-558a-79a8-7d16-e73e8b9e93f8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558a-79a8-7bba-f93a1151172f	Predstava-read	Predstava - branje	f
00030000-558a-79a8-7cd1-b44faa8244ea	Predstava-write	Predstava - spreminjanje	f
00030000-558a-79a8-b3bb-1028bbc70eb0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558a-79a8-6072-5fe6dc1f1a67	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558a-79a8-4b7c-e2aaf298f181	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558a-79a8-39ca-f95253b388d0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558a-79a8-8a6a-eb8d9403d2de	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558a-79a8-5fee-a95d2d390f4e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558a-79a8-b75c-37804022ff4a	ProgramDela-read	ProgramDela - branje	f
00030000-558a-79a8-caa6-b5d95c3e6713	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558a-79a8-a0cc-e1742cc25ddb	ProgramFestival-read	ProgramFestival - branje	f
00030000-558a-79a8-0034-4dc6b84a21f0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558a-79a8-3886-decd14e072ef	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558a-79a8-08f4-3508c08cad0c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558a-79a8-64cd-e7bce2dfbf86	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558a-79a8-9345-da287c008a67	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558a-79a8-86f4-ac650e0955d3	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558a-79a8-ea97-210d4a967fb4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558a-79a8-9da8-b36a9a78f7f5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558a-79a8-9e31-7efa953a43b7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558a-79a8-5476-e9488d29e4af	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558a-79a8-810d-d0b36ea0c434	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558a-79a8-66d1-af9becf42c3d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558a-79a8-d8f4-28853b500b1f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558a-79a8-fe55-6119eb427679	ProgramRazno-read	ProgramRazno - branje	f
00030000-558a-79a8-1b24-808e9b5ce3ed	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558a-79a8-2a64-4fc3557f82bd	Prostor-read	Prostor - branje	f
00030000-558a-79a8-7298-2935c99fe0a3	Prostor-write	Prostor - spreminjanje	f
00030000-558a-79a8-9692-51d19854ce79	Racun-read	Racun - branje	f
00030000-558a-79a8-7088-f784509e22e5	Racun-write	Racun - spreminjanje	f
00030000-558a-79a8-1f9b-ebd98a65687e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558a-79a8-51d5-8834eb6a1ca0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558a-79a8-b9c2-7b00ccffb601	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558a-79a8-bfdb-1bf13b1af3f3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558a-79a8-0963-43695ac82d20	Rekvizit-read	Rekvizit - branje	f
00030000-558a-79a8-3519-5b944f8e37f4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558a-79a8-392d-8d324393cd17	Revizija-read	Revizija - branje	f
00030000-558a-79a8-c178-4157d35e9f02	Revizija-write	Revizija - spreminjanje	f
00030000-558a-79a8-8226-8202e6bfa4fc	Rezervacija-read	Rezervacija - branje	f
00030000-558a-79a8-7f18-65b32d2bf5d5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558a-79a8-5e2f-d6bb53086b2f	SedezniRed-read	SedezniRed - branje	f
00030000-558a-79a8-0611-92736a771453	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558a-79a8-b5df-433e7011caf5	Sedez-read	Sedez - branje	f
00030000-558a-79a8-1e67-4b06799d6240	Sedez-write	Sedez - spreminjanje	f
00030000-558a-79a8-0be7-c20ac5ae0f79	Sezona-read	Sezona - branje	f
00030000-558a-79a8-a1d9-77c0db256ca5	Sezona-write	Sezona - spreminjanje	f
00030000-558a-79a8-1caf-762502e79297	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558a-79a8-ef9c-e34dd42a86e8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558a-79a8-f84e-92308f433124	Stevilcenje-read	Stevilcenje - branje	f
00030000-558a-79a8-176b-831459524f90	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558a-79a8-2503-7a9ae122c9dc	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558a-79a8-3407-59dbbb9568c1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558a-79a8-dc4a-ad91fcad57b7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558a-79a8-dca7-74a58cea016e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558a-79a8-8b96-a85f95787736	Telefonska-read	Telefonska - branje	f
00030000-558a-79a8-36bb-a38bced1c699	Telefonska-write	Telefonska - spreminjanje	f
00030000-558a-79a8-afb6-fb9584434377	TerminStoritve-read	TerminStoritve - branje	f
00030000-558a-79a8-965b-fd3b404ba255	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558a-79a8-00ef-bfd22cb485fa	TipFunkcije-read	TipFunkcije - branje	f
00030000-558a-79a8-ee0c-f829b5028ae6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558a-79a8-f2aa-dfcd600e548d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558a-79a8-8940-1459fbea7cb2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558a-79a8-1bab-1dde7f170cb7	Trr-read	Trr - branje	f
00030000-558a-79a8-ef61-8fe142822f44	Trr-write	Trr - spreminjanje	f
00030000-558a-79a8-dea0-f0ccd52cf7a8	Uprizoritev-read	Uprizoritev - branje	f
00030000-558a-79a8-3d14-662d06f8010f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558a-79a8-be22-a6f47aafd167	Vaja-read	Vaja - branje	f
00030000-558a-79a8-d200-86980dff8224	Vaja-write	Vaja - spreminjanje	f
00030000-558a-79a8-53d3-fb47777ca814	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558a-79a8-4534-a0821171fb00	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558a-79a8-43ac-6e7760a602f7	Zaposlitev-read	Zaposlitev - branje	f
00030000-558a-79a8-d410-4437d7aae3ff	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558a-79a8-45b3-5ffa503f82a8	Zasedenost-read	Zasedenost - branje	f
00030000-558a-79a8-5e50-1af17bc71b34	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558a-79a8-adf9-185bfe168a85	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558a-79a8-617e-f6902a93bedc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558a-79a8-1cf7-fa3966bd0a33	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558a-79a8-c641-2f0b18fe46c9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8130190)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558a-79a8-bab4-08d63ddd6ee7	00030000-558a-79a8-d75c-1f23cf2ddde0
00020000-558a-79a8-1cde-69977f24c016	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-87b7-cc92fa60db12
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-4596-682c5c2f031e
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-b371-fd9009d91d5e
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-2a13-4c72d381eb64
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-781a-4ed4bec83b34
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-e468-058357dda7b4
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-7e4e-edf288e1ed9a
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-e753-5903f15ad01b
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-bb13-8f84ccfaa017
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-e501-8e93529f7536
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-6c57-6ca721205225
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-42cd-5e88473cffb3
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-e5aa-748ddcb1e13a
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-8572-de98e64d8288
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-2d67-09c6aafd2bb6
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-c76e-a44e7f846d4e
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-b561-682f1890d431
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-7d16-e73e8b9e93f8
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-7cd1-b44faa8244ea
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-8a6a-eb8d9403d2de
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-5fee-a95d2d390f4e
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-7298-2935c99fe0a3
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-bfdb-1bf13b1af3f3
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-3519-5b944f8e37f4
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-a1d9-77c0db256ca5
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-00ef-bfd22cb485fa
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-dea0-f0ccd52cf7a8
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-3d14-662d06f8010f
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-be22-a6f47aafd167
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-d200-86980dff8224
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-45b3-5ffa503f82a8
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-5e50-1af17bc71b34
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79a8-ab94-f41caaeefd60	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-6c57-6ca721205225
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-42cd-5e88473cffb3
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-e5aa-748ddcb1e13a
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-8572-de98e64d8288
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-b561-682f1890d431
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-7d16-e73e8b9e93f8
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-8b96-a85f95787736
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-36bb-a38bced1c699
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-1bab-1dde7f170cb7
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-ef61-8fe142822f44
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-43ac-6e7760a602f7
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-d410-4437d7aae3ff
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79a8-3406-0d42dfc79cb0	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-4596-682c5c2f031e
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-d939-be3b229a0b78
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-931d-22113f0f4d12
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-a331-e9be3ddb8eda
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-7e4e-edf288e1ed9a
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-6c57-6ca721205225
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-e5aa-748ddcb1e13a
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-8a6a-eb8d9403d2de
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-00ef-bfd22cb485fa
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-be22-a6f47aafd167
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-45b3-5ffa503f82a8
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79a8-226b-5b1ccb9eb93f	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-87b7-cc92fa60db12
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-b371-fd9009d91d5e
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-00ef-bfd22cb485fa
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79a8-c8dc-b08c05c9cadc	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-afb6-fb9584434377
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-eaf4-1526289d8a70
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-00ef-bfd22cb485fa
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79a8-ae82-387f0546827d	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-f8d8-c28bd1c07f08
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d75c-1f23cf2ddde0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-eaf4-1526289d8a70
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-2a13-4c72d381eb64
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-f022-160c596aabd9
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-5476-6aef448374bc
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-87b7-cc92fa60db12
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-4596-682c5c2f031e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b371-fd9009d91d5e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-18fa-5efe1c260fb5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d939-be3b229a0b78
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-931d-22113f0f4d12
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-ad0f-42c4dfc83e5e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-a331-e9be3ddb8eda
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7d9d-a019773d2248
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d4a0-8c6aff140d18
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-781a-4ed4bec83b34
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-6e9c-b131bac9d8db
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-e468-058357dda7b4
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7e4e-edf288e1ed9a
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-e753-5903f15ad01b
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-663f-470a70716d77
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-bb13-8f84ccfaa017
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-37e4-9ee8c6ae709b
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-e501-8e93529f7536
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-6c57-6ca721205225
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-42cd-5e88473cffb3
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-6e72-b021183be218
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-799e-eb548c5cc6df
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-30ba-fd405071bea0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-46d9-b61f12ffbe5e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-cb23-1084e0f5a73b
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-3ad7-d383454572dd
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-f28a-9ccc26839c62
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-2b97-bb17c6c19cf1
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-e5aa-748ddcb1e13a
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-8572-de98e64d8288
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-712c-13c31828a7a4
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c521-e74822ffd776
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c652-4a467a5c130c
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c363-7ab110eb0dca
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-056e-f275689107a5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-308d-7e05200063e3
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-967d-2f9467747ced
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-2d67-09c6aafd2bb6
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-6e6e-409dffca471f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c76e-a44e7f846d4e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-016f-0edaa534668f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-da67-bfc38a2d175a
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b561-682f1890d431
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7d16-e73e8b9e93f8
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7bba-f93a1151172f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7cd1-b44faa8244ea
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b3bb-1028bbc70eb0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-6072-5fe6dc1f1a67
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-4b7c-e2aaf298f181
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-39ca-f95253b388d0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-8a6a-eb8d9403d2de
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-5fee-a95d2d390f4e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b75c-37804022ff4a
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-caa6-b5d95c3e6713
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-a0cc-e1742cc25ddb
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-0034-4dc6b84a21f0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-3886-decd14e072ef
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-08f4-3508c08cad0c
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-64cd-e7bce2dfbf86
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-9345-da287c008a67
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-86f4-ac650e0955d3
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-ea97-210d4a967fb4
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-9da8-b36a9a78f7f5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-9e31-7efa953a43b7
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-5476-e9488d29e4af
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-810d-d0b36ea0c434
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-66d1-af9becf42c3d
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d8f4-28853b500b1f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-fe55-6119eb427679
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1b24-808e9b5ce3ed
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-2a64-4fc3557f82bd
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7298-2935c99fe0a3
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-9692-51d19854ce79
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7088-f784509e22e5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1f9b-ebd98a65687e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-51d5-8834eb6a1ca0
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b9c2-7b00ccffb601
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-bfdb-1bf13b1af3f3
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-0963-43695ac82d20
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-3519-5b944f8e37f4
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-392d-8d324393cd17
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c178-4157d35e9f02
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-8226-8202e6bfa4fc
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-7f18-65b32d2bf5d5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-5e2f-d6bb53086b2f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-0611-92736a771453
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-b5df-433e7011caf5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1e67-4b06799d6240
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-0be7-c20ac5ae0f79
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-a1d9-77c0db256ca5
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1caf-762502e79297
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-ef9c-e34dd42a86e8
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-f84e-92308f433124
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-176b-831459524f90
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-2503-7a9ae122c9dc
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-3407-59dbbb9568c1
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-dc4a-ad91fcad57b7
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-dca7-74a58cea016e
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-8b96-a85f95787736
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-36bb-a38bced1c699
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-afb6-fb9584434377
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-965b-fd3b404ba255
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-00ef-bfd22cb485fa
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-ee0c-f829b5028ae6
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-f2aa-dfcd600e548d
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-8940-1459fbea7cb2
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1bab-1dde7f170cb7
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-ef61-8fe142822f44
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-dea0-f0ccd52cf7a8
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-3d14-662d06f8010f
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-be22-a6f47aafd167
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d200-86980dff8224
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-53d3-fb47777ca814
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-4534-a0821171fb00
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-43ac-6e7760a602f7
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-d410-4437d7aae3ff
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-45b3-5ffa503f82a8
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-5e50-1af17bc71b34
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-adf9-185bfe168a85
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-617e-f6902a93bedc
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-1cf7-fa3966bd0a33
00020000-558a-79aa-6e72-458ffe56796d	00030000-558a-79a8-c641-2f0b18fe46c9
\.


--
-- TOC entry 2881 (class 0 OID 8130485)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8130516)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8130651)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558a-79aa-419f-4fbe2fafb60f	00090000-558a-79aa-4c96-6146da4519b4	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8130250)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558a-79aa-f2e6-ec18f4b3a9e3	00040000-558a-79a8-b761-8def20b88fdb	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-79aa-d130-08a9a0526f9f	00040000-558a-79a8-b761-8def20b88fdb	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-79aa-245e-74a2501d95ad	00040000-558a-79a8-b761-8def20b88fdb	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-79aa-b244-87b2fd86224d	00040000-558a-79a8-b761-8def20b88fdb	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-79aa-4c43-92bc069bda86	00040000-558a-79a8-b761-8def20b88fdb	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-79aa-ce21-f983895efa3b	00040000-558a-79a8-8bdf-d586e6adc6a0	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8130285)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558a-79a9-0d07-62cb21f5f785	8341	Adlešiči
00050000-558a-79a9-7a9d-ca5b0f42a6b1	5270	Ajdovščina
00050000-558a-79a9-a334-255e93fbfe3a	6280	Ankaran/Ancarano
00050000-558a-79a9-2a45-0c4c3a5b24ae	9253	Apače
00050000-558a-79a9-fbab-5a155de0fd48	8253	Artiče
00050000-558a-79a9-56ed-9f0815f56537	4275	Begunje na Gorenjskem
00050000-558a-79a9-151d-d35c4901a48f	1382	Begunje pri Cerknici
00050000-558a-79a9-cf6a-b700aca05ec7	9231	Beltinci
00050000-558a-79a9-a812-a762139181bf	2234	Benedikt
00050000-558a-79a9-fd36-c922f0c58633	2345	Bistrica ob Dravi
00050000-558a-79a9-844a-624142343956	3256	Bistrica ob Sotli
00050000-558a-79a9-4e53-67d2d9669f26	8259	Bizeljsko
00050000-558a-79a9-36a0-81bad71dd32a	1223	Blagovica
00050000-558a-79a9-7f23-4a88ad2064e8	8283	Blanca
00050000-558a-79a9-4e1d-7aa1f474110a	4260	Bled
00050000-558a-79a9-ca47-b33f6e4da74b	4273	Blejska Dobrava
00050000-558a-79a9-fc03-663433382793	9265	Bodonci
00050000-558a-79a9-e578-6092b7f403de	9222	Bogojina
00050000-558a-79a9-4818-e80ef42fa399	4263	Bohinjska Bela
00050000-558a-79a9-5ddf-ef08352b3d49	4264	Bohinjska Bistrica
00050000-558a-79a9-f6d0-24f21206904b	4265	Bohinjsko jezero
00050000-558a-79a9-c8ef-0e4db756b278	1353	Borovnica
00050000-558a-79a9-9c9c-f582573e1b96	8294	Boštanj
00050000-558a-79a9-c43f-052968400bf9	5230	Bovec
00050000-558a-79a9-d625-efecc05874a5	5295	Branik
00050000-558a-79a9-5324-89ca46c85a30	3314	Braslovče
00050000-558a-79a9-7d3d-77af265f2dae	5223	Breginj
00050000-558a-79a9-b1f4-d4dc474fbe4e	8280	Brestanica
00050000-558a-79a9-e23e-4e7bcc0a5d6a	2354	Bresternica
00050000-558a-79a9-f17c-ef646b3af603	4243	Brezje
00050000-558a-79a9-4209-6c3a3ae800c4	1351	Brezovica pri Ljubljani
00050000-558a-79a9-f15f-c965c32cd876	8250	Brežice
00050000-558a-79a9-7184-39a3ae7c714d	4210	Brnik - Aerodrom
00050000-558a-79a9-2c0f-5c625476b23c	8321	Brusnice
00050000-558a-79a9-c5a5-37c42f0804a6	3255	Buče
00050000-558a-79a9-6ac5-fd1d0f512e9c	8276	Bučka 
00050000-558a-79a9-e967-2bd1548691c4	9261	Cankova
00050000-558a-79a9-89db-482deef4bfe6	3000	Celje 
00050000-558a-79a9-9300-fd40195170d9	3001	Celje - poštni predali
00050000-558a-79a9-030f-36d6a6de6a8f	4207	Cerklje na Gorenjskem
00050000-558a-79a9-31be-b79c725803e8	8263	Cerklje ob Krki
00050000-558a-79a9-e18b-13d5814d6b39	1380	Cerknica
00050000-558a-79a9-042b-e77910828288	5282	Cerkno
00050000-558a-79a9-def2-c3df41615374	2236	Cerkvenjak
00050000-558a-79a9-adda-6997a0bfed62	2215	Ceršak
00050000-558a-79a9-0ed1-77932efc9e6e	2326	Cirkovce
00050000-558a-79a9-61f8-256246381b72	2282	Cirkulane
00050000-558a-79a9-2ae5-46e365fea76e	5273	Col
00050000-558a-79a9-e148-30e460aa42cf	8251	Čatež ob Savi
00050000-558a-79a9-7099-38906c68dfdb	1413	Čemšenik
00050000-558a-79a9-8d5c-ec716a8ec31d	5253	Čepovan
00050000-558a-79a9-1a15-440539b2a8fe	9232	Črenšovci
00050000-558a-79a9-0643-d014db4bc319	2393	Črna na Koroškem
00050000-558a-79a9-5f57-f46aa92d6823	6275	Črni Kal
00050000-558a-79a9-6a36-918fc1b1e061	5274	Črni Vrh nad Idrijo
00050000-558a-79a9-c6ec-678da242e6e1	5262	Črniče
00050000-558a-79a9-2e51-115a93c97797	8340	Črnomelj
00050000-558a-79a9-2025-d5b67feadd4d	6271	Dekani
00050000-558a-79a9-c7d9-99476c7bc8b8	5210	Deskle
00050000-558a-79a9-2bce-9dba7515d71e	2253	Destrnik
00050000-558a-79a9-17c9-73b4881f7939	6215	Divača
00050000-558a-79a9-3899-84a260fb33f6	1233	Dob
00050000-558a-79a9-e04c-0585fe2c1b84	3224	Dobje pri Planini
00050000-558a-79a9-f77c-73bfefeea675	8257	Dobova
00050000-558a-79a9-1fe4-47f606fb0e8a	1423	Dobovec
00050000-558a-79a9-c5f9-5049d8562341	5263	Dobravlje
00050000-558a-79a9-7ce9-75e228bc6603	3204	Dobrna
00050000-558a-79a9-e608-27f29dba4a25	8211	Dobrnič
00050000-558a-79a9-4a71-184852429f1a	1356	Dobrova
00050000-558a-79a9-a558-0593edb1351e	9223	Dobrovnik/Dobronak 
00050000-558a-79a9-664d-94cae1465d8b	5212	Dobrovo v Brdih
00050000-558a-79a9-2246-48c4ac21547d	1431	Dol pri Hrastniku
00050000-558a-79a9-a244-af3a3a71ccb1	1262	Dol pri Ljubljani
00050000-558a-79a9-300b-d1cf76b67210	1273	Dole pri Litiji
00050000-558a-79a9-4b01-0cbc01515fed	1331	Dolenja vas
00050000-558a-79a9-8151-92b1593a1b40	8350	Dolenjske Toplice
00050000-558a-79a9-ef74-29c1eadb97a6	1230	Domžale
00050000-558a-79a9-16fa-f220106306c3	2252	Dornava
00050000-558a-79a9-e320-80cc8a6d5f47	5294	Dornberk
00050000-558a-79a9-86c1-524ee8d17c5e	1319	Draga
00050000-558a-79a9-6450-b02180bb4cae	8343	Dragatuš
00050000-558a-79a9-7f56-78769e024980	3222	Dramlje
00050000-558a-79a9-38ec-5c95a1b6109d	2370	Dravograd
00050000-558a-79a9-1287-b26da61bf083	4203	Duplje
00050000-558a-79a9-87b3-0d3f00b74023	6221	Dutovlje
00050000-558a-79a9-3bed-d6610d1c43f7	8361	Dvor
00050000-558a-79a9-6ebf-10c58562367d	2343	Fala
00050000-558a-79a9-bcc3-ea5bfe577517	9208	Fokovci
00050000-558a-79a9-e53d-1f10a925e70e	2313	Fram
00050000-558a-79a9-bee9-33e04609dd17	3213	Frankolovo
00050000-558a-79a9-0cf1-03627798b5f4	1274	Gabrovka
00050000-558a-79a9-8a53-93e28b362842	8254	Globoko
00050000-558a-79a9-0c1b-c45efdd4e89b	5275	Godovič
00050000-558a-79a9-ec46-c7f0bf700f54	4204	Golnik
00050000-558a-79a9-fbdc-4695657fce0b	3303	Gomilsko
00050000-558a-79a9-b6e1-dd9789d3dc0b	4224	Gorenja vas
00050000-558a-79a9-2967-60614aef073f	3263	Gorica pri Slivnici
00050000-558a-79a9-8da3-f118905be03c	2272	Gorišnica
00050000-558a-79a9-aa30-b9093dd69fe6	9250	Gornja Radgona
00050000-558a-79a9-0a2a-a113265c1b6b	3342	Gornji Grad
00050000-558a-79a9-ffda-9f7795017988	4282	Gozd Martuljek
00050000-558a-79a9-2b0c-5628b6de33d3	6272	Gračišče
00050000-558a-79a9-1f21-c0f2276df6ce	9264	Grad
00050000-558a-79a9-6cb6-28976a9e6a34	8332	Gradac
00050000-558a-79a9-f887-ee342cc383c8	1384	Grahovo
00050000-558a-79a9-86bc-6c263a3fad09	5242	Grahovo ob Bači
00050000-558a-79a9-c671-01bca8f38678	5251	Grgar
00050000-558a-79a9-1d00-78d1aff6e8a3	3302	Griže
00050000-558a-79a9-b9a2-8953a2e80568	3231	Grobelno
00050000-558a-79a9-e875-acaa7b3a4a48	1290	Grosuplje
00050000-558a-79a9-7a37-4a841ba42a1f	2288	Hajdina
00050000-558a-79a9-a9a1-365ffb0ddbb1	8362	Hinje
00050000-558a-79a9-0652-8dbe69d98038	2311	Hoče
00050000-558a-79a9-caa7-c8e53ef50a6c	9205	Hodoš/Hodos
00050000-558a-79a9-076d-25e23437364f	1354	Horjul
00050000-558a-79a9-d60a-dbd486a4ad33	1372	Hotedršica
00050000-558a-79a9-1de5-8444003d16ff	1430	Hrastnik
00050000-558a-79a9-d27a-0946bb7cb38b	6225	Hruševje
00050000-558a-79a9-36e8-537293525d48	4276	Hrušica
00050000-558a-79a9-2489-2899626cb946	5280	Idrija
00050000-558a-79a9-ac83-be9f59ed6809	1292	Ig
00050000-558a-79a9-bf33-deb360db0a47	6250	Ilirska Bistrica
00050000-558a-79a9-2cc9-21a0bc4ec21c	6251	Ilirska Bistrica-Trnovo
00050000-558a-79a9-c6db-2a92bd2710de	1295	Ivančna Gorica
00050000-558a-79a9-e59c-57a1e780d0ff	2259	Ivanjkovci
00050000-558a-79a9-f9ae-ee13a2b9fee8	1411	Izlake
00050000-558a-79a9-98f7-367bf754a3ae	6310	Izola/Isola
00050000-558a-79a9-bdfe-1a3567b3d1a9	2222	Jakobski Dol
00050000-558a-79a9-1f26-dda578e70673	2221	Jarenina
00050000-558a-79a9-49d3-009a2e881827	6254	Jelšane
00050000-558a-79a9-990b-6fcafd6c5899	4270	Jesenice
00050000-558a-79a9-6e7a-a49851105611	8261	Jesenice na Dolenjskem
00050000-558a-79a9-c699-7b4ccc3e5bbc	3273	Jurklošter
00050000-558a-79a9-ed73-80b2be2128d8	2223	Jurovski Dol
00050000-558a-79a9-c52b-08feda10d1b5	2256	Juršinci
00050000-558a-79a9-2ff4-20b9e8cccc82	5214	Kal nad Kanalom
00050000-558a-79a9-2686-0cfb7060d7fa	3233	Kalobje
00050000-558a-79a9-49f5-206ed252bd19	4246	Kamna Gorica
00050000-558a-79a9-2a8e-3394b70f704d	2351	Kamnica
00050000-558a-79a9-8bd3-d647098e8214	1241	Kamnik
00050000-558a-79a9-c463-0c9fbbc266c4	5213	Kanal
00050000-558a-79a9-024f-7ed7dbbdbfee	8258	Kapele
00050000-558a-79a9-d5c2-74646f5bed5a	2362	Kapla
00050000-558a-79a9-6e76-9f0e1676f356	2325	Kidričevo
00050000-558a-79a9-90ba-5c987400f990	1412	Kisovec
00050000-558a-79a9-a8b1-3b43aa3eb332	6253	Knežak
00050000-558a-79a9-b755-f0f7231223a1	5222	Kobarid
00050000-558a-79a9-681e-2499b7f9cab1	9227	Kobilje
00050000-558a-79a9-5706-6387b6213eab	1330	Kočevje
00050000-558a-79a9-70e7-531abed54557	1338	Kočevska Reka
00050000-558a-79a9-2a1f-8b542f6a7824	2276	Kog
00050000-558a-79a9-a0ca-61aeb5587e24	5211	Kojsko
00050000-558a-79a9-4bff-3d0e09c99790	6223	Komen
00050000-558a-79a9-3438-05b873dbf38c	1218	Komenda
00050000-558a-79a9-ca69-44678f1eba12	6000	Koper/Capodistria 
00050000-558a-79a9-aa18-7185e2b55f6b	6001	Koper/Capodistria - poštni predali
00050000-558a-79a9-432f-9bfefbc12079	8282	Koprivnica
00050000-558a-79a9-1ab6-3cd672693c37	5296	Kostanjevica na Krasu
00050000-558a-79a9-3354-34f77fc217bd	8311	Kostanjevica na Krki
00050000-558a-79a9-4aab-4b20e2a961ac	1336	Kostel
00050000-558a-79a9-bf0b-f1145083fb18	6256	Košana
00050000-558a-79a9-fe20-3ced86eed655	2394	Kotlje
00050000-558a-79a9-c76f-c071c2bf116c	6240	Kozina
00050000-558a-79a9-dd14-a8568a1c9a88	3260	Kozje
00050000-558a-79a9-043f-a59bf6b0071c	4000	Kranj 
00050000-558a-79a9-a2ec-ee7101c4d67b	4001	Kranj - poštni predali
00050000-558a-79a9-aee2-23164e1d93f7	4280	Kranjska Gora
00050000-558a-79a9-deff-b92d320c97f4	1281	Kresnice
00050000-558a-79a9-358d-35ae01586bd1	4294	Križe
00050000-558a-79a9-fd3a-5cc96ba9f7a3	9206	Križevci
00050000-558a-79a9-cbcd-131afe675286	9242	Križevci pri Ljutomeru
00050000-558a-79a9-c97f-caf004be87f8	1301	Krka
00050000-558a-79a9-6696-e8fdaadbf914	8296	Krmelj
00050000-558a-79a9-c6e8-a1ae58ec822e	4245	Kropa
00050000-558a-79a9-14a5-dd69cf95ceec	8262	Krška vas
00050000-558a-79a9-d7ee-7cacc113daa9	8270	Krško
00050000-558a-79a9-f18b-c672c72cc888	9263	Kuzma
00050000-558a-79a9-3bae-697d076d3fb2	2318	Laporje
00050000-558a-79a9-d597-6c5e8ffe52ae	3270	Laško
00050000-558a-79a9-3a44-ebd72d3f7ef1	1219	Laze v Tuhinju
00050000-558a-79a9-dd4c-bbe2fc0950f1	2230	Lenart v Slovenskih goricah
00050000-558a-79a9-828f-3b5f7192425e	9220	Lendava/Lendva
00050000-558a-79a9-3f38-d4b397ec513b	4248	Lesce
00050000-558a-79a9-f648-5b30aee62618	3261	Lesično
00050000-558a-79a9-3238-68858d15dbaa	8273	Leskovec pri Krškem
00050000-558a-79a9-125e-82edb2b165f8	2372	Libeliče
00050000-558a-79a9-ed90-8c03dd8f223b	2341	Limbuš
00050000-558a-79a9-0a0e-757b8b758210	1270	Litija
00050000-558a-79a9-72b8-0db3713f34ee	3202	Ljubečna
00050000-558a-79a9-c9d1-4325bb1d5d49	1000	Ljubljana 
00050000-558a-79a9-9675-cce26e9e2cd4	1001	Ljubljana - poštni predali
00050000-558a-79a9-060b-87fd5f68b4a8	1231	Ljubljana - Črnuče
00050000-558a-79a9-bd1b-b2dfec2145dc	1261	Ljubljana - Dobrunje
00050000-558a-79a9-878e-424d7e13d499	1260	Ljubljana - Polje
00050000-558a-79a9-5476-bd9d3897f0ad	1210	Ljubljana - Šentvid
00050000-558a-79a9-9eb4-2073116ba0c9	1211	Ljubljana - Šmartno
00050000-558a-79a9-6fc8-80c6c56aef87	3333	Ljubno ob Savinji
00050000-558a-79a9-65c0-25ec0a445682	9240	Ljutomer
00050000-558a-79a9-014e-5a9289e2659e	3215	Loče
00050000-558a-79a9-88fb-d39f70866774	5231	Log pod Mangartom
00050000-558a-79a9-08c5-dfc34e991198	1358	Log pri Brezovici
00050000-558a-79a9-579c-01c7169abc4f	1370	Logatec
00050000-558a-79a9-2eb2-59c8a1037fb5	1371	Logatec
00050000-558a-79a9-00d9-f3502c41a9d1	1434	Loka pri Zidanem Mostu
00050000-558a-79a9-d70c-d96c6bdde171	3223	Loka pri Žusmu
00050000-558a-79a9-7757-e8154a9973d4	6219	Lokev
00050000-558a-79a9-b172-2ee73def291b	1318	Loški Potok
00050000-558a-79a9-a1ca-e1c702b957cb	2324	Lovrenc na Dravskem polju
00050000-558a-79a9-d9ea-809d99e36737	2344	Lovrenc na Pohorju
00050000-558a-79a9-d129-d2bb3046cd8b	3334	Luče
00050000-558a-79a9-5734-1757e2874d55	1225	Lukovica
00050000-558a-79a9-00c3-a90e55b8cf07	9202	Mačkovci
00050000-558a-79a9-37b3-af229024e94c	2322	Majšperk
00050000-558a-79a9-6030-249f0e189e6b	2321	Makole
00050000-558a-79a9-11d1-87e9eb5954d0	9243	Mala Nedelja
00050000-558a-79a9-9ced-b4377c4ce248	2229	Malečnik
00050000-558a-79a9-118d-ff38ce7aae4e	6273	Marezige
00050000-558a-79a9-2863-d02f942fb2f9	2000	Maribor 
00050000-558a-79a9-9275-35f0ae64fe55	2001	Maribor - poštni predali
00050000-558a-79a9-c3af-b00a162016e4	2206	Marjeta na Dravskem polju
00050000-558a-79a9-8ae3-1d81ddacd768	2281	Markovci
00050000-558a-79a9-786d-3e1a20c2d99f	9221	Martjanci
00050000-558a-79a9-1e9b-75b3a83f962e	6242	Materija
00050000-558a-79a9-9702-a5224f85a8be	4211	Mavčiče
00050000-558a-79a9-e702-40f54f625b40	1215	Medvode
00050000-558a-79a9-ff33-c976582b1966	1234	Mengeš
00050000-558a-79a9-3bd6-90d5510a4ed2	8330	Metlika
00050000-558a-79a9-2ed0-7f57130f3ce2	2392	Mežica
00050000-558a-79a9-06f8-3130a3886214	2204	Miklavž na Dravskem polju
00050000-558a-79a9-b101-7400865d835b	2275	Miklavž pri Ormožu
00050000-558a-79a9-4472-8f1b02dd1c8d	5291	Miren
00050000-558a-79a9-e1dc-dadd2014a629	8233	Mirna
00050000-558a-79a9-544e-63eb49bc02bf	8216	Mirna Peč
00050000-558a-79a9-ff88-503bb4825c2b	2382	Mislinja
00050000-558a-79a9-33a6-11ed612d33e1	4281	Mojstrana
00050000-558a-79a9-c391-54c3c42b7622	8230	Mokronog
00050000-558a-79a9-ca40-0b8189195672	1251	Moravče
00050000-558a-79a9-b1f3-2f9367bd0a72	9226	Moravske Toplice
00050000-558a-79a9-8449-2f45568107f8	5216	Most na Soči
00050000-558a-79a9-8fa3-9db821edacdf	1221	Motnik
00050000-558a-79a9-0173-52f052ed7b11	3330	Mozirje
00050000-558a-79a9-6004-3180a7226b9d	9000	Murska Sobota 
00050000-558a-79a9-29ae-ebb3f0b0fc83	9001	Murska Sobota - poštni predali
00050000-558a-79a9-3d9b-beb519ec9035	2366	Muta
00050000-558a-79a9-e1f2-17b77a0500db	4202	Naklo
00050000-558a-79a9-745c-4e57ebde2c48	3331	Nazarje
00050000-558a-79a9-5d53-3df990e14119	1357	Notranje Gorice
00050000-558a-79a9-337a-258264ec2ddf	3203	Nova Cerkev
00050000-558a-79a9-4d61-9304d0957681	5000	Nova Gorica 
00050000-558a-79a9-2fb9-56c6a3cc5e33	5001	Nova Gorica - poštni predali
00050000-558a-79a9-fbf3-166fce9f0c13	1385	Nova vas
00050000-558a-79a9-2548-4088e9570aa8	8000	Novo mesto
00050000-558a-79a9-3cc0-e6cfa609f743	8001	Novo mesto - poštni predali
00050000-558a-79a9-0468-4cf85362eed0	6243	Obrov
00050000-558a-79a9-02b8-4dfa7ccc4177	9233	Odranci
00050000-558a-79a9-750d-bdf1a1864e8c	2317	Oplotnica
00050000-558a-79a9-ced1-de14d82fd402	2312	Orehova vas
00050000-558a-79a9-7fae-9c6c19352a3c	2270	Ormož
00050000-558a-79a9-c44e-15bc1f52fe00	1316	Ortnek
00050000-558a-79a9-43a9-47d810e59cd9	1337	Osilnica
00050000-558a-79a9-01e3-59bd8f8dc758	8222	Otočec
00050000-558a-79a9-32ac-2637d72e82b3	2361	Ožbalt
00050000-558a-79a9-b5bb-93fc7e5f6edd	2231	Pernica
00050000-558a-79a9-c52c-d4f2d3c5e59a	2211	Pesnica pri Mariboru
00050000-558a-79a9-f550-0c5a7a874497	9203	Petrovci
00050000-558a-79a9-488d-167c5556702c	3301	Petrovče
00050000-558a-79a9-2c00-3638365236c9	6330	Piran/Pirano
00050000-558a-79a9-ebec-8aa94822586c	8255	Pišece
00050000-558a-79a9-ff8a-ba74f849fdcc	6257	Pivka
00050000-558a-79a9-226c-97d11cce0d57	6232	Planina
00050000-558a-79a9-46e2-4862add75f33	3225	Planina pri Sevnici
00050000-558a-79a9-2456-4c263d46dbca	6276	Pobegi
00050000-558a-79a9-64e7-46f520ecf7d5	8312	Podbočje
00050000-558a-79a9-ba7c-5fa4d41f3e35	5243	Podbrdo
00050000-558a-79a9-181e-5a6756c63fd8	3254	Podčetrtek
00050000-558a-79a9-f582-dd0e34fb36c1	2273	Podgorci
00050000-558a-79a9-5bd1-c99e0e5ce58f	6216	Podgorje
00050000-558a-79a9-fa5a-6ae775df2970	2381	Podgorje pri Slovenj Gradcu
00050000-558a-79a9-a5e6-10cc78f49ea7	6244	Podgrad
00050000-558a-79a9-fa37-a18434924919	1414	Podkum
00050000-558a-79a9-3c4d-a013544ac31e	2286	Podlehnik
00050000-558a-79a9-a8b4-5cf9426d96eb	5272	Podnanos
00050000-558a-79a9-8253-9cfd00494bee	4244	Podnart
00050000-558a-79a9-89bb-7fd94efce0ba	3241	Podplat
00050000-558a-79a9-c2e5-e426257c7f07	3257	Podsreda
00050000-558a-79a9-5ed2-393a803af27a	2363	Podvelka
00050000-558a-79a9-bfee-d8bff5e2ace5	2208	Pohorje
00050000-558a-79a9-07be-eb5eaa847558	2257	Polenšak
00050000-558a-79a9-1e68-6e5e6d73bada	1355	Polhov Gradec
00050000-558a-79a9-8080-2f67acc999fe	4223	Poljane nad Škofjo Loko
00050000-558a-79a9-1405-b1fb17a05358	2319	Poljčane
00050000-558a-79a9-fb32-681281251e41	1272	Polšnik
00050000-558a-79a9-f86a-c6deb1ee0fb2	3313	Polzela
00050000-558a-79a9-a321-e8577dbe341e	3232	Ponikva
00050000-558a-79a9-2eeb-3af1714599e3	6320	Portorož/Portorose
00050000-558a-79a9-67b0-af0aa65c86af	6230	Postojna
00050000-558a-79a9-9102-f2d9aa60d34e	2331	Pragersko
00050000-558a-79a9-4120-ecf3301161f7	3312	Prebold
00050000-558a-79a9-e35c-711cec3a9449	4205	Preddvor
00050000-558a-79a9-13ab-38afc0f632b7	6255	Prem
00050000-558a-79a9-4380-f37ac59d75da	1352	Preserje
00050000-558a-79a9-6afa-6b999113c1ab	6258	Prestranek
00050000-558a-79a9-4ac9-71eb7eae9016	2391	Prevalje
00050000-558a-79a9-2a29-728f8c34436d	3262	Prevorje
00050000-558a-79a9-0f3f-5b56b9c2f507	1276	Primskovo 
00050000-558a-79a9-8355-7c25a8021eb3	3253	Pristava pri Mestinju
00050000-558a-79a9-e677-e6cae67683cc	9207	Prosenjakovci/Partosfalva
00050000-558a-79a9-7ac8-1794616dcfd2	5297	Prvačina
00050000-558a-79a9-7862-ec405ef99cd6	2250	Ptuj
00050000-558a-79a9-7a64-09fe8003bb0d	2323	Ptujska Gora
00050000-558a-79a9-f247-2882429762f8	9201	Puconci
00050000-558a-79a9-1384-a2df7ef97690	2327	Rače
00050000-558a-79a9-5783-26ca371b5257	1433	Radeče
00050000-558a-79a9-0eb1-f8b560456ebf	9252	Radenci
00050000-558a-79a9-9582-af7194a0591c	2360	Radlje ob Dravi
00050000-558a-79a9-044d-7f3b935532dc	1235	Radomlje
00050000-558a-79a9-a8d5-cea60333041e	4240	Radovljica
00050000-558a-79a9-fa86-d79263a91eef	8274	Raka
00050000-558a-79a9-b426-66cf90fb6946	1381	Rakek
00050000-558a-79a9-6a61-99eafdfd748e	4283	Rateče - Planica
00050000-558a-79a9-b2f1-e40a63943446	2390	Ravne na Koroškem
00050000-558a-79a9-b6c4-ff7fdc4fc892	9246	Razkrižje
00050000-558a-79a9-c84d-2e37fc9fbd3c	3332	Rečica ob Savinji
00050000-558a-79a9-88da-888b59faeaaa	5292	Renče
00050000-558a-79a9-6c1a-76ec4967bda5	1310	Ribnica
00050000-558a-79a9-40cd-6ff7e6193d98	2364	Ribnica na Pohorju
00050000-558a-79a9-ee6a-2677f4f74a93	3272	Rimske Toplice
00050000-558a-79a9-3de0-3a774ade6670	1314	Rob
00050000-558a-79a9-1c67-518ee87ca325	5215	Ročinj
00050000-558a-79a9-edd5-35efcf3a66da	3250	Rogaška Slatina
00050000-558a-79a9-8313-3221f53d635c	9262	Rogašovci
00050000-558a-79a9-d7f0-56c1c95c3eda	3252	Rogatec
00050000-558a-79a9-2d4f-33cab6e9a6e0	1373	Rovte
00050000-558a-79a9-c3d1-f842ce842fdb	2342	Ruše
00050000-558a-79a9-8e86-b956f39c77ef	1282	Sava
00050000-558a-79a9-5a24-78b8fb3c0448	6333	Sečovlje/Sicciole
00050000-558a-79a9-464c-16fd5c10e34b	4227	Selca
00050000-558a-79a9-ecc4-156af3fb5248	2352	Selnica ob Dravi
00050000-558a-79a9-e5e6-f2009e492bb4	8333	Semič
00050000-558a-79a9-415c-d976e1f455bf	8281	Senovo
00050000-558a-79a9-b222-35a51a27a07b	6224	Senožeče
00050000-558a-79a9-0ac4-c7c2e71da52e	8290	Sevnica
00050000-558a-79a9-66dd-0eace2fe3d7a	6210	Sežana
00050000-558a-79a9-4ee1-eeec6c97bbce	2214	Sladki Vrh
00050000-558a-79a9-9084-ba707a112e1e	5283	Slap ob Idrijci
00050000-558a-79a9-95fb-ffcaeb1a19c5	2380	Slovenj Gradec
00050000-558a-79a9-171d-1e0274c57127	2310	Slovenska Bistrica
00050000-558a-79a9-86a7-6bdc586581b9	3210	Slovenske Konjice
00050000-558a-79a9-9cf8-c5ee2071448f	1216	Smlednik
00050000-558a-79a9-9846-633acd0e5cda	5232	Soča
00050000-558a-79a9-5e91-5856005c6297	1317	Sodražica
00050000-558a-79a9-2000-407fa9896043	3335	Solčava
00050000-558a-79a9-3fa2-339721eef402	5250	Solkan
00050000-558a-79a9-0785-d5be6419d2cb	4229	Sorica
00050000-558a-79a9-8789-c1898abd799b	4225	Sovodenj
00050000-558a-79a9-90c5-54656b5e4516	5281	Spodnja Idrija
00050000-558a-79a9-38f2-ec1e02027ec6	2241	Spodnji Duplek
00050000-558a-79a9-44a3-ce04cdb11cbe	9245	Spodnji Ivanjci
00050000-558a-79a9-3110-28c890c34852	2277	Središče ob Dravi
00050000-558a-79a9-290c-62068feda2b4	4267	Srednja vas v Bohinju
00050000-558a-79a9-e614-d98c35a4d330	8256	Sromlje 
00050000-558a-79a9-794f-a1084be25a20	5224	Srpenica
00050000-558a-79a9-3186-736f8a1b4a77	1242	Stahovica
00050000-558a-79a9-786c-4a61d8b187e0	1332	Stara Cerkev
00050000-558a-79a9-b02a-1e3ddebdfd4f	8342	Stari trg ob Kolpi
00050000-558a-79a9-3e25-758bb60bfa98	1386	Stari trg pri Ložu
00050000-558a-79a9-5d5d-598ddf77598b	2205	Starše
00050000-558a-79a9-bdc7-bbc13af29dbf	2289	Stoperce
00050000-558a-79a9-b0d8-ddd47f44c91a	8322	Stopiče
00050000-558a-79a9-c2d6-5a2aa76d9501	3206	Stranice
00050000-558a-79a9-c080-ae9e65691a29	8351	Straža
00050000-558a-79a9-63b4-1a3a8a728424	1313	Struge
00050000-558a-79a9-3c34-466b59efaba2	8293	Studenec
00050000-558a-79a9-9846-fbc3be051cd1	8331	Suhor
00050000-558a-79a9-d202-63db2a6c0ad3	2233	Sv. Ana v Slovenskih goricah
00050000-558a-79a9-441a-92848a473357	2235	Sv. Trojica v Slovenskih goricah
00050000-558a-79a9-0b1c-07eba08f727d	2353	Sveti Duh na Ostrem Vrhu
00050000-558a-79a9-65ea-824bb30d5f22	9244	Sveti Jurij ob Ščavnici
00050000-558a-79a9-7a57-12209d939eb8	3264	Sveti Štefan
00050000-558a-79a9-62dc-fab5447f7cee	2258	Sveti Tomaž
00050000-558a-79a9-7211-230f6cd42e2f	9204	Šalovci
00050000-558a-79a9-f242-5897beb1b1a3	5261	Šempas
00050000-558a-79a9-b582-655e8331a37e	5290	Šempeter pri Gorici
00050000-558a-79a9-1dfe-191e4b0b1831	3311	Šempeter v Savinjski dolini
00050000-558a-79a9-7a4d-2e3111e264d6	4208	Šenčur
00050000-558a-79a9-f810-210c8ef7a9e8	2212	Šentilj v Slovenskih goricah
00050000-558a-79a9-37c7-4be95e9a78c4	8297	Šentjanž
00050000-558a-79a9-b1fe-1c523a870604	2373	Šentjanž pri Dravogradu
00050000-558a-79a9-f3d1-d3608c9c1d1b	8310	Šentjernej
00050000-558a-79a9-c71a-476f7a43b46d	3230	Šentjur
00050000-558a-79a9-5d7e-a99496e77c22	3271	Šentrupert
00050000-558a-79a9-62ab-9a839f44c194	8232	Šentrupert
00050000-558a-79a9-3646-6a893cc4d9ef	1296	Šentvid pri Stični
00050000-558a-79a9-739a-e6eb5cbf580e	8275	Škocjan
00050000-558a-79a9-c576-0350ec99e943	6281	Škofije
00050000-558a-79a9-bbce-e377d8cb5eda	4220	Škofja Loka
00050000-558a-79a9-6d73-ca8ed632d68f	3211	Škofja vas
00050000-558a-79a9-dbd2-307556b7b855	1291	Škofljica
00050000-558a-79a9-faa0-ab3e35940215	6274	Šmarje
00050000-558a-79a9-210b-6446a97fbb33	1293	Šmarje - Sap
00050000-558a-79a9-198d-0f7545478a42	3240	Šmarje pri Jelšah
00050000-558a-79a9-6ca7-1e0a15112389	8220	Šmarješke Toplice
00050000-558a-79a9-84b5-53b65bb01923	2315	Šmartno na Pohorju
00050000-558a-79a9-6d0f-93ff7d98684c	3341	Šmartno ob Dreti
00050000-558a-79a9-37f7-47014e8cbcda	3327	Šmartno ob Paki
00050000-558a-79a9-8d80-61b6aa715ccd	1275	Šmartno pri Litiji
00050000-558a-79a9-7e88-7ab5937276e3	2383	Šmartno pri Slovenj Gradcu
00050000-558a-79a9-7c12-be0de30414bf	3201	Šmartno v Rožni dolini
00050000-558a-79a9-e140-8f8b3aa0af71	3325	Šoštanj
00050000-558a-79a9-257d-44f279840288	6222	Štanjel
00050000-558a-79a9-7208-d308d8fbc3fd	3220	Štore
00050000-558a-79a9-d469-5e8e0add33f5	3304	Tabor
00050000-558a-79a9-1f79-09ec9926c5f4	3221	Teharje
00050000-558a-79a9-d104-75a7fad11da7	9251	Tišina
00050000-558a-79a9-ae73-8eb4c1ff33de	5220	Tolmin
00050000-558a-79a9-3cfc-e135dcfcaeac	3326	Topolšica
00050000-558a-79a9-3815-b8447d0e0b81	2371	Trbonje
00050000-558a-79a9-d79f-d67f030b5bb0	1420	Trbovlje
00050000-558a-79a9-1a9d-c34053df5ef4	8231	Trebelno 
00050000-558a-79a9-b894-53ba028c49fc	8210	Trebnje
00050000-558a-79a9-2503-7a3afb195f3c	5252	Trnovo pri Gorici
00050000-558a-79a9-bbcd-ae1a099b3439	2254	Trnovska vas
00050000-558a-79a9-6b98-df8bc34aa5be	1222	Trojane
00050000-558a-79a9-26f3-74bb9e1b0def	1236	Trzin
00050000-558a-79a9-d0cf-0a40dc7aedee	4290	Tržič
00050000-558a-79a9-40b3-8da1840726de	8295	Tržišče
00050000-558a-79a9-6621-d95c2600ad97	1311	Turjak
00050000-558a-79a9-2819-3c62fd15a4e9	9224	Turnišče
00050000-558a-79a9-1bf3-be1d59d09cf6	8323	Uršna sela
00050000-558a-79a9-870d-c7efefeb049f	1252	Vače
00050000-558a-79a9-ffe3-ef8d73685c9d	3320	Velenje 
00050000-558a-79a9-ac24-112c5a086ea7	3322	Velenje - poštni predali
00050000-558a-79a9-aa84-18d4fc322231	8212	Velika Loka
00050000-558a-79a9-4438-f74593a575f1	2274	Velika Nedelja
00050000-558a-79a9-b2a0-758dc3617842	9225	Velika Polana
00050000-558a-79a9-3761-440b644fc087	1315	Velike Lašče
00050000-558a-79a9-0ce7-c9b71ea2876a	8213	Veliki Gaber
00050000-558a-79a9-f6b9-3bffaa309d01	9241	Veržej
00050000-558a-79a9-c50b-ed9d8210c6cb	1312	Videm - Dobrepolje
00050000-558a-79a9-3991-2bfaa1bf4fab	2284	Videm pri Ptuju
00050000-558a-79a9-e0aa-d222e4f44978	8344	Vinica
00050000-558a-79a9-aee9-35f3cdcb6acf	5271	Vipava
00050000-558a-79a9-541b-fe762a854a88	4212	Visoko
00050000-558a-79a9-e123-15bf0035ca8b	1294	Višnja Gora
00050000-558a-79a9-fd84-261f65060a10	3205	Vitanje
00050000-558a-79a9-a41f-66500ca30363	2255	Vitomarci
00050000-558a-79a9-6082-ccdbe30a9ebd	1217	Vodice
00050000-558a-79a9-7cdd-11eb37205128	3212	Vojnik\t
00050000-558a-79a9-9af7-8c3a5cc24980	5293	Volčja Draga
00050000-558a-79a9-3ebe-61956a2b8c18	2232	Voličina
00050000-558a-79a9-577d-49af5c858521	3305	Vransko
00050000-558a-79a9-98eb-e3668970f009	6217	Vremski Britof
00050000-558a-79a9-5728-ef60f92680de	1360	Vrhnika
00050000-558a-79a9-d13a-b74bfb300f03	2365	Vuhred
00050000-558a-79a9-1d79-695b8682af32	2367	Vuzenica
00050000-558a-79a9-91d7-2e277073a753	8292	Zabukovje 
00050000-558a-79a9-4a7f-0b20a46e2d78	1410	Zagorje ob Savi
00050000-558a-79a9-3e8c-7b90e01d01dc	1303	Zagradec
00050000-558a-79a9-bd02-1fc51788f7c1	2283	Zavrč
00050000-558a-79a9-e279-7ea27f8a4b10	8272	Zdole 
00050000-558a-79a9-11d0-20f2773274e5	4201	Zgornja Besnica
00050000-558a-79a9-5547-363497721f50	2242	Zgornja Korena
00050000-558a-79a9-71a8-03d34c976f9b	2201	Zgornja Kungota
00050000-558a-79a9-9587-6c4b29d85c2a	2316	Zgornja Ložnica
00050000-558a-79a9-c0d7-033affa2dc42	2314	Zgornja Polskava
00050000-558a-79a9-1d1d-633b815095fc	2213	Zgornja Velka
00050000-558a-79a9-4f9c-61fe803fc85d	4247	Zgornje Gorje
00050000-558a-79a9-46ee-d1a24d99eedd	4206	Zgornje Jezersko
00050000-558a-79a9-5bcd-4fcbc160fe80	2285	Zgornji Leskovec
00050000-558a-79a9-fae6-d5c5867fba0d	1432	Zidani Most
00050000-558a-79a9-4ee0-e5bb7f9ee0b0	3214	Zreče
00050000-558a-79a9-a8ec-82911a9e434a	4209	Žabnica
00050000-558a-79a9-8c3c-4baf3d70c073	3310	Žalec
00050000-558a-79a9-b490-b1dad2b33fc6	4228	Železniki
00050000-558a-79a9-626c-84fc71715ced	2287	Žetale
00050000-558a-79a9-2715-fb0dcd1ea1df	4226	Žiri
00050000-558a-79a9-8ae1-25abc6cf844a	4274	Žirovnica
00050000-558a-79a9-7adb-67688053a036	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8130459)
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
-- TOC entry 2859 (class 0 OID 8130270)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8130348)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8130471)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8130591)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8130643)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558a-79aa-4508-f3a049c42784	00080000-558a-79aa-ce21-f983895efa3b	0900	AK
00190000-558a-79aa-c2d0-71ee2a05b9dd	00080000-558a-79aa-245e-74a2501d95ad	0987	A
00190000-558a-79aa-ab69-c903d61322f8	00080000-558a-79aa-d130-08a9a0526f9f	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8130779)
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
-- TOC entry 2883 (class 0 OID 8130500)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558a-79aa-5d90-65b1b14280e0	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558a-79aa-987e-5fd89d37a6f7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558a-79aa-0dcf-87e97985cb4f	0003	Kazinska	t	84	Kazinska dvorana
00220000-558a-79aa-0377-0a29036eb11a	0004	Mali oder	t	24	Mali oder 
00220000-558a-79aa-6457-1ffdcbf0ec44	0005	Komorni oder	t	15	Komorni oder
00220000-558a-79aa-b271-7cc9ec5ab673	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558a-79aa-098e-9779638ae310	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8130444)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8130434)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8130632)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8130568)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8130142)
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
-- TOC entry 2884 (class 0 OID 8130510)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8130180)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558a-79a8-bab4-08d63ddd6ee7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558a-79a8-1cde-69977f24c016	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558a-79a8-a515-291f8963c2b9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558a-79a8-2b5b-a876495a193c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558a-79a8-ab94-f41caaeefd60	planer	Planer dogodkov v koledarju	t
00020000-558a-79a8-3406-0d42dfc79cb0	kadrovska	Kadrovska služba	t
00020000-558a-79a8-226b-5b1ccb9eb93f	arhivar	Ažuriranje arhivalij	t
00020000-558a-79a8-c8dc-b08c05c9cadc	igralec	Igralec	t
00020000-558a-79a8-ae82-387f0546827d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558a-79aa-6e72-458ffe56796d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8130164)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558a-79a8-2168-8d0f7f52af35	00020000-558a-79a8-a515-291f8963c2b9
00010000-558a-79a8-c7a9-1a7fadbc4879	00020000-558a-79a8-a515-291f8963c2b9
00010000-558a-79aa-c485-fffdbba5e63f	00020000-558a-79aa-6e72-458ffe56796d
\.


--
-- TOC entry 2886 (class 0 OID 8130524)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8130465)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8130415)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8130823)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558a-79a9-fcde-e940cb86c0de	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558a-79a9-25fe-9b1e5294af9b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558a-79a9-570a-8dba7af0f984	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558a-79a9-7490-339134b1aef1	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558a-79a9-0eb2-7dba8bcaf617	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8130815)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558a-79a9-ddd8-d6ab80938fea	00230000-558a-79a9-7490-339134b1aef1	popa
00240000-558a-79a9-6c4c-936ec3bd7fe9	00230000-558a-79a9-7490-339134b1aef1	oseba
00240000-558a-79a9-c52b-824a6a3cf1ed	00230000-558a-79a9-25fe-9b1e5294af9b	prostor
00240000-558a-79a9-27b8-bfa542b9ca1a	00230000-558a-79a9-7490-339134b1aef1	besedilo
00240000-558a-79a9-631a-16cb37fd6616	00230000-558a-79a9-7490-339134b1aef1	uprizoritev
00240000-558a-79a9-8ac9-3348c101a888	00230000-558a-79a9-7490-339134b1aef1	funkcija
00240000-558a-79a9-d797-1e53b22d27b4	00230000-558a-79a9-7490-339134b1aef1	tipfunkcije
00240000-558a-79a9-20a9-70fdb7b9c4ba	00230000-558a-79a9-7490-339134b1aef1	alternacija
00240000-558a-79a9-80f8-40ea0b59c8e7	00230000-558a-79a9-fcde-e940cb86c0de	pogodba
00240000-558a-79a9-4cec-485104586619	00230000-558a-79a9-7490-339134b1aef1	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8130810)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8130578)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558a-79aa-f3b2-ed40cb8a3df4	000e0000-558a-79aa-0ba7-9af93229ad1b	00080000-558a-79aa-f2e6-ec18f4b3a9e3	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558a-79aa-1c32-ee8bbf0c1656	000e0000-558a-79aa-0ba7-9af93229ad1b	00080000-558a-79aa-f2e6-ec18f4b3a9e3	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558a-79aa-560d-f1c700d81a95	000e0000-558a-79aa-0ba7-9af93229ad1b	00080000-558a-79aa-4c43-92bc069bda86	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8130242)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8130421)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558a-79aa-8ea3-b66438421c39	00180000-558a-79aa-2c6b-e5b40e87be70	000c0000-558a-79aa-9ca4-d1fb0dbd864d	00090000-558a-79aa-0d49-01515c4e78b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-79aa-d937-dc45f31086fa	00180000-558a-79aa-2c6b-e5b40e87be70	000c0000-558a-79aa-dd10-f6abc2ff3c0d	00090000-558a-79aa-2479-c3550cd7730e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-79aa-61bc-750413c460a8	00180000-558a-79aa-2c6b-e5b40e87be70	000c0000-558a-79aa-845c-60b3ef56f7b1	00090000-558a-79aa-1bfa-554e635dfe54	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-79aa-bce6-196f3a53c8aa	00180000-558a-79aa-2c6b-e5b40e87be70	000c0000-558a-79aa-f04c-cf2ea6a812e1	00090000-558a-79aa-7d1e-8d6a2cdddd8a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-79aa-8bc3-22621ec72f3b	00180000-558a-79aa-2c6b-e5b40e87be70	000c0000-558a-79aa-5fad-ba9c28a482ed	00090000-558a-79aa-6df0-cd858e3371bd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-79aa-2c00-bf0e6b057013	00180000-558a-79aa-b271-483e0569ba61	\N	00090000-558a-79aa-6df0-cd858e3371bd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8130621)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558a-79a9-9203-b2e3808412d0	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558a-79a9-450b-ff65ee690016	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558a-79a9-accb-8eb316b085e4	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558a-79a9-43a0-fa5077bc8e5c	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558a-79a9-0471-3acbcb0d089a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558a-79a9-6b86-431b6b6828ae	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558a-79a9-713c-60dc47a1f799	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558a-79a9-574d-882215071dfe	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558a-79a9-fef6-6c733132fe06	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558a-79a9-c5e2-bf392f76a370	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558a-79a9-00a7-0448fcbb6426	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558a-79a9-a7f4-f6a3c87daaa1	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558a-79a9-18e2-fe65699bb963	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558a-79a9-29dd-ae408f6ca101	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558a-79a9-2d86-08092e7c126f	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558a-79a9-6504-79e43b1afafc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8130792)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558a-79a9-b6a2-d82c636c2fd6	01	Velika predstava	f	1.00	1.00
002b0000-558a-79a9-4dd2-4deeb59aaeb4	02	Mala predstava	f	0.50	0.50
002b0000-558a-79a9-9e49-d31ac11845a9	03	Mala koprodukcija	t	0.40	1.00
002b0000-558a-79a9-3aa9-b15c77414623	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558a-79a9-de3e-90759ab06440	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8130305)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8130151)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558a-79a8-c7a9-1a7fadbc4879	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROvps7DrgqIAcnwLrETDMER8UzP5Dnq7G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558a-79aa-fb2c-6cf0c8e4e1f5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558a-79aa-12db-5b87f17b9942	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558a-79aa-9982-29a23389563f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558a-79aa-fbfd-b619f5a4e0d9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558a-79aa-5d39-6cd6efeb2ccb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558a-79aa-b585-93625b70433b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558a-79aa-116e-a54d42dff46c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558a-79aa-c8ac-e30a971fef72	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558a-79aa-1bee-6c50ee8caa87	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558a-79aa-c485-fffdbba5e63f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558a-79a8-2168-8d0f7f52af35	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8130678)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, skupnistrosek, maticnioder_id) FROM stdin;
000e0000-558a-79aa-04d6-d460cd67486a	00160000-558a-79aa-9858-d6002d60819f	00150000-558a-79a9-a73e-59253723703d	00140000-558a-79a8-91e2-06ef81440192	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		\N	00220000-558a-79aa-6457-1ffdcbf0ec44
000e0000-558a-79aa-0ba7-9af93229ad1b	00160000-558a-79aa-b174-dcdfe1f0ecf2	00150000-558a-79a9-4783-0b9bf091a1a1	00140000-558a-79a8-02ad-42f1aa6b2c4a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		\N	00220000-558a-79aa-b271-7cc9ec5ab673
000e0000-558a-79aa-23b6-02624aea55d5	\N	00150000-558a-79a9-4783-0b9bf091a1a1	00140000-558a-79a8-02ad-42f1aa6b2c4a	00190000-558a-79aa-c2d0-71ee2a05b9dd	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		\N	00220000-558a-79aa-6457-1ffdcbf0ec44
000e0000-558a-79aa-c0fd-c61f42ec53ed	\N	00150000-558a-79a9-4783-0b9bf091a1a1	00140000-558a-79a8-02ad-42f1aa6b2c4a	00190000-558a-79aa-c2d0-71ee2a05b9dd	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		\N	00220000-558a-79aa-6457-1ffdcbf0ec44
\.


--
-- TOC entry 2867 (class 0 OID 8130367)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558a-79aa-1506-0caf69fa4e0f	000e0000-558a-79aa-0ba7-9af93229ad1b	1	
00200000-558a-79aa-b651-b091b0a4019b	000e0000-558a-79aa-0ba7-9af93229ad1b	2	
\.


--
-- TOC entry 2882 (class 0 OID 8130492)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8130561)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8130399)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8130668)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558a-79a8-91e2-06ef81440192	01	Drama	drama (SURS 01)
00140000-558a-79a8-b898-cc82c8b08b71	02	Opera	opera (SURS 02)
00140000-558a-79a8-876c-356a31b91e01	03	Balet	balet (SURS 03)
00140000-558a-79a8-2a66-899955ffbc56	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558a-79a8-9cd0-8b5cde22dc44	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558a-79a8-02ad-42f1aa6b2c4a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558a-79a8-648e-e3f7efa2bfaa	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8130551)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558a-79a9-0d43-57a131ff4320	01	Opera	opera
00150000-558a-79a9-c0a1-6d05c5926e8d	02	Opereta	opereta
00150000-558a-79a9-94d3-3d9e1f98310e	03	Balet	balet
00150000-558a-79a9-1abb-73678efd345b	04	Plesne prireditve	plesne prireditve
00150000-558a-79a9-7b92-2dab78dc82c6	05	Lutkovno gledališče	lutkovno gledališče
00150000-558a-79a9-6a17-a17d97f65893	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558a-79a9-2b02-767e808aa86b	07	Biografska drama	biografska drama
00150000-558a-79a9-a73e-59253723703d	08	Komedija	komedija
00150000-558a-79a9-210f-8682f8c62e73	09	Črna komedija	črna komedija
00150000-558a-79a9-52fa-23c09985b985	10	E-igra	E-igra
00150000-558a-79a9-4783-0b9bf091a1a1	11	Kriminalka	kriminalka
00150000-558a-79a9-74a0-21fe5db62e45	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8130205)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8130726)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8130716)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8130620)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8130389)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8130414)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8130808)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8130331)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8130774)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8130547)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8130365)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8130408)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8130345)
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
-- TOC entry 2531 (class 2606 OID 8130457)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8130484)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8130303)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8130214)
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
-- TOC entry 2446 (class 2606 OID 8130238)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8130194)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8130179)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8130490)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8130523)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8130663)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8130267)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8130291)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8130463)
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
-- TOC entry 2461 (class 2606 OID 8130281)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8130352)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8130475)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8130602)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8130648)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8130790)
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
-- TOC entry 2551 (class 2606 OID 8130507)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8130448)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8130439)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8130642)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8130575)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8130150)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8130514)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8130168)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8130188)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8130532)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8130470)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8130420)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8130832)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8130820)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8130814)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8130588)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8130247)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8130430)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8130631)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8130802)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8130316)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8130163)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8130695)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8130374)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8130498)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8130566)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8130403)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8130676)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8130559)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8130396)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8130589)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8130590)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8130269)
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
-- TOC entry 2544 (class 1259 OID 8130491)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8130477)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8130476)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8130375)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8130548)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8130550)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8130549)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8130347)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8130346)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8130665)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8130666)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8130667)
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
-- TOC entry 2606 (class 1259 OID 8130700)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8130697)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8130701)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8130699)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8130698)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8130318)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8130317)
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
-- TOC entry 2444 (class 1259 OID 8130241)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8130515)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8130409)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8130195)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8130196)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8130535)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8130534)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8130533)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8130353)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8130355)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8130354)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8130822)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8130443)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8130441)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8130440)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8130442)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8130169)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8130170)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8130499)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8130464)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8130576)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8130577)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8130778)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8130775)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8130776)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8130777)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8130283)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8130282)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8130284)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8130603)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8130604)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8130730)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8130732)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8130728)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8130731)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8130729)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8130567)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8130452)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8130451)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8130449)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8130450)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8130718)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8130717)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8130791)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8130366)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8130809)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8130216)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8130215)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8130248)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8130249)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8130433)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8130432)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8130431)
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
-- TOC entry 2496 (class 1259 OID 8130398)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8130394)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8130391)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8130392)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8130390)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8130395)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8130393)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8130268)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8130332)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8130334)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8130333)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8130335)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8130458)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8130664)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8130696)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8130239)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8130240)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8130560)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8130833)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8130304)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8130821)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8130509)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8130508)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8130727)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8130292)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8130677)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8130649)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8130650)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8130189)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8130397)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 2606 OID 8130969)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2677 (class 2606 OID 8130954)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2676 (class 2606 OID 8130959)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2672 (class 2606 OID 8130979)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2678 (class 2606 OID 8130949)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2673 (class 2606 OID 8130974)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8130964)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8131124)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 8131129)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8130884)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8131064)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2693 (class 2606 OID 8131059)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8131054)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8130944)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8131094)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8131104)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8131099)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2665 (class 2606 OID 8130919)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8130914)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8131044)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8131149)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8131154)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8131159)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8131179)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2719 (class 2606 OID 8131164)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2715 (class 2606 OID 8131184)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8131174)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 8131169)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2663 (class 2606 OID 8130909)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8130904)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8130869)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8130864)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8131074)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8130984)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8130844)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2651 (class 2606 OID 8130849)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2698 (class 2606 OID 8131089)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8131084)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 8131079)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2669 (class 2606 OID 8130924)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 8130934)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8130929)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8131254)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2683 (class 2606 OID 8131019)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8131009)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 8131004)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2684 (class 2606 OID 8131014)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8130834)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8130839)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8131069)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8131049)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8131114)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2705 (class 2606 OID 8131119)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8131239)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8131224)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8131229)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8131234)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8130894)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 8130889)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8130899)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8131134)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8131139)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8131209)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 8131219)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8131199)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 8131214)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2725 (class 2606 OID 8131204)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8131109)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 8131039)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2688 (class 2606 OID 8131034)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 8131024)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8131029)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 8131194)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8131189)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8131244)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8130939)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8131144)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8131249)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2653 (class 2606 OID 8130859)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8130854)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8130874)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8130879)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 8130999)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8130994)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2682 (class 2606 OID 8130989)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-24 11:34:35 CEST

--
-- PostgreSQL database dump complete
--

