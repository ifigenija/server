--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-26 14:01:35 CEST

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
-- TOC entry 183 (class 1259 OID 8251933)
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
-- TOC entry 230 (class 1259 OID 8252451)
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
-- TOC entry 229 (class 1259 OID 8252434)
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
-- TOC entry 222 (class 1259 OID 8252338)
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
-- TOC entry 197 (class 1259 OID 8252112)
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
-- TOC entry 200 (class 1259 OID 8252146)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8252534)
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
-- TOC entry 192 (class 1259 OID 8252055)
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
-- TOC entry 231 (class 1259 OID 8252464)
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
-- TOC entry 216 (class 1259 OID 8252272)
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
-- TOC entry 195 (class 1259 OID 8252092)
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
-- TOC entry 199 (class 1259 OID 8252140)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8252072)
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
-- TOC entry 205 (class 1259 OID 8252189)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8252214)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8252029)
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
-- TOC entry 184 (class 1259 OID 8251942)
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
-- TOC entry 185 (class 1259 OID 8251953)
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
-- TOC entry 180 (class 1259 OID 8251907)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8251926)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8252221)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8252252)
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
-- TOC entry 226 (class 1259 OID 8252384)
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
-- TOC entry 187 (class 1259 OID 8251986)
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
-- TOC entry 189 (class 1259 OID 8252021)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8252195)
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
-- TOC entry 188 (class 1259 OID 8252006)
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
-- TOC entry 194 (class 1259 OID 8252084)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8252207)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8252327)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    enotaprograma_id uuid
);


--
-- TOC entry 225 (class 1259 OID 8252376)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8252510)
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
-- TOC entry 212 (class 1259 OID 8252236)
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
-- TOC entry 204 (class 1259 OID 8252180)
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
-- TOC entry 203 (class 1259 OID 8252170)
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
-- TOC entry 224 (class 1259 OID 8252365)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8252304)
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
-- TOC entry 177 (class 1259 OID 8251878)
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
-- TOC entry 176 (class 1259 OID 8251876)
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
-- TOC entry 213 (class 1259 OID 8252246)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8251916)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8251900)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8252260)
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
-- TOC entry 207 (class 1259 OID 8252201)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8252151)
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
-- TOC entry 237 (class 1259 OID 8252554)
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
-- TOC entry 236 (class 1259 OID 8252546)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8252541)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8252314)
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
-- TOC entry 186 (class 1259 OID 8251978)
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
-- TOC entry 202 (class 1259 OID 8252157)
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
-- TOC entry 223 (class 1259 OID 8252354)
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
-- TOC entry 233 (class 1259 OID 8252523)
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
-- TOC entry 191 (class 1259 OID 8252041)
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
-- TOC entry 178 (class 1259 OID 8251887)
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
-- TOC entry 228 (class 1259 OID 8252411)
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
-- TOC entry 196 (class 1259 OID 8252103)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8252228)
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
-- TOC entry 218 (class 1259 OID 8252297)
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
-- TOC entry 198 (class 1259 OID 8252135)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8252401)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8252287)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8251881)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2848 (class 0 OID 8251933)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8252451)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-558d-3f1e-9d8c-5e5c0d3605b3	000d0000-558d-3f1e-b9e1-48c9c7a25af4	\N	00090000-558d-3f1e-3497-fe81273aa38a	000b0000-558d-3f1e-e199-c03e2faee956	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-3f1e-5908-11098fa56e6a	000d0000-558d-3f1e-986f-3835f964d1c1	\N	00090000-558d-3f1e-33ae-7a270a903865	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-3f1e-20f8-0e0711fd9381	000d0000-558d-3f1e-c133-2fcaa267e99c	\N	00090000-558d-3f1e-f00a-df04f24a44a0	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-3f1e-33ac-60c6ee07dcc0	000d0000-558d-3f1e-9aa8-fdb86d80a8a5	\N	00090000-558d-3f1e-38ec-7648ae7e98d8	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-3f1e-c85c-208d89534c15	000d0000-558d-3f1e-b84e-06c260ac847b	\N	00090000-558d-3f1e-413a-37c0a8770021	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-558d-3f1e-0eea-b04d701cb453	000d0000-558d-3f1e-c800-7fe32b795a59	\N	00090000-558d-3f1e-33ae-7a270a903865	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2894 (class 0 OID 8252434)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 8252338)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-558d-3f1e-72e4-0b9d18e021c0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-558d-3f1e-24ac-6791601713bc	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-558d-3f1e-532a-052a5a26dafd	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2862 (class 0 OID 8252112)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-558d-3f1e-3615-2e764043bd27	\N	\N	00200000-558d-3f1e-1231-e1414995f8fb	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-558d-3f1e-8f19-932b9d6f6e8e	\N	\N	00200000-558d-3f1e-5942-808530913af9	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-558d-3f1e-c3bd-b3b6d4a7036e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-558d-3f1e-a5a4-38943bb4827a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-558d-3f1e-385d-7d9d3b9c60d9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2865 (class 0 OID 8252146)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 8252534)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 8252055)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-558d-3f1c-e1ea-02b2ca2d792d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-558d-3f1c-dd83-837d07a97d62	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-558d-3f1c-5bc9-185ccc39bcc7	AL	ALB	008	Albania 	Albanija	\N
00040000-558d-3f1c-39c1-7089f4c67f10	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-558d-3f1c-1bde-77a3a7582f31	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-558d-3f1c-b6b9-f4049761ff0e	AD	AND	020	Andorra 	Andora	\N
00040000-558d-3f1c-eb62-3c11786e8708	AO	AGO	024	Angola 	Angola	\N
00040000-558d-3f1c-cf5d-17e3bb93c559	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-558d-3f1c-acc3-1e965d55d2a0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-558d-3f1c-c1ff-00b3d0d75be2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-3f1c-bce9-598e6f460b29	AR	ARG	032	Argentina 	Argenitna	\N
00040000-558d-3f1c-53bf-c72684a495d2	AM	ARM	051	Armenia 	Armenija	\N
00040000-558d-3f1c-1158-9f4bd012caf6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-558d-3f1c-3c36-3d2a29866b5a	AU	AUS	036	Australia 	Avstralija	\N
00040000-558d-3f1c-1b1f-c6e39def07a1	AT	AUT	040	Austria 	Avstrija	\N
00040000-558d-3f1c-3923-43f6a926eb5b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-558d-3f1c-38b6-469cd025879a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-558d-3f1c-e331-4b005fae06ed	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-558d-3f1c-766f-6235aa6dcf19	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-558d-3f1c-2c79-423abc501fb2	BB	BRB	052	Barbados 	Barbados	\N
00040000-558d-3f1c-249a-d7106d65f0c0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-558d-3f1c-4ae2-52a38d86b4e9	BE	BEL	056	Belgium 	Belgija	\N
00040000-558d-3f1c-80f5-871602417c1d	BZ	BLZ	084	Belize 	Belize	\N
00040000-558d-3f1c-5b27-9f3d72a23c40	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-558d-3f1c-0884-90544ec52a8b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-558d-3f1c-fded-42c707064665	BT	BTN	064	Bhutan 	Butan	\N
00040000-558d-3f1c-9be5-7677e4597e10	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-558d-3f1c-a4bf-070c52598be0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-558d-3f1c-2b96-c9f8cb633c83	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-558d-3f1c-4485-b059602d690c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-558d-3f1c-37c7-fb86095ebeb5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-558d-3f1c-6bcf-8a23af739cb1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-558d-3f1c-1e40-cca80c43ed2e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-558d-3f1c-bf24-014a1807611a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-558d-3f1c-b7f4-fe92adea1bb1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-558d-3f1c-17b1-5721d5d95e46	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-558d-3f1c-3407-d516d7e10f95	BI	BDI	108	Burundi 	Burundi 	\N
00040000-558d-3f1c-a043-29371a81e700	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-558d-3f1c-8725-455c9073f90e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-558d-3f1c-571a-91e9df37e8a7	CA	CAN	124	Canada 	Kanada	\N
00040000-558d-3f1c-d36b-0e1f07c3b513	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-558d-3f1c-e545-3469213a90ba	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-558d-3f1c-55ba-b83ff07da34b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-558d-3f1c-1d08-53dc4ac5b9bc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-558d-3f1c-a28c-3c08dbfc2041	CL	CHL	152	Chile 	Čile	\N
00040000-558d-3f1c-f0ae-0b4f616e05c0	CN	CHN	156	China 	Kitajska	\N
00040000-558d-3f1c-87a8-6c0dc3ff39fd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-558d-3f1c-b309-5b4ff50dc348	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-558d-3f1c-0a01-410ec27da064	CO	COL	170	Colombia 	Kolumbija	\N
00040000-558d-3f1c-e71b-abb5320a8b7b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-558d-3f1c-d51b-715ca093a572	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-558d-3f1c-ee5e-4d322a2a3e01	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-558d-3f1c-80aa-b2d740b1cfd1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-558d-3f1c-4638-85c3d7020f50	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-558d-3f1c-f4a6-089a13e76e4f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-558d-3f1c-84cd-fb4876c92295	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-558d-3f1c-c16f-ae63c42273eb	CU	CUB	192	Cuba 	Kuba	\N
00040000-558d-3f1c-2a5e-7d60d4b893ae	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-558d-3f1c-69c3-ea15911e0380	CY	CYP	196	Cyprus 	Ciper	\N
00040000-558d-3f1c-771a-7e0cc4cc6b0b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-558d-3f1c-e27d-88472ea576a8	DK	DNK	208	Denmark 	Danska	\N
00040000-558d-3f1c-f4da-967db0e541e6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-558d-3f1c-3714-b188fa707729	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-558d-3f1c-45aa-09225d2a7021	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-558d-3f1c-5e2f-aa76c3375486	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-558d-3f1c-08d2-4c2f57649da4	EG	EGY	818	Egypt 	Egipt	\N
00040000-558d-3f1c-8ffd-bbb7bb48baf1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-558d-3f1c-af91-34a8ccf5e059	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-558d-3f1c-92cd-d124dcb2d18e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-558d-3f1c-0d7d-0953d09e1634	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-558d-3f1c-01c6-4918a90f84ab	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-558d-3f1c-7e64-a1722bb584ae	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-558d-3f1c-b661-53da043f034b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-558d-3f1c-8311-6bdd0ea36d1a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-558d-3f1c-c035-e59fa067a311	FI	FIN	246	Finland 	Finska	\N
00040000-558d-3f1c-0f26-dcb85ba9b2ca	FR	FRA	250	France 	Francija	\N
00040000-558d-3f1c-5004-c74f00d49116	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-558d-3f1c-4466-90ff1664c7bf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-558d-3f1c-5e9d-94bc35d3add2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-558d-3f1c-ace3-8216c79ec4a0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-558d-3f1c-ee31-688f421eadcf	GA	GAB	266	Gabon 	Gabon	\N
00040000-558d-3f1c-17ac-4147f9b37a6a	GM	GMB	270	Gambia 	Gambija	\N
00040000-558d-3f1c-194d-d1e0771ebd84	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-558d-3f1c-c9fe-0adfd2989b28	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-558d-3f1c-af53-3b74d4177981	GH	GHA	288	Ghana 	Gana	\N
00040000-558d-3f1c-072d-74a4f5fde538	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-558d-3f1c-2ad7-53ad68ae896a	GR	GRC	300	Greece 	Grčija	\N
00040000-558d-3f1c-e65d-edda466e7f52	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-558d-3f1c-8cea-1671edfaa476	GD	GRD	308	Grenada 	Grenada	\N
00040000-558d-3f1c-5e25-11de76072608	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-558d-3f1c-0add-910c82b3b1cf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-558d-3f1c-9593-5a9dfc1dae69	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-558d-3f1c-8944-2b451dbd8961	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-558d-3f1c-124f-98f79d3ba381	GN	GIN	324	Guinea 	Gvineja	\N
00040000-558d-3f1c-1ebf-cd53884f77cd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-558d-3f1c-1f9b-e7a28abd9273	GY	GUY	328	Guyana 	Gvajana	\N
00040000-558d-3f1c-35a6-b57e1bc6be91	HT	HTI	332	Haiti 	Haiti	\N
00040000-558d-3f1c-06c5-4ab1d139140d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-558d-3f1c-e2c8-c2d5a230e212	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-558d-3f1c-ab15-95008f520637	HN	HND	340	Honduras 	Honduras	\N
00040000-558d-3f1c-7cae-e7b02dea1a14	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-558d-3f1c-b2d5-b271d957491c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-558d-3f1c-9902-c02d26674729	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-558d-3f1c-ecb0-e094bdc0ddca	IN	IND	356	India 	Indija	\N
00040000-558d-3f1c-8020-3c7987c4fd7b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-558d-3f1c-1206-9aec81d014e3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-558d-3f1c-a665-d1af3223e806	IQ	IRQ	368	Iraq 	Irak	\N
00040000-558d-3f1c-ae8f-f492c603bfd5	IE	IRL	372	Ireland 	Irska	\N
00040000-558d-3f1c-f627-e92c29841366	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-558d-3f1c-82f8-7fe52d18a51b	IL	ISR	376	Israel 	Izrael	\N
00040000-558d-3f1c-2704-cad01dae4298	IT	ITA	380	Italy 	Italija	\N
00040000-558d-3f1c-413a-c45b481f0a45	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-558d-3f1c-918a-44958df51c6d	JP	JPN	392	Japan 	Japonska	\N
00040000-558d-3f1c-3c55-b81f44a3c8ac	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-558d-3f1c-ff37-0826fcd161ec	JO	JOR	400	Jordan 	Jordanija	\N
00040000-558d-3f1c-7178-76c462e23055	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-558d-3f1c-9e8b-974709f3e8d4	KE	KEN	404	Kenya 	Kenija	\N
00040000-558d-3f1c-dc03-18998f92de13	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-558d-3f1c-cf55-56d06db7fc32	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-558d-3f1c-5d85-f3651b759efe	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-558d-3f1c-a27e-6559109b8105	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-558d-3f1c-3c5f-812f5c3ea2f3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-558d-3f1c-30b2-6ca42fd99baf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-558d-3f1c-8109-d586203d2201	LV	LVA	428	Latvia 	Latvija	\N
00040000-558d-3f1c-07db-fcd977325a07	LB	LBN	422	Lebanon 	Libanon	\N
00040000-558d-3f1c-408c-8a49a8229a19	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-558d-3f1c-8b86-f542804747c1	LR	LBR	430	Liberia 	Liberija	\N
00040000-558d-3f1c-9b17-53c52f886e7f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-558d-3f1c-7b5b-3dc3729c6f70	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-558d-3f1c-8cdf-2671661d9e9e	LT	LTU	440	Lithuania 	Litva	\N
00040000-558d-3f1c-6760-8b3b960edbb6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-558d-3f1c-415e-f9572f22a4c3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-558d-3f1c-3d9e-06bf9961d80c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-558d-3f1c-2243-9bab0fb25304	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-558d-3f1c-b5dc-7f6ad237baac	MW	MWI	454	Malawi 	Malavi	\N
00040000-558d-3f1c-2ec3-b0619240b4b5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-558d-3f1c-c780-652b5b56a203	MV	MDV	462	Maldives 	Maldivi	\N
00040000-558d-3f1c-53b0-1e4504ccab42	ML	MLI	466	Mali 	Mali	\N
00040000-558d-3f1c-ac51-e52f866f39b7	MT	MLT	470	Malta 	Malta	\N
00040000-558d-3f1c-48f4-deddd5977b1f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-558d-3f1c-124f-11e1d4b285eb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-558d-3f1c-5ec3-22eae4c4bacd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-558d-3f1c-23ac-378cdec53282	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-558d-3f1c-bebf-03cb504330fb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-558d-3f1c-affa-731804b79d4e	MX	MEX	484	Mexico 	Mehika	\N
00040000-558d-3f1c-a71c-f0e494aaf7d3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-558d-3f1c-af91-6b9ae0cd136b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-558d-3f1c-1ef8-367fe1258a20	MC	MCO	492	Monaco 	Monako	\N
00040000-558d-3f1c-3b57-d4fe4a7af56c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-558d-3f1c-6405-680282589bf0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-558d-3f1c-93d6-a7c01875d9dd	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-558d-3f1c-5f4e-2f4be7747487	MA	MAR	504	Morocco 	Maroko	\N
00040000-558d-3f1c-a87a-8a853717755c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-558d-3f1c-6674-a20ed1881e3d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-558d-3f1c-eafc-67176518455f	NA	NAM	516	Namibia 	Namibija	\N
00040000-558d-3f1c-672f-b016eaeb9f04	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-558d-3f1c-30be-78a16a7cc3cd	NP	NPL	524	Nepal 	Nepal	\N
00040000-558d-3f1c-0992-c8bbb7e3c29f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-558d-3f1c-8936-e0e2e6171e62	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-558d-3f1c-a149-16ff32859369	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-558d-3f1c-4870-b6cf97c05713	NE	NER	562	Niger 	Niger 	\N
00040000-558d-3f1c-23e5-07b1a8a921ed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-558d-3f1c-9292-9a75b748cc9d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-558d-3f1c-7e52-e5fb15d80a06	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-558d-3f1c-ae42-46e94963f6c2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-558d-3f1c-276f-9bfcd239fb14	NO	NOR	578	Norway 	Norveška	\N
00040000-558d-3f1c-2fa0-7cfea0748b45	OM	OMN	512	Oman 	Oman	\N
00040000-558d-3f1c-e0c7-afe2ba13a6e7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-558d-3f1c-f9ec-3bfd2d6f860c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-558d-3f1c-006f-150beab2cac4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-558d-3f1c-6a34-c5a0f94542cf	PA	PAN	591	Panama 	Panama	\N
00040000-558d-3f1c-7b3c-80bd465a2093	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-558d-3f1c-1f1c-b7bd98d376d4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-558d-3f1c-3d27-fbb1ebdb4da3	PE	PER	604	Peru 	Peru	\N
00040000-558d-3f1c-fc53-7ddee445b101	PH	PHL	608	Philippines 	Filipini	\N
00040000-558d-3f1c-c609-45a90a0cc5d0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-558d-3f1c-07d5-fa5085a2ea4a	PL	POL	616	Poland 	Poljska	\N
00040000-558d-3f1c-68aa-fb90ff20efdd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-558d-3f1c-7208-18a83ecff5dc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-558d-3f1c-03b1-eb6cb5353536	QA	QAT	634	Qatar 	Katar	\N
00040000-558d-3f1c-bb4d-0b12969bdafe	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-558d-3f1c-5871-a053f5a311b0	RO	ROU	642	Romania 	Romunija	\N
00040000-558d-3f1c-df83-7a112bfb73c9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-558d-3f1c-a663-0031252249ab	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-558d-3f1c-e6e3-f77f361b7303	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-558d-3f1c-adfa-5bf5152b06eb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-558d-3f1c-e1c5-2682a44b6970	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-558d-3f1c-eb6a-d47e37c2739d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-558d-3f1c-5a47-479e88d6eb1e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-558d-3f1c-9370-8fc3b7516547	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-558d-3f1c-6c87-565813b12631	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-558d-3f1c-0910-c9f28170de67	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-558d-3f1c-8894-933c8f70c23b	SM	SMR	674	San Marino 	San Marino	\N
00040000-558d-3f1c-2f7f-b894a61b9cfa	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-558d-3f1c-c724-d5291427e917	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-558d-3f1c-9700-09cdadeedc3e	SN	SEN	686	Senegal 	Senegal	\N
00040000-558d-3f1c-828c-f9209b6bebc1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-558d-3f1c-6bc3-6c4251f5729f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-558d-3f1c-25a0-78c9494d12fb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-558d-3f1c-0810-f9fa4fbe2889	SG	SGP	702	Singapore 	Singapur	\N
00040000-558d-3f1c-8fc6-23116286385f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-558d-3f1c-28cb-0553a7a68b2e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-558d-3f1c-6a6d-620d3ab22811	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-558d-3f1c-1c9a-cf42904bf9e2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-558d-3f1c-4de6-bc914d63de94	SO	SOM	706	Somalia 	Somalija	\N
00040000-558d-3f1c-e66f-c811d0c7bacd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-558d-3f1c-c1e1-3628f030d86d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-558d-3f1c-31c3-abec73d2e004	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-558d-3f1c-5d05-7ac272aac27b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-558d-3f1c-47d6-80d1b89c33e1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-558d-3f1c-b8bd-218e52d48211	SD	SDN	729	Sudan 	Sudan	\N
00040000-558d-3f1c-54e6-a1f8e1c81127	SR	SUR	740	Suriname 	Surinam	\N
00040000-558d-3f1c-fc23-c8ece3b490b7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-558d-3f1c-8840-78fa95f5d270	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-558d-3f1c-fc5f-377a9e3dcbf3	SE	SWE	752	Sweden 	Švedska	\N
00040000-558d-3f1c-34fa-e9fcb354f883	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-558d-3f1c-a43f-dbda47db9a92	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-558d-3f1c-d9f2-d0bde1548907	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-558d-3f1c-9ce8-2312247be551	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-558d-3f1c-c1c5-e5ecb92b147e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-558d-3f1c-274e-46fe24a40bdd	TH	THA	764	Thailand 	Tajska	\N
00040000-558d-3f1c-8279-fddab434f065	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-558d-3f1c-95be-6fef4c2bc9ce	TG	TGO	768	Togo 	Togo	\N
00040000-558d-3f1c-71ff-19a3e8782159	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-558d-3f1c-5d8d-67750cdadfd7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-558d-3f1c-be70-e1c15f89231a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-558d-3f1c-14cf-4dbf3b5cf011	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-558d-3f1c-bc80-6317f19721bd	TR	TUR	792	Turkey 	Turčija	\N
00040000-558d-3f1c-73e2-0bf766db1e16	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-558d-3f1c-0464-5311920be3f8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-3f1c-09e5-bf1704b15f38	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-558d-3f1c-e231-ac6398f246f9	UG	UGA	800	Uganda 	Uganda	\N
00040000-558d-3f1c-8248-d8a6a78596c4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-558d-3f1c-c106-275cfffdb8fc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-558d-3f1c-0e4e-c72c22500133	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-558d-3f1c-5582-798598b3fa5b	US	USA	840	United States 	Združene države Amerike	\N
00040000-558d-3f1c-702a-90a0eaeb234d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-558d-3f1c-f0d0-46e6b9bee0eb	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-558d-3f1c-de54-560ac36628cf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-558d-3f1c-a194-ebc34aa02ec2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-558d-3f1c-47fe-73408be27a98	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-558d-3f1c-05c5-54d3cbc100ee	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-558d-3f1c-f5fd-c897049eb961	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-558d-3f1c-5bd7-3ef7a27ba593	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-558d-3f1c-07fa-eea392a89048	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-558d-3f1c-aa04-ef8274bd4319	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-558d-3f1c-edf5-a02942677b70	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-558d-3f1c-a463-af62679eb670	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-558d-3f1c-3b6b-38412685955c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2896 (class 0 OID 8252464)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-558d-3f1e-2198-2f0910ceaaff	000e0000-558d-3f1e-4cb1-7dce2e29903b	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-558d-3f1d-f540-4c59292dc24f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-558d-3f1e-3b62-8041b120b1e2	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-558d-3f1d-27bf-0229970560c2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 8252272)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-558d-3f1e-a7bd-c60a2849ae31	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-558d-3f1d-a11a-fe78747fe0e5
000d0000-558d-3f1e-b9e1-48c9c7a25af4	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-3f1d-a11a-fe78747fe0e5
000d0000-558d-3f1e-986f-3835f964d1c1	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-558d-3f1d-55c4-74f3f93278ac
000d0000-558d-3f1e-c133-2fcaa267e99c	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-558d-3f1d-8ab3-bad8ad9d7bc0
000d0000-558d-3f1e-9aa8-fdb86d80a8a5	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-558d-3f1d-8ab3-bad8ad9d7bc0
000d0000-558d-3f1e-b84e-06c260ac847b	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-558d-3f1d-8ab3-bad8ad9d7bc0
000d0000-558d-3f1e-c800-7fe32b795a59	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-558d-3f1d-a11a-fe78747fe0e5
\.


