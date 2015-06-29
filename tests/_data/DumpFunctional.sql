--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 09:37:00 CEST

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
-- TOC entry 183 (class 1259 OID 8345950)
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
-- TOC entry 230 (class 1259 OID 8346468)
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
-- TOC entry 229 (class 1259 OID 8346451)
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
-- TOC entry 222 (class 1259 OID 8346355)
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
-- TOC entry 197 (class 1259 OID 8346129)
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
-- TOC entry 200 (class 1259 OID 8346163)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8346551)
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
-- TOC entry 192 (class 1259 OID 8346072)
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
-- TOC entry 231 (class 1259 OID 8346481)
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
-- TOC entry 216 (class 1259 OID 8346289)
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
-- TOC entry 195 (class 1259 OID 8346109)
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
-- TOC entry 199 (class 1259 OID 8346157)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8346089)
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
-- TOC entry 205 (class 1259 OID 8346206)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8346231)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8346046)
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
-- TOC entry 184 (class 1259 OID 8345959)
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
-- TOC entry 185 (class 1259 OID 8345970)
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
-- TOC entry 180 (class 1259 OID 8345924)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8345943)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8346238)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8346269)
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
-- TOC entry 226 (class 1259 OID 8346401)
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
-- TOC entry 187 (class 1259 OID 8346003)
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
-- TOC entry 189 (class 1259 OID 8346038)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8346212)
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
-- TOC entry 188 (class 1259 OID 8346023)
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
-- TOC entry 194 (class 1259 OID 8346101)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8346224)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8346344)
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
-- TOC entry 225 (class 1259 OID 8346393)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8346527)
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
-- TOC entry 212 (class 1259 OID 8346253)
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
-- TOC entry 204 (class 1259 OID 8346197)
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
-- TOC entry 203 (class 1259 OID 8346187)
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
-- TOC entry 224 (class 1259 OID 8346382)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8346321)
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
-- TOC entry 177 (class 1259 OID 8345895)
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
-- TOC entry 176 (class 1259 OID 8345893)
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
-- TOC entry 213 (class 1259 OID 8346263)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8345933)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8345917)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8346277)
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
-- TOC entry 207 (class 1259 OID 8346218)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8346168)
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
-- TOC entry 237 (class 1259 OID 8346571)
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
-- TOC entry 236 (class 1259 OID 8346563)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8346558)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8346331)
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
-- TOC entry 186 (class 1259 OID 8345995)
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
-- TOC entry 202 (class 1259 OID 8346174)
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
-- TOC entry 223 (class 1259 OID 8346371)
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
-- TOC entry 233 (class 1259 OID 8346540)
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
-- TOC entry 191 (class 1259 OID 8346058)
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
-- TOC entry 178 (class 1259 OID 8345904)
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
-- TOC entry 228 (class 1259 OID 8346428)
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
-- TOC entry 196 (class 1259 OID 8346120)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8346245)
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
-- TOC entry 218 (class 1259 OID 8346314)
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
-- TOC entry 198 (class 1259 OID 8346152)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8346418)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8346304)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8345898)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8345950)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8346468)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5590-f59c-f4ab-4dfe9a846306	000d0000-5590-f59c-c8fe-d4b7a56c5b6e	\N	00090000-5590-f59c-c473-62f92db4d529	000b0000-5590-f59c-2181-6fcfe1c8d9b3	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-f59c-b3d7-81de98cd81e1	000d0000-5590-f59c-a459-66e289483761	\N	00090000-5590-f59c-c517-69448eb1c21d	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-f59c-411a-93daeb945526	000d0000-5590-f59c-12f0-f0c24d183835	\N	00090000-5590-f59c-203f-b195848ccaf2	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-f59c-ea1f-d528b060c963	000d0000-5590-f59c-8f79-1f9459e88920	\N	00090000-5590-f59c-2468-681078d8198a	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-f59c-81d1-68f2dc958387	000d0000-5590-f59c-c120-19f50ef2d3be	\N	00090000-5590-f59c-eb75-b0dc51a9a692	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-f59c-dd06-9f2a7458f5e3	000d0000-5590-f59c-9358-231c5bd8a1d6	\N	00090000-5590-f59c-c517-69448eb1c21d	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8346451)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8346355)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5590-f59b-2c8d-96a6b0ad5b16	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5590-f59b-ab09-feefc6ddafb4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5590-f59b-5f73-5bf7fc48d4e2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8346129)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5590-f59c-de23-ff346040b5e3	\N	\N	00200000-5590-f59c-367a-8d06462450a9	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5590-f59c-bc35-53cb0cbf36ee	\N	\N	00200000-5590-f59c-1397-10d6ff2978bb	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5590-f59c-60e7-55d2bd590502	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5590-f59c-fca5-1ee5a98b9a00	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5590-f59c-a08a-1bf764f2b552	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8346163)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8346551)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8346072)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5590-f599-1013-16be5c589922	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5590-f599-7277-b26f36268597	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5590-f599-db83-acefa9bffcdb	AL	ALB	008	Albania 	Albanija	\N
00040000-5590-f599-881c-5cb6a2454769	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5590-f599-570c-4c5372c87ace	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5590-f599-19d7-bfaad8bf0f8b	AD	AND	020	Andorra 	Andora	\N
00040000-5590-f599-3d65-8f0d9e430093	AO	AGO	024	Angola 	Angola	\N
00040000-5590-f599-530d-7576d08e8f07	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5590-f599-4f0f-1a77192d11d1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5590-f599-5517-9b455f5484ab	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5590-f599-1fa4-664815936b6e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5590-f599-6e8e-59e88410704a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5590-f599-a25d-420139ab8597	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5590-f599-c80b-efdd531493e4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5590-f599-1133-2002f4511f7e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5590-f599-9491-56f07c9a8306	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5590-f599-64f6-abef29ce7046	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5590-f599-8cb6-c3dae1c716c4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5590-f599-e75a-ef4701284fba	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5590-f599-b672-f4cdbb0e5645	BB	BRB	052	Barbados 	Barbados	\N
00040000-5590-f599-f486-e19710b09db5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5590-f599-3f8c-7d02c84c539a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5590-f599-cdb1-15dbbd8d16e7	BZ	BLZ	084	Belize 	Belize	\N
00040000-5590-f599-ee07-cd85611ca751	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5590-f599-9498-3e1c2a32d4f9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5590-f599-cc7c-99a05c510b4e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5590-f599-61c7-97484c802314	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5590-f599-690a-3549bd47b217	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5590-f599-2822-f8e6ad72c09b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5590-f599-ab7a-669fb6016a3d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5590-f599-3a5e-b1772df01ecd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5590-f599-6c93-436fe35a91f3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5590-f599-6ee6-7a383b90e120	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5590-f599-e1e1-da6f551a1dce	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5590-f599-4d44-d31741a186b2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5590-f599-7af1-e862b9b5d134	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5590-f599-298a-bab25af85286	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5590-f599-525b-db087648a178	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5590-f599-7231-6630e2a2305f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5590-f599-4488-ccb9945b56d0	CA	CAN	124	Canada 	Kanada	\N
00040000-5590-f599-3dad-e857f46d1116	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5590-f599-1849-79a29be4be46	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5590-f599-ddbf-a0dd4e563a50	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5590-f599-1a31-e9f4e4b0d26f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5590-f599-11c8-31bafaf5d321	CL	CHL	152	Chile 	Čile	\N
00040000-5590-f599-eeec-7e95ae8d5f09	CN	CHN	156	China 	Kitajska	\N
00040000-5590-f599-0c65-91bb660db0f3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5590-f599-45d9-2304105156f3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5590-f599-5916-77fa345ca151	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5590-f599-aff6-d6d96c62891a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5590-f599-a42e-e7954b9dd954	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5590-f599-8069-2746808f901e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5590-f599-3b4b-cb521853cf4d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5590-f599-283c-8e30cd05c388	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5590-f599-cfc7-d164a151cec7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5590-f599-835f-810a2b390924	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5590-f599-ed48-926b59387d6b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5590-f599-84cc-810788ba641d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5590-f599-9d88-917313963dee	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5590-f599-6429-3b8a5502c31a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5590-f599-52a0-6c7db61e64cc	DK	DNK	208	Denmark 	Danska	\N
00040000-5590-f599-8cd0-38b309a2dfe0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5590-f599-b6bb-7d25583d34d1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5590-f599-7ce4-fbb47dc013af	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5590-f599-f1f5-6a534d1f7539	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5590-f599-21bb-a15288fe5195	EG	EGY	818	Egypt 	Egipt	\N
00040000-5590-f59a-1f5b-de99e6c6c100	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5590-f59a-277f-864e5089e189	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5590-f59a-3d58-4c2a9cb01a24	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5590-f59a-e9c7-059ae6b51cf0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5590-f59a-c385-e0867140e731	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5590-f59a-4b3d-590b622ad0b4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5590-f59a-6605-9743752a3ee8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5590-f59a-301e-bd9e8bf3e3bd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5590-f59a-8f31-10d97c6dc286	FI	FIN	246	Finland 	Finska	\N
00040000-5590-f59a-71ed-29f3714256f4	FR	FRA	250	France 	Francija	\N
00040000-5590-f59a-ad0b-ba7204db7fe6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5590-f59a-3787-fa28225461b2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5590-f59a-5de8-b7adb8d8dac6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5590-f59a-4d2c-141142aa489f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5590-f59a-a16e-d6ad1b47d787	GA	GAB	266	Gabon 	Gabon	\N
00040000-5590-f59a-8396-77876f29612d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5590-f59a-8148-b5f2912b8a5e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5590-f59a-e762-555ad8e1f6b2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5590-f59a-fd66-ba93f5cd0071	GH	GHA	288	Ghana 	Gana	\N
00040000-5590-f59a-7e51-2ff4d2a2f09d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5590-f59a-c13f-36951e5181de	GR	GRC	300	Greece 	Grčija	\N
00040000-5590-f59a-f4ac-c2369edfddf0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5590-f59a-b820-947d220d3680	GD	GRD	308	Grenada 	Grenada	\N
00040000-5590-f59a-22de-574f6ba8e5c1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5590-f59a-196d-93ec8a9b6fd3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5590-f59a-9d2e-ed8fa267ea4f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5590-f59a-bf6c-4274a954178f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5590-f59a-6216-ea1b471c1bfa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5590-f59a-bb32-8a1e413d93d1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5590-f59a-eef6-8d5b8a54dc1e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5590-f59a-5f74-b95f0671d531	HT	HTI	332	Haiti 	Haiti	\N
00040000-5590-f59a-7532-48d5e572d1c8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5590-f59a-1983-aa4a30c4809c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5590-f59a-635a-6cdd60114a92	HN	HND	340	Honduras 	Honduras	\N
00040000-5590-f59a-9a00-d7948293e39e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5590-f59a-9d5f-90b825cb9b77	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5590-f59a-6572-e6d7ffe4944c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5590-f59a-0dde-4cc8ae720069	IN	IND	356	India 	Indija	\N
00040000-5590-f59a-6d91-bbbc73ac13b2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5590-f59a-c6e3-08fb69e207cf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5590-f59a-7531-2ed802203601	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5590-f59a-14f8-eef6ab11f8a8	IE	IRL	372	Ireland 	Irska	\N
00040000-5590-f59a-e831-38799b4cafff	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5590-f59a-ad58-dace1900898d	IL	ISR	376	Israel 	Izrael	\N
00040000-5590-f59a-6754-8fff9f967cdd	IT	ITA	380	Italy 	Italija	\N
00040000-5590-f59a-d17a-5e0fdb905be7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5590-f59a-626a-83c4576d0b70	JP	JPN	392	Japan 	Japonska	\N
00040000-5590-f59a-8c50-e210013e5b66	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5590-f59a-8441-7cd8af264427	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5590-f59a-22e8-412482c7c29e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5590-f59a-bb38-cb90740a7797	KE	KEN	404	Kenya 	Kenija	\N
00040000-5590-f59a-5ee7-b741418c9287	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5590-f59a-d933-1f1d6c28b7ec	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5590-f59a-fce3-c3c6e979bb19	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5590-f59a-e537-67134470472c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5590-f59a-b532-c11e247eded9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5590-f59a-a844-8a13c6a1af64	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5590-f59a-6140-240ab6699d65	LV	LVA	428	Latvia 	Latvija	\N
00040000-5590-f59a-290a-590ee51aefe9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5590-f59a-d005-c168221976b6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5590-f59a-e8bf-f4debec93fa4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5590-f59a-9695-af4c9d78341e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5590-f59a-cba5-b71d8f867c57	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5590-f59a-0e49-a2cbf2eaf8ee	LT	LTU	440	Lithuania 	Litva	\N
00040000-5590-f59a-794e-e74027effa45	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5590-f59a-0a76-d629cfb878b2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5590-f59a-a253-804e22768d5e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5590-f59a-3477-266e2642e6f8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5590-f59a-79d9-efa80932ea4d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5590-f59a-3fa1-7ecad5b6909f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5590-f59a-9d15-bb72206e7802	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5590-f59a-3f4d-537b68d0f51f	ML	MLI	466	Mali 	Mali	\N
00040000-5590-f59a-5683-a2a3a2e0af4a	MT	MLT	470	Malta 	Malta	\N
00040000-5590-f59a-5d21-286f079f676a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5590-f59a-7b43-db662f666235	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5590-f59a-e274-890f9a0b4d0f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5590-f59a-4635-9fa302e69526	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5590-f59a-577a-5cb82370e8c2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5590-f59a-8cdf-49ee5fd31ad8	MX	MEX	484	Mexico 	Mehika	\N
00040000-5590-f59a-fd9b-2ecc8cefbcd8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5590-f59a-c53a-8921a134d289	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5590-f59a-d16f-839000f2aa20	MC	MCO	492	Monaco 	Monako	\N
00040000-5590-f59a-26d1-ea7b92a758f9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5590-f59a-fa21-de37132f5994	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5590-f59a-d9c8-2add1374a731	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5590-f59a-8fc1-91e48854f80c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5590-f59a-a9ae-33d5ad48d5ee	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5590-f59a-d593-3d050bb99e54	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5590-f59a-dcbb-f7d6a3f4c345	NA	NAM	516	Namibia 	Namibija	\N
00040000-5590-f59a-c873-fe58c1841b4f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5590-f59a-37b1-3f445c3de8be	NP	NPL	524	Nepal 	Nepal	\N
00040000-5590-f59a-dd98-b0757fe07fa5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5590-f59a-aee3-9372e2e96f0a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5590-f59a-a3ae-15827e69b242	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5590-f59a-9c53-b4d4e6e6fabf	NE	NER	562	Niger 	Niger 	\N
00040000-5590-f59a-f3ae-642cf5cc1022	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5590-f59a-be9f-58fdf63e3b70	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5590-f59a-adec-fa57014f997a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5590-f59a-fbd9-d63beae0151e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5590-f59a-eae4-1b8a5672d438	NO	NOR	578	Norway 	Norveška	\N
00040000-5590-f59a-7283-f687dbb00210	OM	OMN	512	Oman 	Oman	\N
00040000-5590-f59a-af41-5bb9842c2cfb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5590-f59a-edd6-9c983f885d79	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5590-f59a-14d8-6ce9c8bba74e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5590-f59a-750c-7987906d720c	PA	PAN	591	Panama 	Panama	\N
00040000-5590-f59a-f2d9-7cc1ee602c3e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5590-f59a-7bc4-d2f37bca1f1b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5590-f59a-6bd3-e3ed70d6b317	PE	PER	604	Peru 	Peru	\N
00040000-5590-f59a-3c50-5119942f4484	PH	PHL	608	Philippines 	Filipini	\N
00040000-5590-f59a-7711-af3879d12817	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5590-f59a-50c8-94926dfd1e36	PL	POL	616	Poland 	Poljska	\N
00040000-5590-f59a-84c7-27ef18f22d5b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5590-f59a-6166-033479a5e310	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5590-f59a-1943-bfde42f61d4e	QA	QAT	634	Qatar 	Katar	\N
00040000-5590-f59a-495c-31f2b12dc0eb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5590-f59a-7fc0-e86235197a83	RO	ROU	642	Romania 	Romunija	\N
00040000-5590-f59a-66fa-61cf2e23e8a3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5590-f59a-2273-731bb38b8bf9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5590-f59a-e03a-766598063baf	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5590-f59a-486d-7e452612c947	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5590-f59a-341a-035dc5bbd5c6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5590-f59a-4a10-0c1476fa5252	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5590-f59a-8c6d-c3ed35bc7625	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5590-f59a-e412-be882005f7d1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5590-f59a-8a8b-e2c8462263f9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5590-f59a-8376-eeb84e9db9b3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5590-f59a-c756-dd7ce74e1795	SM	SMR	674	San Marino 	San Marino	\N
00040000-5590-f59a-a1b1-bd8ded61c046	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5590-f59a-4b51-0e95e4ee3d49	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5590-f59a-9e01-02aa323bd791	SN	SEN	686	Senegal 	Senegal	\N
00040000-5590-f59a-b92f-81e30371b102	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5590-f59a-8b85-e89e53abedcc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5590-f59a-dc36-533a5d9cfa78	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5590-f59a-4632-57332afb7c58	SG	SGP	702	Singapore 	Singapur	\N
00040000-5590-f59a-32f7-c7259216df15	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5590-f59a-bd5d-2fadb4d5ff2a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5590-f59a-3161-1fe0f2dbbe00	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5590-f59a-5d5d-2712050c0b73	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5590-f59a-a61a-473f5e3a23dc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5590-f59a-dbed-19d1aba7ab27	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5590-f59a-a33a-850eb9f8714b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5590-f59a-d39e-97722e6fc30c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5590-f59a-15f8-48abafb96221	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5590-f59a-b398-4a87ea129341	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5590-f59a-d751-78457e101eef	SD	SDN	729	Sudan 	Sudan	\N
00040000-5590-f59a-7fbc-d9c00f17125a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5590-f59a-3d46-37bf1b6be70f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5590-f59a-c938-14ac4ee89138	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5590-f59a-d951-d5742e50a8c8	SE	SWE	752	Sweden 	Švedska	\N
00040000-5590-f59a-ab64-245bc3d0377d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5590-f59a-e300-f92f83c5eb70	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5590-f59a-a610-63c726159200	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5590-f59a-7d8b-8b7792efe513	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5590-f59a-e7b2-d87712ef3027	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5590-f59a-40eb-6567da094408	TH	THA	764	Thailand 	Tajska	\N
00040000-5590-f59a-4bcf-ecb5e42a0ae5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5590-f59a-74e2-9b12368e692d	TG	TGO	768	Togo 	Togo	\N
00040000-5590-f59a-a1f3-a19be35dc567	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5590-f59a-f39f-a489dc4bcdcd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5590-f59a-24ae-c93f17b162d7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5590-f59a-fd8e-2ef81db8482a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5590-f59a-d10f-ff2dd7ea8107	TR	TUR	792	Turkey 	Turčija	\N
00040000-5590-f59a-17bb-c5c723ebe3a6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5590-f59a-f559-db750a5e404a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5590-f59a-d4c5-3668bc838440	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5590-f59a-c473-01b3dfa03c5b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5590-f59a-41ee-e2e67ea500f3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5590-f59a-c498-6e16151d3443	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5590-f59a-4364-e28e4232fdcf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5590-f59a-cf00-a9cc5be3acc5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5590-f59a-1b6e-9582787d300b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5590-f59a-eaa3-ce55ac57843f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5590-f59a-6e88-1ddda38adba8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5590-f59a-1901-97a1b508ea77	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5590-f59a-0817-35e8e75112c9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5590-f59a-e1aa-cdd7b9fabd52	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5590-f59a-89d1-054e37e2e4ce	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5590-f59a-03a8-78d5f7612bd3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5590-f59a-5d41-31b7d94b5c66	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5590-f59a-299a-f71b4159c310	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5590-f59a-6f3a-c5c9952ab970	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5590-f59a-4eba-50602da8989e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5590-f59a-b295-7425872d9c57	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8346481)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5590-f59c-975b-6e5d3807056a	000e0000-5590-f59c-7715-beaa4863c7f3	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5590-f59a-ca07-5d57e0c3008f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5590-f59c-b04d-8f02c5dfbb6f	000e0000-5590-f59c-6634-c0e1b7906c21	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5590-f59a-7ea3-6298c28343f4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8346289)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5590-f59c-6706-dad50b88713a	000e0000-5590-f59c-6634-c0e1b7906c21	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5590-f59a-27a4-d1eb7e3c5615
000d0000-5590-f59c-c8fe-d4b7a56c5b6e	000e0000-5590-f59c-6634-c0e1b7906c21	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5590-f59a-27a4-d1eb7e3c5615
000d0000-5590-f59c-a459-66e289483761	000e0000-5590-f59c-6634-c0e1b7906c21	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5590-f59a-ea58-3816a877d677
000d0000-5590-f59c-12f0-f0c24d183835	000e0000-5590-f59c-6634-c0e1b7906c21	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5590-f59a-086b-756c8e7b8d42
000d0000-5590-f59c-8f79-1f9459e88920	000e0000-5590-f59c-6634-c0e1b7906c21	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5590-f59a-086b-756c8e7b8d42
000d0000-5590-f59c-c120-19f50ef2d3be	000e0000-5590-f59c-6634-c0e1b7906c21	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5590-f59a-086b-756c8e7b8d42
000d0000-5590-f59c-9358-231c5bd8a1d6	000e0000-5590-f59c-6634-c0e1b7906c21	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5590-f59a-27a4-d1eb7e3c5615
\.


