--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-24 10:29:30 CEST

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
-- TOC entry 183 (class 1259 OID 8107126)
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
-- TOC entry 230 (class 1259 OID 8107648)
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
    imapogodbo boolean
);


--
-- TOC entry 229 (class 1259 OID 8107631)
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
-- TOC entry 222 (class 1259 OID 8107535)
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
-- TOC entry 197 (class 1259 OID 8107305)
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
-- TOC entry 200 (class 1259 OID 8107339)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8107732)
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
-- TOC entry 192 (class 1259 OID 8107248)
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
-- TOC entry 231 (class 1259 OID 8107662)
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
-- TOC entry 216 (class 1259 OID 8107465)
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
-- TOC entry 195 (class 1259 OID 8107285)
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
-- TOC entry 199 (class 1259 OID 8107333)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8107265)
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
-- TOC entry 205 (class 1259 OID 8107382)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8107407)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8107222)
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
-- TOC entry 184 (class 1259 OID 8107135)
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
-- TOC entry 185 (class 1259 OID 8107146)
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
-- TOC entry 180 (class 1259 OID 8107100)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8107119)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8107414)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8107445)
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
-- TOC entry 226 (class 1259 OID 8107581)
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
-- TOC entry 187 (class 1259 OID 8107179)
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
-- TOC entry 189 (class 1259 OID 8107214)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8107388)
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
-- TOC entry 188 (class 1259 OID 8107199)
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
-- TOC entry 194 (class 1259 OID 8107277)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8107400)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8107520)
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
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 225 (class 1259 OID 8107573)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8107708)
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
-- TOC entry 212 (class 1259 OID 8107429)
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
-- TOC entry 204 (class 1259 OID 8107373)
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
-- TOC entry 203 (class 1259 OID 8107363)
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
-- TOC entry 224 (class 1259 OID 8107562)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8107497)
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
-- TOC entry 177 (class 1259 OID 8107071)
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
-- TOC entry 176 (class 1259 OID 8107069)
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
-- TOC entry 213 (class 1259 OID 8107439)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8107109)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8107093)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8107453)
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
-- TOC entry 207 (class 1259 OID 8107394)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8107344)
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
-- TOC entry 237 (class 1259 OID 8107752)
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
-- TOC entry 236 (class 1259 OID 8107744)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8107739)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8107507)
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
-- TOC entry 186 (class 1259 OID 8107171)
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
-- TOC entry 202 (class 1259 OID 8107350)
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
-- TOC entry 223 (class 1259 OID 8107551)
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
-- TOC entry 233 (class 1259 OID 8107721)
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
-- TOC entry 191 (class 1259 OID 8107234)
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
-- TOC entry 178 (class 1259 OID 8107080)
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
-- TOC entry 228 (class 1259 OID 8107608)
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
-- TOC entry 196 (class 1259 OID 8107296)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8107421)
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
-- TOC entry 218 (class 1259 OID 8107490)
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
-- TOC entry 198 (class 1259 OID 8107328)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8107598)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8107480)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8107074)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8107126)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8107648)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-558a-6a69-c26c-76630314d461	000d0000-558a-6a69-53fb-c0d392bb97e8	\N	00090000-558a-6a69-81b6-4fac3a353bad	\N	000b0000-558a-6a69-4b02-8385703d5da7	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6a69-a1fd-597df32eccc6	000d0000-558a-6a69-b3eb-87b1e0b0a73a	\N	00090000-558a-6a69-2a70-1ce8cc42583c	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6a69-9dfa-35b4be08a8e6	000d0000-558a-6a69-d9bd-9bf798fb59b8	\N	00090000-558a-6a69-34b0-3fccab09b803	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6a69-6783-c2411a252b0e	000d0000-558a-6a69-2ad4-1d36540b8cc8	\N	00090000-558a-6a69-839c-1c1c018b8a38	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6a69-21c6-700eb89f4f49	000d0000-558a-6a69-3176-79d6ab9b0b8c	\N	00090000-558a-6a69-d7e7-8c569c9dd4fb	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-558a-6a69-b667-026e393a1980	000d0000-558a-6a69-832d-cfc0eb5a1bfd	\N	00090000-558a-6a69-2a70-1ce8cc42583c	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8107631)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8107535)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558a-6a69-649c-f40e2b490dc3	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558a-6a69-df63-9be9fe27e89b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558a-6a69-26a5-7c9a52740adf	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8107305)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558a-6a69-0524-438ff4d1f17a	\N	\N	00200000-558a-6a69-c75f-4c93890ede5f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558a-6a69-2c6b-fd04d6c0fd4a	\N	\N	00200000-558a-6a69-c4c6-27287c3b838e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558a-6a69-461b-8487241ff611	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558a-6a69-f9ce-744105c8be56	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558a-6a69-c4b3-83587458277f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8107339)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8107732)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8107248)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558a-6a67-9fc9-9b19b6dcc0ce	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558a-6a67-cdad-c4de134b7732	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558a-6a67-1387-3ea83f2ee63f	AL	ALB	008	Albania 	Albanija	\N
00040000-558a-6a67-7338-0eda29b92e74	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558a-6a67-db5a-599984ea06c9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558a-6a67-a232-ba5a448ca924	AD	AND	020	Andorra 	Andora	\N
00040000-558a-6a67-cf78-86f941936b45	AO	AGO	024	Angola 	Angola	\N
00040000-558a-6a67-d385-26cc2f7f260e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558a-6a67-a7dd-3ec13f982f8a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558a-6a67-47a1-38e8224ee7a9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-6a67-1f1f-007d96aa7fb9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558a-6a67-a113-2a979110eed6	AM	ARM	051	Armenia 	Armenija	\N
00040000-558a-6a67-8f0a-3afb93a316b4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558a-6a67-cc5d-c313d690311f	AU	AUS	036	Australia 	Avstralija	\N
00040000-558a-6a67-b06b-a459af96e897	AT	AUT	040	Austria 	Avstrija	\N
00040000-558a-6a67-db28-3fb96d237833	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558a-6a67-139e-4864cad2ceee	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558a-6a67-e8c7-f5ec28e92ec3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558a-6a67-aa91-e3c22b5ad40e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558a-6a67-6b8b-4f1f8317294d	BB	BRB	052	Barbados 	Barbados	\N
00040000-558a-6a67-0ae1-fa6cc0f3f41d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558a-6a67-a38a-e90ecef844c8	BE	BEL	056	Belgium 	Belgija	\N
00040000-558a-6a67-b60d-968246887524	BZ	BLZ	084	Belize 	Belize	\N
00040000-558a-6a67-685e-b6635055691d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558a-6a67-e93f-7266fbd8b4ce	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558a-6a67-1312-73314ce4c093	BT	BTN	064	Bhutan 	Butan	\N
00040000-558a-6a67-aa5e-72737981a4c3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558a-6a67-2e5d-3d466cb61ac3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558a-6a67-eda7-5b8c65d136a3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558a-6a67-ea8a-21ab8ec5f235	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558a-6a67-e1f3-4952d8c6bc8c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558a-6a67-5a8e-14a02af25e09	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558a-6a67-9d0c-f66ac3f2a5ad	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558a-6a67-00aa-26dd4d8880cf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558a-6a67-f902-6bbe4d11e4c8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558a-6a67-fa12-9649d69195db	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558a-6a67-c59c-c08c35a47411	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558a-6a67-4f08-47020af7ee3e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558a-6a67-a970-435b5810f754	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558a-6a67-2048-ce3b1f92cf1d	CA	CAN	124	Canada 	Kanada	\N
00040000-558a-6a67-4fb7-13c9f4389094	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558a-6a67-f9fc-ff2b86f2c9ac	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558a-6a67-0cea-99de48a0653e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558a-6a67-95a0-f99b61901d06	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558a-6a67-ed76-6c024c91b7f8	CL	CHL	152	Chile 	Čile	\N
00040000-558a-6a67-0d5f-9d196fc67074	CN	CHN	156	China 	Kitajska	\N
00040000-558a-6a67-67fd-3689f91a6474	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558a-6a67-c9e1-30214ec817f0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558a-6a67-eda9-1233fc92c88b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558a-6a67-87a1-22be6465edbb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558a-6a67-7b35-bf8074f9227c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558a-6a67-4010-936b39e64c08	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558a-6a67-a176-81ea76867331	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558a-6a67-7c81-64e58bc73628	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558a-6a67-21d3-c69a09ce7504	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558a-6a67-062b-903c35dd9775	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558a-6a67-ac79-42d9cfa7c0d6	CU	CUB	192	Cuba 	Kuba	\N
00040000-558a-6a67-19f8-922de659e31c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558a-6a67-0f8f-dfdf0dcaa4f6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558a-6a67-75bc-b594fad18fdc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558a-6a67-1923-936fa5a3e11a	DK	DNK	208	Denmark 	Danska	\N
00040000-558a-6a67-8538-ed608490e757	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558a-6a67-6cbd-f2cf04317e44	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558a-6a67-d8f9-a19c3bbe5b92	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558a-6a67-c94e-b2b6d0771a6e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558a-6a67-7a46-452472271cc4	EG	EGY	818	Egypt 	Egipt	\N
00040000-558a-6a67-cbdb-f248fd7ba92f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558a-6a67-08d8-3efb5869a508	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558a-6a67-0585-10a4261d85c3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558a-6a67-4e17-c7f068538c3d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558a-6a67-7375-33bdfa50f0a5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558a-6a67-afde-46a94a19b2b3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558a-6a67-bcda-e547a77c7ddc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558a-6a67-0074-6c215dcc9018	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558a-6a67-c409-0eb4940b8c89	FI	FIN	246	Finland 	Finska	\N
00040000-558a-6a67-ae2e-35a451ca6b9e	FR	FRA	250	France 	Francija	\N
00040000-558a-6a67-e058-8fea30e05ae5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558a-6a67-7981-92ad6d7778aa	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558a-6a67-fda4-bf4bd2ca1c35	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558a-6a67-fbf2-09622dc2d4b9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558a-6a67-8969-cfb9fc103e22	GA	GAB	266	Gabon 	Gabon	\N
00040000-558a-6a67-0c3b-d8ef505779d1	GM	GMB	270	Gambia 	Gambija	\N
00040000-558a-6a67-d3e2-89c514256d24	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558a-6a67-737d-43bb6f3e0e34	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558a-6a67-7e44-db3993f55ce7	GH	GHA	288	Ghana 	Gana	\N
00040000-558a-6a67-a172-f7b088369c05	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558a-6a67-5116-dc1ba52f2a22	GR	GRC	300	Greece 	Grčija	\N
00040000-558a-6a67-d51c-1649556d4f90	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558a-6a67-a973-5d53b8888fc2	GD	GRD	308	Grenada 	Grenada	\N
00040000-558a-6a67-a3cb-8220c6618af6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558a-6a67-6cfc-302ed4a25aac	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558a-6a67-8137-b95930f7d01b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558a-6a67-7cd2-17fbcd3e4d85	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558a-6a67-850d-98b3fc2a50c5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558a-6a67-a0c2-9b0fd0fb49f3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558a-6a67-a6fe-6c6d3beb7aad	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558a-6a67-29e4-f60042a71c45	HT	HTI	332	Haiti 	Haiti	\N
00040000-558a-6a67-96f4-3a2215634d43	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558a-6a67-5d8c-e52efb58cd46	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558a-6a67-2eb1-8a5f5e4c89e5	HN	HND	340	Honduras 	Honduras	\N
00040000-558a-6a67-62b5-31297875a63e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558a-6a67-e2ba-fd22979f6bac	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558a-6a67-e4c4-e17c989d594f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558a-6a67-8053-1430515966d0	IN	IND	356	India 	Indija	\N
00040000-558a-6a67-b27a-5874d9efce7a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558a-6a67-7da5-4f3b63b0eef1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558a-6a67-857a-9cab590f4bc2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558a-6a67-5d7e-3da33661bb21	IE	IRL	372	Ireland 	Irska	\N
00040000-558a-6a67-20cc-d78216e1a823	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558a-6a67-4c4a-1594ae81a8c1	IL	ISR	376	Israel 	Izrael	\N
00040000-558a-6a67-39cf-726b64436909	IT	ITA	380	Italy 	Italija	\N
00040000-558a-6a67-7e18-3e31f003f2d2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558a-6a67-9864-3623a5bf4739	JP	JPN	392	Japan 	Japonska	\N
00040000-558a-6a67-65b2-a61bb993e8a0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558a-6a67-63f7-afa142a27064	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558a-6a67-63f6-f11167ec0bb5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558a-6a67-5561-a574ee99fbf0	KE	KEN	404	Kenya 	Kenija	\N
00040000-558a-6a67-49fe-92c37eb2b1a1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558a-6a67-15ce-c694ceabbc8e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558a-6a67-c885-2b242008c604	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558a-6a67-905a-389474ad462f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558a-6a67-a154-8750a55df902	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558a-6a67-fbe5-38676fe3eef9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558a-6a67-fe62-282dfa476409	LV	LVA	428	Latvia 	Latvija	\N
00040000-558a-6a67-231d-e28af11822c0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558a-6a67-ac90-490fc5f23cb7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558a-6a67-a9b0-070369ef19fe	LR	LBR	430	Liberia 	Liberija	\N
00040000-558a-6a67-b4c5-c9dc88355ce6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558a-6a67-99f7-2b442a7c4912	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558a-6a67-f26f-2027d7100dee	LT	LTU	440	Lithuania 	Litva	\N
00040000-558a-6a67-8d09-b7fcc6d47a07	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558a-6a67-9366-107788be7d3a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558a-6a67-0e6e-994118ab98b0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558a-6a67-c6d4-bf61c05b21bf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558a-6a67-68a7-245ed5cb2851	MW	MWI	454	Malawi 	Malavi	\N
00040000-558a-6a67-aff7-2990684a8884	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558a-6a67-883e-544241588391	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558a-6a67-3f93-a7951e098012	ML	MLI	466	Mali 	Mali	\N
00040000-558a-6a67-a022-4a0b846f5ff3	MT	MLT	470	Malta 	Malta	\N
00040000-558a-6a67-3751-2cdadea1edc8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558a-6a67-c1a2-1ba797c597f7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558a-6a67-a249-de26be02d95c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558a-6a67-bda7-96266efa7911	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558a-6a67-20b0-f76b17db372d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558a-6a67-c26c-3e908c88e909	MX	MEX	484	Mexico 	Mehika	\N
00040000-558a-6a67-b2e8-0124a13635c3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558a-6a67-e1c9-9119f7f54986	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558a-6a67-df6d-61abad548240	MC	MCO	492	Monaco 	Monako	\N
00040000-558a-6a67-f427-065462a4ff9a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558a-6a67-18cf-97f789aef521	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558a-6a67-52c5-fb97b8c94c8e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558a-6a67-fa7c-16da846d22c0	MA	MAR	504	Morocco 	Maroko	\N
00040000-558a-6a67-9f9a-f7a8738ed8cb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558a-6a67-b0c1-e3b430a88956	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558a-6a67-8748-6cc7f9ad69e0	NA	NAM	516	Namibia 	Namibija	\N
00040000-558a-6a67-1765-01d610512bdf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558a-6a67-b37e-4c8db2d09596	NP	NPL	524	Nepal 	Nepal	\N
00040000-558a-6a67-9543-33ad2ca400e4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558a-6a67-504f-3f41dcdaca63	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558a-6a67-b910-5af3a7aa2faa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558a-6a67-aa1c-97aeafc37961	NE	NER	562	Niger 	Niger 	\N
00040000-558a-6a67-85f0-f993def03da8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558a-6a67-e2d4-743c4e078871	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558a-6a67-ec58-1c17fd119f97	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558a-6a67-a3dc-6005948d2abf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558a-6a67-28a7-7b65e61fa882	NO	NOR	578	Norway 	Norveška	\N
00040000-558a-6a67-dba2-d79fa565a7c3	OM	OMN	512	Oman 	Oman	\N
00040000-558a-6a67-e65d-689d50e83e96	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558a-6a67-d6f1-82fadb1fd006	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558a-6a67-8997-67cb9ca3b0b3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558a-6a67-a1c4-b8729ebb0e7e	PA	PAN	591	Panama 	Panama	\N
00040000-558a-6a67-d136-da04a19ed821	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558a-6a67-016f-1790f404658b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558a-6a67-fb31-6a1cb42fab96	PE	PER	604	Peru 	Peru	\N
00040000-558a-6a67-8992-05cd3f1d4b77	PH	PHL	608	Philippines 	Filipini	\N
00040000-558a-6a67-fd4a-2ce3363ce65f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558a-6a67-3a0e-9e3eb6691b02	PL	POL	616	Poland 	Poljska	\N
00040000-558a-6a67-e0f7-79aed89d3edd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558a-6a67-98eb-ee9fe3c6d845	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558a-6a67-7719-23c69c5b7a3a	QA	QAT	634	Qatar 	Katar	\N
00040000-558a-6a67-015d-ceb638cc0b83	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558a-6a67-6c70-a58e659464c1	RO	ROU	642	Romania 	Romunija	\N
00040000-558a-6a67-9f87-a2bdef4fb92f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558a-6a67-72f7-3ab1875ab395	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558a-6a67-7ce9-463f04fcb440	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558a-6a67-e147-7ec1c336259b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558a-6a67-dd2c-8a14866a6684	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558a-6a67-4512-527da72e757b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558a-6a67-0abb-7b2c544ec533	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558a-6a67-ced7-9f46a463aaa1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558a-6a67-9e03-9aeda81378b5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558a-6a67-34d7-b738144c4bb3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558a-6a67-693c-02a9b647590d	SM	SMR	674	San Marino 	San Marino	\N
00040000-558a-6a67-f403-b373f1557f20	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558a-6a67-a8d6-a07a482a2c9e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558a-6a67-5dd3-a4494a368a2e	SN	SEN	686	Senegal 	Senegal	\N
00040000-558a-6a67-ed7c-80f8be8784f1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558a-6a67-547e-fb48bb7d3673	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558a-6a67-f961-a135085c53af	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558a-6a67-efc7-795edb259b31	SG	SGP	702	Singapore 	Singapur	\N
00040000-558a-6a67-77b2-5c0b4387e5ba	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558a-6a67-31ec-fcb8effc4f25	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558a-6a67-ca52-4fbf374aa436	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558a-6a67-91bc-762d2b57df1b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558a-6a67-e70f-c2a4526126c3	SO	SOM	706	Somalia 	Somalija	\N
00040000-558a-6a67-0387-db825f141cc6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558a-6a67-5cd5-df4daf004485	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558a-6a67-fdab-d4a7193269b1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558a-6a67-242c-d315f771eb2f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558a-6a67-c8d9-b32fdcb6fcf4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558a-6a67-012f-d1f20bcf0947	SD	SDN	729	Sudan 	Sudan	\N
00040000-558a-6a67-f864-7d1a0a122d6c	SR	SUR	740	Suriname 	Surinam	\N
00040000-558a-6a67-53d1-5e7c8cbf00b0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558a-6a67-1743-c8888f40802e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558a-6a67-35a2-2944f32d5403	SE	SWE	752	Sweden 	Švedska	\N
00040000-558a-6a67-281e-de52ecafb043	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558a-6a67-540b-444a80f9ddc2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558a-6a67-da7a-da9bd192cf2f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558a-6a67-7e9e-6652f034b589	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558a-6a67-16ba-4604b1b3ea34	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558a-6a67-f029-6428290a9142	TH	THA	764	Thailand 	Tajska	\N
00040000-558a-6a67-3dff-b570b73c40bb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558a-6a67-fd33-9fe17d50e729	TG	TGO	768	Togo 	Togo	\N
00040000-558a-6a67-c901-1942b1320017	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558a-6a67-9150-9944c8953e5b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558a-6a67-c200-183f57e4c3d6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558a-6a67-9ded-4093a18a2d0b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558a-6a67-c4a0-478da2992099	TR	TUR	792	Turkey 	Turčija	\N
00040000-558a-6a67-c227-b3835af5db7e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558a-6a67-b6be-0fd1e4244b2f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-6a67-b53d-fad716c82e69	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558a-6a67-f38e-f0d9a33e9697	UG	UGA	800	Uganda 	Uganda	\N
00040000-558a-6a67-1e4e-d213e4447b7b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558a-6a67-5cc4-e9965c7f5568	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558a-6a67-5878-e2000e398643	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558a-6a67-cb96-e7c0a29e3318	US	USA	840	United States 	Združene države Amerike	\N
00040000-558a-6a67-0e57-79fb40c2e2bf	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558a-6a67-15fa-ec307ff79a80	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558a-6a67-3523-76ddbadb0a20	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558a-6a67-c02b-d6c295c29750	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558a-6a67-1c90-662f54d35a2d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558a-6a67-7447-8fb9340cb129	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558a-6a67-1984-5da2df76e02f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558a-6a67-5ec4-2a30dd0e1b44	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558a-6a67-8692-f41d394251a5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558a-6a67-ac4d-b2ae6011d454	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558a-6a67-d26b-8541dd38bbef	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558a-6a67-6a61-021a2e66e5b9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558a-6a67-8034-9d5876b0e0bb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8107662)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8107465)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558a-6a69-63f9-5f944ccc2cfa	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558a-6a68-0d93-dd6a4ccfbd0c
000d0000-558a-6a69-53fb-c0d392bb97e8	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-6a68-0d93-dd6a4ccfbd0c
000d0000-558a-6a69-b3eb-87b1e0b0a73a	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558a-6a68-bd23-f32788b48cbf
000d0000-558a-6a69-d9bd-9bf798fb59b8	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558a-6a68-1a2f-da4574632033
000d0000-558a-6a69-2ad4-1d36540b8cc8	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558a-6a68-1a2f-da4574632033
000d0000-558a-6a69-3176-79d6ab9b0b8c	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558a-6a68-1a2f-da4574632033
000d0000-558a-6a69-832d-cfc0eb5a1bfd	000e0000-558a-6a69-6956-1f7ed6f431d6	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558a-6a68-0d93-dd6a4ccfbd0c
\.


