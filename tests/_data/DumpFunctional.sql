--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 13:32:54 CEST

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
-- TOC entry 183 (class 1259 OID 8428382)
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
-- TOC entry 230 (class 1259 OID 8428900)
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
-- TOC entry 229 (class 1259 OID 8428883)
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
-- TOC entry 222 (class 1259 OID 8428787)
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
-- TOC entry 197 (class 1259 OID 8428561)
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
-- TOC entry 200 (class 1259 OID 8428595)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8428983)
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
-- TOC entry 192 (class 1259 OID 8428504)
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
-- TOC entry 231 (class 1259 OID 8428913)
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
-- TOC entry 216 (class 1259 OID 8428721)
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
-- TOC entry 195 (class 1259 OID 8428541)
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
-- TOC entry 199 (class 1259 OID 8428589)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8428521)
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
-- TOC entry 205 (class 1259 OID 8428638)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8428663)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8428478)
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
-- TOC entry 184 (class 1259 OID 8428391)
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
-- TOC entry 185 (class 1259 OID 8428402)
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
-- TOC entry 180 (class 1259 OID 8428356)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8428375)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8428670)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8428701)
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
-- TOC entry 226 (class 1259 OID 8428833)
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
-- TOC entry 187 (class 1259 OID 8428435)
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
-- TOC entry 189 (class 1259 OID 8428470)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8428644)
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
-- TOC entry 188 (class 1259 OID 8428455)
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
-- TOC entry 194 (class 1259 OID 8428533)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8428656)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8428776)
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
-- TOC entry 225 (class 1259 OID 8428825)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8428959)
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
-- TOC entry 212 (class 1259 OID 8428685)
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
-- TOC entry 204 (class 1259 OID 8428629)
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
-- TOC entry 203 (class 1259 OID 8428619)
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
-- TOC entry 224 (class 1259 OID 8428814)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8428753)
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
-- TOC entry 177 (class 1259 OID 8428327)
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
-- TOC entry 176 (class 1259 OID 8428325)
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
-- TOC entry 213 (class 1259 OID 8428695)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8428365)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8428349)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8428709)
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
-- TOC entry 207 (class 1259 OID 8428650)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8428600)
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
-- TOC entry 237 (class 1259 OID 8429003)
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
-- TOC entry 236 (class 1259 OID 8428995)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8428990)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8428763)
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
-- TOC entry 186 (class 1259 OID 8428427)
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
-- TOC entry 202 (class 1259 OID 8428606)
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
-- TOC entry 223 (class 1259 OID 8428803)
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
-- TOC entry 233 (class 1259 OID 8428972)
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
-- TOC entry 191 (class 1259 OID 8428490)
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
-- TOC entry 178 (class 1259 OID 8428336)
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
-- TOC entry 228 (class 1259 OID 8428860)
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
-- TOC entry 196 (class 1259 OID 8428552)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8428677)
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
-- TOC entry 218 (class 1259 OID 8428746)
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
-- TOC entry 198 (class 1259 OID 8428584)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8428850)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8428736)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8428330)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8428382)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8428900)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5591-2ce5-0c29-d5f4cb24a3a9	000d0000-5591-2ce5-7c4a-4ea19729266d	\N	00090000-5591-2ce5-90cd-6057d7fca07b	000b0000-5591-2ce5-2b9b-68ae0a42a09b	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-2ce5-51ef-03d1badc96d0	000d0000-5591-2ce5-adc4-818e0434228c	\N	00090000-5591-2ce5-7c9a-612d019cc7f2	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-2ce5-d479-448eba99591f	000d0000-5591-2ce5-f31e-e28be8d23581	\N	00090000-5591-2ce5-0bbb-0a5230083225	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-2ce5-ca8d-3947af979f88	000d0000-5591-2ce5-9187-9a0147ca0a0c	\N	00090000-5591-2ce5-f7a9-5752ef8760c3	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-2ce5-70c1-8aa8c85845ae	000d0000-5591-2ce5-e26e-f3786763370f	\N	00090000-5591-2ce5-e702-31f0f2478f47	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5591-2ce5-c271-6005d4c0f88f	000d0000-5591-2ce5-ab75-f09af0449bba	\N	00090000-5591-2ce5-7c9a-612d019cc7f2	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8428883)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8428787)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5591-2ce5-806f-9f6ab2e1fa5f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5591-2ce5-95b5-86c09e6b2e4d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5591-2ce5-dbf3-5ff85db87ffe	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8428561)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5591-2ce5-ad7e-98d3471aa939	\N	\N	00200000-5591-2ce5-4902-891744a6b524	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5591-2ce5-6754-9a86666b01e4	\N	\N	00200000-5591-2ce5-caea-bfd31a3b74fa	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5591-2ce5-cb9d-395e196a91e1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5591-2ce5-1a9a-78750d825e41	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5591-2ce5-0673-5295dfe9c863	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8428595)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8428983)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8428504)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5591-2ce3-924e-f2469c8f112a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5591-2ce3-f166-cf10bde85459	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5591-2ce3-f400-2d30e14d94c0	AL	ALB	008	Albania 	Albanija	\N
00040000-5591-2ce3-6cef-044a77b2f640	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5591-2ce3-6a71-d781df6233bd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5591-2ce3-429f-3df373f070c8	AD	AND	020	Andorra 	Andora	\N
00040000-5591-2ce3-93fd-f0369ebd8fab	AO	AGO	024	Angola 	Angola	\N
00040000-5591-2ce3-403c-22cc2792e64e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5591-2ce3-5f57-87689ba43f13	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5591-2ce3-2c24-6d974e7815cb	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-2ce3-7340-56584f8b15a8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5591-2ce3-15ea-d5d3d78b161d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5591-2ce3-4847-fe532b174158	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5591-2ce3-b331-21c4bee89506	AU	AUS	036	Australia 	Avstralija	\N
00040000-5591-2ce3-969c-154a793ce58c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5591-2ce3-11ed-b8203c0b5b31	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5591-2ce3-e7b6-a083d0e62399	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5591-2ce3-c170-85ac09d39d6f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5591-2ce3-9f1d-0700e7ecec19	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5591-2ce3-e02f-f17a48d5d9af	BB	BRB	052	Barbados 	Barbados	\N
00040000-5591-2ce3-ef4d-5bf1f1a767b6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5591-2ce3-2d86-f025191738d4	BE	BEL	056	Belgium 	Belgija	\N
00040000-5591-2ce3-b5b2-c53a5c56cb64	BZ	BLZ	084	Belize 	Belize	\N
00040000-5591-2ce3-05ad-9ff4bea500c8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5591-2ce3-8820-58b042d78325	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5591-2ce3-ef3c-ad63a07347da	BT	BTN	064	Bhutan 	Butan	\N
00040000-5591-2ce3-180d-7e606306737f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5591-2ce3-2baa-5cf3095d9a59	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5591-2ce3-7a21-04a30e384abf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5591-2ce3-c272-4ac7a5c85944	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5591-2ce3-3c30-5738813ccb2d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5591-2ce3-b8b3-90df77ed79c8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5591-2ce3-61db-712c83c1cce5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5591-2ce3-d472-de1a927805d6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5591-2ce3-b273-c0ab8fce1a29	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5591-2ce3-04c3-77041c1580b4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5591-2ce3-b361-0d5420d6547d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5591-2ce3-da63-7112e0c8d3b4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5591-2ce3-4ab4-80dca430974a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5591-2ce3-8186-e26770e30ad5	CA	CAN	124	Canada 	Kanada	\N
00040000-5591-2ce3-ee0a-73a0db90e4ce	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5591-2ce3-6126-8513d9f0fa0a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5591-2ce3-24f9-13d1308fdb8a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5591-2ce3-0ce2-381c48cc7689	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5591-2ce3-3941-5af80f435469	CL	CHL	152	Chile 	Čile	\N
00040000-5591-2ce3-8361-cb2971dc0def	CN	CHN	156	China 	Kitajska	\N
00040000-5591-2ce3-b094-88a64967400f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5591-2ce3-5879-44f55b455a9b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5591-2ce3-a947-ec6084f71ad2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5591-2ce3-7253-c564ce23805d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5591-2ce3-b101-2c20b48e1cf1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5591-2ce3-a171-4af6cad0c3a2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5591-2ce3-986e-70a1b4bd08fc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5591-2ce3-acd9-765f08879160	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5591-2ce3-0913-13146376678f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5591-2ce3-b95e-4ea8c3a5b901	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5591-2ce3-e4f9-953d31f4f9bd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5591-2ce3-7c94-c887b583b343	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5591-2ce3-a4dd-a0d094578df9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5591-2ce3-efaf-8327af9f4a85	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5591-2ce3-1abd-dea4908e43b3	DK	DNK	208	Denmark 	Danska	\N
00040000-5591-2ce3-5da8-421111e1b2aa	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5591-2ce3-c0d4-91b7dedbbf49	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5591-2ce3-7602-84c981b4e20a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5591-2ce3-2cfd-7730434d28ac	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5591-2ce3-96d9-a580ed594ebc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5591-2ce3-04a0-93bace12b75d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5591-2ce3-3833-7289a9fdd63a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5591-2ce3-af54-a8cbf6855bbb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5591-2ce3-87d3-fd421e4ba726	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5591-2ce3-f039-b13a96838aa7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5591-2ce3-429b-c94106272c61	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5591-2ce3-a939-686030429148	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5591-2ce3-4cc1-a7eb404ca3c1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5591-2ce3-b20d-a0badcfaaef5	FI	FIN	246	Finland 	Finska	\N
00040000-5591-2ce3-5acd-9d178f735746	FR	FRA	250	France 	Francija	\N
00040000-5591-2ce3-671f-29e131656da3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5591-2ce3-3e67-9095922c82e1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5591-2ce3-7a6d-a126de716928	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5591-2ce3-9089-ff9a065c5029	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5591-2ce3-007c-1d48fa1bbd67	GA	GAB	266	Gabon 	Gabon	\N
00040000-5591-2ce3-c746-35d1cc6f1958	GM	GMB	270	Gambia 	Gambija	\N
00040000-5591-2ce3-25d8-62cc8c7dbb89	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5591-2ce3-6d72-2fbb52496b55	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5591-2ce3-601f-61a6322dbd12	GH	GHA	288	Ghana 	Gana	\N
00040000-5591-2ce3-4dc2-d6c029422898	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5591-2ce3-0caa-d55a05ad8654	GR	GRC	300	Greece 	Grčija	\N
00040000-5591-2ce3-c10e-c2d973602d30	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5591-2ce3-13ef-1af106538a54	GD	GRD	308	Grenada 	Grenada	\N
00040000-5591-2ce3-1217-f10b9d74e48a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5591-2ce3-578b-ef9e823c5c28	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5591-2ce3-e701-cdf00ffc0ac0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5591-2ce3-b650-b1f6497c4f1d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5591-2ce3-b8be-b4fc017675fa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5591-2ce3-4b78-d70aaccf9327	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5591-2ce3-4e65-6dcc3ed9e0ae	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5591-2ce3-8374-056b8e2b4719	HT	HTI	332	Haiti 	Haiti	\N
00040000-5591-2ce3-eeb0-d7533540f34e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5591-2ce3-6af1-ced9ed107f3c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5591-2ce3-4baa-14c6466f6677	HN	HND	340	Honduras 	Honduras	\N
00040000-5591-2ce3-e647-be29748a0537	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5591-2ce3-9b56-0cae035a350b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5591-2ce3-e7ba-a84816f6a3eb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5591-2ce3-fc8e-c4c41f66bd88	IN	IND	356	India 	Indija	\N
00040000-5591-2ce3-641e-f499f2fae8fd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5591-2ce3-f854-51e18338d884	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5591-2ce3-33c1-20023d6b605d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5591-2ce3-8c16-fa56a91d37ad	IE	IRL	372	Ireland 	Irska	\N
00040000-5591-2ce3-f472-0030430aa7a3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5591-2ce3-9cea-a9e624b1fdab	IL	ISR	376	Israel 	Izrael	\N
00040000-5591-2ce3-8e7f-72d4c729af57	IT	ITA	380	Italy 	Italija	\N
00040000-5591-2ce3-60c5-546a8d7f02c9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5591-2ce3-9890-371772ba8caa	JP	JPN	392	Japan 	Japonska	\N
00040000-5591-2ce3-dfc7-3b9e7069e117	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5591-2ce3-8013-c9fa655b9277	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5591-2ce3-22f6-56e45af2fcdb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5591-2ce3-81b4-cc41690c5ce2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5591-2ce3-0e87-58cf47bcd639	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5591-2ce3-ce52-1fe9cee997e4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5591-2ce3-e8c1-6073bdc4c184	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5591-2ce3-3ff6-8f0f2f096b26	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5591-2ce3-3461-79cb32a7a447	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5591-2ce3-f5b0-76e3de2fc3e3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5591-2ce3-b976-2548bb639de4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5591-2ce3-a579-aa1ee6b4292d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5591-2ce3-78d5-f108604d7da9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5591-2ce3-4275-5a8081af831e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5591-2ce3-53fe-f571b9aad4d0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5591-2ce3-8301-dd8eb5cc9e17	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5591-2ce3-0d51-de384f29325b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5591-2ce3-5a1b-7198860c0592	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5591-2ce3-6b41-b59c07a39728	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5591-2ce3-be32-c1165f8fde06	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5591-2ce3-dcf4-b7da58bc6ae1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5591-2ce3-1a84-121e6559f3ae	MW	MWI	454	Malawi 	Malavi	\N
00040000-5591-2ce3-e6a2-b4d3a9a63e60	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5591-2ce3-c3d5-953851dd4441	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5591-2ce3-cc09-bcf9d34fab86	ML	MLI	466	Mali 	Mali	\N
00040000-5591-2ce3-1135-ad52db6c7465	MT	MLT	470	Malta 	Malta	\N
00040000-5591-2ce3-e1ce-f9e7da6ab52f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5591-2ce3-4b25-4972fd14c366	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5591-2ce3-75b8-8077f82d2299	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5591-2ce3-21eb-3b6e2b908e1e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5591-2ce3-3659-abf5a1379893	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5591-2ce3-5cc9-80701e40201e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5591-2ce3-b65f-d8d8f91ec64f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5591-2ce3-0bc9-ff60e226b848	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5591-2ce3-809d-90d4bc59c365	MC	MCO	492	Monaco 	Monako	\N
00040000-5591-2ce3-75fd-1eb32c3354d6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5591-2ce3-d633-160d22979c87	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5591-2ce3-5383-be9363947784	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5591-2ce3-79d2-9fcfafa9500c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5591-2ce3-5e49-ab6fe1759e1e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5591-2ce3-9114-6a9b80ebed28	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5591-2ce3-4bc9-45133b357eb2	NA	NAM	516	Namibia 	Namibija	\N
00040000-5591-2ce3-bedf-8ba1777c596c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5591-2ce3-6665-f6bfc5ac9f9e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5591-2ce3-4b12-6fdaabc46422	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5591-2ce3-01d1-64fa24150abd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5591-2ce3-7342-6810d76ece29	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5591-2ce3-645a-ad8a4fe24e30	NE	NER	562	Niger 	Niger 	\N
00040000-5591-2ce3-7d28-feaf0ddb4d4e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5591-2ce3-cabe-a6276f243f22	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5591-2ce3-cf52-9d5e2abde3dd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5591-2ce3-b548-5ca591693694	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5591-2ce3-bf7c-e0c7c403ac47	NO	NOR	578	Norway 	Norveška	\N
00040000-5591-2ce3-7903-2642c340db86	OM	OMN	512	Oman 	Oman	\N
00040000-5591-2ce3-1f81-234a7c8e5382	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5591-2ce3-3f65-47d34a06d400	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5591-2ce3-722b-91cdd7cfb0dc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5591-2ce3-0288-723437c5af57	PA	PAN	591	Panama 	Panama	\N
00040000-5591-2ce3-f132-16ae5e402f60	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5591-2ce3-0b4c-c2bf93926451	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5591-2ce3-c5c3-87f766026c67	PE	PER	604	Peru 	Peru	\N
00040000-5591-2ce3-0add-2c57cbddb10b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5591-2ce3-856f-8fcc9d293b12	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5591-2ce3-e2c0-9d0fd882d21b	PL	POL	616	Poland 	Poljska	\N
00040000-5591-2ce3-71d2-a2d0e937eeea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5591-2ce3-f1e7-716be7c272bf	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5591-2ce3-5a7d-c7147a17f255	QA	QAT	634	Qatar 	Katar	\N
00040000-5591-2ce3-a2bd-54998f43d569	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5591-2ce3-f940-8ac6f586dc3d	RO	ROU	642	Romania 	Romunija	\N
00040000-5591-2ce3-17e9-65d161915df5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5591-2ce3-3a45-38784214648d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5591-2ce3-3168-4b53f88b1fe6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5591-2ce3-cfa5-a06e2199ad08	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5591-2ce3-abc4-e836293862de	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5591-2ce3-95ce-221c9689b403	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5591-2ce3-cc87-c2cd1f0108f9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5591-2ce3-d350-149e7ddd80d2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5591-2ce3-9e7a-c058cc03d756	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5591-2ce3-ac3e-760fdc01f8a8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5591-2ce3-3253-c79d2e5a7b9e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5591-2ce3-3c2b-4d7a2911029a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5591-2ce3-5d65-270a0e5f0f8c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5591-2ce3-c461-87b448273255	SN	SEN	686	Senegal 	Senegal	\N
00040000-5591-2ce3-78a4-005656aed9d6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5591-2ce3-b913-713577c4dc1c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5591-2ce3-c5d6-6fba0373aeae	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5591-2ce3-77d5-3e6b7b889397	SG	SGP	702	Singapore 	Singapur	\N
00040000-5591-2ce3-d24a-3d407655becb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5591-2ce3-0faf-0af84ce35604	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5591-2ce3-930e-2b0ca9bf7116	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5591-2ce3-259b-5b251849b879	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5591-2ce4-bd2b-87d06db1f0d7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5591-2ce4-6e31-8349b92745f7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5591-2ce4-d673-fdbfe5c44e96	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5591-2ce4-129d-128ba46a766c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5591-2ce4-4390-837b4a9a3c1d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5591-2ce4-c724-202b039c2944	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5591-2ce4-7fe3-b810ab18242e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5591-2ce4-d741-69d793ada151	SR	SUR	740	Suriname 	Surinam	\N
00040000-5591-2ce4-204a-7757a3c67821	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5591-2ce4-4ac8-2c3614ef5436	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5591-2ce4-fcb9-941cdd5dfa12	SE	SWE	752	Sweden 	Švedska	\N
00040000-5591-2ce4-a701-36270b4750e4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5591-2ce4-6b63-7c83d3932f1f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5591-2ce4-c808-cf8f99c3998b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5591-2ce4-963b-68e16eba818b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5591-2ce4-c7ac-bc4b8db9ffbb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5591-2ce4-a369-8accb8b651d3	TH	THA	764	Thailand 	Tajska	\N
00040000-5591-2ce4-8f96-124323552272	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5591-2ce4-454a-d14838e14ac2	TG	TGO	768	Togo 	Togo	\N
00040000-5591-2ce4-ae6c-3fa2c6d3614b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5591-2ce4-1a40-612db0c3e48c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5591-2ce4-8c07-3de799948e05	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5591-2ce4-3cdb-1d906ce7f0af	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5591-2ce4-5b99-45237373a4a4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5591-2ce4-210e-e5365cb928dd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5591-2ce4-177e-6a9ea16d0244	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-2ce4-3b92-8465bec7132f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5591-2ce4-90bb-0f98262bb456	UG	UGA	800	Uganda 	Uganda	\N
00040000-5591-2ce4-d6e5-966b93b33c1b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5591-2ce4-be5c-11298835acfe	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5591-2ce4-7ee8-dc9d63330d8c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5591-2ce4-2644-5d7d71c5200a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5591-2ce4-e588-3f5049f421fa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5591-2ce4-4826-81fb397e3cb3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5591-2ce4-7565-3f9e797698e1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5591-2ce4-1bf6-3182ab2780ce	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5591-2ce4-798b-693b8baf8b58	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5591-2ce4-7165-ccd90125b728	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5591-2ce4-802b-eddd04856225	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5591-2ce4-474f-8587a8a42ccd	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5591-2ce4-232f-5928d72dcc8d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5591-2ce4-a7c4-6d246ba2bb52	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5591-2ce4-b849-30e43030ae49	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5591-2ce4-8457-44f91b8cb8d3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5591-2ce4-c1e0-c3c16224c10f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8428913)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5591-2ce5-6dea-531d36b75af7	000e0000-5591-2ce5-c1aa-5111e2ac48e9	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5591-2ce4-f79b-957bc052480b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5591-2ce5-8a06-95b801988b2d	000e0000-5591-2ce5-6598-9879ef184e0c	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5591-2ce4-23b7-0223cf2a4350	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8428721)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5591-2ce5-3acd-c09b15275cc3	000e0000-5591-2ce5-6598-9879ef184e0c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5591-2ce4-abef-9d2ae77e7726
000d0000-5591-2ce5-7c4a-4ea19729266d	000e0000-5591-2ce5-6598-9879ef184e0c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-2ce4-abef-9d2ae77e7726
000d0000-5591-2ce5-adc4-818e0434228c	000e0000-5591-2ce5-6598-9879ef184e0c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5591-2ce4-c689-236b0175bd79
000d0000-5591-2ce5-f31e-e28be8d23581	000e0000-5591-2ce5-6598-9879ef184e0c	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5591-2ce4-fcf6-5f175570a853
000d0000-5591-2ce5-9187-9a0147ca0a0c	000e0000-5591-2ce5-6598-9879ef184e0c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5591-2ce4-fcf6-5f175570a853
000d0000-5591-2ce5-e26e-f3786763370f	000e0000-5591-2ce5-6598-9879ef184e0c	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5591-2ce4-fcf6-5f175570a853
000d0000-5591-2ce5-ab75-f09af0449bba	000e0000-5591-2ce5-6598-9879ef184e0c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5591-2ce4-abef-9d2ae77e7726
\.