--
-- TOC entry 2860 (class 0 OID 8252092)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8252140)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 8252072)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-558d-3f1e-79dc-f95b2163a6b9	00080000-558d-3f1e-33c5-8bd636a2590f	00090000-558d-3f1e-3497-fe81273aa38a	AK		
\.


--
-- TOC entry 2835 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8252189)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8252214)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 8252029)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-558d-3f1c-f371-6d738d323ba5	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-558d-3f1c-8df8-d2617ea21542	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-558d-3f1c-140d-5e90a9783239	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-558d-3f1c-b978-0408d1ede125	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-558d-3f1c-b6c9-3b080dcbcec8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-558d-3f1c-e606-995162b09194	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-558d-3f1c-e8df-5bba2100316e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-558d-3f1c-b2dc-0db1ca077558	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-3f1c-07ad-b45592680592	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-558d-3f1c-a3b0-d27372365f63	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-558d-3f1c-5b5c-0de38d7ce570	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-558d-3f1c-b903-dfcd5f8dae63	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-558d-3f1c-d302-18b728d54acf	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-558d-3f1e-6d58-1c2414ab1366	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-558d-3f1e-666d-66816ad46512	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-558d-3f1e-17b1-cda272751507	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-558d-3f1e-a8cc-f199de8c046c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-558d-3f1e-6979-12b836608531	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-558d-3f1e-5717-d8f76a0c9945	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2849 (class 0 OID 8251942)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-558d-3f1e-abe2-ca144732790c	00000000-558d-3f1e-666d-66816ad46512	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-558d-3f1e-f234-1e29afcfffd0	00000000-558d-3f1e-666d-66816ad46512	00010000-558d-3f1c-fa2c-0b98f8e8fdd2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-558d-3f1e-f04f-018b5b584a61	00000000-558d-3f1e-17b1-cda272751507	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2850 (class 0 OID 8251953)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-558d-3f1e-88e2-e06e60e93de4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-558d-3f1e-38ec-7648ae7e98d8	00010000-558d-3f1e-ea8c-35b758689538	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-558d-3f1e-f00a-df04f24a44a0	00010000-558d-3f1e-3e44-6e4e756e26f8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-558d-3f1e-5a11-a31066c94216	00010000-558d-3f1e-fd40-299907ec7a81	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-558d-3f1e-09a7-e52b4bdad12f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-558d-3f1e-b6b3-6e5f43bc5e67	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-558d-3f1e-f03c-78b46df3b400	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-558d-3f1e-3be8-74231aeb4104	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-558d-3f1e-3497-fe81273aa38a	00010000-558d-3f1e-94bc-1111dcaab2d3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-558d-3f1e-33ae-7a270a903865	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-558d-3f1e-f296-04baa70448d7	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-558d-3f1e-413a-37c0a8770021	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-558d-3f1e-1290-80aa928eac8d	00010000-558d-3f1e-d0fb-9940b50ec8cf	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2837 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 8251907)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-558d-3f1c-fe0c-60d378ee99e4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-558d-3f1c-c970-9013d5f55d53	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-558d-3f1c-a048-049bae7b5a9f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-558d-3f1c-1607-ce58285bdbc9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-558d-3f1c-0c30-940be132a03e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-558d-3f1c-22b0-6f949b526dd6	Abonma-read	Abonma - branje	f
00030000-558d-3f1c-82e0-4c5c4696aef0	Abonma-write	Abonma - spreminjanje	f
00030000-558d-3f1c-d466-8070ff83b0b9	Alternacija-read	Alternacija - branje	f
00030000-558d-3f1c-61a3-6b822733adac	Alternacija-write	Alternacija - spreminjanje	f
00030000-558d-3f1c-b6f9-54b2c9c9d09a	Arhivalija-read	Arhivalija - branje	f
00030000-558d-3f1c-d122-8e6980cbf84d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-558d-3f1c-7abd-189c3c991ff7	Besedilo-read	Besedilo - branje	f
00030000-558d-3f1c-3973-ad2c258347fa	Besedilo-write	Besedilo - spreminjanje	f
00030000-558d-3f1c-d455-f00d349e3f04	DogodekIzven-read	DogodekIzven - branje	f
00030000-558d-3f1c-7366-f1ae12e9ef6e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-558d-3f1c-4abe-0a6031582817	Dogodek-read	Dogodek - branje	f
00030000-558d-3f1c-029a-3606c0d6907e	Dogodek-write	Dogodek - spreminjanje	f
00030000-558d-3f1c-078a-de2defe7c963	DrugiVir-read	DrugiVir - branje	f
00030000-558d-3f1c-5b88-6f1edd19133a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-558d-3f1c-3390-30232dd36fe9	Drzava-read	Drzava - branje	f
00030000-558d-3f1c-c6fa-3e198f7b4388	Drzava-write	Drzava - spreminjanje	f
00030000-558d-3f1c-5e48-37dde86434ee	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-558d-3f1c-fe2e-e2897f978cad	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-558d-3f1c-72fd-dd6d2df31b99	Funkcija-read	Funkcija - branje	f
00030000-558d-3f1c-45cf-6be39fd06132	Funkcija-write	Funkcija - spreminjanje	f
00030000-558d-3f1c-c4a1-e5e5d090607a	Gostovanje-read	Gostovanje - branje	f
00030000-558d-3f1c-94e0-37f02e15f748	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-558d-3f1c-87e2-cc41955e011e	Gostujoca-read	Gostujoca - branje	f
00030000-558d-3f1c-81e6-03c66b846a24	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-558d-3f1c-48a6-be12e37c9f50	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-558d-3f1c-5143-25269042d6b7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-558d-3f1c-78d7-0b4b4894ca35	Kupec-read	Kupec - branje	f
00030000-558d-3f1c-84e5-025bb70acc08	Kupec-write	Kupec - spreminjanje	f
00030000-558d-3f1c-dfd8-20e63d0a1a29	NacinPlacina-read	NacinPlacina - branje	f
00030000-558d-3f1c-7535-d661e77400f1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-558d-3f1c-d261-c2a86fb883f7	Option-read	Option - branje	f
00030000-558d-3f1c-a31d-7f4e6d8678ee	Option-write	Option - spreminjanje	f
00030000-558d-3f1c-9a54-cb941b13dac8	OptionValue-read	OptionValue - branje	f
00030000-558d-3f1c-5847-6439ca950d5f	OptionValue-write	OptionValue - spreminjanje	f
00030000-558d-3f1c-57e1-29019f35c4ef	Oseba-read	Oseba - branje	f
00030000-558d-3f1c-7ba6-c762c3ea245d	Oseba-write	Oseba - spreminjanje	f
00030000-558d-3f1c-c668-2791e598fb38	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-558d-3f1c-5717-0b80d2c2d1b2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-558d-3f1c-6465-7cbb35073f11	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-558d-3f1c-6329-24f1f4ee9b0a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-558d-3f1c-9108-a678bfc6115d	Pogodba-read	Pogodba - branje	f
00030000-558d-3f1c-3ad0-9e3fca296429	Pogodba-write	Pogodba - spreminjanje	f
00030000-558d-3f1c-4579-0f8031ee9f71	Popa-read	Popa - branje	f
00030000-558d-3f1c-548f-6ed8b100a947	Popa-write	Popa - spreminjanje	f
00030000-558d-3f1c-7be4-e10e6fbaff91	Posta-read	Posta - branje	f
00030000-558d-3f1c-815a-912b92aba2b0	Posta-write	Posta - spreminjanje	f
00030000-558d-3f1c-d527-5311ac98733d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-558d-3f1c-4e06-94ed4f2d87f4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-558d-3f1c-2131-6bc65edc7526	PostniNaslov-read	PostniNaslov - branje	f
00030000-558d-3f1c-c3bc-1359e8579823	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-558d-3f1c-be62-c947dadeb61e	Predstava-read	Predstava - branje	f
00030000-558d-3f1c-c8dc-688bb0ec2429	Predstava-write	Predstava - spreminjanje	f
00030000-558d-3f1c-b222-8d5664145191	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-558d-3f1c-aff2-64e085ed7b76	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-558d-3f1c-713f-20f1fe6ad4d6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-558d-3f1c-0750-3e6fdadd2d38	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-558d-3f1c-f39c-6202f9a24d60	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-558d-3f1c-210d-8720fe00e3d7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-558d-3f1c-87b1-db315b5ba6e0	ProgramDela-read	ProgramDela - branje	f
00030000-558d-3f1c-a8f3-1487057880d7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-558d-3f1c-abdf-767198b63324	ProgramFestival-read	ProgramFestival - branje	f
00030000-558d-3f1c-e94d-c5a0e3d78f02	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-558d-3f1c-b212-859081d3b685	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-558d-3f1c-33e4-45aed709186c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-558d-3f1c-b979-abdd02838955	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-558d-3f1c-c6bf-ff670c0d6205	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-558d-3f1c-d888-4d2a7c9c2574	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-558d-3f1c-f8c4-2cfd218c13b4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-558d-3f1c-33ff-fc203d6d188b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-558d-3f1c-9858-97a8d60b8700	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-558d-3f1c-3254-34b75987738e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-558d-3f1c-01bb-d5fc09220578	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-558d-3f1c-4903-b73b15c948b8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-558d-3f1c-9243-16c3e4501da1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-558d-3f1c-5100-52e7b1c2142b	ProgramRazno-read	ProgramRazno - branje	f
00030000-558d-3f1c-277c-2eaf1f3d57b7	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-558d-3f1c-2629-1d9388e57cab	Prostor-read	Prostor - branje	f
00030000-558d-3f1c-bd59-c4f163e19153	Prostor-write	Prostor - spreminjanje	f
00030000-558d-3f1c-0140-5a137e939ebf	Racun-read	Racun - branje	f
00030000-558d-3f1c-e1fc-8028a409823d	Racun-write	Racun - spreminjanje	f
00030000-558d-3f1c-46ed-65f94555c46a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-558d-3f1c-e264-e86f886a1865	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-558d-3f1c-0330-914cad95d59d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-558d-3f1c-c167-8860b25bfc10	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-558d-3f1c-f1f9-ee44775de4a3	Rekvizit-read	Rekvizit - branje	f
00030000-558d-3f1c-f6f9-e23e06167afa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-558d-3f1c-a14d-d74fd018406d	Revizija-read	Revizija - branje	f
00030000-558d-3f1c-ceb4-4581f052c01d	Revizija-write	Revizija - spreminjanje	f
00030000-558d-3f1c-4431-b6f71c2e6ae8	Rezervacija-read	Rezervacija - branje	f
00030000-558d-3f1c-d2df-6ca2f230091c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-558d-3f1c-50da-e1d726257f69	SedezniRed-read	SedezniRed - branje	f
00030000-558d-3f1c-f818-a26261f36af1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-558d-3f1c-aeac-a1ea82c152f3	Sedez-read	Sedez - branje	f
00030000-558d-3f1c-b994-0cbdb0ae73a9	Sedez-write	Sedez - spreminjanje	f
00030000-558d-3f1c-4ba6-fa8fa378f1cc	Sezona-read	Sezona - branje	f
00030000-558d-3f1c-fc11-bfec172aea31	Sezona-write	Sezona - spreminjanje	f
00030000-558d-3f1c-bdcd-2e06c2dbca73	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-558d-3f1c-0461-4c06d5ccc978	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-558d-3f1c-0e1d-d7a66cfe2db7	Stevilcenje-read	Stevilcenje - branje	f
00030000-558d-3f1c-16ee-2fc3fde9437b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-558d-3f1c-e9d0-169b5abe7fcd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-558d-3f1c-eb83-8478c0835b24	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-558d-3f1c-ece8-adf708066edd	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-558d-3f1c-b540-11bce8eedb76	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-558d-3f1c-d5ca-df6e5f13c737	Telefonska-read	Telefonska - branje	f
00030000-558d-3f1c-2f97-5aa3b00c45c0	Telefonska-write	Telefonska - spreminjanje	f
00030000-558d-3f1c-6b1a-da845257aa70	TerminStoritve-read	TerminStoritve - branje	f
00030000-558d-3f1c-2443-a252f15825c5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-558d-3f1c-e379-b3eef6615335	TipFunkcije-read	TipFunkcije - branje	f
00030000-558d-3f1c-f56c-eb105dd9f289	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-558d-3f1c-749a-5fb83100a96d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-558d-3f1c-5146-c129045e4df0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-558d-3f1c-d304-3306638059c9	Trr-read	Trr - branje	f
00030000-558d-3f1c-ffd1-799bbf040433	Trr-write	Trr - spreminjanje	f
00030000-558d-3f1c-d0c9-34dbad22d071	Uprizoritev-read	Uprizoritev - branje	f
00030000-558d-3f1c-aba8-bd906a00bbdf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-558d-3f1c-d49a-e8401e83432a	Vaja-read	Vaja - branje	f
00030000-558d-3f1c-d377-63c4eb773ea8	Vaja-write	Vaja - spreminjanje	f
00030000-558d-3f1c-f934-68143baee9a1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-558d-3f1c-f110-5f648bcfc92e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-558d-3f1c-14fe-caa58fdc0d69	Zaposlitev-read	Zaposlitev - branje	f
00030000-558d-3f1c-3c71-86cac5f62bc9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-558d-3f1c-03d4-74378a33cbb4	Zasedenost-read	Zasedenost - branje	f
00030000-558d-3f1c-4ff6-0f054af752a7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-558d-3f1c-932c-33fec8f9c866	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-558d-3f1c-521b-6402038f3539	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-558d-3f1c-c576-e55d3311a025	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-558d-3f1c-5d12-41f53e0bb0c2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2847 (class 0 OID 8251926)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-558d-3f1c-09c7-8dc1a483ace4	00030000-558d-3f1c-c970-9013d5f55d53
00020000-558d-3f1c-7922-13087f3c11f7	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-82e0-4c5c4696aef0
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-d466-8070ff83b0b9
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-61a3-6b822733adac
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-1607-ce58285bdbc9
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-029a-3606c0d6907e
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c6fa-3e198f7b4388
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-72fd-dd6d2df31b99
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-45cf-6be39fd06132
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-94e0-37f02e15f748
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-81e6-03c66b846a24
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-48a6-be12e37c9f50
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-5143-25269042d6b7
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-57e1-29019f35c4ef
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-7ba6-c762c3ea245d
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-548f-6ed8b100a947
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-815a-912b92aba2b0
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-2131-6bc65edc7526
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c3bc-1359e8579823
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c8dc-688bb0ec2429
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-f39c-6202f9a24d60
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-210d-8720fe00e3d7
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-bd59-c4f163e19153
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c167-8860b25bfc10
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-f6f9-e23e06167afa
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-fc11-bfec172aea31
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-e379-b3eef6615335
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-d0c9-34dbad22d071
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-aba8-bd906a00bbdf
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-d49a-e8401e83432a
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-d377-63c4eb773ea8
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-03d4-74378a33cbb4
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-4ff6-0f054af752a7
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1c-04df-a1f8e2eb86bb	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-48a6-be12e37c9f50
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-5143-25269042d6b7
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-57e1-29019f35c4ef
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-7ba6-c762c3ea245d
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-2131-6bc65edc7526
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-c3bc-1359e8579823
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-d5ca-df6e5f13c737
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-2f97-5aa3b00c45c0
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-d304-3306638059c9
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-ffd1-799bbf040433
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-14fe-caa58fdc0d69
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-3c71-86cac5f62bc9
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1c-2fb3-446e40846568	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-d466-8070ff83b0b9
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-d122-8e6980cbf84d
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-7abd-189c3c991ff7
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-d455-f00d349e3f04
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-72fd-dd6d2df31b99
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-48a6-be12e37c9f50
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-57e1-29019f35c4ef
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-f39c-6202f9a24d60
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-e379-b3eef6615335
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-d49a-e8401e83432a
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-03d4-74378a33cbb4
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1c-3a2f-29c7f81214f9	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-82e0-4c5c4696aef0
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-61a3-6b822733adac
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-e379-b3eef6615335
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1c-7a67-a9e1d171c1fa	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-6b1a-da845257aa70
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-a048-049bae7b5a9f
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-e379-b3eef6615335
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1c-50be-65d0761500f2	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-fe0c-60d378ee99e4
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c970-9013d5f55d53
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-a048-049bae7b5a9f
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-1607-ce58285bdbc9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0c30-940be132a03e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-22b0-6f949b526dd6
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-82e0-4c5c4696aef0
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d466-8070ff83b0b9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-61a3-6b822733adac
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b6f9-54b2c9c9d09a
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d122-8e6980cbf84d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-7abd-189c3c991ff7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-3973-ad2c258347fa
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d455-f00d349e3f04
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-7366-f1ae12e9ef6e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4abe-0a6031582817
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-029a-3606c0d6907e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-3390-30232dd36fe9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c6fa-3e198f7b4388
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5e48-37dde86434ee
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-fe2e-e2897f978cad
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-72fd-dd6d2df31b99
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-45cf-6be39fd06132
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c4a1-e5e5d090607a
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-94e0-37f02e15f748
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-87e2-cc41955e011e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-81e6-03c66b846a24
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-48a6-be12e37c9f50
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5143-25269042d6b7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-78d7-0b4b4894ca35
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-84e5-025bb70acc08
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-dfd8-20e63d0a1a29
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-7535-d661e77400f1
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d261-c2a86fb883f7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-a31d-7f4e6d8678ee
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-9a54-cb941b13dac8
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5847-6439ca950d5f
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-57e1-29019f35c4ef
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-7ba6-c762c3ea245d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c668-2791e598fb38
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5717-0b80d2c2d1b2
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-6465-7cbb35073f11
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-6329-24f1f4ee9b0a
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-9108-a678bfc6115d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-3ad0-9e3fca296429
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4579-0f8031ee9f71
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-548f-6ed8b100a947
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-7be4-e10e6fbaff91
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-815a-912b92aba2b0
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d527-5311ac98733d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4e06-94ed4f2d87f4
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-2131-6bc65edc7526
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c3bc-1359e8579823
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-be62-c947dadeb61e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c8dc-688bb0ec2429
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b222-8d5664145191
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-aff2-64e085ed7b76
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-713f-20f1fe6ad4d6
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0750-3e6fdadd2d38
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f39c-6202f9a24d60
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-210d-8720fe00e3d7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-87b1-db315b5ba6e0
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-a8f3-1487057880d7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-abdf-767198b63324
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-e94d-c5a0e3d78f02
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b212-859081d3b685
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-33e4-45aed709186c
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b979-abdd02838955
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c6bf-ff670c0d6205
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d888-4d2a7c9c2574
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f8c4-2cfd218c13b4
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-33ff-fc203d6d188b
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-9858-97a8d60b8700
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-3254-34b75987738e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-01bb-d5fc09220578
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4903-b73b15c948b8
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-9243-16c3e4501da1
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5100-52e7b1c2142b
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-277c-2eaf1f3d57b7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-2629-1d9388e57cab
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-bd59-c4f163e19153
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0140-5a137e939ebf
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-e1fc-8028a409823d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-46ed-65f94555c46a
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-e264-e86f886a1865
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0330-914cad95d59d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c167-8860b25bfc10
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f1f9-ee44775de4a3
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f6f9-e23e06167afa
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-a14d-d74fd018406d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-ceb4-4581f052c01d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4431-b6f71c2e6ae8
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d2df-6ca2f230091c
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-50da-e1d726257f69
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f818-a26261f36af1
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-aeac-a1ea82c152f3
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b994-0cbdb0ae73a9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4ba6-fa8fa378f1cc
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-fc11-bfec172aea31
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-bdcd-2e06c2dbca73
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0461-4c06d5ccc978
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-0e1d-d7a66cfe2db7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-16ee-2fc3fde9437b
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-e9d0-169b5abe7fcd
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-eb83-8478c0835b24
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-ece8-adf708066edd
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-b540-11bce8eedb76
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d5ca-df6e5f13c737
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-2f97-5aa3b00c45c0
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-6b1a-da845257aa70
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-2443-a252f15825c5
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-e379-b3eef6615335
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f56c-eb105dd9f289
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-749a-5fb83100a96d
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5146-c129045e4df0
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d304-3306638059c9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-ffd1-799bbf040433
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d0c9-34dbad22d071
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-aba8-bd906a00bbdf
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d49a-e8401e83432a
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-d377-63c4eb773ea8
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f934-68143baee9a1
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-f110-5f648bcfc92e
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-14fe-caa58fdc0d69
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-3c71-86cac5f62bc9
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-03d4-74378a33cbb4
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-4ff6-0f054af752a7
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-932c-33fec8f9c866
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-521b-6402038f3539
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-c576-e55d3311a025
00020000-558d-3f1e-453c-c6bff8634382	00030000-558d-3f1c-5d12-41f53e0bb0c2
\.