--
-- TOC entry 2866 (class 0 OID 8107285)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8107333)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8107265)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558a-6a69-37c5-b8c63150f5ce	00080000-558a-6a69-1cfc-ec5482209d48	00090000-558a-6a69-81b6-4fac3a353bad	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8107382)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8107407)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8107222)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558a-6a67-8412-0dd20ee9b112	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558a-6a67-f194-cb19e152a8ca	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558a-6a67-959a-be50a4ab2a1a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558a-6a67-762c-11438eb7f3c0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558a-6a67-724a-96b3fae9f393	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558a-6a67-e8af-607419bdbb04	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558a-6a67-dda7-e75e145dceb5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558a-6a67-1908-5d228546873a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-6a67-b361-e59f1ef8acb9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558a-6a67-753a-6321ad949d5c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558a-6a67-a2d7-128e4ed7cdd7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558a-6a67-d5c7-20091cfdd48c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558a-6a67-768b-a794e94f7018	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558a-6a69-6d63-dbbfb6c6e648	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558a-6a69-5ff0-4b7e1be98a02	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558a-6a69-d78c-7924833d8265	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558a-6a69-ed2a-7407911b77cb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558a-6a69-1721-8d5a81675b6b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558a-6a69-01c7-cb235ac0bbcc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8107135)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558a-6a69-bd12-3e401dd45247	00000000-558a-6a69-5ff0-4b7e1be98a02	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558a-6a69-1dc4-388a842eece8	00000000-558a-6a69-5ff0-4b7e1be98a02	00010000-558a-6a67-8be0-d595e4492157	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558a-6a69-ec09-44326e754372	00000000-558a-6a69-d78c-7924833d8265	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8107146)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558a-6a69-bdc4-b779bf8c13bb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558a-6a69-839c-1c1c018b8a38	00010000-558a-6a69-63ad-2d42e7be09e0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558a-6a69-34b0-3fccab09b803	00010000-558a-6a69-205e-3abebdad9933	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558a-6a69-01bd-d411c0222d06	00010000-558a-6a69-38b3-c228f893f8cc	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558a-6a69-1539-ab2f8bc823dc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558a-6a69-d580-027eeb558a8d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558a-6a69-e55b-4f1acaf0fbe9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558a-6a69-99b9-d742540d9f85	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558a-6a69-81b6-4fac3a353bad	00010000-558a-6a69-202e-cb00f0330f2f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558a-6a69-2a70-1ce8cc42583c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558a-6a69-fdc4-4d891644a4d2	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558a-6a69-d7e7-8c569c9dd4fb	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558a-6a69-d389-3c43969e06ae	00010000-558a-6a69-4d6e-ae5a21da8064	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8107100)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558a-6a67-969d-5c27edc6dfe2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558a-6a67-33ed-a7b7f81cefe4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558a-6a67-e99f-d6d46c6e8c14	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558a-6a67-0e59-10b77553f180	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558a-6a67-4e3f-a88f070df238	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558a-6a67-9223-9f758219460b	Abonma-read	Abonma - branje	f
00030000-558a-6a67-6432-2097e2046df2	Abonma-write	Abonma - spreminjanje	f
00030000-558a-6a67-1f4a-e504b818757f	Alternacija-read	Alternacija - branje	f
00030000-558a-6a67-94d6-71f1fddf3549	Alternacija-write	Alternacija - spreminjanje	f
00030000-558a-6a67-2c82-849920395e25	Arhivalija-read	Arhivalija - branje	f
00030000-558a-6a67-971d-3a738a86a665	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558a-6a67-cf60-fea2fccb34d6	Besedilo-read	Besedilo - branje	f
00030000-558a-6a67-7568-fa72f5f078f0	Besedilo-write	Besedilo - spreminjanje	f
00030000-558a-6a67-f234-c8130d51aa5c	DogodekIzven-read	DogodekIzven - branje	f
00030000-558a-6a67-22d0-17e3eaea88b2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558a-6a67-6370-8c6814601e94	Dogodek-read	Dogodek - branje	f
00030000-558a-6a67-a1a3-cd5186ed683b	Dogodek-write	Dogodek - spreminjanje	f
00030000-558a-6a67-72ed-a0a81bea81e7	DrugiVir-read	DrugiVir - branje	f
00030000-558a-6a67-7927-59b85a48d401	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558a-6a67-ea9a-b16b0733bdce	Drzava-read	Drzava - branje	f
00030000-558a-6a67-8b7f-a98bfd6f2f39	Drzava-write	Drzava - spreminjanje	f
00030000-558a-6a67-8924-3c85817d6254	Funkcija-read	Funkcija - branje	f
00030000-558a-6a67-e00c-f2e46745941a	Funkcija-write	Funkcija - spreminjanje	f
00030000-558a-6a67-4a5f-e7ccaeec4aa9	Gostovanje-read	Gostovanje - branje	f
00030000-558a-6a67-0551-7cf1a4bce10a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558a-6a67-d42d-711510e5b8c2	Gostujoca-read	Gostujoca - branje	f
00030000-558a-6a67-d9f6-34bc5539a57c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558a-6a67-9960-18a022550b56	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558a-6a67-c8fc-46be322b08ac	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558a-6a67-fa86-e840f7354b4f	Kupec-read	Kupec - branje	f
00030000-558a-6a67-f929-f3140b2e3e80	Kupec-write	Kupec - spreminjanje	f
00030000-558a-6a67-2d4b-e022de8810ce	NacinPlacina-read	NacinPlacina - branje	f
00030000-558a-6a67-64d4-e5a435e6c0f9	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558a-6a67-df52-d8b7794f50fe	Option-read	Option - branje	f
00030000-558a-6a67-587d-29aa8e91fc56	Option-write	Option - spreminjanje	f
00030000-558a-6a67-57b6-636ddac3b513	OptionValue-read	OptionValue - branje	f
00030000-558a-6a67-f94f-4cee067ef6de	OptionValue-write	OptionValue - spreminjanje	f
00030000-558a-6a67-1ca0-b7e2407af1ca	Oseba-read	Oseba - branje	f
00030000-558a-6a67-d491-cc824fe77b31	Oseba-write	Oseba - spreminjanje	f
00030000-558a-6a67-9c7c-9fecc5744d75	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558a-6a67-e2d9-99753c1c6820	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558a-6a67-5039-7b29490900e5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558a-6a67-6413-542dcae8b18f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558a-6a67-29c1-87f32d61f218	Pogodba-read	Pogodba - branje	f
00030000-558a-6a67-268a-3a58bb550f91	Pogodba-write	Pogodba - spreminjanje	f
00030000-558a-6a67-668d-d6403824c01c	Popa-read	Popa - branje	f
00030000-558a-6a67-5f0a-d11973d0eac5	Popa-write	Popa - spreminjanje	f
00030000-558a-6a67-189b-daad5b16bdf2	Posta-read	Posta - branje	f
00030000-558a-6a67-540c-8485e7e4ec2a	Posta-write	Posta - spreminjanje	f
00030000-558a-6a67-04a8-43a1ef0e0a1d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558a-6a67-819e-ae6918ef4834	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558a-6a67-2fa4-edaadb0f851c	PostniNaslov-read	PostniNaslov - branje	f
00030000-558a-6a67-4c6a-3ed8d4e327e2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558a-6a67-375f-535ff3fa7f2b	Predstava-read	Predstava - branje	f
00030000-558a-6a67-6692-d82fc1925743	Predstava-write	Predstava - spreminjanje	f
00030000-558a-6a67-73f4-7ef9ac504d1a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558a-6a67-b323-b0b9cdcfdf09	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558a-6a67-e3c2-c51931de10a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558a-6a67-5e50-8646210a8a9f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558a-6a67-ccc4-a16e58a331be	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558a-6a67-c48c-d50f45bf7017	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558a-6a67-e9d1-d0882b4f1e0d	ProgramDela-read	ProgramDela - branje	f
00030000-558a-6a67-f8c1-5d28e5d716db	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558a-6a67-365c-5265d731b9b2	ProgramFestival-read	ProgramFestival - branje	f
00030000-558a-6a67-02f8-ce4a8550d8d6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558a-6a67-507e-acff58011c37	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558a-6a67-9aaf-b0a863a712e4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558a-6a67-172f-e65efebd07fa	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558a-6a67-4f93-d7b1d14f0d59	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558a-6a67-faf3-4d4300217ffd	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558a-6a67-2ac5-d2415ae82df6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558a-6a67-8e51-91d4b7392fea	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558a-6a67-7b25-d05c230dee4a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558a-6a67-16f1-a8d2f6f194b0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558a-6a67-bb7e-13d74bd70043	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558a-6a67-5275-13f8cdc226e1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558a-6a67-5d1f-cafca9f82793	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558a-6a67-29ef-297a5e1cb932	ProgramRazno-read	ProgramRazno - branje	f
00030000-558a-6a67-b225-b8c984c9811f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558a-6a67-bbd8-0b93a1d8ba25	Prostor-read	Prostor - branje	f
00030000-558a-6a67-5622-2cca643c1b8b	Prostor-write	Prostor - spreminjanje	f
00030000-558a-6a67-5e3c-e734bf8e71c1	Racun-read	Racun - branje	f
00030000-558a-6a67-e9a5-6ef1236e1f7f	Racun-write	Racun - spreminjanje	f
00030000-558a-6a67-f2f6-70bc58fe2412	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558a-6a67-3d61-21cd94939ab8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558a-6a67-f61f-e17c7ba7e5c1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558a-6a67-4777-73c187b5c6af	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558a-6a67-a3b5-d21c39a85a7b	Rekvizit-read	Rekvizit - branje	f
00030000-558a-6a67-fb00-8ce05a1e10c2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558a-6a67-42f3-45b0aca40f06	Revizija-read	Revizija - branje	f
00030000-558a-6a67-055f-22d72621c492	Revizija-write	Revizija - spreminjanje	f
00030000-558a-6a67-849a-4109fce5eccb	Rezervacija-read	Rezervacija - branje	f
00030000-558a-6a67-93f9-000cde654fdc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558a-6a67-88fd-3828198eb5a9	SedezniRed-read	SedezniRed - branje	f
00030000-558a-6a67-da48-543a729d3ee3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558a-6a67-e1e7-7fbbd166256d	Sedez-read	Sedez - branje	f
00030000-558a-6a67-4235-de0e95acc0ab	Sedez-write	Sedez - spreminjanje	f
00030000-558a-6a67-1a93-07f19e708a7b	Sezona-read	Sezona - branje	f
00030000-558a-6a67-81cc-cf3bf3e17225	Sezona-write	Sezona - spreminjanje	f
00030000-558a-6a67-df84-cee2fad89122	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558a-6a67-deaf-224b1492bd52	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558a-6a67-330d-778cc9b8b244	Stevilcenje-read	Stevilcenje - branje	f
00030000-558a-6a67-e428-5fec89da5376	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558a-6a67-3ba5-38a16151a618	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558a-6a67-0efd-0863a9b62228	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558a-6a67-2f8d-79bedad8cbc0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558a-6a67-0732-3a5fcd3b5284	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558a-6a67-6289-2beae6b164e1	Telefonska-read	Telefonska - branje	f
00030000-558a-6a67-89de-e625e7483449	Telefonska-write	Telefonska - spreminjanje	f
00030000-558a-6a67-fa15-192b1a4f977a	TerminStoritve-read	TerminStoritve - branje	f
00030000-558a-6a67-26d1-825f5b2cc187	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558a-6a67-8013-ea21249edd3e	TipFunkcije-read	TipFunkcije - branje	f
00030000-558a-6a67-34e1-18b5062dc615	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558a-6a67-1524-ec1bc2517da5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558a-6a67-3db8-777d5fcc8759	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558a-6a67-71f7-27090d2c0c92	Trr-read	Trr - branje	f
00030000-558a-6a67-177d-7883d9a31c8e	Trr-write	Trr - spreminjanje	f
00030000-558a-6a67-2bc3-6f86cc18e3bf	Uprizoritev-read	Uprizoritev - branje	f
00030000-558a-6a67-dba4-06393e8b0dd7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558a-6a67-2453-6cd7bf25a235	Vaja-read	Vaja - branje	f
00030000-558a-6a67-617f-dc2fd8cc6e36	Vaja-write	Vaja - spreminjanje	f
00030000-558a-6a67-aafe-faba2389c7c9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558a-6a67-8de1-d400b03c7f64	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558a-6a67-71c9-593e0474ce0f	Zaposlitev-read	Zaposlitev - branje	f
00030000-558a-6a67-1511-9b407e9114ca	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558a-6a67-c9cb-726d9f1c48a4	Zasedenost-read	Zasedenost - branje	f
00030000-558a-6a67-6ede-d48566dddf8f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558a-6a67-0f91-fabc43c0ba98	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558a-6a67-6581-73c079aee24c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558a-6a67-290e-9f674afdca43	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558a-6a67-9a96-eaac1d9b097c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8107119)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558a-6a67-16c2-bc5b0217bcf0	00030000-558a-6a67-33ed-a7b7f81cefe4
00020000-558a-6a67-ac59-0831aa0b211a	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-6432-2097e2046df2
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-1f4a-e504b818757f
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-94d6-71f1fddf3549
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-0e59-10b77553f180
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-a1a3-cd5186ed683b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-8b7f-a98bfd6f2f39
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-8924-3c85817d6254
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-e00c-f2e46745941a
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-0551-7cf1a4bce10a
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-d9f6-34bc5539a57c
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-9960-18a022550b56
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-c8fc-46be322b08ac
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-1ca0-b7e2407af1ca
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-d491-cc824fe77b31
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-5f0a-d11973d0eac5
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-540c-8485e7e4ec2a
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-2fa4-edaadb0f851c
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-4c6a-3ed8d4e327e2
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-6692-d82fc1925743
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-ccc4-a16e58a331be
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-c48c-d50f45bf7017
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-5622-2cca643c1b8b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-4777-73c187b5c6af
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-fb00-8ce05a1e10c2
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-81cc-cf3bf3e17225
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-8013-ea21249edd3e
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-2bc3-6f86cc18e3bf
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-dba4-06393e8b0dd7
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-2453-6cd7bf25a235
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-617f-dc2fd8cc6e36
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-c9cb-726d9f1c48a4
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-6ede-d48566dddf8f
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a67-6661-c58b40c19a48	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-9960-18a022550b56
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-c8fc-46be322b08ac
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-1ca0-b7e2407af1ca
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-d491-cc824fe77b31
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-2fa4-edaadb0f851c
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-4c6a-3ed8d4e327e2
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-6289-2beae6b164e1
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-89de-e625e7483449
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-71f7-27090d2c0c92
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-177d-7883d9a31c8e
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-71c9-593e0474ce0f
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-1511-9b407e9114ca
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a67-98f0-f25a5d769e30	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-1f4a-e504b818757f
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-971d-3a738a86a665
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-cf60-fea2fccb34d6
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-f234-c8130d51aa5c
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-8924-3c85817d6254
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-9960-18a022550b56
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-1ca0-b7e2407af1ca
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-ccc4-a16e58a331be
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-8013-ea21249edd3e
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-2453-6cd7bf25a235
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-c9cb-726d9f1c48a4
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a67-82d8-af0d4b3d9968	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-6432-2097e2046df2
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-94d6-71f1fddf3549
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-8013-ea21249edd3e
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a67-c072-50377c6cac86	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-fa15-192b1a4f977a
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-e99f-d6d46c6e8c14
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-8013-ea21249edd3e
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a67-0d25-ce2d23784240	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-969d-5c27edc6dfe2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-33ed-a7b7f81cefe4
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e99f-d6d46c6e8c14
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-0e59-10b77553f180
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4e3f-a88f070df238
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-9223-9f758219460b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6432-2097e2046df2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-1f4a-e504b818757f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-94d6-71f1fddf3549
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2c82-849920395e25
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-971d-3a738a86a665
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-cf60-fea2fccb34d6
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-7568-fa72f5f078f0
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f234-c8130d51aa5c
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-22d0-17e3eaea88b2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6370-8c6814601e94
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-a1a3-cd5186ed683b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-ea9a-b16b0733bdce
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-8b7f-a98bfd6f2f39
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-8924-3c85817d6254
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e00c-f2e46745941a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4a5f-e7ccaeec4aa9
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-0551-7cf1a4bce10a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-d42d-711510e5b8c2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-d9f6-34bc5539a57c
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-9960-18a022550b56
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-c8fc-46be322b08ac
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-fa86-e840f7354b4f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f929-f3140b2e3e80
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2d4b-e022de8810ce
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-64d4-e5a435e6c0f9
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-df52-d8b7794f50fe
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-587d-29aa8e91fc56
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-57b6-636ddac3b513
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f94f-4cee067ef6de
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-1ca0-b7e2407af1ca
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-d491-cc824fe77b31
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-9c7c-9fecc5744d75
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e2d9-99753c1c6820
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5039-7b29490900e5
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6413-542dcae8b18f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-29c1-87f32d61f218
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-268a-3a58bb550f91
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-668d-d6403824c01c
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5f0a-d11973d0eac5
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-189b-daad5b16bdf2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-540c-8485e7e4ec2a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-04a8-43a1ef0e0a1d
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-819e-ae6918ef4834
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2fa4-edaadb0f851c
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4c6a-3ed8d4e327e2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-375f-535ff3fa7f2b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6692-d82fc1925743
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-73f4-7ef9ac504d1a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-b323-b0b9cdcfdf09
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e3c2-c51931de10a6
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5e50-8646210a8a9f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-ccc4-a16e58a331be
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-c48c-d50f45bf7017
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e9d1-d0882b4f1e0d
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f8c1-5d28e5d716db
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-365c-5265d731b9b2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-02f8-ce4a8550d8d6
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-507e-acff58011c37
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-9aaf-b0a863a712e4
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-172f-e65efebd07fa
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4f93-d7b1d14f0d59
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-faf3-4d4300217ffd
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2ac5-d2415ae82df6
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-8e51-91d4b7392fea
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-7b25-d05c230dee4a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-16f1-a8d2f6f194b0
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-bb7e-13d74bd70043
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5275-13f8cdc226e1
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5d1f-cafca9f82793
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-29ef-297a5e1cb932
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-b225-b8c984c9811f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-bbd8-0b93a1d8ba25
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5622-2cca643c1b8b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-5e3c-e734bf8e71c1
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e9a5-6ef1236e1f7f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f2f6-70bc58fe2412
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-3d61-21cd94939ab8
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-f61f-e17c7ba7e5c1
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4777-73c187b5c6af
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-a3b5-d21c39a85a7b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-fb00-8ce05a1e10c2
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-42f3-45b0aca40f06
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-055f-22d72621c492
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-849a-4109fce5eccb
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-93f9-000cde654fdc
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-88fd-3828198eb5a9
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-da48-543a729d3ee3
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e1e7-7fbbd166256d
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-4235-de0e95acc0ab
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-1a93-07f19e708a7b
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-81cc-cf3bf3e17225
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-df84-cee2fad89122
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-deaf-224b1492bd52
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-330d-778cc9b8b244
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-e428-5fec89da5376
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-3ba5-38a16151a618
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-0efd-0863a9b62228
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2f8d-79bedad8cbc0
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-0732-3a5fcd3b5284
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6289-2beae6b164e1
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-89de-e625e7483449
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-fa15-192b1a4f977a
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-26d1-825f5b2cc187
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-8013-ea21249edd3e
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-34e1-18b5062dc615
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-1524-ec1bc2517da5
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-3db8-777d5fcc8759
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-71f7-27090d2c0c92
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-177d-7883d9a31c8e
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2bc3-6f86cc18e3bf
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-dba4-06393e8b0dd7
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-2453-6cd7bf25a235
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-617f-dc2fd8cc6e36
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-aafe-faba2389c7c9
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-8de1-d400b03c7f64
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-71c9-593e0474ce0f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-1511-9b407e9114ca
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-c9cb-726d9f1c48a4
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6ede-d48566dddf8f
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-0f91-fabc43c0ba98
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-6581-73c079aee24c
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-290e-9f674afdca43
00020000-558a-6a69-f4c4-8dfac530b987	00030000-558a-6a67-9a96-eaac1d9b097c
\.