--
-- TOC entry 2860 (class 0 OID 8428541)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8428589)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8428521)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5591-2ce5-9607-e5e623a9a0af	00080000-5591-2ce5-3cc4-862d59826b30	00090000-5591-2ce5-90cd-6057d7fca07b	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8428638)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8428663)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8428478)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5591-2ce4-745c-0fed15a4545b	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5591-2ce4-1fa3-8e929bbf370d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5591-2ce4-1961-47ee9a4c6ad7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5591-2ce4-2e4d-590ec24810aa	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5591-2ce4-0905-6673f94bb298	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5591-2ce4-37ce-546f2c14ed32	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5591-2ce4-7f41-3f7e487cab3e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5591-2ce4-f112-d1bb79e3361e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-2ce4-d997-6a272312d12c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5591-2ce4-c3e7-fd0e891a68b1	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5591-2ce4-89c1-876fece2b43e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5591-2ce4-6d20-b9c44c514164	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5591-2ce4-405c-605da391b9a9	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5591-2ce5-fbc3-9459b5a68c7a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5591-2ce5-8fdb-cde90750e5e4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5591-2ce5-8d62-9558428835d4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5591-2ce5-83be-0bcd8b302dd1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5591-2ce5-0ec7-e531c5bd5c4d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5591-2ce5-28c1-7d46ca37f74e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8428391)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5591-2ce5-7e3b-33e145dada99	00000000-5591-2ce5-8fdb-cde90750e5e4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5591-2ce5-4047-75be15de4994	00000000-5591-2ce5-8fdb-cde90750e5e4	00010000-5591-2ce4-5ca4-20d83c6dbe80	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5591-2ce5-6c19-5aa70db2df22	00000000-5591-2ce5-8d62-9558428835d4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8428402)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5591-2ce5-60b6-7dd4fb2869d9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5591-2ce5-f7a9-5752ef8760c3	00010000-5591-2ce5-3b81-97ca3fc65739	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5591-2ce5-0bbb-0a5230083225	00010000-5591-2ce5-c17b-7271f010928d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5591-2ce5-5361-601a66a5f5f6	00010000-5591-2ce5-12ba-96ff885d86e6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5591-2ce5-407b-fc566aa52705	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5591-2ce5-3e55-5938ca99d89d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5591-2ce5-5cd1-edd62636bf65	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5591-2ce5-a463-03953df57dda	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5591-2ce5-90cd-6057d7fca07b	00010000-5591-2ce5-f7b1-93664e168aaa	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5591-2ce5-7c9a-612d019cc7f2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5591-2ce5-26ba-e7a95a2925b4	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5591-2ce5-e702-31f0f2478f47	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5591-2ce5-1ca8-15e5d826f33d	00010000-5591-2ce5-634b-b66f973d1d37	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8428356)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5591-2ce4-f443-dafee7dee9af	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5591-2ce4-c9c0-b01acf8c9ee1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5591-2ce4-11c5-a4dbcbba484b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5591-2ce4-995d-cd43f6a9f54e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5591-2ce4-afb6-e81753715ea0	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5591-2ce4-a8c6-2d7a4bb092cb	Abonma-read	Abonma - branje	f
00030000-5591-2ce4-82a6-f229b19a0c38	Abonma-write	Abonma - spreminjanje	f
00030000-5591-2ce4-b2f8-38bb7aeab0f8	Alternacija-read	Alternacija - branje	f
00030000-5591-2ce4-34ec-26446ada5529	Alternacija-write	Alternacija - spreminjanje	f
00030000-5591-2ce4-e80b-6d9e3ad9b244	Arhivalija-read	Arhivalija - branje	f
00030000-5591-2ce4-c0b7-dc7e709cfe52	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5591-2ce4-91e9-01c540b587e3	Besedilo-read	Besedilo - branje	f
00030000-5591-2ce4-2160-7037467254cd	Besedilo-write	Besedilo - spreminjanje	f
00030000-5591-2ce4-19a7-b05f0b609204	DogodekIzven-read	DogodekIzven - branje	f
00030000-5591-2ce4-199c-635abfcf8021	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5591-2ce4-09e9-d1c56a7b4294	Dogodek-read	Dogodek - branje	f
00030000-5591-2ce4-c803-7f51cbb184ec	Dogodek-write	Dogodek - spreminjanje	f
00030000-5591-2ce4-0654-aa6956a221d4	DrugiVir-read	DrugiVir - branje	f
00030000-5591-2ce4-ed46-09bd3390e741	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5591-2ce4-4d83-0a62053f81d8	Drzava-read	Drzava - branje	f
00030000-5591-2ce4-da6d-d1c8786cdb40	Drzava-write	Drzava - spreminjanje	f
00030000-5591-2ce4-9a23-012f5234ba03	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5591-2ce4-b38c-28096d517e50	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5591-2ce4-9719-b506bab731bf	Funkcija-read	Funkcija - branje	f
00030000-5591-2ce4-500d-85cb69706c2b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5591-2ce4-6398-d598cc7f584e	Gostovanje-read	Gostovanje - branje	f
00030000-5591-2ce4-bc72-ebf5d4d0c61c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5591-2ce4-9215-bd47fbb6892c	Gostujoca-read	Gostujoca - branje	f
00030000-5591-2ce4-4020-ac7e2ad81bb1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5591-2ce4-3a6b-90e40a26432d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5591-2ce4-ad94-84beb4792955	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5591-2ce4-2096-1efd3c2be6b3	Kupec-read	Kupec - branje	f
00030000-5591-2ce4-26b2-16bf4c984a0f	Kupec-write	Kupec - spreminjanje	f
00030000-5591-2ce4-b5f5-db98e7e5a28a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5591-2ce4-c445-91e57b6d8f28	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5591-2ce4-9bc1-ca420aa6aa4f	Option-read	Option - branje	f
00030000-5591-2ce4-870e-9b537b05cd7e	Option-write	Option - spreminjanje	f
00030000-5591-2ce4-0e3d-f4b0fa08608f	OptionValue-read	OptionValue - branje	f
00030000-5591-2ce4-4b8b-5eb8d97bc6f9	OptionValue-write	OptionValue - spreminjanje	f
00030000-5591-2ce4-e877-370969df6115	Oseba-read	Oseba - branje	f
00030000-5591-2ce4-9ae5-ab0ddeaebfb8	Oseba-write	Oseba - spreminjanje	f
00030000-5591-2ce4-e20d-db7241755681	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5591-2ce4-8c92-febebb72baa7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5591-2ce4-739d-91e455994923	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5591-2ce4-4fb8-27af36d97184	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5591-2ce4-e16b-c8c8731ce4dd	Pogodba-read	Pogodba - branje	f
00030000-5591-2ce4-5fec-9b3f05a0e6de	Pogodba-write	Pogodba - spreminjanje	f
00030000-5591-2ce4-ce13-0a36a96f9781	Popa-read	Popa - branje	f
00030000-5591-2ce4-927e-d11fbfbc524d	Popa-write	Popa - spreminjanje	f
00030000-5591-2ce4-5ac7-26156717680b	Posta-read	Posta - branje	f
00030000-5591-2ce4-0977-e81f88818a20	Posta-write	Posta - spreminjanje	f
00030000-5591-2ce4-d59d-6172471dc70b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5591-2ce4-2b18-bd673462fedd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5591-2ce4-3a0b-b48a35667833	PostniNaslov-read	PostniNaslov - branje	f
00030000-5591-2ce4-18e0-4413ef45ae8d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5591-2ce4-2dda-4aba877d11f1	Predstava-read	Predstava - branje	f
00030000-5591-2ce4-0d7b-61ec75fb819d	Predstava-write	Predstava - spreminjanje	f
00030000-5591-2ce4-bf1e-743f58759465	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5591-2ce4-44ec-9f4a2730b80d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5591-2ce4-7e79-39b1768f271c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5591-2ce4-9ca1-e001c3b2f6c4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5591-2ce4-32db-17404ace7087	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5591-2ce4-d13c-a81436bd761a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5591-2ce4-ce0b-692ee46e7297	ProgramDela-read	ProgramDela - branje	f
00030000-5591-2ce4-d1c6-f8466d615a70	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5591-2ce4-7a36-d2f7056ec3c1	ProgramFestival-read	ProgramFestival - branje	f
00030000-5591-2ce4-f28b-4e8482f97eaf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5591-2ce4-dcd4-972939069895	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5591-2ce4-c9fa-22bb3903f649	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5591-2ce4-4029-b25f162d0bcd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5591-2ce4-d2a4-9fd7f27e114c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5591-2ce4-0465-c356583d41f9	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5591-2ce4-374a-528a27ca4e85	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5591-2ce4-a607-c99605a6cf1b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5591-2ce4-0e85-a0129772c98e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5591-2ce4-c113-8e5cfaec42f5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5591-2ce4-7ea5-22bb9380271e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5591-2ce4-157f-004a51d20318	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5591-2ce4-73d4-1a023c4639d6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5591-2ce4-e93a-23566cd3e95a	ProgramRazno-read	ProgramRazno - branje	f
00030000-5591-2ce4-bbcb-70ed9e678058	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5591-2ce4-ae72-31def9117146	Prostor-read	Prostor - branje	f
00030000-5591-2ce4-6756-9535f56431f9	Prostor-write	Prostor - spreminjanje	f
00030000-5591-2ce4-4370-1776e2f75407	Racun-read	Racun - branje	f
00030000-5591-2ce4-a28a-d31efa8377b2	Racun-write	Racun - spreminjanje	f
00030000-5591-2ce4-9832-63d3a7032c59	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5591-2ce4-01a6-4734504a2585	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5591-2ce4-f92c-9b0447ae2cdc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5591-2ce4-9c1d-06c867f122d3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5591-2ce4-5b85-8e22b3a473dc	Rekvizit-read	Rekvizit - branje	f
00030000-5591-2ce4-c4ed-64b0b1fb7126	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5591-2ce4-b51f-0cb83066f040	Revizija-read	Revizija - branje	f
00030000-5591-2ce4-aa73-1c5822f434d9	Revizija-write	Revizija - spreminjanje	f
00030000-5591-2ce4-c9dd-7328f6233bb8	Rezervacija-read	Rezervacija - branje	f
00030000-5591-2ce4-b86b-49c5b63371d8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5591-2ce4-c011-c3cf9c473990	SedezniRed-read	SedezniRed - branje	f
00030000-5591-2ce4-5725-aea733dc3cdd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5591-2ce4-53be-d2c40874cd0a	Sedez-read	Sedez - branje	f
00030000-5591-2ce4-55c5-a2a8e5e0f1a5	Sedez-write	Sedez - spreminjanje	f
00030000-5591-2ce4-350c-237cf12ee39c	Sezona-read	Sezona - branje	f
00030000-5591-2ce4-dd8b-31025240eb1f	Sezona-write	Sezona - spreminjanje	f
00030000-5591-2ce4-675a-011f1677c244	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5591-2ce4-7ec0-4280117156fe	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5591-2ce4-f103-befd4cad1741	Stevilcenje-read	Stevilcenje - branje	f
00030000-5591-2ce4-13ff-5ca4b06a3f54	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5591-2ce4-162e-add4d108175a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5591-2ce4-97a2-5b68a3594ad9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5591-2ce4-ab55-787e4626210f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5591-2ce4-f2cb-dd076e449aa9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5591-2ce4-dfff-da4b842f6b67	Telefonska-read	Telefonska - branje	f
00030000-5591-2ce4-3ec6-ad7aa122bde7	Telefonska-write	Telefonska - spreminjanje	f
00030000-5591-2ce4-3b41-cf08a9fb8a21	TerminStoritve-read	TerminStoritve - branje	f
00030000-5591-2ce4-6daa-f1c46e0c4671	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5591-2ce4-984e-300fa11a9eff	TipFunkcije-read	TipFunkcije - branje	f
00030000-5591-2ce4-2be2-584207b981cf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5591-2ce4-3c38-26d8c3bdd3a9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5591-2ce4-718e-4d251ad9cdaf	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5591-2ce4-eb80-97be3ea98205	Trr-read	Trr - branje	f
00030000-5591-2ce4-8941-8896876b7e56	Trr-write	Trr - spreminjanje	f
00030000-5591-2ce4-b53e-551120b9cbd9	Uprizoritev-read	Uprizoritev - branje	f
00030000-5591-2ce4-dc72-db4c39790c4b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5591-2ce4-d17f-cdc212fd60e0	Vaja-read	Vaja - branje	f
00030000-5591-2ce4-a613-5b1c2c28304d	Vaja-write	Vaja - spreminjanje	f
00030000-5591-2ce4-ea1e-202921b4dcd4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5591-2ce4-f989-5330cb1c6eb0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5591-2ce4-00be-96bc9716e459	Zaposlitev-read	Zaposlitev - branje	f
00030000-5591-2ce4-c940-ab85934b4c5c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5591-2ce4-64df-e7f0d36efe76	Zasedenost-read	Zasedenost - branje	f
00030000-5591-2ce4-cf97-5a750359bf58	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5591-2ce4-e700-7bfca8dcad67	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5591-2ce4-6a4d-d7077fbd354d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5591-2ce4-894e-00563ac30dc2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5591-2ce4-f7df-c79aa723f28c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8428375)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5591-2ce4-45ff-0b0860b3ee75	00030000-5591-2ce4-c9c0-b01acf8c9ee1
00020000-5591-2ce4-2672-bffdb24ee536	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-82a6-f229b19a0c38
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-b2f8-38bb7aeab0f8
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-34ec-26446ada5529
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-995d-cd43f6a9f54e
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-c803-7f51cbb184ec
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-da6d-d1c8786cdb40
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-9719-b506bab731bf
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-500d-85cb69706c2b
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-bc72-ebf5d4d0c61c
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-4020-ac7e2ad81bb1
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-3a6b-90e40a26432d
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-ad94-84beb4792955
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-e877-370969df6115
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-9ae5-ab0ddeaebfb8
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-927e-d11fbfbc524d
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-0977-e81f88818a20
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-3a0b-b48a35667833
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-18e0-4413ef45ae8d
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-0d7b-61ec75fb819d
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-32db-17404ace7087
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-d13c-a81436bd761a
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-6756-9535f56431f9
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-9c1d-06c867f122d3
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-c4ed-64b0b1fb7126
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-dd8b-31025240eb1f
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-984e-300fa11a9eff
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-b53e-551120b9cbd9
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-dc72-db4c39790c4b
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-d17f-cdc212fd60e0
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-a613-5b1c2c28304d
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-64df-e7f0d36efe76
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-cf97-5a750359bf58
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce4-7dd5-f4ab9b34ed90	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-3a6b-90e40a26432d
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-ad94-84beb4792955
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-e877-370969df6115
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-9ae5-ab0ddeaebfb8
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-3a0b-b48a35667833
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-18e0-4413ef45ae8d
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-dfff-da4b842f6b67
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-3ec6-ad7aa122bde7
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-eb80-97be3ea98205
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-8941-8896876b7e56
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-00be-96bc9716e459
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-c940-ab85934b4c5c
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce4-4953-bb4ccfb9f187	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-b2f8-38bb7aeab0f8
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-c0b7-dc7e709cfe52
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-91e9-01c540b587e3
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-19a7-b05f0b609204
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-9719-b506bab731bf
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-3a6b-90e40a26432d
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-e877-370969df6115
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-32db-17404ace7087
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-984e-300fa11a9eff
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-d17f-cdc212fd60e0
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-64df-e7f0d36efe76
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce4-ac09-7349f9230d45	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-82a6-f229b19a0c38
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-34ec-26446ada5529
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-984e-300fa11a9eff
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce4-f31c-b4ebb41f6f97	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-3b41-cf08a9fb8a21
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-11c5-a4dbcbba484b
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-984e-300fa11a9eff
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce4-4d95-a0fce3c46b7a	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f443-dafee7dee9af
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c9c0-b01acf8c9ee1
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-11c5-a4dbcbba484b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-995d-cd43f6a9f54e
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-afb6-e81753715ea0
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-a8c6-2d7a4bb092cb
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-82a6-f229b19a0c38
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b2f8-38bb7aeab0f8
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-34ec-26446ada5529
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e80b-6d9e3ad9b244
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c0b7-dc7e709cfe52
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-91e9-01c540b587e3
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-2160-7037467254cd
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-19a7-b05f0b609204
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-199c-635abfcf8021
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-09e9-d1c56a7b4294
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c803-7f51cbb184ec
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4d83-0a62053f81d8
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-da6d-d1c8786cdb40
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9a23-012f5234ba03
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b38c-28096d517e50
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9719-b506bab731bf
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-500d-85cb69706c2b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-6398-d598cc7f584e
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-bc72-ebf5d4d0c61c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9215-bd47fbb6892c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4020-ac7e2ad81bb1
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-3a6b-90e40a26432d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ad94-84beb4792955
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-2096-1efd3c2be6b3
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-26b2-16bf4c984a0f
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b5f5-db98e7e5a28a
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c445-91e57b6d8f28
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9bc1-ca420aa6aa4f
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-870e-9b537b05cd7e
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-0e3d-f4b0fa08608f
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4b8b-5eb8d97bc6f9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e877-370969df6115
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9ae5-ab0ddeaebfb8
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e20d-db7241755681
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-8c92-febebb72baa7
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-739d-91e455994923
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4fb8-27af36d97184
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e16b-c8c8731ce4dd
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-5fec-9b3f05a0e6de
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ce13-0a36a96f9781
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-927e-d11fbfbc524d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-5ac7-26156717680b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-0977-e81f88818a20
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-d59d-6172471dc70b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-2b18-bd673462fedd
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-3a0b-b48a35667833
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-18e0-4413ef45ae8d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-2dda-4aba877d11f1
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-0d7b-61ec75fb819d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-bf1e-743f58759465
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-44ec-9f4a2730b80d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-7e79-39b1768f271c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9ca1-e001c3b2f6c4
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-32db-17404ace7087
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-d13c-a81436bd761a
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ce0b-692ee46e7297
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-d1c6-f8466d615a70
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-7a36-d2f7056ec3c1
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f28b-4e8482f97eaf
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-dcd4-972939069895
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c9fa-22bb3903f649
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4029-b25f162d0bcd
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-d2a4-9fd7f27e114c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-0465-c356583d41f9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-374a-528a27ca4e85
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-a607-c99605a6cf1b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-0e85-a0129772c98e
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c113-8e5cfaec42f5
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-7ea5-22bb9380271e
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-157f-004a51d20318
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-73d4-1a023c4639d6
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e93a-23566cd3e95a
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-bbcb-70ed9e678058
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ae72-31def9117146
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-6756-9535f56431f9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-4370-1776e2f75407
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-a28a-d31efa8377b2
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9832-63d3a7032c59
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-01a6-4734504a2585
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f92c-9b0447ae2cdc
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-9c1d-06c867f122d3
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-5b85-8e22b3a473dc
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c4ed-64b0b1fb7126
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b51f-0cb83066f040
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-aa73-1c5822f434d9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c9dd-7328f6233bb8
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b86b-49c5b63371d8
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c011-c3cf9c473990
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-5725-aea733dc3cdd
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-53be-d2c40874cd0a
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-55c5-a2a8e5e0f1a5
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-350c-237cf12ee39c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-dd8b-31025240eb1f
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-675a-011f1677c244
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-7ec0-4280117156fe
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f103-befd4cad1741
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-13ff-5ca4b06a3f54
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-162e-add4d108175a
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-97a2-5b68a3594ad9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ab55-787e4626210f
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f2cb-dd076e449aa9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-dfff-da4b842f6b67
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-3ec6-ad7aa122bde7
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-3b41-cf08a9fb8a21
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-6daa-f1c46e0c4671
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-984e-300fa11a9eff
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-2be2-584207b981cf
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-3c38-26d8c3bdd3a9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-718e-4d251ad9cdaf
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-eb80-97be3ea98205
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-8941-8896876b7e56
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-b53e-551120b9cbd9
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-dc72-db4c39790c4b
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-d17f-cdc212fd60e0
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-a613-5b1c2c28304d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-ea1e-202921b4dcd4
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f989-5330cb1c6eb0
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-00be-96bc9716e459
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-c940-ab85934b4c5c
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-64df-e7f0d36efe76
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-cf97-5a750359bf58
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-e700-7bfca8dcad67
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-6a4d-d7077fbd354d
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-894e-00563ac30dc2
00020000-5591-2ce5-565a-be52105b4d24	00030000-5591-2ce4-f7df-c79aa723f28c
\.