--
-- TOC entry 2875 (class 0 OID 8252221)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8252252)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8252384)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-558d-3f1e-e199-c03e2faee956	00090000-558d-3f1e-88e2-e06e60e93de4	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2852 (class 0 OID 8251986)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-558d-3f1e-33c5-8bd636a2590f	00040000-558d-3f1c-e1ea-02b2ca2d792d	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-3f1e-b6e2-175ff7a7ec0f	00040000-558d-3f1c-e1ea-02b2ca2d792d	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-3f1e-37a0-859a90856590	00040000-558d-3f1c-e1ea-02b2ca2d792d	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-3f1e-dcf0-ab7002ed3f4c	00040000-558d-3f1c-e1ea-02b2ca2d792d	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-3f1e-1239-98cf35ceebc9	00040000-558d-3f1c-e1ea-02b2ca2d792d	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-558d-3f1e-c430-c8efa698e560	00040000-558d-3f1c-6a6d-620d3ab22811	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2854 (class 0 OID 8252021)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-558d-3f1c-aeb7-4c7cb11ace5e	8341	Adlešiči
00050000-558d-3f1c-a509-2915714be25b	5270	Ajdovščina
00050000-558d-3f1c-9f22-f01f7e04c62c	6280	Ankaran/Ancarano
00050000-558d-3f1c-74a7-a2da5e58c0d7	9253	Apače
00050000-558d-3f1c-aa58-f5af731461f8	8253	Artiče
00050000-558d-3f1c-8ba7-be81c9d6d018	4275	Begunje na Gorenjskem
00050000-558d-3f1c-a2e4-0afb827194a0	1382	Begunje pri Cerknici
00050000-558d-3f1c-ee0c-5b65a7f75d37	9231	Beltinci
00050000-558d-3f1c-88c7-64b01d6621b8	2234	Benedikt
00050000-558d-3f1c-8aae-718810dccb0c	2345	Bistrica ob Dravi
00050000-558d-3f1c-97e7-387c76cd1a25	3256	Bistrica ob Sotli
00050000-558d-3f1c-7983-cdfa318ca5c3	8259	Bizeljsko
00050000-558d-3f1c-af75-ff9a263eeef3	1223	Blagovica
00050000-558d-3f1c-2d02-d7e0b850ee05	8283	Blanca
00050000-558d-3f1c-a87f-fa765c02a4cd	4260	Bled
00050000-558d-3f1c-cc15-4938484e36bd	4273	Blejska Dobrava
00050000-558d-3f1c-5f00-31f0c987be64	9265	Bodonci
00050000-558d-3f1c-9931-ed16cb38ab2d	9222	Bogojina
00050000-558d-3f1c-fcc1-35dee45cf0a7	4263	Bohinjska Bela
00050000-558d-3f1c-e2ee-d997285e3016	4264	Bohinjska Bistrica
00050000-558d-3f1c-3379-bb690833eaf6	4265	Bohinjsko jezero
00050000-558d-3f1c-4296-e1efc9380539	1353	Borovnica
00050000-558d-3f1c-1724-d42473b6d566	8294	Boštanj
00050000-558d-3f1c-6289-68bb93df20c8	5230	Bovec
00050000-558d-3f1c-b5f2-e7eb34598d4c	5295	Branik
00050000-558d-3f1c-46c9-f71d5aa61f13	3314	Braslovče
00050000-558d-3f1c-c81e-efc438bce661	5223	Breginj
00050000-558d-3f1c-5eff-e120b88d7b42	8280	Brestanica
00050000-558d-3f1c-1ca1-cd969593e1f0	2354	Bresternica
00050000-558d-3f1c-6199-30342e4cc6b4	4243	Brezje
00050000-558d-3f1c-3d94-3846283024f7	1351	Brezovica pri Ljubljani
00050000-558d-3f1c-f661-1d9068803a26	8250	Brežice
00050000-558d-3f1c-9409-f51d2bf23607	4210	Brnik - Aerodrom
00050000-558d-3f1c-93ca-b3468bef03ae	8321	Brusnice
00050000-558d-3f1c-faa9-6f5b58c2fb17	3255	Buče
00050000-558d-3f1c-659a-2d4a704aff6a	8276	Bučka 
00050000-558d-3f1c-115a-a9c1144a4295	9261	Cankova
00050000-558d-3f1c-7569-cbc0c736f6e0	3000	Celje 
00050000-558d-3f1d-11f6-e7d0ac6e3cba	3001	Celje - poštni predali
00050000-558d-3f1d-1c1c-bb7f3ca0e901	4207	Cerklje na Gorenjskem
00050000-558d-3f1d-6b92-2c203b0c6639	8263	Cerklje ob Krki
00050000-558d-3f1d-00cc-c444d0a17cc5	1380	Cerknica
00050000-558d-3f1d-055f-d7b8d98284c7	5282	Cerkno
00050000-558d-3f1d-40de-387795954461	2236	Cerkvenjak
00050000-558d-3f1d-b56a-1780f2038a07	2215	Ceršak
00050000-558d-3f1d-4981-4366a980114c	2326	Cirkovce
00050000-558d-3f1d-46ca-ce253640edb9	2282	Cirkulane
00050000-558d-3f1d-ef83-3ccb57719f79	5273	Col
00050000-558d-3f1d-c779-b8449fc13335	8251	Čatež ob Savi
00050000-558d-3f1d-f01a-5e6d5f1e5641	1413	Čemšenik
00050000-558d-3f1d-fc28-13453a78a082	5253	Čepovan
00050000-558d-3f1d-0cdd-f9b60ac6b9b5	9232	Črenšovci
00050000-558d-3f1d-4e2f-123f58a4e700	2393	Črna na Koroškem
00050000-558d-3f1d-035d-7bc573821b4a	6275	Črni Kal
00050000-558d-3f1d-c328-41b5e62464be	5274	Črni Vrh nad Idrijo
00050000-558d-3f1d-6f93-fa789c8328bf	5262	Črniče
00050000-558d-3f1d-b629-32dc394d1f88	8340	Črnomelj
00050000-558d-3f1d-f737-2b4041669ab6	6271	Dekani
00050000-558d-3f1d-5319-832d2d23414b	5210	Deskle
00050000-558d-3f1d-7aad-92a3f474ce42	2253	Destrnik
00050000-558d-3f1d-b5d6-736d25713f3b	6215	Divača
00050000-558d-3f1d-985c-f71d999eb058	1233	Dob
00050000-558d-3f1d-7872-fdcef8cb5f2f	3224	Dobje pri Planini
00050000-558d-3f1d-d07f-1ce09396ba2d	8257	Dobova
00050000-558d-3f1d-ad9e-776925f966d6	1423	Dobovec
00050000-558d-3f1d-9cbb-c16e21ecb38c	5263	Dobravlje
00050000-558d-3f1d-3cbb-9d4c6bc7a552	3204	Dobrna
00050000-558d-3f1d-9679-5518244b7fe5	8211	Dobrnič
00050000-558d-3f1d-f787-168ffb637487	1356	Dobrova
00050000-558d-3f1d-4be5-bdb5742266ec	9223	Dobrovnik/Dobronak 
00050000-558d-3f1d-187b-c0aef9210343	5212	Dobrovo v Brdih
00050000-558d-3f1d-d997-c6b58876d37b	1431	Dol pri Hrastniku
00050000-558d-3f1d-4c2a-51f71f2f7718	1262	Dol pri Ljubljani
00050000-558d-3f1d-f58e-cee672d760d8	1273	Dole pri Litiji
00050000-558d-3f1d-7a45-22124df3c3c6	1331	Dolenja vas
00050000-558d-3f1d-32e0-d05e08eae5bf	8350	Dolenjske Toplice
00050000-558d-3f1d-434f-2f88285ccd3f	1230	Domžale
00050000-558d-3f1d-f5d9-4ac8df2d1af8	2252	Dornava
00050000-558d-3f1d-78a0-fd443b3d9941	5294	Dornberk
00050000-558d-3f1d-cd0e-b4d7ceae1c4a	1319	Draga
00050000-558d-3f1d-4cf5-08b49f249c8d	8343	Dragatuš
00050000-558d-3f1d-a619-d8a8957f1424	3222	Dramlje
00050000-558d-3f1d-2999-808aeea9dde5	2370	Dravograd
00050000-558d-3f1d-091a-0ed29ebf31d1	4203	Duplje
00050000-558d-3f1d-5577-dd0ce2249df9	6221	Dutovlje
00050000-558d-3f1d-ab44-35f2a1598492	8361	Dvor
00050000-558d-3f1d-a97d-a941fca991b6	2343	Fala
00050000-558d-3f1d-c7fc-6aec19eb63e5	9208	Fokovci
00050000-558d-3f1d-11c6-5ca2a2d4e213	2313	Fram
00050000-558d-3f1d-a6c6-88f9f1ab5cbe	3213	Frankolovo
00050000-558d-3f1d-80d2-1cf89c5274e3	1274	Gabrovka
00050000-558d-3f1d-5f3c-3a8ce5cee753	8254	Globoko
00050000-558d-3f1d-2220-d1c42844574c	5275	Godovič
00050000-558d-3f1d-d4a3-b3ff901dbb42	4204	Golnik
00050000-558d-3f1d-96e5-1566b9decd7b	3303	Gomilsko
00050000-558d-3f1d-d014-8197485dcec8	4224	Gorenja vas
00050000-558d-3f1d-4cf7-dafdc6fbdceb	3263	Gorica pri Slivnici
00050000-558d-3f1d-605a-a7facd2b9f00	2272	Gorišnica
00050000-558d-3f1d-b0b0-57558e938da2	9250	Gornja Radgona
00050000-558d-3f1d-fe15-478a53032ee7	3342	Gornji Grad
00050000-558d-3f1d-ed91-4356ee6838db	4282	Gozd Martuljek
00050000-558d-3f1d-d7f6-1bc30c7f3c84	6272	Gračišče
00050000-558d-3f1d-0a00-6c686d4e90ba	9264	Grad
00050000-558d-3f1d-024f-bfb1cb069faf	8332	Gradac
00050000-558d-3f1d-02ce-685c240eeb13	1384	Grahovo
00050000-558d-3f1d-8739-7f747cf34351	5242	Grahovo ob Bači
00050000-558d-3f1d-c707-9b9d157f7229	5251	Grgar
00050000-558d-3f1d-25da-bcf2c95871f5	3302	Griže
00050000-558d-3f1d-a2ef-be3256242f6a	3231	Grobelno
00050000-558d-3f1d-881e-4fd3db6bc502	1290	Grosuplje
00050000-558d-3f1d-eb0c-f9edbd417c4a	2288	Hajdina
00050000-558d-3f1d-6aff-99f18b082bdc	8362	Hinje
00050000-558d-3f1d-5729-0d69f8a4177b	2311	Hoče
00050000-558d-3f1d-898c-246c4db5f073	9205	Hodoš/Hodos
00050000-558d-3f1d-bd58-14c876c20cf2	1354	Horjul
00050000-558d-3f1d-dc00-989526293385	1372	Hotedršica
00050000-558d-3f1d-0c61-4685064105eb	1430	Hrastnik
00050000-558d-3f1d-59ca-ff023072fa79	6225	Hruševje
00050000-558d-3f1d-af10-5c217ba22bf5	4276	Hrušica
00050000-558d-3f1d-166e-7230577ca5f8	5280	Idrija
00050000-558d-3f1d-9aeb-21cb8d56fb1d	1292	Ig
00050000-558d-3f1d-a30b-155d2f36e8c0	6250	Ilirska Bistrica
00050000-558d-3f1d-79cc-70b546b00689	6251	Ilirska Bistrica-Trnovo
00050000-558d-3f1d-0b72-a7da197e6aa4	1295	Ivančna Gorica
00050000-558d-3f1d-33f1-39f40f45382f	2259	Ivanjkovci
00050000-558d-3f1d-daa0-a99a40948975	1411	Izlake
00050000-558d-3f1d-dd37-5203c3b446b1	6310	Izola/Isola
00050000-558d-3f1d-d133-1cf4606820fb	2222	Jakobski Dol
00050000-558d-3f1d-7800-16468b8fb919	2221	Jarenina
00050000-558d-3f1d-1423-eedcfd8efb31	6254	Jelšane
00050000-558d-3f1d-9a00-41fc06fb5210	4270	Jesenice
00050000-558d-3f1d-9b5d-5723beac57ff	8261	Jesenice na Dolenjskem
00050000-558d-3f1d-85cd-6840ae27579c	3273	Jurklošter
00050000-558d-3f1d-7e69-3c76d021edcd	2223	Jurovski Dol
00050000-558d-3f1d-ed4a-e3e4127e46a9	2256	Juršinci
00050000-558d-3f1d-45e6-c66b55ace3fa	5214	Kal nad Kanalom
00050000-558d-3f1d-01db-7626f6ba8bae	3233	Kalobje
00050000-558d-3f1d-e5bc-7303dca3e445	4246	Kamna Gorica
00050000-558d-3f1d-520a-ca01c4ea72e4	2351	Kamnica
00050000-558d-3f1d-3ad7-4b25d123f0b4	1241	Kamnik
00050000-558d-3f1d-9cea-7ab270e8ba87	5213	Kanal
00050000-558d-3f1d-d1d7-3870a08e77ea	8258	Kapele
00050000-558d-3f1d-7143-a2c97af3aacb	2362	Kapla
00050000-558d-3f1d-b42a-4e5004041e6f	2325	Kidričevo
00050000-558d-3f1d-94ed-17617672a900	1412	Kisovec
00050000-558d-3f1d-bf6d-bd5c0a53eaf5	6253	Knežak
00050000-558d-3f1d-5811-5a651a9d6959	5222	Kobarid
00050000-558d-3f1d-013c-2508bf51d200	9227	Kobilje
00050000-558d-3f1d-1290-f415d2b8f04e	1330	Kočevje
00050000-558d-3f1d-86f8-f8bed15c31e2	1338	Kočevska Reka
00050000-558d-3f1d-e70a-67daa1dbd6aa	2276	Kog
00050000-558d-3f1d-b389-2d55c4a19c7f	5211	Kojsko
00050000-558d-3f1d-025f-33903ec49987	6223	Komen
00050000-558d-3f1d-76ec-d5cf7b65f328	1218	Komenda
00050000-558d-3f1d-8264-d15e6980311a	6000	Koper/Capodistria 
00050000-558d-3f1d-5c4d-c0fed099435b	6001	Koper/Capodistria - poštni predali
00050000-558d-3f1d-dd65-eb59cf3f9f3f	8282	Koprivnica
00050000-558d-3f1d-2e12-23653e7118bb	5296	Kostanjevica na Krasu
00050000-558d-3f1d-3356-2cc09a444521	8311	Kostanjevica na Krki
00050000-558d-3f1d-2c71-bda428a549b4	1336	Kostel
00050000-558d-3f1d-9785-2d0bb539357c	6256	Košana
00050000-558d-3f1d-cb00-32bc54b7bf6f	2394	Kotlje
00050000-558d-3f1d-0e3f-c9fcfc56fefd	6240	Kozina
00050000-558d-3f1d-a2b9-aea81958400b	3260	Kozje
00050000-558d-3f1d-1e16-3d1af409b58e	4000	Kranj 
00050000-558d-3f1d-8b2c-4ae7a9785e86	4001	Kranj - poštni predali
00050000-558d-3f1d-d0a2-07acf24014e9	4280	Kranjska Gora
00050000-558d-3f1d-cf0a-16187625c5ec	1281	Kresnice
00050000-558d-3f1d-c490-5d3d91795cac	4294	Križe
00050000-558d-3f1d-3172-e1bc47e6631d	9206	Križevci
00050000-558d-3f1d-15ed-3ddd91d3978c	9242	Križevci pri Ljutomeru
00050000-558d-3f1d-3dd0-8dd21197916c	1301	Krka
00050000-558d-3f1d-41eb-4adf3bcf41bd	8296	Krmelj
00050000-558d-3f1d-1333-0d4cfabb4b41	4245	Kropa
00050000-558d-3f1d-b22f-ea2a056d30e7	8262	Krška vas
00050000-558d-3f1d-b603-4a63d9d8cfd7	8270	Krško
00050000-558d-3f1d-44a1-c2a691e4e06e	9263	Kuzma
00050000-558d-3f1d-89d9-aca5b3355507	2318	Laporje
00050000-558d-3f1d-f0c0-da879af60e40	3270	Laško
00050000-558d-3f1d-ffd6-82dd43820b1f	1219	Laze v Tuhinju
00050000-558d-3f1d-1a60-0189ff4fc9f9	2230	Lenart v Slovenskih goricah
00050000-558d-3f1d-d396-a85e1c5c189e	9220	Lendava/Lendva
00050000-558d-3f1d-631c-5c9370fe49fb	4248	Lesce
00050000-558d-3f1d-088a-aeadd5c41aa9	3261	Lesično
00050000-558d-3f1d-ec19-9d1d626b3cb2	8273	Leskovec pri Krškem
00050000-558d-3f1d-4102-2a60e5c6c396	2372	Libeliče
00050000-558d-3f1d-6d46-d3dc46e31459	2341	Limbuš
00050000-558d-3f1d-e6eb-b9247d2b3524	1270	Litija
00050000-558d-3f1d-daa6-32ef779aeb04	3202	Ljubečna
00050000-558d-3f1d-04c5-d943de71b679	1000	Ljubljana 
00050000-558d-3f1d-2dca-f6af6dfcc163	1001	Ljubljana - poštni predali
00050000-558d-3f1d-7209-16b1705fa65c	1231	Ljubljana - Črnuče
00050000-558d-3f1d-036e-a921990ac813	1261	Ljubljana - Dobrunje
00050000-558d-3f1d-e2f6-4decc9d61cce	1260	Ljubljana - Polje
00050000-558d-3f1d-23fd-a73c53888738	1210	Ljubljana - Šentvid
00050000-558d-3f1d-35f9-6a66da32bd8d	1211	Ljubljana - Šmartno
00050000-558d-3f1d-2e90-35262d3d3f98	3333	Ljubno ob Savinji
00050000-558d-3f1d-8ed1-bb45242ef8fc	9240	Ljutomer
00050000-558d-3f1d-a572-34bf70655c15	3215	Loče
00050000-558d-3f1d-393c-3d6970878706	5231	Log pod Mangartom
00050000-558d-3f1d-01ca-43dbfc1864db	1358	Log pri Brezovici
00050000-558d-3f1d-c5d1-2f460740c1db	1370	Logatec
00050000-558d-3f1d-0a53-27398eb8b61b	1371	Logatec
00050000-558d-3f1d-14d7-9fe0022a6dec	1434	Loka pri Zidanem Mostu
00050000-558d-3f1d-bbee-655cc835ef85	3223	Loka pri Žusmu
00050000-558d-3f1d-01a3-ab7a9c567d39	6219	Lokev
00050000-558d-3f1d-2387-2f80c08830ff	1318	Loški Potok
00050000-558d-3f1d-8c26-851e00be6b89	2324	Lovrenc na Dravskem polju
00050000-558d-3f1d-4c1d-d114a9ced961	2344	Lovrenc na Pohorju
00050000-558d-3f1d-3697-ac84ee696876	3334	Luče
00050000-558d-3f1d-b131-fb7a54927973	1225	Lukovica
00050000-558d-3f1d-d9ff-1996a546b537	9202	Mačkovci
00050000-558d-3f1d-99ef-d17678887470	2322	Majšperk
00050000-558d-3f1d-b14d-8896abaf1460	2321	Makole
00050000-558d-3f1d-9767-f347ccee07e1	9243	Mala Nedelja
00050000-558d-3f1d-f4ab-9262b02f934c	2229	Malečnik
00050000-558d-3f1d-946c-e862577bf814	6273	Marezige
00050000-558d-3f1d-c6e6-9c7af4e67a54	2000	Maribor 
00050000-558d-3f1d-cffc-b6d96ddbcb74	2001	Maribor - poštni predali
00050000-558d-3f1d-fc78-cc43521a5c61	2206	Marjeta na Dravskem polju
00050000-558d-3f1d-2258-b553346ed3c6	2281	Markovci
00050000-558d-3f1d-49a6-8921fa49538f	9221	Martjanci
00050000-558d-3f1d-4a7b-92804f8ad46c	6242	Materija
00050000-558d-3f1d-cc48-47ace3e39344	4211	Mavčiče
00050000-558d-3f1d-892a-3430ae54d75a	1215	Medvode
00050000-558d-3f1d-bbeb-b79247a00759	1234	Mengeš
00050000-558d-3f1d-7388-a72810a07094	8330	Metlika
00050000-558d-3f1d-f90f-22fee981e170	2392	Mežica
00050000-558d-3f1d-8c69-71448fa76ffc	2204	Miklavž na Dravskem polju
00050000-558d-3f1d-e463-1a1e2c1771d5	2275	Miklavž pri Ormožu
00050000-558d-3f1d-368f-2119257a32dd	5291	Miren
00050000-558d-3f1d-e692-43c18d9f20ca	8233	Mirna
00050000-558d-3f1d-486c-1e7937e80b2d	8216	Mirna Peč
00050000-558d-3f1d-0089-becb459d7a3d	2382	Mislinja
00050000-558d-3f1d-9699-84872c0fd34e	4281	Mojstrana
00050000-558d-3f1d-5100-69a26d1c284b	8230	Mokronog
00050000-558d-3f1d-38eb-19007270e8e8	1251	Moravče
00050000-558d-3f1d-7fe8-669362f34264	9226	Moravske Toplice
00050000-558d-3f1d-71e2-f01d91a9a931	5216	Most na Soči
00050000-558d-3f1d-291c-f16eeab04b0f	1221	Motnik
00050000-558d-3f1d-3298-851c21873b4a	3330	Mozirje
00050000-558d-3f1d-b301-9a8afa21414d	9000	Murska Sobota 
00050000-558d-3f1d-7990-7083b24458f6	9001	Murska Sobota - poštni predali
00050000-558d-3f1d-afb1-053524e96b5f	2366	Muta
00050000-558d-3f1d-181d-5d316f47045d	4202	Naklo
00050000-558d-3f1d-bb4a-41eed7bcef2a	3331	Nazarje
00050000-558d-3f1d-f6df-2d850bec5cf1	1357	Notranje Gorice
00050000-558d-3f1d-fd2d-bc059c8c38e1	3203	Nova Cerkev
00050000-558d-3f1d-27de-b6309dd773de	5000	Nova Gorica 
00050000-558d-3f1d-6a6f-3aa4109bdd8b	5001	Nova Gorica - poštni predali
00050000-558d-3f1d-5b97-6264c5c536b5	1385	Nova vas
00050000-558d-3f1d-322b-af02a53a2bd7	8000	Novo mesto
00050000-558d-3f1d-4185-5cfeca417134	8001	Novo mesto - poštni predali
00050000-558d-3f1d-c59f-69ff85ba20bb	6243	Obrov
00050000-558d-3f1d-f636-d8f79f1fa7f2	9233	Odranci
00050000-558d-3f1d-e244-5275e77a8650	2317	Oplotnica
00050000-558d-3f1d-d383-1432d74f7268	2312	Orehova vas
00050000-558d-3f1d-dcff-3b00dfb455ac	2270	Ormož
00050000-558d-3f1d-faf9-5a7d8b453410	1316	Ortnek
00050000-558d-3f1d-78e8-c6cc8d6caf8e	1337	Osilnica
00050000-558d-3f1d-066a-fe445ff5b876	8222	Otočec
00050000-558d-3f1d-ac92-37e940eda3c9	2361	Ožbalt
00050000-558d-3f1d-947c-5d6a67ed422c	2231	Pernica
00050000-558d-3f1d-3045-31ab6d765fe1	2211	Pesnica pri Mariboru
00050000-558d-3f1d-95b9-2f98a337432f	9203	Petrovci
00050000-558d-3f1d-d8ea-874f8ef075d0	3301	Petrovče
00050000-558d-3f1d-9d0e-3d70ebe89be4	6330	Piran/Pirano
00050000-558d-3f1d-bf79-91dee4fc064d	8255	Pišece
00050000-558d-3f1d-fc9f-651dea9c3421	6257	Pivka
00050000-558d-3f1d-fc27-4b301062f58e	6232	Planina
00050000-558d-3f1d-cce1-c7f1f0afe160	3225	Planina pri Sevnici
00050000-558d-3f1d-23c9-5b50353cb689	6276	Pobegi
00050000-558d-3f1d-826b-0684dae8b12f	8312	Podbočje
00050000-558d-3f1d-3b3d-80c7fd5c7e5c	5243	Podbrdo
00050000-558d-3f1d-3b3f-cf6e2bb12b79	3254	Podčetrtek
00050000-558d-3f1d-64c6-646597cba71a	2273	Podgorci
00050000-558d-3f1d-1622-bd7cec274a70	6216	Podgorje
00050000-558d-3f1d-f828-643f22938314	2381	Podgorje pri Slovenj Gradcu
00050000-558d-3f1d-eba9-44d12b746e84	6244	Podgrad
00050000-558d-3f1d-8365-3a49c97fddf2	1414	Podkum
00050000-558d-3f1d-ef7e-92a3feb607f6	2286	Podlehnik
00050000-558d-3f1d-5934-5e44f4788010	5272	Podnanos
00050000-558d-3f1d-07b4-b459ae21ff02	4244	Podnart
00050000-558d-3f1d-1e3a-bf42038f5558	3241	Podplat
00050000-558d-3f1d-0e66-84a0b026f96d	3257	Podsreda
00050000-558d-3f1d-c8a2-e69cf9d51111	2363	Podvelka
00050000-558d-3f1d-45cc-ed7bc335a4d7	2208	Pohorje
00050000-558d-3f1d-3492-a5c2b102b929	2257	Polenšak
00050000-558d-3f1d-7e4c-a35f2ca6fbeb	1355	Polhov Gradec
00050000-558d-3f1d-0ba5-84868551ed4e	4223	Poljane nad Škofjo Loko
00050000-558d-3f1d-5a94-1d2d9990e056	2319	Poljčane
00050000-558d-3f1d-245a-f9617d7ba6cc	1272	Polšnik
00050000-558d-3f1d-f7f7-9869becafcc0	3313	Polzela
00050000-558d-3f1d-14ed-7c673ed521d5	3232	Ponikva
00050000-558d-3f1d-6cf6-0a7aa6c2977d	6320	Portorož/Portorose
00050000-558d-3f1d-57ad-40c077be2551	6230	Postojna
00050000-558d-3f1d-0c12-a303eb1d3f04	2331	Pragersko
00050000-558d-3f1d-a949-e28a3634831c	3312	Prebold
00050000-558d-3f1d-9852-7d8378c78df8	4205	Preddvor
00050000-558d-3f1d-ea7c-a9d6857d4134	6255	Prem
00050000-558d-3f1d-27fd-1ac8bf742949	1352	Preserje
00050000-558d-3f1d-b0ec-c8aa8b3bd6e0	6258	Prestranek
00050000-558d-3f1d-2bcd-dd181caa978f	2391	Prevalje
00050000-558d-3f1d-6406-c6fba7e6ed71	3262	Prevorje
00050000-558d-3f1d-c7b9-776eeaaece67	1276	Primskovo 
00050000-558d-3f1d-1608-e991aa29553b	3253	Pristava pri Mestinju
00050000-558d-3f1d-2cef-64b4c5ffadb2	9207	Prosenjakovci/Partosfalva
00050000-558d-3f1d-8285-7fa0195d9b2d	5297	Prvačina
00050000-558d-3f1d-76d5-6bc428086d44	2250	Ptuj
00050000-558d-3f1d-7bfe-395f6e600a74	2323	Ptujska Gora
00050000-558d-3f1d-5a1b-5c8dec33a554	9201	Puconci
00050000-558d-3f1d-73f3-cd1ebbd2955e	2327	Rače
00050000-558d-3f1d-d11a-708310fcacb9	1433	Radeče
00050000-558d-3f1d-269d-84957b5699bb	9252	Radenci
00050000-558d-3f1d-5849-00dbbeb2c6a9	2360	Radlje ob Dravi
00050000-558d-3f1d-dffe-b095659fe26f	1235	Radomlje
00050000-558d-3f1d-f9ae-dcf992bce958	4240	Radovljica
00050000-558d-3f1d-506a-3f62f26bf2b6	8274	Raka
00050000-558d-3f1d-db71-afcc83b0d89b	1381	Rakek
00050000-558d-3f1d-58e4-1e1bbbf539bd	4283	Rateče - Planica
00050000-558d-3f1d-af7e-408547d9f972	2390	Ravne na Koroškem
00050000-558d-3f1d-79c0-5ae08d5df0c3	9246	Razkrižje
00050000-558d-3f1d-642c-1373078673b6	3332	Rečica ob Savinji
00050000-558d-3f1d-d3e3-1a6940289573	5292	Renče
00050000-558d-3f1d-6149-07b1e5f8d6a3	1310	Ribnica
00050000-558d-3f1d-8f4c-7765e62e09ba	2364	Ribnica na Pohorju
00050000-558d-3f1d-779b-a4ca7560c956	3272	Rimske Toplice
00050000-558d-3f1d-f031-5925cb132c23	1314	Rob
00050000-558d-3f1d-0f27-f072e9568210	5215	Ročinj
00050000-558d-3f1d-c20f-9e087902054e	3250	Rogaška Slatina
00050000-558d-3f1d-fd5f-c19a52b02cbc	9262	Rogašovci
00050000-558d-3f1d-ef84-8537b6db71c2	3252	Rogatec
00050000-558d-3f1d-55e6-b4db2184418f	1373	Rovte
00050000-558d-3f1d-b313-3c89a0bb0985	2342	Ruše
00050000-558d-3f1d-9ecb-ab160fb2b047	1282	Sava
00050000-558d-3f1d-02d3-b2faa4554058	6333	Sečovlje/Sicciole
00050000-558d-3f1d-3ef2-38f47459c558	4227	Selca
00050000-558d-3f1d-b307-544cd31e306e	2352	Selnica ob Dravi
00050000-558d-3f1d-d2b8-c4a6345b47a8	8333	Semič
00050000-558d-3f1d-b455-9a7ccc909b17	8281	Senovo
00050000-558d-3f1d-fc9c-cadaeaffcff6	6224	Senožeče
00050000-558d-3f1d-6c75-e3b284c4bdc0	8290	Sevnica
00050000-558d-3f1d-499e-26546bad6a1a	6210	Sežana
00050000-558d-3f1d-377d-31210ad74e9a	2214	Sladki Vrh
00050000-558d-3f1d-9f54-300c4b8c147e	5283	Slap ob Idrijci
00050000-558d-3f1d-c769-c8773349f139	2380	Slovenj Gradec
00050000-558d-3f1d-0ad5-4f3c0038abde	2310	Slovenska Bistrica
00050000-558d-3f1d-33e6-1f62f9e7931b	3210	Slovenske Konjice
00050000-558d-3f1d-ffe2-8fdb25d71d64	1216	Smlednik
00050000-558d-3f1d-6740-0146aaa28bd7	5232	Soča
00050000-558d-3f1d-110d-b931896c25cf	1317	Sodražica
00050000-558d-3f1d-da75-219c69a44c74	3335	Solčava
00050000-558d-3f1d-6116-13f2d813762f	5250	Solkan
00050000-558d-3f1d-274e-96e5ca00a353	4229	Sorica
00050000-558d-3f1d-278b-119ce3a68369	4225	Sovodenj
00050000-558d-3f1d-0be7-5d518aee65e7	5281	Spodnja Idrija
00050000-558d-3f1d-5f02-9324f46c27d4	2241	Spodnji Duplek
00050000-558d-3f1d-4715-6cb31327f1ce	9245	Spodnji Ivanjci
00050000-558d-3f1d-3cf6-9fd5ae10f77e	2277	Središče ob Dravi
00050000-558d-3f1d-0d27-473f80bc1a12	4267	Srednja vas v Bohinju
00050000-558d-3f1d-5773-95504ff135b1	8256	Sromlje 
00050000-558d-3f1d-58c7-f5da0b954808	5224	Srpenica
00050000-558d-3f1d-3372-07c2dfa74b52	1242	Stahovica
00050000-558d-3f1d-7551-b243b58501e5	1332	Stara Cerkev
00050000-558d-3f1d-6a15-1f3f52cb1c3f	8342	Stari trg ob Kolpi
00050000-558d-3f1d-e561-c7230066ef36	1386	Stari trg pri Ložu
00050000-558d-3f1d-bebe-2d9a358fe610	2205	Starše
00050000-558d-3f1d-1592-322dbe346590	2289	Stoperce
00050000-558d-3f1d-413a-7de2a4fae937	8322	Stopiče
00050000-558d-3f1d-67dc-da4106e249e2	3206	Stranice
00050000-558d-3f1d-f7bb-326cc8a0f553	8351	Straža
00050000-558d-3f1d-df81-ad38fc644795	1313	Struge
00050000-558d-3f1d-0368-172f5d06cd60	8293	Studenec
00050000-558d-3f1d-f479-348a6bea0cbf	8331	Suhor
00050000-558d-3f1d-4d62-85a1bfd6416b	2233	Sv. Ana v Slovenskih goricah
00050000-558d-3f1d-1973-5d05aab61939	2235	Sv. Trojica v Slovenskih goricah
00050000-558d-3f1d-e3d5-f05682419df6	2353	Sveti Duh na Ostrem Vrhu
00050000-558d-3f1d-5e21-054c03e0524d	9244	Sveti Jurij ob Ščavnici
00050000-558d-3f1d-adf0-2de0cb400e31	3264	Sveti Štefan
00050000-558d-3f1d-dde4-f28df9f51161	2258	Sveti Tomaž
00050000-558d-3f1d-40ef-e0e235077fb1	9204	Šalovci
00050000-558d-3f1d-6bb3-e5562d500d0e	5261	Šempas
00050000-558d-3f1d-6fef-45a60e29120d	5290	Šempeter pri Gorici
00050000-558d-3f1d-c707-052e42df2dcd	3311	Šempeter v Savinjski dolini
00050000-558d-3f1d-30ae-2d4ece6d97ee	4208	Šenčur
00050000-558d-3f1d-1d7f-ff2e65d5e67d	2212	Šentilj v Slovenskih goricah
00050000-558d-3f1d-a907-6703fd02116c	8297	Šentjanž
00050000-558d-3f1d-a5e5-e093522dbe51	2373	Šentjanž pri Dravogradu
00050000-558d-3f1d-dce8-e85c5f239eb2	8310	Šentjernej
00050000-558d-3f1d-8661-78cce1949da6	3230	Šentjur
00050000-558d-3f1d-67e2-c8b47de338f5	3271	Šentrupert
00050000-558d-3f1d-cfad-c0bc35da2943	8232	Šentrupert
00050000-558d-3f1d-f62a-b9e33175cba8	1296	Šentvid pri Stični
00050000-558d-3f1d-fe95-4a54bcaccc95	8275	Škocjan
00050000-558d-3f1d-727a-75d833a92612	6281	Škofije
00050000-558d-3f1d-3e65-bcb1f7b70b62	4220	Škofja Loka
00050000-558d-3f1d-3086-3e669825f502	3211	Škofja vas
00050000-558d-3f1d-f09b-3ea856cbfe4b	1291	Škofljica
00050000-558d-3f1d-6bc9-4b21a6504666	6274	Šmarje
00050000-558d-3f1d-678f-8bd7c83c881e	1293	Šmarje - Sap
00050000-558d-3f1d-f72b-9486fff89389	3240	Šmarje pri Jelšah
00050000-558d-3f1d-93d7-5794cb8cb6d7	8220	Šmarješke Toplice
00050000-558d-3f1d-f01b-4db7c3be0d2e	2315	Šmartno na Pohorju
00050000-558d-3f1d-ff58-19d236920015	3341	Šmartno ob Dreti
00050000-558d-3f1d-a65a-6ec52940b9b8	3327	Šmartno ob Paki
00050000-558d-3f1d-b5ee-82137f038b62	1275	Šmartno pri Litiji
00050000-558d-3f1d-cd1b-58c316481372	2383	Šmartno pri Slovenj Gradcu
00050000-558d-3f1d-7df7-5f68444f132d	3201	Šmartno v Rožni dolini
00050000-558d-3f1d-d5e7-56734d0ee849	3325	Šoštanj
00050000-558d-3f1d-0179-343aac030283	6222	Štanjel
00050000-558d-3f1d-88f5-229f54412895	3220	Štore
00050000-558d-3f1d-425b-13e6aa0d335d	3304	Tabor
00050000-558d-3f1d-e385-18a1d78af20c	3221	Teharje
00050000-558d-3f1d-89c1-df7d963b69b6	9251	Tišina
00050000-558d-3f1d-425c-e574493e8fb9	5220	Tolmin
00050000-558d-3f1d-c6c9-df5b209942b7	3326	Topolšica
00050000-558d-3f1d-a786-b3b4987d5685	2371	Trbonje
00050000-558d-3f1d-0b6b-7b929a40199e	1420	Trbovlje
00050000-558d-3f1d-5fce-d26998026d60	8231	Trebelno 
00050000-558d-3f1d-7f29-778a0a3242ec	8210	Trebnje
00050000-558d-3f1d-c1f3-60ff7f9fcd48	5252	Trnovo pri Gorici
00050000-558d-3f1d-ba7b-5012326d3c95	2254	Trnovska vas
00050000-558d-3f1d-4fb8-a66997b13b51	1222	Trojane
00050000-558d-3f1d-24b9-2e482cd4dc80	1236	Trzin
00050000-558d-3f1d-d2f3-5f6db1bed772	4290	Tržič
00050000-558d-3f1d-ec9c-1ff7c5809161	8295	Tržišče
00050000-558d-3f1d-6ad9-6ef8c84de393	1311	Turjak
00050000-558d-3f1d-e8e0-6e0777f169a8	9224	Turnišče
00050000-558d-3f1d-5762-d1ec78d3a422	8323	Uršna sela
00050000-558d-3f1d-3c93-73f7d4490a10	1252	Vače
00050000-558d-3f1d-2c57-025f3d15b20e	3320	Velenje 
00050000-558d-3f1d-0786-df9b706e9ed2	3322	Velenje - poštni predali
00050000-558d-3f1d-03d5-b6fc15ad9eba	8212	Velika Loka
00050000-558d-3f1d-aae2-525880b8469e	2274	Velika Nedelja
00050000-558d-3f1d-f67a-618812f7a3cc	9225	Velika Polana
00050000-558d-3f1d-76ee-ca8710f307ab	1315	Velike Lašče
00050000-558d-3f1d-8041-c22468f9eab0	8213	Veliki Gaber
00050000-558d-3f1d-e20c-8139487d349e	9241	Veržej
00050000-558d-3f1d-0dc9-f939219170e1	1312	Videm - Dobrepolje
00050000-558d-3f1d-ff24-0acc74438df9	2284	Videm pri Ptuju
00050000-558d-3f1d-22c4-2fa190b3ce99	8344	Vinica
00050000-558d-3f1d-37bb-babaf51f5f2d	5271	Vipava
00050000-558d-3f1d-244a-169d9361371b	4212	Visoko
00050000-558d-3f1d-a320-78f8a7c58e5a	1294	Višnja Gora
00050000-558d-3f1d-7326-27eee4e5b723	3205	Vitanje
00050000-558d-3f1d-4d67-90349c6f6ffc	2255	Vitomarci
00050000-558d-3f1d-d685-b852792589ea	1217	Vodice
00050000-558d-3f1d-f772-0fb68c2daf62	3212	Vojnik\t
00050000-558d-3f1d-dac2-55e262c32767	5293	Volčja Draga
00050000-558d-3f1d-d827-f8106280712c	2232	Voličina
00050000-558d-3f1d-8c23-3667d86bb425	3305	Vransko
00050000-558d-3f1d-c514-63b50f48d390	6217	Vremski Britof
00050000-558d-3f1d-b50f-6397a92e1f0c	1360	Vrhnika
00050000-558d-3f1d-e6f5-6a4119acbd4b	2365	Vuhred
00050000-558d-3f1d-86dd-fcc236d919c9	2367	Vuzenica
00050000-558d-3f1d-134b-3fa2c2604b01	8292	Zabukovje 
00050000-558d-3f1d-34e1-f883c0aa288e	1410	Zagorje ob Savi
00050000-558d-3f1d-7301-63b0af702afb	1303	Zagradec
00050000-558d-3f1d-2519-ed91ba167c6c	2283	Zavrč
00050000-558d-3f1d-8de9-7c6721e45598	8272	Zdole 
00050000-558d-3f1d-1988-2f25a9317243	4201	Zgornja Besnica
00050000-558d-3f1d-bf2e-122f1a3ed55a	2242	Zgornja Korena
00050000-558d-3f1d-e363-907a537e6acb	2201	Zgornja Kungota
00050000-558d-3f1d-247d-ab5e130cba0d	2316	Zgornja Ložnica
00050000-558d-3f1d-0bdc-bed5a4905941	2314	Zgornja Polskava
00050000-558d-3f1d-5adb-b093e555d928	2213	Zgornja Velka
00050000-558d-3f1d-998c-ad62c957244f	4247	Zgornje Gorje
00050000-558d-3f1d-c17e-ac06fe700583	4206	Zgornje Jezersko
00050000-558d-3f1d-4727-7a19b44d1251	2285	Zgornji Leskovec
00050000-558d-3f1d-4d50-cf70f649dce5	1432	Zidani Most
00050000-558d-3f1d-9f3a-fd2bdc94551f	3214	Zreče
00050000-558d-3f1d-531e-3a58f0675717	4209	Žabnica
00050000-558d-3f1d-59af-f1004378e32b	3310	Žalec
00050000-558d-3f1d-9ce1-d53f0cc812b7	4228	Železniki
00050000-558d-3f1d-b231-8df23e1f1ef9	2287	Žetale
00050000-558d-3f1d-4bfc-c37a4473e2d3	4226	Žiri
00050000-558d-3f1d-67cd-0338dc6b1469	4274	Žirovnica
00050000-558d-3f1d-6f23-f4e25260072e	8360	Žužemberk
\.