--
-- TOC entry 2881 (class 0 OID 8107414)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8107445)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8107581)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558a-6a69-4b02-8385703d5da7	00090000-558a-6a69-bdc4-b779bf8c13bb	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8107179)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558a-6a69-1cfc-ec5482209d48	00040000-558a-6a67-9fc9-9b19b6dcc0ce	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6a69-75dc-806caa3446e0	00040000-558a-6a67-9fc9-9b19b6dcc0ce	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6a69-ae1e-4c4e8d987fea	00040000-558a-6a67-9fc9-9b19b6dcc0ce	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6a69-3c76-ae7ca09e8d6a	00040000-558a-6a67-9fc9-9b19b6dcc0ce	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6a69-9279-74be25157a46	00040000-558a-6a67-9fc9-9b19b6dcc0ce	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558a-6a69-e082-8808074361b3	00040000-558a-6a67-ca52-4fbf374aa436	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8107214)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558a-6a67-6c3c-5a3b81669cdb	8341	Adlešiči
00050000-558a-6a67-1374-3d1e5586bc78	5270	Ajdovščina
00050000-558a-6a67-8830-80aae2734824	6280	Ankaran/Ancarano
00050000-558a-6a67-5af6-b4a6fcfe5ae5	9253	Apače
00050000-558a-6a67-8d05-5aa1fc4c0cb4	8253	Artiče
00050000-558a-6a67-4c3d-8829aeadd17b	4275	Begunje na Gorenjskem
00050000-558a-6a67-9509-61888a0ec4b9	1382	Begunje pri Cerknici
00050000-558a-6a67-1196-b8df5ae6df66	9231	Beltinci
00050000-558a-6a67-7bac-0335d740c6ca	2234	Benedikt
00050000-558a-6a67-56de-86201e479ca3	2345	Bistrica ob Dravi
00050000-558a-6a67-573e-3523dc315e7d	3256	Bistrica ob Sotli
00050000-558a-6a67-a9d5-6168c4c2fc62	8259	Bizeljsko
00050000-558a-6a67-def5-3c351291611d	1223	Blagovica
00050000-558a-6a67-f0b1-15450eedcc87	8283	Blanca
00050000-558a-6a67-c2b3-d8a590f30416	4260	Bled
00050000-558a-6a67-cc29-a24dc108b987	4273	Blejska Dobrava
00050000-558a-6a67-685f-ce46913f76f5	9265	Bodonci
00050000-558a-6a67-982f-49e2aad1645d	9222	Bogojina
00050000-558a-6a67-310a-300232892fcf	4263	Bohinjska Bela
00050000-558a-6a67-9623-271a57f320bb	4264	Bohinjska Bistrica
00050000-558a-6a67-6bf8-0f70f1c99627	4265	Bohinjsko jezero
00050000-558a-6a67-dae5-e508f0a9ab27	1353	Borovnica
00050000-558a-6a67-be99-c5ab8c2a2b17	8294	Boštanj
00050000-558a-6a67-15ab-df2676993728	5230	Bovec
00050000-558a-6a67-9bd7-89a5965e87e6	5295	Branik
00050000-558a-6a67-51a9-0779ddb47991	3314	Braslovče
00050000-558a-6a67-125c-eec7b9987cb8	5223	Breginj
00050000-558a-6a67-47fb-f16a9b074b82	8280	Brestanica
00050000-558a-6a67-2e2b-45d161ca57d6	2354	Bresternica
00050000-558a-6a67-b6a2-efa1bf89c7e2	4243	Brezje
00050000-558a-6a67-ba31-fed647e81977	1351	Brezovica pri Ljubljani
00050000-558a-6a67-b96e-478357214569	8250	Brežice
00050000-558a-6a67-653e-e87ce094f493	4210	Brnik - Aerodrom
00050000-558a-6a67-d456-f0e96f3c45f1	8321	Brusnice
00050000-558a-6a67-c9a5-5d99b506ed2d	3255	Buče
00050000-558a-6a67-08e1-bfc53bdd7987	8276	Bučka 
00050000-558a-6a67-90e6-a7eab9f147a8	9261	Cankova
00050000-558a-6a67-d30c-c10d110a33ee	3000	Celje 
00050000-558a-6a67-d5fb-310b7f7a719e	3001	Celje - poštni predali
00050000-558a-6a67-bfaf-ce8b54e22fb4	4207	Cerklje na Gorenjskem
00050000-558a-6a67-4ead-4848efd7884f	8263	Cerklje ob Krki
00050000-558a-6a67-b16e-bc8ba00fe9b1	1380	Cerknica
00050000-558a-6a67-ceec-58e91bae96af	5282	Cerkno
00050000-558a-6a67-986b-7ab69f3ac8fb	2236	Cerkvenjak
00050000-558a-6a67-6479-03826a96968d	2215	Ceršak
00050000-558a-6a67-15b2-8953ee9a81e3	2326	Cirkovce
00050000-558a-6a67-a174-a113ccaabd4e	2282	Cirkulane
00050000-558a-6a67-41e5-8f395cfecac0	5273	Col
00050000-558a-6a67-22ed-7fef18bfada8	8251	Čatež ob Savi
00050000-558a-6a67-8d20-583b8d753591	1413	Čemšenik
00050000-558a-6a67-c5d7-dd7bdc8d5033	5253	Čepovan
00050000-558a-6a67-8532-163bef44f9e9	9232	Črenšovci
00050000-558a-6a67-e460-1433622b5c2c	2393	Črna na Koroškem
00050000-558a-6a67-736e-f731f06c1a07	6275	Črni Kal
00050000-558a-6a67-051a-0ed1ed104573	5274	Črni Vrh nad Idrijo
00050000-558a-6a67-34fc-998e19b32711	5262	Črniče
00050000-558a-6a67-bcd5-e96bc26f97b8	8340	Črnomelj
00050000-558a-6a67-b4b3-8b10ddb2613e	6271	Dekani
00050000-558a-6a67-4580-743df82cff61	5210	Deskle
00050000-558a-6a67-5ff2-bff423baf9c2	2253	Destrnik
00050000-558a-6a67-ac09-57c13b97fa9c	6215	Divača
00050000-558a-6a67-739b-5cd30c62894b	1233	Dob
00050000-558a-6a67-8ea7-ae1494306d60	3224	Dobje pri Planini
00050000-558a-6a67-e1df-d66b7700a464	8257	Dobova
00050000-558a-6a67-6fea-3c3eae6762b9	1423	Dobovec
00050000-558a-6a67-46b3-87484f98cf73	5263	Dobravlje
00050000-558a-6a67-2ca0-1a54fa65eb9f	3204	Dobrna
00050000-558a-6a67-35f9-9499f3d8267a	8211	Dobrnič
00050000-558a-6a67-8129-3bb9b53fb859	1356	Dobrova
00050000-558a-6a67-4a00-4d8ffe72b04e	9223	Dobrovnik/Dobronak 
00050000-558a-6a67-9b61-47e0341fb6aa	5212	Dobrovo v Brdih
00050000-558a-6a67-f96e-c4f815dc2017	1431	Dol pri Hrastniku
00050000-558a-6a67-6def-28df273084c6	1262	Dol pri Ljubljani
00050000-558a-6a67-ca51-f30341ff0b77	1273	Dole pri Litiji
00050000-558a-6a67-eb3e-fd4e4e9374a1	1331	Dolenja vas
00050000-558a-6a67-dde7-a5aec5517feb	8350	Dolenjske Toplice
00050000-558a-6a67-2f5a-8551a33079f9	1230	Domžale
00050000-558a-6a67-0a43-e8c9a7880359	2252	Dornava
00050000-558a-6a67-0677-0bc64c2c9c8e	5294	Dornberk
00050000-558a-6a67-b200-7541bfffaade	1319	Draga
00050000-558a-6a67-cb02-d900cd15529e	8343	Dragatuš
00050000-558a-6a67-5d9d-a0edebb55c16	3222	Dramlje
00050000-558a-6a67-6a17-db410c5c12c1	2370	Dravograd
00050000-558a-6a67-033b-0f4e9e980062	4203	Duplje
00050000-558a-6a67-5058-745e665d8da2	6221	Dutovlje
00050000-558a-6a67-f9e4-f646cd928474	8361	Dvor
00050000-558a-6a67-e051-d0ebe017ac4d	2343	Fala
00050000-558a-6a67-961b-a1761f493caf	9208	Fokovci
00050000-558a-6a67-45d8-4c85559c5add	2313	Fram
00050000-558a-6a67-1ace-e055502d90b6	3213	Frankolovo
00050000-558a-6a67-b9f0-847ff9e29233	1274	Gabrovka
00050000-558a-6a67-2255-aab1c6764107	8254	Globoko
00050000-558a-6a67-007d-0e55c64f2855	5275	Godovič
00050000-558a-6a67-8542-78e9f26a214a	4204	Golnik
00050000-558a-6a67-c169-156789f4a7f4	3303	Gomilsko
00050000-558a-6a67-9535-553941f5f30f	4224	Gorenja vas
00050000-558a-6a67-b626-f15b15b1192b	3263	Gorica pri Slivnici
00050000-558a-6a67-9148-dc51203a003a	2272	Gorišnica
00050000-558a-6a67-7420-6e4e20651837	9250	Gornja Radgona
00050000-558a-6a67-0e5a-188d6a20a701	3342	Gornji Grad
00050000-558a-6a67-4634-a43f31eca23e	4282	Gozd Martuljek
00050000-558a-6a67-3cbb-72c34d330dc5	6272	Gračišče
00050000-558a-6a67-7e22-74af8ca130db	9264	Grad
00050000-558a-6a67-9425-2816c353cb54	8332	Gradac
00050000-558a-6a67-57fd-efd3ba19add3	1384	Grahovo
00050000-558a-6a67-d24e-5722695baeb6	5242	Grahovo ob Bači
00050000-558a-6a67-5c33-3eceb64b02ef	5251	Grgar
00050000-558a-6a67-784f-13c27e5831b3	3302	Griže
00050000-558a-6a67-a243-5c17d944662a	3231	Grobelno
00050000-558a-6a67-6804-085a59e64207	1290	Grosuplje
00050000-558a-6a67-694b-2fab9e4d47b9	2288	Hajdina
00050000-558a-6a67-4f4e-e06cb4734787	8362	Hinje
00050000-558a-6a67-5082-1ae7a0ee135c	2311	Hoče
00050000-558a-6a67-115c-60fffab4b589	9205	Hodoš/Hodos
00050000-558a-6a67-3f84-9168a64f16c3	1354	Horjul
00050000-558a-6a67-cf9a-be8dda643c9b	1372	Hotedršica
00050000-558a-6a67-c76c-99b4964eafae	1430	Hrastnik
00050000-558a-6a67-65c5-b00414fd49ca	6225	Hruševje
00050000-558a-6a67-09e0-ff346f87b1cc	4276	Hrušica
00050000-558a-6a67-a79c-740e40cf2349	5280	Idrija
00050000-558a-6a67-2a80-fd2e5e2ebbf8	1292	Ig
00050000-558a-6a67-0e20-f1d1fdf84859	6250	Ilirska Bistrica
00050000-558a-6a67-fa2e-82ae4a91be33	6251	Ilirska Bistrica-Trnovo
00050000-558a-6a67-0830-106e1dc24dd5	1295	Ivančna Gorica
00050000-558a-6a67-31c1-8124aef7abb4	2259	Ivanjkovci
00050000-558a-6a67-19f9-46501634f79d	1411	Izlake
00050000-558a-6a67-6482-768b47756b1b	6310	Izola/Isola
00050000-558a-6a67-2b3f-cab49d1d2688	2222	Jakobski Dol
00050000-558a-6a67-140c-7b637685f6fd	2221	Jarenina
00050000-558a-6a67-431b-07bcd1dcbfaa	6254	Jelšane
00050000-558a-6a67-8e73-5f5612ffa013	4270	Jesenice
00050000-558a-6a67-5dc9-a2396ff5bb9e	8261	Jesenice na Dolenjskem
00050000-558a-6a67-9d90-4af70f7d1ac9	3273	Jurklošter
00050000-558a-6a67-32fd-74f8f8dfe709	2223	Jurovski Dol
00050000-558a-6a67-f730-a634e6b16e9d	2256	Juršinci
00050000-558a-6a67-1793-3abaab59c1f9	5214	Kal nad Kanalom
00050000-558a-6a67-3e89-1f7abdaeb237	3233	Kalobje
00050000-558a-6a67-f52a-e2893d2c0fb8	4246	Kamna Gorica
00050000-558a-6a67-7031-945c3177897a	2351	Kamnica
00050000-558a-6a67-e498-5f5ff41b7bee	1241	Kamnik
00050000-558a-6a67-be48-24113fcfa095	5213	Kanal
00050000-558a-6a67-01da-99a63808f4e3	8258	Kapele
00050000-558a-6a67-aef7-18adfbb44149	2362	Kapla
00050000-558a-6a67-cb54-801d8a7d9c67	2325	Kidričevo
00050000-558a-6a67-faf8-67b998c463bf	1412	Kisovec
00050000-558a-6a67-16d0-2f77f2ca89eb	6253	Knežak
00050000-558a-6a67-4c5f-9d47e3bda5c1	5222	Kobarid
00050000-558a-6a67-512f-27d7e1b0cb0e	9227	Kobilje
00050000-558a-6a67-af7b-21fab0c0409d	1330	Kočevje
00050000-558a-6a67-d799-a1472b16f52d	1338	Kočevska Reka
00050000-558a-6a67-274a-90b5b14d975c	2276	Kog
00050000-558a-6a67-6708-abda382193b8	5211	Kojsko
00050000-558a-6a67-ae2d-023b2160362a	6223	Komen
00050000-558a-6a67-267c-9e3f87bbcf6e	1218	Komenda
00050000-558a-6a67-d0cb-2e96fea1713d	6000	Koper/Capodistria 
00050000-558a-6a67-eaad-da69f7db2356	6001	Koper/Capodistria - poštni predali
00050000-558a-6a67-c08d-b1fd33375cbd	8282	Koprivnica
00050000-558a-6a67-cbe9-5c3a9649443b	5296	Kostanjevica na Krasu
00050000-558a-6a67-4fa2-3397cebe58f6	8311	Kostanjevica na Krki
00050000-558a-6a67-5980-7c7abc2c65d2	1336	Kostel
00050000-558a-6a67-37ab-093c07877901	6256	Košana
00050000-558a-6a67-683d-be37e3cb7a84	2394	Kotlje
00050000-558a-6a67-7602-7a894bb05095	6240	Kozina
00050000-558a-6a67-f23d-85caa417facf	3260	Kozje
00050000-558a-6a67-3288-6ffd8ae99f7c	4000	Kranj 
00050000-558a-6a67-11cc-52a29a8270df	4001	Kranj - poštni predali
00050000-558a-6a67-b9c5-5f07c12cdc33	4280	Kranjska Gora
00050000-558a-6a67-71ac-95218aafe3d9	1281	Kresnice
00050000-558a-6a67-0bc4-ab5fbf39cdb9	4294	Križe
00050000-558a-6a67-4e8c-d34f2dc340fc	9206	Križevci
00050000-558a-6a67-c184-bb3ebc18a2ef	9242	Križevci pri Ljutomeru
00050000-558a-6a67-5b8e-36f98a283e28	1301	Krka
00050000-558a-6a67-d532-f94bc3b96913	8296	Krmelj
00050000-558a-6a67-18af-aeb2758bc4be	4245	Kropa
00050000-558a-6a67-8402-21ad9e50ac7e	8262	Krška vas
00050000-558a-6a67-65f3-e3fa0c53bb80	8270	Krško
00050000-558a-6a67-3f27-fc39a317498d	9263	Kuzma
00050000-558a-6a67-1418-951dbb265293	2318	Laporje
00050000-558a-6a67-0843-25a6b34393ba	3270	Laško
00050000-558a-6a67-f9a8-d5c5ff4cc350	1219	Laze v Tuhinju
00050000-558a-6a67-4629-9c9bfb68987a	2230	Lenart v Slovenskih goricah
00050000-558a-6a67-96ae-b5cfc50e1ae2	9220	Lendava/Lendva
00050000-558a-6a67-7caf-9a49c2352812	4248	Lesce
00050000-558a-6a67-7704-325fa49d5af4	3261	Lesično
00050000-558a-6a67-2912-210aa9a699e1	8273	Leskovec pri Krškem
00050000-558a-6a67-ca1b-93f21f199e27	2372	Libeliče
00050000-558a-6a67-6cf5-522b8fe7bb8e	2341	Limbuš
00050000-558a-6a67-ed2c-a051001a2979	1270	Litija
00050000-558a-6a67-95e0-7fbbae931f02	3202	Ljubečna
00050000-558a-6a67-b584-dbca5e958a67	1000	Ljubljana 
00050000-558a-6a67-2c56-7d7b7b66e64e	1001	Ljubljana - poštni predali
00050000-558a-6a67-6bf9-a3a27d055222	1231	Ljubljana - Črnuče
00050000-558a-6a67-ae01-f935a7332406	1261	Ljubljana - Dobrunje
00050000-558a-6a67-3875-6258a907089d	1260	Ljubljana - Polje
00050000-558a-6a67-21c3-83e7810b3b7b	1210	Ljubljana - Šentvid
00050000-558a-6a67-79da-4ac5adbccf27	1211	Ljubljana - Šmartno
00050000-558a-6a67-1a17-bb516c135750	3333	Ljubno ob Savinji
00050000-558a-6a67-ec43-5923e5b523c5	9240	Ljutomer
00050000-558a-6a67-5ba6-f5ddc14c7953	3215	Loče
00050000-558a-6a67-4d7a-c58ef649f143	5231	Log pod Mangartom
00050000-558a-6a67-cb35-52e25041722f	1358	Log pri Brezovici
00050000-558a-6a67-f5c6-a3741720baa2	1370	Logatec
00050000-558a-6a67-7b10-95c20a217295	1371	Logatec
00050000-558a-6a67-537d-b7a09c50e471	1434	Loka pri Zidanem Mostu
00050000-558a-6a67-5c86-36eac336d085	3223	Loka pri Žusmu
00050000-558a-6a67-5e3c-fdcd33788cdd	6219	Lokev
00050000-558a-6a68-1bae-dff124e452c6	1318	Loški Potok
00050000-558a-6a68-da37-1a5d7e004e6d	2324	Lovrenc na Dravskem polju
00050000-558a-6a68-026e-1baf8a2b4cd2	2344	Lovrenc na Pohorju
00050000-558a-6a68-c71e-d6d524706513	3334	Luče
00050000-558a-6a68-a9f3-568139c0d08a	1225	Lukovica
00050000-558a-6a68-b8a8-6c2cacebec31	9202	Mačkovci
00050000-558a-6a68-9c63-79b73b85852d	2322	Majšperk
00050000-558a-6a68-95dc-8301744813dd	2321	Makole
00050000-558a-6a68-42f8-198c8d7799d1	9243	Mala Nedelja
00050000-558a-6a68-afac-2f689614c2b5	2229	Malečnik
00050000-558a-6a68-7174-4b9ec4c5687d	6273	Marezige
00050000-558a-6a68-525b-3ccc340e49df	2000	Maribor 
00050000-558a-6a68-d7b2-2bbd8c0a7a1a	2001	Maribor - poštni predali
00050000-558a-6a68-6771-d8520493498f	2206	Marjeta na Dravskem polju
00050000-558a-6a68-7bb1-28e1f4345263	2281	Markovci
00050000-558a-6a68-b788-3738b4a2d03b	9221	Martjanci
00050000-558a-6a68-c517-942141fadf64	6242	Materija
00050000-558a-6a68-e701-8145f47e5b72	4211	Mavčiče
00050000-558a-6a68-820d-ea803199bcff	1215	Medvode
00050000-558a-6a68-2eaf-5830e577ca24	1234	Mengeš
00050000-558a-6a68-fd13-4180a1ae421d	8330	Metlika
00050000-558a-6a68-8bf6-fe64e71f518c	2392	Mežica
00050000-558a-6a68-bfc6-f17b0f28e07d	2204	Miklavž na Dravskem polju
00050000-558a-6a68-7e36-101530ec4a25	2275	Miklavž pri Ormožu
00050000-558a-6a68-7823-792b0e47afbd	5291	Miren
00050000-558a-6a68-cf44-26df69ce42c3	8233	Mirna
00050000-558a-6a68-fec9-7a0e07944bd5	8216	Mirna Peč
00050000-558a-6a68-97b4-117696c3978a	2382	Mislinja
00050000-558a-6a68-837e-5fc7f3eb5830	4281	Mojstrana
00050000-558a-6a68-4d97-b1af9026fff3	8230	Mokronog
00050000-558a-6a68-6795-d5789f5c30d6	1251	Moravče
00050000-558a-6a68-c580-f26850ae85f0	9226	Moravske Toplice
00050000-558a-6a68-cf48-ba295ec1cedb	5216	Most na Soči
00050000-558a-6a68-8045-8fccf8cb6da2	1221	Motnik
00050000-558a-6a68-2a8f-e96474b2f806	3330	Mozirje
00050000-558a-6a68-7380-cc34cd2e7c9c	9000	Murska Sobota 
00050000-558a-6a68-325c-36686d46902e	9001	Murska Sobota - poštni predali
00050000-558a-6a68-4b25-961228e35e36	2366	Muta
00050000-558a-6a68-fe93-745aed5c81b0	4202	Naklo
00050000-558a-6a68-2c1f-920e23ad9569	3331	Nazarje
00050000-558a-6a68-043c-f57e019d7dd5	1357	Notranje Gorice
00050000-558a-6a68-0ca2-96e6529cc154	3203	Nova Cerkev
00050000-558a-6a68-07a8-42973aad750a	5000	Nova Gorica 
00050000-558a-6a68-4cdb-659b82370176	5001	Nova Gorica - poštni predali
00050000-558a-6a68-7f8a-0edabd765506	1385	Nova vas
00050000-558a-6a68-96e3-584272c7fbdd	8000	Novo mesto
00050000-558a-6a68-21f7-986b939feb73	8001	Novo mesto - poštni predali
00050000-558a-6a68-ad4a-3ba353f1c115	6243	Obrov
00050000-558a-6a68-8415-66ba5478d92e	9233	Odranci
00050000-558a-6a68-fabc-e117b30da199	2317	Oplotnica
00050000-558a-6a68-d1d1-ac70b0ac6341	2312	Orehova vas
00050000-558a-6a68-0816-12acb4d3eb14	2270	Ormož
00050000-558a-6a68-d254-c930852d9683	1316	Ortnek
00050000-558a-6a68-aa97-82f8ba40d0cd	1337	Osilnica
00050000-558a-6a68-4407-afaf72ac079d	8222	Otočec
00050000-558a-6a68-768d-7ada9a8418b2	2361	Ožbalt
00050000-558a-6a68-9724-d05486d201d2	2231	Pernica
00050000-558a-6a68-8e13-4349661af7e4	2211	Pesnica pri Mariboru
00050000-558a-6a68-fa01-a5800af2db25	9203	Petrovci
00050000-558a-6a68-f835-95051ed54b46	3301	Petrovče
00050000-558a-6a68-c702-4a72ddbca447	6330	Piran/Pirano
00050000-558a-6a68-ffc1-6924268d0795	8255	Pišece
00050000-558a-6a68-4915-741909deb11a	6257	Pivka
00050000-558a-6a68-f7d7-8f6f79d71640	6232	Planina
00050000-558a-6a68-19a3-c31ddbdd0d8d	3225	Planina pri Sevnici
00050000-558a-6a68-32cb-fd2f2bb22bd4	6276	Pobegi
00050000-558a-6a68-7143-bc7b96bcbdee	8312	Podbočje
00050000-558a-6a68-061e-e39b3984a4b9	5243	Podbrdo
00050000-558a-6a68-b282-db5f348d5480	3254	Podčetrtek
00050000-558a-6a68-4ee6-8039623dfdd8	2273	Podgorci
00050000-558a-6a68-d94c-c8958366e0e0	6216	Podgorje
00050000-558a-6a68-149a-01a9ff2fc3d4	2381	Podgorje pri Slovenj Gradcu
00050000-558a-6a68-76a0-258580c35a96	6244	Podgrad
00050000-558a-6a68-27ef-3ed3f1887055	1414	Podkum
00050000-558a-6a68-8996-39fff93fb747	2286	Podlehnik
00050000-558a-6a68-c874-3e8863dfed28	5272	Podnanos
00050000-558a-6a68-b1a9-bfd2bcb97f90	4244	Podnart
00050000-558a-6a68-618c-e3f5c74ba732	3241	Podplat
00050000-558a-6a68-5720-8b497461b994	3257	Podsreda
00050000-558a-6a68-eed2-158374851a89	2363	Podvelka
00050000-558a-6a68-5050-178f0fcb1052	2208	Pohorje
00050000-558a-6a68-d3e7-08685fd9dc26	2257	Polenšak
00050000-558a-6a68-2ffd-94f52b3a2e68	1355	Polhov Gradec
00050000-558a-6a68-b96a-99d5c9c23618	4223	Poljane nad Škofjo Loko
00050000-558a-6a68-2884-df5a845aab57	2319	Poljčane
00050000-558a-6a68-beb8-1d1acdba1fdd	1272	Polšnik
00050000-558a-6a68-260e-22b390755251	3313	Polzela
00050000-558a-6a68-9b88-6ce6bed193f8	3232	Ponikva
00050000-558a-6a68-e451-cfd63d78f9bb	6320	Portorož/Portorose
00050000-558a-6a68-0b63-4ff52aa58d63	6230	Postojna
00050000-558a-6a68-050e-65c54811721b	2331	Pragersko
00050000-558a-6a68-e4ed-623f67f8a147	3312	Prebold
00050000-558a-6a68-773d-f74251a9bbca	4205	Preddvor
00050000-558a-6a68-3b3d-0855d7b20e71	6255	Prem
00050000-558a-6a68-6b31-6ad4e6b49287	1352	Preserje
00050000-558a-6a68-e0e2-619da804f76b	6258	Prestranek
00050000-558a-6a68-7d1b-272d627b46da	2391	Prevalje
00050000-558a-6a68-50f2-16e7d19579cc	3262	Prevorje
00050000-558a-6a68-bf85-dfed0601bace	1276	Primskovo 
00050000-558a-6a68-0b88-7ddd5ca49c96	3253	Pristava pri Mestinju
00050000-558a-6a68-611d-dd16d15bddd4	9207	Prosenjakovci/Partosfalva
00050000-558a-6a68-3c8e-4155bae6f610	5297	Prvačina
00050000-558a-6a68-7966-fefeaec2203d	2250	Ptuj
00050000-558a-6a68-fd90-f2529c7cbee4	2323	Ptujska Gora
00050000-558a-6a68-2502-9d2ad9bc340b	9201	Puconci
00050000-558a-6a68-c3c7-3d43dcb2e0d1	2327	Rače
00050000-558a-6a68-1649-4a5bf76d327d	1433	Radeče
00050000-558a-6a68-58b4-ba26cb1895a1	9252	Radenci
00050000-558a-6a68-bf62-0040166e0dbd	2360	Radlje ob Dravi
00050000-558a-6a68-4551-ed4e9b98e22d	1235	Radomlje
00050000-558a-6a68-774a-c9ed1e4c6996	4240	Radovljica
00050000-558a-6a68-ad44-ff2f4c40c59d	8274	Raka
00050000-558a-6a68-8438-cb9ef1c99682	1381	Rakek
00050000-558a-6a68-9715-fd169e7efdb8	4283	Rateče - Planica
00050000-558a-6a68-885a-38703bdb8f1e	2390	Ravne na Koroškem
00050000-558a-6a68-3038-615768d0712a	9246	Razkrižje
00050000-558a-6a68-f5fd-60862979d662	3332	Rečica ob Savinji
00050000-558a-6a68-367b-59b25fb68f05	5292	Renče
00050000-558a-6a68-b8c9-c67a2856f31c	1310	Ribnica
00050000-558a-6a68-321a-346e4058516d	2364	Ribnica na Pohorju
00050000-558a-6a68-cb0f-c6ea9d046924	3272	Rimske Toplice
00050000-558a-6a68-5e37-714cf1465fcc	1314	Rob
00050000-558a-6a68-29fb-e45a65772579	5215	Ročinj
00050000-558a-6a68-59b7-276a9c55663f	3250	Rogaška Slatina
00050000-558a-6a68-0d69-7e2c06591ddf	9262	Rogašovci
00050000-558a-6a68-2e3d-23b643eeb22c	3252	Rogatec
00050000-558a-6a68-70c2-72a03e24c114	1373	Rovte
00050000-558a-6a68-35e0-4a77c77f0634	2342	Ruše
00050000-558a-6a68-c134-54ba3a76bbeb	1282	Sava
00050000-558a-6a68-f595-dfb7635ad7ae	6333	Sečovlje/Sicciole
00050000-558a-6a68-b5b6-ff604a143b3d	4227	Selca
00050000-558a-6a68-5da6-c53b1fd8d2c6	2352	Selnica ob Dravi
00050000-558a-6a68-6db8-ec4d8a4a5804	8333	Semič
00050000-558a-6a68-833b-b7f439c68956	8281	Senovo
00050000-558a-6a68-8f8d-a2da5b0c2b38	6224	Senožeče
00050000-558a-6a68-5024-ad7ba0e55209	8290	Sevnica
00050000-558a-6a68-f0bb-53f2e219275f	6210	Sežana
00050000-558a-6a68-ca92-5099e0e3966a	2214	Sladki Vrh
00050000-558a-6a68-e9db-07dcf67b8103	5283	Slap ob Idrijci
00050000-558a-6a68-8c75-1e3b801de3f8	2380	Slovenj Gradec
00050000-558a-6a68-71c5-645268a16ff4	2310	Slovenska Bistrica
00050000-558a-6a68-bd45-65709b8ba369	3210	Slovenske Konjice
00050000-558a-6a68-4c2b-e242f3a70b1e	1216	Smlednik
00050000-558a-6a68-506c-f492de0ca403	5232	Soča
00050000-558a-6a68-cbc4-eddebbc0b3e9	1317	Sodražica
00050000-558a-6a68-d993-b12b34113b07	3335	Solčava
00050000-558a-6a68-c3a1-183cc73f5bdc	5250	Solkan
00050000-558a-6a68-8cd5-cd5aefe918cd	4229	Sorica
00050000-558a-6a68-961b-c960a7a81178	4225	Sovodenj
00050000-558a-6a68-0f44-3381d72b4c19	5281	Spodnja Idrija
00050000-558a-6a68-d604-09bd098af92b	2241	Spodnji Duplek
00050000-558a-6a68-eed4-338b98664ff6	9245	Spodnji Ivanjci
00050000-558a-6a68-47e0-67ec324aaef2	2277	Središče ob Dravi
00050000-558a-6a68-befa-5d177008f971	4267	Srednja vas v Bohinju
00050000-558a-6a68-4210-a7b29454fc5e	8256	Sromlje 
00050000-558a-6a68-58a5-7ffdcfdef439	5224	Srpenica
00050000-558a-6a68-c3f1-31487625c1b9	1242	Stahovica
00050000-558a-6a68-89f6-e3a66f5dd2c6	1332	Stara Cerkev
00050000-558a-6a68-7fcf-3f78ae650c52	8342	Stari trg ob Kolpi
00050000-558a-6a68-3492-b16792fe88ca	1386	Stari trg pri Ložu
00050000-558a-6a68-0462-01824dbf8155	2205	Starše
00050000-558a-6a68-0eee-b36bce936bfb	2289	Stoperce
00050000-558a-6a68-d076-4f8d4d27f7b0	8322	Stopiče
00050000-558a-6a68-0568-5b90259e3072	3206	Stranice
00050000-558a-6a68-125a-bd868d97f312	8351	Straža
00050000-558a-6a68-9001-4b48372a33c4	1313	Struge
00050000-558a-6a68-93d1-86fb5e63ae80	8293	Studenec
00050000-558a-6a68-dba7-d6e48dba01cf	8331	Suhor
00050000-558a-6a68-e2a9-5fd6b37a30c3	2233	Sv. Ana v Slovenskih goricah
00050000-558a-6a68-6567-a82c3949d4a1	2235	Sv. Trojica v Slovenskih goricah
00050000-558a-6a68-e465-bcbb5f53824f	2353	Sveti Duh na Ostrem Vrhu
00050000-558a-6a68-2037-57894067fadc	9244	Sveti Jurij ob Ščavnici
00050000-558a-6a68-0430-5fbd409af424	3264	Sveti Štefan
00050000-558a-6a68-9b46-e424b3c0f6b9	2258	Sveti Tomaž
00050000-558a-6a68-f63a-6be6b9870555	9204	Šalovci
00050000-558a-6a68-51db-7f3d3dffd865	5261	Šempas
00050000-558a-6a68-9b01-338e2ef64558	5290	Šempeter pri Gorici
00050000-558a-6a68-0abe-50f9d9dcddde	3311	Šempeter v Savinjski dolini
00050000-558a-6a68-327b-58031fb79cbd	4208	Šenčur
00050000-558a-6a68-b958-746294b52252	2212	Šentilj v Slovenskih goricah
00050000-558a-6a68-9110-5893b80a910d	8297	Šentjanž
00050000-558a-6a68-2f2a-0642fa6a62ea	2373	Šentjanž pri Dravogradu
00050000-558a-6a68-453c-28c5eaecfeff	8310	Šentjernej
00050000-558a-6a68-ee31-8bb7f8ef9226	3230	Šentjur
00050000-558a-6a68-f52d-3e7ecad4be0d	3271	Šentrupert
00050000-558a-6a68-e0ec-9f7eac137955	8232	Šentrupert
00050000-558a-6a68-50aa-de1d9663439e	1296	Šentvid pri Stični
00050000-558a-6a68-5965-d6f8b0911644	8275	Škocjan
00050000-558a-6a68-985a-d786f22bb9c9	6281	Škofije
00050000-558a-6a68-4daf-d57c699d0b6b	4220	Škofja Loka
00050000-558a-6a68-34fd-7fd72cc78a5c	3211	Škofja vas
00050000-558a-6a68-0cba-f7723e48fb48	1291	Škofljica
00050000-558a-6a68-d412-69ce2001e45d	6274	Šmarje
00050000-558a-6a68-d9b0-3bd62638ec36	1293	Šmarje - Sap
00050000-558a-6a68-61b0-282f74c3b975	3240	Šmarje pri Jelšah
00050000-558a-6a68-3d3b-b171eae5415b	8220	Šmarješke Toplice
00050000-558a-6a68-d904-7c4eff1fbd20	2315	Šmartno na Pohorju
00050000-558a-6a68-3e40-c86ee454ec52	3341	Šmartno ob Dreti
00050000-558a-6a68-947e-7a823bb13316	3327	Šmartno ob Paki
00050000-558a-6a68-2c89-56fbe722ebc1	1275	Šmartno pri Litiji
00050000-558a-6a68-95f2-095b3711fb28	2383	Šmartno pri Slovenj Gradcu
00050000-558a-6a68-66e6-672140817a2e	3201	Šmartno v Rožni dolini
00050000-558a-6a68-39d0-46c6e79b90ae	3325	Šoštanj
00050000-558a-6a68-4fb9-9ca881118c61	6222	Štanjel
00050000-558a-6a68-03f5-17d4866f19e8	3220	Štore
00050000-558a-6a68-0525-7f24fcefe8a5	3304	Tabor
00050000-558a-6a68-2e09-670d1216dd6a	3221	Teharje
00050000-558a-6a68-b3bb-0abae09cfa4e	9251	Tišina
00050000-558a-6a68-d337-64f4fb3f6c77	5220	Tolmin
00050000-558a-6a68-2218-6e56397411bf	3326	Topolšica
00050000-558a-6a68-a4a3-6ad3619dba50	2371	Trbonje
00050000-558a-6a68-5161-f0ac7b05a5ac	1420	Trbovlje
00050000-558a-6a68-bb84-9a0c7d97b5a0	8231	Trebelno 
00050000-558a-6a68-3bfa-85701bd6e121	8210	Trebnje
00050000-558a-6a68-f533-b03f0c784c62	5252	Trnovo pri Gorici
00050000-558a-6a68-1dad-f94168b935f5	2254	Trnovska vas
00050000-558a-6a68-9ec8-ad255a73f144	1222	Trojane
00050000-558a-6a68-f8c1-a4f21e7707df	1236	Trzin
00050000-558a-6a68-f29b-acbcf6e0e264	4290	Tržič
00050000-558a-6a68-ee81-42ac4a2e3916	8295	Tržišče
00050000-558a-6a68-7c2f-2de41fbbb3c5	1311	Turjak
00050000-558a-6a68-2382-bfc35b004a70	9224	Turnišče
00050000-558a-6a68-fd11-6d098624edda	8323	Uršna sela
00050000-558a-6a68-fcbd-6f3a19989786	1252	Vače
00050000-558a-6a68-ef53-ae45d32dd361	3320	Velenje 
00050000-558a-6a68-f9a9-33a25cd5da6a	3322	Velenje - poštni predali
00050000-558a-6a68-9cf4-dd2254d9e900	8212	Velika Loka
00050000-558a-6a68-f15e-4919a65671c4	2274	Velika Nedelja
00050000-558a-6a68-5abb-2e2158e2d7f3	9225	Velika Polana
00050000-558a-6a68-3b55-03ed402f9a91	1315	Velike Lašče
00050000-558a-6a68-3630-4defe31fb7aa	8213	Veliki Gaber
00050000-558a-6a68-7c76-15e45e132ebc	9241	Veržej
00050000-558a-6a68-9cdc-872ab3a813cc	1312	Videm - Dobrepolje
00050000-558a-6a68-ce6e-56d0b0bb211a	2284	Videm pri Ptuju
00050000-558a-6a68-8993-4468c76b7563	8344	Vinica
00050000-558a-6a68-8ad4-59b28938e6fe	5271	Vipava
00050000-558a-6a68-1e0c-38d39bb04968	4212	Visoko
00050000-558a-6a68-04f1-1a72469ad49e	1294	Višnja Gora
00050000-558a-6a68-4ccd-9a32b1794833	3205	Vitanje
00050000-558a-6a68-741e-d13786104d8f	2255	Vitomarci
00050000-558a-6a68-d344-35a99adbbe2a	1217	Vodice
00050000-558a-6a68-8cf7-4fce0126f2b0	3212	Vojnik\t
00050000-558a-6a68-2573-d8f9bed8c41a	5293	Volčja Draga
00050000-558a-6a68-6bbc-f0819123d3b3	2232	Voličina
00050000-558a-6a68-ccef-824011c8d7d2	3305	Vransko
00050000-558a-6a68-b05a-d6b0d2bacffc	6217	Vremski Britof
00050000-558a-6a68-0f97-b66403d56fc3	1360	Vrhnika
00050000-558a-6a68-bf9d-e17389d3e131	2365	Vuhred
00050000-558a-6a68-7266-79174bdbef9a	2367	Vuzenica
00050000-558a-6a68-4dbd-8a372eb4db7e	8292	Zabukovje 
00050000-558a-6a68-0374-1c97b089bf74	1410	Zagorje ob Savi
00050000-558a-6a68-1f29-08963447f7d6	1303	Zagradec
00050000-558a-6a68-6916-fee48e317cc0	2283	Zavrč
00050000-558a-6a68-84c8-f2363e0cbb5b	8272	Zdole 
00050000-558a-6a68-9c54-5f9426168ede	4201	Zgornja Besnica
00050000-558a-6a68-61ce-2a06a5288348	2242	Zgornja Korena
00050000-558a-6a68-209e-ca979da09cdd	2201	Zgornja Kungota
00050000-558a-6a68-34c0-495a738d5dd8	2316	Zgornja Ložnica
00050000-558a-6a68-b7c1-32ba23940d79	2314	Zgornja Polskava
00050000-558a-6a68-b92d-901381052fce	2213	Zgornja Velka
00050000-558a-6a68-34c7-60d8dccb6d35	4247	Zgornje Gorje
00050000-558a-6a68-adfb-e58f50f2f30a	4206	Zgornje Jezersko
00050000-558a-6a68-44fc-c2d607153e9f	2285	Zgornji Leskovec
00050000-558a-6a68-191c-ce7ee4072c47	1432	Zidani Most
00050000-558a-6a68-f7fe-9f8036cc2573	3214	Zreče
00050000-558a-6a68-e813-d676c73af81a	4209	Žabnica
00050000-558a-6a68-3468-04f84f0278e2	3310	Žalec
00050000-558a-6a68-ffae-b43db38dd028	4228	Železniki
00050000-558a-6a68-6801-9084b02bf744	2287	Žetale
00050000-558a-6a68-13dc-3c1cc831257d	4226	Žiri
00050000-558a-6a68-f325-1c233dfabb32	4274	Žirovnica
00050000-558a-6a68-c60c-f296f648b285	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8107388)
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
-- TOC entry 2859 (class 0 OID 8107199)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8107277)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8107400)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8107520)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8107573)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558a-6a69-0903-cc801be3293f	00080000-558a-6a69-e082-8808074361b3	0900	AK
00190000-558a-6a69-863d-ddcd0fbd6622	00080000-558a-6a69-ae1e-4c4e8d987fea	0987	A
00190000-558a-6a69-1d1d-db28e0373f80	00080000-558a-6a69-75dc-806caa3446e0	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8107708)
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
-- TOC entry 2883 (class 0 OID 8107429)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558a-6a69-b9ba-d2e5b5f58fab	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558a-6a69-2c29-c62db72303cc	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558a-6a69-a995-11b1391f9b7b	0003	Kazinska	t	84	Kazinska dvorana
00220000-558a-6a69-4cd6-c64cee3963f7	0004	Mali oder	t	24	Mali oder 
00220000-558a-6a69-a8e5-59d5d511e420	0005	Komorni oder	t	15	Komorni oder
00220000-558a-6a69-6eb6-048d6a043298	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558a-6a69-dd31-fa3305910d5e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8107373)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8107363)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8107562)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8107497)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8107071)
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
-- TOC entry 2884 (class 0 OID 8107439)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8107109)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558a-6a67-16c2-bc5b0217bcf0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558a-6a67-ac59-0831aa0b211a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558a-6a67-058d-2bb49c4abf8a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558a-6a67-1177-ecc42af0bb90	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558a-6a67-6661-c58b40c19a48	planer	Planer dogodkov v koledarju	t
00020000-558a-6a67-98f0-f25a5d769e30	kadrovska	Kadrovska služba	t
00020000-558a-6a67-82d8-af0d4b3d9968	arhivar	Ažuriranje arhivalij	t
00020000-558a-6a67-c072-50377c6cac86	igralec	Igralec	t
00020000-558a-6a67-0d25-ce2d23784240	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558a-6a69-f4c4-8dfac530b987	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8107093)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558a-6a67-8be0-d595e4492157	00020000-558a-6a67-058d-2bb49c4abf8a
00010000-558a-6a67-e2cb-5045410968a2	00020000-558a-6a67-058d-2bb49c4abf8a
00010000-558a-6a69-5b51-a6ce74a4bdb1	00020000-558a-6a69-f4c4-8dfac530b987
\.


