--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-29 09:02:06 CEST

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
-- TOC entry 183 (class 1259 OID 8331190)
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
-- TOC entry 230 (class 1259 OID 8331708)
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
-- TOC entry 229 (class 1259 OID 8331691)
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
-- TOC entry 222 (class 1259 OID 8331595)
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
-- TOC entry 197 (class 1259 OID 8331369)
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
-- TOC entry 200 (class 1259 OID 8331403)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8331791)
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
-- TOC entry 192 (class 1259 OID 8331312)
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
-- TOC entry 231 (class 1259 OID 8331721)
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
-- TOC entry 216 (class 1259 OID 8331529)
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
-- TOC entry 195 (class 1259 OID 8331349)
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
-- TOC entry 199 (class 1259 OID 8331397)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8331329)
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
-- TOC entry 205 (class 1259 OID 8331446)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8331471)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8331286)
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
-- TOC entry 184 (class 1259 OID 8331199)
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
-- TOC entry 185 (class 1259 OID 8331210)
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
-- TOC entry 180 (class 1259 OID 8331164)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8331183)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8331478)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8331509)
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
-- TOC entry 226 (class 1259 OID 8331641)
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
-- TOC entry 187 (class 1259 OID 8331243)
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
-- TOC entry 189 (class 1259 OID 8331278)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8331452)
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
-- TOC entry 188 (class 1259 OID 8331263)
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
-- TOC entry 194 (class 1259 OID 8331341)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8331464)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8331584)
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
-- TOC entry 225 (class 1259 OID 8331633)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8331767)
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
-- TOC entry 212 (class 1259 OID 8331493)
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
-- TOC entry 204 (class 1259 OID 8331437)
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
-- TOC entry 203 (class 1259 OID 8331427)
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
-- TOC entry 224 (class 1259 OID 8331622)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8331561)
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
-- TOC entry 177 (class 1259 OID 8331135)
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
-- TOC entry 176 (class 1259 OID 8331133)
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
-- TOC entry 213 (class 1259 OID 8331503)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8331173)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8331157)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8331517)
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
-- TOC entry 207 (class 1259 OID 8331458)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8331408)
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
-- TOC entry 237 (class 1259 OID 8331811)
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
-- TOC entry 236 (class 1259 OID 8331803)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8331798)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8331571)
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
-- TOC entry 186 (class 1259 OID 8331235)
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
-- TOC entry 202 (class 1259 OID 8331414)
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
-- TOC entry 223 (class 1259 OID 8331611)
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
-- TOC entry 233 (class 1259 OID 8331780)
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
-- TOC entry 191 (class 1259 OID 8331298)
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
-- TOC entry 178 (class 1259 OID 8331144)
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
-- TOC entry 228 (class 1259 OID 8331668)
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
-- TOC entry 196 (class 1259 OID 8331360)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8331485)
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
-- TOC entry 218 (class 1259 OID 8331554)
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
-- TOC entry 198 (class 1259 OID 8331392)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8331658)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8331544)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8331138)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8331190)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8331708)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5590-ed6d-7799-1484ee9a5c6c	000d0000-5590-ed6d-9296-ffdc510ed5d8	\N	00090000-5590-ed6d-5f9f-af36fa2aa936	000b0000-5590-ed6d-9205-cff299007dfe	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-ed6d-cb12-d67c7b0e1d65	000d0000-5590-ed6d-de90-3732d5f0f5eb	\N	00090000-5590-ed6d-5e07-5a0d28919fbf	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-ed6d-6576-38deb71bba10	000d0000-5590-ed6d-1344-0cb4aa8aad13	\N	00090000-5590-ed6d-9a19-a0264e453cdb	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-ed6d-9e7a-a295e4cc8b95	000d0000-5590-ed6d-9a83-47d218de9cd2	\N	00090000-5590-ed6d-01a4-e6a4c06040e1	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-ed6d-ed89-aca3f423278e	000d0000-5590-ed6d-16c9-cc97feb7a380	\N	00090000-5590-ed6d-0772-6980561d751f	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5590-ed6d-008f-a2ff6966796d	000d0000-5590-ed6d-8334-f4c9949e3f41	\N	00090000-5590-ed6d-5e07-5a0d28919fbf	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8331691)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8331595)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5590-ed6c-136c-d2348827f556	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5590-ed6c-66dc-7132b974f3ef	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5590-ed6c-f1b2-35c61fa9e0c7	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8331369)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5590-ed6d-1587-70ccafdac3c8	\N	\N	00200000-5590-ed6d-69e6-3bbe07b3fb5b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5590-ed6d-2a9e-b13f9ff990f7	\N	\N	00200000-5590-ed6d-519b-7ec2861fd350	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5590-ed6d-7344-e84c9d9f2854	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5590-ed6d-01f6-7e97795e4d06	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5590-ed6d-95f3-a669af71f1cf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8331403)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8331791)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8331312)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5590-ed6b-2e21-cb6c17c9f6e3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5590-ed6b-9164-11f424704361	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5590-ed6b-140d-a94af21e18af	AL	ALB	008	Albania 	Albanija	\N
00040000-5590-ed6b-5f24-b40cb840afc0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5590-ed6b-847a-6271435c5821	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5590-ed6b-ac57-aefe406b1a4d	AD	AND	020	Andorra 	Andora	\N
00040000-5590-ed6b-654c-b610813925ee	AO	AGO	024	Angola 	Angola	\N
00040000-5590-ed6b-8c1d-1c129c734e99	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5590-ed6b-b152-246648115a9a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5590-ed6b-01b2-5644560ba0b2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5590-ed6b-5d48-2786f9410c4c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5590-ed6b-1f8e-3a6bd7911d3d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5590-ed6b-d903-b59514fbaeb0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5590-ed6b-7945-c3d5fda24df3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5590-ed6b-3804-32aac9d70cab	AT	AUT	040	Austria 	Avstrija	\N
00040000-5590-ed6b-a95c-6d2da581ccfb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5590-ed6b-5597-b50f5244c530	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5590-ed6b-b323-4ec5a48d1f26	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5590-ed6b-19ef-de7cc8f32bfd	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5590-ed6b-cf10-39facfaab6dc	BB	BRB	052	Barbados 	Barbados	\N
00040000-5590-ed6b-e47a-04a70b3dcd54	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5590-ed6b-c333-bfe1c6107001	BE	BEL	056	Belgium 	Belgija	\N
00040000-5590-ed6b-9637-77e43fec2c16	BZ	BLZ	084	Belize 	Belize	\N
00040000-5590-ed6b-78fb-220a97cff706	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5590-ed6b-ce4d-01486ab3db90	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5590-ed6b-7e9c-f11fa7538fd9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5590-ed6b-cec3-1080e8842b3e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5590-ed6b-2b3a-f7b03fc8ff88	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5590-ed6b-20a0-4d0160f8c0bf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5590-ed6b-e9d7-b1b114d5a0af	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5590-ed6b-34e5-f04689672a4f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5590-ed6b-e4ac-05e6a9f7fcbf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5590-ed6b-5c1f-7bfdffcefd77	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5590-ed6b-bf50-37e49072ab6a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5590-ed6b-3921-ae5a051b55db	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5590-ed6b-a412-4e0ce4f82cef	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5590-ed6b-f44a-ab95f76615f6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5590-ed6b-4983-7f36d03a46b2	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5590-ed6b-46a2-82f3d13fd087	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5590-ed6b-1885-ced96d1d5b5d	CA	CAN	124	Canada 	Kanada	\N
00040000-5590-ed6b-cfd7-4d3af9f26eb4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5590-ed6b-5565-51095dae6c75	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5590-ed6b-5307-20b22de46258	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5590-ed6b-b7c2-cb58964919db	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5590-ed6b-e95b-a5a7d739e5df	CL	CHL	152	Chile 	Čile	\N
00040000-5590-ed6b-b0b9-ac743188058e	CN	CHN	156	China 	Kitajska	\N
00040000-5590-ed6b-3b33-8f6a8db40b47	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5590-ed6b-982b-5a21b24370df	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5590-ed6b-4805-07cc7fba3e53	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5590-ed6b-1c2e-9b12e8f0144d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5590-ed6b-755c-f2e150791b50	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5590-ed6b-8e2c-229add838db9	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5590-ed6b-0b4c-e29ab929a3fa	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5590-ed6b-8adb-a217aa01e8cd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5590-ed6b-ad13-149385954021	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5590-ed6b-92b3-cac2191456f5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5590-ed6b-60c0-0fa93eb81ea1	CU	CUB	192	Cuba 	Kuba	\N
00040000-5590-ed6b-e4d0-6e82bb7c25e5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5590-ed6b-febf-f035110ba177	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5590-ed6b-adcc-cf0e183e76da	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5590-ed6b-04fd-6401f901f84d	DK	DNK	208	Denmark 	Danska	\N
00040000-5590-ed6b-687e-0270c612838d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5590-ed6b-96b0-7bbaa9b1ee00	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5590-ed6b-f423-63c8b037de94	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5590-ed6b-b45f-432ad675ee13	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5590-ed6b-1298-49eb7e5729f8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5590-ed6b-1993-e345a4a0165f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5590-ed6b-5886-940e1c380961	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5590-ed6b-3591-acb8520e08ab	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5590-ed6b-79c5-bcf2a2a0e67e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5590-ed6b-f385-81c22076470f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5590-ed6b-2672-bad518b626ba	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5590-ed6b-5c3b-a6a7ea63abe0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5590-ed6b-049e-06bcbfffdf39	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5590-ed6b-07f4-7139ea35fb2f	FI	FIN	246	Finland 	Finska	\N
00040000-5590-ed6b-f2fc-ab6cabfcd9fa	FR	FRA	250	France 	Francija	\N
00040000-5590-ed6b-eff8-279f40501c54	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5590-ed6b-b86e-77e04a6c0607	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5590-ed6b-2ff1-f833506c7e3b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5590-ed6b-e8f3-b6af704c1fd5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5590-ed6b-9492-d5c56e096f48	GA	GAB	266	Gabon 	Gabon	\N
00040000-5590-ed6b-028f-380f876657fb	GM	GMB	270	Gambia 	Gambija	\N
00040000-5590-ed6b-64fe-62f8bcad9998	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5590-ed6b-487b-3d8a9bf95e6a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5590-ed6b-1236-7c3fc2471d05	GH	GHA	288	Ghana 	Gana	\N
00040000-5590-ed6b-0c11-5d171079bc42	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5590-ed6b-a2fc-1919f47ac69e	GR	GRC	300	Greece 	Grčija	\N
00040000-5590-ed6b-51d4-67ea888fd25a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5590-ed6b-60dc-a535dc97b1f4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5590-ed6b-016c-8ffb0412915a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5590-ed6b-6d68-1fd0dad30491	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5590-ed6b-5039-7b47d9fa3b5d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5590-ed6b-eb95-1b56496d8e16	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5590-ed6b-2fd6-4d518f75d723	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5590-ed6b-961b-d2cdc93e5ce6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5590-ed6b-8373-e967aa5a0982	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5590-ed6b-acfc-c1d022795dc5	HT	HTI	332	Haiti 	Haiti	\N
00040000-5590-ed6b-672a-19a1a575dce5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5590-ed6b-2523-fc415d657efa	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5590-ed6b-e01f-d68895e762d7	HN	HND	340	Honduras 	Honduras	\N
00040000-5590-ed6b-a010-06daf014298b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5590-ed6b-249f-7154531ffc09	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5590-ed6b-ba2d-60726ea735b5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5590-ed6b-9961-9559cfa6fb67	IN	IND	356	India 	Indija	\N
00040000-5590-ed6b-c0aa-e66ffbb8184c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5590-ed6b-6a46-b53906b39e71	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5590-ed6b-2a94-0806584e5d11	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5590-ed6b-b938-45ab8661a204	IE	IRL	372	Ireland 	Irska	\N
00040000-5590-ed6b-47cf-0fa5c84b8683	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5590-ed6b-d18d-f91b59ff7e76	IL	ISR	376	Israel 	Izrael	\N
00040000-5590-ed6b-0703-0b2e37ae33e5	IT	ITA	380	Italy 	Italija	\N
00040000-5590-ed6b-dd04-4328bea273bd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5590-ed6b-f5ea-1b6ab468bb4b	JP	JPN	392	Japan 	Japonska	\N
00040000-5590-ed6b-799b-8592bdeff98a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5590-ed6b-ac26-4e7f1f0d5ffe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5590-ed6b-1261-3033e95268fe	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5590-ed6b-0f35-bb15cb273b95	KE	KEN	404	Kenya 	Kenija	\N
00040000-5590-ed6b-6209-5640cc69dccc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5590-ed6b-e4e4-67334af7e8fc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5590-ed6b-1d1c-8bf8a782cbe5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5590-ed6b-88e5-1eb0bc42bb19	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5590-ed6b-be9b-2c7459c11542	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5590-ed6b-86c4-72b9de23b136	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5590-ed6b-34d4-7afebd1ea75b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5590-ed6b-1255-7b21b08d0177	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5590-ed6b-ed4e-bd120366d5ea	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5590-ed6b-dcf7-ad817f769866	LR	LBR	430	Liberia 	Liberija	\N
00040000-5590-ed6b-a7a2-c7f3c508234e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5590-ed6b-a189-8077c0a92d4c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5590-ed6b-f2e6-23e998dede37	LT	LTU	440	Lithuania 	Litva	\N
00040000-5590-ed6b-b414-cd2d0ee0b54b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5590-ed6b-7a3c-1bd42fe39ac1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5590-ed6b-f45e-eb05b42a6645	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5590-ed6b-ce8c-828d07f54b02	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5590-ed6b-2a57-414e0adb1752	MW	MWI	454	Malawi 	Malavi	\N
00040000-5590-ed6b-f2c2-688802b3e955	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5590-ed6b-7c87-27430ba12a7f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5590-ed6b-4fe4-a66b73027e8f	ML	MLI	466	Mali 	Mali	\N
00040000-5590-ed6b-1ccc-a046905497ac	MT	MLT	470	Malta 	Malta	\N
00040000-5590-ed6b-cd9d-055416eb9b78	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5590-ed6b-0e3c-591d2d26f3c7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5590-ed6b-e6e5-79ab7e1d4794	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5590-ed6b-5d20-eb230f9d08d7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5590-ed6b-8575-6dd4e6c14e1f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5590-ed6b-da29-8cfd81a1119b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5590-ed6b-71cb-4e00b56882cd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5590-ed6b-46ea-a480ed601a1a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5590-ed6b-f564-03fdbc2889a7	MC	MCO	492	Monaco 	Monako	\N
00040000-5590-ed6b-8156-2b8bff7cc77a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5590-ed6b-d689-80f2fa38c081	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5590-ed6b-c576-e3cf165bb398	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5590-ed6b-b8f3-91717daf337d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5590-ed6b-143b-be2d9a838e13	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5590-ed6b-4cd9-edcd7d6bf65c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5590-ed6b-4466-a1135cc51ce4	NA	NAM	516	Namibia 	Namibija	\N
00040000-5590-ed6b-7794-0bf073a0cf08	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5590-ed6b-a24b-f95423877fc1	NP	NPL	524	Nepal 	Nepal	\N
00040000-5590-ed6b-1140-8ad378291e58	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5590-ed6b-00b1-6745cf2ed7a4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5590-ed6b-6c8e-7df95439b516	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5590-ed6b-2e4d-adac6bb799f0	NE	NER	562	Niger 	Niger 	\N
00040000-5590-ed6b-6bcc-a2162130c977	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5590-ed6b-0e2c-a4eecf18c0ed	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5590-ed6b-7ba0-58bb7ed31b93	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5590-ed6b-6b58-0416aa1d5cfa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5590-ed6b-8e27-88fc06f59072	NO	NOR	578	Norway 	Norveška	\N
00040000-5590-ed6b-b19f-9dc557ab6675	OM	OMN	512	Oman 	Oman	\N
00040000-5590-ed6b-98fb-48905010b567	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5590-ed6b-5cf2-9140a92a7c1d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5590-ed6b-789e-335c4f0c5f71	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5590-ed6b-86b1-70e69023fd77	PA	PAN	591	Panama 	Panama	\N
00040000-5590-ed6b-5d61-ba91e94da470	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5590-ed6b-39b4-c4dfe3893bda	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5590-ed6b-9234-698dea75ae94	PE	PER	604	Peru 	Peru	\N
00040000-5590-ed6b-0666-3cfd718f1f01	PH	PHL	608	Philippines 	Filipini	\N
00040000-5590-ed6b-3162-460a6917825f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5590-ed6b-5516-31158a60a9fb	PL	POL	616	Poland 	Poljska	\N
00040000-5590-ed6b-5452-ed77d866e4ae	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5590-ed6b-78a6-5a445a0ed893	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5590-ed6b-35a3-845b8bca313b	QA	QAT	634	Qatar 	Katar	\N
00040000-5590-ed6b-a7ec-fd8f5288b63a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5590-ed6b-8636-2371b43420f8	RO	ROU	642	Romania 	Romunija	\N
00040000-5590-ed6b-3e1e-0e2de087dd73	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5590-ed6b-643e-745f057ab2da	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5590-ed6b-899b-303ccf55c54f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5590-ed6b-359b-210f382c4ceb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5590-ed6b-1220-8ffda961ace7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5590-ed6b-5915-7a339b86dae9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5590-ed6b-9657-1a8926b521c2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5590-ed6b-0344-4c8213396d11	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5590-ed6b-5563-b84b4c917395	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5590-ed6b-7d11-0ac5b924507f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5590-ed6b-5265-e3fee86f4d35	SM	SMR	674	San Marino 	San Marino	\N
00040000-5590-ed6b-6cfc-52145330cd0c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5590-ed6b-ccef-8e5838738da7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5590-ed6b-3959-39d0c7f98e6d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5590-ed6b-2fda-e429e7799067	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5590-ed6b-db9e-b6b76b9e4783	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5590-ed6b-efdf-400271aa9db6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5590-ed6b-79d7-2227e81bc690	SG	SGP	702	Singapore 	Singapur	\N
00040000-5590-ed6b-c9bf-1f032e1fe65e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5590-ed6b-6e02-abad48633cc1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5590-ed6b-e153-1048acd7ce92	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5590-ed6b-0556-5369c429b0c8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5590-ed6b-ac30-425681c484a7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5590-ed6b-2cba-5478de44ae96	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5590-ed6b-6a33-b002481a3cb1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5590-ed6b-29c6-42cccbbc5cba	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5590-ed6b-d758-ccf0f6630152	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5590-ed6b-1000-14c87c2a4c47	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5590-ed6b-3113-8f22a4a0e0bf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5590-ed6b-ec89-6f7fd7efbab7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5590-ed6b-5906-88efa313791e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5590-ed6b-aba7-cd86391ea4d4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5590-ed6b-d023-a6719e2edb01	SE	SWE	752	Sweden 	Švedska	\N
00040000-5590-ed6b-b888-edf7eed3c9aa	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5590-ed6b-f291-a1da9c58c4c5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5590-ed6b-c185-22842fb80dec	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5590-ed6b-28bc-c3f2c99a324e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5590-ed6b-a13f-3634662dde1c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5590-ed6b-5a0b-fdd9ad2fb127	TH	THA	764	Thailand 	Tajska	\N
00040000-5590-ed6b-433f-944eead9dbf5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5590-ed6b-e78d-36f222f124a6	TG	TGO	768	Togo 	Togo	\N
00040000-5590-ed6b-c74b-1b11f8b24a2d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5590-ed6b-18a4-eb5c46cb845c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5590-ed6b-a8f3-fe9cc04cb00f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5590-ed6b-cc79-fd26b66e3638	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5590-ed6b-d979-edf0550c40bf	TR	TUR	792	Turkey 	Turčija	\N
00040000-5590-ed6b-07d4-06d6e0ea9175	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5590-ed6b-40d0-21378bdbff76	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5590-ed6b-4bd8-021a1c1d1a3c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5590-ed6b-a11b-2d5fce3bc7c4	UG	UGA	800	Uganda 	Uganda	\N
00040000-5590-ed6b-46b5-9da0d08e28e5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5590-ed6b-29f5-bad785b5ba3b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5590-ed6b-4c79-01dd5af4df24	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5590-ed6b-14f8-7e8a8c47e5b3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5590-ed6b-2dc3-f2e48339a313	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5590-ed6b-630b-ea685cfd13fb	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5590-ed6b-f582-e2ec7ccff824	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5590-ed6b-387a-c2ab73fb96b1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5590-ed6b-1821-32e76877cc1c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5590-ed6b-6ced-24d5d19a1bea	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5590-ed6b-64b6-b1c33ecfffc8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5590-ed6b-96e6-9cff49f76167	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5590-ed6b-5b6f-dd2a74041b64	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5590-ed6b-cae8-2d4f466ea1ec	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5590-ed6b-9b93-ca83dc6999f2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5590-ed6b-3e79-024dbebeebe1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5590-ed6b-c003-ea5d032b2758	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8331721)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5590-ed6d-d2db-7d61969d7d3c	000e0000-5590-ed6d-6304-414a45f1505a	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5590-ed6c-5c56-3236b990e8b5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5590-ed6d-b378-6cf7faf5176b	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5590-ed6c-d79f-26439f15b6d4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8331529)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5590-ed6d-fe0f-2eb420660707	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5590-ed6c-e907-c11c02a1c528
000d0000-5590-ed6d-9296-ffdc510ed5d8	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5590-ed6c-e907-c11c02a1c528
000d0000-5590-ed6d-de90-3732d5f0f5eb	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5590-ed6c-bbd0-85ce84b7a96b
000d0000-5590-ed6d-1344-0cb4aa8aad13	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5590-ed6c-7796-ddb45eb20030
000d0000-5590-ed6d-9a83-47d218de9cd2	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5590-ed6c-7796-ddb45eb20030
000d0000-5590-ed6d-16c9-cc97feb7a380	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5590-ed6c-7796-ddb45eb20030
000d0000-5590-ed6d-8334-f4c9949e3f41	000e0000-5590-ed6d-0cb4-d5caf28bf19d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5590-ed6c-e907-c11c02a1c528
\.