--
-- TOC entry 2875 (class 0 OID 8428670)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8428701)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8428833)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5591-2ce5-2b9b-68ae0a42a09b	00090000-5591-2ce5-60b6-7dd4fb2869d9	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8428435)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5591-2ce5-3cc4-862d59826b30	00040000-5591-2ce3-924e-f2469c8f112a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-2ce5-777c-d77d7b1b1cd9	00040000-5591-2ce3-924e-f2469c8f112a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-2ce5-7bf5-d1b05945a509	00040000-5591-2ce3-924e-f2469c8f112a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-2ce5-fc86-73b340d03b91	00040000-5591-2ce3-924e-f2469c8f112a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-2ce5-588e-2856a93e7f09	00040000-5591-2ce3-924e-f2469c8f112a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5591-2ce5-37dc-ba2aa6f7e0c8	00040000-5591-2ce3-930e-2b0ca9bf7116	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8428470)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5591-2ce4-35cf-1bb8a87e5e36	8341	Adlešiči
00050000-5591-2ce4-9f4b-6a52727b8bc8	5270	Ajdovščina
00050000-5591-2ce4-3fd2-76267d5afbb2	6280	Ankaran/Ancarano
00050000-5591-2ce4-6e2b-8763293869de	9253	Apače
00050000-5591-2ce4-b8e6-2d096abfae99	8253	Artiče
00050000-5591-2ce4-c51d-3cbc51f7b4f3	4275	Begunje na Gorenjskem
00050000-5591-2ce4-7296-470b039f2697	1382	Begunje pri Cerknici
00050000-5591-2ce4-5170-75a6760d9887	9231	Beltinci
00050000-5591-2ce4-9b2c-941d190a972f	2234	Benedikt
00050000-5591-2ce4-8792-317664623f7b	2345	Bistrica ob Dravi
00050000-5591-2ce4-2fba-8995489b0ab2	3256	Bistrica ob Sotli
00050000-5591-2ce4-e83b-acf6f1e2298e	8259	Bizeljsko
00050000-5591-2ce4-0e99-d6e39d03fb18	1223	Blagovica
00050000-5591-2ce4-239e-56acc2a19cd3	8283	Blanca
00050000-5591-2ce4-8a0b-f5540bd4d5c4	4260	Bled
00050000-5591-2ce4-8d8d-00ccaec3d6e7	4273	Blejska Dobrava
00050000-5591-2ce4-6309-6337055f7277	9265	Bodonci
00050000-5591-2ce4-474e-55edd71fe196	9222	Bogojina
00050000-5591-2ce4-c815-79e8e339e7ee	4263	Bohinjska Bela
00050000-5591-2ce4-3549-5fe528bf3553	4264	Bohinjska Bistrica
00050000-5591-2ce4-2a71-de36d5a72575	4265	Bohinjsko jezero
00050000-5591-2ce4-27a9-f934e1e910ff	1353	Borovnica
00050000-5591-2ce4-eddd-37a3942dafe8	8294	Boštanj
00050000-5591-2ce4-d253-92174618e0d0	5230	Bovec
00050000-5591-2ce4-ec3e-45487f447419	5295	Branik
00050000-5591-2ce4-40ab-3eeef1930206	3314	Braslovče
00050000-5591-2ce4-ed03-9529f0954fe6	5223	Breginj
00050000-5591-2ce4-b2f2-8bd53f6ea5a6	8280	Brestanica
00050000-5591-2ce4-deaa-37be00ff2aa3	2354	Bresternica
00050000-5591-2ce4-b3b6-fb9872f0e170	4243	Brezje
00050000-5591-2ce4-87b9-e9e546f6e5da	1351	Brezovica pri Ljubljani
00050000-5591-2ce4-2593-dbebf25c3197	8250	Brežice
00050000-5591-2ce4-389a-f9436a8f1921	4210	Brnik - Aerodrom
00050000-5591-2ce4-efce-c6369ecac661	8321	Brusnice
00050000-5591-2ce4-ff61-8a15461f8ffe	3255	Buče
00050000-5591-2ce4-a2dc-a4ad69e7bdd8	8276	Bučka 
00050000-5591-2ce4-9448-d2afa30e7104	9261	Cankova
00050000-5591-2ce4-09ec-54fb81615edb	3000	Celje 
00050000-5591-2ce4-7e97-c138ff4aad2f	3001	Celje - poštni predali
00050000-5591-2ce4-8411-c5c7b3e69dd2	4207	Cerklje na Gorenjskem
00050000-5591-2ce4-79d4-61fba4829a0e	8263	Cerklje ob Krki
00050000-5591-2ce4-ec2e-e317befdf161	1380	Cerknica
00050000-5591-2ce4-1e3a-7258f9b598d4	5282	Cerkno
00050000-5591-2ce4-0d5b-24d036cf6145	2236	Cerkvenjak
00050000-5591-2ce4-85aa-a377904a4087	2215	Ceršak
00050000-5591-2ce4-cc73-60f0756bde66	2326	Cirkovce
00050000-5591-2ce4-705d-bc39d79c220e	2282	Cirkulane
00050000-5591-2ce4-a188-ae96878f5fe1	5273	Col
00050000-5591-2ce4-c2b1-818186ea4872	8251	Čatež ob Savi
00050000-5591-2ce4-bfcd-46e3603dc023	1413	Čemšenik
00050000-5591-2ce4-a8c4-3583d88c0a95	5253	Čepovan
00050000-5591-2ce4-feb1-d725b55f00a8	9232	Črenšovci
00050000-5591-2ce4-20e2-1cde77551806	2393	Črna na Koroškem
00050000-5591-2ce4-5088-e2434298d405	6275	Črni Kal
00050000-5591-2ce4-b771-d9a481e4c9aa	5274	Črni Vrh nad Idrijo
00050000-5591-2ce4-df26-ab456aef5983	5262	Črniče
00050000-5591-2ce4-013d-1c0b20d31555	8340	Črnomelj
00050000-5591-2ce4-6717-5d7e973808bc	6271	Dekani
00050000-5591-2ce4-ff88-1d04a9c219de	5210	Deskle
00050000-5591-2ce4-3385-2850551475ae	2253	Destrnik
00050000-5591-2ce4-6404-55a4c42f39b9	6215	Divača
00050000-5591-2ce4-bf18-6810982545e3	1233	Dob
00050000-5591-2ce4-1383-2868a084c049	3224	Dobje pri Planini
00050000-5591-2ce4-6eb9-833690278476	8257	Dobova
00050000-5591-2ce4-8aeb-3741de8c68f8	1423	Dobovec
00050000-5591-2ce4-c5dc-af44b1f284a0	5263	Dobravlje
00050000-5591-2ce4-5819-cd4073af1698	3204	Dobrna
00050000-5591-2ce4-2649-13b64805878a	8211	Dobrnič
00050000-5591-2ce4-ed6e-d97166d48561	1356	Dobrova
00050000-5591-2ce4-d2cc-d32ab683e242	9223	Dobrovnik/Dobronak 
00050000-5591-2ce4-aa81-c25bb3a88b1b	5212	Dobrovo v Brdih
00050000-5591-2ce4-5ecb-b3d9e7f79854	1431	Dol pri Hrastniku
00050000-5591-2ce4-0490-67620b9973ce	1262	Dol pri Ljubljani
00050000-5591-2ce4-0676-d05d8cd7c7df	1273	Dole pri Litiji
00050000-5591-2ce4-8fa6-def707c5902a	1331	Dolenja vas
00050000-5591-2ce4-542d-47fbc07e22ed	8350	Dolenjske Toplice
00050000-5591-2ce4-7443-4ca6da43cd06	1230	Domžale
00050000-5591-2ce4-afde-10c022b146b7	2252	Dornava
00050000-5591-2ce4-ffc1-27357d08df97	5294	Dornberk
00050000-5591-2ce4-f184-f7fc64c8edec	1319	Draga
00050000-5591-2ce4-7bc6-59a154702ced	8343	Dragatuš
00050000-5591-2ce4-83e1-9ac82e78ef24	3222	Dramlje
00050000-5591-2ce4-329e-c53f3501fc76	2370	Dravograd
00050000-5591-2ce4-b5bd-733882064507	4203	Duplje
00050000-5591-2ce4-3678-c5fb460c5502	6221	Dutovlje
00050000-5591-2ce4-99d3-66950059e9fe	8361	Dvor
00050000-5591-2ce4-50c3-af4c2a3f2d3c	2343	Fala
00050000-5591-2ce4-8a08-8bd927d7432c	9208	Fokovci
00050000-5591-2ce4-4c3d-e0d9cb3f79d6	2313	Fram
00050000-5591-2ce4-ba52-a27d84c35fe0	3213	Frankolovo
00050000-5591-2ce4-8cff-0abe8379c294	1274	Gabrovka
00050000-5591-2ce4-0617-5d3344180202	8254	Globoko
00050000-5591-2ce4-ac45-44f6ced5e449	5275	Godovič
00050000-5591-2ce4-828b-21ec50831f56	4204	Golnik
00050000-5591-2ce4-7149-03887a7fdecc	3303	Gomilsko
00050000-5591-2ce4-51d6-7ff90435be13	4224	Gorenja vas
00050000-5591-2ce4-06bc-090fe2689536	3263	Gorica pri Slivnici
00050000-5591-2ce4-72ff-f07412d0c690	2272	Gorišnica
00050000-5591-2ce4-00d1-e2f5c2c377fd	9250	Gornja Radgona
00050000-5591-2ce4-e0ed-af607bca2f84	3342	Gornji Grad
00050000-5591-2ce4-553f-acf110316236	4282	Gozd Martuljek
00050000-5591-2ce4-0082-895dc5a6ff32	6272	Gračišče
00050000-5591-2ce4-6cdd-83a31500d7f4	9264	Grad
00050000-5591-2ce4-f36e-a2831ba5f301	8332	Gradac
00050000-5591-2ce4-2eb0-7f4717ab6fba	1384	Grahovo
00050000-5591-2ce4-5168-78c61bfc2da8	5242	Grahovo ob Bači
00050000-5591-2ce4-c869-403b31b70e9d	5251	Grgar
00050000-5591-2ce4-d54e-fdf37a206853	3302	Griže
00050000-5591-2ce4-80cd-acd90e489bea	3231	Grobelno
00050000-5591-2ce4-592e-7a4298e814d8	1290	Grosuplje
00050000-5591-2ce4-351d-511c94a01837	2288	Hajdina
00050000-5591-2ce4-caf1-aaaa26312b11	8362	Hinje
00050000-5591-2ce4-5a0d-3d9303b9e883	2311	Hoče
00050000-5591-2ce4-8cd9-c00c5d552269	9205	Hodoš/Hodos
00050000-5591-2ce4-cb7d-7aa2901ebaaf	1354	Horjul
00050000-5591-2ce4-e3b2-7069ff2bcc67	1372	Hotedršica
00050000-5591-2ce4-5f85-886244533dc6	1430	Hrastnik
00050000-5591-2ce4-0c76-821185c0acd0	6225	Hruševje
00050000-5591-2ce4-fb68-5ac99a00ec0a	4276	Hrušica
00050000-5591-2ce4-95d3-b84145ef3f77	5280	Idrija
00050000-5591-2ce4-db29-8d717d95d9a9	1292	Ig
00050000-5591-2ce4-64ee-647ddcfe5f97	6250	Ilirska Bistrica
00050000-5591-2ce4-d5db-831318a2c9a1	6251	Ilirska Bistrica-Trnovo
00050000-5591-2ce4-b388-1e7e2f3cbac7	1295	Ivančna Gorica
00050000-5591-2ce4-31f7-ac148ed623ba	2259	Ivanjkovci
00050000-5591-2ce4-9911-3c70317d4d75	1411	Izlake
00050000-5591-2ce4-983e-2369461b685a	6310	Izola/Isola
00050000-5591-2ce4-a250-dac46c6e7c05	2222	Jakobski Dol
00050000-5591-2ce4-1c4c-45214f1d9942	2221	Jarenina
00050000-5591-2ce4-b5ba-94917f35f540	6254	Jelšane
00050000-5591-2ce4-f8d1-e78eb8388ac7	4270	Jesenice
00050000-5591-2ce4-9253-c51a705e4fa7	8261	Jesenice na Dolenjskem
00050000-5591-2ce4-da98-0b0166894416	3273	Jurklošter
00050000-5591-2ce4-6714-214c07b66012	2223	Jurovski Dol
00050000-5591-2ce4-30a3-1cbad3c504bb	2256	Juršinci
00050000-5591-2ce4-0474-5d0f35919c93	5214	Kal nad Kanalom
00050000-5591-2ce4-5c8f-7d850bcb7314	3233	Kalobje
00050000-5591-2ce4-e1e3-f228efd12cdf	4246	Kamna Gorica
00050000-5591-2ce4-1ec4-64afa1facda0	2351	Kamnica
00050000-5591-2ce4-0ca5-3e0dced10f5f	1241	Kamnik
00050000-5591-2ce4-3581-641129ddc6ed	5213	Kanal
00050000-5591-2ce4-0345-6b24f5459c51	8258	Kapele
00050000-5591-2ce4-d1b9-4838e31d206f	2362	Kapla
00050000-5591-2ce4-61ef-964da5ed45cb	2325	Kidričevo
00050000-5591-2ce4-96eb-0ce0cf4ca543	1412	Kisovec
00050000-5591-2ce4-7085-a8065dcbd7cb	6253	Knežak
00050000-5591-2ce4-54bf-b3d9626fed47	5222	Kobarid
00050000-5591-2ce4-d57e-da62080279c7	9227	Kobilje
00050000-5591-2ce4-4969-e829e9e1e320	1330	Kočevje
00050000-5591-2ce4-8e1e-3e685a69dab4	1338	Kočevska Reka
00050000-5591-2ce4-17e2-b3e2e97c2f9e	2276	Kog
00050000-5591-2ce4-df02-fe09af6e0f36	5211	Kojsko
00050000-5591-2ce4-e5c1-02601a49f222	6223	Komen
00050000-5591-2ce4-d0c5-bbec09fd379a	1218	Komenda
00050000-5591-2ce4-01bb-96fa8d1526b4	6000	Koper/Capodistria 
00050000-5591-2ce4-ea60-f1de84cf4404	6001	Koper/Capodistria - poštni predali
00050000-5591-2ce4-db73-999f4a3c2d5a	8282	Koprivnica
00050000-5591-2ce4-bafa-4d339ef12a8b	5296	Kostanjevica na Krasu
00050000-5591-2ce4-c112-e553b7d0b16c	8311	Kostanjevica na Krki
00050000-5591-2ce4-34a2-8d0bf89dfccb	1336	Kostel
00050000-5591-2ce4-f902-3f562ad2e3fa	6256	Košana
00050000-5591-2ce4-97d0-daa037e07f2b	2394	Kotlje
00050000-5591-2ce4-e3d5-d0d497e39ecd	6240	Kozina
00050000-5591-2ce4-9708-12ec9c7cfb8c	3260	Kozje
00050000-5591-2ce4-d76c-2451ee122fde	4000	Kranj 
00050000-5591-2ce4-b83d-becabc77ee1f	4001	Kranj - poštni predali
00050000-5591-2ce4-a888-167320b1a43d	4280	Kranjska Gora
00050000-5591-2ce4-0ae8-86ca36b2cdf1	1281	Kresnice
00050000-5591-2ce4-0641-bf2bd370b0ea	4294	Križe
00050000-5591-2ce4-bd96-2033c6973c24	9206	Križevci
00050000-5591-2ce4-f227-a11560b609cb	9242	Križevci pri Ljutomeru
00050000-5591-2ce4-1f8b-ba3c66fb2b1b	1301	Krka
00050000-5591-2ce4-7f6b-51399b245104	8296	Krmelj
00050000-5591-2ce4-ac50-b4f16a9f8df6	4245	Kropa
00050000-5591-2ce4-82a6-c912f00e7ffa	8262	Krška vas
00050000-5591-2ce4-8421-0833dbd1f27e	8270	Krško
00050000-5591-2ce4-cbda-bd6e6f6df66b	9263	Kuzma
00050000-5591-2ce4-1711-13078daaa4f7	2318	Laporje
00050000-5591-2ce4-5ede-8d0365d8a13f	3270	Laško
00050000-5591-2ce4-61e9-d53f551f3a28	1219	Laze v Tuhinju
00050000-5591-2ce4-c42d-bea69034389f	2230	Lenart v Slovenskih goricah
00050000-5591-2ce4-5538-55a148c72517	9220	Lendava/Lendva
00050000-5591-2ce4-f480-34ca8e1331b3	4248	Lesce
00050000-5591-2ce4-e9ec-828711c343ba	3261	Lesično
00050000-5591-2ce4-b04d-95a2b7eccfe5	8273	Leskovec pri Krškem
00050000-5591-2ce4-8856-4963676292e0	2372	Libeliče
00050000-5591-2ce4-6da8-ae093069cd24	2341	Limbuš
00050000-5591-2ce4-b870-b37aa4ef499b	1270	Litija
00050000-5591-2ce4-3c22-05d680a6a21b	3202	Ljubečna
00050000-5591-2ce4-c0c2-7d56dc74e908	1000	Ljubljana 
00050000-5591-2ce4-109b-72cd1b577387	1001	Ljubljana - poštni predali
00050000-5591-2ce4-d6e4-85b7207d002a	1231	Ljubljana - Črnuče
00050000-5591-2ce4-30ad-c551d2ac729e	1261	Ljubljana - Dobrunje
00050000-5591-2ce4-7645-cfae8b553183	1260	Ljubljana - Polje
00050000-5591-2ce4-bd53-83e73cfdd788	1210	Ljubljana - Šentvid
00050000-5591-2ce4-9bdc-752ee0af2e88	1211	Ljubljana - Šmartno
00050000-5591-2ce4-82cc-6a157cc86bb3	3333	Ljubno ob Savinji
00050000-5591-2ce4-201d-1cc4066f7531	9240	Ljutomer
00050000-5591-2ce4-6fbe-e685cfbae99b	3215	Loče
00050000-5591-2ce4-de74-bde8015e231d	5231	Log pod Mangartom
00050000-5591-2ce4-c9a8-4b4a99c18aff	1358	Log pri Brezovici
00050000-5591-2ce4-0fc7-c23306e37caf	1370	Logatec
00050000-5591-2ce4-8531-8cf553053a07	1371	Logatec
00050000-5591-2ce4-ab83-3732554bb928	1434	Loka pri Zidanem Mostu
00050000-5591-2ce4-9600-993d89464e8f	3223	Loka pri Žusmu
00050000-5591-2ce4-6578-3956ec864813	6219	Lokev
00050000-5591-2ce4-d5eb-aabba2b5d822	1318	Loški Potok
00050000-5591-2ce4-36bc-1925833c6477	2324	Lovrenc na Dravskem polju
00050000-5591-2ce4-4e87-802867308dd6	2344	Lovrenc na Pohorju
00050000-5591-2ce4-5380-46f949d9a738	3334	Luče
00050000-5591-2ce4-7bb8-d3535630b186	1225	Lukovica
00050000-5591-2ce4-3d19-e33065c6ded0	9202	Mačkovci
00050000-5591-2ce4-bef5-645d48527e4d	2322	Majšperk
00050000-5591-2ce4-eebe-c1addef12a23	2321	Makole
00050000-5591-2ce4-07e3-8cde9831f90d	9243	Mala Nedelja
00050000-5591-2ce4-cd71-b51508844b92	2229	Malečnik
00050000-5591-2ce4-89ba-55a6e7c56c4a	6273	Marezige
00050000-5591-2ce4-a2ea-5a8be3a00d5c	2000	Maribor 
00050000-5591-2ce4-eee0-284ebe507048	2001	Maribor - poštni predali
00050000-5591-2ce4-64f6-19a2f7cfcbec	2206	Marjeta na Dravskem polju
00050000-5591-2ce4-8ee7-08b81dc4fcb3	2281	Markovci
00050000-5591-2ce4-6214-a71a9ddcbf51	9221	Martjanci
00050000-5591-2ce4-e021-786c8c4fecfc	6242	Materija
00050000-5591-2ce4-7f5f-f91c9cebfc37	4211	Mavčiče
00050000-5591-2ce4-f46a-7b7cbe7250b6	1215	Medvode
00050000-5591-2ce4-554b-1608d6b74009	1234	Mengeš
00050000-5591-2ce4-78a3-d7955c035efd	8330	Metlika
00050000-5591-2ce4-ac46-8f3b229b53f6	2392	Mežica
00050000-5591-2ce4-2737-b176b9602012	2204	Miklavž na Dravskem polju
00050000-5591-2ce4-2479-9197b71bca2c	2275	Miklavž pri Ormožu
00050000-5591-2ce4-bd5d-27116299366e	5291	Miren
00050000-5591-2ce4-5b96-1e25da0f6471	8233	Mirna
00050000-5591-2ce4-1ea3-d3f99efc047a	8216	Mirna Peč
00050000-5591-2ce4-0fad-8c0e41ef00f0	2382	Mislinja
00050000-5591-2ce4-ff2e-672e2f014e14	4281	Mojstrana
00050000-5591-2ce4-51a1-d400fb306483	8230	Mokronog
00050000-5591-2ce4-002d-71e42826d7cd	1251	Moravče
00050000-5591-2ce4-afe7-fddc9ee59b5f	9226	Moravske Toplice
00050000-5591-2ce4-31db-0559637b422c	5216	Most na Soči
00050000-5591-2ce4-e404-943dc74ed4f8	1221	Motnik
00050000-5591-2ce4-0c90-2c468c253653	3330	Mozirje
00050000-5591-2ce4-a5f5-b9fda327018d	9000	Murska Sobota 
00050000-5591-2ce4-5c59-46a8cceb294c	9001	Murska Sobota - poštni predali
00050000-5591-2ce4-bf85-9889574e6586	2366	Muta
00050000-5591-2ce4-c117-91a4657f9ad3	4202	Naklo
00050000-5591-2ce4-ad14-79508d4289ef	3331	Nazarje
00050000-5591-2ce4-e90f-b0af685fdf59	1357	Notranje Gorice
00050000-5591-2ce4-568b-fb16506f3dc7	3203	Nova Cerkev
00050000-5591-2ce4-863e-7ebf71a2d4f1	5000	Nova Gorica 
00050000-5591-2ce4-d624-0825988fa4d8	5001	Nova Gorica - poštni predali
00050000-5591-2ce4-38a7-34c33c5d84bf	1385	Nova vas
00050000-5591-2ce4-46f3-1ce8b92b626e	8000	Novo mesto
00050000-5591-2ce4-2b06-417f657bbab3	8001	Novo mesto - poštni predali
00050000-5591-2ce4-c61f-aaa746f6c26b	6243	Obrov
00050000-5591-2ce4-24b1-1b0c92c0a0a8	9233	Odranci
00050000-5591-2ce4-642f-5c2f1a39e224	2317	Oplotnica
00050000-5591-2ce4-c33e-8764475a5121	2312	Orehova vas
00050000-5591-2ce4-d04a-8d9fae4079bf	2270	Ormož
00050000-5591-2ce4-4155-9fbdd7260653	1316	Ortnek
00050000-5591-2ce4-f320-c2f534f2372a	1337	Osilnica
00050000-5591-2ce4-af33-b1131070a94b	8222	Otočec
00050000-5591-2ce4-0a54-ff6ba6c45b1c	2361	Ožbalt
00050000-5591-2ce4-d17f-8be82f443c43	2231	Pernica
00050000-5591-2ce4-0ab4-fe5fe306c068	2211	Pesnica pri Mariboru
00050000-5591-2ce4-aad4-81d47a1c7048	9203	Petrovci
00050000-5591-2ce4-1a7b-777add2eb78e	3301	Petrovče
00050000-5591-2ce4-a818-f146c537d26e	6330	Piran/Pirano
00050000-5591-2ce4-f6f1-50f32f427b72	8255	Pišece
00050000-5591-2ce4-f3de-68aba1251372	6257	Pivka
00050000-5591-2ce4-ff70-5140e27839ed	6232	Planina
00050000-5591-2ce4-ed70-b0a3b47c4bdf	3225	Planina pri Sevnici
00050000-5591-2ce4-2d33-0d8ebb7c8eca	6276	Pobegi
00050000-5591-2ce4-8245-3a3ab04cc3bd	8312	Podbočje
00050000-5591-2ce4-8ff7-670ea7c6860d	5243	Podbrdo
00050000-5591-2ce4-c8c5-a053009e25b0	3254	Podčetrtek
00050000-5591-2ce4-5fcc-5418559d1cc9	2273	Podgorci
00050000-5591-2ce4-476c-eab532b25c51	6216	Podgorje
00050000-5591-2ce4-2092-a3000e8af601	2381	Podgorje pri Slovenj Gradcu
00050000-5591-2ce4-2a87-c4cfabcc7616	6244	Podgrad
00050000-5591-2ce4-f1e7-b827de28aea9	1414	Podkum
00050000-5591-2ce4-5396-17aa119a9c8a	2286	Podlehnik
00050000-5591-2ce4-945f-3cfb48a46b75	5272	Podnanos
00050000-5591-2ce4-2e05-a1b8bc3e8cc6	4244	Podnart
00050000-5591-2ce4-c842-5f1e547dedbb	3241	Podplat
00050000-5591-2ce4-f831-a26e5e1d7360	3257	Podsreda
00050000-5591-2ce4-b20e-71366118a09e	2363	Podvelka
00050000-5591-2ce4-5dd7-8d9b586dd920	2208	Pohorje
00050000-5591-2ce4-b4b8-d1db3cda1088	2257	Polenšak
00050000-5591-2ce4-0def-bbedea4f6843	1355	Polhov Gradec
00050000-5591-2ce4-f535-7f9cc4a08475	4223	Poljane nad Škofjo Loko
00050000-5591-2ce4-ea93-1e51e74d18be	2319	Poljčane
00050000-5591-2ce4-4033-15bfe45ba143	1272	Polšnik
00050000-5591-2ce4-b6de-299273a3a2c3	3313	Polzela
00050000-5591-2ce4-994f-9544b1bb22e6	3232	Ponikva
00050000-5591-2ce4-17a3-4263cb7f89a6	6320	Portorož/Portorose
00050000-5591-2ce4-29f0-6f1cdfdf2922	6230	Postojna
00050000-5591-2ce4-f53e-e4630518e03c	2331	Pragersko
00050000-5591-2ce4-fb40-ad7d9a260811	3312	Prebold
00050000-5591-2ce4-09bd-372b0f45d3f6	4205	Preddvor
00050000-5591-2ce4-42a9-d22dd43281b1	6255	Prem
00050000-5591-2ce4-46cc-bbd5732020be	1352	Preserje
00050000-5591-2ce4-6309-94dfec7a4619	6258	Prestranek
00050000-5591-2ce4-71ac-24d5e6032c4d	2391	Prevalje
00050000-5591-2ce4-3775-a529d0429e5a	3262	Prevorje
00050000-5591-2ce4-6caa-b29b26fa3364	1276	Primskovo 
00050000-5591-2ce4-4aaf-b3da4f09df8f	3253	Pristava pri Mestinju
00050000-5591-2ce4-8c23-e83e91693d3b	9207	Prosenjakovci/Partosfalva
00050000-5591-2ce4-d613-2cda312d8318	5297	Prvačina
00050000-5591-2ce4-1a7c-85975ebbc145	2250	Ptuj
00050000-5591-2ce4-9a2c-1ed5d4767d0c	2323	Ptujska Gora
00050000-5591-2ce4-13d9-360c80dc3c16	9201	Puconci
00050000-5591-2ce4-25d0-fcd07b81ad96	2327	Rače
00050000-5591-2ce4-1d4a-3409fbf0450a	1433	Radeče
00050000-5591-2ce4-7e5f-e717622ee933	9252	Radenci
00050000-5591-2ce4-b8de-08a8950133bf	2360	Radlje ob Dravi
00050000-5591-2ce4-bded-7910cada4254	1235	Radomlje
00050000-5591-2ce4-2ecc-a8d3d9c9d466	4240	Radovljica
00050000-5591-2ce4-05e9-c834a8ea2121	8274	Raka
00050000-5591-2ce4-f417-f7ec0a0e8acc	1381	Rakek
00050000-5591-2ce4-4a75-d4c6420097e9	4283	Rateče - Planica
00050000-5591-2ce4-b1bf-980b933bc8ff	2390	Ravne na Koroškem
00050000-5591-2ce4-7ebe-4f795607d269	9246	Razkrižje
00050000-5591-2ce4-8ec6-499a3e04d4cf	3332	Rečica ob Savinji
00050000-5591-2ce4-4513-1bb8d5a79a88	5292	Renče
00050000-5591-2ce4-5157-1611c900ea63	1310	Ribnica
00050000-5591-2ce4-af5a-487e24ac795f	2364	Ribnica na Pohorju
00050000-5591-2ce4-1c1a-4ec5aff9d6ef	3272	Rimske Toplice
00050000-5591-2ce4-97d2-309202fafc07	1314	Rob
00050000-5591-2ce4-96e5-fdd103ca9755	5215	Ročinj
00050000-5591-2ce4-80fd-379a43ad19a5	3250	Rogaška Slatina
00050000-5591-2ce4-7018-e580ee001f61	9262	Rogašovci
00050000-5591-2ce4-9e6b-44d3f3234799	3252	Rogatec
00050000-5591-2ce4-534f-cd28da169742	1373	Rovte
00050000-5591-2ce4-e09a-cea2a6cca518	2342	Ruše
00050000-5591-2ce4-c6b1-bda4dbaea19d	1282	Sava
00050000-5591-2ce4-0cb8-1a4f388690d9	6333	Sečovlje/Sicciole
00050000-5591-2ce4-fb35-2e09e878169b	4227	Selca
00050000-5591-2ce4-5547-35c0b694f706	2352	Selnica ob Dravi
00050000-5591-2ce4-f906-32f67c005b1f	8333	Semič
00050000-5591-2ce4-d5ed-5d8f1295899d	8281	Senovo
00050000-5591-2ce4-c431-56b0d2ededa1	6224	Senožeče
00050000-5591-2ce4-978f-cdbd33d19ff6	8290	Sevnica
00050000-5591-2ce4-ebe7-cc1a56cfc3f0	6210	Sežana
00050000-5591-2ce4-fc35-2ad924fa8df0	2214	Sladki Vrh
00050000-5591-2ce4-6919-7cd4bfaf5fc6	5283	Slap ob Idrijci
00050000-5591-2ce4-ad6b-69ee7a7c56b4	2380	Slovenj Gradec
00050000-5591-2ce4-ce14-25fee38c2992	2310	Slovenska Bistrica
00050000-5591-2ce4-d315-6fb546bc0cb5	3210	Slovenske Konjice
00050000-5591-2ce4-9e75-47bf00213ab1	1216	Smlednik
00050000-5591-2ce4-3a19-50c94113ac51	5232	Soča
00050000-5591-2ce4-bd7a-513773d7724e	1317	Sodražica
00050000-5591-2ce4-d50a-07441e7f8648	3335	Solčava
00050000-5591-2ce4-6df6-a85e082ea1e7	5250	Solkan
00050000-5591-2ce4-8fa4-4020ff3f116d	4229	Sorica
00050000-5591-2ce4-9241-80b6d92fbbcd	4225	Sovodenj
00050000-5591-2ce4-4e62-792994a8139c	5281	Spodnja Idrija
00050000-5591-2ce4-2a82-cf6a89054959	2241	Spodnji Duplek
00050000-5591-2ce4-ccc6-5e1e5e973a6c	9245	Spodnji Ivanjci
00050000-5591-2ce4-94bb-b0d9a846d4f2	2277	Središče ob Dravi
00050000-5591-2ce4-3cc8-45362e8e387e	4267	Srednja vas v Bohinju
00050000-5591-2ce4-07ab-f70de5dfa6e9	8256	Sromlje 
00050000-5591-2ce4-bc2d-68c087cf879f	5224	Srpenica
00050000-5591-2ce4-648c-161fa51ac472	1242	Stahovica
00050000-5591-2ce4-8685-5bc64ff24d59	1332	Stara Cerkev
00050000-5591-2ce4-e8ab-5b02e21ffaff	8342	Stari trg ob Kolpi
00050000-5591-2ce4-ae2b-b181df119ca5	1386	Stari trg pri Ložu
00050000-5591-2ce4-fe0e-05cf441878b1	2205	Starše
00050000-5591-2ce4-6e3b-2400e57aa3ff	2289	Stoperce
00050000-5591-2ce4-6078-d0c854d238a2	8322	Stopiče
00050000-5591-2ce4-40a1-3b7ae1217ab3	3206	Stranice
00050000-5591-2ce4-6a7b-68f2ede25d23	8351	Straža
00050000-5591-2ce4-96f3-17d2a8dc7ab3	1313	Struge
00050000-5591-2ce4-8348-34862bebab59	8293	Studenec
00050000-5591-2ce4-a6b6-9ed0d0e65227	8331	Suhor
00050000-5591-2ce4-9142-1806dba9059e	2233	Sv. Ana v Slovenskih goricah
00050000-5591-2ce4-0c38-802a177ed64a	2235	Sv. Trojica v Slovenskih goricah
00050000-5591-2ce4-aacd-4d715181805f	2353	Sveti Duh na Ostrem Vrhu
00050000-5591-2ce4-25f7-ddf440c4ea64	9244	Sveti Jurij ob Ščavnici
00050000-5591-2ce4-1fa1-30cabf488631	3264	Sveti Štefan
00050000-5591-2ce4-1aea-fe5403993520	2258	Sveti Tomaž
00050000-5591-2ce4-a9b7-5f7f58a0b1b0	9204	Šalovci
00050000-5591-2ce4-12c1-ce280a340fa6	5261	Šempas
00050000-5591-2ce4-6ecb-0feb79f33e45	5290	Šempeter pri Gorici
00050000-5591-2ce4-9e7e-0fc1ed919b0e	3311	Šempeter v Savinjski dolini
00050000-5591-2ce4-5cea-9a48b06938a0	4208	Šenčur
00050000-5591-2ce4-a42b-c94f528ffc13	2212	Šentilj v Slovenskih goricah
00050000-5591-2ce4-fa99-13d3d3c03c7a	8297	Šentjanž
00050000-5591-2ce4-b001-c86f7b79cf43	2373	Šentjanž pri Dravogradu
00050000-5591-2ce4-641d-bce865a260d3	8310	Šentjernej
00050000-5591-2ce4-8d7c-5cc2765b91bb	3230	Šentjur
00050000-5591-2ce4-edfa-92a7a6cdb1df	3271	Šentrupert
00050000-5591-2ce4-362c-659458dfe2a3	8232	Šentrupert
00050000-5591-2ce4-de8c-ad96b3ae57d3	1296	Šentvid pri Stični
00050000-5591-2ce4-8400-37ea93eb0fdf	8275	Škocjan
00050000-5591-2ce4-b9f9-2cb731a80a06	6281	Škofije
00050000-5591-2ce4-2ba1-df5c4db73093	4220	Škofja Loka
00050000-5591-2ce4-59f9-a4fe219c09cd	3211	Škofja vas
00050000-5591-2ce4-d198-8ac532cb343d	1291	Škofljica
00050000-5591-2ce4-619e-13f9681619ea	6274	Šmarje
00050000-5591-2ce4-acfd-bfeb46420fc1	1293	Šmarje - Sap
00050000-5591-2ce4-4fc6-0ad6b8d300c0	3240	Šmarje pri Jelšah
00050000-5591-2ce4-d4e5-fb31feae2299	8220	Šmarješke Toplice
00050000-5591-2ce4-8359-8713888291e1	2315	Šmartno na Pohorju
00050000-5591-2ce4-c871-20d37f41370f	3341	Šmartno ob Dreti
00050000-5591-2ce4-3c7e-680476986b9a	3327	Šmartno ob Paki
00050000-5591-2ce4-92b6-4c72b85f8686	1275	Šmartno pri Litiji
00050000-5591-2ce4-8f81-81c042b7e0b3	2383	Šmartno pri Slovenj Gradcu
00050000-5591-2ce4-617a-0da06f3bad19	3201	Šmartno v Rožni dolini
00050000-5591-2ce4-b861-50357da72988	3325	Šoštanj
00050000-5591-2ce4-a428-3153a01f273e	6222	Štanjel
00050000-5591-2ce4-d579-46a83df8f037	3220	Štore
00050000-5591-2ce4-4cb5-09cafd549396	3304	Tabor
00050000-5591-2ce4-8774-5ab972c5c7cf	3221	Teharje
00050000-5591-2ce4-fe63-412fa6d4fc18	9251	Tišina
00050000-5591-2ce4-19f1-c59d46731fba	5220	Tolmin
00050000-5591-2ce4-4ab6-7d99a8c6f549	3326	Topolšica
00050000-5591-2ce4-e668-7e34567b3fe3	2371	Trbonje
00050000-5591-2ce4-8ed7-7e4e741f9b61	1420	Trbovlje
00050000-5591-2ce4-fd99-f60438ee59db	8231	Trebelno 
00050000-5591-2ce4-45a1-1a31dc0c64d2	8210	Trebnje
00050000-5591-2ce4-7761-d81f14984ca3	5252	Trnovo pri Gorici
00050000-5591-2ce4-a00a-d7b871b3dc0e	2254	Trnovska vas
00050000-5591-2ce4-2e70-22010daa41d5	1222	Trojane
00050000-5591-2ce4-d10d-4ef42699cc4c	1236	Trzin
00050000-5591-2ce4-48ce-a3ddb631aab8	4290	Tržič
00050000-5591-2ce4-1050-31f38ac6e5fb	8295	Tržišče
00050000-5591-2ce4-e043-894bcb8d27ef	1311	Turjak
00050000-5591-2ce4-f139-2cf13bf2ec81	9224	Turnišče
00050000-5591-2ce4-b12e-576c6baba5ec	8323	Uršna sela
00050000-5591-2ce4-076c-f2e0fede1e74	1252	Vače
00050000-5591-2ce4-a79a-1a4df4aba4b1	3320	Velenje 
00050000-5591-2ce4-68ae-ab2ddea7d58f	3322	Velenje - poštni predali
00050000-5591-2ce4-8b78-3a0fbfe5627c	8212	Velika Loka
00050000-5591-2ce4-bdbf-7efce69d8d29	2274	Velika Nedelja
00050000-5591-2ce4-73d8-5bdb9e08d32f	9225	Velika Polana
00050000-5591-2ce4-08ea-67d18d9abc27	1315	Velike Lašče
00050000-5591-2ce4-e57e-3ccd255bd2d1	8213	Veliki Gaber
00050000-5591-2ce4-f80a-75d0bde06482	9241	Veržej
00050000-5591-2ce4-ca69-883d7aa0c9be	1312	Videm - Dobrepolje
00050000-5591-2ce4-a35c-2256d9575136	2284	Videm pri Ptuju
00050000-5591-2ce4-86e6-acffcef3e980	8344	Vinica
00050000-5591-2ce4-f8b3-b97d8f0ce719	5271	Vipava
00050000-5591-2ce4-e862-2d0b93b177b5	4212	Visoko
00050000-5591-2ce4-6e20-6bc100122565	1294	Višnja Gora
00050000-5591-2ce4-e607-79cc4932ba32	3205	Vitanje
00050000-5591-2ce4-64e9-0bba73d00c60	2255	Vitomarci
00050000-5591-2ce4-c364-022c5b26a798	1217	Vodice
00050000-5591-2ce4-daab-71fdd2b8ab70	3212	Vojnik\t
00050000-5591-2ce4-d07c-0df5e57b4108	5293	Volčja Draga
00050000-5591-2ce4-d5cd-5d70aa5c0143	2232	Voličina
00050000-5591-2ce4-1a89-835b7b31d396	3305	Vransko
00050000-5591-2ce4-2a6b-0f353d58318d	6217	Vremski Britof
00050000-5591-2ce4-5625-ed3bd2237ef0	1360	Vrhnika
00050000-5591-2ce4-9dfc-2dd76ae8dbac	2365	Vuhred
00050000-5591-2ce4-123a-3897efa59345	2367	Vuzenica
00050000-5591-2ce4-708e-92a52c4cc26a	8292	Zabukovje 
00050000-5591-2ce4-3c5c-b182167aa1b3	1410	Zagorje ob Savi
00050000-5591-2ce4-dcaf-d76bc2c9501e	1303	Zagradec
00050000-5591-2ce4-dfd7-9fb1ef088d47	2283	Zavrč
00050000-5591-2ce4-1bfb-748f2d181364	8272	Zdole 
00050000-5591-2ce4-7e49-9aaed5bdd311	4201	Zgornja Besnica
00050000-5591-2ce4-f1b3-c6add1c564c9	2242	Zgornja Korena
00050000-5591-2ce4-abaa-7636d4e24476	2201	Zgornja Kungota
00050000-5591-2ce4-0006-c932905502be	2316	Zgornja Ložnica
00050000-5591-2ce4-a5df-6b0b31c8486f	2314	Zgornja Polskava
00050000-5591-2ce4-6a1c-07db88520b51	2213	Zgornja Velka
00050000-5591-2ce4-55f4-bd88c6c3225f	4247	Zgornje Gorje
00050000-5591-2ce4-d581-66072c5f42bc	4206	Zgornje Jezersko
00050000-5591-2ce4-f820-d898d0c7580e	2285	Zgornji Leskovec
00050000-5591-2ce4-3240-6dfb569cf24e	1432	Zidani Most
00050000-5591-2ce4-b240-41b1f54a744a	3214	Zreče
00050000-5591-2ce4-c211-e00a876ae5ee	4209	Žabnica
00050000-5591-2ce4-6836-ff501651f905	3310	Žalec
00050000-5591-2ce4-b87f-4c6a94347205	4228	Železniki
00050000-5591-2ce4-dc01-d26cb2bea829	2287	Žetale
00050000-5591-2ce4-8568-c6a2e93b79b3	4226	Žiri
00050000-5591-2ce4-6b54-06cd0dc8d1c7	4274	Žirovnica
00050000-5591-2ce4-cb24-64b5ab13e59c	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8428644)
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
-- TOC entry 2853 (class 0 OID 8428455)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8428533)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8428656)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8428776)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8428825)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5591-2ce5-46a6-fba14a0699dc	00080000-5591-2ce5-37dc-ba2aa6f7e0c8	0900	AK
00190000-5591-2ce5-ee99-52e4025f0e13	00080000-5591-2ce5-7bf5-d1b05945a509	0987	A
00190000-5591-2ce5-e096-35d2d9f94bfd	00080000-5591-2ce5-777c-d77d7b1b1cd9	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8428959)
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
-- TOC entry 2877 (class 0 OID 8428685)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5591-2ce5-caa8-ec478df45869	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5591-2ce5-3141-6dd520671463	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5591-2ce5-4b18-f7ac0c96a95c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5591-2ce5-fb7c-11e873f12d62	0004	Mali oder	t	24	Mali oder 
00220000-5591-2ce5-8114-ff4c9609d4a9	0005	Komorni oder	t	15	Komorni oder
00220000-5591-2ce5-8899-89ce46c2c700	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5591-2ce5-12bc-0634d3a21e14	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8428629)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8428619)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8428814)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8428753)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8428327)
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
-- TOC entry 2878 (class 0 OID 8428695)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8428365)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5591-2ce4-45ff-0b0860b3ee75	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5591-2ce4-2672-bffdb24ee536	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5591-2ce4-d58d-0ba83adf9c9a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5591-2ce4-3ddc-0512c9f58353	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5591-2ce4-7dd5-f4ab9b34ed90	planer	Planer dogodkov v koledarju	t
00020000-5591-2ce4-4953-bb4ccfb9f187	kadrovska	Kadrovska služba	t
00020000-5591-2ce4-ac09-7349f9230d45	arhivar	Ažuriranje arhivalij	t
00020000-5591-2ce4-f31c-b4ebb41f6f97	igralec	Igralec	t
00020000-5591-2ce4-4d95-a0fce3c46b7a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5591-2ce5-565a-be52105b4d24	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8428349)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5591-2ce4-5ca4-20d83c6dbe80	00020000-5591-2ce4-d58d-0ba83adf9c9a
00010000-5591-2ce4-e57c-da965aa03876	00020000-5591-2ce4-d58d-0ba83adf9c9a
00010000-5591-2ce5-f1bf-7e149fab24f8	00020000-5591-2ce5-565a-be52105b4d24
\.