--
-- TOC entry 2886 (class 0 OID 8107453)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8107394)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8107344)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8107752)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558a-6a68-97f2-84a733c19064	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558a-6a68-507e-49d3a7272ba4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558a-6a68-643c-e158b61856ec	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558a-6a68-7961-14ce86173447	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558a-6a68-de55-ff3f4d53ef05	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8107744)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558a-6a68-1c67-828442dabfd7	00230000-558a-6a68-7961-14ce86173447	popa
00240000-558a-6a68-10e6-41026780bbda	00230000-558a-6a68-7961-14ce86173447	oseba
00240000-558a-6a68-327c-c3242431fb1d	00230000-558a-6a68-507e-49d3a7272ba4	prostor
00240000-558a-6a68-0575-42a0112ecd8c	00230000-558a-6a68-7961-14ce86173447	besedilo
00240000-558a-6a68-b649-c6b4cbeca5b2	00230000-558a-6a68-7961-14ce86173447	uprizoritev
00240000-558a-6a68-1442-2cbfdf75fbae	00230000-558a-6a68-7961-14ce86173447	funkcija
00240000-558a-6a68-93cd-33e377c3f090	00230000-558a-6a68-7961-14ce86173447	tipfunkcije
00240000-558a-6a68-6ecc-038d6db4b2e2	00230000-558a-6a68-7961-14ce86173447	alternacija
00240000-558a-6a68-0b8a-d3874c4b166d	00230000-558a-6a68-97f2-84a733c19064	pogodba
00240000-558a-6a68-bbf9-6fdcf1147291	00230000-558a-6a68-7961-14ce86173447	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8107739)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8107507)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558a-6a69-7d4f-58bd06033517	000e0000-558a-6a69-6956-1f7ed6f431d6	00080000-558a-6a69-1cfc-ec5482209d48	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558a-6a69-b48b-ce9e91aa54e4	000e0000-558a-6a69-6956-1f7ed6f431d6	00080000-558a-6a69-1cfc-ec5482209d48	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558a-6a69-be13-0a6bb77a0fca	000e0000-558a-6a69-6956-1f7ed6f431d6	00080000-558a-6a69-9279-74be25157a46	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8107171)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8107350)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558a-6a69-4546-247518ed42ef	00180000-558a-6a69-0524-438ff4d1f17a	000c0000-558a-6a69-c26c-76630314d461	00090000-558a-6a69-81b6-4fac3a353bad	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6a69-86cd-146823f5bb3f	00180000-558a-6a69-0524-438ff4d1f17a	000c0000-558a-6a69-a1fd-597df32eccc6	00090000-558a-6a69-2a70-1ce8cc42583c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6a69-0f23-8ab19ffc49e3	00180000-558a-6a69-0524-438ff4d1f17a	000c0000-558a-6a69-9dfa-35b4be08a8e6	00090000-558a-6a69-34b0-3fccab09b803	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6a69-a9ce-769cf4808907	00180000-558a-6a69-0524-438ff4d1f17a	000c0000-558a-6a69-6783-c2411a252b0e	00090000-558a-6a69-839c-1c1c018b8a38	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6a69-3462-5db7ebc17e8f	00180000-558a-6a69-0524-438ff4d1f17a	000c0000-558a-6a69-21c6-700eb89f4f49	00090000-558a-6a69-d7e7-8c569c9dd4fb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558a-6a69-1148-dab7602d4eb0	00180000-558a-6a69-461b-8487241ff611	\N	00090000-558a-6a69-d7e7-8c569c9dd4fb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8107551)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558a-6a68-0d93-dd6a4ccfbd0c	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558a-6a68-5d20-b742273c1098	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558a-6a68-72c3-1f34f569c785	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558a-6a68-bd23-f32788b48cbf	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558a-6a68-9ab6-e696355944b7	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558a-6a68-991a-19b4b2de0eea	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558a-6a68-d396-fbb666fe973f	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558a-6a68-ed09-2f9ab0980e7f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558a-6a68-5640-72c30624c193	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558a-6a68-642e-49136d525079	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558a-6a68-6b47-17b9e4a05b81	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558a-6a68-9ea7-99b0dc03c880	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558a-6a68-fd8d-9d4c9dbaea84	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558a-6a68-aa79-8769c776519c	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558a-6a68-6748-5f94a2f7ff0d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558a-6a68-1a2f-da4574632033	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8107721)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558a-6a68-fc11-3174fc92a2d7	01	Velika predstava	f	1.00	1.00
002b0000-558a-6a68-f11b-c16f83c2907c	02	Mala predstava	f	0.50	0.50
002b0000-558a-6a68-c63a-6dea37e0c6f2	03	Mala koprodukcija	t	0.40	1.00
002b0000-558a-6a68-707e-e43e5786735f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558a-6a68-2f38-a0aa13acb5b6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8107234)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8107080)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558a-6a67-e2cb-5045410968a2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4nqjMHSNFc.ZgBdLoKXPtIIgyOQORca	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558a-6a69-205e-3abebdad9933	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558a-6a69-63ad-2d42e7be09e0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558a-6a69-202e-cb00f0330f2f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558a-6a69-4d6e-ae5a21da8064	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558a-6a69-38b3-c228f893f8cc	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558a-6a69-f623-70e7869fd7e1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558a-6a69-e8bc-bd47b5fe7cdd	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558a-6a69-a3d0-20b0620902b6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558a-6a69-1bb8-3da282cbb0a9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558a-6a69-5b51-a6ce74a4bdb1	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558a-6a67-8be0-d595e4492157	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8107608)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-558a-6a69-643b-4a5dada4b870	00160000-558a-6a69-649c-f40e2b490dc3	00150000-558a-6a68-54da-8f14ab2253c3	00140000-558a-6a67-70b9-6e50c468beca	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-558a-6a69-a8e5-59d5d511e420
000e0000-558a-6a69-6956-1f7ed6f431d6	00160000-558a-6a69-26a5-7c9a52740adf	00150000-558a-6a68-27fb-dcafd3a2c190	00140000-558a-6a67-f13a-92602f98f2ef	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-558a-6a69-6eb6-048d6a043298
000e0000-558a-6a69-d542-ab1620bd519b	\N	00150000-558a-6a68-27fb-dcafd3a2c190	00140000-558a-6a67-f13a-92602f98f2ef	00190000-558a-6a69-863d-ddcd0fbd6622	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-558a-6a69-a8e5-59d5d511e420
000e0000-558a-6a69-604c-3a5aa91df099	\N	00150000-558a-6a68-27fb-dcafd3a2c190	00140000-558a-6a67-f13a-92602f98f2ef	00190000-558a-6a69-863d-ddcd0fbd6622	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-558a-6a69-a8e5-59d5d511e420
\.