--
-- TOC entry 2860 (class 0 OID 8331349)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8331397)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8331329)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5590-ed6d-5f07-5d96f9a1ec3c	00080000-5590-ed6d-f6d7-863b4f639fd5	00090000-5590-ed6d-5f9f-af36fa2aa936	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8331446)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8331471)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8331286)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5590-ed6b-bc31-c0b499d87353	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5590-ed6b-b242-16223423a4e3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5590-ed6b-1ae3-0496ce7cdc7a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5590-ed6b-a6e8-b26d9866e1f5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5590-ed6b-7f72-1d81a7cc898f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5590-ed6b-1930-6950d0dd678d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5590-ed6b-4a6a-714d4a0328ac	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5590-ed6b-c367-087380ff243b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5590-ed6b-a17f-f9ee77af2fe5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5590-ed6b-a8e5-0de98b76a341	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5590-ed6b-2f48-1c8bcefdb25f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5590-ed6b-b9d3-040951bcb90b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5590-ed6b-2ef7-3e12e2794bea	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5590-ed6d-4831-145c95988237	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5590-ed6d-ae6c-9fd662755308	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5590-ed6d-f306-7d80bdd54326	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5590-ed6d-5475-35d4f81c41e8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5590-ed6d-4551-54d4f191a9f4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5590-ed6d-6d6e-67a21780d600	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8331199)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5590-ed6d-0f8f-77f20d8cc206	00000000-5590-ed6d-ae6c-9fd662755308	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5590-ed6d-1387-40fe4e07026b	00000000-5590-ed6d-ae6c-9fd662755308	00010000-5590-ed6b-d69b-11adb36ec031	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5590-ed6d-278d-df9822fb90a4	00000000-5590-ed6d-f306-7d80bdd54326	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8331210)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5590-ed6d-7c78-54ba3da1dbf7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5590-ed6d-01a4-e6a4c06040e1	00010000-5590-ed6d-ce0b-33b775df3921	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5590-ed6d-9a19-a0264e453cdb	00010000-5590-ed6d-bf83-984ffef82d31	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5590-ed6d-54a2-dd2db2534146	00010000-5590-ed6d-881f-381d2cccb841	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5590-ed6d-ab68-2d42a381dd49	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5590-ed6d-840e-55714d8c59ea	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5590-ed6d-b79b-ec838a09d4ad	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5590-ed6d-86a8-f6296b4f00ec	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5590-ed6d-5f9f-af36fa2aa936	00010000-5590-ed6d-aeeb-4bb9fdf0e1eb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5590-ed6d-5e07-5a0d28919fbf	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5590-ed6d-2e88-50288bc0f412	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5590-ed6d-0772-6980561d751f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5590-ed6d-04da-ba9783580452	00010000-5590-ed6d-f9d3-c47589b4b04c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8331164)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5590-ed6b-e62c-43791a282b4a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5590-ed6b-49bb-e7134cb80d19	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5590-ed6b-5638-d448d247f659	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5590-ed6b-e837-d693c5845cd8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5590-ed6b-99ea-f695cf4a6320	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5590-ed6b-4b1c-e306b14d7d98	Abonma-read	Abonma - branje	f
00030000-5590-ed6b-94b5-361227c69530	Abonma-write	Abonma - spreminjanje	f
00030000-5590-ed6b-79d0-bb1fd48a0d11	Alternacija-read	Alternacija - branje	f
00030000-5590-ed6b-be09-2610c7d16868	Alternacija-write	Alternacija - spreminjanje	f
00030000-5590-ed6b-30bd-66ab9a77f6b1	Arhivalija-read	Arhivalija - branje	f
00030000-5590-ed6b-2c8a-991100465b39	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5590-ed6b-bb45-ed80b5c342c6	Besedilo-read	Besedilo - branje	f
00030000-5590-ed6b-caca-823e6f51749c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5590-ed6b-32d9-62da28201bbd	DogodekIzven-read	DogodekIzven - branje	f
00030000-5590-ed6b-fb51-cdb1f93c39fc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5590-ed6b-4c94-45f55d2422c5	Dogodek-read	Dogodek - branje	f
00030000-5590-ed6b-8710-b7722bc44c1b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5590-ed6b-b0b7-8eb78ac0d807	DrugiVir-read	DrugiVir - branje	f
00030000-5590-ed6b-b889-2a58aa516840	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5590-ed6b-064e-865db221707b	Drzava-read	Drzava - branje	f
00030000-5590-ed6b-4593-95d84ea472d9	Drzava-write	Drzava - spreminjanje	f
00030000-5590-ed6b-3d71-861ea1d621fd	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5590-ed6b-1ba2-dd850036b3f9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5590-ed6b-5958-2cdd390534f8	Funkcija-read	Funkcija - branje	f
00030000-5590-ed6b-9579-fed749a8ef09	Funkcija-write	Funkcija - spreminjanje	f
00030000-5590-ed6b-da48-bc8743bcfd4a	Gostovanje-read	Gostovanje - branje	f
00030000-5590-ed6b-0c98-93f898f29baa	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5590-ed6b-b3fa-bd2a1fd471ca	Gostujoca-read	Gostujoca - branje	f
00030000-5590-ed6b-a030-ca2779b9e6d6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5590-ed6b-126a-27a8b28364b4	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5590-ed6b-b3e3-9c98149122bd	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5590-ed6b-5d11-4b71858269dc	Kupec-read	Kupec - branje	f
00030000-5590-ed6b-a832-f79177dd73da	Kupec-write	Kupec - spreminjanje	f
00030000-5590-ed6b-cc3a-1c9422a576b6	NacinPlacina-read	NacinPlacina - branje	f
00030000-5590-ed6b-0898-9e4e27786ec2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5590-ed6b-f9fb-2d1ca76d7b56	Option-read	Option - branje	f
00030000-5590-ed6b-0761-3a2cc8e65791	Option-write	Option - spreminjanje	f
00030000-5590-ed6b-5961-555ee97718d3	OptionValue-read	OptionValue - branje	f
00030000-5590-ed6b-12cd-ad05e155a1d9	OptionValue-write	OptionValue - spreminjanje	f
00030000-5590-ed6b-248c-dbf805b98ab3	Oseba-read	Oseba - branje	f
00030000-5590-ed6b-8b4f-4d15ef8179cc	Oseba-write	Oseba - spreminjanje	f
00030000-5590-ed6b-cd02-901022edbe5a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5590-ed6b-dce8-bea546a060ce	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5590-ed6b-251e-c4e8f722482f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5590-ed6b-e775-b7a4ebe880dd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5590-ed6b-1b94-2b7e9fba81b8	Pogodba-read	Pogodba - branje	f
00030000-5590-ed6b-aa36-fe9232b7332c	Pogodba-write	Pogodba - spreminjanje	f
00030000-5590-ed6b-d083-49f9546b1c54	Popa-read	Popa - branje	f
00030000-5590-ed6b-3233-120cae1dd616	Popa-write	Popa - spreminjanje	f
00030000-5590-ed6b-8082-fb4c05b3be51	Posta-read	Posta - branje	f
00030000-5590-ed6b-c6c5-20513d403cdc	Posta-write	Posta - spreminjanje	f
00030000-5590-ed6b-6177-5904c4472114	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5590-ed6b-ae56-5f9ee3aff100	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5590-ed6b-1c31-bfe807d3afe5	PostniNaslov-read	PostniNaslov - branje	f
00030000-5590-ed6b-e13e-8225f608bd47	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5590-ed6b-2395-3baf54c2e482	Predstava-read	Predstava - branje	f
00030000-5590-ed6b-23f0-d53296b099ff	Predstava-write	Predstava - spreminjanje	f
00030000-5590-ed6b-0ad8-0417ce6ce500	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5590-ed6b-981b-5d513f0fe99c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5590-ed6b-b426-77b8cfd8a6e2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5590-ed6b-c93a-e3519e9ed8b9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5590-ed6b-d1a8-3016a46d5982	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5590-ed6b-6b87-caba4c2e44c2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5590-ed6b-f06a-41fe71a9116a	ProgramDela-read	ProgramDela - branje	f
00030000-5590-ed6b-b699-e0538a7274a2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5590-ed6b-e927-b9a0343fb85c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5590-ed6b-d38d-ba90fc63e846	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5590-ed6b-c026-9a77e95f9e00	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5590-ed6b-a445-818d9ea20340	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5590-ed6b-0688-821851684985	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5590-ed6b-4573-15e7817be07c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5590-ed6b-914e-e6832c68da5c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5590-ed6b-597c-ce6ad77b65f8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5590-ed6b-325f-6ee8de94c7b2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5590-ed6b-ffea-f5d6fe0254eb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5590-ed6b-9a1e-f5ce254f64aa	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5590-ed6b-36f9-a8f124eeb042	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5590-ed6b-e715-52cb9bd57973	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5590-ed6b-9803-9e2cb6a66e50	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5590-ed6b-e695-cfe1da3ed54b	ProgramRazno-read	ProgramRazno - branje	f
00030000-5590-ed6b-e375-629eeb444804	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5590-ed6b-5640-bf47b32edf47	Prostor-read	Prostor - branje	f
00030000-5590-ed6b-e14b-39f3ee089d6c	Prostor-write	Prostor - spreminjanje	f
00030000-5590-ed6b-6724-3fd04be95e59	Racun-read	Racun - branje	f
00030000-5590-ed6b-4e34-a39555935159	Racun-write	Racun - spreminjanje	f
00030000-5590-ed6b-2a9d-8e0825691095	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5590-ed6b-b5e4-b6f7e2224ae2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5590-ed6b-8edc-432bcecf5775	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5590-ed6b-2235-11dcd676ee36	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5590-ed6b-c8a6-a7e339c136bb	Rekvizit-read	Rekvizit - branje	f
00030000-5590-ed6b-275f-c7779299f7f1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5590-ed6b-d417-63f88b6455b4	Revizija-read	Revizija - branje	f
00030000-5590-ed6b-66e6-bfdfb723272c	Revizija-write	Revizija - spreminjanje	f
00030000-5590-ed6b-81c8-585268151806	Rezervacija-read	Rezervacija - branje	f
00030000-5590-ed6b-398c-b097ee305dd0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5590-ed6b-4826-cb6b97e5767e	SedezniRed-read	SedezniRed - branje	f
00030000-5590-ed6b-b161-9ac261cbd269	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5590-ed6b-b6c7-c84eabab72af	Sedez-read	Sedez - branje	f
00030000-5590-ed6b-4a33-fc64a47794a8	Sedez-write	Sedez - spreminjanje	f
00030000-5590-ed6b-6673-0ecfcecb20a9	Sezona-read	Sezona - branje	f
00030000-5590-ed6b-ee47-1152384dfa1e	Sezona-write	Sezona - spreminjanje	f
00030000-5590-ed6b-43f4-a0d3a308373b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5590-ed6b-bccd-8ae65a367df2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5590-ed6b-ddde-dcba37092e9c	Stevilcenje-read	Stevilcenje - branje	f
00030000-5590-ed6b-8138-ef13a230e1d3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5590-ed6b-965a-605f014bad69	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5590-ed6b-56b7-05136b309617	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5590-ed6b-0806-be9f5ea3fd49	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5590-ed6b-adc1-1201356baf25	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5590-ed6b-29d6-3c6a34fbcb81	Telefonska-read	Telefonska - branje	f
00030000-5590-ed6b-f2b1-bd4284a7143c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5590-ed6b-c007-43d07b730cb7	TerminStoritve-read	TerminStoritve - branje	f
00030000-5590-ed6b-1294-9a848ace9177	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5590-ed6b-f6ce-2b2adcb719bc	TipFunkcije-read	TipFunkcije - branje	f
00030000-5590-ed6b-c92d-35f7683d8df2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5590-ed6b-c71f-4a4c077cab8c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5590-ed6b-ce81-fe70b1150b03	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5590-ed6b-850e-f1e4d7b592f9	Trr-read	Trr - branje	f
00030000-5590-ed6b-76d6-0ddab611eb73	Trr-write	Trr - spreminjanje	f
00030000-5590-ed6b-2b4e-62065b3a2243	Uprizoritev-read	Uprizoritev - branje	f
00030000-5590-ed6b-7e80-54884ac5b514	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5590-ed6b-4b73-b2f990e849a1	Vaja-read	Vaja - branje	f
00030000-5590-ed6b-ac20-7d98859db9a9	Vaja-write	Vaja - spreminjanje	f
00030000-5590-ed6b-e842-b207958099fb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5590-ed6b-39b6-364332d72add	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5590-ed6b-d921-ee230b791bb6	Zaposlitev-read	Zaposlitev - branje	f
00030000-5590-ed6b-f0d9-81b09fd50533	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5590-ed6b-cb24-751fff35ec99	Zasedenost-read	Zasedenost - branje	f
00030000-5590-ed6b-b4dc-76fc10c89bdd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5590-ed6b-55e2-36830b47a86d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5590-ed6b-f5dc-312ad0e4bb89	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5590-ed6b-9657-5433f5ee6b07	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5590-ed6b-2f6e-de162273915d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8331183)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5590-ed6b-ca09-7945a6ec4cb9	00030000-5590-ed6b-49bb-e7134cb80d19
00020000-5590-ed6b-eae5-80039ef5c6e5	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-94b5-361227c69530
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-79d0-bb1fd48a0d11
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-be09-2610c7d16868
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-e837-d693c5845cd8
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-8710-b7722bc44c1b
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-4593-95d84ea472d9
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-5958-2cdd390534f8
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-9579-fed749a8ef09
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-0c98-93f898f29baa
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-a030-ca2779b9e6d6
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-126a-27a8b28364b4
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-b3e3-9c98149122bd
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-248c-dbf805b98ab3
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-8b4f-4d15ef8179cc
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-3233-120cae1dd616
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-c6c5-20513d403cdc
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-1c31-bfe807d3afe5
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-e13e-8225f608bd47
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-23f0-d53296b099ff
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-d1a8-3016a46d5982
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-6b87-caba4c2e44c2
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-e14b-39f3ee089d6c
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-2235-11dcd676ee36
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-275f-c7779299f7f1
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-ee47-1152384dfa1e
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-f6ce-2b2adcb719bc
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-2b4e-62065b3a2243
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-7e80-54884ac5b514
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-4b73-b2f990e849a1
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-ac20-7d98859db9a9
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-cb24-751fff35ec99
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-b4dc-76fc10c89bdd
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6b-f263-47c6087fc09b	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-126a-27a8b28364b4
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-b3e3-9c98149122bd
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-248c-dbf805b98ab3
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-8b4f-4d15ef8179cc
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-1c31-bfe807d3afe5
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-e13e-8225f608bd47
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-29d6-3c6a34fbcb81
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-f2b1-bd4284a7143c
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-850e-f1e4d7b592f9
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-76d6-0ddab611eb73
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-d921-ee230b791bb6
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-f0d9-81b09fd50533
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6b-d4c1-acc79d329992	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-79d0-bb1fd48a0d11
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-2c8a-991100465b39
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-bb45-ed80b5c342c6
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-32d9-62da28201bbd
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-5958-2cdd390534f8
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-126a-27a8b28364b4
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-248c-dbf805b98ab3
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-d1a8-3016a46d5982
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-f6ce-2b2adcb719bc
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-4b73-b2f990e849a1
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-cb24-751fff35ec99
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6b-5075-0e846f297563	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-94b5-361227c69530
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-be09-2610c7d16868
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-f6ce-2b2adcb719bc
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6b-e83b-308bfd3ae009	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-c007-43d07b730cb7
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-5638-d448d247f659
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-f6ce-2b2adcb719bc
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6b-ec2b-feb57f2db4d0	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e62c-43791a282b4a
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-49bb-e7134cb80d19
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-5638-d448d247f659
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e837-d693c5845cd8
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-99ea-f695cf4a6320
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4b1c-e306b14d7d98
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-94b5-361227c69530
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-79d0-bb1fd48a0d11
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-be09-2610c7d16868
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-30bd-66ab9a77f6b1
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2c8a-991100465b39
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-bb45-ed80b5c342c6
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-caca-823e6f51749c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-32d9-62da28201bbd
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-fb51-cdb1f93c39fc
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4c94-45f55d2422c5
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-8710-b7722bc44c1b
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-064e-865db221707b
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4593-95d84ea472d9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-3d71-861ea1d621fd
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-1ba2-dd850036b3f9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-5958-2cdd390534f8
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-9579-fed749a8ef09
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-da48-bc8743bcfd4a
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0c98-93f898f29baa
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b3fa-bd2a1fd471ca
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-a030-ca2779b9e6d6
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-126a-27a8b28364b4
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b3e3-9c98149122bd
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-5d11-4b71858269dc
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-a832-f79177dd73da
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-cc3a-1c9422a576b6
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0898-9e4e27786ec2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f9fb-2d1ca76d7b56
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0761-3a2cc8e65791
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-5961-555ee97718d3
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-12cd-ad05e155a1d9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-248c-dbf805b98ab3
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-8b4f-4d15ef8179cc
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-cd02-901022edbe5a
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-dce8-bea546a060ce
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-251e-c4e8f722482f
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e775-b7a4ebe880dd
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-1b94-2b7e9fba81b8
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-aa36-fe9232b7332c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-d083-49f9546b1c54
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-3233-120cae1dd616
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-8082-fb4c05b3be51
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c6c5-20513d403cdc
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-6177-5904c4472114
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ae56-5f9ee3aff100
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-1c31-bfe807d3afe5
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e13e-8225f608bd47
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2395-3baf54c2e482
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-23f0-d53296b099ff
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0ad8-0417ce6ce500
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-981b-5d513f0fe99c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b426-77b8cfd8a6e2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c93a-e3519e9ed8b9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-d1a8-3016a46d5982
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-6b87-caba4c2e44c2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f06a-41fe71a9116a
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b699-e0538a7274a2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e927-b9a0343fb85c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-d38d-ba90fc63e846
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c026-9a77e95f9e00
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-a445-818d9ea20340
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0688-821851684985
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4573-15e7817be07c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-914e-e6832c68da5c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-597c-ce6ad77b65f8
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-325f-6ee8de94c7b2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ffea-f5d6fe0254eb
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-9a1e-f5ce254f64aa
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-36f9-a8f124eeb042
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e715-52cb9bd57973
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-9803-9e2cb6a66e50
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e695-cfe1da3ed54b
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e375-629eeb444804
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-5640-bf47b32edf47
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e14b-39f3ee089d6c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-6724-3fd04be95e59
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4e34-a39555935159
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2a9d-8e0825691095
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b5e4-b6f7e2224ae2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-8edc-432bcecf5775
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2235-11dcd676ee36
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c8a6-a7e339c136bb
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-275f-c7779299f7f1
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-d417-63f88b6455b4
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-66e6-bfdfb723272c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-81c8-585268151806
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-398c-b097ee305dd0
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4826-cb6b97e5767e
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b161-9ac261cbd269
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b6c7-c84eabab72af
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4a33-fc64a47794a8
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-6673-0ecfcecb20a9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ee47-1152384dfa1e
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-43f4-a0d3a308373b
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-bccd-8ae65a367df2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ddde-dcba37092e9c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-8138-ef13a230e1d3
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-965a-605f014bad69
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-56b7-05136b309617
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-0806-be9f5ea3fd49
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-adc1-1201356baf25
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-29d6-3c6a34fbcb81
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f2b1-bd4284a7143c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c007-43d07b730cb7
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-1294-9a848ace9177
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f6ce-2b2adcb719bc
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c92d-35f7683d8df2
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-c71f-4a4c077cab8c
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ce81-fe70b1150b03
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-850e-f1e4d7b592f9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-76d6-0ddab611eb73
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2b4e-62065b3a2243
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-7e80-54884ac5b514
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-4b73-b2f990e849a1
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-ac20-7d98859db9a9
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-e842-b207958099fb
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-39b6-364332d72add
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-d921-ee230b791bb6
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f0d9-81b09fd50533
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-cb24-751fff35ec99
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-b4dc-76fc10c89bdd
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-55e2-36830b47a86d
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-f5dc-312ad0e4bb89
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-9657-5433f5ee6b07
00020000-5590-ed6d-c315-0867ed157fac	00030000-5590-ed6b-2f6e-de162273915d
\.