--
-- TOC entry 2860 (class 0 OID 8346109)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8346157)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8346089)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5590-f59c-b224-6099481bff03	00080000-5590-f59b-d0b5-5dc9e2de3ba2	00090000-5590-f59c-c473-62f92db4d529	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8346206)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8346231)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8346046)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5590-f59a-2f99-7f1975083e5a	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5590-f59a-fc55-5fa4624dc29f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5590-f59a-71ce-388d86c7a571	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5590-f59a-e3cd-77d6e39ff34c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5590-f59a-7dd9-dc8897351ee3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5590-f59a-2069-b0245fc0dd06	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5590-f59a-1f7a-d41698eeff7b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5590-f59a-b9b1-2197e136ed1e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5590-f59a-523e-cfb1d897a5e8	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5590-f59a-87ad-a308de489138	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5590-f59a-068f-0b3e43eab2fe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5590-f59a-0b59-d82506d346b2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5590-f59a-b3be-5f2fb2203976	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5590-f59b-5ffc-85a5b3e83e1e	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5590-f59b-fd23-3a045ebef606	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5590-f59b-d2a1-6b84db115620	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5590-f59b-3c36-5212c1506ab1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5590-f59b-24e2-0b4b75d86943	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5590-f59b-58ec-9e5eb1c0dadf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8345959)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5590-f59b-43ee-5d9263d1dd9b	00000000-5590-f59b-fd23-3a045ebef606	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5590-f59b-00d2-702abc12d394	00000000-5590-f59b-fd23-3a045ebef606	00010000-5590-f59a-4243-7776c3ef7e49	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5590-f59b-0c39-54897fd58219	00000000-5590-f59b-d2a1-6b84db115620	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8345970)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5590-f59c-2e8b-0fc901d3c992	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5590-f59c-2468-681078d8198a	00010000-5590-f59c-bcba-4bc8bb2a459f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5590-f59c-203f-b195848ccaf2	00010000-5590-f59c-85ec-9bbe7d6b05d6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5590-f59c-1768-255a1dad88d2	00010000-5590-f59c-fd98-43d925963855	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5590-f59c-e4df-8c6837a8c427	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5590-f59c-ed2a-0470a1e1e466	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5590-f59c-2eaa-6468063d7a5c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5590-f59c-0f28-8ecfb87a652b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5590-f59c-c473-62f92db4d529	00010000-5590-f59c-6679-482ba404a156	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5590-f59c-c517-69448eb1c21d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5590-f59c-d3a5-6049f5c30e06	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5590-f59c-eb75-b0dc51a9a692	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5590-f59c-f514-57f53862771e	00010000-5590-f59c-7983-db0ea41c90ab	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8345924)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5590-f59a-df47-5cda7a5c34eb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5590-f59a-411b-6d38417cb0c5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5590-f59a-e39a-1ed69d214fc6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5590-f59a-7693-ba208fc113ce	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5590-f59a-d748-f1b4b0c6344f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5590-f59a-524b-7e787feabbd0	Abonma-read	Abonma - branje	f
00030000-5590-f59a-c8b0-6be6c132c576	Abonma-write	Abonma - spreminjanje	f
00030000-5590-f59a-c526-1312d46b8706	Alternacija-read	Alternacija - branje	f
00030000-5590-f59a-a1d9-21a7442a9c25	Alternacija-write	Alternacija - spreminjanje	f
00030000-5590-f59a-7a9a-a8e0f891e234	Arhivalija-read	Arhivalija - branje	f
00030000-5590-f59a-32ad-b06902bac8ae	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5590-f59a-1f0b-a90654ce8bb5	Besedilo-read	Besedilo - branje	f
00030000-5590-f59a-8797-2c4973b17e24	Besedilo-write	Besedilo - spreminjanje	f
00030000-5590-f59a-8e32-b6dba597e785	DogodekIzven-read	DogodekIzven - branje	f
00030000-5590-f59a-75f8-4ec81f48f522	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5590-f59a-2567-c518bd7e2a18	Dogodek-read	Dogodek - branje	f
00030000-5590-f59a-4a32-5a2d48711196	Dogodek-write	Dogodek - spreminjanje	f
00030000-5590-f59a-e20b-dc6eacbaa648	DrugiVir-read	DrugiVir - branje	f
00030000-5590-f59a-0765-fe908efb1901	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5590-f59a-da00-6e7858dc46cb	Drzava-read	Drzava - branje	f
00030000-5590-f59a-9d28-d52657d87e5d	Drzava-write	Drzava - spreminjanje	f
00030000-5590-f59a-426e-8aa34b5fb222	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5590-f59a-81d2-afc4f4f25e80	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5590-f59a-7572-a2dcf0c17006	Funkcija-read	Funkcija - branje	f
00030000-5590-f59a-2c22-ec4cee2fbc31	Funkcija-write	Funkcija - spreminjanje	f
00030000-5590-f59a-ed80-34c57172d4e8	Gostovanje-read	Gostovanje - branje	f
00030000-5590-f59a-a23b-2f4c216e6636	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5590-f59a-ed36-a1a963917522	Gostujoca-read	Gostujoca - branje	f
00030000-5590-f59a-1fdb-b5c8eef54863	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5590-f59a-0cb2-0b17bea1bc7a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5590-f59a-08a6-88894cd1a5af	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5590-f59a-ad05-d8b30f545467	Kupec-read	Kupec - branje	f
00030000-5590-f59a-811e-732a831ab862	Kupec-write	Kupec - spreminjanje	f
00030000-5590-f59a-d2d8-df3f730fe24c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5590-f59a-ec2c-dd054c32d2b6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5590-f59a-90c9-b57911c87e97	Option-read	Option - branje	f
00030000-5590-f59a-1e5e-4675b1f57e55	Option-write	Option - spreminjanje	f
00030000-5590-f59a-17a2-22e9573a142b	OptionValue-read	OptionValue - branje	f
00030000-5590-f59a-9410-ed98eee5f371	OptionValue-write	OptionValue - spreminjanje	f
00030000-5590-f59a-4afa-4519de2d8a6c	Oseba-read	Oseba - branje	f
00030000-5590-f59a-8c70-33b140db1b33	Oseba-write	Oseba - spreminjanje	f
00030000-5590-f59a-a3df-b83d49104cef	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5590-f59a-54c2-79e39bce3d8b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5590-f59a-a33b-1a3a570629cb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5590-f59a-545a-1850907dfd00	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5590-f59a-f2c9-a1f1780dd1ee	Pogodba-read	Pogodba - branje	f
00030000-5590-f59a-82bb-f44d3bf6d93b	Pogodba-write	Pogodba - spreminjanje	f
00030000-5590-f59a-1f84-3ece1d7b79aa	Popa-read	Popa - branje	f
00030000-5590-f59a-2c5c-38178f386a70	Popa-write	Popa - spreminjanje	f
00030000-5590-f59a-63e5-a6ec80851273	Posta-read	Posta - branje	f
00030000-5590-f59a-c1e3-0a85d098476e	Posta-write	Posta - spreminjanje	f
00030000-5590-f59a-86f3-cd783d92ecc6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5590-f59a-fdfa-34ffdb664d7c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5590-f59a-10a1-adbdaa4a72f1	PostniNaslov-read	PostniNaslov - branje	f
00030000-5590-f59a-1015-096161953632	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5590-f59a-8600-f18e43c0a118	Predstava-read	Predstava - branje	f
00030000-5590-f59a-a8e8-35ed986d8de6	Predstava-write	Predstava - spreminjanje	f
00030000-5590-f59a-bb98-8b810015fe5f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5590-f59a-e1cb-d2ce27e94074	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5590-f59a-76cd-2f99a04ed663	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5590-f59a-20a7-04eb8167809c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5590-f59a-51f3-1f0757476e86	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5590-f59a-bb44-0f66c12fdf63	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5590-f59a-4d53-6abb37c0668e	ProgramDela-read	ProgramDela - branje	f
00030000-5590-f59a-eaed-b6efd3de0036	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5590-f59a-cef7-425d67e9d399	ProgramFestival-read	ProgramFestival - branje	f
00030000-5590-f59a-f44e-e5dd114d7f85	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5590-f59a-df5d-da361c313609	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5590-f59a-53a2-8b559387d095	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5590-f59a-02c0-480dc880d43f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5590-f59a-ed20-c7bf290091a4	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5590-f59a-a143-d247dfe7e331	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5590-f59a-a901-c4c6b735dbb2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5590-f59a-8a9d-34bf730a24f3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5590-f59a-f958-1ca56ab06e69	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5590-f59a-e219-3b03a6e34f1e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5590-f59a-3e90-ffe0b0dadcbd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5590-f59a-f02a-595f632fccde	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5590-f59a-0f51-0653d5d6a301	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5590-f59a-1fc4-7322b5544118	ProgramRazno-read	ProgramRazno - branje	f
00030000-5590-f59a-195d-ea2ccc41f918	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5590-f59a-ea7d-85c6fa756618	Prostor-read	Prostor - branje	f
00030000-5590-f59a-eb99-27042401ad69	Prostor-write	Prostor - spreminjanje	f
00030000-5590-f59a-604e-1ea0fc7763d9	Racun-read	Racun - branje	f
00030000-5590-f59a-db92-17a880c18c59	Racun-write	Racun - spreminjanje	f
00030000-5590-f59a-630d-a9553648e72f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5590-f59a-5e03-5dd14ff4af81	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5590-f59a-8e83-2c831ec777dd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5590-f59a-b69d-27643af1474a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5590-f59a-50d1-06c9ecefb809	Rekvizit-read	Rekvizit - branje	f
00030000-5590-f59a-983d-8d355a93b5be	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5590-f59a-e619-3de4f3f97a33	Revizija-read	Revizija - branje	f
00030000-5590-f59a-e59f-551582c34927	Revizija-write	Revizija - spreminjanje	f
00030000-5590-f59a-9e21-60875e73d4ef	Rezervacija-read	Rezervacija - branje	f
00030000-5590-f59a-623e-708bafaf690a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5590-f59a-9200-ce0b2a1b3922	SedezniRed-read	SedezniRed - branje	f
00030000-5590-f59a-a94f-e9f10e933a5d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5590-f59a-eeee-fe2920a9459f	Sedez-read	Sedez - branje	f
00030000-5590-f59a-6ef4-3833a9ad8b8e	Sedez-write	Sedez - spreminjanje	f
00030000-5590-f59a-0712-4458bc2d4498	Sezona-read	Sezona - branje	f
00030000-5590-f59a-0a11-02089c3c6a81	Sezona-write	Sezona - spreminjanje	f
00030000-5590-f59a-5119-f2b47e85dbdd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5590-f59a-53a1-8be13ef59739	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5590-f59a-b6ff-cec24da563f9	Stevilcenje-read	Stevilcenje - branje	f
00030000-5590-f59a-8a1b-12f1ae1879a1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5590-f59a-bfef-225911ae8f8e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5590-f59a-4e04-e4083149f6d5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5590-f59a-2a4e-c78cfe87b7bf	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5590-f59a-43de-e4c1ecc2505c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5590-f59a-506b-bed79686fa14	Telefonska-read	Telefonska - branje	f
00030000-5590-f59a-b55c-7b065df1efca	Telefonska-write	Telefonska - spreminjanje	f
00030000-5590-f59a-d13f-694d3615ccd8	TerminStoritve-read	TerminStoritve - branje	f
00030000-5590-f59a-158b-9bbf67696094	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5590-f59a-2edf-46ea9c4f2113	TipFunkcije-read	TipFunkcije - branje	f
00030000-5590-f59a-8cd9-0f343ed5d027	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5590-f59a-1d29-eb753abcaa96	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5590-f59a-1dec-c1bdb9ee2ba0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5590-f59a-37e5-9b9adfb1317c	Trr-read	Trr - branje	f
00030000-5590-f59a-74b2-fa1a26d34fd2	Trr-write	Trr - spreminjanje	f
00030000-5590-f59a-ec2a-36fb8c9f5dae	Uprizoritev-read	Uprizoritev - branje	f
00030000-5590-f59a-ec28-a1c099d7f258	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5590-f59a-e329-5e27fb9ac9e5	Vaja-read	Vaja - branje	f
00030000-5590-f59a-65cf-857e84cde045	Vaja-write	Vaja - spreminjanje	f
00030000-5590-f59a-3f88-7f5a9bf44be4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5590-f59a-0290-ef65bc31299e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5590-f59a-c3a6-7f6bf5072d7a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5590-f59a-160b-a88614133bfc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5590-f59a-81f5-571aca5edb97	Zasedenost-read	Zasedenost - branje	f
00030000-5590-f59a-1f2f-c87dd7efe98c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5590-f59a-fe6e-2d51c15bf923	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5590-f59a-e1ab-0f95a3f62bed	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5590-f59a-34ed-36ebef6e4d56	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5590-f59a-baa0-02b7ad095730	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8345943)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5590-f59a-aac4-282ea945ecdc	00030000-5590-f59a-411b-6d38417cb0c5
00020000-5590-f59a-1e5f-016d2e43cbeb	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-c8b0-6be6c132c576
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-c526-1312d46b8706
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-a1d9-21a7442a9c25
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-7693-ba208fc113ce
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-4a32-5a2d48711196
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-9d28-d52657d87e5d
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-7572-a2dcf0c17006
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-2c22-ec4cee2fbc31
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-a23b-2f4c216e6636
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-1fdb-b5c8eef54863
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-0cb2-0b17bea1bc7a
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-08a6-88894cd1a5af
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-4afa-4519de2d8a6c
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-8c70-33b140db1b33
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-2c5c-38178f386a70
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-c1e3-0a85d098476e
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-10a1-adbdaa4a72f1
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-1015-096161953632
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-a8e8-35ed986d8de6
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-51f3-1f0757476e86
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-bb44-0f66c12fdf63
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-eb99-27042401ad69
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-b69d-27643af1474a
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-983d-8d355a93b5be
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-0a11-02089c3c6a81
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-2edf-46ea9c4f2113
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-ec2a-36fb8c9f5dae
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-ec28-a1c099d7f258
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-e329-5e27fb9ac9e5
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-65cf-857e84cde045
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-81f5-571aca5edb97
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-1f2f-c87dd7efe98c
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59a-475c-bd98d3eca009	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-0cb2-0b17bea1bc7a
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-08a6-88894cd1a5af
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-4afa-4519de2d8a6c
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-8c70-33b140db1b33
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-10a1-adbdaa4a72f1
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-1015-096161953632
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-506b-bed79686fa14
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-b55c-7b065df1efca
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-37e5-9b9adfb1317c
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-74b2-fa1a26d34fd2
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-c3a6-7f6bf5072d7a
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-160b-a88614133bfc
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59a-3548-7ab1e7e5f7fd	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-c526-1312d46b8706
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-32ad-b06902bac8ae
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-1f0b-a90654ce8bb5
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-8e32-b6dba597e785
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-7572-a2dcf0c17006
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-0cb2-0b17bea1bc7a
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-4afa-4519de2d8a6c
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-51f3-1f0757476e86
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-2edf-46ea9c4f2113
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-e329-5e27fb9ac9e5
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-81f5-571aca5edb97
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59a-8636-69ab563f7b9e	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-c8b0-6be6c132c576
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-a1d9-21a7442a9c25
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-2edf-46ea9c4f2113
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59a-fe87-d47d3e745a7a	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-d13f-694d3615ccd8
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-e39a-1ed69d214fc6
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-2edf-46ea9c4f2113
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59a-3fa7-b66f12daccff	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-df47-5cda7a5c34eb
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-411b-6d38417cb0c5
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e39a-1ed69d214fc6
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-7693-ba208fc113ce
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-d748-f1b4b0c6344f
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-524b-7e787feabbd0
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-c8b0-6be6c132c576
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-c526-1312d46b8706
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a1d9-21a7442a9c25
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-7a9a-a8e0f891e234
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-32ad-b06902bac8ae
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1f0b-a90654ce8bb5
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8797-2c4973b17e24
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8e32-b6dba597e785
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-75f8-4ec81f48f522
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-2567-c518bd7e2a18
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-4a32-5a2d48711196
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-da00-6e7858dc46cb
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-9d28-d52657d87e5d
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-426e-8aa34b5fb222
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-81d2-afc4f4f25e80
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-7572-a2dcf0c17006
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-2c22-ec4cee2fbc31
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ed80-34c57172d4e8
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a23b-2f4c216e6636
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ed36-a1a963917522
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1fdb-b5c8eef54863
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-0cb2-0b17bea1bc7a
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-08a6-88894cd1a5af
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ad05-d8b30f545467
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-811e-732a831ab862
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-d2d8-df3f730fe24c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ec2c-dd054c32d2b6
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-90c9-b57911c87e97
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1e5e-4675b1f57e55
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-17a2-22e9573a142b
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-9410-ed98eee5f371
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-4afa-4519de2d8a6c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8c70-33b140db1b33
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a3df-b83d49104cef
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-54c2-79e39bce3d8b
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a33b-1a3a570629cb
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-545a-1850907dfd00
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-f2c9-a1f1780dd1ee
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-82bb-f44d3bf6d93b
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1f84-3ece1d7b79aa
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-2c5c-38178f386a70
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-63e5-a6ec80851273
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-c1e3-0a85d098476e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-86f3-cd783d92ecc6
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-fdfa-34ffdb664d7c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-10a1-adbdaa4a72f1
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1015-096161953632
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8600-f18e43c0a118
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a8e8-35ed986d8de6
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-bb98-8b810015fe5f
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e1cb-d2ce27e94074
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-76cd-2f99a04ed663
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-20a7-04eb8167809c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-51f3-1f0757476e86
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-bb44-0f66c12fdf63
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-4d53-6abb37c0668e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-eaed-b6efd3de0036
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-cef7-425d67e9d399
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-f44e-e5dd114d7f85
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-df5d-da361c313609
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-53a2-8b559387d095
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-02c0-480dc880d43f
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ed20-c7bf290091a4
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a143-d247dfe7e331
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a901-c4c6b735dbb2
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8a9d-34bf730a24f3
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-f958-1ca56ab06e69
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e219-3b03a6e34f1e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-3e90-ffe0b0dadcbd
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-f02a-595f632fccde
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-0f51-0653d5d6a301
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1fc4-7322b5544118
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-195d-ea2ccc41f918
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ea7d-85c6fa756618
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-eb99-27042401ad69
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-604e-1ea0fc7763d9
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-db92-17a880c18c59
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-630d-a9553648e72f
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-5e03-5dd14ff4af81
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8e83-2c831ec777dd
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-b69d-27643af1474a
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-50d1-06c9ecefb809
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-983d-8d355a93b5be
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e619-3de4f3f97a33
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e59f-551582c34927
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-9e21-60875e73d4ef
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-623e-708bafaf690a
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-9200-ce0b2a1b3922
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-a94f-e9f10e933a5d
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-eeee-fe2920a9459f
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-6ef4-3833a9ad8b8e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-0712-4458bc2d4498
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-0a11-02089c3c6a81
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-5119-f2b47e85dbdd
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-53a1-8be13ef59739
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-b6ff-cec24da563f9
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8a1b-12f1ae1879a1
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-bfef-225911ae8f8e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-4e04-e4083149f6d5
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-2a4e-c78cfe87b7bf
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-43de-e4c1ecc2505c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-506b-bed79686fa14
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-b55c-7b065df1efca
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-d13f-694d3615ccd8
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-158b-9bbf67696094
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-2edf-46ea9c4f2113
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-8cd9-0f343ed5d027
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1d29-eb753abcaa96
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1dec-c1bdb9ee2ba0
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-37e5-9b9adfb1317c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-74b2-fa1a26d34fd2
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ec2a-36fb8c9f5dae
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-ec28-a1c099d7f258
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e329-5e27fb9ac9e5
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-65cf-857e84cde045
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-3f88-7f5a9bf44be4
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-0290-ef65bc31299e
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-c3a6-7f6bf5072d7a
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-160b-a88614133bfc
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-81f5-571aca5edb97
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-1f2f-c87dd7efe98c
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-fe6e-2d51c15bf923
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-e1ab-0f95a3f62bed
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-34ed-36ebef6e4d56
00020000-5590-f59c-d619-591cc8f18334	00030000-5590-f59a-baa0-02b7ad095730
\.