--
-- TOC entry 2871 (class 0 OID 8252195)
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
-- TOC entry 2853 (class 0 OID 8252006)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8252084)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8252207)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 8252327)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8252376)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-558d-3f1e-64f4-d6c77e343c66	00080000-558d-3f1e-c430-c8efa698e560	0900	AK
00190000-558d-3f1e-3a45-90e033393f22	00080000-558d-3f1e-37a0-859a90856590	0987	A
00190000-558d-3f1e-4391-529357b62819	00080000-558d-3f1e-b6e2-175ff7a7ec0f	0989	A
\.


--
-- TOC entry 2897 (class 0 OID 8252510)
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
-- TOC entry 2877 (class 0 OID 8252236)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-558d-3f1e-8445-7512cbd8549a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-558d-3f1e-7432-00ad20629150	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-558d-3f1e-ad39-dad1ba535fd3	0003	Kazinska	t	84	Kazinska dvorana
00220000-558d-3f1e-488a-8c819f9076ca	0004	Mali oder	t	24	Mali oder 
00220000-558d-3f1e-757e-e6236a3f43e0	0005	Komorni oder	t	15	Komorni oder
00220000-558d-3f1e-0769-e671349e6356	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-558d-3f1e-0181-a1c955362b60	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2869 (class 0 OID 8252180)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 8252170)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8252365)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 8252304)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 8251878)
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
-- TOC entry 2878 (class 0 OID 8252246)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 8251916)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-558d-3f1c-09c7-8dc1a483ace4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-558d-3f1c-7922-13087f3c11f7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-558d-3f1c-6518-b18d484b7317	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-558d-3f1c-548b-87ad9fa9b625	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-558d-3f1c-04df-a1f8e2eb86bb	planer	Planer dogodkov v koledarju	t
00020000-558d-3f1c-2fb3-446e40846568	kadrovska	Kadrovska služba	t
00020000-558d-3f1c-3a2f-29c7f81214f9	arhivar	Ažuriranje arhivalij	t
00020000-558d-3f1c-7a67-a9e1d171c1fa	igralec	Igralec	t
00020000-558d-3f1c-50be-65d0761500f2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-558d-3f1e-453c-c6bff8634382	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2844 (class 0 OID 8251900)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-558d-3f1c-fa2c-0b98f8e8fdd2	00020000-558d-3f1c-6518-b18d484b7317
00010000-558d-3f1c-bef4-eb254226e545	00020000-558d-3f1c-6518-b18d484b7317
00010000-558d-3f1e-4a19-b3d7cbd948fe	00020000-558d-3f1e-453c-c6bff8634382
\.