--
-- TOC entry 2875 (class 0 OID 8331478)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8331509)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8331641)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5590-ed6d-9205-cff299007dfe	00090000-5590-ed6d-7c78-54ba3da1dbf7	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8331243)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5590-ed6d-f6d7-863b4f639fd5	00040000-5590-ed6b-2e21-cb6c17c9f6e3	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-ed6d-6e46-8c04bef0f543	00040000-5590-ed6b-2e21-cb6c17c9f6e3	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-ed6d-5dc2-facc3c42959f	00040000-5590-ed6b-2e21-cb6c17c9f6e3	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-ed6d-da0f-f6155f9d9b34	00040000-5590-ed6b-2e21-cb6c17c9f6e3	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-ed6d-579a-6a4d1c72bd70	00040000-5590-ed6b-2e21-cb6c17c9f6e3	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5590-ed6d-466c-95a5dbf22a85	00040000-5590-ed6b-e153-1048acd7ce92	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8331278)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5590-ed6b-9059-dd44e0c0036e	8341	Adlešiči
00050000-5590-ed6b-7c39-e5bf377c32e4	5270	Ajdovščina
00050000-5590-ed6b-30d4-12584b637773	6280	Ankaran/Ancarano
00050000-5590-ed6b-f860-f2f1ba2bd709	9253	Apače
00050000-5590-ed6b-57af-15581f72b768	8253	Artiče
00050000-5590-ed6b-24bf-b56c3de7246b	4275	Begunje na Gorenjskem
00050000-5590-ed6b-2375-f25692fa94c2	1382	Begunje pri Cerknici
00050000-5590-ed6b-2bb2-d478851bb3fc	9231	Beltinci
00050000-5590-ed6b-1323-3c75d7459da2	2234	Benedikt
00050000-5590-ed6b-73d7-ff177558fcbb	2345	Bistrica ob Dravi
00050000-5590-ed6b-d6b2-6e8f8a3fe12d	3256	Bistrica ob Sotli
00050000-5590-ed6b-bbbc-7ba58f58fd2d	8259	Bizeljsko
00050000-5590-ed6b-8850-f79f72bb6a23	1223	Blagovica
00050000-5590-ed6b-df6e-abbaa72d93ce	8283	Blanca
00050000-5590-ed6b-d9c1-8ba9860f5811	4260	Bled
00050000-5590-ed6b-27ad-86f43d16473c	4273	Blejska Dobrava
00050000-5590-ed6b-659d-f8498256307a	9265	Bodonci
00050000-5590-ed6b-f29b-f4d48212839d	9222	Bogojina
00050000-5590-ed6b-8237-55ccf1613729	4263	Bohinjska Bela
00050000-5590-ed6b-faa3-7cbfbd5e3226	4264	Bohinjska Bistrica
00050000-5590-ed6b-97f9-e6f58058b853	4265	Bohinjsko jezero
00050000-5590-ed6b-746d-49a9ecfdb3f5	1353	Borovnica
00050000-5590-ed6b-57bf-e7afc6d9fd2a	8294	Boštanj
00050000-5590-ed6b-a737-808b37c1262a	5230	Bovec
00050000-5590-ed6b-c7f8-e2f935c6fcbd	5295	Branik
00050000-5590-ed6b-53a0-b59cb17a8202	3314	Braslovče
00050000-5590-ed6b-b0c1-5ecc70be9612	5223	Breginj
00050000-5590-ed6b-7ace-27a97c07fc02	8280	Brestanica
00050000-5590-ed6b-5260-511a2b9e6a74	2354	Bresternica
00050000-5590-ed6b-8c96-60f3ad1d7d37	4243	Brezje
00050000-5590-ed6b-22af-b035a67c938e	1351	Brezovica pri Ljubljani
00050000-5590-ed6b-9b54-820453b6ef16	8250	Brežice
00050000-5590-ed6b-03a2-17fffcd48ffc	4210	Brnik - Aerodrom
00050000-5590-ed6b-95e6-36947b7759c0	8321	Brusnice
00050000-5590-ed6b-d6cc-4ad47123353f	3255	Buče
00050000-5590-ed6b-6e9d-f27a8df03ca2	8276	Bučka 
00050000-5590-ed6b-b2bd-2583e7869384	9261	Cankova
00050000-5590-ed6b-216d-7dfcae51c099	3000	Celje 
00050000-5590-ed6b-66af-0864dcef5fdb	3001	Celje - poštni predali
00050000-5590-ed6b-db44-abacbf64fbad	4207	Cerklje na Gorenjskem
00050000-5590-ed6b-16ba-351a6376032f	8263	Cerklje ob Krki
00050000-5590-ed6b-bfaf-9df9eef443a8	1380	Cerknica
00050000-5590-ed6b-2e4a-16ec50e19e3e	5282	Cerkno
00050000-5590-ed6b-9d57-6a41b78dc5c8	2236	Cerkvenjak
00050000-5590-ed6b-16b7-e0fea411ac0c	2215	Ceršak
00050000-5590-ed6b-246a-8290b4864a0e	2326	Cirkovce
00050000-5590-ed6b-a164-057ee5748423	2282	Cirkulane
00050000-5590-ed6b-c8a2-df8a4b83a34b	5273	Col
00050000-5590-ed6b-097f-5de8e020e2ea	8251	Čatež ob Savi
00050000-5590-ed6b-3af9-387f9e85a146	1413	Čemšenik
00050000-5590-ed6b-aa04-15b687f78a99	5253	Čepovan
00050000-5590-ed6b-b3fa-8c35c1eb1795	9232	Črenšovci
00050000-5590-ed6b-3e44-9f4be812aaf2	2393	Črna na Koroškem
00050000-5590-ed6b-5e2c-e6af097852d3	6275	Črni Kal
00050000-5590-ed6b-7e57-646f4bbfa24a	5274	Črni Vrh nad Idrijo
00050000-5590-ed6b-321f-4f64ae1806f5	5262	Črniče
00050000-5590-ed6b-1d77-1ae0f0918fda	8340	Črnomelj
00050000-5590-ed6b-a01e-1819267c318f	6271	Dekani
00050000-5590-ed6b-7ea9-ff73da2a1ed7	5210	Deskle
00050000-5590-ed6b-12e8-134292dd3bba	2253	Destrnik
00050000-5590-ed6b-b479-7fb68b140333	6215	Divača
00050000-5590-ed6b-1580-bf99c083210f	1233	Dob
00050000-5590-ed6b-6648-02b9ee43d290	3224	Dobje pri Planini
00050000-5590-ed6b-46de-c0dca45a6c01	8257	Dobova
00050000-5590-ed6b-44b6-47549b9fddc8	1423	Dobovec
00050000-5590-ed6b-8688-ae7fb07f61cb	5263	Dobravlje
00050000-5590-ed6b-bcdc-4a4a4c1cae9a	3204	Dobrna
00050000-5590-ed6b-935e-83fba89fe8f1	8211	Dobrnič
00050000-5590-ed6b-bbf0-68375167cdc4	1356	Dobrova
00050000-5590-ed6b-200f-4a26a4f65f63	9223	Dobrovnik/Dobronak 
00050000-5590-ed6b-ca43-c83bb097b219	5212	Dobrovo v Brdih
00050000-5590-ed6b-2629-0adb4c783a41	1431	Dol pri Hrastniku
00050000-5590-ed6b-429e-abd7da67050e	1262	Dol pri Ljubljani
00050000-5590-ed6b-ba02-cb1b18b58c1d	1273	Dole pri Litiji
00050000-5590-ed6b-9320-27a29463d92c	1331	Dolenja vas
00050000-5590-ed6b-8c64-b76ca23215f3	8350	Dolenjske Toplice
00050000-5590-ed6b-e440-e6b4c94ff5d7	1230	Domžale
00050000-5590-ed6b-e1a6-7a5931b9bc6d	2252	Dornava
00050000-5590-ed6b-8cc6-91a0f4726e6b	5294	Dornberk
00050000-5590-ed6b-41c6-45002e027577	1319	Draga
00050000-5590-ed6b-e798-f9d690b3d162	8343	Dragatuš
00050000-5590-ed6b-7365-e7693bcb956b	3222	Dramlje
00050000-5590-ed6b-cfd4-5a2e490de34a	2370	Dravograd
00050000-5590-ed6b-a70f-c7c7e5c06110	4203	Duplje
00050000-5590-ed6b-60eb-4f7d92c2b9c5	6221	Dutovlje
00050000-5590-ed6b-eeb1-81366d6169eb	8361	Dvor
00050000-5590-ed6b-7cc7-52cb494ffeeb	2343	Fala
00050000-5590-ed6b-f8e5-7204574f2de4	9208	Fokovci
00050000-5590-ed6b-4c4b-6e832fb10477	2313	Fram
00050000-5590-ed6b-5a8e-650643b26c98	3213	Frankolovo
00050000-5590-ed6b-9fbb-fddb795f0d61	1274	Gabrovka
00050000-5590-ed6b-5574-d586aed516e8	8254	Globoko
00050000-5590-ed6b-181b-20c344ead36a	5275	Godovič
00050000-5590-ed6b-b8fe-a13c448a962d	4204	Golnik
00050000-5590-ed6b-5051-f9dd02856fa3	3303	Gomilsko
00050000-5590-ed6b-5e19-d86a7ea1ef14	4224	Gorenja vas
00050000-5590-ed6b-fdea-d2dd6492a8df	3263	Gorica pri Slivnici
00050000-5590-ed6b-75b7-60c552bd6c6d	2272	Gorišnica
00050000-5590-ed6b-b76b-ce66b14a58f4	9250	Gornja Radgona
00050000-5590-ed6b-c52c-0eeac60c3252	3342	Gornji Grad
00050000-5590-ed6b-cad0-5aa5d63e2897	4282	Gozd Martuljek
00050000-5590-ed6b-40a4-bc62a13c7797	6272	Gračišče
00050000-5590-ed6b-431b-7f11e0df47cd	9264	Grad
00050000-5590-ed6b-739a-4c3f1a09dfd4	8332	Gradac
00050000-5590-ed6b-a727-57db8f66d346	1384	Grahovo
00050000-5590-ed6b-22d8-10de424efbdf	5242	Grahovo ob Bači
00050000-5590-ed6b-05a9-00599cd4bdef	5251	Grgar
00050000-5590-ed6b-1f0b-3e7243f13d55	3302	Griže
00050000-5590-ed6b-06ad-d969fc2c707f	3231	Grobelno
00050000-5590-ed6b-53ca-7afa574d2b4f	1290	Grosuplje
00050000-5590-ed6b-f7ab-2b589ddf445f	2288	Hajdina
00050000-5590-ed6b-b2cf-68dc5aa78dae	8362	Hinje
00050000-5590-ed6b-f8a9-248401144585	2311	Hoče
00050000-5590-ed6b-5dc4-7ca3fc64af4f	9205	Hodoš/Hodos
00050000-5590-ed6b-ef28-ed117ab417f7	1354	Horjul
00050000-5590-ed6b-21e3-022634618272	1372	Hotedršica
00050000-5590-ed6b-34e9-fddd840ecab9	1430	Hrastnik
00050000-5590-ed6b-9b2c-7f6f6cda996e	6225	Hruševje
00050000-5590-ed6b-cba6-869e702bfd9e	4276	Hrušica
00050000-5590-ed6b-ec56-049840359f5d	5280	Idrija
00050000-5590-ed6b-0292-8e320ba8bd9e	1292	Ig
00050000-5590-ed6b-a971-02d312bfb796	6250	Ilirska Bistrica
00050000-5590-ed6b-224d-91b438e97d43	6251	Ilirska Bistrica-Trnovo
00050000-5590-ed6b-7e3e-01aa7b9dff48	1295	Ivančna Gorica
00050000-5590-ed6b-0702-547579c96a5a	2259	Ivanjkovci
00050000-5590-ed6b-575a-679383446b37	1411	Izlake
00050000-5590-ed6b-fdf5-9a98a5530267	6310	Izola/Isola
00050000-5590-ed6b-f313-383e6f77f686	2222	Jakobski Dol
00050000-5590-ed6b-94b6-78c12b786594	2221	Jarenina
00050000-5590-ed6b-6431-dd263b65ff5c	6254	Jelšane
00050000-5590-ed6b-8495-3f85e8f4524f	4270	Jesenice
00050000-5590-ed6b-694e-4affb79be80a	8261	Jesenice na Dolenjskem
00050000-5590-ed6b-8ba4-5e225cc75054	3273	Jurklošter
00050000-5590-ed6b-dc37-d6aa15185553	2223	Jurovski Dol
00050000-5590-ed6b-1a15-ac3318dc2607	2256	Juršinci
00050000-5590-ed6b-51ab-53ce167049f2	5214	Kal nad Kanalom
00050000-5590-ed6b-7a4a-d0ff8603d1d3	3233	Kalobje
00050000-5590-ed6b-1f11-4a3a363d20be	4246	Kamna Gorica
00050000-5590-ed6b-7761-c944263be741	2351	Kamnica
00050000-5590-ed6b-9212-3b45f7268218	1241	Kamnik
00050000-5590-ed6b-5d84-a45ad5bad96e	5213	Kanal
00050000-5590-ed6b-4a01-330e965d7c5c	8258	Kapele
00050000-5590-ed6b-8b7a-db614d6b216a	2362	Kapla
00050000-5590-ed6b-1766-3329cae40c1e	2325	Kidričevo
00050000-5590-ed6b-5547-1cec15be9506	1412	Kisovec
00050000-5590-ed6b-c5a2-39fc80652400	6253	Knežak
00050000-5590-ed6b-f5fc-f2a82577450f	5222	Kobarid
00050000-5590-ed6b-33eb-b297dba725f8	9227	Kobilje
00050000-5590-ed6b-d3ff-ed14dc52f8ec	1330	Kočevje
00050000-5590-ed6b-e505-c9bc67f249d8	1338	Kočevska Reka
00050000-5590-ed6b-a4d9-aa1e418b803f	2276	Kog
00050000-5590-ed6b-528d-5d38216e17be	5211	Kojsko
00050000-5590-ed6b-8259-7061bcfc5ba6	6223	Komen
00050000-5590-ed6b-ed7a-7ffa21141d57	1218	Komenda
00050000-5590-ed6b-07b7-e67f630bb681	6000	Koper/Capodistria 
00050000-5590-ed6b-f180-84f28ece4775	6001	Koper/Capodistria - poštni predali
00050000-5590-ed6b-081e-654d13ed0eee	8282	Koprivnica
00050000-5590-ed6b-fcd1-749846ec3f62	5296	Kostanjevica na Krasu
00050000-5590-ed6b-50de-a071a6698789	8311	Kostanjevica na Krki
00050000-5590-ed6b-4e7d-093cf856d832	1336	Kostel
00050000-5590-ed6b-7a39-469c7b895899	6256	Košana
00050000-5590-ed6b-0b14-6706241d8bbc	2394	Kotlje
00050000-5590-ed6b-ed36-6ad063587c26	6240	Kozina
00050000-5590-ed6b-5530-baca3edd3589	3260	Kozje
00050000-5590-ed6b-56d2-af09bcf9218e	4000	Kranj 
00050000-5590-ed6b-f46c-382918b21a35	4001	Kranj - poštni predali
00050000-5590-ed6b-93f5-34a73905948b	4280	Kranjska Gora
00050000-5590-ed6b-0730-1583af2b3a60	1281	Kresnice
00050000-5590-ed6b-b552-a2a46f1a01b8	4294	Križe
00050000-5590-ed6b-c01d-b3e7f4a2f823	9206	Križevci
00050000-5590-ed6b-a650-888aacc0d92d	9242	Križevci pri Ljutomeru
00050000-5590-ed6b-1e17-891b4ff3d93c	1301	Krka
00050000-5590-ed6b-519e-f5032ac29193	8296	Krmelj
00050000-5590-ed6b-989c-2fcc141682c8	4245	Kropa
00050000-5590-ed6b-9ac3-c0a0332ac0af	8262	Krška vas
00050000-5590-ed6b-0a7e-6176b825dc6c	8270	Krško
00050000-5590-ed6b-f288-32ef4e8b4eac	9263	Kuzma
00050000-5590-ed6b-ca86-d063a29e82a0	2318	Laporje
00050000-5590-ed6b-3d4c-274998764fc4	3270	Laško
00050000-5590-ed6b-2f6b-f9a06e732bb6	1219	Laze v Tuhinju
00050000-5590-ed6b-e6c4-a4b3d84f7a68	2230	Lenart v Slovenskih goricah
00050000-5590-ed6b-2346-e6ab9862a417	9220	Lendava/Lendva
00050000-5590-ed6b-5247-8bfb3d8dca6f	4248	Lesce
00050000-5590-ed6b-6609-61e0305d7d60	3261	Lesično
00050000-5590-ed6b-ca10-036483526d14	8273	Leskovec pri Krškem
00050000-5590-ed6b-cedc-71c5519b14ca	2372	Libeliče
00050000-5590-ed6b-55f7-cb00a85cd3b9	2341	Limbuš
00050000-5590-ed6b-b86e-1daa5707158b	1270	Litija
00050000-5590-ed6b-f1d2-56ca8213b587	3202	Ljubečna
00050000-5590-ed6b-ac7c-dbdb9ccf1720	1000	Ljubljana 
00050000-5590-ed6b-1975-460f92a016d4	1001	Ljubljana - poštni predali
00050000-5590-ed6b-03b2-66da0da19f3c	1231	Ljubljana - Črnuče
00050000-5590-ed6b-13c0-74bf21a7280b	1261	Ljubljana - Dobrunje
00050000-5590-ed6b-16a0-e6851d3d6c98	1260	Ljubljana - Polje
00050000-5590-ed6b-2962-9e30910e86a2	1210	Ljubljana - Šentvid
00050000-5590-ed6b-9f7f-a17b632fe450	1211	Ljubljana - Šmartno
00050000-5590-ed6b-fc10-b61fe0aa025a	3333	Ljubno ob Savinji
00050000-5590-ed6b-8b7b-050fa0775082	9240	Ljutomer
00050000-5590-ed6b-7b81-3846c4dd20a4	3215	Loče
00050000-5590-ed6b-6b3b-5ea690579f40	5231	Log pod Mangartom
00050000-5590-ed6b-2292-3b023d77cdaf	1358	Log pri Brezovici
00050000-5590-ed6b-8f2f-7dfcf5333d4d	1370	Logatec
00050000-5590-ed6b-c12e-8ecf7ed2e767	1371	Logatec
00050000-5590-ed6b-2e1b-860097c62336	1434	Loka pri Zidanem Mostu
00050000-5590-ed6b-adb4-693642fa25fb	3223	Loka pri Žusmu
00050000-5590-ed6b-a3bc-be6f0be4ca75	6219	Lokev
00050000-5590-ed6b-92a4-a15c9a63af0a	1318	Loški Potok
00050000-5590-ed6b-117a-72f49f4b2fa9	2324	Lovrenc na Dravskem polju
00050000-5590-ed6b-20e7-61a394b7eb06	2344	Lovrenc na Pohorju
00050000-5590-ed6b-10ed-e4184d598a30	3334	Luče
00050000-5590-ed6b-392e-15789709108a	1225	Lukovica
00050000-5590-ed6b-8b06-03fdd4695e25	9202	Mačkovci
00050000-5590-ed6b-d18f-277b26c0d51f	2322	Majšperk
00050000-5590-ed6b-4802-8db992d74dfc	2321	Makole
00050000-5590-ed6b-efa4-3a83912af8b0	9243	Mala Nedelja
00050000-5590-ed6b-abcd-f110f0dbb794	2229	Malečnik
00050000-5590-ed6b-63a6-c8d1c0ee193e	6273	Marezige
00050000-5590-ed6b-c0d7-16a160191393	2000	Maribor 
00050000-5590-ed6b-edbb-6087afb86af2	2001	Maribor - poštni predali
00050000-5590-ed6b-5fd4-aaedb53463ad	2206	Marjeta na Dravskem polju
00050000-5590-ed6b-5f29-1003e2bc35b3	2281	Markovci
00050000-5590-ed6b-20c3-641baf928398	9221	Martjanci
00050000-5590-ed6b-595f-441e4453a34f	6242	Materija
00050000-5590-ed6b-fdf7-7d883a5fe91d	4211	Mavčiče
00050000-5590-ed6b-75c1-ec05068a6b9f	1215	Medvode
00050000-5590-ed6b-7ca6-b7cd5ca5a3d1	1234	Mengeš
00050000-5590-ed6b-a629-8c534c0bf639	8330	Metlika
00050000-5590-ed6b-8dad-0958eb177b8e	2392	Mežica
00050000-5590-ed6b-5973-b8e505da7b29	2204	Miklavž na Dravskem polju
00050000-5590-ed6b-ca82-3fa4fed9aeaa	2275	Miklavž pri Ormožu
00050000-5590-ed6b-40d4-3ba887e3e3e7	5291	Miren
00050000-5590-ed6b-61bb-63a5804f78e0	8233	Mirna
00050000-5590-ed6b-0afe-8d215bd5c05f	8216	Mirna Peč
00050000-5590-ed6b-47ea-88e1bb3ae40d	2382	Mislinja
00050000-5590-ed6b-af6d-1486ea8155a1	4281	Mojstrana
00050000-5590-ed6b-3c11-dfa2036852a0	8230	Mokronog
00050000-5590-ed6b-8ef5-9e639fe1507e	1251	Moravče
00050000-5590-ed6b-36f6-980812b75525	9226	Moravske Toplice
00050000-5590-ed6b-ab0e-8d959e27b728	5216	Most na Soči
00050000-5590-ed6b-f0c1-bed351f6a603	1221	Motnik
00050000-5590-ed6b-4388-544c1505c352	3330	Mozirje
00050000-5590-ed6b-a1fb-6bdec7ffd498	9000	Murska Sobota 
00050000-5590-ed6b-a878-52fa8b10ca42	9001	Murska Sobota - poštni predali
00050000-5590-ed6b-e6d8-34bc6828a58b	2366	Muta
00050000-5590-ed6b-9f40-7d8c2effe169	4202	Naklo
00050000-5590-ed6b-561d-dc7bd98e3280	3331	Nazarje
00050000-5590-ed6b-e907-92fe14ff6e6f	1357	Notranje Gorice
00050000-5590-ed6b-350a-d380bc97c2eb	3203	Nova Cerkev
00050000-5590-ed6b-aca1-b836c7b2729d	5000	Nova Gorica 
00050000-5590-ed6b-fbd0-eb39a0d8fa4e	5001	Nova Gorica - poštni predali
00050000-5590-ed6b-b444-887c5ae13bd7	1385	Nova vas
00050000-5590-ed6b-f897-798e8cc4c578	8000	Novo mesto
00050000-5590-ed6b-b18e-a5b1dde3d7a1	8001	Novo mesto - poštni predali
00050000-5590-ed6b-2ec4-3e26f40706ff	6243	Obrov
00050000-5590-ed6b-a9aa-9242662bc74f	9233	Odranci
00050000-5590-ed6b-99b3-b77fc64ef50d	2317	Oplotnica
00050000-5590-ed6b-3609-b49cf55e4322	2312	Orehova vas
00050000-5590-ed6b-4a00-d9cd9cd7563c	2270	Ormož
00050000-5590-ed6b-5c9a-37d1c280b98c	1316	Ortnek
00050000-5590-ed6b-0215-16f2cae978c0	1337	Osilnica
00050000-5590-ed6b-7a84-d88742082bc9	8222	Otočec
00050000-5590-ed6b-94e9-83ff327c46b9	2361	Ožbalt
00050000-5590-ed6b-766f-8008e883ee59	2231	Pernica
00050000-5590-ed6b-ca70-64b88566e01a	2211	Pesnica pri Mariboru
00050000-5590-ed6b-4715-b03a5ae11e2b	9203	Petrovci
00050000-5590-ed6b-baf9-0253f0b6752b	3301	Petrovče
00050000-5590-ed6b-f09b-b9adc9f2edd8	6330	Piran/Pirano
00050000-5590-ed6b-c0d8-ecd545c828d4	8255	Pišece
00050000-5590-ed6b-8f3f-d72a7a5caa3b	6257	Pivka
00050000-5590-ed6b-c9d5-bdaaaa929a9b	6232	Planina
00050000-5590-ed6b-96e3-0dd1785c8f37	3225	Planina pri Sevnici
00050000-5590-ed6b-df06-b23b629666c1	6276	Pobegi
00050000-5590-ed6b-6f33-5d3e63d3e768	8312	Podbočje
00050000-5590-ed6b-ef89-c61e94f55b54	5243	Podbrdo
00050000-5590-ed6b-9d29-17bb1b8ea068	3254	Podčetrtek
00050000-5590-ed6b-0ac7-31b0fbbc6ec0	2273	Podgorci
00050000-5590-ed6b-acc1-c82a20084bff	6216	Podgorje
00050000-5590-ed6b-a384-51185f5d8126	2381	Podgorje pri Slovenj Gradcu
00050000-5590-ed6b-a1e6-6644a150a6a4	6244	Podgrad
00050000-5590-ed6b-efae-9ce66a8f6d63	1414	Podkum
00050000-5590-ed6b-665f-2c77b8107482	2286	Podlehnik
00050000-5590-ed6b-e352-6f8aefa5349c	5272	Podnanos
00050000-5590-ed6b-496d-45a0572b094f	4244	Podnart
00050000-5590-ed6b-3dd3-8c6eb2d3ca51	3241	Podplat
00050000-5590-ed6b-82dc-844ba4774159	3257	Podsreda
00050000-5590-ed6b-01a3-501d41326995	2363	Podvelka
00050000-5590-ed6b-322b-d7a36519f96a	2208	Pohorje
00050000-5590-ed6b-59ba-404e7ee57ac4	2257	Polenšak
00050000-5590-ed6b-41b6-61045fe0f337	1355	Polhov Gradec
00050000-5590-ed6b-6cec-d0ba981886bd	4223	Poljane nad Škofjo Loko
00050000-5590-ed6b-8b57-08e39d06a14d	2319	Poljčane
00050000-5590-ed6b-85b1-e2d5d6c7e621	1272	Polšnik
00050000-5590-ed6b-22ab-5152c82055c7	3313	Polzela
00050000-5590-ed6b-59fd-12a98c9a090f	3232	Ponikva
00050000-5590-ed6b-fd75-810681bd382d	6320	Portorož/Portorose
00050000-5590-ed6b-06a5-5a94dbaa8a0a	6230	Postojna
00050000-5590-ed6b-b3c3-7df845c76d38	2331	Pragersko
00050000-5590-ed6b-f8b8-fd4194f51059	3312	Prebold
00050000-5590-ed6b-5d72-5a079e22c601	4205	Preddvor
00050000-5590-ed6b-3154-8f63e381927d	6255	Prem
00050000-5590-ed6b-113d-6a16f92c9a62	1352	Preserje
00050000-5590-ed6b-30e1-dfb71046077e	6258	Prestranek
00050000-5590-ed6b-86b4-4435e6972896	2391	Prevalje
00050000-5590-ed6b-4423-4b700e92b63c	3262	Prevorje
00050000-5590-ed6b-77cd-24aabbecd28f	1276	Primskovo 
00050000-5590-ed6b-e437-1eae3423dbc5	3253	Pristava pri Mestinju
00050000-5590-ed6b-2789-69b1d2dbed6e	9207	Prosenjakovci/Partosfalva
00050000-5590-ed6b-6094-6a894a3ace36	5297	Prvačina
00050000-5590-ed6b-454c-7a48a80fec85	2250	Ptuj
00050000-5590-ed6b-c387-332416f2f212	2323	Ptujska Gora
00050000-5590-ed6b-6742-42ae60f2ad2f	9201	Puconci
00050000-5590-ed6b-c149-0b5538e3b636	2327	Rače
00050000-5590-ed6b-6ebd-508996b9bb79	1433	Radeče
00050000-5590-ed6b-87aa-fb9f5f17d53a	9252	Radenci
00050000-5590-ed6b-a6e7-1977518e5ceb	2360	Radlje ob Dravi
00050000-5590-ed6b-866b-c96965e3d532	1235	Radomlje
00050000-5590-ed6b-4ed0-5655753eeb8e	4240	Radovljica
00050000-5590-ed6b-ca2b-95e9ea65792d	8274	Raka
00050000-5590-ed6b-bae0-7119c6a5949c	1381	Rakek
00050000-5590-ed6b-dea3-f51e88f1404b	4283	Rateče - Planica
00050000-5590-ed6b-fb0c-9de48f74c8d5	2390	Ravne na Koroškem
00050000-5590-ed6b-fc78-fc78983e3ae0	9246	Razkrižje
00050000-5590-ed6b-d1b5-104a3ba9b64c	3332	Rečica ob Savinji
00050000-5590-ed6b-6680-af471ce38080	5292	Renče
00050000-5590-ed6b-ea4e-c3b9d98ca066	1310	Ribnica
00050000-5590-ed6b-827b-0e21228a64f4	2364	Ribnica na Pohorju
00050000-5590-ed6b-a343-984937a1cbbd	3272	Rimske Toplice
00050000-5590-ed6b-4ef3-3e9a1ab94b96	1314	Rob
00050000-5590-ed6b-d327-f1177e5b1c7c	5215	Ročinj
00050000-5590-ed6b-fee9-37946c1ec526	3250	Rogaška Slatina
00050000-5590-ed6b-4013-8eed8cb34697	9262	Rogašovci
00050000-5590-ed6b-cf19-b1486b519392	3252	Rogatec
00050000-5590-ed6b-140b-4158465e4a06	1373	Rovte
00050000-5590-ed6b-795c-357e2f2b5791	2342	Ruše
00050000-5590-ed6b-db24-31e071d364f1	1282	Sava
00050000-5590-ed6b-c611-f70db3895a10	6333	Sečovlje/Sicciole
00050000-5590-ed6b-2ab5-0885bb1d0d17	4227	Selca
00050000-5590-ed6b-bb8f-e52ffc2a47b6	2352	Selnica ob Dravi
00050000-5590-ed6b-eecd-c00a57802175	8333	Semič
00050000-5590-ed6b-1f73-844012ca7402	8281	Senovo
00050000-5590-ed6b-3d9e-393778a67217	6224	Senožeče
00050000-5590-ed6b-d23b-65a33c8e7e9c	8290	Sevnica
00050000-5590-ed6b-c83e-f2db8dc287fb	6210	Sežana
00050000-5590-ed6b-01ad-1f5cd35fd69b	2214	Sladki Vrh
00050000-5590-ed6b-d210-abfb12bc0ba7	5283	Slap ob Idrijci
00050000-5590-ed6b-eb06-6ce33d3dd472	2380	Slovenj Gradec
00050000-5590-ed6b-76d2-c8f4290369b0	2310	Slovenska Bistrica
00050000-5590-ed6b-c970-ba0ce1a35458	3210	Slovenske Konjice
00050000-5590-ed6b-0e31-e0a943b55227	1216	Smlednik
00050000-5590-ed6b-0d65-7e9efca234dc	5232	Soča
00050000-5590-ed6b-aa29-b0b1e6799d31	1317	Sodražica
00050000-5590-ed6b-93e1-7552071d8218	3335	Solčava
00050000-5590-ed6b-448b-d8713b843a77	5250	Solkan
00050000-5590-ed6b-1723-e9357555a9b2	4229	Sorica
00050000-5590-ed6b-35c3-edaa39abd7f0	4225	Sovodenj
00050000-5590-ed6b-60ec-2d2edefe79bb	5281	Spodnja Idrija
00050000-5590-ed6b-ef85-78b9985576df	2241	Spodnji Duplek
00050000-5590-ed6b-29b7-5140d4671de4	9245	Spodnji Ivanjci
00050000-5590-ed6b-1798-1e56e6500ef9	2277	Središče ob Dravi
00050000-5590-ed6b-5690-0d214136a0fa	4267	Srednja vas v Bohinju
00050000-5590-ed6b-622b-55cb87be9039	8256	Sromlje 
00050000-5590-ed6b-1465-5a08ba17c95c	5224	Srpenica
00050000-5590-ed6b-757e-2155aa6093ac	1242	Stahovica
00050000-5590-ed6b-8e44-921ce6fe8df8	1332	Stara Cerkev
00050000-5590-ed6b-d789-0daf3546b602	8342	Stari trg ob Kolpi
00050000-5590-ed6b-a098-ba8b20bb0a36	1386	Stari trg pri Ložu
00050000-5590-ed6b-3339-6f27fabc8da5	2205	Starše
00050000-5590-ed6b-b1b9-fdcb992a29b2	2289	Stoperce
00050000-5590-ed6b-0def-1853d8e89b26	8322	Stopiče
00050000-5590-ed6b-93d0-bc0d75d3ac50	3206	Stranice
00050000-5590-ed6b-bf86-aa1a3a811a8d	8351	Straža
00050000-5590-ed6b-1b19-df76f8c390a2	1313	Struge
00050000-5590-ed6b-d32d-b2f42a093a7e	8293	Studenec
00050000-5590-ed6b-d0f6-0999bdf92842	8331	Suhor
00050000-5590-ed6b-0987-08ec5dfa67d9	2233	Sv. Ana v Slovenskih goricah
00050000-5590-ed6b-2f3c-55aeb0033d9d	2235	Sv. Trojica v Slovenskih goricah
00050000-5590-ed6b-c471-d9d1feb85080	2353	Sveti Duh na Ostrem Vrhu
00050000-5590-ed6b-c45d-a6eb0816a0b4	9244	Sveti Jurij ob Ščavnici
00050000-5590-ed6b-9fca-0504ed151714	3264	Sveti Štefan
00050000-5590-ed6b-ce75-b6b3bb1a138f	2258	Sveti Tomaž
00050000-5590-ed6b-e222-04a9acba1cf8	9204	Šalovci
00050000-5590-ed6b-e33e-14cd5a1e15a4	5261	Šempas
00050000-5590-ed6b-7aaf-a13e6b2d6deb	5290	Šempeter pri Gorici
00050000-5590-ed6b-1087-b297d1071984	3311	Šempeter v Savinjski dolini
00050000-5590-ed6b-a5e0-cafc2a7e0d0f	4208	Šenčur
00050000-5590-ed6b-fd04-ead062c97279	2212	Šentilj v Slovenskih goricah
00050000-5590-ed6b-855d-a440efa9e8b2	8297	Šentjanž
00050000-5590-ed6b-0320-92886db0b289	2373	Šentjanž pri Dravogradu
00050000-5590-ed6b-4963-855ff5e3f7cb	8310	Šentjernej
00050000-5590-ed6b-a2f4-a1c2d19a1be7	3230	Šentjur
00050000-5590-ed6b-0d8a-4989783e38e0	3271	Šentrupert
00050000-5590-ed6b-29c5-9779494b0fe7	8232	Šentrupert
00050000-5590-ed6b-69ee-55a3e341236d	1296	Šentvid pri Stični
00050000-5590-ed6b-aa91-a8ec5be76000	8275	Škocjan
00050000-5590-ed6b-6e15-235668d7feca	6281	Škofije
00050000-5590-ed6b-dff1-c0a040c0d743	4220	Škofja Loka
00050000-5590-ed6b-1df0-fcf13a622d46	3211	Škofja vas
00050000-5590-ed6b-b626-05de70e56224	1291	Škofljica
00050000-5590-ed6b-f7f0-19f65a495e13	6274	Šmarje
00050000-5590-ed6b-7fef-1c833f7f7802	1293	Šmarje - Sap
00050000-5590-ed6b-a8b4-3171bcf07e6e	3240	Šmarje pri Jelšah
00050000-5590-ed6b-38a6-68319279a45d	8220	Šmarješke Toplice
00050000-5590-ed6b-c2ea-a90a77b4d417	2315	Šmartno na Pohorju
00050000-5590-ed6b-d319-18e7e6a3f2ab	3341	Šmartno ob Dreti
00050000-5590-ed6b-b861-91a5a1610a54	3327	Šmartno ob Paki
00050000-5590-ed6b-65c8-b6cb4d12e878	1275	Šmartno pri Litiji
00050000-5590-ed6b-e673-c849da3e106b	2383	Šmartno pri Slovenj Gradcu
00050000-5590-ed6b-1390-3f701c62cf76	3201	Šmartno v Rožni dolini
00050000-5590-ed6b-99b2-595c33be7679	3325	Šoštanj
00050000-5590-ed6b-3d88-77e98e28e3ab	6222	Štanjel
00050000-5590-ed6b-95f1-ebd057ed7018	3220	Štore
00050000-5590-ed6b-80f4-c6e6ba72c358	3304	Tabor
00050000-5590-ed6b-5672-dba29377e045	3221	Teharje
00050000-5590-ed6b-1075-e30ca8aab4f2	9251	Tišina
00050000-5590-ed6b-4c11-01759f011f35	5220	Tolmin
00050000-5590-ed6b-e9d4-598bfb1875f8	3326	Topolšica
00050000-5590-ed6b-d907-5341ccc377a2	2371	Trbonje
00050000-5590-ed6b-00e0-260718fc3d11	1420	Trbovlje
00050000-5590-ed6b-ab4c-1d6aa9ae660b	8231	Trebelno 
00050000-5590-ed6b-92a0-6780b1a8ec9b	8210	Trebnje
00050000-5590-ed6b-7e91-a445ee69410d	5252	Trnovo pri Gorici
00050000-5590-ed6b-61e4-8756669c1142	2254	Trnovska vas
00050000-5590-ed6b-357c-169c5712b6b0	1222	Trojane
00050000-5590-ed6b-2be3-02fa7c4c1715	1236	Trzin
00050000-5590-ed6b-76f8-303497a0575e	4290	Tržič
00050000-5590-ed6b-c149-c1a7d8882f4a	8295	Tržišče
00050000-5590-ed6b-cbbb-e2011b0f30ec	1311	Turjak
00050000-5590-ed6b-1ace-10377b6441d2	9224	Turnišče
00050000-5590-ed6b-b2e6-3012c6256f91	8323	Uršna sela
00050000-5590-ed6b-9370-a63a2a5098e9	1252	Vače
00050000-5590-ed6b-5811-d40fe1cf6d7e	3320	Velenje 
00050000-5590-ed6b-cc6b-484eb7fa890d	3322	Velenje - poštni predali
00050000-5590-ed6b-ca73-152069d40a6c	8212	Velika Loka
00050000-5590-ed6b-60c8-080cbd52e0d2	2274	Velika Nedelja
00050000-5590-ed6b-bd68-3bac32bbbf35	9225	Velika Polana
00050000-5590-ed6b-9017-ac161b60860e	1315	Velike Lašče
00050000-5590-ed6b-a245-8aa144aeabf0	8213	Veliki Gaber
00050000-5590-ed6b-5e85-a2d22d3202b3	9241	Veržej
00050000-5590-ed6b-cf33-20eb0d19491b	1312	Videm - Dobrepolje
00050000-5590-ed6b-2416-f5677f7917eb	2284	Videm pri Ptuju
00050000-5590-ed6b-19c1-6434f17908d5	8344	Vinica
00050000-5590-ed6b-3712-9f02695e3705	5271	Vipava
00050000-5590-ed6b-c672-abbd60ad2091	4212	Visoko
00050000-5590-ed6b-3114-fc8db5b3cbaa	1294	Višnja Gora
00050000-5590-ed6b-1ff9-90185871f0a6	3205	Vitanje
00050000-5590-ed6b-56c2-8d08e97b4565	2255	Vitomarci
00050000-5590-ed6b-ed0f-85ca042e696e	1217	Vodice
00050000-5590-ed6b-3530-ac495002a224	3212	Vojnik\t
00050000-5590-ed6b-8c6f-a69aa3788b3b	5293	Volčja Draga
00050000-5590-ed6b-5ba4-f43ce7190596	2232	Voličina
00050000-5590-ed6b-a5f9-bc40ddcc7153	3305	Vransko
00050000-5590-ed6b-b30f-801ab7f2041b	6217	Vremski Britof
00050000-5590-ed6b-52e5-9faf8bde06bb	1360	Vrhnika
00050000-5590-ed6b-8346-017254ef24c3	2365	Vuhred
00050000-5590-ed6b-7e6c-61478d8955fd	2367	Vuzenica
00050000-5590-ed6b-38c0-36ef7a9a4419	8292	Zabukovje 
00050000-5590-ed6b-5636-9def7cfa7be4	1410	Zagorje ob Savi
00050000-5590-ed6b-87de-3ef87689f9ae	1303	Zagradec
00050000-5590-ed6b-9d9a-ccaae4084bbc	2283	Zavrč
00050000-5590-ed6b-b891-15e3d4b87e60	8272	Zdole 
00050000-5590-ed6b-57fb-25520f06619a	4201	Zgornja Besnica
00050000-5590-ed6b-d9e2-921987d4bf2b	2242	Zgornja Korena
00050000-5590-ed6c-2214-b87bb0551857	2201	Zgornja Kungota
00050000-5590-ed6c-f1ce-eb4719636000	2316	Zgornja Ložnica
00050000-5590-ed6c-45eb-0e1163def4ab	2314	Zgornja Polskava
00050000-5590-ed6c-ba38-7f2b5a51d175	2213	Zgornja Velka
00050000-5590-ed6c-baba-7099ca272a5d	4247	Zgornje Gorje
00050000-5590-ed6c-2e4e-4f5227a7076a	4206	Zgornje Jezersko
00050000-5590-ed6c-aba3-1aebf55b748c	2285	Zgornji Leskovec
00050000-5590-ed6c-4425-47bc7c8796ba	1432	Zidani Most
00050000-5590-ed6c-14fa-4c04d9fc96ae	3214	Zreče
00050000-5590-ed6c-f613-a69ad149fe52	4209	Žabnica
00050000-5590-ed6c-6831-3eddc45a5d59	3310	Žalec
00050000-5590-ed6c-4bde-a6993072a634	4228	Železniki
00050000-5590-ed6c-b38a-f60ed562d36c	2287	Žetale
00050000-5590-ed6c-8943-91307c29242e	4226	Žiri
00050000-5590-ed6c-5878-35708ef8c1ac	4274	Žirovnica
00050000-5590-ed6c-d823-e8978991fdbe	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8331452)
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
-- TOC entry 2853 (class 0 OID 8331263)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8331341)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8331464)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8331584)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8331633)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5590-ed6d-eba9-1169f75043d7	00080000-5590-ed6d-466c-95a5dbf22a85	0900	AK
00190000-5590-ed6d-0f45-e670d03b4677	00080000-5590-ed6d-5dc2-facc3c42959f	0987	A
00190000-5590-ed6d-1103-b36be39de350	00080000-5590-ed6d-6e46-8c04bef0f543	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8331767)
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
-- TOC entry 2877 (class 0 OID 8331493)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5590-ed6c-05b0-4f877d7678bc	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5590-ed6c-e277-f1f418d73677	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5590-ed6c-1f5c-2f9da67f27e4	0003	Kazinska	t	84	Kazinska dvorana
00220000-5590-ed6c-3093-2e3c383d4817	0004	Mali oder	t	24	Mali oder 
00220000-5590-ed6c-3a5b-00c1041e79ec	0005	Komorni oder	t	15	Komorni oder
00220000-5590-ed6c-80ee-c9a44dde86ce	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5590-ed6c-9720-d269f76983e6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8331437)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8331427)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8331622)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8331561)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8331135)
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
-- TOC entry 2878 (class 0 OID 8331503)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8331173)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5590-ed6b-ca09-7945a6ec4cb9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5590-ed6b-eae5-80039ef5c6e5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5590-ed6b-87a4-fd9365f0d4fd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5590-ed6b-19fe-494cd48c7c6d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5590-ed6b-f263-47c6087fc09b	planer	Planer dogodkov v koledarju	t
00020000-5590-ed6b-d4c1-acc79d329992	kadrovska	Kadrovska služba	t
00020000-5590-ed6b-5075-0e846f297563	arhivar	Ažuriranje arhivalij	t
00020000-5590-ed6b-e83b-308bfd3ae009	igralec	Igralec	t
00020000-5590-ed6b-ec2b-feb57f2db4d0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5590-ed6d-c315-0867ed157fac	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8331157)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5590-ed6b-d69b-11adb36ec031	00020000-5590-ed6b-87a4-fd9365f0d4fd
00010000-5590-ed6b-f06a-bceee43db696	00020000-5590-ed6b-87a4-fd9365f0d4fd
00010000-5590-ed6d-17c8-d7974a05c70e	00020000-5590-ed6d-c315-0867ed157fac
\.