--
-- TOC entry 2875 (class 0 OID 8346238)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8346269)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8346401)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5590-f59c-2181-6fcfe1c8d9b3	00090000-5590-f59c-2e8b-0fc901d3c992	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8346003)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5590-f59b-d0b5-5dc9e2de3ba2	00040000-5590-f599-1013-16be5c589922	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-f59b-3891-37a50480a347	00040000-5590-f599-1013-16be5c589922	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-f59b-17be-507105ab42f7	00040000-5590-f599-1013-16be5c589922	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-f59b-78fe-f499899eda4a	00040000-5590-f599-1013-16be5c589922	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-f59b-8a0b-db273388f8a3	00040000-5590-f599-1013-16be5c589922	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-f59c-e407-4b2fb3a0757f	00040000-5590-f59a-3161-1fe0f2dbbe00	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8346038)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5590-f59a-a9dc-d37a9c8a1ac2	8341	Adlešiči
00050000-5590-f59a-8b60-0cec74ff35bd	5270	Ajdovščina
00050000-5590-f59a-93a3-4cbb3c842d01	6280	Ankaran/Ancarano
00050000-5590-f59a-3c22-a387f4cf3f97	9253	Apače
00050000-5590-f59a-2b07-d2b321e4eb5b	8253	Artiče
00050000-5590-f59a-f309-df8de6045486	4275	Begunje na Gorenjskem
00050000-5590-f59a-e823-4861c4fa548c	1382	Begunje pri Cerknici
00050000-5590-f59a-8f34-2e3bd4b368bc	9231	Beltinci
00050000-5590-f59a-b35f-c9a4b3d552e9	2234	Benedikt
00050000-5590-f59a-cc32-53a04f54ba57	2345	Bistrica ob Dravi
00050000-5590-f59a-a22d-3f6460a52d53	3256	Bistrica ob Sotli
00050000-5590-f59a-3fe5-acd6124d9e49	8259	Bizeljsko
00050000-5590-f59a-f635-c20f8529cd68	1223	Blagovica
00050000-5590-f59a-ad05-3d57e86f79e7	8283	Blanca
00050000-5590-f59a-173b-85a46c804c55	4260	Bled
00050000-5590-f59a-7722-56eb82801cba	4273	Blejska Dobrava
00050000-5590-f59a-0128-aef791766424	9265	Bodonci
00050000-5590-f59a-6124-91d0bf09e5a8	9222	Bogojina
00050000-5590-f59a-0bf1-23ffe51b0a9f	4263	Bohinjska Bela
00050000-5590-f59a-0dad-139d4f0ed245	4264	Bohinjska Bistrica
00050000-5590-f59a-3187-92c74bdaadb5	4265	Bohinjsko jezero
00050000-5590-f59a-7e7d-6952c469c97d	1353	Borovnica
00050000-5590-f59a-e996-cc80d501caed	8294	Boštanj
00050000-5590-f59a-bf89-56a6a2bbad3a	5230	Bovec
00050000-5590-f59a-117f-51dd061611b3	5295	Branik
00050000-5590-f59a-1e5e-33304012c794	3314	Braslovče
00050000-5590-f59a-193b-5f81fbdc3ea0	5223	Breginj
00050000-5590-f59a-025a-7d02fa23dd27	8280	Brestanica
00050000-5590-f59a-94a0-e57e56482228	2354	Bresternica
00050000-5590-f59a-4e3a-3aeb710e56d0	4243	Brezje
00050000-5590-f59a-7119-3f337e4cebd6	1351	Brezovica pri Ljubljani
00050000-5590-f59a-1450-b4c45c0f668c	8250	Brežice
00050000-5590-f59a-1f3d-c59d88fe8a16	4210	Brnik - Aerodrom
00050000-5590-f59a-46fc-25b6ead7a1f5	8321	Brusnice
00050000-5590-f59a-12d0-4c85e3172d70	3255	Buče
00050000-5590-f59a-0a3a-4b4d48cc66e4	8276	Bučka 
00050000-5590-f59a-80f7-45821c63431b	9261	Cankova
00050000-5590-f59a-1487-c831857ddb80	3000	Celje 
00050000-5590-f59a-19ab-e5a5eeeaaced	3001	Celje - poštni predali
00050000-5590-f59a-fb5b-f4efd1d1c062	4207	Cerklje na Gorenjskem
00050000-5590-f59a-0d1b-d63efebbaac7	8263	Cerklje ob Krki
00050000-5590-f59a-e13a-9c892313954c	1380	Cerknica
00050000-5590-f59a-8690-51132cc983de	5282	Cerkno
00050000-5590-f59a-f03a-a062619a500c	2236	Cerkvenjak
00050000-5590-f59a-3590-bb1ae36cee99	2215	Ceršak
00050000-5590-f59a-78ec-24fbea7c126a	2326	Cirkovce
00050000-5590-f59a-284a-ed6f104567e6	2282	Cirkulane
00050000-5590-f59a-03a4-6aab086ccd40	5273	Col
00050000-5590-f59a-70a6-c94e5d8ea718	8251	Čatež ob Savi
00050000-5590-f59a-aadd-8b25d1411b0a	1413	Čemšenik
00050000-5590-f59a-881e-3214e3b7e3aa	5253	Čepovan
00050000-5590-f59a-644a-44bcbef99841	9232	Črenšovci
00050000-5590-f59a-9d17-45897a18a575	2393	Črna na Koroškem
00050000-5590-f59a-14cc-c8bbe64d1f29	6275	Črni Kal
00050000-5590-f59a-e85c-065e446bb2f0	5274	Črni Vrh nad Idrijo
00050000-5590-f59a-47de-66e7e6985012	5262	Črniče
00050000-5590-f59a-c352-e082c0d6d499	8340	Črnomelj
00050000-5590-f59a-60fe-d3584b4dc52b	6271	Dekani
00050000-5590-f59a-afe2-c26861207975	5210	Deskle
00050000-5590-f59a-e096-c5b53374af15	2253	Destrnik
00050000-5590-f59a-6b85-d43fc0341c36	6215	Divača
00050000-5590-f59a-6f3f-d957b06dfe98	1233	Dob
00050000-5590-f59a-2351-4469a2f99b40	3224	Dobje pri Planini
00050000-5590-f59a-19af-0f398ab36d72	8257	Dobova
00050000-5590-f59a-ccfb-206af6ce36a5	1423	Dobovec
00050000-5590-f59a-9f50-acbb6f563ecd	5263	Dobravlje
00050000-5590-f59a-369d-d86e00245e1f	3204	Dobrna
00050000-5590-f59a-277f-b5d0b936f80e	8211	Dobrnič
00050000-5590-f59a-9b16-8334a431fd62	1356	Dobrova
00050000-5590-f59a-04a8-b49fd293f08e	9223	Dobrovnik/Dobronak 
00050000-5590-f59a-fb13-62368dcd5421	5212	Dobrovo v Brdih
00050000-5590-f59a-c3c8-fd5ffb1a3cc5	1431	Dol pri Hrastniku
00050000-5590-f59a-9b55-29b4b8169f67	1262	Dol pri Ljubljani
00050000-5590-f59a-6e8f-593d9f065bfd	1273	Dole pri Litiji
00050000-5590-f59a-e3fc-cb86a1124031	1331	Dolenja vas
00050000-5590-f59a-a0d2-6bef670e7fbd	8350	Dolenjske Toplice
00050000-5590-f59a-9ef3-84824f1ac6fa	1230	Domžale
00050000-5590-f59a-95f6-85627319f03f	2252	Dornava
00050000-5590-f59a-a845-f2bbc7958e77	5294	Dornberk
00050000-5590-f59a-b118-9bc0f81ce2ce	1319	Draga
00050000-5590-f59a-bb35-c3f06fd7ac3f	8343	Dragatuš
00050000-5590-f59a-65da-9dc6d6a126d8	3222	Dramlje
00050000-5590-f59a-8052-dc32d440742b	2370	Dravograd
00050000-5590-f59a-aac9-5d653b144809	4203	Duplje
00050000-5590-f59a-9a22-3d057e26ef04	6221	Dutovlje
00050000-5590-f59a-f140-8ae4ea644ba7	8361	Dvor
00050000-5590-f59a-8e15-1ca5a2f6901e	2343	Fala
00050000-5590-f59a-45a9-40661be56572	9208	Fokovci
00050000-5590-f59a-6408-8a2ac4eb7766	2313	Fram
00050000-5590-f59a-b0ee-0f89c36a4e15	3213	Frankolovo
00050000-5590-f59a-40f7-4073ef774be7	1274	Gabrovka
00050000-5590-f59a-240c-1e0c5c9377bf	8254	Globoko
00050000-5590-f59a-8c3c-f36ed2373cf6	5275	Godovič
00050000-5590-f59a-de16-e07a71532042	4204	Golnik
00050000-5590-f59a-12b5-8513c84a8fa1	3303	Gomilsko
00050000-5590-f59a-d677-4142e4501360	4224	Gorenja vas
00050000-5590-f59a-2d21-2e47927bc2a2	3263	Gorica pri Slivnici
00050000-5590-f59a-b62a-b0908557acf4	2272	Gorišnica
00050000-5590-f59a-6938-0eb19c6c89f5	9250	Gornja Radgona
00050000-5590-f59a-c33e-b9877b50ae0f	3342	Gornji Grad
00050000-5590-f59a-fcf2-e499438c3080	4282	Gozd Martuljek
00050000-5590-f59a-451d-4d5bbb252b63	6272	Gračišče
00050000-5590-f59a-6f1b-bf5228755662	9264	Grad
00050000-5590-f59a-3bbc-6b38d1a57039	8332	Gradac
00050000-5590-f59a-85b2-9b4b908c2bee	1384	Grahovo
00050000-5590-f59a-2340-0af22f46df14	5242	Grahovo ob Bači
00050000-5590-f59a-cc43-60b82ea89fd3	5251	Grgar
00050000-5590-f59a-9d3a-7410ea6b3bc8	3302	Griže
00050000-5590-f59a-c465-de0bad81da24	3231	Grobelno
00050000-5590-f59a-9549-8bbdf8c9c640	1290	Grosuplje
00050000-5590-f59a-c677-ad1f936f2088	2288	Hajdina
00050000-5590-f59a-686b-6cd18d004c60	8362	Hinje
00050000-5590-f59a-7a7d-3326caa7bcef	2311	Hoče
00050000-5590-f59a-9a4e-5c9ff8943111	9205	Hodoš/Hodos
00050000-5590-f59a-21c1-2afc00ccf135	1354	Horjul
00050000-5590-f59a-3e30-9aa883259390	1372	Hotedršica
00050000-5590-f59a-e8f0-fc476b167420	1430	Hrastnik
00050000-5590-f59a-985d-cdd3f9f843c4	6225	Hruševje
00050000-5590-f59a-59bc-be863dba59e7	4276	Hrušica
00050000-5590-f59a-3005-49bb9ba84a0e	5280	Idrija
00050000-5590-f59a-b12d-0216b7f4aaa1	1292	Ig
00050000-5590-f59a-6d87-53558ff73931	6250	Ilirska Bistrica
00050000-5590-f59a-4673-107e85fbd4df	6251	Ilirska Bistrica-Trnovo
00050000-5590-f59a-95dc-6cd7e3fe015f	1295	Ivančna Gorica
00050000-5590-f59a-ca13-c0b2ae17e141	2259	Ivanjkovci
00050000-5590-f59a-1c7e-d76cf88057d7	1411	Izlake
00050000-5590-f59a-b68e-0bcb475bb677	6310	Izola/Isola
00050000-5590-f59a-1ad1-accc55ea5745	2222	Jakobski Dol
00050000-5590-f59a-95ac-ef479ecb4aa1	2221	Jarenina
00050000-5590-f59a-82b2-82a0e31eb84e	6254	Jelšane
00050000-5590-f59a-1926-218d82f35657	4270	Jesenice
00050000-5590-f59a-13f8-6272dd0fb0ce	8261	Jesenice na Dolenjskem
00050000-5590-f59a-f861-f781f3ff37cf	3273	Jurklošter
00050000-5590-f59a-d178-c9d11dd6bd3e	2223	Jurovski Dol
00050000-5590-f59a-e710-4ce56a6ab9db	2256	Juršinci
00050000-5590-f59a-b9bc-2b1065ef0426	5214	Kal nad Kanalom
00050000-5590-f59a-c471-045f3f0fffd0	3233	Kalobje
00050000-5590-f59a-cce8-6ccd53b0a767	4246	Kamna Gorica
00050000-5590-f59a-5935-7a85d8d613ea	2351	Kamnica
00050000-5590-f59a-bac9-e36f89d3a765	1241	Kamnik
00050000-5590-f59a-62c8-5005a39599d7	5213	Kanal
00050000-5590-f59a-5bc4-660019d2d0be	8258	Kapele
00050000-5590-f59a-4887-fe4a84bd0570	2362	Kapla
00050000-5590-f59a-ab8e-11b83adb13ab	2325	Kidričevo
00050000-5590-f59a-4ad0-e768392ce666	1412	Kisovec
00050000-5590-f59a-30c0-873f7c3e7b5e	6253	Knežak
00050000-5590-f59a-5e4d-f5ce40e6a313	5222	Kobarid
00050000-5590-f59a-c9cf-e7016da1157e	9227	Kobilje
00050000-5590-f59a-8b9f-5e2ba0867e93	1330	Kočevje
00050000-5590-f59a-3e5f-186aee61b3d3	1338	Kočevska Reka
00050000-5590-f59a-3735-7924265ff1b5	2276	Kog
00050000-5590-f59a-fc8f-1c00b282ca7f	5211	Kojsko
00050000-5590-f59a-76d8-1ddca66ff972	6223	Komen
00050000-5590-f59a-bc57-ac112d01e307	1218	Komenda
00050000-5590-f59a-14e2-4231e47671b0	6000	Koper/Capodistria 
00050000-5590-f59a-1e11-6fe79a209249	6001	Koper/Capodistria - poštni predali
00050000-5590-f59a-02b3-2f343f3d226b	8282	Koprivnica
00050000-5590-f59a-8e83-a360b780131c	5296	Kostanjevica na Krasu
00050000-5590-f59a-130f-3081f713fc12	8311	Kostanjevica na Krki
00050000-5590-f59a-66ff-4756ba65aef7	1336	Kostel
00050000-5590-f59a-7860-8c49d6a5b46f	6256	Košana
00050000-5590-f59a-42d6-4a0e47c00154	2394	Kotlje
00050000-5590-f59a-6920-e132192ff1eb	6240	Kozina
00050000-5590-f59a-9c73-eb0005396522	3260	Kozje
00050000-5590-f59a-22aa-9171775f2668	4000	Kranj 
00050000-5590-f59a-68dc-b172fdbcbb88	4001	Kranj - poštni predali
00050000-5590-f59a-3b7c-0ae92024c69a	4280	Kranjska Gora
00050000-5590-f59a-64fa-bfd2a958caff	1281	Kresnice
00050000-5590-f59a-4618-d26698f3fb11	4294	Križe
00050000-5590-f59a-1867-10e1eb1df1a2	9206	Križevci
00050000-5590-f59a-2ef0-b469a15f931a	9242	Križevci pri Ljutomeru
00050000-5590-f59a-e032-46eb13e3a789	1301	Krka
00050000-5590-f59a-575f-b0dd23b13382	8296	Krmelj
00050000-5590-f59a-79a3-72ad733a72e7	4245	Kropa
00050000-5590-f59a-a4bd-e0637284491a	8262	Krška vas
00050000-5590-f59a-2e38-68034984193a	8270	Krško
00050000-5590-f59a-5f23-1f78e05bf0f3	9263	Kuzma
00050000-5590-f59a-9334-eff1d1bb31f1	2318	Laporje
00050000-5590-f59a-77b6-59a6b9a62e44	3270	Laško
00050000-5590-f59a-6bc2-7819a9f849de	1219	Laze v Tuhinju
00050000-5590-f59a-dd6b-aabb191d366f	2230	Lenart v Slovenskih goricah
00050000-5590-f59a-e733-5b919b24c102	9220	Lendava/Lendva
00050000-5590-f59a-a647-e008e10c62ee	4248	Lesce
00050000-5590-f59a-3e17-f72798bdcb0a	3261	Lesično
00050000-5590-f59a-aebd-ef0786e2ea30	8273	Leskovec pri Krškem
00050000-5590-f59a-000d-b1c7c45568b2	2372	Libeliče
00050000-5590-f59a-4405-303b859cda24	2341	Limbuš
00050000-5590-f59a-a2de-3baec3765bc9	1270	Litija
00050000-5590-f59a-d56a-7a9d6a55a017	3202	Ljubečna
00050000-5590-f59a-4877-fbf0dfd98737	1000	Ljubljana 
00050000-5590-f59a-954f-7af9271434e7	1001	Ljubljana - poštni predali
00050000-5590-f59a-33e2-0bf7d6704f13	1231	Ljubljana - Črnuče
00050000-5590-f59a-c0b0-4c91f7da0065	1261	Ljubljana - Dobrunje
00050000-5590-f59a-52f9-ffac4602f980	1260	Ljubljana - Polje
00050000-5590-f59a-29d6-f267e2b0f385	1210	Ljubljana - Šentvid
00050000-5590-f59a-f1a3-4f4776602017	1211	Ljubljana - Šmartno
00050000-5590-f59a-5081-acfe235f2041	3333	Ljubno ob Savinji
00050000-5590-f59a-f0a3-67ed6e939d29	9240	Ljutomer
00050000-5590-f59a-98c1-46c82488229a	3215	Loče
00050000-5590-f59a-cac6-58980aca9ab3	5231	Log pod Mangartom
00050000-5590-f59a-77e7-345357a6a254	1358	Log pri Brezovici
00050000-5590-f59a-7c9c-6cc7544751c9	1370	Logatec
00050000-5590-f59a-92a4-5310aaabd18b	1371	Logatec
00050000-5590-f59a-9ab9-8693f669e5e8	1434	Loka pri Zidanem Mostu
00050000-5590-f59a-c936-341cda382ecd	3223	Loka pri Žusmu
00050000-5590-f59a-6ada-149f03261b19	6219	Lokev
00050000-5590-f59a-bffe-42fc069a4522	1318	Loški Potok
00050000-5590-f59a-b59d-2d7335fcd24c	2324	Lovrenc na Dravskem polju
00050000-5590-f59a-b0cc-938156ff5006	2344	Lovrenc na Pohorju
00050000-5590-f59a-2ef2-b31aafa9cf3c	3334	Luče
00050000-5590-f59a-33bf-1c843f61de12	1225	Lukovica
00050000-5590-f59a-ddcc-bf3ad1fe8322	9202	Mačkovci
00050000-5590-f59a-7ac7-3bcccd3ca535	2322	Majšperk
00050000-5590-f59a-c31c-03f0780bc5ec	2321	Makole
00050000-5590-f59a-df62-8e5c92203024	9243	Mala Nedelja
00050000-5590-f59a-7923-8f86eeb3de32	2229	Malečnik
00050000-5590-f59a-e780-f11a7d0b29db	6273	Marezige
00050000-5590-f59a-be93-827d48244b5a	2000	Maribor 
00050000-5590-f59a-5c88-fc951c060bec	2001	Maribor - poštni predali
00050000-5590-f59a-aac6-3a501cc31f82	2206	Marjeta na Dravskem polju
00050000-5590-f59a-06ab-8c31279685e3	2281	Markovci
00050000-5590-f59a-088e-474581c4afc6	9221	Martjanci
00050000-5590-f59a-8233-96e5bdb05b19	6242	Materija
00050000-5590-f59a-e551-99306c87f2a1	4211	Mavčiče
00050000-5590-f59a-29b6-92a588dc85e2	1215	Medvode
00050000-5590-f59a-626d-284f06597a3c	1234	Mengeš
00050000-5590-f59a-6596-a6037c344e11	8330	Metlika
00050000-5590-f59a-a821-0eac17012778	2392	Mežica
00050000-5590-f59a-a80a-4b1fa01061be	2204	Miklavž na Dravskem polju
00050000-5590-f59a-e7f8-19bc0392330c	2275	Miklavž pri Ormožu
00050000-5590-f59a-596a-924569e009c5	5291	Miren
00050000-5590-f59a-13d2-7189d238905c	8233	Mirna
00050000-5590-f59a-c7f6-3a2a389814c5	8216	Mirna Peč
00050000-5590-f59a-e8e5-51e696c9d1a5	2382	Mislinja
00050000-5590-f59a-2c10-99c3ea83be5f	4281	Mojstrana
00050000-5590-f59a-1cbe-2c2f322b07fb	8230	Mokronog
00050000-5590-f59a-bd9b-793896829aee	1251	Moravče
00050000-5590-f59a-7cd1-85a8ae8b2929	9226	Moravske Toplice
00050000-5590-f59a-031c-1bab189a67a3	5216	Most na Soči
00050000-5590-f59a-a678-927d0b002d92	1221	Motnik
00050000-5590-f59a-0647-8c5c3c755aac	3330	Mozirje
00050000-5590-f59a-572a-a794e1e5f5e5	9000	Murska Sobota 
00050000-5590-f59a-c9a9-c56791cc59ca	9001	Murska Sobota - poštni predali
00050000-5590-f59a-9936-5cc9d1b4a48f	2366	Muta
00050000-5590-f59a-6301-589dda248b68	4202	Naklo
00050000-5590-f59a-aae3-e73d74a40e84	3331	Nazarje
00050000-5590-f59a-6f3f-8754264be464	1357	Notranje Gorice
00050000-5590-f59a-3724-d589bb400e98	3203	Nova Cerkev
00050000-5590-f59a-f1d9-65054ee46faf	5000	Nova Gorica 
00050000-5590-f59a-6d47-27708515bdc5	5001	Nova Gorica - poštni predali
00050000-5590-f59a-33af-3986bf161e15	1385	Nova vas
00050000-5590-f59a-fa04-319089407b15	8000	Novo mesto
00050000-5590-f59a-20f0-7b512183e8e9	8001	Novo mesto - poštni predali
00050000-5590-f59a-9250-8a392c97a448	6243	Obrov
00050000-5590-f59a-3f14-ff582a22d4c0	9233	Odranci
00050000-5590-f59a-80c9-a9bd341f4ad9	2317	Oplotnica
00050000-5590-f59a-7950-b092ab63e099	2312	Orehova vas
00050000-5590-f59a-7ca9-1c51b1989a7b	2270	Ormož
00050000-5590-f59a-2b42-8277fdda01fd	1316	Ortnek
00050000-5590-f59a-f5d2-df425dfcf214	1337	Osilnica
00050000-5590-f59a-1cdd-38e474f0c295	8222	Otočec
00050000-5590-f59a-a3c0-8956c86ff37e	2361	Ožbalt
00050000-5590-f59a-fdcf-e8ec38d05c77	2231	Pernica
00050000-5590-f59a-66a3-5c2372362467	2211	Pesnica pri Mariboru
00050000-5590-f59a-b3dc-9bb394004668	9203	Petrovci
00050000-5590-f59a-8605-d1b8fa0cb511	3301	Petrovče
00050000-5590-f59a-2d4f-8e739d14dab1	6330	Piran/Pirano
00050000-5590-f59a-7f79-8b22c5fe103d	8255	Pišece
00050000-5590-f59a-7751-02833bf90396	6257	Pivka
00050000-5590-f59a-05e4-cb34d3171198	6232	Planina
00050000-5590-f59a-b477-4d84613b9429	3225	Planina pri Sevnici
00050000-5590-f59a-2ec1-495aa9e9281d	6276	Pobegi
00050000-5590-f59a-64bd-bd04c83af2e6	8312	Podbočje
00050000-5590-f59a-b42f-5813a8356286	5243	Podbrdo
00050000-5590-f59a-9661-e8b19fd87dd4	3254	Podčetrtek
00050000-5590-f59a-f93c-ecf774a2e31a	2273	Podgorci
00050000-5590-f59a-7fb4-be1d6e246e09	6216	Podgorje
00050000-5590-f59a-f7d4-811b0e2d593d	2381	Podgorje pri Slovenj Gradcu
00050000-5590-f59a-ed0f-591b964368bb	6244	Podgrad
00050000-5590-f59a-0473-e897f30f2243	1414	Podkum
00050000-5590-f59a-365d-ca9e992e0b6f	2286	Podlehnik
00050000-5590-f59a-3784-fd0c5791aad8	5272	Podnanos
00050000-5590-f59a-77c1-4e9e09069a9f	4244	Podnart
00050000-5590-f59a-f78b-48247d8f837c	3241	Podplat
00050000-5590-f59a-25d8-d6677cdaec11	3257	Podsreda
00050000-5590-f59a-e035-f23ec70efa98	2363	Podvelka
00050000-5590-f59a-6fb6-6ff96d7de3aa	2208	Pohorje
00050000-5590-f59a-a5c2-d203b9130ceb	2257	Polenšak
00050000-5590-f59a-8130-131f6528c3f1	1355	Polhov Gradec
00050000-5590-f59a-64e2-7d5312b3522f	4223	Poljane nad Škofjo Loko
00050000-5590-f59a-6b70-89c3b1623eaa	2319	Poljčane
00050000-5590-f59a-e962-8c80ba66f10b	1272	Polšnik
00050000-5590-f59a-d01a-f52bac5b3e24	3313	Polzela
00050000-5590-f59a-3c81-184d71b12b85	3232	Ponikva
00050000-5590-f59a-522b-7e80f483f7ef	6320	Portorož/Portorose
00050000-5590-f59a-49d3-589a661fc9cc	6230	Postojna
00050000-5590-f59a-8adb-836b8d56003b	2331	Pragersko
00050000-5590-f59a-82cb-78bafecedca9	3312	Prebold
00050000-5590-f59a-3ecc-50d61b0b35fa	4205	Preddvor
00050000-5590-f59a-0d19-55df0b025475	6255	Prem
00050000-5590-f59a-c9f8-de0b88972819	1352	Preserje
00050000-5590-f59a-e969-5831fe07705a	6258	Prestranek
00050000-5590-f59a-801f-21a8b3317462	2391	Prevalje
00050000-5590-f59a-67a8-2f00bec9baa5	3262	Prevorje
00050000-5590-f59a-6459-1dd118d90c1d	1276	Primskovo 
00050000-5590-f59a-f413-3010cd116905	3253	Pristava pri Mestinju
00050000-5590-f59a-eef5-97d6e966e1fd	9207	Prosenjakovci/Partosfalva
00050000-5590-f59a-5ab3-4996e990cd8a	5297	Prvačina
00050000-5590-f59a-e533-e9b1e97d0e00	2250	Ptuj
00050000-5590-f59a-b918-7b59283028d9	2323	Ptujska Gora
00050000-5590-f59a-73d9-4bd27bcfbdbf	9201	Puconci
00050000-5590-f59a-66f4-a4afe66eb81a	2327	Rače
00050000-5590-f59a-0fbb-3634c8c19c93	1433	Radeče
00050000-5590-f59a-5343-4eec7bf477f9	9252	Radenci
00050000-5590-f59a-f399-2bbc5b484d5e	2360	Radlje ob Dravi
00050000-5590-f59a-1e8c-61761e030f28	1235	Radomlje
00050000-5590-f59a-99d9-ddedba015531	4240	Radovljica
00050000-5590-f59a-315a-ffd0ba01d63a	8274	Raka
00050000-5590-f59a-2d3d-e8860db3ec50	1381	Rakek
00050000-5590-f59a-5e1e-269286303aa5	4283	Rateče - Planica
00050000-5590-f59a-98f9-61c6b1d8f243	2390	Ravne na Koroškem
00050000-5590-f59a-02dc-0c49d9864e21	9246	Razkrižje
00050000-5590-f59a-b062-86d53a6ea56e	3332	Rečica ob Savinji
00050000-5590-f59a-196a-3d97618ff37c	5292	Renče
00050000-5590-f59a-be09-fcb46f3edc20	1310	Ribnica
00050000-5590-f59a-4b75-c1546b85c5da	2364	Ribnica na Pohorju
00050000-5590-f59a-95f4-79af2e9034d6	3272	Rimske Toplice
00050000-5590-f59a-ff6b-d8744c687e02	1314	Rob
00050000-5590-f59a-fe59-5be1b7ca0ae8	5215	Ročinj
00050000-5590-f59a-ac81-10fdedf4eb76	3250	Rogaška Slatina
00050000-5590-f59a-799e-6466d95518ac	9262	Rogašovci
00050000-5590-f59a-d414-fb9305ad7486	3252	Rogatec
00050000-5590-f59a-c3d1-b7c93142623d	1373	Rovte
00050000-5590-f59a-a71a-786b11f48951	2342	Ruše
00050000-5590-f59a-929b-1f1703246972	1282	Sava
00050000-5590-f59a-447b-e6e9c35c9c34	6333	Sečovlje/Sicciole
00050000-5590-f59a-11e4-574a36f40392	4227	Selca
00050000-5590-f59a-e796-5202dd574db6	2352	Selnica ob Dravi
00050000-5590-f59a-9316-9ca92561a406	8333	Semič
00050000-5590-f59a-a7ea-85cda6733827	8281	Senovo
00050000-5590-f59a-0970-fe40a3327704	6224	Senožeče
00050000-5590-f59a-0949-b57821e221bc	8290	Sevnica
00050000-5590-f59a-5d7b-45cbfa6264dd	6210	Sežana
00050000-5590-f59a-9ee3-e55185543a1e	2214	Sladki Vrh
00050000-5590-f59a-94f7-490672dedbc5	5283	Slap ob Idrijci
00050000-5590-f59a-0547-53a9d41d7e0a	2380	Slovenj Gradec
00050000-5590-f59a-cd21-3d08c0b36952	2310	Slovenska Bistrica
00050000-5590-f59a-9c35-a6573bf266b0	3210	Slovenske Konjice
00050000-5590-f59a-3881-68b48222e9ac	1216	Smlednik
00050000-5590-f59a-5e1e-431c48f19012	5232	Soča
00050000-5590-f59a-3de0-ab33673c061f	1317	Sodražica
00050000-5590-f59a-a034-192412f9c0bf	3335	Solčava
00050000-5590-f59a-5551-a53b995b71d6	5250	Solkan
00050000-5590-f59a-33ee-4ef56ab82e73	4229	Sorica
00050000-5590-f59a-5a6c-c86d99615ab0	4225	Sovodenj
00050000-5590-f59a-b7f1-6cd3e323bf4b	5281	Spodnja Idrija
00050000-5590-f59a-9ca7-a0adc59ceddb	2241	Spodnji Duplek
00050000-5590-f59a-1cd9-29fd48edb80c	9245	Spodnji Ivanjci
00050000-5590-f59a-3b2b-3560fb816bf5	2277	Središče ob Dravi
00050000-5590-f59a-a065-d375045dc759	4267	Srednja vas v Bohinju
00050000-5590-f59a-6ddd-7daec61cab94	8256	Sromlje 
00050000-5590-f59a-e375-383131f5682d	5224	Srpenica
00050000-5590-f59a-1767-3898e205eba4	1242	Stahovica
00050000-5590-f59a-5081-213610a97cc8	1332	Stara Cerkev
00050000-5590-f59a-3cc1-917bb1122f05	8342	Stari trg ob Kolpi
00050000-5590-f59a-089a-3dbc0b30ec55	1386	Stari trg pri Ložu
00050000-5590-f59a-36ef-6740a01022d9	2205	Starše
00050000-5590-f59a-7194-595ab12ca55b	2289	Stoperce
00050000-5590-f59a-0318-b72550719afd	8322	Stopiče
00050000-5590-f59a-3a26-5e959778251b	3206	Stranice
00050000-5590-f59a-8ebe-714156c71db1	8351	Straža
00050000-5590-f59a-4ab1-5f4edc5391dd	1313	Struge
00050000-5590-f59a-f022-2d6419d903b9	8293	Studenec
00050000-5590-f59a-38c9-bc7c8b2debee	8331	Suhor
00050000-5590-f59a-de12-54d0372460a2	2233	Sv. Ana v Slovenskih goricah
00050000-5590-f59a-2d04-26a9dfa51d95	2235	Sv. Trojica v Slovenskih goricah
00050000-5590-f59a-d6d4-0473199d6d74	2353	Sveti Duh na Ostrem Vrhu
00050000-5590-f59a-0d72-d151d5c0c469	9244	Sveti Jurij ob Ščavnici
00050000-5590-f59a-20e3-84ef5795f26d	3264	Sveti Štefan
00050000-5590-f59a-9972-db5231d4b52d	2258	Sveti Tomaž
00050000-5590-f59a-e157-23968dd6d34a	9204	Šalovci
00050000-5590-f59a-aae7-770e316dd9ce	5261	Šempas
00050000-5590-f59a-dcb7-f790f64a01f5	5290	Šempeter pri Gorici
00050000-5590-f59a-d487-0e56de836d96	3311	Šempeter v Savinjski dolini
00050000-5590-f59a-beb8-db9410887347	4208	Šenčur
00050000-5590-f59a-7947-bd516a3a28a0	2212	Šentilj v Slovenskih goricah
00050000-5590-f59a-8190-4b3ad82ceb84	8297	Šentjanž
00050000-5590-f59a-471e-42ffacd282eb	2373	Šentjanž pri Dravogradu
00050000-5590-f59a-681a-d161b5c77047	8310	Šentjernej
00050000-5590-f59a-5e0e-1a32835c737c	3230	Šentjur
00050000-5590-f59a-83d1-49af36ca5969	3271	Šentrupert
00050000-5590-f59a-afd5-2776138875c8	8232	Šentrupert
00050000-5590-f59a-65b6-779833ef336f	1296	Šentvid pri Stični
00050000-5590-f59a-45e6-3beeba41ac7b	8275	Škocjan
00050000-5590-f59a-2b4e-a56b0d05ba4d	6281	Škofije
00050000-5590-f59a-4f3e-226748135558	4220	Škofja Loka
00050000-5590-f59a-d4e2-2219e792fb65	3211	Škofja vas
00050000-5590-f59a-ce93-7cc3ec47c246	1291	Škofljica
00050000-5590-f59a-46f3-022d2f810fe6	6274	Šmarje
00050000-5590-f59a-0208-9d68b9492120	1293	Šmarje - Sap
00050000-5590-f59a-cf97-8f05c8657b5e	3240	Šmarje pri Jelšah
00050000-5590-f59a-8a70-f5391fc29650	8220	Šmarješke Toplice
00050000-5590-f59a-63b1-6ea61491b680	2315	Šmartno na Pohorju
00050000-5590-f59a-d47c-6f813343638f	3341	Šmartno ob Dreti
00050000-5590-f59a-7a9d-d04e77b00c12	3327	Šmartno ob Paki
00050000-5590-f59a-34a7-c710e53fd00e	1275	Šmartno pri Litiji
00050000-5590-f59a-644b-10f92d6e127e	2383	Šmartno pri Slovenj Gradcu
00050000-5590-f59a-5600-3829ccc3ea57	3201	Šmartno v Rožni dolini
00050000-5590-f59a-376a-1e7b49e94d82	3325	Šoštanj
00050000-5590-f59a-fac3-7d7351f84a35	6222	Štanjel
00050000-5590-f59a-8704-301d05eac43b	3220	Štore
00050000-5590-f59a-e9fc-53c0b080ecdf	3304	Tabor
00050000-5590-f59a-7271-d1624e51cb83	3221	Teharje
00050000-5590-f59a-eeb3-91098ac7fa96	9251	Tišina
00050000-5590-f59a-1236-b3449a5d39e2	5220	Tolmin
00050000-5590-f59a-929a-6815b8871dd0	3326	Topolšica
00050000-5590-f59a-2dc1-2f8207bac43d	2371	Trbonje
00050000-5590-f59a-460e-bb6476dec8eb	1420	Trbovlje
00050000-5590-f59a-6053-a5a054b7cc5d	8231	Trebelno 
00050000-5590-f59a-c8c9-f3c6cd74c298	8210	Trebnje
00050000-5590-f59a-0bd3-5c49fbf3c54e	5252	Trnovo pri Gorici
00050000-5590-f59a-d570-5c0b2a6bb885	2254	Trnovska vas
00050000-5590-f59a-6c30-5f3e69a31112	1222	Trojane
00050000-5590-f59a-af9f-0cfa808bcf47	1236	Trzin
00050000-5590-f59a-4aa7-1759df825cb6	4290	Tržič
00050000-5590-f59a-a274-a6dd56f5ea7b	8295	Tržišče
00050000-5590-f59a-be0a-1b271e0b4237	1311	Turjak
00050000-5590-f59a-9f93-d84142804ccc	9224	Turnišče
00050000-5590-f59a-5263-42fd743e39c1	8323	Uršna sela
00050000-5590-f59a-c168-ee64a34713c7	1252	Vače
00050000-5590-f59a-bf12-e943364474eb	3320	Velenje 
00050000-5590-f59a-7397-7039bb4be316	3322	Velenje - poštni predali
00050000-5590-f59a-bf6a-39ee35d17faf	8212	Velika Loka
00050000-5590-f59a-2c8b-6fd2b520466d	2274	Velika Nedelja
00050000-5590-f59a-e8cc-130f8498ce7a	9225	Velika Polana
00050000-5590-f59a-b78a-40f1a4653d27	1315	Velike Lašče
00050000-5590-f59a-49b1-5ac6d1165508	8213	Veliki Gaber
00050000-5590-f59a-65b4-3656f36ae2e7	9241	Veržej
00050000-5590-f59a-7cb0-23252d1c77e2	1312	Videm - Dobrepolje
00050000-5590-f59a-7170-0b29baeb71c4	2284	Videm pri Ptuju
00050000-5590-f59a-b993-a076f98f8c76	8344	Vinica
00050000-5590-f59a-528b-0fb7cc949891	5271	Vipava
00050000-5590-f59a-a93e-91b453d21124	4212	Visoko
00050000-5590-f59a-1bd4-796dc1d2a571	1294	Višnja Gora
00050000-5590-f59a-55fa-a14e22b937ed	3205	Vitanje
00050000-5590-f59a-3e18-915658147fd3	2255	Vitomarci
00050000-5590-f59a-2ce6-fa90346b4edd	1217	Vodice
00050000-5590-f59a-83eb-740e46fe9048	3212	Vojnik\t
00050000-5590-f59a-375b-cc82b3374017	5293	Volčja Draga
00050000-5590-f59a-f0df-dc2cdebdf921	2232	Voličina
00050000-5590-f59a-3639-8c64687e2b45	3305	Vransko
00050000-5590-f59a-2b90-755c03a54534	6217	Vremski Britof
00050000-5590-f59a-a3f9-0bfc3627a531	1360	Vrhnika
00050000-5590-f59a-83de-ff86d9987cf7	2365	Vuhred
00050000-5590-f59a-77d6-cdfcb85b3f85	2367	Vuzenica
00050000-5590-f59a-8c2e-fceed523a964	8292	Zabukovje 
00050000-5590-f59a-e061-69d318df880d	1410	Zagorje ob Savi
00050000-5590-f59a-a025-3212cea373e8	1303	Zagradec
00050000-5590-f59a-d752-444893e847de	2283	Zavrč
00050000-5590-f59a-5db4-839c363ff3ba	8272	Zdole 
00050000-5590-f59a-88f5-18265dab884f	4201	Zgornja Besnica
00050000-5590-f59a-0755-0d5a05e0db01	2242	Zgornja Korena
00050000-5590-f59a-50d7-7993ae28d9e1	2201	Zgornja Kungota
00050000-5590-f59a-60f2-f8ec3ad5d50a	2316	Zgornja Ložnica
00050000-5590-f59a-49f0-60e673a7e854	2314	Zgornja Polskava
00050000-5590-f59a-ff9a-662cd4116905	2213	Zgornja Velka
00050000-5590-f59a-5118-72c5108d2806	4247	Zgornje Gorje
00050000-5590-f59a-1f79-fefd9e0a4085	4206	Zgornje Jezersko
00050000-5590-f59a-31c5-bb82f2184aee	2285	Zgornji Leskovec
00050000-5590-f59a-4da6-3f4fbbcab80b	1432	Zidani Most
00050000-5590-f59a-f956-98adfbcd6cd0	3214	Zreče
00050000-5590-f59a-7d5e-2e9b05a08789	4209	Žabnica
00050000-5590-f59a-cae2-b69ae3ed3fc6	3310	Žalec
00050000-5590-f59a-b598-4aa67f8469b1	4228	Železniki
00050000-5590-f59a-4f82-0f83a195aae2	2287	Žetale
00050000-5590-f59a-a318-260ed9481cff	4226	Žiri
00050000-5590-f59a-aa43-46e7dccdbe37	4274	Žirovnica
00050000-5590-f59a-60b2-cc31ce1a18cd	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8346212)
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
-- TOC entry 2853 (class 0 OID 8346023)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8346101)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8346224)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8346344)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8346393)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5590-f59c-4b42-0215b5446f71	00080000-5590-f59c-e407-4b2fb3a0757f	0900	AK
00190000-5590-f59c-99d8-599acddc84f6	00080000-5590-f59b-17be-507105ab42f7	0987	A
00190000-5590-f59c-d578-023e5d765898	00080000-5590-f59b-3891-37a50480a347	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8346527)
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
-- TOC entry 2877 (class 0 OID 8346253)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5590-f59b-231e-830e082fa01c	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5590-f59b-f461-06fdfddd181a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5590-f59b-8d7a-5dde26f5e762	0003	Kazinska	t	84	Kazinska dvorana
00220000-5590-f59b-569c-58bc9cb406d0	0004	Mali oder	t	24	Mali oder 
00220000-5590-f59b-18d0-0cbc7e607b0e	0005	Komorni oder	t	15	Komorni oder
00220000-5590-f59b-f58e-37720827b794	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5590-f59b-a45c-6008efa5c5b6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8346197)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8346187)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8346382)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8346321)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8345895)
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
-- TOC entry 2878 (class 0 OID 8346263)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8345933)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5590-f59a-aac4-282ea945ecdc	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5590-f59a-1e5f-016d2e43cbeb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5590-f59a-8e43-c7506e5f850f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5590-f59a-afc1-e8351e65d3f8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5590-f59a-475c-bd98d3eca009	planer	Planer dogodkov v koledarju	t
00020000-5590-f59a-3548-7ab1e7e5f7fd	kadrovska	Kadrovska služba	t
00020000-5590-f59a-8636-69ab563f7b9e	arhivar	Ažuriranje arhivalij	t
00020000-5590-f59a-fe87-d47d3e745a7a	igralec	Igralec	t
00020000-5590-f59a-3fa7-b66f12daccff	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5590-f59c-d619-591cc8f18334	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8345917)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5590-f59a-4243-7776c3ef7e49	00020000-5590-f59a-8e43-c7506e5f850f
00010000-5590-f59a-aff3-43d9309e75ab	00020000-5590-f59a-8e43-c7506e5f850f
00010000-5590-f59c-194d-591a5d2e04df	00020000-5590-f59c-d619-591cc8f18334
\.