--
-- TOC entry 2880 (class 0 OID 8252260)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8252201)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 8252151)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 8252554)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-558d-3f1d-d6b6-a308b5a6e5cf	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-558d-3f1d-6f06-e4607b9d7830	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-558d-3f1d-5701-65f0b8733791	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-558d-3f1d-37a3-9999a61a5bd7	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-558d-3f1d-9a8f-d24f4d7ccb81	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 8252546)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-558d-3f1d-f08e-9ac6645e5813	00230000-558d-3f1d-37a3-9999a61a5bd7	popa
00240000-558d-3f1d-687b-bb6c913c893d	00230000-558d-3f1d-37a3-9999a61a5bd7	oseba
00240000-558d-3f1d-37ce-1c85a6be323c	00230000-558d-3f1d-6f06-e4607b9d7830	prostor
00240000-558d-3f1d-74d8-f4485f9a2e37	00230000-558d-3f1d-37a3-9999a61a5bd7	besedilo
00240000-558d-3f1d-8d8f-05cc3dc1074a	00230000-558d-3f1d-37a3-9999a61a5bd7	uprizoritev
00240000-558d-3f1d-170c-89c9836717cd	00230000-558d-3f1d-37a3-9999a61a5bd7	funkcija
00240000-558d-3f1d-915f-020b30aa45de	00230000-558d-3f1d-37a3-9999a61a5bd7	tipfunkcije
00240000-558d-3f1d-093e-c5e3266c2c50	00230000-558d-3f1d-37a3-9999a61a5bd7	alternacija
00240000-558d-3f1d-f836-5b77a2225070	00230000-558d-3f1d-d6b6-a308b5a6e5cf	pogodba
00240000-558d-3f1d-2167-59b36e07da2c	00230000-558d-3f1d-37a3-9999a61a5bd7	zaposlitev
\.