--
-- TOC entry 2880 (class 0 OID 8331517)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8331458)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8331408)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8331811)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5590-ed6c-0616-e005fa015e0e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5590-ed6c-a520-8456e2e827cd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5590-ed6c-8412-9a69a2561957	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5590-ed6c-93c6-f1759c9e7b31	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5590-ed6c-9b39-e8425fef17f1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8331803)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5590-ed6c-abac-aeb698c32862	00230000-5590-ed6c-93c6-f1759c9e7b31	popa
00240000-5590-ed6c-c067-66df07463472	00230000-5590-ed6c-93c6-f1759c9e7b31	oseba
00240000-5590-ed6c-f497-360b5a5d2139	00230000-5590-ed6c-a520-8456e2e827cd	prostor
00240000-5590-ed6c-5dd1-a0825ce80774	00230000-5590-ed6c-93c6-f1759c9e7b31	besedilo
00240000-5590-ed6c-14f9-3aa7b7c40f13	00230000-5590-ed6c-93c6-f1759c9e7b31	uprizoritev
00240000-5590-ed6c-9068-e86794c30201	00230000-5590-ed6c-93c6-f1759c9e7b31	funkcija
00240000-5590-ed6c-d63e-489d89d96a2a	00230000-5590-ed6c-93c6-f1759c9e7b31	tipfunkcije
00240000-5590-ed6c-8149-7834d5e461d2	00230000-5590-ed6c-93c6-f1759c9e7b31	alternacija
00240000-5590-ed6c-9052-6f93e97e22f1	00230000-5590-ed6c-0616-e005fa015e0e	pogodba
00240000-5590-ed6c-aaba-3724ca837898	00230000-5590-ed6c-93c6-f1759c9e7b31	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8331798)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8331571)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5590-ed6d-7748-8c49d2d40e5f	000e0000-5590-ed6d-0cb4-d5caf28bf19d	00080000-5590-ed6d-f6d7-863b4f639fd5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5590-ed6d-22f8-45ec774cf3d3	000e0000-5590-ed6d-0cb4-d5caf28bf19d	00080000-5590-ed6d-f6d7-863b4f639fd5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5590-ed6d-194f-fa8d67a294c4	000e0000-5590-ed6d-0cb4-d5caf28bf19d	00080000-5590-ed6d-579a-6a4d1c72bd70	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8331235)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8331414)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5590-ed6d-b473-d6a368530fb8	00180000-5590-ed6d-1587-70ccafdac3c8	000c0000-5590-ed6d-7799-1484ee9a5c6c	00090000-5590-ed6d-5f9f-af36fa2aa936	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-ed6d-0afa-92865186b3da	00180000-5590-ed6d-1587-70ccafdac3c8	000c0000-5590-ed6d-cb12-d67c7b0e1d65	00090000-5590-ed6d-5e07-5a0d28919fbf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-ed6d-d765-7d1e1746512e	00180000-5590-ed6d-1587-70ccafdac3c8	000c0000-5590-ed6d-6576-38deb71bba10	00090000-5590-ed6d-9a19-a0264e453cdb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-ed6d-f738-d8cda7b5557f	00180000-5590-ed6d-1587-70ccafdac3c8	000c0000-5590-ed6d-9e7a-a295e4cc8b95	00090000-5590-ed6d-01a4-e6a4c06040e1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-ed6d-89b4-4b67debf7a3e	00180000-5590-ed6d-1587-70ccafdac3c8	000c0000-5590-ed6d-ed89-aca3f423278e	00090000-5590-ed6d-0772-6980561d751f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5590-ed6d-b183-2fe22b0fb764	00180000-5590-ed6d-7344-e84c9d9f2854	\N	00090000-5590-ed6d-0772-6980561d751f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8331611)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5590-ed6c-e907-c11c02a1c528	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5590-ed6c-ec7b-9b4dd3ce05c0	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5590-ed6c-6217-d75f09eb9f7b	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5590-ed6c-bbd0-85ce84b7a96b	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5590-ed6c-5a50-91c29d66a79c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5590-ed6c-5ae6-2ca3b7bd3004	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5590-ed6c-8353-be7521df7915	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5590-ed6c-2e04-ee145dd0360a	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5590-ed6c-46e9-5df32141fa57	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5590-ed6c-19d0-3799a672c62d	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5590-ed6c-8f07-b279c70c3ebe	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5590-ed6c-1254-3e120d0a4cee	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5590-ed6c-fd21-67c9efe42a2f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5590-ed6c-89f0-2e3cde96ba02	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5590-ed6c-7d3f-e06bb3353006	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5590-ed6c-7796-ddb45eb20030	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8331780)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5590-ed6c-5c56-3236b990e8b5	01	Velika predstava	f	1.00	1.00
002b0000-5590-ed6c-d79f-26439f15b6d4	02	Mala predstava	f	0.50	0.50
002b0000-5590-ed6c-63fe-e3190e4e61da	03	Mala koprodukcija	t	0.40	1.00
002b0000-5590-ed6c-68ee-bbf04465d2ec	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5590-ed6c-e97c-e2584ffd76cb	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8331298)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8331144)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5590-ed6b-f06a-bceee43db696	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROV2etaAuYs5iWGcVQy/Y4uyB7XLS3dES	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-bf83-984ffef82d31	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-ce0b-33b775df3921	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-aeeb-4bb9fdf0e1eb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-f9d3-c47589b4b04c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-881f-381d2cccb841	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-9358-268015d25206	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-a5b8-c9cf384063bd	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-a4ab-c8a49b45cfc2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-0950-4df3301efed0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5590-ed6d-17c8-d7974a05c70e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5590-ed6b-d69b-11adb36ec031	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8331668)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5590-ed6d-6304-414a45f1505a	00160000-5590-ed6c-136c-d2348827f556	00150000-5590-ed6c-fd2e-5aff8ca94e5b	00140000-5590-ed6b-9cca-70ac8b86dd05	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5590-ed6c-3a5b-00c1041e79ec
000e0000-5590-ed6d-0cb4-d5caf28bf19d	00160000-5590-ed6c-f1b2-35c61fa9e0c7	00150000-5590-ed6c-82f3-93f5b2b91e7a	00140000-5590-ed6b-58b1-4761281a2b11	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5590-ed6c-80ee-c9a44dde86ce
000e0000-5590-ed6d-e953-853b63dbffff	\N	00150000-5590-ed6c-82f3-93f5b2b91e7a	00140000-5590-ed6b-58b1-4761281a2b11	00190000-5590-ed6d-0f45-e670d03b4677	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5590-ed6c-3a5b-00c1041e79ec
000e0000-5590-ed6d-c4e4-ec0ab85451c7	\N	00150000-5590-ed6c-82f3-93f5b2b91e7a	00140000-5590-ed6b-58b1-4761281a2b11	00190000-5590-ed6d-0f45-e670d03b4677	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5590-ed6c-3a5b-00c1041e79ec
\.