--
-- TOC entry 2880 (class 0 OID 8346277)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8346218)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8346168)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8346571)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5590-f59a-0563-3848684e8410	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5590-f59a-5694-8add8994f58e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5590-f59a-d430-12e219c54add	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5590-f59a-0113-49f38bb3af08	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5590-f59a-49bd-f107404a55cf	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8346563)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5590-f59a-ce44-938a802020b9	00230000-5590-f59a-0113-49f38bb3af08	popa
00240000-5590-f59a-74bd-a88ebf246d34	00230000-5590-f59a-0113-49f38bb3af08	oseba
00240000-5590-f59a-c2f7-8769f2f7960e	00230000-5590-f59a-5694-8add8994f58e	prostor
00240000-5590-f59a-239b-5eab3d992f00	00230000-5590-f59a-0113-49f38bb3af08	besedilo
00240000-5590-f59a-3f0f-b05d614d39a5	00230000-5590-f59a-0113-49f38bb3af08	uprizoritev
00240000-5590-f59a-207e-701251134e86	00230000-5590-f59a-0113-49f38bb3af08	funkcija
00240000-5590-f59a-2f84-e23ea8f81c22	00230000-5590-f59a-0113-49f38bb3af08	tipfunkcije
00240000-5590-f59a-d3f8-9e217e633647	00230000-5590-f59a-0113-49f38bb3af08	alternacija
00240000-5590-f59a-cc08-7edc65e2f592	00230000-5590-f59a-0563-3848684e8410	pogodba
00240000-5590-f59a-d79c-9119f35d550c	00230000-5590-f59a-0113-49f38bb3af08	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8346558)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8346331)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5590-f59c-c878-aa94e874c3b1	000e0000-5590-f59c-6634-c0e1b7906c21	00080000-5590-f59b-d0b5-5dc9e2de3ba2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5590-f59c-59f9-bb29dc207ed2	000e0000-5590-f59c-6634-c0e1b7906c21	00080000-5590-f59b-d0b5-5dc9e2de3ba2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5590-f59c-4a66-d9de03a88b20	000e0000-5590-f59c-6634-c0e1b7906c21	00080000-5590-f59b-8a0b-db273388f8a3	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8345995)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8346174)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5590-f59c-0c3a-ce371f22a9a1	00180000-5590-f59c-de23-ff346040b5e3	000c0000-5590-f59c-f4ab-4dfe9a846306	00090000-5590-f59c-c473-62f92db4d529	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-f59c-a24f-0c3fb56a760f	00180000-5590-f59c-de23-ff346040b5e3	000c0000-5590-f59c-b3d7-81de98cd81e1	00090000-5590-f59c-c517-69448eb1c21d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-f59c-c9ca-06be237ed64a	00180000-5590-f59c-de23-ff346040b5e3	000c0000-5590-f59c-411a-93daeb945526	00090000-5590-f59c-203f-b195848ccaf2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-f59c-bf3d-325748edebdf	00180000-5590-f59c-de23-ff346040b5e3	000c0000-5590-f59c-ea1f-d528b060c963	00090000-5590-f59c-2468-681078d8198a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-f59c-ab71-001de7699066	00180000-5590-f59c-de23-ff346040b5e3	000c0000-5590-f59c-81d1-68f2dc958387	00090000-5590-f59c-eb75-b0dc51a9a692	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-f59c-ecd2-bc51ccc3dc75	00180000-5590-f59c-60e7-55d2bd590502	\N	00090000-5590-f59c-eb75-b0dc51a9a692	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8346371)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5590-f59a-27a4-d1eb7e3c5615	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5590-f59a-3fd0-be634eeb4d87	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5590-f59a-6545-f6442ccb4eb5	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5590-f59a-ea58-3816a877d677	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5590-f59a-8474-12d8346269f8	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5590-f59a-91bc-72badb4c9276	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5590-f59a-e299-c1be11ccf644	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5590-f59a-6d52-7ee2c7a4b8fb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5590-f59a-7be6-27562a091dae	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5590-f59a-8606-df634ae71b83	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5590-f59a-37e3-fbb82c6b3370	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5590-f59a-2577-65532c501132	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5590-f59a-6b5b-de5e9320f0b8	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5590-f59a-f7d5-548a4b3a4b08	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5590-f59a-33b0-63ac7865d85b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5590-f59a-086b-756c8e7b8d42	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8346540)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5590-f59a-ca07-5d57e0c3008f	01	Velika predstava	f	1.00	1.00
002b0000-5590-f59a-7ea3-6298c28343f4	02	Mala predstava	f	0.50	0.50
002b0000-5590-f59a-1627-cd0185327fd9	03	Mala koprodukcija	t	0.40	1.00
002b0000-5590-f59a-3a36-9c78e4a0398e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5590-f59a-7985-5dc7d76eed46	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8346058)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8345904)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5590-f59a-aff3-43d9309e75ab	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhaLXX2EYKiMJBh0BaUM1foghfnfM8WW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5590-f59c-85ec-9bbe7d6b05d6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5590-f59c-bcba-4bc8bb2a459f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5590-f59c-6679-482ba404a156	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5590-f59c-7983-db0ea41c90ab	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5590-f59c-fd98-43d925963855	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5590-f59c-c6f4-5e173d26a438	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5590-f59c-4578-e098b306937c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5590-f59c-35c1-f772631ed6a2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5590-f59c-58e5-3670550fdd80	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5590-f59c-194d-591a5d2e04df	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5590-f59a-4243-7776c3ef7e49	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8346428)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5590-f59c-7715-beaa4863c7f3	00160000-5590-f59b-2c8d-96a6b0ad5b16	00150000-5590-f59a-4c5b-cabcb5fa3449	00140000-5590-f599-369d-b32a34a9190e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5590-f59b-18d0-0cbc7e607b0e
000e0000-5590-f59c-6634-c0e1b7906c21	00160000-5590-f59b-5f73-5bf7fc48d4e2	00150000-5590-f59a-8f57-252f5d12ebb3	00140000-5590-f599-711f-eadc0c54a4ab	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5590-f59b-f58e-37720827b794
000e0000-5590-f59c-19d1-227d03213401	\N	00150000-5590-f59a-8f57-252f5d12ebb3	00140000-5590-f599-711f-eadc0c54a4ab	00190000-5590-f59c-99d8-599acddc84f6	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5590-f59b-18d0-0cbc7e607b0e
000e0000-5590-f59c-a921-1815611936c1	\N	00150000-5590-f59a-8f57-252f5d12ebb3	00140000-5590-f599-711f-eadc0c54a4ab	00190000-5590-f59c-99d8-599acddc84f6	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5590-f59b-18d0-0cbc7e607b0e
\.