--
-- TOC entry 2880 (class 0 OID 8428709)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8428650)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8428600)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8429003)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5591-2ce4-8381-7a4a7a6cda5c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5591-2ce4-e5f0-179b235df0b7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5591-2ce4-da0d-4fa114163ae3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5591-2ce4-ae29-49db372dcc27	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5591-2ce4-b121-70731384b29c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8428995)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5591-2ce4-1019-3e078b22d56b	00230000-5591-2ce4-ae29-49db372dcc27	popa
00240000-5591-2ce4-1c62-4dc799ff37ac	00230000-5591-2ce4-ae29-49db372dcc27	oseba
00240000-5591-2ce4-8a65-f3c9597155ed	00230000-5591-2ce4-e5f0-179b235df0b7	prostor
00240000-5591-2ce4-6ddf-227a221aa850	00230000-5591-2ce4-ae29-49db372dcc27	besedilo
00240000-5591-2ce4-d1ce-1f437d57ad9c	00230000-5591-2ce4-ae29-49db372dcc27	uprizoritev
00240000-5591-2ce4-84a2-16c44c5d1585	00230000-5591-2ce4-ae29-49db372dcc27	funkcija
00240000-5591-2ce4-8920-1c263acfa6e7	00230000-5591-2ce4-ae29-49db372dcc27	tipfunkcije
00240000-5591-2ce4-9aed-c0cc4c95f266	00230000-5591-2ce4-ae29-49db372dcc27	alternacija
00240000-5591-2ce4-1af2-cff518019be7	00230000-5591-2ce4-8381-7a4a7a6cda5c	pogodba
00240000-5591-2ce4-253c-81e4ed4424e7	00230000-5591-2ce4-ae29-49db372dcc27	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8428990)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8428763)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5591-2ce5-dc3e-4d3838208d38	000e0000-5591-2ce5-6598-9879ef184e0c	00080000-5591-2ce5-3cc4-862d59826b30	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5591-2ce5-0ff3-33157f07c02b	000e0000-5591-2ce5-6598-9879ef184e0c	00080000-5591-2ce5-3cc4-862d59826b30	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5591-2ce5-3baf-f0fc0a9cfb5b	000e0000-5591-2ce5-6598-9879ef184e0c	00080000-5591-2ce5-588e-2856a93e7f09	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8428427)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8428606)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5591-2ce5-5f5a-09ad81bd17c8	00180000-5591-2ce5-ad7e-98d3471aa939	000c0000-5591-2ce5-0c29-d5f4cb24a3a9	00090000-5591-2ce5-90cd-6057d7fca07b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-2ce5-c4a2-11400d6657d1	00180000-5591-2ce5-ad7e-98d3471aa939	000c0000-5591-2ce5-51ef-03d1badc96d0	00090000-5591-2ce5-7c9a-612d019cc7f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-2ce5-66da-87c7d6572fd6	00180000-5591-2ce5-ad7e-98d3471aa939	000c0000-5591-2ce5-d479-448eba99591f	00090000-5591-2ce5-0bbb-0a5230083225	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-2ce5-7ce6-daa9d311b220	00180000-5591-2ce5-ad7e-98d3471aa939	000c0000-5591-2ce5-ca8d-3947af979f88	00090000-5591-2ce5-f7a9-5752ef8760c3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-2ce5-4135-510c42297acf	00180000-5591-2ce5-ad7e-98d3471aa939	000c0000-5591-2ce5-70c1-8aa8c85845ae	00090000-5591-2ce5-e702-31f0f2478f47	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5591-2ce5-f583-60cac0fcefce	00180000-5591-2ce5-cb9d-395e196a91e1	\N	00090000-5591-2ce5-e702-31f0f2478f47	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8428803)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5591-2ce4-abef-9d2ae77e7726	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5591-2ce4-33bb-7543f3b89a8f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5591-2ce4-f4e6-d8a6fad98c92	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5591-2ce4-c689-236b0175bd79	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5591-2ce4-88fe-d6c380a80c8a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5591-2ce4-9bf5-a6bb43fcb36d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5591-2ce4-8262-a065cc60279d	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5591-2ce4-4e13-5ccac04466ec	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5591-2ce4-0a85-05df3088adc0	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5591-2ce4-5616-e3b19af57829	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5591-2ce4-71d7-dfd6aa578f97	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5591-2ce4-f783-4d10225ffef9	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5591-2ce4-5f47-9b33709512c8	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5591-2ce4-8a36-aa5e11991965	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5591-2ce4-f44b-65fbacfb671b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5591-2ce4-fcf6-5f175570a853	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8428972)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5591-2ce4-f79b-957bc052480b	01	Velika predstava	f	1.00	1.00
002b0000-5591-2ce4-23b7-0223cf2a4350	02	Mala predstava	f	0.50	0.50
002b0000-5591-2ce4-481b-dea24c3833de	03	Mala koprodukcija	t	0.40	1.00
002b0000-5591-2ce4-4659-3418c6e7e179	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5591-2ce4-fae7-d5fd260d442c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8428490)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8428336)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5591-2ce4-e57c-da965aa03876	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfZUfC.0WTZszpH6KaJ3twfG7HZeV2Vm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-c17b-7271f010928d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-3b81-97ca3fc65739	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-f7b1-93664e168aaa	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-634b-b66f973d1d37	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-12ba-96ff885d86e6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-ab3c-c77135f0473f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-24da-e72ac624659f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-db61-90251c5926d1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-2e18-f71ddc05f96d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5591-2ce5-f1bf-7e149fab24f8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5591-2ce4-5ca4-20d83c6dbe80	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8428860)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5591-2ce5-c1aa-5111e2ac48e9	00160000-5591-2ce5-806f-9f6ab2e1fa5f	00150000-5591-2ce4-ecf6-34da3d720a81	00140000-5591-2ce3-6ce3-be1eae8da332	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5591-2ce5-8114-ff4c9609d4a9
000e0000-5591-2ce5-6598-9879ef184e0c	00160000-5591-2ce5-dbf3-5ff85db87ffe	00150000-5591-2ce4-3d32-2b99b29c3886	00140000-5591-2ce3-59d8-f4b536cf5813	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5591-2ce5-8899-89ce46c2c700
000e0000-5591-2ce5-0e05-6d1267075a2b	\N	00150000-5591-2ce4-3d32-2b99b29c3886	00140000-5591-2ce3-59d8-f4b536cf5813	00190000-5591-2ce5-ee99-52e4025f0e13	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5591-2ce5-8114-ff4c9609d4a9
000e0000-5591-2ce5-279a-72717b48c900	\N	00150000-5591-2ce4-3d32-2b99b29c3886	00140000-5591-2ce3-59d8-f4b536cf5813	00190000-5591-2ce5-ee99-52e4025f0e13	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5591-2ce5-8114-ff4c9609d4a9
\.