--
-- TOC entry 2861 (class 0 OID 8331360)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5590-ed6d-69e6-3bbe07b3fb5b	000e0000-5590-ed6d-0cb4-d5caf28bf19d	1	
00200000-5590-ed6d-519b-7ec2861fd350	000e0000-5590-ed6d-0cb4-d5caf28bf19d	2	
\.


--
-- TOC entry 2876 (class 0 OID 8331485)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8331554)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8331392)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8331658)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5590-ed6b-9cca-70ac8b86dd05	01	Drama	drama (SURS 01)
00140000-5590-ed6b-7e6a-e89d3d0529ef	02	Opera	opera (SURS 02)
00140000-5590-ed6b-62df-766ae1c36a25	03	Balet	balet (SURS 03)
00140000-5590-ed6b-d4de-d8ca5b6d502e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5590-ed6b-c486-47786d018ada	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5590-ed6b-58b1-4761281a2b11	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5590-ed6b-442b-0564773a0417	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8331544)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5590-ed6c-f5f8-689ffdd40efe	01	Opera	opera
00150000-5590-ed6c-0ca3-5abc957f8f94	02	Opereta	opereta
00150000-5590-ed6c-eae8-d4e289dfc32c	03	Balet	balet
00150000-5590-ed6c-d56f-1004b035b252	04	Plesne prireditve	plesne prireditve
00150000-5590-ed6c-40cb-2def9d7b4134	05	Lutkovno gledališče	lutkovno gledališče
00150000-5590-ed6c-983f-682b53cfc60f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5590-ed6c-b4e7-e03e13bf2551	07	Biografska drama	biografska drama
00150000-5590-ed6c-fd2e-5aff8ca94e5b	08	Komedija	komedija
00150000-5590-ed6c-2234-d6dd14b9ddde	09	Črna komedija	črna komedija
00150000-5590-ed6c-447c-35c0486467b7	10	E-igra	E-igra
00150000-5590-ed6c-82f3-93f5b2b91e7a	11	Kriminalka	kriminalka
00150000-5590-ed6c-0bde-39071389d765	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8331198)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8331715)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8331705)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8331610)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8331382)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8331407)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8331796)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8331324)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8331762)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8331540)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8331358)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8331401)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8331338)
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
-- TOC entry 2527 (class 2606 OID 8331450)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8331477)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8331296)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8331207)
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
-- TOC entry 2442 (class 2606 OID 8331231)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8331187)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8331172)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8331483)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8331516)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8331653)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8331260)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8331284)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8331456)
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
-- TOC entry 2457 (class 2606 OID 8331274)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8331345)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8331468)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8331592)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8331638)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8331778)
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
-- TOC entry 2547 (class 2606 OID 8331500)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8331441)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8331432)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8331632)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8331568)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8331143)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8331507)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8331161)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8331181)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8331525)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8331463)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8331413)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8331820)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8331808)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8331802)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8331581)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8331240)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8331423)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8331621)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8331790)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8331309)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8331156)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8331684)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8331367)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8331491)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8331559)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8331396)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8331666)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8331552)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8331389)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8331582)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8331583)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8331262)
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
-- TOC entry 2540 (class 1259 OID 8331484)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8331470)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8331469)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8331368)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8331541)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8331543)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8331542)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8331340)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8331339)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8331655)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8331656)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8331657)
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
-- TOC entry 2602 (class 1259 OID 8331689)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8331686)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8331690)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8331688)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8331687)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8331311)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8331310)
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
-- TOC entry 2440 (class 1259 OID 8331234)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8331508)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8331402)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8331188)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8331189)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8331528)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8331527)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8331526)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8331346)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8331348)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8331347)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8331810)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8331436)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8331434)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8331433)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8331435)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8331162)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8331163)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8331492)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8331457)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8331569)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8331570)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8331766)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8331763)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8331764)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8331765)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8331276)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8331275)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8331277)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8331593)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8331594)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8331719)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8331720)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8331717)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8331718)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8331560)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8331445)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8331444)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8331442)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8331443)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8331707)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8331706)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8331779)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8331359)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8331797)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8331209)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8331208)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8331241)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8331242)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8331426)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8331425)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8331424)
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
-- TOC entry 2492 (class 1259 OID 8331391)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8331387)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8331384)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8331385)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8331383)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8331388)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8331386)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8331261)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8331325)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8331327)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8331326)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8331328)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8331451)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8331654)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8331685)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8331232)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8331233)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8331553)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8331821)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8331297)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8331809)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8331502)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8331501)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8331716)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8331285)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8331667)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8331639)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8331640)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8331182)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8331390)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8331957)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8331942)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8331947)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8331967)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8331937)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8331962)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8331952)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8332112)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8332117)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8331872)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8332052)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8332047)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8332042)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8331932)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8332082)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8332092)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8332087)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8331907)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8331902)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8332032)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8332137)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8332142)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8332147)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8332167)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8332152)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8332172)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8332162)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8332157)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8331897)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8331892)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8331857)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8331852)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8332062)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8331972)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8331832)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8331837)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8332077)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8332072)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8332067)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8331912)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8331922)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8331917)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8332237)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8332007)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8331997)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8331992)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8332002)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8331822)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8331827)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8332057)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8332037)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8332102)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8332107)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8332222)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8332207)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8332212)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8332217)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8331882)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8331877)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8331887)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8332122)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8332127)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8332197)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8332202)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8332187)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8332192)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8332097)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8332027)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8332022)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8332012)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8332017)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8332182)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8332177)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8332227)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8331927)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8332132)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8332232)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8331847)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8331842)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8331862)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8331867)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8331987)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8331982)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8331977)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-29 09:02:07 CEST

--
-- PostgreSQL database dump complete
--