--
-- TOC entry 2900 (class 0 OID 8252541)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8252314)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-558d-3f1e-fd56-6d9fff1f4e83	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	00080000-558d-3f1e-33c5-8bd636a2590f	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-558d-3f1e-fa44-e1232f9aa0e3	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	00080000-558d-3f1e-33c5-8bd636a2590f	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-558d-3f1e-c9e4-c6e50b4c02c0	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	00080000-558d-3f1e-1239-98cf35ceebc9	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2851 (class 0 OID 8251978)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 8252157)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-558d-3f1e-2f9f-551dfbe74d77	00180000-558d-3f1e-3615-2e764043bd27	000c0000-558d-3f1e-9d8c-5e5c0d3605b3	00090000-558d-3f1e-3497-fe81273aa38a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-3f1e-c6ca-fb40dff2e57c	00180000-558d-3f1e-3615-2e764043bd27	000c0000-558d-3f1e-5908-11098fa56e6a	00090000-558d-3f1e-33ae-7a270a903865	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-3f1e-58cd-053713e74062	00180000-558d-3f1e-3615-2e764043bd27	000c0000-558d-3f1e-20f8-0e0711fd9381	00090000-558d-3f1e-f00a-df04f24a44a0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-3f1e-d018-9fee9fcd8e19	00180000-558d-3f1e-3615-2e764043bd27	000c0000-558d-3f1e-33ac-60c6ee07dcc0	00090000-558d-3f1e-38ec-7648ae7e98d8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-3f1e-2eb6-4946a381ea7e	00180000-558d-3f1e-3615-2e764043bd27	000c0000-558d-3f1e-c85c-208d89534c15	00090000-558d-3f1e-413a-37c0a8770021	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-558d-3f1e-d3b4-2708faf6587d	00180000-558d-3f1e-c3bd-b3b6d4a7036e	\N	00090000-558d-3f1e-413a-37c0a8770021	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2888 (class 0 OID 8252354)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-558d-3f1d-a11a-fe78747fe0e5	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-558d-3f1d-82a5-0997a5b2cd23	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-558d-3f1d-b8d7-98e834451de0	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-558d-3f1d-55c4-74f3f93278ac	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-558d-3f1d-7a36-85409f456da3	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-558d-3f1d-9e1a-29f228d7588d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-558d-3f1d-ac07-90aff95a7c87	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-558d-3f1d-7c24-5bee6fea8103	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-558d-3f1d-2f2c-b593a41bab23	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-558d-3f1d-498b-7eada38fdb39	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-558d-3f1d-e2fe-5a5d749b4395	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-558d-3f1d-0704-e148c1d9e8b8	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-558d-3f1d-9e10-422aa70a236a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-558d-3f1d-e555-049cc868c3f8	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-558d-3f1d-70ab-7ce068b4b558	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-558d-3f1d-8ab3-bad8ad9d7bc0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2898 (class 0 OID 8252523)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-558d-3f1d-f540-4c59292dc24f	01	Velika predstava	f	1.00	1.00
002b0000-558d-3f1d-27bf-0229970560c2	02	Mala predstava	f	0.50	0.50
002b0000-558d-3f1d-5973-1caeee349a54	03	Mala koprodukcija	t	0.40	1.00
002b0000-558d-3f1d-4af0-c8cb4ff3f4d9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-558d-3f1d-c894-b774ffe51a29	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2856 (class 0 OID 8252041)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 8251887)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-558d-3f1c-bef4-eb254226e545	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROAGRDq6xdirU/Y/1MJxdzCSl8R7Dd1wC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-3e44-6e4e756e26f8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-ea8c-35b758689538	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-94bc-1111dcaab2d3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-d0fb-9940b50ec8cf	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-fd40-299907ec7a81	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-4864-56fb8d295637	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-6a55-014a7fbcdeec	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-bd73-5fdf86b1342f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-a3c8-fea16f205dba	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-558d-3f1e-4a19-b3d7cbd948fe	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-558d-3f1c-fa2c-0b98f8e8fdd2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 8252411)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-558d-3f1e-4cb1-7dce2e29903b	00160000-558d-3f1e-72e4-0b9d18e021c0	00150000-558d-3f1d-08ac-8b259f87c14b	00140000-558d-3f1c-4817-3675b5605fe4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-558d-3f1e-757e-e6236a3f43e0
000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	00160000-558d-3f1e-532a-052a5a26dafd	00150000-558d-3f1d-4353-161ffa56968c	00140000-558d-3f1c-8e15-a084cb3e6219	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-558d-3f1e-0769-e671349e6356
000e0000-558d-3f1e-97d3-730a67d5e81d	\N	00150000-558d-3f1d-4353-161ffa56968c	00140000-558d-3f1c-8e15-a084cb3e6219	00190000-558d-3f1e-3a45-90e033393f22	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-558d-3f1e-757e-e6236a3f43e0
000e0000-558d-3f1e-f51f-775eef67f997	\N	00150000-558d-3f1d-4353-161ffa56968c	00140000-558d-3f1c-8e15-a084cb3e6219	00190000-558d-3f1e-3a45-90e033393f22	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-558d-3f1e-757e-e6236a3f43e0
\.