--
-- TOC entry 2861 (class 0 OID 8346120)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5590-f59c-367a-8d06462450a9	000e0000-5590-f59c-6634-c0e1b7906c21	1	
00200000-5590-f59c-1397-10d6ff2978bb	000e0000-5590-f59c-6634-c0e1b7906c21	2	
\.


--
-- TOC entry 2876 (class 0 OID 8346245)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8346314)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8346152)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8346418)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5590-f599-369d-b32a34a9190e	01	Drama	drama (SURS 01)
00140000-5590-f599-c389-e39a82721118	02	Opera	opera (SURS 02)
00140000-5590-f599-1e51-70607d1b8e96	03	Balet	balet (SURS 03)
00140000-5590-f599-4cdf-f7478c36e365	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5590-f599-2379-c998b818b391	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5590-f599-711f-eadc0c54a4ab	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5590-f599-e8ab-6819e02c533a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8346304)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5590-f59a-14a5-84e78dd0b964	01	Opera	opera
00150000-5590-f59a-5c7e-8168efa4af7c	02	Opereta	opereta
00150000-5590-f59a-38e7-78e24cb660b1	03	Balet	balet
00150000-5590-f59a-3f3b-be57cf623a34	04	Plesne prireditve	plesne prireditve
00150000-5590-f59a-57f1-0dfb00b2cf31	05	Lutkovno gledališče	lutkovno gledališče
00150000-5590-f59a-eb54-0482398d9f4b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5590-f59a-dd2a-867a4eacc996	07	Biografska drama	biografska drama
00150000-5590-f59a-4c5b-cabcb5fa3449	08	Komedija	komedija
00150000-5590-f59a-9e18-2a6e8296bc82	09	Črna komedija	črna komedija
00150000-5590-f59a-dd40-5ab1a86e3088	10	E-igra	E-igra
00150000-5590-f59a-8f57-252f5d12ebb3	11	Kriminalka	kriminalka
00150000-5590-f59a-4a8f-48de413c1362	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8345958)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8346475)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8346465)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8346370)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8346142)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8346167)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8346556)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8346084)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8346522)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8346300)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8346118)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8346161)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8346098)
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
-- TOC entry 2527 (class 2606 OID 8346210)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8346237)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8346056)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8345967)
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
-- TOC entry 2442 (class 2606 OID 8345991)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8345947)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8345932)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8346243)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8346276)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8346413)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8346020)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8346044)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8346216)
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
-- TOC entry 2457 (class 2606 OID 8346034)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8346105)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8346228)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8346352)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8346398)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8346538)
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
-- TOC entry 2547 (class 2606 OID 8346260)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8346201)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8346192)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8346392)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8346328)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8345903)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8346267)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8345921)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8345941)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8346285)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8346223)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8346173)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8346580)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8346568)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8346562)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8346341)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8346000)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8346183)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8346381)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8346550)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8346069)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8345916)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8346444)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8346127)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8346251)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8346319)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8346156)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8346426)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8346312)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8346149)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8346342)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8346343)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8346022)
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
-- TOC entry 2540 (class 1259 OID 8346244)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8346230)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8346229)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8346128)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8346301)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8346303)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8346302)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8346100)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8346099)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8346415)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8346416)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8346417)
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
-- TOC entry 2602 (class 1259 OID 8346449)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8346446)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8346450)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8346448)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8346447)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8346071)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8346070)
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
-- TOC entry 2440 (class 1259 OID 8345994)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8346268)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8346162)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8345948)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8345949)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8346288)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8346287)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8346286)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8346106)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8346108)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8346107)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8346570)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8346196)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8346194)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8346193)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8346195)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8345922)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8345923)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8346252)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8346217)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8346329)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8346330)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8346526)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8346523)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8346524)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8346525)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8346036)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8346035)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8346037)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8346353)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8346354)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8346479)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8346480)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8346477)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8346478)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8346320)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8346205)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8346204)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8346202)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8346203)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8346467)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8346466)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8346539)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8346119)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8346557)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8345969)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8345968)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8346001)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8346002)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8346186)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8346185)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8346184)
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
-- TOC entry 2492 (class 1259 OID 8346151)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8346147)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8346144)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8346145)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8346143)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8346148)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8346146)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8346021)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8346085)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8346087)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8346086)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8346088)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8346211)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8346414)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8346445)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8345992)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8345993)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8346313)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8346581)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8346057)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8346569)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8346262)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8346261)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8346476)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8346045)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8346427)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8346399)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8346400)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8345942)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8346150)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8346717)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8346702)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8346707)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8346727)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8346697)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8346722)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8346712)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8346872)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8346877)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8346632)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8346812)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8346807)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8346802)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8346692)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8346842)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8346852)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8346847)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8346667)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8346662)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8346792)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8346897)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8346902)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8346907)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8346927)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8346912)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8346932)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8346922)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8346917)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8346657)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8346652)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8346617)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8346612)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8346822)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8346732)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8346592)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8346597)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8346837)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8346832)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8346827)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8346672)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8346682)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8346677)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8346997)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8346767)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8346757)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8346752)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8346762)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8346582)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8346587)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8346817)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8346797)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8346862)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8346867)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8346982)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8346967)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8346972)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8346977)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8346642)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8346637)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8346647)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8346882)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8346887)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8346957)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8346962)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8346947)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8346952)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8346857)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8346787)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8346782)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8346772)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8346777)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8346942)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8346937)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8346987)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8346687)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8346892)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8346992)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8346607)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8346602)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8346622)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8346627)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8346747)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8346742)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8346737)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 09:37:01 CEST

--
-- PostgreSQL database dump complete
--