--
-- TOC entry 2867 (class 0 OID 8107296)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558a-6a69-c75f-4c93890ede5f	000e0000-558a-6a69-6956-1f7ed6f431d6	1	
00200000-558a-6a69-c4c6-27287c3b838e	000e0000-558a-6a69-6956-1f7ed6f431d6	2	
\.


--
-- TOC entry 2882 (class 0 OID 8107421)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8107490)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8107328)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8107598)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558a-6a67-70b9-6e50c468beca	01	Drama	drama (SURS 01)
00140000-558a-6a67-3bed-2774d92f40cc	02	Opera	opera (SURS 02)
00140000-558a-6a67-2b12-7ad73d16be11	03	Balet	balet (SURS 03)
00140000-558a-6a67-8ce8-e81290b1969f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558a-6a67-7587-b33a86b3f60d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558a-6a67-f13a-92602f98f2ef	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558a-6a67-d272-54b7f91e5ed9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8107480)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558a-6a68-28fb-379934220bdc	01	Opera	opera
00150000-558a-6a68-a8c7-8875a0f8ef36	02	Opereta	opereta
00150000-558a-6a68-fe17-a9a02e25a282	03	Balet	balet
00150000-558a-6a68-b2a4-ae7653f1a2d2	04	Plesne prireditve	plesne prireditve
00150000-558a-6a68-31b4-03fd4b233158	05	Lutkovno gledališče	lutkovno gledališče
00150000-558a-6a68-bbed-e9a5ecc4042a	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558a-6a68-d131-d5f8b93c7d10	07	Biografska drama	biografska drama
00150000-558a-6a68-54da-8f14ab2253c3	08	Komedija	komedija
00150000-558a-6a68-4cfe-c1ccd96dc583	09	Črna komedija	črna komedija
00150000-558a-6a68-5466-ffdfd5f26cd2	10	E-igra	E-igra
00150000-558a-6a68-27fb-dcafd3a2c190	11	Kriminalka	kriminalka
00150000-558a-6a68-1f37-0d2804b18140	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 8107134)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 8107655)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8107645)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8107550)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8107318)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 8107343)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 8107737)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8107260)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 8107703)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8107476)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8107294)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8107337)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 8107274)
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
-- TOC entry 2531 (class 2606 OID 8107386)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8107413)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 8107232)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 8107143)
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
-- TOC entry 2446 (class 2606 OID 8107167)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 8107123)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 8107108)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 8107419)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8107452)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8107593)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 8107196)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8107220)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 8107392)
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
-- TOC entry 2461 (class 2606 OID 8107210)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 8107281)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 8107404)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8107532)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8107578)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 8107719)
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
-- TOC entry 2551 (class 2606 OID 8107436)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 8107377)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 8107368)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8107572)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8107504)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 8107079)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 8107443)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 8107097)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 8107117)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 8107461)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8107399)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8107349)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 8107761)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 8107749)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 8107743)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8107517)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 8107176)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 8107359)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8107561)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8107731)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 8107245)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8107092)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 8107624)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 8107303)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 8107427)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8107495)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 8107332)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 8107606)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 8107488)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 8107325)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2579 (class 1259 OID 8107518)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 8107519)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 8107198)
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
-- TOC entry 2544 (class 1259 OID 8107420)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2538 (class 1259 OID 8107406)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2539 (class 1259 OID 8107405)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 8107304)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2566 (class 1259 OID 8107477)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 8107479)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2568 (class 1259 OID 8107478)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 8107276)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 8107275)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 8107595)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 8107596)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8107597)
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
-- TOC entry 2606 (class 1259 OID 8107629)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2607 (class 1259 OID 8107626)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2608 (class 1259 OID 8107630)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2609 (class 1259 OID 8107628)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2610 (class 1259 OID 8107627)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 8107247)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 8107246)
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
-- TOC entry 2444 (class 1259 OID 8107170)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2554 (class 1259 OID 8107444)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 8107338)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 8107124)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 8107125)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2559 (class 1259 OID 8107464)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2560 (class 1259 OID 8107463)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 8107462)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 8107282)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 8107284)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 8107283)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 8107751)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2518 (class 1259 OID 8107372)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2519 (class 1259 OID 8107370)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2520 (class 1259 OID 8107369)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2521 (class 1259 OID 8107371)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 8107098)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 8107099)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2547 (class 1259 OID 8107428)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2533 (class 1259 OID 8107393)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2575 (class 1259 OID 8107505)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2576 (class 1259 OID 8107506)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2628 (class 1259 OID 8107707)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2629 (class 1259 OID 8107704)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2630 (class 1259 OID 8107705)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2631 (class 1259 OID 8107706)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 8107212)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 8107211)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 8107213)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 8107533)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 8107534)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2620 (class 1259 OID 8107659)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2621 (class 1259 OID 8107661)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2622 (class 1259 OID 8107657)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2623 (class 1259 OID 8107660)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2624 (class 1259 OID 8107658)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2572 (class 1259 OID 8107496)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 8107381)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2525 (class 1259 OID 8107380)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2526 (class 1259 OID 8107378)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2527 (class 1259 OID 8107379)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2396 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2616 (class 1259 OID 8107647)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 8107646)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 8107720)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 8107295)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 8107738)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2440 (class 1259 OID 8107145)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 8107144)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 8107177)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 8107178)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 8107362)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 8107361)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 8107360)
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
-- TOC entry 2496 (class 1259 OID 8107327)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 8107323)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 8107320)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 8107321)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 8107319)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 8107324)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 8107322)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 8107197)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 8107261)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 8107263)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 8107262)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 8107264)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2532 (class 1259 OID 8107387)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2602 (class 1259 OID 8107594)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2611 (class 1259 OID 8107625)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 8107168)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 8107169)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 8107489)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 8107762)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 8107233)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 8107750)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2552 (class 1259 OID 8107438)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2553 (class 1259 OID 8107437)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 8107656)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2464 (class 1259 OID 8107221)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 8107607)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2595 (class 1259 OID 8107579)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 8107580)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2433 (class 1259 OID 8107118)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 8107326)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 2606 OID 8107898)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2677 (class 2606 OID 8107883)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2676 (class 2606 OID 8107888)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2672 (class 2606 OID 8107908)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2678 (class 2606 OID 8107878)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2673 (class 2606 OID 8107903)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2675 (class 2606 OID 8107893)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8108053)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2707 (class 2606 OID 8108058)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 8107813)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2695 (class 2606 OID 8107993)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2693 (class 2606 OID 8107988)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8107983)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 8107873)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 8108023)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 8108033)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2702 (class 2606 OID 8108028)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2665 (class 2606 OID 8107848)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8107843)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 8107973)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 8108078)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 8108083)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 8108088)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2716 (class 2606 OID 8108108)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2719 (class 2606 OID 8108093)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2715 (class 2606 OID 8108113)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 8108103)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2718 (class 2606 OID 8108098)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2663 (class 2606 OID 8107838)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8107833)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8107798)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8107793)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 8108003)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 8107913)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8107773)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2651 (class 2606 OID 8107778)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2698 (class 2606 OID 8108018)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2699 (class 2606 OID 8108013)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 8108008)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2669 (class 2606 OID 8107853)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 8107863)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2668 (class 2606 OID 8107858)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8108183)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2683 (class 2606 OID 8107948)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8107938)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2686 (class 2606 OID 8107933)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2684 (class 2606 OID 8107943)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8107763)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8107768)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2696 (class 2606 OID 8107998)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 8107978)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8108043)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2705 (class 2606 OID 8108048)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8108168)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8108153)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8108158)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8108163)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 8107823)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 8107818)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8107828)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8108063)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8108068)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8108138)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2722 (class 2606 OID 8108148)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8108128)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2723 (class 2606 OID 8108143)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2725 (class 2606 OID 8108133)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2704 (class 2606 OID 8108038)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2687 (class 2606 OID 8107968)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2688 (class 2606 OID 8107963)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2690 (class 2606 OID 8107953)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8107958)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2720 (class 2606 OID 8108123)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8108118)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8108173)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2670 (class 2606 OID 8107868)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8108073)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8108178)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2653 (class 2606 OID 8107788)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8107783)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8107803)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8107808)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 8107928)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2681 (class 2606 OID 8107923)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2682 (class 2606 OID 8107918)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-24 10:29:30 CEST

--
-- PostgreSQL database dump complete
--