--
-- TOC entry 2861 (class 0 OID 8252103)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-558d-3f1e-1231-e1414995f8fb	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	1	
00200000-558d-3f1e-5942-808530913af9	000e0000-558d-3f1e-87e3-d5cc5cd5e8ff	2	
\.


--
-- TOC entry 2876 (class 0 OID 8252228)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8252297)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8252135)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8252401)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-558d-3f1c-4817-3675b5605fe4	01	Drama	drama (SURS 01)
00140000-558d-3f1c-4568-3da98daef2bb	02	Opera	opera (SURS 02)
00140000-558d-3f1c-6ffa-68cca5d652bb	03	Balet	balet (SURS 03)
00140000-558d-3f1c-4390-91b3e432b04a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-558d-3f1c-3dd0-97ea027af624	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-558d-3f1c-8e15-a084cb3e6219	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-558d-3f1c-d231-8cd9f0532560	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2882 (class 0 OID 8252287)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-558d-3f1d-ae5e-3b050e865fa9	01	Opera	opera
00150000-558d-3f1d-6f4e-4cdbc0cb01d7	02	Opereta	opereta
00150000-558d-3f1d-d211-e66747227869	03	Balet	balet
00150000-558d-3f1d-4e0a-fc56fc9e7bf7	04	Plesne prireditve	plesne prireditve
00150000-558d-3f1d-32b3-2539f303fd85	05	Lutkovno gledališče	lutkovno gledališče
00150000-558d-3f1d-4b03-3341a1829376	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-558d-3f1d-3daa-9c2f98c19919	07	Biografska drama	biografska drama
00150000-558d-3f1d-08ac-8b259f87c14b	08	Komedija	komedija
00150000-558d-3f1d-6c80-0877b8ed790b	09	Črna komedija	črna komedija
00150000-558d-3f1d-7e54-47fd2dfc2de7	10	E-igra	E-igra
00150000-558d-3f1d-4353-161ffa56968c	11	Kriminalka	kriminalka
00150000-558d-3f1d-d288-26b99b9dcf50	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 8251941)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8252458)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 8252448)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8252353)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8252125)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 8252150)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 8252539)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 8252067)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 8252505)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 8252283)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 8252101)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 8252144)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 8252081)
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
-- TOC entry 2527 (class 2606 OID 8252193)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8252220)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 8252039)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8251950)
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
-- TOC entry 2442 (class 2606 OID 8251974)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 8251930)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 8251915)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 8252226)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 8252259)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 8252396)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 8252003)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 8252027)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8252199)
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
-- TOC entry 2457 (class 2606 OID 8252017)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 8252088)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8252211)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 8252335)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8252381)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 8252521)
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
-- TOC entry 2547 (class 2606 OID 8252243)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8252184)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8252175)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8252375)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 8252311)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 8251886)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 8252250)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8251904)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 8251924)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 8252268)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8252206)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 8252156)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8252563)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8252551)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 8252545)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 8252324)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 8251983)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 8252166)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 8252364)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 8252533)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 8252052)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 8251899)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 8252427)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8252110)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8252234)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 8252302)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 8252139)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 8252409)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8252295)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 8252132)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 8252325)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 8252326)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 8252005)
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
-- TOC entry 2540 (class 1259 OID 8252227)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 8252213)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 8252212)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 8252111)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 8252284)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 8252286)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 8252285)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 8252083)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 8252082)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 8252398)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 8252399)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 8252400)
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
-- TOC entry 2602 (class 1259 OID 8252432)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 8252429)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 8252433)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 8252431)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 8252430)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 8252054)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 8252053)
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
-- TOC entry 2440 (class 1259 OID 8251977)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 8252251)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 8252145)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 8251931)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 8251932)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 8252271)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 8252270)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 8252269)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 8252089)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 8252091)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 8252090)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2637 (class 1259 OID 8252553)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 8252179)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 8252177)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 8252176)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 8252178)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 8251905)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 8251906)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 8252235)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 8252200)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 8252312)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 8252313)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 8252509)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2624 (class 1259 OID 8252506)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 8252507)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 8252508)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 8252019)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 8252018)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 8252020)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 8252336)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2580 (class 1259 OID 8252337)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 8252462)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 8252463)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 8252460)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 8252461)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 8252303)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 8252188)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 8252187)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 8252185)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 8252186)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 8252450)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 8252449)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 8252522)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 8252102)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 8252540)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2436 (class 1259 OID 8251952)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 8251951)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 8251984)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 8251985)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 8252169)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 8252168)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 8252167)
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
-- TOC entry 2492 (class 1259 OID 8252134)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 8252130)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 8252127)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 8252128)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 8252126)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 8252131)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 8252129)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 8252004)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 8252068)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 8252070)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 8252069)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 8252071)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 8252194)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 8252397)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 8252428)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 8251975)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 8251976)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 8252296)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2643 (class 1259 OID 8252564)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 8252040)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2640 (class 1259 OID 8252552)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 8252245)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 8252244)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 8252459)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 8252028)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 8252410)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 8252382)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 8252383)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 8251925)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 8252133)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 8252700)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2672 (class 2606 OID 8252685)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2671 (class 2606 OID 8252690)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2667 (class 2606 OID 8252710)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8252680)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2668 (class 2606 OID 8252705)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2670 (class 2606 OID 8252695)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2703 (class 2606 OID 8252855)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8252860)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 8252615)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2690 (class 2606 OID 8252795)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8252790)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2689 (class 2606 OID 8252785)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2666 (class 2606 OID 8252675)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 8252825)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 8252835)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2697 (class 2606 OID 8252830)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2660 (class 2606 OID 8252650)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8252645)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 8252775)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 8252880)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 8252885)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 8252890)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 8252910)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2714 (class 2606 OID 8252895)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2710 (class 2606 OID 8252915)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2712 (class 2606 OID 8252905)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2713 (class 2606 OID 8252900)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2658 (class 2606 OID 8252640)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8252635)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2650 (class 2606 OID 8252600)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2651 (class 2606 OID 8252595)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 8252805)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2674 (class 2606 OID 8252715)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 8252575)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 8252580)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 8252820)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2694 (class 2606 OID 8252815)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2695 (class 2606 OID 8252810)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2664 (class 2606 OID 8252655)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 8252665)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2663 (class 2606 OID 8252660)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2727 (class 2606 OID 8252980)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2678 (class 2606 OID 8252750)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2680 (class 2606 OID 8252740)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2681 (class 2606 OID 8252735)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2679 (class 2606 OID 8252745)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2645 (class 2606 OID 8252565)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2644 (class 2606 OID 8252570)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2691 (class 2606 OID 8252800)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2687 (class 2606 OID 8252780)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 8252845)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2700 (class 2606 OID 8252850)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8252965)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 8252950)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 8252955)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 8252960)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 8252625)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 8252620)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 8252630)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2705 (class 2606 OID 8252865)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2704 (class 2606 OID 8252870)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8252940)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2717 (class 2606 OID 8252945)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2720 (class 2606 OID 8252930)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2719 (class 2606 OID 8252935)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2699 (class 2606 OID 8252840)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8252770)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2683 (class 2606 OID 8252765)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2685 (class 2606 OID 8252755)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2684 (class 2606 OID 8252760)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2715 (class 2606 OID 8252925)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 8252920)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2725 (class 2606 OID 8252970)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 8252670)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 8252875)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 8252975)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2648 (class 2606 OID 8252590)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2649 (class 2606 OID 8252585)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2653 (class 2606 OID 8252605)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 8252610)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 8252730)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 8252725)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2677 (class 2606 OID 8252720)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-26 14:01:35 CEST

--
-- PostgreSQL database dump complete
--