--
-- TOC entry 2861 (class 0 OID 8428552)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5591-2ce5-4902-891744a6b524	000e0000-5591-2ce5-6598-9879ef184e0c	1	
00200000-5591-2ce5-caea-bfd31a3b74fa	000e0000-5591-2ce5-6598-9879ef184e0c	2	
\.


--
-- TOC entry 2876 (class 0 OID 8428677)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8428746)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8428584)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8428850)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5591-2ce3-6ce3-be1eae8da332	01	Drama	drama (SURS 01)
00140000-5591-2ce3-1cfd-5e2c913fb2d7	02	Opera	opera (SURS 02)
00140000-5591-2ce3-62e2-df8dcf681695	03	Balet	balet (SURS 03)
00140000-5591-2ce3-01f3-2bd514efeceb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5591-2ce3-43b1-98731f98eebc	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5591-2ce3-59d8-f4b536cf5813	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5591-2ce3-2dcf-6b3b67094dbb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8428736)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5591-2ce4-96c5-0d85839d6fad	01	Opera	opera
00150000-5591-2ce4-9f0b-0b90de0daac9	02	Opereta	opereta
00150000-5591-2ce4-67b5-ea35ec4f5108	03	Balet	balet
00150000-5591-2ce4-98dc-49703c95400f	04	Plesne prireditve	plesne prireditve
00150000-5591-2ce4-570b-da536cd98af8	05	Lutkovno gledališče	lutkovno gledališče
00150000-5591-2ce4-d6c4-fdeaf2370890	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5591-2ce4-e2ac-263bdf48b23d	07	Biografska drama	biografska drama
00150000-5591-2ce4-ecf6-34da3d720a81	08	Komedija	komedija
00150000-5591-2ce4-80d3-fc5524f886e3	09	Črna komedija	črna komedija
00150000-5591-2ce4-e060-39231db0963c	10	E-igra	E-igra
00150000-5591-2ce4-3d32-2b99b29c3886	11	Kriminalka	kriminalka
00150000-5591-2ce4-e4ee-b1460da1d580	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8428390)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8428907)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8428897)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8428802)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8428574)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8428599)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8428988)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8428516)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8428954)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8428732)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8428550)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8428593)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8428530)
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
-- TOC entry 2527 (class 2606 OID 8428642)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8428669)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8428488)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8428399)
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
-- TOC entry 2442 (class 2606 OID 8428423)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8428379)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8428364)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8428675)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8428708)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8428845)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8428452)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8428476)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8428648)
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
-- TOC entry 2457 (class 2606 OID 8428466)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8428537)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8428660)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8428784)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8428830)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8428970)
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
-- TOC entry 2547 (class 2606 OID 8428692)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8428633)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8428624)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8428824)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8428760)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8428335)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8428699)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8428353)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8428373)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8428717)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8428655)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8428605)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8429012)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8429000)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8428994)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8428773)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8428432)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8428615)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8428813)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8428982)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8428501)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8428348)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8428876)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8428559)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8428683)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8428751)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8428588)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8428858)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8428744)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8428581)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8428774)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8428775)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8428454)
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
-- TOC entry 2540 (class 1259 OID 8428676)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8428662)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8428661)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8428560)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8428733)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8428735)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8428734)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8428532)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8428531)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8428847)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8428848)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8428849)
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
-- TOC entry 2602 (class 1259 OID 8428881)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8428878)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8428882)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8428880)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8428879)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8428503)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8428502)
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
-- TOC entry 2440 (class 1259 OID 8428426)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8428700)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8428594)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8428380)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8428381)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8428720)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8428719)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8428718)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8428538)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8428540)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8428539)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8429002)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8428628)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8428626)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8428625)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8428627)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8428354)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8428355)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8428684)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8428649)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8428761)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8428762)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8428958)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8428955)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8428956)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8428957)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8428468)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8428467)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8428469)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8428785)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8428786)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8428911)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8428912)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8428909)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8428910)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8428752)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8428637)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8428636)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8428634)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8428635)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8428899)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8428898)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8428971)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8428551)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8428989)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8428401)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8428400)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8428433)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8428434)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8428618)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8428617)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8428616)
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
-- TOC entry 2492 (class 1259 OID 8428583)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8428579)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8428576)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8428577)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8428575)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8428580)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8428578)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8428453)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8428517)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8428519)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8428518)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8428520)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8428643)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8428846)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8428877)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8428424)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8428425)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8428745)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8429013)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8428489)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8429001)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8428694)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8428693)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8428908)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8428477)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8428859)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8428831)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8428832)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8428374)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8428582)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8429149)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8429134)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8429139)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8429159)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8429129)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8429154)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8429144)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8429304)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8429309)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8429064)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8429244)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8429239)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8429234)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8429124)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8429274)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8429284)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8429279)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8429099)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8429094)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8429224)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8429329)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8429334)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8429339)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8429359)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8429344)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8429364)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8429354)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8429349)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8429089)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8429084)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8429049)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8429044)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8429254)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8429164)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8429024)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8429029)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8429269)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8429264)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8429259)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8429104)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8429114)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8429109)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8429429)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8429199)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8429189)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8429184)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8429194)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8429014)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8429019)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8429249)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8429229)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8429294)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8429299)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8429414)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8429399)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8429404)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8429409)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8429074)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8429069)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8429079)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8429314)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8429319)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8429389)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8429394)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8429379)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8429384)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8429289)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8429219)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8429214)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8429204)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8429209)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8429374)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8429369)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8429419)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8429119)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8429324)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8429424)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8429039)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8429034)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8429054)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8429059)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8429179)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8429174)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8429169)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 13:32:54 CEST

--
-- PostgreSQL database dump complete
--

